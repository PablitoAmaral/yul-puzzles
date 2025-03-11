// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract MaxOfArray {
    function main(uint256[] memory arr) external pure returns (uint256) {
        assembly {
            // your code here
            // return the maximum value in the array
            // revert if array is empty
            let x := calldataload(0x24)
            if iszero(x){
                revert(0x00,0x00)
            }
            let y := 0
            let offset := 0x44
            for {let z := 0} lt(z,x){z:=add(z,1)}{
                if gt(calldataload(offset),y){
                    y := calldataload(offset)
                }
                offset := add(offset,0x20)
            }

            mstore(0x00,y)
            return(0x00,0x20)
        }
    }
}
