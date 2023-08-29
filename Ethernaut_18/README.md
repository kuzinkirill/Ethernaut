# Magic Number

To solve this level, you only need to provide the Ethernaut with a Solver, a contract that responds to whatIsTheMeaningOfLife() with the right number. The solver's code needs to be really tiny: 10 opcodes at most.

## Solution

An example of bytecode calculation is provided under the Hack contract.

Deploy the `Hack` contract and pass the obtained bytecode (string 74) as an argument. Then, access `hackAddress()`, copy the resulting address, and pass it as an argument to `getSize()`. It should result in a value of 10. Next, in the browser console, execute `await contract.setSolver('HACKADDRESS')`, replacing 'HACKADDRESS' with the copied `hackAddress` result.