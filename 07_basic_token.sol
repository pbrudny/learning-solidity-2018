pragma solidity ^0.4.22;

contract BasicToken {
    mapping(address=>uint) public balances;
    
    constructor(uint _initialSupply) public {
        balances[msg.sender] = _initialSupply;
    }
    
    function transfer(address _recipient, uint _amount) public {
        require(balances[msg.sender] >= _amount, "Not enough funds");
        require(_recipient != msg.sender, "No need to send tokens to yourself");
        //overflow check
        require(balances[_recipient] + _amount > balances[_recipient]);
        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;
    }
}