// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {ERC721} from "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {PessoaFisicaRouter} from "../Routers/PessoaFisicaRouter.sol";
import {PessoaFisicaController} from "../Controllers/PessoaFisicaController.sol";

contract PessoaFisica is ERC721 {
    PessoaFisicaRouter public router;
    PessoaFisicaController public controller;
    uint256 public counter;

    constructor(address _router, address _controller) ERC721("Pessoa Fisica", "PF") {
        router = PessoaFisicaRouter(_router);
        controller = PessoaFisicaController(_controller);
    }

    function criarPessoa() public isRouter returns (uint256) {
        _mint(address(controller), counter);
        counter++;
        return counter - 1;
    }

    function getCurrentCounter() public view returns (uint256) {
        return counter;
    }

    modifier isRouter() {
        require(msg.sender == address(router));
        _;
    }
}
