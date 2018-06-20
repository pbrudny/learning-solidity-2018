pragma solidity ^0.4.22;

contract FundRaising {
    address owner;
    uint public goal;
    uint public endTime;
    uint public total = 0;
    
    mapping(address=>uint) donations;
    
    constructor(uint _goal, uint _timeLimit) public {
        owner = msg.sender;
        goal = _goal;
        endTime = now + _timeLimit;
    }
    
    function add() payable public {
        require(now < endTime, "Fundraising is closed.");
        require(total < goal, "We reached a goal.");
        require(msg.value > 0, "You need to send some ether");
        donations[msg.sender] += msg.value; 
        total += msg.value;
    }
    
    function withdrawOwner() public {
        require(msg.sender == owner, "You must be owner");
        require(total >= goal, "Fundraising not closed yet");
        owner.transfer(address(this).balance);
    }
    
    function withdraw() public {
        require(now > endTime, "Fundraising not closed");
        require(total < goal, "Can not withdraw when fundraising was successful");
        uint amount = donations[msg.sender];
        total -= amount;
        donations[msg.sender] = 0;
        address(msg.sender).transfer(amount);
    }
}