# Elevator

This elevator won't let you reach the top of your building. Right?

## Solution

So, to solve this task, we need the `building.isLastFloor(_floor)` function to return `false` during the first call in `goTo()`, and `true` during the second call. Let's open the Remix IDE and write the `Hack` contract.

1. Let's write the `isLastFloor()` function, which will take the `_floor` number as an argument. During the first check, it will work as follows: if `_floor` is not equal to `lastFloor`, then `lastFloor` will be assigned the value of `_floor`, and the function will return `false`. However, during the second call, the function will return `true`.

2. Let's write the `goToFloor()` function, which will call the `goTo()` function of the Elevator contract.

3. We will deploy the `Hack` contract, specifying the instance address in the constructor. Then we will call the `goToFloor()` function, passing any floor number as an argument.