const hre = require("hardhat");

async function main() {
  const initialURI = "ipfs://QmYourHashHere/";
  
  console.log("Deploying BaseMinter...");
  const minter = await hre.ethers.deployContract("BaseMinter", [initialURI]);

  await minter.waitForDeployment();

  console.log(`BaseMinter deployed to: ${minter.target}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
