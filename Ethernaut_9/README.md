# King

The contract below represents a very simple game: whoever sends it an amount of ether that is larger than the current prize becomes the new king. On such an event, the overthrown king gets paid the new prize, making a bit of ether in the process! As ponzi as it gets xD

Such a fun game. Your goal is to break it.

When you submit the instance back to the level, the level is going to reclaim kingship. You will beat the level if you can avoid such a self proclamation.

## Solution

To solve this challenge, t's necessary to write an additional contract that prevents receiving funds to it. Then, when sending for verification, an error will occur during the execution of the `receive()` function, causing the transaction to be "reverted," and the `king` will remain unchanged.

1. We will use the Remix IDE environment. Let's write a smart contract named "Hack," consisting of a single function called `sendWei`, which takes the instance address as an argument. We can't use `transfer(msg.value)` for the transaction because the `receive()` function has additional actions defined, and the 2300 gas limit won't be sufficient. Therefore, we'll use `call{value: msg.value}("")`. Additionally, we'll include a `require` check to ensure that the funds were sent successfully.

2. Open the DEPLOY & RUN TRANSACTIONS tab and access the King contract by pasting the instance address in the "At Address" field. Call "prize" in the contract to determine the minimum value required to become the King (e.g., 1000000000000000). Deploy the Hack contract, and call the `sendWei()` function within it, passing the address of the King contract as an argument, along with a VALUE value in Wei (e.g., 1000000000000001).

3. As a result, the `Hack` contract becomes the King. When attempting to verify the instance, no funds can be transferred to the `Hack` contract because it lacks the necessary functions. Therefore, the King value will remain as the address of the `Hack` contract.