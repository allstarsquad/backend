// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

interface IBens {
    function setarController(address _controller) external;
    function getCurrentCounter() external view returns (uint256);
    function setBaseTokenURI(string calldata _baseTokenURI) external;
    function getTokenURI(uint256 _tokenId) external view returns (string memory);
    function novoCadastro() external returns (uint256);
    function setarDono(uint256 _idBem, uint256 _idDono) external;
}
