// function name() public view returns (string)
// function symbol() public view returns (string)
// function decimals() public view returns (uint8)
// function totalSupply() public view returns (uint256)
// function balanceOf(address _owner) public view returns (uint256 balance)
// function transfer(address _to, uint256 _value) public returns (bool success)
// function transferFrom(address _from, address _to, uint256 _value) public returns (bool success)
// function approve(address _spender, uint256 _value) public returns (bool success)
// function allowance(address _owner, address _spender) public view returns (uint256 remaining)



// event Transfer(address indexed _from, address indexed _to, uint256 _value)
// event Approval(address indexed _owner, address indexed _spender, uint256 _value)



// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract ERC20 {

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    string public name;
    string public symbol;
    uint8 public immutable decimals;
    uint256 public immutable totalSupply;
    mapping(address=>uint256) public balances;
    mapping(address=>mapping(address=>uint256)) public _allowances;
    constructor(string memory _name, string memory _symbol,uint256 _totalSupply){
        name=_name;
        symbol=_symbol;
        decimals=18;
        totalSupply=_totalSupply;
        balances[msg.sender]=_totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

 
    function balanceOf(address _owner) public view returns (uint256 balance){
        require(_owner!=address(0),"invalid address");
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success){
        require(_to != address(0), "Invalid address");
        require(balances[msg.sender]>=_value,"Not sufficient amount");
        balances[msg.sender]-=_value;
        balances[_to]+=_value;

        emit Transfer(msg.sender,_to,_value);
        return true;
    }

     
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_from != address(0) && _to != address(0), "Invalid address");
        require(balances[_from] >= _value, "Not enough balance");
        require(_allowances[_from][msg.sender] >= _value, "Not enough allowance");

        balances[_from] -= _value;
        balances[_to] += _value;
        _allowances[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);
        return true;
    }   



    
    function approve(address _spender, uint256 _value) public returns (bool success){
        // require(balances[msg.sender]>=_value,"Balance not enough");
        _allowances[msg.sender][_spender]=_value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }


    function allowance(address _owner, address _spender) public view returns (uint256 remaining){
        return _allowances[_owner][_spender];
    }

}