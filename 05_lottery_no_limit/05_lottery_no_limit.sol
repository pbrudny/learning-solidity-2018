// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LotteryNoLimit {
    address public owner;
    address[] public users;
    uint private randNonce = 0;

    
    modifier isOwner() {
        require(msg.sender == owner, "only owner can do that");
        _;
    }
    
    constructor() {
        owner = msg.sender;    
    }
    
    function join() external payable {
        require(msg.value == 0.1 ether, "Send 0.1 Ether");
        users.push(msg.sender);
    }
    
    function selectWinner() external isOwner {
        require(users.length > 0, "No users in the lottery");
        address winner = users[randomNumber(users.length)];
        payable(winner).transfer(address(this).balance);
        delete users;
    }
    
    function randomNumber(uint _limit) private returns(uint) {
        randNonce++;
        return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce))) % _limit;
    }
}
