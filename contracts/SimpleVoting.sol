// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract SimpleVoting {
    // Candidate structure
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    address public admin; // Admin who creates the election
    mapping(uint256 => Candidate) public candidates; // Mapping of candidate ID to Candidate
    mapping(address => bool) public hasVoted; // Tracks whether an address has voted
    uint256 public totalCandidates; // Number of candidates

    // Event to be emitted when a vote is cast
    event VoteCast(address voter, uint256 candidateId);

    // Modifier to restrict functions to the admin
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    // Constructor to initialize the admin
    constructor() {
        admin = msg.sender;
    }

    // Function to add a candidate (Admin only)
    function addCandidate(string memory name) external onlyAdmin {
        candidates[totalCandidates] = Candidate(name, 0);
        totalCandidates++;
    }

    // Function to vote for a candidate
    function vote(uint256 candidateId) external {
        // TODO: Ensure the voter hasn't already voted.
        require(!hasVoted[msg.sender], "You have already voted.");

        // TODO: Ensure the candidateId is valid.
        require(candidateId < totalCandidates, "Invalid candidate ID.");

        // Record the vote
        hasVoted[msg.sender] = true;
        candidates[candidateId].voteCount++;

        // Emit the vote event
        emit VoteCast(msg.sender, candidateId);
    }

    // Function to get the total votes for a candidate
    function getVotes(uint256 candidateId) external view returns (uint256) {
        // TODO: Ensure the candidateId is valid.
        require(candidateId < totalCandidates, "Invalid candidate ID.");

        return candidates[candidateId].voteCount;
    }
}

