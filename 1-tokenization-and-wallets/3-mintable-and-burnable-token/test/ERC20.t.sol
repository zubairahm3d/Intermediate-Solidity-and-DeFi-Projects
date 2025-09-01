// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Test, console} from "forge-std/Test.sol";
import {ERC20} from "../src/ERC20.sol";

contract ERC20Test is Test {
    ERC20 public erc20;
    string public name = "Zee Token";
    string public symbol = "ZT";
    // uint8 public immutable decimals;
    uint256 public immutable totalSupply = 100000;

    function setUp() public {
        erc20 = new ERC20(name,symbol,totalSupply);
    }

    function test_tokenInfo() public view{
        string memory actualName = erc20.name();
        string memory  actualSymbol = erc20.symbol();
        uint256 actualTotalSupply = erc20.totalSupply();

        assertEq(name,actualName);
        assertEq(symbol,actualSymbol);
        assertEq(totalSupply,actualTotalSupply);
    }

    function test_transfer() public {
        address alice = makeAddr("alice");

        uint256 currentBalance = erc20.balanceOf(address(this));
        assertEq(currentBalance,totalSupply);


        // erc20.addToWhitelist(alice);
        erc20.transfer(alice,1000);
        currentBalance = erc20.balanceOf(address(this));
        uint256 aliceBalance = erc20.balanceOf(alice);
        assertEq(currentBalance,99000);
        assertEq(aliceBalance,1000);

    }

    function test_mint() public{
        uint256 actualTokens = erc20.balanceOf(address(this));
        assertEq(actualTokens,totalSupply);


        // minting
        uint256 newMintedTokens = 5000;
        erc20.mint(newMintedTokens);
        uint256 newTotalSupply = totalSupply+newMintedTokens;
        
        uint256 actualUpdatedSupply = erc20.totalSupply();
        assertEq(actualUpdatedSupply,newTotalSupply);
        
    }

    function test_burn() public{
        uint256 actualTokens = erc20.balanceOf(address(this));
        assertEq(actualTokens,totalSupply);


        // minting
        uint256 tokensToBurn = 5000;
        erc20.burn(tokensToBurn);
        uint256 newTotalSupply = totalSupply - tokensToBurn;
        
        uint256 actualUpdatedSupply = erc20.totalSupply();
        assertEq(actualUpdatedSupply,newTotalSupply);

    }
}
