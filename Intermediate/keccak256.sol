// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract hashKeccak {

    uint hashDigits = 8;
    uint hashModulus = 10 ** hashDigits;

    function _generateRandom(string memory _str) public view returns(uint) {
        
        uint random = uint(keccak256(abi.encodePacked(_str)));

        return random % hashModulus;
    }

}

