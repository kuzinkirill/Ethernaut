# Vault

Unlock the vault to pass the level!

## Solution

It's important to remember that state variables marked as private and local variables are still publicly accessible. Therefore, we can determine the value of the password.

1. Through the console, let's call `await web3.eth.getStorageAt(instance, 0)`, where 0 is the index of the memory slot storing information about the variable `locked`. As we can observe, the value is not equal to zero. Similarly, let's call `await web3.eth.getStorageAt(instance, 1)` to retrieve the password. Copy the result

2. Next, we will call the "unlock" function, passing the password value: `await contract.unlock("0x41..")`

3. To verify that the contract is unlocked, we will once again call `await web3.eth.getStorageAt(instance, 0)`, which should now be equal to zero.

