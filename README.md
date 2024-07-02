# Meta_FunctionsandErrors
# Simple Voting Contract

This Solidity program is a simple voting system that demonstrates the basic syntax and functionality of the Solidity programming language. The purpose of this program is to serve as a starting point for those who are new to Solidity and want to get a feel for how it works.

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract allows the owner to add candidates, and users can vote for these candidates. The program serves as a straightforward introduction to Solidity programming and can be used as a stepping stone for more complex projects in the future.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at [Remix Ethereum](https://remix.ethereum.org/).

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a `.sol` extension (e.g., SimpleVoting.sol). Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoting {
    address public owner;
    mapping(string => uint256) public votes;
    string[] public candidates;

    constructor(string[] memory initialCandidates) {
        owner = msg.sender;
        candidates = initialCandidates;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    function addCandidate(string memory candidate) public onlyOwner {
        candidates.push(candidate);
    }

    function vote(string memory candidate) public {
        require(validCandidate(candidate), "Invalid candidate");
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
        assert(candidates.length > 0);
    }

    function emergencyStopVoting() public view onlyOwner {
        revert("You are not allowed to stop voting");
    }

    function getVotes(string memory candidate) public view returns (uint256) {
        require(validCandidate(candidate), "Invalid candidate");
        return votes[candidate];
    }
}
```
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to a compatible version (e.g., 0.8.0), and then click on the "Compile BasicContract.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "SimpleVoting" contract from the dropdown menu.

# Deploying the Contract
When deploying the contract, you need to provide the list of initial candidates. Enter the list of candidates as a comma-separated array in the deploy parameters field. For example, to initialize the contract with three candidates ("Alice", "Bob", and "Charlie"), enter the following in the deploy parameters field:
```
["Alice", "Bob", "Charlie"]
```
Then, click on the "Deploy" button to deploy the contract.
--
## Authors

Vashti Bauson
