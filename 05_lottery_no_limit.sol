pragma solidity ^0.4.23;

contract LotteryNoLimit {
    address owner;
    address[] users;
    uint randNonce = 0;
    
    modifier isOwner() {
        require(msg.sender == owner, "only owner can do that");
        _;
    }
    
    constructor() public {
        owner = msg.sender;    
    }
    
    function join() payable public {
        require(msg.value == 1 ether, "Send 1 Ether");
        users.push(msg.sender);
    }
    
    function selectWinner() public isOwner {
        require(users.length > 0, "No users in the lottery");
        users[randomNumber(users.length)].transfer(address(this).balance);  
        delete users;
    }
    
    function randomNumber(uint _limit) private returns(uint) {
        uint rand = uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _limit;
        randNonce++;
        return rand;
    }
}