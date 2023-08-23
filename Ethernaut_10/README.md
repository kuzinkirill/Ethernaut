# Re-entrancy

The goal of this level is for you to steal all the funds from the contract.

## Solution

As you can observe, when the `withdraw()` function is called in the `Reentrance` contract, the sender's balance changes after sending funds. Furthermore, the transaction is initiated using the `call()` method, which, unlike `transfer()`, doesn't have the 2300 gas limit restriction, thereby creating a vulnerability for an attack. Let's open the Remix IDE and write the Hack contract.

The constructor takes an address that we intend to attack. The contract's owner is set as the wallet initiating the transaction.

1. First, the `attack()` function will call `donate()` with the passed msg.value: reentrance.donate{value: msg.value}(address(this)). The balance of the target contract is 0.001 Eth (you can verify this by calling `await getBalance(instance)` in the browser console). For convenience and clarity, let's choose `msg.value` to be 10 times smaller and convert it to Wei using `toWei("0.0001")`.

2. Next, in the `attack()` function, the `withdraw()` function will be called, which uses `call()` to send funds to the sender's address (in our case, the `Hack` contract). Since no data is passed in `call()`, the `receive()` function in our `Hack` contract will be triggered, in which we call the `withdraw()` function again.

3. As long as the `msg.value` we're passing is smaller than the balance of the target smart contract, we continue to pass it. Once the balance becomes smaller than msg.value, we transfer the entire remaining balance. After the target contract's balance is zeroed, the `selfdestruct()` function is called in the Hack contract, sending all funds to the initiator's wallet executing attack().
