# learning-solidity-2018

These examples are part of my guide [The best way to become Ethereum Developer in 2018](https://medium.com/@pbrudny/the-best-way-to-become-ethereum-solidity-developer-in-2018-5606e54646e6)


In Ethereum world everything is changing dynamically.
I decided to make a set of Smart Contracts for learning purposes.

I know it's funny to name a repo this way but I am quite convinced that in 2019 these examples may not work with the latest Solidity.

Try to write a contract yourself before checking the code in the repo!

## Examples

### 01_say_hello.sol
* set greeting on creation and allow to change it by the owner (creator of the contract)
* return greeting to everyone who calls `sayHello` method
* return `Hello Daddy` to the creator

### 02_balance_address_checker.sol
* return address of the contract
* return address of the contract's owner
* return address of the sender
* return balance of the contract
* return balance of the contract's owner (ONLY if you are the owner)
* return balance of the sender

### 03_basic_random.sol
* return random number 0-99
* the "financial importance" of this calculation is less than miner would get for mining single block
* https://ethereum.stackexchange.com/questions/419/when-can-blockhash-be-safely-used-for-a-random-number-when-would-it-be-unsafe?noredirect=1&lq=1

### 04_lottery_10_users.sol
* 10 users limit
* user has to pay 0.1 ether to join the Lottery
* same user can join once
* owner of the contract can join too
* when 10 users joined then the winner is picked
* winner receives all the money
* new lottery starts when winner is pickecd

### 05_lottery_no_limit.sol
* no limit for users   
* same user can join multiple times
* owner of the contract can join too
* owner decides when to pick the winner
* winner receives all the money

### 06_lottery_muliple_winners
* no limit for users
* user joins paying 1 eth and picking number 1-100
* owner decides when to generate random number (1-100) 
* users who picked generated numbers win
* 0.5 of the prize is distributed to all winners
* next lottery can start 

### 07_basic_token
* contract creator gets initial tokens
* tokens can be transferred to any account
* there is protection from overflow
* everyone can check balances

## Like it?
If you like it please share it with others :)

