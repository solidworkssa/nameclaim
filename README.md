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
