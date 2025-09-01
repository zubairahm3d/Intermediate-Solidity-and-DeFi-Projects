# Token with Transfer Restrictions

## Project Overview

This project implements an ERC20 token with transfer restrictions using a whitelist mechanism. The `ERC20` contract extends basic token functionality by adding access control features that restrict token transfers to only whitelisted addresses, providing enhanced security and compliance capabilities.

## Features

- **Token Metadata**: Configurable name, symbol, and fixed 18 decimals
- **Fixed Supply**: Total supply is set at deployment and cannot be changed
- **Balance Tracking**: Maintains individual token balances for all addresses
- **Restricted Transfers**: Only allows transfers to whitelisted addresses
- **Whitelist Management**: Owner can add/remove addresses from the whitelist
- **Access Control**: Only contract owner can manage the whitelist
- **Balance Queries**: View function to check token balance of any address

## Contract Details

- **Contract Name**: `ERC20`
- **Solidity Version**: ^0.8.13
- **License**: MIT

### Constructor Parameters
- `_name`: The name of the token (e.g., "Restricted Token")
- `_symbol`: The symbol of the token (e.g., "RTK")
- `_totalSupply`: The total supply of tokens to mint to the deployer

### Key Functions
- `balanceOf(address _owner)`: Returns the token balance of a specific address
- `transfer(address _to, uint256 _value)`: Transfers tokens to whitelisted addresses only
- `addToWhitelist(address account)`: Adds an address to the whitelist (owner only)
- `removeFromWhitelist(address account)`: Removes an address from the whitelist (owner only)
- `isWhitelisted(address account)`: Checks if an address is whitelisted

### Access Control
- **Owner**: The deployer of the contract who has exclusive rights to manage the whitelist
- **onlyOwner Modifier**: Ensures only the owner can execute whitelist management functions

## Test Coverage

The contract has comprehensive test coverage ensuring reliability and correctness:

| Metric | Coverage |
|--------|----------|
| **Lines** | 100.00% (23/23) |
| **Statements** | 100.00% (16/16) |
| **Branches** | 50.00% (3/6) |
| **Functions** | 100.00% (7/7) |

### Test Cases
- ✅ Token metadata verification (name, symbol, total supply)
- ✅ Balance checking functionality
- ✅ Whitelist management (add/remove addresses)
- ✅ Restricted transfer functionality
- ✅ Whitelist verification functionality
- ✅ Balance updates after successful transfers

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
forge script script/ERC20.s.sol:ERC20Script --rpc-url <your_rpc_url> --private-key <your_private_key>
```

## Example Usage

```solidity
// Deploy the contract
ERC20 token = new ERC20("Restricted Token", "RTK", 1000000);

// Add addresses to whitelist (only owner)
token.addToWhitelist(0x123...);
token.addToWhitelist(0x456...);

// Check if address is whitelisted
bool isWhitelisted = token.isWhitelisted(0x123...);

// Transfer tokens (only to whitelisted addresses)
token.transfer(0x123..., 1000); // Will succeed if 0x123... is whitelisted

// Remove from whitelist (only owner)
token.removeFromWhitelist(0x123...);
```

## Documentation

For more information about Foundry:
https://book.getfoundry.sh/

## Security Considerations

⚠️ **Note**: This implementation includes basic transfer restrictions. For production use, consider:
- Adding events for transfer and whitelist operations
- Implementing time-based restrictions
- Adding multi-signature requirements for whitelist changes
- Consider upgradeability patterns for evolving requirements
- Implementing emergency pause functionality
- Adding more granular permission levels