# Force

The goal of this level is to make the balance of the contract greater than zero.

## Solution

Let's use Remix IDE. This task cannot be solved using traditional methods, as the contract lacks `receive()` or `callback()` functions. This task can be resolved by creating another smart contract and calling `selfdestruct(_addr)` within it, passing the address of the contract to which we need to send the funds as an argument.

1. Let's create a contract named Solution, in which we'll define a constructor that takes the address of the Force contract as an argument. We will also mark it as payable so that we can send funds during the smart contract's creation. Inside the constructor, we'll call selfdestruct(payable(_force)), which will send the funds to the address of the Force contract upon contract destruction.

2. Navigate to the DEPLOY & RUN TRANSACTIONS tab, where in the "At address" field, enter the instance address. Next, deploy the Solution contract by specifying the instance address and a non-zero VALUE. In the Remix IDE, you will observe a change in the balance of the Force contract. To confirm, you can also call await getBalance(instance) in the browser console.