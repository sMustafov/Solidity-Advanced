pragma solidity ^0.4.18;

contract FallbackExercise {
    address private owner;
    
    modifier isOwner() {
        require(msg.sender == owner);
        _;
    }
    
    function FallbackExercise() public {
        owner = msg.sender;
    }
    
    function getBalance() public isOwner view returns (uint) {
        return this.balance;
    }
    
    function transfer(address addr, uint amount) public isOwner {
        assert(amount <= this.balance);
        addr.transfer(amount);
    }
    
    function deposit() public payable {
        
    }
}

contract RecipientContract {
    address private owner;
    
    modifier isOwner() {
        require(msg.sender == owner);
        _;
    }
    
    function RecipientContract() public {
        owner = msg.sender;
    }
    
    function () public payable {
        
    }
    
    function getBalance() public isOwner view returns (uint) {
        return this.balance;
    }
}