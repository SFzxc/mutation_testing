// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Ownable } from "openzeppelin-contracts/contracts/access/Ownable.sol";
import "forge-std/console.sol";

contract Ticketer is Ownable {

    error InvalidValue();
    error NativeTransferFailed();

    uint256 public constant price = 1 ether;
    mapping(address => uint256) public ticketBalances;

    constructor() Ownable(msg.sender) {}

    function buyTicket(uint256 amount) external payable {
        // console.logUint(amount);
        if (amount == 0)  revert InvalidValue();
        if (amount * price != msg.value) revert NativeTransferFailed();
        ticketBalances[msg.sender] += amount;
    }
}
