// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MagicNum {

  address public solver;

  constructor() {}

  function setSolver(address _solver) public {
    solver = _solver;
  }

  /*
    ____________/\\\_______/\\\\\\\\\_____        
     __________/\\\\\_____/\\\///////\\\___       
      ________/\\\/\\\____\///______\//\\\__      
       ______/\\\/\/\\\______________/\\\/___     
        ____/\\\/__\/\\\___________/\\\//_____    
         __/\\\\\\\\\\\\\\\\_____/\\\//________   
          _\///////////\\\//____/\\\/___________  
           ___________\/\\\_____/\\\\\\\\\\\\\\\_ 
            ___________\///_____\///////////////__
  */
}

contract Hack {
    address public hackAddress;
    bytes public value;

    function createHack(bytes memory _data) public {
        address _addr;

        assembly {
            _addr := create(0, add(_data, 0x20), mload(_data))
        }

        hackAddress = _addr;
    }

    function getSize(address _hackAddress) public view returns(uint) {
        return _hackAddress.code.length;
    }

    function callMagicNum(address _magicNum) public {
        (bool success, bytes memory data) = _magicNum.call("");
        require(success);
        value = data;
    }
}

//----------------------
// push 2a
// push 80

// mstore(offset, value)

// push 20
// puch 80

// return(offset, size)
// 60_2a_60_80_52_60_20_60_80_f3 RUNTIME bytecode
// ---------------------
// push 0a
// push __
// push 00
// codecopy(dest0ffset, offset, size)

// push --
// push 00
// return(offset, size)
// 60_0a_60_--_60_00_39_60_0a_60_00_f3 CREATION bytecode
// -- = 0c (offset)
// 0x600a600c600039600a6000f3602a60805260206080f3 RESULT
