// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract RewardsDistributor {
    IERC20 public rewardsToken;
    mapping(address => uint256) public rewards;

    event RewardDistributed(address indexed playerAddress, uint256 amount);

    constructor(IERC20 _rewardsToken) {
        rewardsToken = _rewardsToken;
    }

    function distributeReward(address _playerAddress, uint256 _amount) public {
        require(rewardsToken.transfer(_playerAddress, _amount), "Reward transfer failed");
        rewards[_playerAddress] += _amount;
        emit RewardDistributed(_playerAddress, _amount);
    }

    function getRewardBalance(address _playerAddress) public view returns (uint256) {
        return rewards[_playerAddress];
    }
}
