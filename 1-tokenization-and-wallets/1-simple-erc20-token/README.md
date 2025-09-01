# Simple ERC20 Token

## Project Overview

This project implements a basic ERC20 token contract following the fundamental ERC20 standard. The `BasicERC20` contract provides essential token functionality including token metadata, balance tracking, and simple transfer capabilities.

## Features

- **Token Metadata**: Configurable name, symbol, and fixed 18 decimals
- **Fixed Supply**: Total supply is set at deployment and cannot be changed
- **Balance Tracking**: Maintains individual token balances for all addresses
- **Basic Transfers**: Allows token holders to transfer tokens to other addresses
- **Balance Queries**: View function to check token balance of any address

## Contract Details

- **Contract Name**: `BasicERC20`
- **Solidity Version**: ^0.8.30
- **License**: MIT

### Constructor Parameters
- `_name`: The name of the token (e.g., "My Token")
- `_symbol`: The symbol of the token (e.g., "MTK")
- `_totalSupply`: The total supply of tokens to mint to the deployer

### Key Functions
- `balanceOf(address _owner)`: Returns the token balance of a specific address
- `transfer(address _to, uint256 _value)`: Transfers tokens from sender to recipient

## Test Coverage

The contract has comprehensive test coverage ensuring reliability and correctness:

| Metric | Coverage |
|--------|----------|
| **Lines** | 100.00% (13/13) |
| **Statements** | 100.00% (10/10) |
| **Branches** | 50.00% (1/2) |
| **Functions** | 100.00% (3/3) |

### Test Cases
- ✅ Token metadata verification (name, symbol, total supply)
- ✅ Balance checking functionality
- ✅ Token transfer functionality
- ✅ Balance updates after transfers

## Usage with Foundry

### Build
```shell
forge build
```

### Test
```shell
forge test
```

### Test Coverage
```shell
forge coverage
```

### Format
```shell
forge fmt
```

### Gas Snapshots
```shell
forge snapshot
```

### Deploy
```shell
forge script script/BasicERC20.s.sol:BasicERC20Script --rpc-url <your_rpc_url> --private-key <your_private_key>
```

## Documentation

For more information about Foundry:
https://book.getfoundry.sh/

## Security Considerations

⚠️ **Note**: This is a basic implementation for educational purposes. For production use, consider:
- Adding events for transfer operations
- Implementing proper access controls
- Adding additional security checks
- Following the complete ERC20 standard with approval mechanisms