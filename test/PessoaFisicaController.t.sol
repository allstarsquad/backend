// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";
import "../src/Controllers/PessoaFisicaController.sol";
import "../src/Pessoas/PessoaFisica.sol";

contract PessoaFisicaControllerTest is Test {
    PessoaFisicaController controller;
    PessoaFisica pf;
    address public constant owner = 0x99ba82E610C7Ed000F2477F7F548dcadEe97a9a3;

    function setUp() public {
        vm.startPrank(owner);
        controller = new PessoaFisicaController();
        pf = new PessoaFisica();
        vm.stopPrank();
    }

    function test_should_mint_and_receive_tokenized() public {
        vm.startPrank(owner);
        pf.setarController(address(controller));
        pf.novoCadastro();
        vm.stopPrank();
        assertTrue(pf.balanceOf(address(controller)) == 1);
    }
}
