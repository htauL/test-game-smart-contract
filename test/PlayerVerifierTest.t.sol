// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {PlayerVerifier} from "../src/PlayerVerifier.sol";
import {DeployPlayerVerifier} from "../script/DeployPlayerVerifier.s.sol";

contract PlayerVerifierTest is Test {
    PlayerVerifier playerVerifier;

    function setUp() external {
        DeployPlayerVerifier deployPlayerVerifier = new DeployPlayerVerifier();
        playerVerifier = deployPlayerVerifier.run();
    }

    function testOwnerIsMsgSender() public view {
        assertEq(playerVerifier.gameAddress(), msg.sender);
    }
}
