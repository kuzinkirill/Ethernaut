# Gatekeeper Two

This gatekeeper introduces a few new challenges. Register as an entrant to pass this level.

## Solution

1. To pass the first modifier, it is required that tx.origin is not equal to msg.sender. Thus, we will create a new contract named `Hack` through which we will interact with the `GatekeeperTwo` contract

2. The second modifier checks for the length of the sender's bytecode. If a function is accessed from another contract, the bytecode length of that contract will not be zero. Essentially, this modifier restricts calling the `enter()` function directly from an account, but it can be bypassed by calling the `enter()` function of the GatekeeperTwo contract inside the `constructor()` of the Hack contract. This way, at the time of calling the `enter()` function, the bytecode of the contract `Hack` will still be zero.

3. The XOR operator works bidirectionally. We know the value of `type(uint64).max`. So, let's determine the value of key by changing `msg.sender` to `address(this)`, since it's the `Hack` contract that will be the msg.sender when accessing the GatekeeperTwo contract through it.