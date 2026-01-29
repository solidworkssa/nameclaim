# 05-nameclaim - Base Native Architecture

> **Built for the Base Superchain & Stacks Bitcoin L2**

This project is architected to be **Base-native**: prioritizing onchain identity, low-latency interactions, and indexer-friendly data structures.

## 🔵 Base Native Features
- **Smart Account Ready**: Compatible with ERC-4337 patterns.
- **Identity Integrated**: Designed to resolve Basenames and store social metadata.
- **Gas Optimized**: Uses custom errors and batched call patterns for L2 efficiency.
- **Indexer Friendly**: Emits rich, indexed events for Subgraph data availability.

## 🟠 Stacks Integration
- **Bitcoin Security**: Leverages Proof-of-Transfer (PoX) via Clarity contracts.
- **Post-Condition Security**: Strict asset movement checks.

---
# NameClaim

Username registry with first-come-first-serve claiming on Base and Stacks.

## Features

- Claim unique usernames
- Release names
- Check availability
- Reverse lookup (address to name)

## Contract Functions

### Base (Solidity)
- `claimName(name)` - Claim username
- `releaseName()` - Release current name
- `isAvailable(name)` - Check availability
- `getOwner(name)` - Get name owner

### Stacks (Clarity)
- `claim-name` - Claim username
- `release-name` - Release name
- `is-available` - Check if name is free
- `get-owner` - Get name owner

## Quick Start

```bash
pnpm install
pnpm dev
```

## Deploy

```bash
pnpm deploy:base
pnpm deploy:stacks
```

## License

MIT
