// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Script.sol";
import "../src/Controllers/PessoaFisicaController.sol";
import "../src/Pessoas/PessoaFisica.sol";
import "../src/Routers/PessoaFisicaRouter.sol";

contract PessoaFisicaScript is Script {
    PessoaFisicaController controller;
    PessoaFisica pf;
    PessoaFisicaRouter router;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        controller = new PessoaFisicaController();
        router = new PessoaFisicaRouter();
        pf = new PessoaFisica(address(router), address(controller));

        router.setPessoaFisicaMint(address(pf));

        router.criarPessoa();
        router.criarPessoa();
        router.criarPessoa();

        vm.stopBroadcast();
    }
} 