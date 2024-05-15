// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlayerRegistry {
    struct Player {
        address playerAddress;
        string username;
        uint256 registrationTime;
    }

    mapping(address => Player) public players;
    event PlayerRegistered(address indexed playerAddress, string username);

    function registerPlayer(string memory _username) public {
        require(bytes(players[msg.sender].username).length == 0, "Player already registered");
        players[msg.sender] = Player({
            playerAddress: msg.sender,
            username: _username,
            registrationTime: block.timestamp
        });
        emit PlayerRegistered(msg.sender, _username);
    }

    function getPlayer(address _playerAddress) public view returns (Player memory) {
        return players[_playerAddress];
    }
}
