// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract AdvancedVoting {
    // Candidate structure
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    // Election states
    enum ElectionState { Created, Voting, Ended }
    ElectionState public state;

    address public admin; // Admin who manages the election
    mapping(uint256 => Candidate) public candidates; // Mapping of candidate ID to Candidate
    mapping(address => bool) public hasVoted; // Tracks whether an address has voted
    uint256 public totalCandidates; // Number of candidates

    // Events for lifecycle management and voting
    event CandidateAdded(string name);
    event ElectionStarted();
    event ElectionEnded();
    event VoteCast(address voter, uint256 candidateId);

    // Modifier to restrict actions based on election state
    modifier inState(ElectionState _state) {
        require(state == _state, "Invalid election state for this action");
        _;
    }

    // Modifier to restrict actions to the admin
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    // Constructor to initialize the admin and set the initial state
    constructor() {
        admin = msg.sender;
        state = ElectionState.Created;
    }

    // Function to add a candidate (Allowed only in Created state)
    function addCandidate(string memory name) external onlyAdmin inState(ElectionState.Created) {
        candidates[totalCandidates] = Candidate(name, 0);
        totalCandidates++;
        emit CandidateAdded(name);
    }

    // Function to start the election (Allowed only in Created state)
    function startElection() external onlyAdmin inState(ElectionState.Created) {
        state = ElectionState.Voting;
        emit ElectionStarted();
    }

    // Function to vote for a candidate (Allowed only in Voting state)
    function vote(uint256 candidateId) external inState(ElectionState.Voting) {
        #Todo
    }

    // Function to end the election (Allowed only in Voting state)
    function endElection() external onlyAdmin inState(ElectionState.Voting) {
        #Todo
    }

    // Function to get the winner (Allowed only in Ended state)
    function getWinner() external view inState(ElectionState.Ended) returns (string memory winnerName, uint256 winnerVoteCount) {
        uint256 maxVotes = 0;
        uint256 winnerId = 0;

        #Todo
            }
        }

        return (candidates[winnerId].name, candidates[winnerId].voteCount);
    }
}

