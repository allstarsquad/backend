// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import {ERC721} from "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Controller} from "../Controllers/Controller.sol";
import {Ownable} from "openzeppelin-contracts/contracts/access/Ownable.sol";
import {ERC721URIStorage} from "openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {Strings} from "openzeppelin-contracts/contracts/utils/Strings.sol";

contract PessoaFisica is ERC721URIStorage, Ownable {
    address public controller;
    uint256 public counter;
    string private baseTokenURI;

    using Strings for uint256;

    constructor() ERC721("Pessoa Fisica", "PF") {}

    function novoCadastro() public onlyOwner returns (uint256) {
        _mint(controller, counter);
        _setTokenURI(counter, baseTokenURI);
        counter++;
        return counter - 1;
    }

    function setarController(address _controller) public onlyOwner {
        controller = _controller;
    }

    function setBaseTokenURI(string calldata _baseTokenURI) public onlyOwner {
        baseTokenURI = _baseTokenURI;
    }

    /**
     *  VIEW FUNCTIONS
     */
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return string(
            abi.encodePacked(
                baseTokenURI, tokenId.toString()
            )
        );
    }

    function getCurrentCounter() public view returns (uint256) {
        return counter;
    }
}
