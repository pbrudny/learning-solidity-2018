pragma solidity ^0.4.23;

contract LotteryMultipleWinners {
    address owner;
    uint randNonce = 0;
    
    mapping(uint => address[]) choices;
    
    modifier isOwner {
        require(msg.sender == owner, "Must be owner");
        _;
    }
    
    constructor() public {
        owner = msg.sender;    
    }
    
    function join(uint8 _chosenNumber) payable public {
        require(_chosenNumber > 0 && _chosenNumber <= 100, "Number must be in 1-100");
        require(msg.value == 0.1 ether, "Transfer 0.1 Eth to join");
        choices[_chosenNumber].push(msg.sender);   
    }
    
    function selectWinners() public isOwner returns(uint) {
        uint chosen = randomNumber(10);
        address[] memory winners = choices[chosen];
        if (winners.length > 0) {
            uint prize = address(this).balance / (2 * winners.length);
            for(uint i = 0;i < winners.length; i++) {
                winners[i].transfer(prize);
            }
            delete winners;
        }
        return chosen;
    }
    
    function randomNumber(uint _limit) internal returns(uint) {
        uint rand = uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _limit;
        randNonce++;
        return rand;
    } 
    
}