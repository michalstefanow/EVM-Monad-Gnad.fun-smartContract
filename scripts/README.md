# Deployment Scripts

This directory contains Foundry scripts for deploying and interacting with contracts.

## Available Scripts

### Deploy.s.sol

Main deployment script that deploys all contracts in the correct order:

1. WMon (Wrapped Monad token)
2. FeeVault (multisig fee vault)
3. BondingCurveFactory
4. GNad (main contract)
5. Initializes and configures contracts

## Usage

### Prerequisites

1. Create a `.env` file based on `.env.example`
2. Set your `PRIVATE_KEY` and `RPC_URL` in `.env`

### Deploy to Local Network

```bash
# Start local Anvil node
anvil

# In another terminal, deploy
forge script scripts/Deploy.s.sol:DeployScript --rpc-url http://localhost:8545 --broadcast -vvvv
```

### Deploy to Testnet/Mainnet

```bash
# Load environment variables and deploy
source .env
forge script scripts/Deploy.s.sol:DeployScript \
  --rpc-url $RPC_URL \
  --broadcast \
  --verify \
  --etherscan-api-key $ETHERSCAN_API_KEY \
  -vvvv
```

### Using Makefile

```bash
make deploy RPC_URL=<your_rpc_url>
```

## Script Structure

Scripts follow Foundry's Script pattern:

```solidity
contract DeployScript is Script {
    function run() external {
        // Deployment logic
    }
}
```

## Environment Variables

Required environment variables:

- `PRIVATE_KEY` - Private key for deployment (without 0x prefix)
- `RPC_URL` - RPC endpoint URL
- `ETHERSCAN_API_KEY` - (Optional) For contract verification

## Security Notes

⚠️ **Never commit your `.env` file or private keys to version control!**

The `.env` file is already in `.gitignore` for your safety.

