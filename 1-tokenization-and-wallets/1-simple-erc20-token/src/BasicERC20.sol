// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract BasicERC20 {
    string public name;
    string public symbol;
    uint8 public immutable decimals;
    uint256 public immutable totalSupply;
    mapping(address=>uint256) private _balances;
    // mapping(address=>mapping(address=>uint256)) public _allowances;
    constructor(string memory _name, string memory _symbol, uint256 _totalSupply){
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
        decimals = 18;

        // minting tokens to the user.
        _balances[msg.sender] = totalSupply;
    }

    function balanceOf(address _owner) public view returns(uint256){
        return _balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns(bool success){
        require(_balances[msg.sender]>=_value,"Not enough tokens");
        _balances[msg.sender]-=_value;
        _balances[_to]+=_value;
        return true;
    }
}