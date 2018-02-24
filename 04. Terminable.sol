pragma solidity ^0.4.18;

contract MainContract {
    address internal owner;
    
    modifier isOwner() {
        require(owner == msg.sender);
        _;
    }
    
    function MainContract() public {
        owner = msg.sender;
    }
    
    function deposit() payable {
        
    }
    
    function getBalance() view public returns (uint) {
        return this.balance;
    }
}

contract ToBeTerminated is MainContract {
    function terminate() public isOwner {
        selfdestruct(msg.sender);
    }
}
