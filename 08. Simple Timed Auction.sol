pragma solidity ^0.4.18;

contract TimedAuction {
    mapping (address => uint) private tokenBalances;
    uint private duration;
    uint private start;
    address private owner;
    
    function TimedAuction(uint _initialSupply) public {
		duration = 1 minutes
        start = now;
        owner = msg.sender;
        tokenBalances[owner] = _initialSupply;
    }
    
    function buyTokens(uint amount) public {
        assert(now <= start + duration);
        assert(amount <= tokenBalances[owner]);
        tokenBalances[msg.sender] += amount;
        tokenBalances[owner] -= amount;
    }
}
