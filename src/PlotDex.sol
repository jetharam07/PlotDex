// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract PlotDexToken is ERC20 {
    constructor() ERC20("PlotDex Token", "PlotDex") {
        _mint(msg.sender, 100000 * 10 ** 18);
    }
}
