pragma solidity 0.8.4; //Do not change the solidity version as it negativly impacts submission grading
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

contract Vendor is Ownable {

  // Events
  event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);
  event SellTokens(address seller, uint256 amountOfTokens, uint256 amountOfETH);

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
  function sellTokens(uint256 amount) public {
    require(
      yourToken.balanceOf(msg.sender) >= amount,
      "Insufficient token balance"
    );

    uint256 amountOfEth = amount / tokensPerEth;
    require(
      address(this).balance >= amountOfEth,
      "Vendor has insufficient ETH"
    );

    yourToken.transferFrom(msg.sender, address(this), amount);
    payable(msg.sender).transfer(amountOfEth);

    emit SellTokens(msg.sender, amount, amountOfEth);
  }
}
