pragma solidity ^0.4.18;

contract TokenShares {
    address private owner;
    uint private price;
    uint private divident;
    mapping(address => uint) private sharesPerAddress;
    mapping(address => bool) private adressesAllowedToWithdrawFunds;
    address[] shareholders;
    
    function TokenShares(uint initialSuply, uint pricePerShare, uint _divident) public {
        owner = msg.sender;
        sharesPerAddress[owner] = initialSuply;
        price = pricePerShare * 1 ether;
        divident = _divident * 1 ether;
    }
    
    function getPricePerShare() public view returns (uint) {
        return price / 1 ether;
    }
    
    function calculateTransactionWorth(uint amount) public view returns (uint) {
        return (amount * price) / 1 ether;
    }
    
    function buyShares(uint amount) public payable {
        require(sharesPerAddress[owner] >= amount);
        require(sharesPerAddress[msg.sender] + amount >= sharesPerAddress[msg.sender]);
        require(msg.value == price * amount);
        
        sharesPerAddress[owner] -= amount;
        sharesPerAddress[msg.sender] += amount;
        shareholders.push(msg.sender);
    }
    
    function getShareholders() public view returns (address[]) {
        require(msg.sender == owner);
        return shareholders;
    }
    
    function allowWithdraw(address addr) public {
        require(msg.sender == owner);
        adressesAllowedToWithdrawFunds[addr] = true;
    }
    
    function depositEarning() public payable {
        require(owner == msg.sender);
    }
    
    function getBalance() public view returns(uint) {
        require(msg.sender == owner);
        return this.balance / 1 ether;
    }
    
    function getNumberOfShares(address addr) public view returns (uint) {
        require(owner == msg.sender || addr == msg.sender);
        return sharesPerAddress[addr];
    }
    
    function withdraw() public {
        require(sharesPerAddress[msg.sender] > 0);
        require(this.balance >= sharesPerAddress[msg.sender] * divident);
        require(adressesAllowedToWithdrawFunds[msg.sender] == true);
        msg.sender.transfer(sharesPerAddress[msg.sender] * divident);
        adressesAllowedToWithdrawFunds[msg.sender] = false;
    }
}
