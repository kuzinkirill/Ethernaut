# Preservation

This contract utilizes a library to store two different times for two different timezones. The constructor creates two instances of the library for each time to be stored. The goal of this level is for you to claim ownership of the instance you are given.

## Solution

As we can observe, the order of storing state variables in the `Preservation` and `LibraryContract` contracts does not match. Therefore, when we invoke `delegatecall()`, we will be changing not the `storedTime` variable located in the fourth memory slot of the `Preservation` contract, but the variable stored in the first slot, which is `timeZone1Library`. This is because in the `LibraryContract` contract, the storedTime variable is stored in the first slot. Let's write the `Hack` contract.

1. Let's write the `Attack()` function, which will initially call the setFirstTime function of the `Preservation` contract, thereby changing `timeZone1Library` to the address of the `Hack` contract. As a result, the `Hack` contract will act as a library.

2. Let's write a function called `setTime()`, which will take a `uint` as an input. When declaring the function, it's necessary to specify it exactly the same way as in the LibraryContract contract, in order to call it correctly using the selector. Inside the function, the `owner` address will be changed to the one passed as an argument.

3. We will enhance the `attack()` function by adding a call to the `setFirstTime()` function for the transaction sender.

As a result, within the `attack()` function, we first replace the library address with the address of the `Hack` contract. This address will be changed by the user to the `owner`'s address of the `Reservation` smart contract when calling the `setFirstTime()` function.