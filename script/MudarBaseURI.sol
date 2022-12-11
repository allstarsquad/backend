// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Script.sol";
import "../src/Controllers/PessoaFisicaController.sol";
import "../src/Pessoas/PessoaFisica.sol";
import "../src/interfaces/IPessoaFisica.sol";

contract PessoaFisicaScript2 is Script {
    IPessoaFisica pf = IPessoaFisica(0xF5042B0628963D1A2dB927D69e645af2A15D0010);

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("KEY");
        vm.startBroadcast(deployerPrivateKey);

        pf.setBaseTokenURI("https://gateway.pinata.cloud/ipfs/QmYTnrxGKZww7dZqSyR8WmWkqQTtHSJ38yVwnWhfwU9bwZ/");
        vm.stopBroadcast();
    }
}
