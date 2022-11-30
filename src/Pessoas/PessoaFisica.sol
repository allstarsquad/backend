// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {ERC721} from "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {PessoaFisicaRouter} from "../Routers/PessoaFisicaRouter.sol";

contract PessoaFisica is ERC721 {
    PessoaFisicaRouter public router;
    address public controller;
    uint256 public counter;

    constructor() ERC721("Pessoa Fisica", "PF") {
        router = PessoaFisicaRouter(msg.sender);
    }

    function criarPessoa(string memory _nome, string memory _data) public isRouter returns (uint256) {
        _mint(address(router), counter);
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
