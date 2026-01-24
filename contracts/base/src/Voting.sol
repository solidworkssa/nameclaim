// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract NameRegistry {
    mapping(string => address) public nameToAddress;
    mapping(address => string) public addressToName;

    event NameClaimed(string indexed name, address indexed owner);
    event NameReleased(string indexed name, address indexed previousOwner);

    error NameTaken();
    error NameNotOwned();
    error AlreadyHasName();

    function claimName(string memory _name) external {
        require(bytes(_name).length > 0, "Name cannot be empty");
        if (nameToAddress[_name] != address(0)) revert NameTaken();
        if (bytes(addressToName[msg.sender]).length > 0) revert AlreadyHasName();

        nameToAddress[_name] = msg.sender;
        addressToName[msg.sender] = _name;

        emit NameClaimed(_name, msg.sender);
    }

    function releaseName() external {
        string memory currentName = addressToName[msg.sender];
        if (bytes(currentName).length == 0) revert NameNotOwned();

        delete nameToAddress[currentName];
        delete addressToName[msg.sender];

        emit NameReleased(currentName, msg.sender);
    }

    function isAvailable(string memory _name) external view returns (bool) {
        return nameToAddress[_name] == address(0);
    }

    function getOwner(string memory _name) external view returns (address) {
        return nameToAddress[_name];
    }
}
