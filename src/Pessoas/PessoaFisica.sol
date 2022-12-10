// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {ERC721} from "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {PessoaFisicaRouter} from "../Routers/PessoaFisicaRouter.sol";
import {PessoaFisicaController} from "../Controllers/PessoaFisicaController.sol";
import {Ownable} from "openzeppelin-contracts/contracts/access/Ownable.sol";


contract PessoaFisica is ERC721 {
    PessoaFisicaRouter public router;
    PessoaFisicaController public controller;
    uint256 public counter;
    string private baseTokenURI;

    constructor(address _router, address _controller) ERC721("Pessoa Fisica", "PF") {
        router = PessoaFisicaRouter(_router);
        controller = PessoaFisicaController(_controller);
        baseTokenURI = "";
    }

    function criarPessoa() public isRouter returns (uint256) {
        _mint(address(controller), counter);
        counter++;
        return counter - 1;
    }

    function getCurrentCounter() public view returns (uint256) {
        return counter;
    }

    function setBaseTokenURI(string calldata _baseTokenURI) public {
        baseTokenURI = _baseTokenURI;
    }

    function getTokenURI(uint256 _tokenId) public view returns (string memory) {
        return string(abi.encodePacked(baseTokenURI, _tokenId));
    }

    modifier isRouter() {
        require(msg.sender == address(router));
        _;
    }
}
