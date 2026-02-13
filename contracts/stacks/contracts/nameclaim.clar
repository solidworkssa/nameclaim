;; NameClaim Clarity Contract
;; Decentralized name registration and resolution.


(define-map names
    (string-ascii 64)
    {
        owner: principal,
        data: (string-utf8 256),
        expiration: uint
    }
)
(define-constant registration-fee u1000000) ;; 1 STX
(define-constant duration u10000) ;; ~blocks

(define-public (register (name (string-ascii 64)))
    (let
        (
            (record (map-get? names name))
        )
        (asserts! (or (is-none record) (< (get expiration (unwrap! record (err u500))) block-height)) (err u100))
        (try! (stx-transfer? registration-fee tx-sender (as-contract tx-sender)))
        (map-set names name {
            owner: tx-sender,
            data: u"",
            expiration: (+ block-height duration)
        })
        (ok true)
    )
)

