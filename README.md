# Misbehavior Detection Smart Contract
This Solidity smart contract, MisbehaviorDetection.sol, provides functionality for recording transactions related to vehicle interactions and detecting misbehavior. It includes public functions for recording transactions, retrieving transaction details, and deleting transactions. Below are the details of each function and how to interact with them.

## How to Run on Remix IDE:
1. Open Remix IDE: Visit (https://remix.ethereum.org/) Remix IDE in your web browser.

2. Create a New File: In the Remix IDE, create a new file and name it MisbehaviorDetection.sol.

3. Copy and Paste Contract Code: Copy the code from the attached Solidity file (MisbehaviorDetection.sol) and paste it into the editor in Remix IDE.

4. Compile the Contract: Click on the "Solidity Compiler" tab in Remix IDE.

5. Deploy and Interact with the Contract:
 - Switch to the "Deploy & Run Transactions" tab in Remix IDE.
 - Deploy the contract by clicking on the "Deploy" button.
 - Once deployed, you can interact with the contract using the provided UI or by calling the contract functions directly.
## Public Functions:
### 1. recordTransaction(string memory _transactionType, string memory _details)
This function allows users to record a transaction related to a vehicle interaction. It takes two parameters:

 - _transactionType: A string representing the type of transaction (e.g., "toll payment", "parking", etc.).
 - _details: A string providing additional details about the transaction.

### 2. getTransactions(address _vehicle)
This function retrieves all transactions recorded for a specific vehicle address. It takes one parameter:

 - _vehicle: The Ethereum address of the vehicle for which transactions are to be retrieved.

### 3. getTotalTransactions(address _vehicle)
This function retrieves the total number of transactions recorded for a specific vehicle address. It takes one parameter:

 - _vehicle: The Ethereum address of the vehicle.

### 4. deleteAllTransactions(address _vehicle)
This function allows the owner of a vehicle address to delete all transactions associated with that address. It takes one parameter:

- _vehicle: The Ethereum address of the vehicle.

### 5. getLatestTransaction(address _vehicle)
This function retrieves the details of the latest transaction recorded for a specific vehicle address. It takes one parameter:

- _vehicle: The Ethereum address of the vehicle.

