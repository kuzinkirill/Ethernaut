# Recovery

A contract creator has built a very simple token factory contract. Anyone can create new tokens with ease. After deploying the first token contract, the creator sent 0.001 ether to obtain more tokens. They have since lost the contract address. This level will be completed if you can recover (or remove) the 0.001 ether from the lost contract address.

## Solution

Let's copy the instance address, open goerli.etherscan.io and paste the address into the search bar. Click on the "Internal Transactions" button and navigate to the transaction hash mentioned in the "Parent Txn Hash" field. Find the "to" field where the contract address is listed. Open it in a new tab.

Let's copy the code of the task and paste it to Remix IDE. In the previous tab, under the contract address, there are 2 transactions listed. Let's click on the "to" address of the second transaction. The balance there is exactly 0.001 ETH. 
Copy the address and paste it into the "At Address" field in the "DEPLOY & RUN TRANSACTIONS" tab in Remix IDE. Make sure to select "Injected Provider" as the "ENVIRONMENT". The balance might not be displayed immediately, so you need to wait for a moment. Once the balance becomes 0.001, you can proceed with the interaction.

Now let's call the destroy() function, providing the user's wallet address as an argument