# Mintable and Burnable Token

## Project Overview

This project implements an advanced ERC20 token contract with minting and burning capabilities. The `ERC20` contract extends basic token functionality by allowing the contract owner to dynamically adjust the token supply through controlled minting and burning operations, providing flexible supply management for various use cases.

## Features

- **Token Metadata**: Configurable name, symbol, and fixed 18 decimals
- **Dynamic Supply**: Total supply can be increased through minting or decreased through burning
- **Balance Tracking**: Maintains individual token balances for all addresses
- **Basic Transfers**: Allows token holders to transfer tokens to other addresses
- **Minting Capability**: Owner can create new tokens and add them to circulation
- **Burning Capability**: Owner can destroy tokens and reduce total supply
- **Access Control**: Only contract owner can mint and burn tokens
- **Balance Queries**: View function to check token balance of any address

## Contract Details

- **Contract Name**: `ERC20`
- **Solidity Version**: ^0.8.30
- **License**: MIT

### Constructor Parameters
- `_name`: The name of the token (e.g., "Mintable Token")
- `_symbol`: The symbol of the token (e.g., "MINT")
- `_totalSupply`: The initial supply of tokens to mint to the deployer

### Key Functions
- `balanceOf(address _owner)`: Returns the token balance of a specific address
- `transfer(address _to, uint256 _amount)`: Transfers tokens from sender to recipient
- `mint(uint256 _amount)`: Creates new tokens and adds them to owner's balance (owner only)
- `burn(uint256 _amount)`: Destroys tokens from owner's balance and reduces total supply (owner only)

### Access Control
- **Owner**: The deployer of the contract who has exclusive rights to mint and burn tokens
- **onlyOwner Modifier**: Ensures only the owner can execute supply management functions

## Supply Management

### Minting Process
1. Owner calls `mint(_amount)` function
2. New tokens are added to the owner's balance
3. Total supply is increased by the minted amount
4. No maximum supply limit enforced

### Burning Process
1. Owner calls `burn(_amount)` function
2. Tokens are removed from the owner's balance
3. Total supply is decreased by the burned amount
4. Requires sufficient balance to burn

## Test Coverage

The contract has comprehensive test coverage ensuring reliability and correctness:

| Metric | Coverage |
|--------|----------|
| **Lines** | 100.00% (20/20) |
| **Statements** | 100.00% (14/14) |
| **Branches** | 50.00% (2/4) |
| **Functions** | 100.00% (6/6) |

### Test Cases
- ✅ Token metadata verification (name, symbol, total supply)
- ✅ Balance checking functionality
- ✅ Token transfer functionality
- ✅ Minting functionality and supply updates
- ✅ Burning functionality and supply reduction
- ✅ Balance updates after all operations

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
// Deploy the contract with initial supply
ERC20 token = new ERC20("Mintable Token", "MINT", 1000000);

// Check initial supply
uint256 initialSupply = token.totalSupply(); // 1,000,000

// Mint additional tokens (only owner)
token.mint(500000); // Adds 500,000 tokens
uint256 newSupply = token.totalSupply(); // 1,500,000

// Burn tokens (only owner)
token.burn(200000); // Removes 200,000 tokens
uint256 finalSupply = token.totalSupply(); // 1,300,000

// Transfer tokens to other addresses
token.transfer(0x123..., 10000);

// Check balances
uint256 ownerBalance = token.balanceOf(address(this));
uint256 recipientBalance = token.balanceOf(0x123...);
```

## Documentation

For more information about Foundry:
https://book.getfoundry.sh/

## Security Considerations

⚠️ **Important Notes**: This implementation provides basic minting and burning functionality. For production use, consider:

### Current Limitations
- No maximum supply cap enforcement
- Only owner can mint/burn (centralized control)
- No burn safety checks beyond balance verification
- Missing events for mint/burn operations

### Recommended Enhancements
- **Events**: Add Transfer, Mint, and Burn events for transparency
- **Supply Caps**: Implement maximum supply limits to prevent infinite inflation
- **Multi-signature**: Use multi-sig wallets for owner operations
- **Role-based Access**: Implement more granular permissions (minter, burner roles)
- **Pausable**: Add emergency pause functionality
- **Burn from Any Address**: Allow token holders to burn their own tokens
- **Time Locks**: Add delays for critical operations
- **Governance**: Consider decentralized governance for supply decisions

### Use Cases
- **Token Sales**: Mint tokens for different funding rounds
- **Rewards Programs**: Mint tokens as rewards, burn for redemption
- **Deflationary Mechanisms**: Burn tokens to reduce supply
- **Supply Adjustments**: React to market conditions or protocol needs