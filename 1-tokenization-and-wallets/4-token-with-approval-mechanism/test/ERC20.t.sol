// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ERC20} from "../src/ERC20.sol";

contract ERC20Test is Test{
    ERC20 public erc20;
    string private name="Zee Token";
    string private symbol="ZT";
    uint256 private totalSupply=10000;
    
    function setUp() public{
    // constructor(string memory _name, string memory _symbol,uint256 _totalSupply){
        erc20 = new ERC20(name,symbol,totalSupply);
    }
    
    function test_tokenInfo() public view{
        string memory actualName = erc20.name();
        string memory actualSymbol = erc20.symbol();
        uint256 actualTotalSupply = erc20.totalSupply();
        assertEq(name, actualName);
        assertEq(symbol,actualSymbol);
        assertEq(totalSupply, actualTotalSupply);
    }

    function test_balances() public view{
        uint256 balance = erc20.balanceOf(address(this));
        assertEq(totalSupply,balance);
    }

    function test_transfer() public{
        address alice = makeAddr("Alice");
        address bob = makeAddr("Bob");

        uint256 myBalance = erc20.balanceOf(address(this));
        uint256 aliceBalance = erc20.balanceOf(alice);
        uint256 bobBalance = erc20.balanceOf(bob);
        assertEq(totalSupply,myBalance);
        assertEq(aliceBalance,0);
        assertEq(bobBalance,0);

        // Now lets transfer tokens to alice
        erc20.transfer(alice, 500);
        uint256 aliceUpdatedBalance = erc20.balanceOf(alice);
        assertEq(aliceUpdatedBalance,500);

        vm.prank(alice);
        erc20.transfer(bob,50);
        uint256 bobUpdatedBalance = erc20.balanceOf(bob);
        aliceUpdatedBalance = erc20.balanceOf(alice);
        assertEq(bobUpdatedBalance,50);
        assertEq(aliceUpdatedBalance,450);

    }

}
