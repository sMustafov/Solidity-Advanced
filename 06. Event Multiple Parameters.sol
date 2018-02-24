pragma solidity ^0.4.18;

contract MultipleEvent {
    event ShowInformation(string, address);
    
    address private owner;
    
    function MultipleEvent() public {
        owner = msg.sender;
    }
    
    function showInformation(string greeting, address addr) public {
        _showInformation(greeting, addr);
    }
}
