// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract RevertWithError {
    function main() external pure {
        assembly {
            // revert the function with an error of type `Error(string)`
            // use "RevertRevert" as error message
            // Hint: The error type is a predefined four bytes. See https://www.rareskills.io/post/try-catch-solidity
            let hexString := "RevertRevert" // String curta inline (máx 32 bytes)
            mstore(
                0x00,
                0x08c379a000000000000000000000000000000000000000000000000000000000
            ) // Error(string) signature
            //cast sig "Error(string)" -> 0x08c379a0
            mstore(0x04, 0x20) // -> The offset
            mstore(0x24, 0x0c) // -> lenght
            mstore(0x44, hexString) // Armazena a string na memória, ja fica left padded
            revert(0x00, 0x64) // retorna tudo armazenado
        }
    }
}
