pragma solidity ^0.4.18;

contract EventCreation {
    event ShowAddress(address);
    
    address private owner;
    
    function EventCreation() public {
        owner = msg.sender;
    }
    
    function showAddress() public {
        _showAddress(owner);
    }
}
