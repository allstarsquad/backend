// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Script.sol";
import "../src/Controllers/PessoaFisicaController.sol";
import "../src/Pessoas/PessoaFisica.sol";

contract PessoaFisicaScript is Script {
    PessoaFisicaController controller;
    PessoaFisica pf;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("KEY");

        vm.startBroadcast(deployerPrivateKey);

        controller = new PessoaFisicaController();
        pf = new PessoaFisica();

        pf.setarController(address(controller));
        pf.setBaseTokenURI("https://gateway.pinata.cloud/ipfs/QmYTnrxGKZww7dZqSyR8WmWkqQTtHSJ38yVwnWhfwU9bwZ/");

        pf.novoCadastro();
        pf.novoCadastro();
        pf.novoCadastro();

        vm.stopBroadcast();
    }
}
