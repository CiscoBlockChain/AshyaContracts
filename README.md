# Ashya Registry

Smart Contracts for Ashya Project

We have two contracts here:

* Ashya Registry (used by the server)
* Ashya Device (used by the devices)

Each device initializes with a device contract that automatically registers it with the Registry.  The Registry advertises the existing devices.

Another Repository AshyaServer holds the server code that interacts and displays the Ashya Registry Smart contract


## Testing on the Console

```
truffle develop
```
You'll then be put on the truffle development console.  Now load the contract

```
migrate --reset --recompile-all
```

Now get information about the device: 

```
d = AshyaDevice.deployed()
d.then(i => i.owner().then(console.log))
```
(or: ```d.then(i => i.owner())```)

This will give you the output of the owner of the contract.

Get info about the registry:

```
r = AshyaRegistry.deployed()
```
Then get the address of the registry: 

```
var rAddr 
r.then( i => rAddr = i.address)
```
Now we can register the device

```
d.then(i => i.registerDevice(rAddr, {from: accounts[0], value: 1100000000000, gas: 4712388, gasPrice: 100000000000}))
```


Get all the accounts:

```
var accounts
web3.eth.getAccounts((err, a) => accounts = a)
```

Add a URL to the Device: 

```
d.then(i => i.addURL("https://benincosa.com", { value: 1000000000000000, from: accounts[3], gas: 4712388, gasPrice: 100000000000 }))
```

Get the URL count

```
d.then(i => i.getURLCount())
```

You should see that one was added.  

Close the truffle environment

```
.exit
```

## CI/CD

Set the Drone file information

```
drone secret add -repository CiscoBlockChain/AshyaRegistry -image vallard/drone-spark -name SPARK_TOKEN -value $ASHYA_TOKEN
drone secret add -repository CiscoBlockChain/AshyaRegistry -image vallard/drone-spark -name SPARK_ROOM -value $ASHYA_SPARKROOM
```