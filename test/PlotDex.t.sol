// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/PlotDex.sol";

contract PlotDexTokenTest is Test {
    PlotDexToken token;

    address owner = address(0x1);
    address user = address(0x2);

    uint256 constant SUPPLY = 100000 * 1e18;

    function setUp() public {
        vm.prank(owner);
        token = new PlotDexToken();
    }

    // basic info
    function testTokenInfo() public {
        assertEq(token.name(), "PlotDex Token");
        assertEq(token.decimals(), 18);
    }

    // supply & balance
    function testInitialSupply() public {
        assertEq(token.totalSupply(), SUPPLY);
        assertEq(token.balanceOf(owner), SUPPLY);
    }

    // transfer
    function testTransfer() public {
        vm.prank(owner);
        token.transfer(user, 1000 * 1e18);

        assertEq(token.balanceOf(user), 1000 * 1e18);
    }

    // approve + transferFrom
    function testApproveAndTransferFrom() public {
        vm.prank(owner);
        token.approve(user, 500 * 1e18);

        vm.prank(user);
        token.transferFrom(owner, user, 200 * 1e18);

        assertEq(token.balanceOf(user), 200 * 1e18);
    }
}
