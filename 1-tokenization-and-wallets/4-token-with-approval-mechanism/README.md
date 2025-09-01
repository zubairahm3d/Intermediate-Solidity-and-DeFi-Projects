# Token with Approval Mechanism

## Project Overview

This project implements a complete ERC20 token contract with approval and allowance functionality. The `ERC20` contract follows the full ERC20 standard, enabling third-party spending approvals and delegated transfers through the `approve` and `transferFrom` mechanisms.

## Features

- **Token Metadata**: Configurable name, symbol, and fixed 18 decimals
- **Fixed Supply**: Total supply is set at deployment and cannot be changed
- **Balance Tracking**: Maintains individual token balances for all addresses
- **Direct Transfers**: Token holders can transfer tokens directly to other addresses
- **Approval System**: Token holders can approve others to spend tokens on their behalf
- **Delegated Transfers**: Approved spenders can transfer tokens from the owner's account
- **Allowance Queries**: Check remaining allowance between owner and spender
- **Events**: Emits Transfer and Approval events for transparency

## Contract Details

- **Contract Name**: `ERC20`
- **Solidity Version**: ^0.8.30
- **License**: MIT

### Constructor Parameters
- `_name`: The name of the token (e.g., "Approval Token")
- `_symbol`: The symbol of the token (e.g., "APT")
- `_totalSupply`: The total supply of tokens to mint to the deployer

### Key Functions
- `balanceOf(address _owner)`: Returns the token balance of a specific address
- `transfer(address _to, uint256 _value)`: Transfers tokens from sender to recipient
- `approve(address _spender, uint256 _value)`: Approves spender to transfer up to specified amount
- `transferFrom(address _from, address _to, uint256 _value)`: Transfers tokens on behalf of owner
- `allowance(address _owner, address _spender)`: Returns remaining allowance

### Events
- `Transfer(address indexed _from, address indexed _to, uint256 _value)`
- `Approval(address indexed _owner, address indexed _spender, uint256 _value)`

## Test Coverage

| Metric | Coverage |
|--------|----------|
| **Lines** | 53.12% (17/32) |
| **Statements** | 53.85% (14/26) |
| **Branches** | 25.00% (3/12) |
| **Functions** | 50.00% (3/6) |

### Test Cases
- ✅ Token metadata verification (name, symbol, total supply)
- ✅ Balance checking functionality
- ✅ Direct transfer functionality
- ⚠️ Approval mechanism (not tested)
- ⚠️ TransferFrom functionality (not tested)
- ⚠️ Allowance queries (not tested)

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
ERC20 token = new ERC20("Approval Token", "APT", 1000000);

// Direct transfer
token.transfer(0x123..., 1000);

// Approve another address to spend tokens
token.approve(0x456..., 5000);

// Check allowance
uint256 allowance = token.allowance(address(this), 0x456...); // Returns 5000

// Approved address can transfer on behalf of owner
// (This would be called by 0x456...)
token.transferFrom(address(this), 0x789..., 2000);

// Check remaining allowance
allowance = token.allowance(address(this), 0x456...); // Returns 3000
```

## Documentation

For more information about Foundry:
https://book.getfoundry.sh/