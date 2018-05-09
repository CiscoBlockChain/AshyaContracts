var ashyaRegistry = artifacts.require("AshyaRegistry");
var ashyaDevice = artifacts.require("AshyaDevice");

module.exports = function(deployer) {
  deployer.deploy(ashyaRegistry).then(function() {
    return deployer.deploy(ashyaDevice, "Camera A", "52°22'36.4\"N 4°54'15.8\"E", "https://sanas-house-of-iot.amsterdam");
  });
};


