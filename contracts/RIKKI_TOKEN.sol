pragma solidity ^0.4.18;
import "./ERC_20.sol";
contract RIKKI_TOKEN is ERC_20 {

    string public name;
    uint8 public decimals;
    string public symbol;
    string public version = 'R1.0';
    address ceo;

    function RIKKI_TOKEN() public{
        ceo = msg.sender;
        name = "RIKKI_TOKEN";
        decimals = 0;
        totalSupply = 1000000;
        balance[msg.sender] = 1000000;
        symbol = "₹kt";
    }
}