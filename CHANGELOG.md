# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Enhanced `foundry.toml` with CI profile and optimizer settings
- Created `Makefile` for common development tasks
- Added deployment scripts in `scripts/` directory
- Created GitHub Actions CI workflow
- Added `LICENSE` file (MIT)
- Improved `.gitignore` with comprehensive patterns

### Changed
- **Major restructuring**: Reorganized project from `src/` to `contracts/` with feature-based organization
  - `contracts/core/` - Core business logic contracts
  - `contracts/tokens/` - Token implementations
  - `contracts/factories/` - Factory contracts
  - `contracts/vaults/` - Vault contracts
  - `contracts/types/` - Interface definitions (renamed from `interfaces/`)
  - `contracts/utils/` - Utility libraries (renamed from `lib/`)
  - `contracts/errors/` - Error definitions
- Renamed `test/` to `tests/` for consistency
- Renamed `script/` to `scripts/` for consistency
- Updated all imports to reflect new structure
- Updated all documentation to match new organization

## [0.1.0] - Initial Release

### Added
- Core bonding curve implementation (`BondingCurve.sol`)
- Factory contract for creating bonding curves (`BondingCurveFactory.sol`)
- Main GNad contract for managing operations (`GNad.sol`)
- Wrapped Monad token (`WMon.sol`)
- Fee vault with multisig support (`FeeVault.sol`)
- ERC20 token implementation (`Token.sol`)
- Comprehensive test suite
- Documentation (README, SUPPORT guides)

[Unreleased]: https://github.com/your-org/Gnad.fun-SmartContract/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/your-org/Gnad.fun-SmartContract/releases/tag/v0.1.0

