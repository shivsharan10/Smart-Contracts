// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.16;

contract construct {
    string name;

    constructor() public {
        name = "Harvey Specter";
    }

    function getValue() public view returns(string memory) {
        return name;
    }
}
