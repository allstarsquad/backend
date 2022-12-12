// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Script.sol";
import "../src/Controllers/Controller.sol";
import "../src/Bens/Dominical.sol";
import "../src/Bens/UsoComum.sol";
import "../src/Bens/UsoEspecial.sol";

contract PessoaFisicaScript is Script {
    Dominical dom;
    UsoComum uc;
    UsoEspecial ue;
    Controller controller;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("KEY");

        vm.startBroadcast(deployerPrivateKey);

        dom = new Dominical();
        uc = new UsoComum();
        ue = new UsoEspecial();
        controller = new Controller();

        dom.setarController(address(controller));
        uc.setarController(address(controller));
        ue.setarController(address(controller));

        dom.setBaseTokenURI("https://gateway.pinata.cloud/ipfs/QmYTnrxGKZww7dZqSyR8WmWkqQTtHSJ38yVwnWhfwU9bwZ/");
        uc.setBaseTokenURI("https://gateway.pinata.cloud/ipfs/QmYTnrxGKZww7dZqSyR8WmWkqQTtHSJ38yVwnWhfwU9bwZ/");
        ue.setBaseTokenURI("https://gateway.pinata.cloud/ipfs/QmYTnrxGKZww7dZqSyR8WmWkqQTtHSJ38yVwnWhfwU9bwZ/");

        dom.novoCadastro();
        uc.novoCadastro();
        ue.novoCadastro();

        vm.stopBroadcast();
    }
}
