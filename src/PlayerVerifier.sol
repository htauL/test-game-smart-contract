// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract PlayerVerifier {
    address public gameAddress;
    mapping(address => bool) public allowedPlayers;

    event PlayerAdded(address indexed player);
    event PlayerRemoved(address indexed player);

    constructor() {
        gameAddress = msg.sender; // Set the game address as the deployer
    }

    modifier onlyGame() {
        require(
            msg.sender == gameAddress,
            "Only game address can call this function"
        );
        _;
    }

    function addPlayer(address player) external onlyGame {
        allowedPlayers[player] = true;
        emit PlayerAdded(player);
    }

    function removePlayer(address player) external onlyGame {
        allowedPlayers[player] = false;
        emit PlayerRemoved(player);
    }

    function isPlayerAllowed(address player) external view returns (bool) {
        return allowedPlayers[player];
    }
}
