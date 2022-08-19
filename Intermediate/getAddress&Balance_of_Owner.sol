// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract MyContract {
    address private owner;

    constructor() public {
        owner = msg.sender;
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    function getBalance() public view returns (uint256) {
        return owner.balance;
    }
}
