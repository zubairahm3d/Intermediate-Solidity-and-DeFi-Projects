// ### 3. Create a Mintable and Burnable Token
// - **Description**: Extend an ERC20 token with minting and burning functions.
// - **Key Concepts**: Minting, burning, supply management.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract ERC20{

    string public name;
    string public symbol;
    uint256 public totalSupply;
    uint8 public immutable decimals;
    mapping(address=>uint256) private _balances;

    address owner;

    modifier onlyOwner{
        require(owner==msg.sender,"You are not the owner");
        _;
    }

    constructor(string memory _name, string memory _symbol, uint256 _totalSupply){
        owner= msg.sender;

        name = _name;
        symbol = _symbol;
        // totalSupply = _totalSupply;

        mint(_totalSupply);
        
    }

    function mint(uint256 _amount) public onlyOwner{
        _balances[owner]+=_amount;
        totalSupply+=_amount;
    }

    function burn(uint256 _amount) public onlyOwner{
        _balances[owner] -=_amount;
        totalSupply-=_amount;
    }

    function balanceOf(address _owner) public view returns(uint256){
        return _balances[_owner];
    }

    function transfer(address _to, uint256 _amount) public returns (bool success){
        require(_balances[msg.sender] >= _amount,"Not enough tokens");

        _balances[msg.sender] -=_amount;
        _balances[_to] += _amount;

        return true;
    }

}
