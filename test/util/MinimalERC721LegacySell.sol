// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "src/client/token/IProtocolToken.sol";

/**
 * @title Minimal ERC721 Protocol Contract. This contract hard codes the sell action to the protocol hook.
 * @author @ShaneDuncan602, @oscarsernarosero, @TJ-Everett
 */
contract MinimalERC721LegacySell is ERC721, ERC721Burnable, ERC721Enumerable{
    using Counters for Counters.Counter;
    Counters.Counter internal _tokenIdCounter;
    address private handlerAddress;

    error ZeroAddress();
    event HEYYYY2(string text, ActionTypesLegacy action);

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {

    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize) internal override(ERC721, ERC721Enumerable)  {
        if (handlerAddress != address(0)) {
            emit HEYYYY2("_beforeTokenTransfer", ActionTypesLegacy.SELL);
            // Rule Processor Module Check
            require(IProtocolERC721HandlerSell(handlerAddress).checkAllRules(from == address(0) ? 0 : balanceOf(from), to == address(0) ? 0 : balanceOf(to), from, to, 1, tokenId, ActionTypesLegacy.SELL));
        }
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

     /**
     * @dev Function to connect Token to previously deployed Handler contract
     * @param _deployedHandlerAddress address of the currently deployed Handler Address
     */
    // slither-disable-next-line missing-zero-check
    function connectHandlerToToken(address _deployedHandlerAddress) external {
        if (_deployedHandlerAddress == address(0)) revert ZeroAddress();
        handlerAddress = _deployedHandlerAddress;
        //emit AD1467_HandlerConnected(_deployedHandlerAddress, address(this));
    }

    /**
     * @dev this function returns the handler address
     * @return handlerAddress
     */
    function getHandlerAddress() external view returns (address) {
        return handlerAddress;
    }

    
    function safeMint(address to) public payable virtual {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721Enumerable) returns (bool) {
        return ERC721Enumerable.supportsInterface(interfaceId) || super.supportsInterface(interfaceId);
    }
}

/**
 * @title Asset Handler Interface
 * @author @ShaneDuncan602 @oscarsernarosero @TJ-Everett
 * @dev This interface provides the ABI for assets to access their handlers in an efficient way
 */

interface IProtocolERC721HandlerSell {
    /**
     * @dev This function is the one called from the contract that implements this handler. It's the entry point to protocol.
     * @param balanceFrom token balance of sender address
     * @param balanceTo token balance of recipient address
     * @param _from sender address
     * @param _to recipient address
     * @param amount number of tokens transferred
     * @param _tokenId the token's specific ID
     * @param _action Action Type defined by ApplicationHandlerLib (Purchase, Sell, Trade, Inquire)
     * @return Success equals true if all checks pass
     */
    function checkAllRules(uint256 balanceFrom, uint256 balanceTo, address _from, address _to, uint256 amount, uint256 _tokenId, ActionTypesLegacy _action) external returns (bool);
}

/**
 * @title Action Enum
 * @author @ShaneDuncan602 @oscarsernarosero @TJ-Everett
 * @dev stores the possible actions for the protocol
 */
enum ActionTypesLegacy {
    PURCHASE,
    SELL,
    TRADE,
    INQUIRE
}

