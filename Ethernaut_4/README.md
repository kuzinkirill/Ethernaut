# Telephone

You need to claim ownership of the contract below to complete this level.

To perform this task, let's use the Remix IDE.

In this case, the vulnerability lies in the usage of `tx.origin`, which returns the address of the account initiating the transaction. Consequently, when calling the `changeOwner()` function through an external smart contract, the address of that external smart contract will be determined as the `msg.sender`. This means that the condition `tx.origin != msg.sender` will be satisfied, and the owner's address will be changed.

Let's copy the instance address and paste it into the "At address" field in the "DEPLOY & RUN TRANSACTIONS" tab, selecting the `Telephone` contract. Next, paste the instance address and deploy the `Hack` contract. By calling the changeTelephoneOwner() function, we will change the owner's address of the original smart contract to our wallet's address.