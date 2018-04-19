pragma solidity ^0.4.19;
contract AshyaRegistry{

    uint price = 0.0010 ether;
    struct item{
        string name;
        string url;
        string location;
        address ownerAddress;
        uint index;
    }
    mapping(address => item) itemList;
    address[] itemIndex;


    modifier CheckPrice()
    {require(msg.value == price);
        _;
    }
    modifier onlyBy(address _itemAddress)
    {
        require(msg.sender == itemList[_itemAddress].ownerAddress|| msg.sender== address(this));
        _;
    }

function AshyaRegistry()public
{
    itemIndex.length =0;
}
function getItemCount()public constant returns(uint count)
{
    return itemIndex.length;
}
function addItem(string name, string url, string location) public payable CheckPrice
{
        itemList[msg.sender].name = name;
        itemList[msg.sender].location = location;
        itemList[msg.sender].url= url;
        itemList[msg.sender].ownerAddress= msg.sender;
        itemList[msg.sender].index = itemIndex.push(msg.sender)-1;


}
function removeItem(address _itemAddress)public onlyBy(_itemAddress)
{
    uint rowToDelete = itemList[_itemAddress].index;
    address keyToMove = itemIndex[itemIndex.length-1];
    itemIndex[rowToDelete] = keyToMove;
    itemList[keyToMove].index = rowToDelete;
    itemIndex.length--;
}
function getItem(address itemAddress)public constant returns(string name, string location, string url, address add, uint index)
{
    return(itemList[itemAddress].name,itemList[itemAddress].location,itemList[itemAddress].url,itemList[itemAddress].ownerAddress,itemList[itemAddress].index);
}
function getItemAtIndex(uint index) public constant returns(address itemAddress) {
    return itemIndex[index];}
}
