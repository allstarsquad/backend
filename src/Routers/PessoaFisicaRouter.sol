// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {PessoaFisica} from "../Pessoas/PessoaFisica.sol";
import {PessoaFisicaController} from "../Controllers/PessoaFisicaController.sol";

contract PessoaFisicaRouter {
    PessoaFisica pf;
    uint256 public currentCounter;
    address public controller;

    constructor() {
        controller = msg.sender;
    }

    function setPessoaFisicaMint(address _minter) public isController {
        pf = PessoaFisica(_minter);
    }

    function criarPessoa() public returns (uint256) {
        (uint256 current) = pf.criarPessoa();
        currentCounter = current;
        return current;
    }

    modifier isController() {
        require(msg.sender == controller);
        _;
    }
}
