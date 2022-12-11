// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {ERC721} from "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {PessoaFisicaController} from "../Controllers/PessoaFisicaController.sol";
import {Ownable} from "openzeppelin-contracts/contracts/access/Ownable.sol";
import {ERC721URIStorage} from "openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {Strings} from "openzeppelin-contracts/contracts/utils/Strings.sol";

contract Dominical is ERC721URIStorage, Ownable {
    address public controller;
    uint256 public counter;
    string private baseTokenURI;
    string public uriDono;
    mapping(uint256 => string) public getDono;

    using Strings for uint256;

    constructor() ERC721("Dominical", "DOM") {}

    function novoCadastro() public onlyOwner returns (uint256) {
        _mint(controller, counter);
        _setTokenURI(counter, baseTokenURI);
        counter++;
        return counter - 1;
    }

    function setarController(address _controller) public onlyOwner {
        controller = _controller;
    }

    function setarDono(uint256 _idBem, uint256 _idDono) public onlyOwner {
        getDono[_idBem] = donoURI(_idDono);
    }

    function getCurrentCounter() public view returns (uint256) {
        return counter;
    }

    function setUriDono(string memory _uriDono) public onlyOwner {
        uriDono = _uriDono;
    }

    function setBaseTokenURI(string calldata _baseTokenURI) public onlyOwner {
        baseTokenURI = _baseTokenURI;
    }

    function _baseURI() internal view override returns (string memory) {
        return baseTokenURI;
    }

    function donoURI(uint256 tokenId) public view returns (string memory) {
        return string(abi.encodePacked(uriDono, tokenId.toString()));
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return string(
            abi.encodePacked(
                "https://gateway.pinata.cloud/ipfs/QmYTnrxGKZww7dZqSyR8WmWkqQTtHSJ38yVwnWhfwU9bwZ/", tokenId.toString()
            )
        );
    }

    function getTokenURI(uint256 _tokenId) public view returns (string memory) {
        return string(abi.encodePacked(baseTokenURI, _tokenId));
    }
}
