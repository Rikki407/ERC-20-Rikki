pragma solidity ^0.4.18;
import "./ERC_20.sol";
contract RIKKI_TOKEN is ERC_20 {

    string public name;
    uint8 public decimals;
    string public symbol;
    string public version = 'R1.0';
    address owner;
    function RIKKI_TOKEN() public{
        name = "RIKKI_TOKEN";
        owner = tx.origin;
        decimals = 0;
        totalSupply = 1000000;
        balance[tx.origin] = 1000000;
        symbol = "₹kt";
    }

    function getTokenFromOwner(uint256 value) public{
        balance[tx.origin] += value;
        balance[owner] -=value;
    }
}