// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

contract Prime {

    function isPrime(int num) public returns (string memory) {
        if(num==1) return "Not Prime";
        for(int i=0; i<num; i++) {
            if(num % i == 0)
                return "Not Prime";
        }
        return "Is Prime";
    }
}
