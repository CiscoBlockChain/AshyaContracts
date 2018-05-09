var AshyaDevice = artifacts.require("AshyaDevice");
var AshyaRegistry = artifacts.require("AshyaRegistry");

contract(AshyaDevice, function(accounts) {

  /* from: https://ethereum.stackexchange.com/questions/38756/how-to-test-contract-functions-with-onlyowner-modifier */ 
  let instance
  let owner = accounts[0]
  let otherAccount = accounts[1]

  beforeEach(async () => {
    device = await AshyaDevice.deployed()
    registry = await AshyaRegistry.deployed()
  })


  it("should register the device", async () => {
    try {
      //let result = await device.registerDevice.call({from: owner, value: web3.toWei(0.001, "ether")})
      let rAddr = registry.address;
      let result = await device.registerDevice(rAddr, {from: owner, value: 10000000000000, gas: 4712388, gasPrice: 100000000000})
      //console.log(result.toString())
      //assert.equal(result.toString(), owner)
    } catch (e) {
      console.log('failed')
      assert.fail(null, null, `${e}`)
    }
  })
})
