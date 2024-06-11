// SPDX-License-Identifier: MIT
//https://github.com/pbrudny/learning-solidity-2018.git
pragma solidity >=0.6.12 <0.9.0;

contract Greeter {
    string public greeting;
    address public owner;

    modifier onlyOwner {
        require(isOwner(), "Only owner can do that!");
        _;
    }
    
    constructor(string memory _greeting) {
        greeting = _greeting;
        owner = msg.sender;
    }

    function sayHello() public view returns(string memory) {
        if (isOwner()) {
            return "Hey daddy!";
        } else {
            return greeting;
        }
    }

    function setGreeting(string memory _newGreeting) public onlyOwner {
        greeting = _newGreeting;
    }
    
    function isOwner() private view returns(bool) {
        return msg.sender == owner;    
    }
}


      
