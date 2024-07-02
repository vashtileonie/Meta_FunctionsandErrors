// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoting {
    address public owner;
    mapping(string => uint256) public votes;
    string[] public candidates;

    constructor() {
        owner = msg.sender;
        candidates = ["Alice", "Bob", "Charlie"]; // Initialize the candidates here
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner"); // require() statement
        _;
    }

    function addCandidate(string memory candidate) public onlyOwner {
        candidates.push(candidate);
    }

    function vote(string memory candidate) public {
        require(validCandidate(candidate), "Invalid candidate"); // require() statement
        votes[candidate] += 1;
    }

    function validCandidate(string memory candidate) internal view returns (bool) {
        for (uint256 i = 0; i < candidates.length; i++) {
            if (keccak256(abi.encodePacked(candidates[i])) == keccak256(abi.encodePacked(candidate))) {
                return true;
            }
        }
        return false;
    }

    function checkInvariant() public view {
        assert(candidates.length > 0); // assert() statement
    }

    function emergencyStopVoting() public view onlyOwner {
        revert("You are not allowed to stop voting"); // revert() statement
    }

    function getVotes(string memory candidate) public view returns (uint256) {
        require(validCandidate(candidate), "Invalid candidate"); // require() statement
        return votes[candidate];
    }
}
