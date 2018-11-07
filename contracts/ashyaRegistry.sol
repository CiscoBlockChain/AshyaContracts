pragma solidity ^0.4.19;

contract AshyaRegistry {

    uint price = 0.01 ether;
    struct item {
        string name;
        string url;
        string location;
        address ownerAddress;
        uint index;
    }
    mapping(address => item) itemList;
    address[] itemIndex;

    modifier CheckPrice()
    {
        require(msg.value >= price);
        _;
    }
    modifier onlyBy(address _itemAddress)
    {
        require(msg.sender == _itemAddress);
        _;
    }
   
    // Only let it add if it has not yet been added. 
    modifier canAdd(string _name, string _url, string _location) 
    {
        bool newItem = true;
        for(uint i = 0; i < getItemCount(); i++){
            address itemAddress = getItemAtIndex(i);
            if ((keccak256(itemList[itemAddress].name) == keccak256(_name)) && (keccak256(itemList[itemAddress].location) == keccak256(_location)) && (keccak256(itemList[itemAddress].url) == keccak256(_url))) {
                newItem = false;
            }
        }
        require(newItem);
        _;
    }

    function AshyaRegistry()public{
        itemIndex.length = 0;
        
    }
    
    function getItemCount()public constant returns(uint count){
        return itemIndex.length;
    }

    function addItem(string _name, string _location, string _url) public payable CheckPrice canAdd(_name,_location,_url){
        itemList[msg.sender].name = _name;
        itemList[msg.sender].location = _location;
        itemList[msg.sender].url = _url;
        itemList[msg.sender].index = itemIndex.push(msg.sender)-1;
    }

    function removeItem(address _itemAddress)public onlyBy(_itemAddress){
        uint rowToDelete = itemList[_itemAddress].index;
        address keyToMove = itemIndex[itemIndex.length-1];
        itemIndex[rowToDelete] = keyToMove;
        itemList[keyToMove].index = rowToDelete;
        itemIndex.length--;
    }

    function getItem(address itemAddress)public constant returns(string name, string location, string url, uint index) {
        return(itemList[itemAddress].name,itemList[itemAddress].location,itemList[itemAddress].url,itemList[itemAddress].index);
    }

    function getItemAtIndex(uint index) public constant returns(address itemAddress) {
        return itemIndex[index];
        
    }
}
