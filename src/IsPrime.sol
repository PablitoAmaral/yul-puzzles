// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract IsPrime {
    function main(uint256 x) external pure returns (bool) {
        assembly {
            // your code here
            // return true if x is a prime number, else false
            // 1. check if the number is a multiple of 2 or 3
            // 2. loop from 5 to x / 2 to see if it is divisible
            // 3. increment the loop by 2 to skip the even numbers

            if or(iszero(x), eq(x, 1)) {
                mstore(0x00, 0x00)
                return(0x00, 0x20)
            }
            if or(eq(x, 2), eq(x, 3)) {
                mstore(0x00, 1)
                return(0x00, 0x20)
            }
            // Eliminar múltiplos de 2 ou 3
            if or(iszero(mod(x, 2)), iszero(mod(x, 3))) {
                mstore(0x00, 0)
                return(0x00, 0x20)
            }
            // Loop para testar divisibilidade até x / 2
            let i := 5 // Começa em 5
            let limit := div(x, 2) // Máximo até x/2

            for {

            } lt(i, limit) {
                i := add(i, 2)
            } {
                if iszero(mod(x, i)) {
                    // Se for divisível, não é primo
                    mstore(0x00, 0)
                    return(0x00, 0x20)
                }
            }

            // Se passou em todos os testes, é primo
            mstore(0x00, 1)
            return(0x00, 0x20)
        }
    }
}
