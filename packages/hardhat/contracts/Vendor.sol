pragma solidity 0.8.4; //Do not change the solidity version as it negativly impacts submission grading
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

contract Vendor is Ownable {

  // Events
  event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);
  
  //Variables
  YourToken public yourToken;

  constructor(address tokenAddress) {
    yourToken = YourToken(tokenAddress);
  }

  uint256 public constant tokensPerEth = 100;

  // ToDo: create a payable buyTokens() function:
  function buyTokens() public payable {
    uint256 amountOfToken = msg.value * tokensPerEth;
    yourToken.transfer(msg.sender, amountOfToken);

    emit BuyTokens(msg.sender, msg.value, amountOfToken);
  }

  // ToDo: create a withdraw() function that lets the owner withdraw ETH
  function withdraw() public onlyOwner() {
    uint256 vendorBalance = address(this).balance;
    require(
      vendorBalance > 0,
      "Vendor has no ETH to withdraw"
    );

    payable(owner()).transfer(vendorBalance);
  }
  // ToDo: create a sellTokens(uint256 _amount) function:

}
