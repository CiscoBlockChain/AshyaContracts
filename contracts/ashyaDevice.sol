pragma solidity ^0.4.19;

contract AshyaDevice{
    address AshyaRegistryAddress= 0x8609a0806279c94bcc5432e36b57281b3d524b9b;
    string[] urls;
    uint AddingPrice = 0.0010 ether;
    modifier CheckPrice()
    {
        require(msg.value == AddingPrice);
        _;
    }

function AshyaDevice(string name, string location, string url)public payable
{
    AshyaRegistry deviceObj = AshyaRegistry(AshyaRegistryAddress);
    deviceObj.addItem.value(AddingPrice)(name,location,url);
}
function AddUrl(string url)public payable CheckPrice
{
    urls.push(url);
}
function getUrlsCount()public constant returns(uint count)
{
    return urls.length;
}


}
