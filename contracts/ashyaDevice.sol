pragma solidity ^0.4.19;

contract AshyaDevice {

    // The address must match the one of the newly created AshyaRegistry Contract
    address constant AshyaRegistryAddress=0x9dd1e8169e76a9226b07ab9f85cc20a5e1ed44dd;

    function AshyaDevice(string name, string location, string url, address ownerAddress) public payable {
        AshyaRegistry DeviceObj = AshyaRegistry(AshyaRegistryAddress);
        return DeviceObj.addItem(name,location,url, address(this), ownerAddress);  }

    function addNewUrl(string url) public {
        AshyaRegistry DeviceObj = AshyaRegistry(AshyaRegistryAddress);
        DeviceObj.addUrl(address(this), url);
    }

    function removeUrl(string url) public {
        AshyaRegistry DeviceObj = AshyaRegistry(AshyaRegistryAddress);
        DeviceObj.removeUrl(address(this), url);
    }
}
