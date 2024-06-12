// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery10Users {
    address[10] public participants;
    uint8 public participantsCount;
    uint private randNonce;
    uint public ticketPrice = 0.1 ether;
    //just added ticketPrice for this line also added public and private methods

    event LotteryWinner(address indexed winner, uint amount);
    //Events: Added an event LotteryWinner to log the winner and the prize amount.

    constructor() {
        participantsCount = 0;
        randNonce = 0;
    }

    function join() external payable { // changeced it with external
        require(msg.value == ticketPrice, "Must send 0.1 ether");
        require(participantsCount < 10, "User limit reached");
        require(!joinedAlready(msg.sender), "User already joined");
        //Added "!" instead of use "== False"

        participants[participantsCount] = msg.sender;
        participantsCount++;

        if (participantsCount == 10) {
            selectWinner();
        }
    } // added if block here for selectWinner
    
    function joinedAlready(address _participant) private view returns (bool) {
        for (uint i = 0; i < participantsCount; i++) {
            if (participants[i] == _participant) {
                return true;
            }
        }
        return false;
    }
    
    function selectWinner() private {
        require(participantsCount == 10, "Waiting for more users");

        address winner = participants[randomNumber()];
        uint prize = address(this).balance;
        (bool success, ) = winner.call{value: prize}("");
        require(success, "Transfer failed");

        emit LotteryWinner(winner, prize);

        // Reset lottery for the next round
        for (uint i = 0; i < 10; i++) {
            participants[i] = address(0);
        }
        participantsCount = 0;
    }
    
    function randomNumber() private returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce))) % 10;
        randNonce++;
        return rand;
    }
}
