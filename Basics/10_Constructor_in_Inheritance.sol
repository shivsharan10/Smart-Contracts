// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Base {
    uint data;

    constructor(uint num) public {
        data = num;
    }

    function Print() public pure returns(string memory) {
        return "Direct Initialization";
    }
}

contract Derived is Base(2) {

    constructor() public {
        
    }

    function getData() external returns(uint) {
        uint result = data ** 2;
        return result;
    }
}

contract caller {

    Derived c = new Derived();

    function getResult() public returns(uint) {
        c.Print();
        return c.getData();
    }
}
