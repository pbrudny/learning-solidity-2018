
pragma solidity ^0.8.0;

contract BasicRandom {
    uint private randNonce = 0;

    function getRandomNumber() public returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce)));
        randNonce++;
        return rand;
    }
}
