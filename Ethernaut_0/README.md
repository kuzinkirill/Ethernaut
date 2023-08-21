# Hello Ethernaut

Follow the steps below to complete the task based on the provided instructions. We'll continue the process after executing the command `await contract.info()` (Step 9 in the task instructions on the website). After calling this command, we receive 'You will find what you need in info1()'.

1. Learn about the contract's ABI using the `contract` command.

2. Enter the following command in the console:

    ```bash
    await contract.info1()
    ```

    The output will be `'Try info2(), but with "hello" as a parameter.'

3. Input the following command:

    ```bash
    await contract.info2("hello")
    ```

    The console will display `'The property infoNum holds the number of the next info method to call.'

4. Call the following command:

    ```bash
    await contract.infoNum()
    ```

    Examine the result, and you'll see the string: `words: (2) [42, empty]`. The number 42 is what we need. Find the `info42` method in the contract's ABI.

5. Execute the following command:

    ```bash
    await contract.info42()
    ```

    You will see `'theMethodName is the name of the next method.'

6. Run the following command:

    ```bash
    await contract.theMethodName()
    ```

    The output will be `"The method name is method7123949."

7. Enter the following command:

    ```bash
    await contract.method7123949()
    ```

    The result will be `"If you know the password, submit it to authenticate()."`

8. Locate the `password` method in the contract's ABI and call it:

    ```bash
    await contract.password()
    ```

    You'll receive the password `"ethernaut0."`

9. Proceed to call `authenticate`, providing the corresponding password:

    ```bash
    await contract.authenticate("ethernaut0")
    ```

    Sign the transaction in your crypto wallet.

10. After executing the transaction, submit the instance for verification by clicking "Submit instance" and signing the message using your crypto wallet.

11. You'll receive a notification of successful completion and the smart contract code you interacted with. For a more detailed examination, you can copy this code into Remix and replicate the interaction.
 
    In this case, go to the "Deploy & Run TRANSACTIONS" tab, deploy the contract, selecting the environment as "Remix VM" with any of the provided accounts. Interaction can be done from the deploying account or any other account.
 
    Alternatively, you can interact with it from your crypto wallet by choosing "Injected Provider" as the environment, and paste the instance address in the "At address" field. In this scenario, deployment isn't required; just click the "At address" button after entering the instance address. You'll then be able to interact with the contract. 
