
pragma solidity ^0.8.0;

contract Lottery {

    
    address public firstPrizeWinner;
    address public secondPrizeWinner;
    address public thirdPrizeWinner;

    uint public randomNumber;
    event LotteryDrawn(uint winningNumber, address firstPrizeWinner, address secondPrizeWinner, address thirdPrizeWinner);

   
    function drawLottery() public {
      
        uint lotteryNumber = uint(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, msg.sender))) % 1000;
        randomNumber = lotteryNumber; 
        firstPrizeWinner = address(0);
        secondPrizeWinner = address(0);
        thirdPrizeWinner = address(0);
        
        
        if (lotteryNumber % 3 == 0 && lotteryNumber % 5 == 0) {
            firstPrizeWinner = msg.sender; 
        }
        
        else if (lotteryNumber % 7 == 0 || lotteryNumber % 11 == 0) {
            secondPrizeWinner = msg.sender; 
        }
        
        else if (lotteryNumber % 5 == 0 && lotteryNumber % 10 != 0) {
            thirdPrizeWinner = msg.sender; 
        }

        
        emit LotteryDrawn(lotteryNumber, firstPrizeWinner, secondPrizeWinner, thirdPrizeWinner);
    }

    function getFirstPrizeWinner() public view returns (address) {
        return firstPrizeWinner;
    }

   
    function getSecondPrizeWinner() public view returns (address) {
        return secondPrizeWinner;
    }

    
    function getThirdPrizeWinner() public view returns (address) {
        return thirdPrizeWinner;
    }

    
    function getRandomNumber() public view returns (uint) {
        return randomNumber;
    }
}