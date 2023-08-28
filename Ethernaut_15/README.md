# Naught Coin

NaughtCoin is an ERC20 token and you're already holding all of them. The catch is that you'll only be able to transfer them after a 10 year lockout period. Can you figure out how to get them out to another address so that you can transfer them freely? Complete this level by getting your token balance to 0.

## Solution

Let's copy the smart contract code into Remix IDE. Then, go to the DEPLOY & RUN TRANSACTIONS tab, make sure "Injected Provider" is selected under ENVIRONMENT, and paste the instance address in the "At address" field. Next, call the balanceOf function, providing the address of your wallet.

1. We can observe that in the `NaughtCoin` contract, only the `transfer()` function is overridden, but not the `transferFrom()` function. Let's write the `Hack` contract.

2. Let's write the `balanceToken()` function that will return the amount of tokens on a user's balance. 

3. Next, we will write the `transferToken()` function, inside which we will call the `transferFrom()` function.

4. Let's deploy the Hack contract by providing the instance address in the constructor. Then, we will call the `balanceToken()` function within it. After that, we will invoke the `approve()` function of the `NaughtCoin` smart contract, passing the `Hack` contract's address as the "spender" and the value obtained from `balanceToken()` as the "amount".

5. After that, we will call the `transferToken()` function of the Hack contract, passing any address as the `_to` parameter (it doesn't matter which address, as the goal is simply to withdraw the locked tokens). To ensure that everything worked correctly, we will call `balanceToken()` again, and the result should be zero.