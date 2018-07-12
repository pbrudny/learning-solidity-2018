pragma solidity ^0.4.24;

import "github.com/OpenZeppelin/zeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";

contract DirtyToken is ERC721Token {
    string public constant name = "DirtyToken";
    string public constant symbol = "DRT";
}