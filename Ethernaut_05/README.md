# Token

The goal of this level is for you to hack the basic token contract below.

You are given 20 tokens to start with and you will beat the level if you somehow manage to get your hands on any additional tokens. Preferably a very large amount of tokens.

## Solution

The original contract is vulnerable to a critical vulnerability present in earlier versions of the Solidity language, allowing an attacker to carry out what's known as an "integer overflow" attack.

At first glance, the condition `require(balances[msg.sender] - _value >= 0)` seems to prevent a user from transferring more tokens than they possess. However, in reality, when a larger `_value` is sent, the subtraction `balances[msg.sender] - _value` leads to an integer overflow.

Let's call `await contract.balanceOf(player)` to see the number of tokens in our wallet (initially 20). Next, let's call `await contract.totalSupply()` to see the token balance on the contract. Afterward, we will invoke the `transfer()` function, specifying any address and an amount exceeding the balance of our wallet. For example, we'll use the instance address as the recipient `_to` and set the `_value` to 21: `await contract.transfer(instance, "21")`

For clarity, you can copy the code into Remix, where in the "DEPLOY & RUN TRANSACTIONS" tab, you can open the contract by specifying the instance address in the "At Address" field. Then, call `balanceOf(_owner)`, passing your wallet's address as an argument. The resulting value turns out to be 115792089237316195423570985008687907853269984665640564039457584007913129639935, which is 2^256 - (21 - 20).