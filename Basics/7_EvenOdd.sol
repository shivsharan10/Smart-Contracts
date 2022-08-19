// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

contract EvenOdd {

    function check(int num) public pure returns (string memory) {
        if(num%2==0)
            return "EVEN";
        return "ODD";

    }
}
