// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract BaseMinter is ERC721, Ownable {
    using Strings for uint256;

    uint256 public constant MAX_SUPPLY = 1000;
    uint256 public constant MINT_PRICE = 0.001 ether;
    uint256 private _nextTokenId;
    string public baseTokenURI;

    constructor(string memory _initialURI) ERC721("BaseMinter", "BM") Ownable(msg.sender) {
        baseTokenURI = _initialURI;
    }

    function mint() public payable {
        require(msg.value >= MINT_PRICE, "Insufficient ETH sent");
        require(_nextTokenId < MAX_SUPPLY, "Sold out");

        uint256 tokenId = _nextTokenId;
        _nextTokenId++;
        _safeMint(msg.sender, tokenId);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseTokenURI;
    }

    function setBaseURI(string memory _newURI) public onlyOwner {
        baseTokenURI = _newURI;
    }

    function withdraw() public onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }
}
