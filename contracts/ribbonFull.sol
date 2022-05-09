/
     * @dev See {IERC721Metadata-tokenURI}.
     */
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721URIStorage: URI query for nonexistent token");

        string memory _tokenURI = _tokenURIs[tokenId];
        string memory base = _baseURI();

        // If there is no base URI, return the token URI.
        if (bytes(base).length == 0) {
            return _tokenURI;
        }
        // If both are set, concatenate the baseURI and tokenURI (via abi.encodePacked).
        if (bytes(_tokenURI).length > 0) {
            return string(abi.encodePacked(base, _tokenURI));
        }

        return super.tokenURI(tokenId);
    }

    /
     * @dev Sets _tokenURI as the tokenURI of tokenId.
     *
     * Requirements:
     *
     * - tokenId must exist.
     */
    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
        require(_exists(tokenId), "ERC721URIStorage: URI set of nonexistent token");
        _tokenURIs[tokenId] = _tokenURI;
    }

    /**
     * @dev Destroys tokenId.
     * The approval is cleared when the token is burned.
     *
     * Requirements:
     *
     * - tokenId must exist.
     *
     * Emits a {Transfer} event.
     */
    function _burn(uint256 tokenId) internal virtual override {
        super._burn(tokenId);

        if (bytes(_tokenURIs[tokenId]).length != 0) {
            delete _tokenURIs[tokenId];
        }
    }
}

// File: contracts/ribbon.sol


pragma solidity ^0.8.4;






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