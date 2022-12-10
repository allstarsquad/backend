// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";
import "../src/Controllers/PessoaFisicaController.sol";
import "../src/Pessoas/PessoaFisica.sol";
import "../src/Routers/PessoaFisicaRouter.sol";

contract PessoaFisicaControllerTest is Test {
    PessoaFisicaController controller;
    PessoaFisicaRouter router;
    PessoaFisica pessoa;

    function setUp() public {
        controller = new PessoaFisicaController();
        router = PessoaFisicaRouter(controller.deployRouter());
        pessoa = new PessoaFisica(address(router), address(controller));

        vm.startPrank(address(controller));
        router.setPessoaFisicaMint(address(pessoa));
        vm.stopPrank();
    }

    function test_should_mint_and_receive_tokenized() public {
        vm.startPrank(address(controller));
        router.criarPessoa();
        vm.stopPrank();
        assertTrue(pessoa.balanceOf(address(controller)) == 1);
    }
}
