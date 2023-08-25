# Gatekeeper One

Make it past the gatekeeper and register as an entrant to pass this level

## Solution

1. To pass the first modifier, it is required that `tx.origin` is not equal to `msg.sender`. Thus, we will create a new contract named `Hack` through which we will interact with the `GatekeeperOne` contract. In this way, tx.origin will become the initiator of the transaction, and the role of msg.sender will be played by the `Hack` smart contract.

2. Before we proceed to understand the second modifier, let's solve the third one.

The `bytes8(_gateKey)` is represented as 0x B0 B1 B2 B3 B4 B5 B6 B7, where Bi represents numbers from 0 to 255 in HEX format.

To satisfy the condition `uint32(uint64(_gateKey)) == uint16(uint64(_gateKey))`, we need B4 B5 B6 B7 to be equal to B6 B7, which means B4 = B5 = 00.

Similarly, to satisfy the condition `uint32(uint64(_gateKey)) != uint64(_gateKey)`, B0, B1, B2, and B3 must not be equal to zero.

An address occupies 20 bytes. To satisfy the condition `uint32(uint64(_gateKey)) == uint16(uint160(tx.origin))`, it is necessary for the last 2 bytes of the address (let's call them A18 and A19) to be equal to B4 B5 B6 B7 of the sought `_gateKey`. Since we know that B4 = B5 = 00, then B6 = A18 and B7 = A19.

Therefore, the `key = bytes8(uint64(uint160(address(msg.sender)))) & 0x123456780000FFFF`, where `0x123456780000FFFF` is a mask in which you can use any non-zero values instead of 12345678, and FFFF at the end will retain the value of the last two bytes of the wallet address when the & operation is executed.

I recommend copying the code of the `GatekeeperOne` contract into Remix IDE and removing the `gateTwo` modifier from the `enter()` function to ensure the correct passing of modifiers 1 and 3.

3. You can't guess the number because you would need to translate all the Solidity code in EVM opcodes, calculate the gas consumed by each of them and waste ton of times. You also need to remember that gas cost could differ depending on which Solidity compiler version has been used to compile the code into bytecode and which compile flags has been used during this process. It's a mess. 

That's why we'll try to find the right amount of gas by brute-forcing it in a loop. Once the correct value is found, the transaction will be executed.