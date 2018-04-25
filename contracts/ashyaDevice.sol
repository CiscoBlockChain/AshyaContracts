pragma solidity ^0.4.19;

contract AshyaDevice{
    address AshyaRegistryAddress= 0x35ef07393b57464e93deb59175ff72e6499450cf;
    string[] urls;
    uint AddingPrice = 0.0010 ether;
    address public owner = msg.sender;
    
    modifier CheckPrice(){
        require(msg.value == AddingPrice);
        _;
    }

    function AshyaDevice(string name, string location, string url)public payable CheckPrice() {
        AshyaRegistry deviceObj = AshyaRegistry(AshyaRegistryAddress);
        deviceObj.addItem.value(AddingPrice)(name,location,url);
    
    }
    function AddUrl(string url)public payable CheckPrice(){
        urls.push(url);
        
    }
    function getUrlsCount()public constant returns(uint count) {
        return urls.length;
        
    }
}