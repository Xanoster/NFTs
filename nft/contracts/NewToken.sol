// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract NewToken is ERC721,ERC721URIStorage {
    address public owner;
    // uint public tokenId;
    // mapping(uint256 tokenId => string) private _tokenURIs;

    constructor() ERC721("NewToken", "NTKN") {
        owner=msg.sender;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://gateway.pinata.cloud/ipfs/";
        //QmT27ZJECBeiPoFAQZYsZd4WPm2X8Xhrnhyocw7q2nb2qx
    }
    function minting_Token (address to,uint tokenId,string memory uri) public{
        require(msg.sender==owner, "you are not owner");
        // tokenIds= tokenId;
        _mint(to,tokenId);
        _setTokenURI(tokenId,uri);
    }
    function transfer_Token(address to,uint tokenId) public returns(address, uint){
        require(msg.sender==owner,"you are not owner");
        require(to!=msg.sender && to!=address(0),"to cannot be or owner ");
       

        owner=to;
        return(to,tokenId);
    }
    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
              
        return super.tokenURI(tokenId);
    }
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}