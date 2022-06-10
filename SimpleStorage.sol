// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    uint256 public favouriteNumber;

    // People public person = People({
    //     favouriteNumber: 24,
    //     name: "Ibrar"
    // });

    struct People {
        uint256 favouriteNumber;
        string name;
    }

    People[] public people;

    mapping(string => uint256) public nameToFavouriteNumber;

    function store(uint256 _favouriteNumber) public virtual {
        favouriteNumber = _favouriteNumber;
    }

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        People memory newPerson = People({
            favouriteNumber: _favouriteNumber,
            name: _name
        });
        people.push(newPerson);
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favouriteNumber;
    }
}
