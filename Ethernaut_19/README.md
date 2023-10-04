# Alien Codex

You've uncovered an Alien contract. Claim ownership to complete the level.

## Solution

1. In the `Ownable` contract, the owner's address is stored in the zeroth memory slot. However, in the `AlienCodex` contract, the variable `contact` is located in that position. To find out the contract owner, execute `await contract.owner()` in the browser console. In my case, the response was '0xd8d8184a9F930F8B0F7AD48F14c7437c12fADF96'.

2. Let's see what's stored in the zeroth storage slot of the `AlienCodex` contract by calling `await web3.eth.getStorageAt(instance, 0)`. The result is: '0x000000000000000000000000d8d8184a9f930f8b0f7ad48f14c7437c12fadf96'. As you can replace the last 20 bytes, it contains the owner's address.

3. Now, let's call `await contract.makeContact()`, and then check the content of the zeroth storage slot again: `await web3.eth.getStorageAt(instance, 0)`. The result is: '0x000000000000000000000001d8d8184a9f930f8b0f7ad48f14c7437c12fadf96'. As we can see, the digit 1 has appeared before the address, which corresponds to the true value of the `contact` variable.