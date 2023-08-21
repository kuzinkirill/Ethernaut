# Fallback

To complete this level, you need to:

    1. claim ownership of the contract
    2. reduce its balance to 0

## Solutions

1. We will perform this task using the console. As a first step, let's check who the current owner of the smart contract is: 

    ```bash
    await contract.owner()
    ```

Next, you will be presented with the address of the current smart contract owner.

2. The next step is to call the contribute() function of the contract, specifying a value less than 0.001 ETH:

    ```bash
    await contract.contribute({value: toWei("0.0009")})
    ```

By doing so, we have recorded our wallet address in the `mapping(address => uint) contributions`. You can confirm this by calling `await contract.contributions(player)`.

3. Subsequently, we are given the opportunity to send funds (value) to this contract since `contributions[player] > 0`. Let's execute the command:

    ```bash
    await sendTransaction({from: player, to: instance, value: toWei("0.0001")})
    ```

As you can observe, in the `receive()` function, after the `require` block, the contract owner is reassigned. You can confirm that you've successfully become the new owner by calling `await contract.owner()`. The result will be your address.

4. Now that you have become the owner of the smart contract, you can access the `withdraw()` function, which is only available to the owner: 

    ```bash
    await contract.withdraw()
    ```

Congratulations! After successfully executing the transaction, you can submit the instance for verification.