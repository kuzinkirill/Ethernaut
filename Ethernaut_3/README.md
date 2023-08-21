# Coin Flip

This is a coin flipping game where you need to build up your winning streak by guessing the outcome of a coin flip. To complete this level you'll need to use your psychic abilities to guess the correct outcome 10 times in a row.

## Solution

If attempting to solve the problem "head-on" by calling the `flip()` function of the original smart contract with the presumed value, achieving successful execution 10 times in a row is very difficult and time-consuming. Therefore, let's write another smart contract called `Prediction` that will interact with the CoinFlip contract. To perform this task, let's use the Remix IDE.

The function `getPrediction()` will provide the user with a prediction of the outcome.
The function `getWin()` will interact with the original smart contract, passing the value predicted by the `getPrediction()` function as an argument.
Next, go to the "DEPLOY & RUN TRANSACTIONS" tab, connect your crypto wallet, and in the "At address" field, insert the address of our instance. Then deploy the `Prediction` contract, specifying the address of the `CoinFlip` contract. After this, call the `getWin()` function in the `Prediction` smart contract 10 times. You can verify the successful execution by checking the `consecutiveWins` variable. When the value becomes "10," you can submit the instance for verification.