pragma solidity ^0.4.18;

contract EventWithIndexedParameters {
    event ShowInformation(string indexed price, string indexed amount);
    address private owner;
    
    function EventWithIndexedParameters() public {
        owner = msg.sender;
    }
    
    function showInformation(string price, string amount) public {
        _showInformation(price,amount);
    }
}
