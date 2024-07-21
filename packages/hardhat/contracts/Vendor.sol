pragma solidity 0.8.4; //Do not change the solidity version as it negativly impacts submission grading
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

contract Vendor {

  // Events
  // event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);
  
  //Variables
  YourToken public yourToken;

  constructor(address tokenAddress) {
    yourToken = YourToken(tokenAddress);
  }


  // ToDo: create a payable buyTokens() function:

  // ToDo: create a withdraw() function that lets the owner withdraw ETH
  
  // ToDo: create a sellTokens(uint256 _amount) function:

}
