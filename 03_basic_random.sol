pragma solidity ^0.4.24;

contract BasicRandom {
    uint randNonce = 0;

    function getRandomNumber() public returns(uint) {
        uint rand = uint(keccak256(now, msg.sender, randNonce));
        randNonce++;        
        return rand;
    }
}