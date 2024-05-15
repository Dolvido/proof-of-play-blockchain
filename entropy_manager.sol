// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EntropyManager {
    bytes32 public entropyPool;
    event EntropyAdded(address indexed playerAddress, bytes32 entropy);

    function addEntropy(bytes32 _entropy) public {
        entropyPool = keccak256(abi.encodePacked(entropyPool, _entropy));
        emit EntropyAdded(msg.sender, _entropy);
    }

    function getEntropyPool() public view returns (bytes32) {
        return entropyPool;
    }
}
