// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ActionLogger {
    struct Action {
        address playerAddress;
        string actionType;
        string actionDetails;
        uint256 timestamp;
    }

    Action[] public actions;
    event ActionLogged(address indexed playerAddress, string actionType, string actionDetails);

    function logAction(string memory _actionType, string memory _actionDetails) public {
        actions.push(Action({
            playerAddress: msg.sender,
            actionType: _actionType,
            actionDetails: _actionDetails,
            timestamp: block.timestamp
        }));
        emit ActionLogged(msg.sender, _actionType, _actionDetails);
    }

    function getActions() public view returns (Action[] memory) {
        return actions;
    }
}
