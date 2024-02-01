pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts@5.0.1/token/ERC20/ERC20.sol";
import {Ownable} from "./Ownable.sol"; // This is scraped form openzepplin with renounceOwnership function disabled.
import {ERC20Permit} from "@openzeppelin/contracts@5.0.1/token/ERC20/extensions/ERC20Permit.sol";

contract BullTToken is ERC20, Ownable, ERC20Permit {
    constructor(
        address initialOwner
    )
        ERC20("New Zealand Bull T Token", "NZUC")
        Ownable(initialOwner)
        ERC20Permit("New Zealand Bull T Token")
    {}

    function mint(uint256 amount) public onlyOwner {
        _mint(owner(), amount * 10 ** decimals()); //only mint in whole units to the contract owner. Contract owner must transfer to depositors.
    }

    function burn(uint256 amount) public onlyOwner {
        _burn(owner(), amount * 10 ** decimals()); //only burn in whole units.
    }
}
