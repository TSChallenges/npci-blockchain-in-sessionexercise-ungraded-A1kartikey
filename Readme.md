# Introduction and Overview

Blockchain technology is transforming trust and decentralization, with smart contracts enabling self-executing agreements on platforms like Ethereum. In this exercise, you’ll build a simple Voting Smart Contract using Solidity and deploy it on Remix, Ethereum's online development environment.

The goal is to create a decentralized voting system where participants can:

* **Vote for Candidates:** Cast votes for predefined candidates.
* **Track Votes:** Check real-time vote counts.
* **Prevent Double Voting:** Ensure users vote only once.
* **Administer Elections:** Allow an admin to add candidates.


# Exercise Overview

Participants will:

* Write a voting smart contract to allow participants to vote for predefined candidates.
* Learn to deploy the contract and interact with it using Remix.
* Use basic Solidity concepts like mappings, modifiers, and events.

# Repository Structure

voting-system/

├── contracts/

│      ├── SimpleVoting.sol         # Contract with basic TODOs

├── README.md                    # Instructions for beginners

# Instructions for Participants

**Step 1:** Get a copy of the Voting repository by accepting the Github classroom link:


**Step 2:** Open the Contract in Remix

* Go to Remix.
* Click on the "File Explorer" tab and upload the SimpleVoting.sol file.

**Step 3**: Complete the Smart Contract:

Open the SimpleVoting.sol file. The starter code includes TODOs with clear instructions:

**Step 4:** Compile the Contract

* In Remix, click on the "Solidity Compiler" tab.
* Select the correct compiler version (0.8.x).
* Compile the contract.

**Step 5:** Deploy the Contract
* Go to the "Deploy & Run Transactions" tab in Remix.
* Deploy the contract with your account as the admin.

**Step 6: Interact with the Contract**

**Add Candidates:**
* As the admin, call the addCandidate function with the candidate names (e.g., "Ravi" or "Manu").
* Verify that candidates are added by checking the candidates mapping.

**Vote for Candidates:**
* Call the vote function with the candidate ID (starting from 0 for the first candidate).

Ensure that:

* The same address cannot vote twice.
* Only valid candidate IDs are accepted.

**Get Votes:**
* Call the getVotes function with a candidate ID to see the total votes.

# Testing the Contract
* Add at least two candidates using the addCandidate function.
* Use different accounts in Remix (via MetaMask or "Account" dropdown) to vote for candidates.
* Use the getVotes function to check the total votes for each candidate.
* Try invalid scenarios (e.g., voting twice, invalid candidate ID) to test the validations.

# Submission Instructions
* Complete the TODOs in SimpleVoting.sol.
* Test the contract in Remix.
* Submit the link to your GitHub fork for review.

# Bonus Tasks (Optional for Advanced Participants)
* **Election Results:**
           Add a getWinner function to determine the candidate with the most votes.
* **Election Control:**
           Add functionality to start and stop the election.


# **Election Lifecycle Management**
**Advanced Question**

Enhance the SimpleVoting contract to include the following features:
1. Add lifecycle states for the election: Created, Voting, and Ended.
2. Allow the admin to start and end the voting phase explicitly using appropriate functions.
3. Restrict actions (like voting or adding candidates) based on the current election state: 
     * Adding candidates is allowed only in the Created state.
     * Voting is allowed only in the Voting state.
     * Retrieving the winner is allowed only in the Ended state.
4. Emit events to track state changes (ElectionStarted, ElectionEnded).

# Key Learning Points

**State Management:**
* Using enum to define and manage contract states.
* Applying state-based restrictions with custom modifiers.

**Lifecycle Awareness:**

Understanding how to control contract functionality through lifecycle phases.

**Event Emission:**

Emitting and capturing events to track state transitions and key actions.

# Testing the Enhanced Contract in Remix

**Deploy the Contract:**
* Deploy the contract with your account as the admin.
* Check that the initial state is Created.

**Add Candidates:**
* Use the addCandidate function to add multiple candidates while in the Created state.
* Confirm that candidates are added by checking the candidates mapping.

**Start the Election:**
* Call the startElection function to transition to the Voting state.
* Verify that adding candidates is now restricted.

**Vote for Candidates:**
* Switch accounts in Remix (via MetaMask or the "Account" dropdown).
* Use the vote function to vote for candidates by their IDs.
* Check that duplicate voting is prevented and invalid candidate IDs are rejected.

**End the Election:**
* Call the endElection function to transition to the Ended state.
* Verify that voting is now restricted.

**Get the Winner:**
* Use the getWinner function to retrieve the name and vote count of the winning candidate.
* Ensure this is only accessible in the Ended state.

