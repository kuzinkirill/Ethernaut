# Fallout

To complete this level, you need to claim ownership of the contract:

## Solution

1. Here we can see a typo in the constructor function declaration of Fallout from the old version of the language. As a result, when deploying the smart contract, it doesn't work properly, and afterwards, any user can interact with it. Let's call the command:

    ```bash
    await contract.Fal1out()
    ```
    
We have successfully become the owner of the smart contract. You can verify this by calling `await contract.owner()`.