// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract ribbon is ERC721, ERC721URIStorage, ERC721Burnable, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("St.-George-s-Ribbon", "Ribbon") {}

    function safeMint(address to) public {      
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        string memory uri = "https://ipfs.io/ipfs/bafybeidpywejtgvq3pohp7pt23qmp4ux2wcihnw5avxb74e5o5gf33carm/0";
        _setTokenURI(tokenId, uri);
    }

    function donate() public payable {
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function withdraw() public  payable  {
        address owner = owner();
        require(owner == msg.sender);
        address payable to = payable(msg.sender);
        to.transfer(address(this).balance);   
    }

    function transferParticipant() public payable {
        address payable to = payable(msg.sender);
        to.transfer(1000000000000000);   
    }

}