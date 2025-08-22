// ### 1. Create a Contract with Multiple Constructors Using Inheritance
// - **Description**: Build a base and derived contract with distinct constructors to initialize state variables differently.
// - **Key Concepts**: Inheritance, constructor chaining, `super` keyword.



// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract BaseContract{
    string private baseName;
    constructor(string memory name){
        baseName=name;
    }
    function getBaseName() public view virtual returns(string memory){  
        return baseName;
    }
}

contract DerivedContract is BaseContract{

    constructor() BaseContract("Zubair Ahmed"){
        
    }
    function getBaseName() public view override returns(string memory){
        return super.getBaseName();
    }
}