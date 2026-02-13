// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/Test.sol";
import "../src/NameClaim.sol";

contract NameClaimTest is Test {
    NameClaim public c;
    
    function setUp() public {
        c = new NameClaim();
    }

    function testDeployment() public {
        assertTrue(address(c) != address(0));
    }
}
