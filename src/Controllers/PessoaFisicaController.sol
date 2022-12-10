// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {PessoaFisicaRouter} from "../Routers/PessoaFisicaRouter.sol";

contract PessoaFisicaController {
    address public owner; //should be a multisig
    PessoaFisicaRouter public router;

    constructor() {
        owner = msg.sender;
    }

    function deployRouter() public onlyOwner returns (address) {
        router = new PessoaFisicaRouter();
        return address(router);
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}
