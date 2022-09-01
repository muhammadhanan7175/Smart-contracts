pragma solidity ^0.5.3;
contract Lottery{
    address owner;
    address payable[] public players;
    constructor() public{
        owner=msg.sender;
    }
    function deposit_ether() public payable{
        require(msg.value >= 1 ether);
        players.push(msg.sender);
    }
    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(now,block.difficulty,players.length)));
    }
    function pickWinner()  public{        uint randomNumber = random();        uint index = randomNumber % players.length;       address payable winner;                winner = players[index];                winner.transfer(address(this).balance);                players = new address payable [](0);    }
    }