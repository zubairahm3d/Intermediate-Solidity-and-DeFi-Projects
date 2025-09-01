// ### 2. Implement a Token with Transfer Restrictions
// - **Description**: Add restrictions (e.g., whitelist, time locks) to an ERC20 token’s transfers.
// - **Key Concepts**: Transfer restrictions, access control.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ERC20 {
    string public name;
    string public symbol;
    uint8 public immutable decimals;
    uint256 public immutable totalSupply;
    mapping(address=>uint256) private _balances;

    address private owner;

    mapping(address=>bool) private whitelistAddresses;

    modifier onlyOwner{
        require(owner == msg.sender,"You're not the owner");
        _;
    }

    constructor(string memory _name,string memory _symbol, uint256 _totalSupply){
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
        decimals = 18;
        
        _balances[msg.sender] = totalSupply;

        owner = msg.sender;
    }

    function balanceOf(address _owner) public view returns(uint256){
        return _balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success){
        require(isWhitelisted(_to),"Transfer not approved");
        require(_balances[msg.sender] >= _value, "Not Enough tokens");

        _balances[msg.sender] -= _value;
        _balances[_to] += _value;

        return true;
    }

    function addToWhitelist(address account) public onlyOwner {
        whitelistAddresses[account] = true;
    }
    
    function removeFromWhitelist(address account) public onlyOwner{
        whitelistAddresses[account] = false;
    }

    function isWhitelisted(address account) public view returns(bool){
        return whitelistAddresses[account];
    }





}
