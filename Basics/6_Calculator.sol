// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

contract Calci {

    function add(int a, int b) public pure returns (int) {
        return (a+b);
    }

    function sub(int a, int b) public pure returns (int) {
        return (a-b);
    }

    function mul(int a, int b) public pure returns (int) {
        return (a*b);
    }

    function div(int a, int b) public pure returns (int) {
        return (a/b);
    }

    function mod(int a, int b) public pure returns (int) {
        return (a%b);
    }
}
