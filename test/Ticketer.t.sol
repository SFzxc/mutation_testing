// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
// import { DSTest } from "ds-test/src/test.sol";
import "../src/Ticketer.sol";

contract TicketerTest is Test {
    Ticketer public ticketer;

    address constant alice = address(1);
    address constant bob = address(2);
    address constant owner = address(33);

    function setUp() public {
        vm.prank(owner);
        ticketer = new Ticketer();
    }

    function test_BuyTicket() public {
        vm.deal(alice, 2 ether);
        vm.prank(alice);
        ticketer.buyTicket{value: 1 ether}(1);

        assertEq(ticketer.ticketBalances(alice), 1);
        // assertEq(ticketer.ticketBalances(bob), 0);
    }
}
