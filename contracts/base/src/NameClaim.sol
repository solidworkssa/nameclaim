// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title NameClaim Contract
/// @notice Decentralized name registration and resolution.
contract NameClaim {

    struct NameRecord {
        address owner;
        string data;
        uint256 expiration;
    }
    
    mapping(string => NameRecord) public names;
    uint256 public constant REGISTRATION_FEE = 0.001 ether;
    uint256 public constant DURATION = 365 days;
    
    function register(string memory _name) external payable {
        require(msg.value >= REGISTRATION_FEE, "Insufficient fee");
        require(names[_name].expiration < block.timestamp, "Name taken");
        
        names[_name] = NameRecord({
            owner: msg.sender,
            data: "",
            expiration: block.timestamp + DURATION
        });
    }
    
    function setData(string memory _name, string memory _data) external {
        require(names[_name].owner == msg.sender, "Not owner");
        require(names[_name].expiration > block.timestamp, "Expired");
        names[_name].data = _data;
    }

}
