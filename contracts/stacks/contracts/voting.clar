;; NameClaim - Username Registry (Clarity v4)

(define-map name-to-owner
    (string-ascii 64)
    principal
)

(define-map owner-to-name
    principal
    (string-ascii 64)
)

(define-constant ERR-NAME-TAKEN (err u100))
(define-constant ERR-ALREADY-HAS-NAME (err u101))
(define-constant ERR-NOT-OWNED (err u102))

(define-public (claim-name (name (string-ascii 64)))
    (begin
        (asserts! (is-none (map-get? name-to-owner name)) ERR-NAME-TAKEN)
        (asserts! (is-none (map-get? owner-to-name tx-sender)) ERR-ALREADY-HAS-NAME)
        
        (map-set name-to-owner name tx-sender)
        (map-set owner-to-name tx-sender name)
        (ok true)
    )
)

(define-public (release-name)
    (let
        (
            (current-name (unwrap! (map-get? owner-to-name tx-sender) ERR-NOT-OWNED))
        )
        (map-delete name-to-owner current-name)
        (map-delete owner-to-name tx-sender)
        (ok true)
    )
)

(define-read-only (is-available (name (string-ascii 64)))
    (ok (is-none (map-get? name-to-owner name)))
)

(define-read-only (get-owner (name (string-ascii 64)))
    (ok (map-get? name-to-owner name))
)
