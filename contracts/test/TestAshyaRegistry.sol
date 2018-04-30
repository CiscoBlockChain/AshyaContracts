pragma solidity ^0.4.19;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../ashyaRegistry.sol";

contract TestAshyaRegistry {

	uint public initalBalance = 5 ether;

	function testInitialSetupDeployedRegistryContract() public {
		AshyaRegistry registry = AshyaRegistry(DeployedAddresses.AshyaRegistry());

		uint expected = 0;

		Assert.equal(registry.getItemCount(), expected, "registry must be empty upon creation");

		//AshyaDevice device = new AshyaDevice(DeployedAddresses.AshyaRegistry(),'Camera','BE','http://');

		//Assert.equal(registry.getItemCount(), 1, "Device must be added to registry");
		//Assert.equal(device.getUrlsCount(), 0 , "Device must not contain URLs" );

	}

}