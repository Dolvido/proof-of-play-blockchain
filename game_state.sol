// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GameState {
    struct Quest {
        string name;
        string description;
        bool isActive;
    }

    Quest[] public quests;
    event QuestCreated(uint256 questId, string name, string description);
    event QuestStatusChanged(uint256 questId, bool isActive);

    function createQuest(string memory _name, string memory _description) public {
        quests.push(Quest({
            name: _name,
            description: _description,
            isActive: true
        }));
        emit QuestCreated(quests.length - 1, _name, _description);
    }

    function changeQuestStatus(uint256 _questId, bool _isActive) public {
        require(_questId < quests.length, "Invalid quest ID");
        quests[_questId].isActive = _isActive;
        emit QuestStatusChanged(_questId, _isActive);
    }

    function getQuests() public view returns (Quest[] memory) {
        return quests;
    }
}
