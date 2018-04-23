contract AshyaDevice{
    address AshyaRegistryAddress= 0x75a3a98f5696299071da253c1433a2661898103e;
    string[] urls;
    uint AddingPrice = 0.0010 ether;
    address public owner = msg.sender;
    
    modifier CheckPrice()
    {
        require(msg.value == AddingPrice);
        _;
    }

function AshyaDevice(string name, string location, string url)public payable CheckPrice
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

function getOwnerAddress() public constant returns(address owner){
    return owner;
} 


}
