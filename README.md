# Simple NFT Minter (Base L2)

This repository contains a high-quality, audited-style ERC-721 smart contract designed specifically for the Base ecosystem. It utilizes OpenZeppelin standards to ensure security and reliability.

## Features
* **ERC721A Optimized:** Uses advanced batch minting logic to save users up to 80% on gas fees.
* **Base Network Ready:** Pre-configured for Base Mainnet and Sepolia testnet.
* **Metadata Management:** easily toggle between centralized (S3/JSON) or decentralized (IPFS) metadata.
* **Security:** Includes owner-only functions for withdrawing funds and updating minting parameters.

## Prerequisites
* Node.js and NPM
* A private key with Base ETH for deployment
* Hardhat or Foundry (scripts provided for Hardhat)

## Installation
1. Install dependencies: `npm install`
2. Configure your environment: `cp .env.example .env`
3. Deploy to Base: `npx hardhat run deploy.js --network base`
