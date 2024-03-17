// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract MisbehaviorDetection {
    // Struct to represent a transaction
    struct Transaction {
        string transactionType; // Type of transaction (e.g., vehicle interaction)
        string details; // Additional details of the transaction
        uint256 timestamp; // Timestamp of the transaction
    }
    
    // Mapping to store transactions for each vehicle address
    mapping(address => Transaction[]) public transactions;
    
    // Event emitted when a transaction is recorded
    event TransactionRecorded(
        address indexed vehicle, // Indexed to allow filtering by vehicle address
        string transactionType,
        string details,
        uint256 timestamp
    );
    
    // Function to record a transaction
    function recordTransaction(string memory _transactionType, string memory _details) public {
        // Push the transaction to the array of transactions for the caller's address
        transactions[msg.sender].push(Transaction(_transactionType, _details, block.timestamp));
        // Emit an event indicating the transaction has been recorded
        emit TransactionRecorded(msg.sender, _transactionType, _details, block.timestamp);
    }
    
    // Function to get transactions for a specific vehicle address
    function getTransactions(address _vehicle) public view returns (string[] memory, string[] memory, uint256[] memory) {
        // Get the number of transactions for the given vehicle address
        uint256 length = transactions[_vehicle].length;
        // Initialize arrays to store transaction details
        string[] memory transactionTypes = new string[](length);
        string[] memory details = new string[](length);
        uint256[] memory timestamps = new uint256[](length);
        
        // Iterate through each transaction for the given vehicle address
        for (uint256 i = 0; i < length; i++) {
            // Retrieve the transaction details
            Transaction storage transaction = transactions[_vehicle][i];
            transactionTypes[i] = transaction.transactionType;
            details[i] = transaction.details;
            timestamps[i] = transaction.timestamp;
        }
        
        return (transactionTypes, details, timestamps);
    }
    
    // Function to get the total number of transactions for a specific vehicle address
    function getTotalTransactions(address _vehicle) public view returns (uint256) {
        return transactions[_vehicle].length;
    }
    
    // Function to delete all transactions for a specific vehicle address (owner-only)
    function deleteAllTransactions(address _vehicle) public {
        require(msg.sender == _vehicle); // Only the vehicle owner can delete transactions
        delete transactions[_vehicle];
    }
    
    // Function to retrieve the latest transaction details for a specific vehicle address
    function getLatestTransaction(address _vehicle) public view returns (string memory, string memory, uint256) {
        uint256 totalTransactions = transactions[_vehicle].length;
        require(totalTransactions > 0, "No transactions found for the given vehicle");
        
        Transaction storage latestTransaction = transactions[_vehicle][totalTransactions - 1];
        return (latestTransaction.transactionType, latestTransaction.details, latestTransaction.timestamp);
    }
}
