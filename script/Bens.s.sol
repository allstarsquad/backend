// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Script.sol";
import "../src/Controllers/PessoaFisicaController.sol";
import "../src/Bens/Dominical.sol";
import "../src/Bens/UsoComum.sol";
import "../src/Bens/UsoEspecial.sol";

contract PessoaFisicaScript is Script {
    Dominical dom;
    UsoComum uc;
    UsoEspecial ue;
    address controller;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("KEY");

        vm.startBroadcast(deployerPrivateKey);

        dom = new Dominical();
        uc = new UsoComum();
        ue = new UsoEspecial();

        dom.setarController(controller);
        uc.setarController(controller);
        ue.setarController(controller);
        
        dom.setBaseTokenURI("https://gateway.pinata.cloud/ipfs/QmYTnrxGKZww7dZqSyR8WmWkqQTtHSJ38yVwnWhfwU9bwZ/");
        uc.setBaseTokenURI("https://gateway.pinata.cloud/ipfs/QmYTnrxGKZww7dZqSyR8WmWkqQTtHSJ38yVwnWhfwU9bwZ/");
        ue.setBaseTokenURI("https://gateway.pinata.cloud/ipfs/QmYTnrxGKZww7dZqSyR8WmWkqQTtHSJ38yVwnWhfwU9bwZ/");

        dom.novoCadastro();
        uc.novoCadastro();
        ue.novoCadastro();

        vm.stopBroadcast();
    }
}
