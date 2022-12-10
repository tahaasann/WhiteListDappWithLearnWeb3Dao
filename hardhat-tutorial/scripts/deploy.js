const { ethers } = require("hardhat");

async function main() {
  /*
  A ContractFactory in ethers.js is an abstraction used to deploy new smart contracts,
  so whitelistContract here is a factory for instances of our Whitelist contract.
  */
 /* 
 ethers.js'deki bir ContractFactory, yeni akıllı sözleşmeleri dağıtmak için kullanılan bir soyutlamadır. bu nedenle beyaz liste Sözleşmesi, Beyaz Liste sözleşmemizin örnekleri için bir fabrikadır.
 */
const whitelistContract = await ethers.getContractFactory("Whitelist");

// here we deploy the contract
// burada sözleşmeyi dağıtıyoruz
const deployedWhitelistContract = await whitelistContract.deploy(10);
// 10 is the maximum number of whitelisted addresses allowed
// 10 beyaz listede adreslerin maksimum sayısıdır

// Wait for it to finish deploying
// Dağıtımını tamamlamasını bekleyin
await deployedWhitelistContract.deployed();

// print the address of the deployed contract
// dağıtılan sözleşmenin adresini yazdırın
console.log("Whitelist Contract Address:", deployedWhitelistContract.address);
}

// Call the main function and catch if there is any error
// Ana işlevi çağırın ve herhangi bir hata varsa yakalayın
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });