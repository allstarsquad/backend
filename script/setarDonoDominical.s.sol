// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Script.sol";
import "../src/Controllers/PessoaFisicaController.sol";
import "../src/Bens/Dominical.sol";
import "../src/Bens/UsoComum.sol";
import "../src/Bens/UsoEspecial.sol";
import "../src/interfaces/IBens.sol";

contract SetarDonoDominicalScript is Script {
    IBens dom;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("KEY");

        vm.startBroadcast(deployerPrivateKey);
        uint256 _donoId;
        uint256 _bemId;

        dom.setarDono(_bemId, _donoId);
    }
}
