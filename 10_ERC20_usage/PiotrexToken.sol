pragma solidity ^0.4.24;

import "zeppelin/contracts/token/StandardToken.sol";

contract PiotrexToken is StandardToken {
    string public constant name = "PiotrexToken";
    string public constant symbol = "PTX";
    uint8 public constant decimals = 18;
    uint256 public constant initialSupply = 1000 * (10 ** uint256(decimals)); 
    
    constructor () public {
        balances[msg.sender] = initialSupply;
        totalSupply = initialSupply;
    }      
}