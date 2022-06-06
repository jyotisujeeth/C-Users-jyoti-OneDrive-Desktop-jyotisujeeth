pragma solidity ^0.8.10;

// Creating a Contract
contract finalpro
{

mapping(address => uint256) balances;

// Mapping father address

mapping(address => mapping (
        address => uint256)) allowed;

uint256 _totalSupply = 1000;
address public father;

event Approval(address indexed _father, address indexed _son, uint256 _value);

event Transfer(address indexed _from, address indexed _to,uint256 _value);

function balanceOf(address _father)
        public view returns (
        uint256 balance)
{
return balances[_father];
}

// function approve
function approve(address _son, uint256 _amount)
                public returns (bool success)
{
allowed[msg.father][_son] = _amount;
    

emit Approval(msg.father, _son, _amount);
return true;
}

function transfer(address _to, uint256 _amount) public returns (bool success)
{

    if (balances[msg.father] >= _amount)
    {
        balances[msg.father] -= _amount;
        balances[_to] += _amount;
        emit Transfer(msg.father,   _to, _amount);
            return true;
    }
    else
    {
        return false;
    }
}

function transferFrom(address _from, address _to, uint256 _amount) public returns (bool success)
{
if (balances[_from] >= _amount &&
    allowed[_from][msg.father] >=
    _amount && _amount > 0 &&
    balances[_to] + _amount > balances[_to])
{
        balances[_from] -= _amount;
        balances[_to] += _amount;
        
        emit Transfer(_from, _to, _amount);
    return true;
}
else
{
    return false;
}
}

function allowance(address _father, address _son) public view returns (uint256 remaining)
{
return allowed[_father][_son];
}
}
