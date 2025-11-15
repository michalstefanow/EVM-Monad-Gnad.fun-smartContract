.PHONY: help install build test test-verbose test-gas clean fmt fmt-check snapshot coverage anvil deploy

# Default target
help:
	@echo "Available targets:"
	@echo "  install      - Install dependencies"
	@echo "  build        - Build the project"
	@echo "  test         - Run tests"
	@echo "  test-verbose - Run tests with verbose output"
	@echo "  test-gas     - Run tests with gas reporting"
	@echo "  clean        - Clean build artifacts"
	@echo "  fmt          - Format code"
	@echo "  fmt-check    - Check code formatting"
	@echo "  snapshot     - Update test snapshots"
	@echo "  coverage     - Generate coverage report"
	@echo "  anvil        - Start local Anvil node"
	@echo "  deploy       - Deploy contracts (requires .env)"

# Install dependencies
install:
	forge install

# Build the project
build:
	forge build

# Run tests
test:
	forge test

# Run tests with verbose output
test-verbose:
	forge test -vvv

# Run tests with gas reporting
test-gas:
	forge test --gas-report

# Clean build artifacts
clean:
	forge clean

# Format code
fmt:
	forge fmt

# Check code formatting
fmt-check:
	forge fmt --check

# Update test snapshots
snapshot:
	forge snapshot

# Generate coverage report
coverage:
	forge coverage --report lcov && genhtml lcov.info -o coverage/

# Start local Anvil node
anvil:
	anvil

# Deploy contracts (example - customize as needed)
deploy:
	forge script scripts/Deploy.s.sol:DeployScript --rpc-url $(RPC_URL) --broadcast --verify -vvvv

