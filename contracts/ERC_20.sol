pragma solidity ^0.4.18;
import "./Token.sol";
contract ERC_20 is Token{

    uint256 public totalSupply;

    mapping(address => uint256) balance;
    mapping(address => mapping(address => uint256)) allowed;

    function balanceOf(address _owner) constant public returns (uint256) {
        return balance[_owner];
    }
    function transfer(address _to, uint256 _value) public returns (bool success) {
        if(balance[msg.sender]>=_value&&_value>0){
            balance[msg.sender] -= _value;
            balance[_to] += _value;
            Transfer (msg.sender,_to,_value);
            return true;
        }
        return false;
    }

    function transferFrom(address _owner, address _to, uint256 _value) public returns (bool success){
        if((allowed[_owner][msg.sender]>=_value) ||(_owner==msg.sender) &&_value>0){
            balance[_owner] -= _value;
            balance[_to] += _value;
            if(_owner!=msg.sender){
                allowed[_owner][msg.sender] -= _value;
            }

            Transfer(_owner,_to,_value);

            return true;
        }
        return false;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        if(balance[msg.sender]>=_value && _value>=0){
            allowed[msg.sender][_spender] = _value;
            Approval(msg.sender,_spender,_value);
            return true;
        }
        return false;
    }

    function allowance(address _owner, address _spender) public constant returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }

}