pragma solidity ^0.4.23;

contract BasicRandom {
    uint randNonce = 0;

    function getRandomNumber() public returns(uint) {
        uint rand = uint(keccak256(abi.encodePacked(now, msg.sender, randNonce)));
        randNonce++;        
        return rand;
    }
}