pragma solidity 0.8.10;

contract cityPoll {
    
    struct City {
        string cityName;
        uint256 vote;
        //you can add city details if you want
    }


    mapping() public cities; //mapping city Id with the City ctruct - cityId should be uint256
    mapping() hasVoted; //mapping to check if the address/account has voted or not

    address owner;
    uint256 public cityCount = 0; // number of city added
    constructor() public {
    owner = msg.sender;
    addCity("Butwal");
    }
 
 
    function addCity(string memory _cityName) public {
      require(msg.sender == owner, "Access Denied");
      cities[cityCount].cityName = _cityName;
      cityCount++;

    }
    
    function voteCity(uint256 _id) public {
        require(!hasVoted[msg.sender], "Already Voted");
        cities[_id].vote ++;
        hasVoted[msg.sender] = true;

    }
    function getCity(uint256 _id) public view returns (string memory) {
     return cities[_id].cityName;
    }
    function getVote() public view returns (uint256) {
        return cities[_id].vote;
    }
}