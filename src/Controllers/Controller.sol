// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Controller {
    address public owner; //should be a multisig

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}
