pragma solidity ^0.4.22;

contract Checker {
    address owner;
    
    constructor() public {
        owner = msg.sender;    
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    function getBalanceOfContract() public view returns(uint) {
        return address(this).balance;
    }
    
    function getBalanceOfOwner() public view onlyOwner returns(uint){
        return owner.balance;
    }
    
    function getBalanceOfSender() public view returns(uint) {
        return msg.sender.balance;
    }
    
    function getAddressOfContract() public view returns(address) {
        return this;
    }
   
    function getAddressOfOwner() public view returns(address) {
        return owner;    
    }
     
    function getAddressOfSender() public view returns(address) {
        return msg.sender;
    }
}