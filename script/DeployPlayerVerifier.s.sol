// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {PlayerVerifier} from "../src/PlayerVerifier.sol";

contract DeployPlayerVerifier is Script {
    function run() external returns (PlayerVerifier) {
        vm.startBroadcast();
        PlayerVerifier playerVerifier = new PlayerVerifier();
        vm.stopBroadcast();

        return playerVerifier;
    }
}
