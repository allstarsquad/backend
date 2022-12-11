// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

interface IPessoaFisica {
    function setarController(address _controller) external;
    function getCurrentCounter() external view returns (uint256);
    function setBaseTokenURI(string calldata _baseTokenURI) external;
    function getTokenURI(uint256 _tokenId) external view returns (string memory);
    function novoCadastro() external returns (uint256);
}
