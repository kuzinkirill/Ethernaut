# Privacy

The creator of this contract was careful enough to protect the sensitive areas of its storage. Unlock this contract to beat the level.

## Solution

Similar to the task 8, to solve this level, we will need an understanding of how data is stored in storage.

The zero slot holds a boolean variable named "locked." You can inspect it by calling `web3.eth.getStorageAt(instance, 0)`  in the browser console. The value is "0x0000000000000000000000000000000000000000000000000000000000000001", which corresponds to true.

Next is a variable named `uint256 ID`, containing information about time. It also occupies an entire slot.

Following that are the variables `uint8 flattening=10`, `uint8 denomination=255` and `uint16 awkwardness`. Due to their size, they are stored in a single slot. You can call the command `web3.eth.getStorageAt(instance, 2)` to obtain the value. The value received is 0x00000000000000000000000000000000000000000000000000000000f4bcff0a, where "0a" corresponds to the hexadecimal representation of the number 10 (flattening), ff is 255 (denomination), and the remaining f4bc represents uint16 awkwardness.

Next in line is an array `bytes32[3] data`. Since each bytes32 element occupies an entire slot, each element will be stored in a separate slot. Thus, to retrieve the value of data[0], you need to call web3.eth.getStorageAt(instance, 3), and to get the value of `data[2]`, you need to call `web3.eth.getStorageAt(instance, 5)`.

Let's open Remix IDE and write a contract named `ToUint16`, in which we will create a function that allows us to convert the received information from `bytes32` to `uint16`.

Open the "DEPLOY & RUN TRANSACTIONS" tab, where in the "At Address" field, enter the instance address. Then, expand our `ToUint16` contract and call the `to16()` function, passing the copied result from `await web3.eth.getStorageAt(instance, 5)` as an argument. Copy the result of the `to16()` function and call the unlock function, passing the copied value as an argument. After this, the contract will be unlocked. You can verify this by querying the value of the `locked` variable through the Remix IDE interface.