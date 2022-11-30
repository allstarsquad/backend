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

    function criarPessoa(string calldata _nome, string calldata _data) public {
        pf.criarPessoa(_nome, _data);
        currentCounter++;
    }

    modifier isController(address _sender) {
        require(_sender == controller);
        _;
    }
}
