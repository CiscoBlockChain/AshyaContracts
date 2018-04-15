pragma solidity ^0.4.19;

contract AshyaDevice {

  // The address must match the one of the newly created AshyaRegistry Contract
address constant AshyaRegistryAddress=0x692a70d2e424a56d2c6c27aa97d1a86395877b3a;
string[] urls;

function AshyaDevice(string name, string location, string url) public payable {
    AshyaRegistry DeviceObj = AshyaRegistry(AshyaRegistryAddress);
    DeviceObj.addItem(name,location,url);  }

function addUrl(string url) public {
    urls.push(url);}

function getUrlsCount()public constant returns (uint count){
    return urls.length;}

}
