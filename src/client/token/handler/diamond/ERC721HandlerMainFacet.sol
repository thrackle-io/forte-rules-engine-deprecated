// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.24;

import "src/client/token/handler/common/HandlerUtils.sol";
import "src/client/token/handler/ruleContracts/HandlerBase.sol";
import "src/client/token/handler/ruleContracts/NFTValuationLimit.sol";
import "src/client/token/handler/diamond/ERC721TaggedRuleFacet.sol";
import "src/client/token/handler/diamond/ERC721NonTaggedRuleFacet.sol";
import "src/client/application/IAppManager.sol";
import {ICommonApplicationHandlerEvents} from "src/common/IEvents.sol";
import {ERC165Lib} from "diamond-std/implementations/ERC165/ERC165Lib.sol";
import {IHandlerDiamondErrors} from "src/common/IErrors.sol";
import "diamond-std/implementations/ERC173/ERC173.sol";

contract ERC721HandlerMainFacet is HandlerBase, HandlerUtils, ICommonApplicationHandlerEvents, NFTValuationLimit, IHandlerDiamondErrors {
    
    string private constant VERSION="2.2.0";
    
    /**
     * @dev Initializer params
     * @param _ruleProcessorProxyAddress of the protocol's Rule Processor contract.
     * @param _appManagerAddress address of the application AppManager.
     * @param _assetAddress address of the controlling asset.
     */
    function initialize(address _ruleProcessorProxyAddress, address _appManagerAddress, address _assetAddress) external onlyOwner {
        InitializedS storage ini = lib.initializedStorage();
        if (ini.initialized) revert AlreadyInitialized();
        HandlerBaseS storage data = lib.handlerBaseStorage();
        HandlerVersionS storage versionData = lib.handlerVersionStorage();
        if (_appManagerAddress == address(0) || _ruleProcessorProxyAddress == address(0) || _assetAddress == address(0)) revert ZeroAddress();
        data.appManager = _appManagerAddress;
        data.ruleProcessor = _ruleProcessorProxyAddress;
        data.assetAddress = _assetAddress;
        lib.nftValuationLimitStorage().nftValuationLimit = 100;
        data.lastPossibleAction = 5;
        ini.initialized = true;
        versionData.version = VERSION;
        callAnotherFacet(0xf2fde38b, abi.encodeWithSignature("transferOwnership(address)", _assetAddress));
    }

    /**
     * @dev This function is the one called from the contract that implements this handler. It's the entry point.
     * @notice This function is called without passing in an action type.
     * @param balanceFrom token balance of sender address
     * @param balanceTo token balance of recipient address
     * @param _from sender address
     * @param _to recipient address
     * @param _sender the address triggering the contract action
     * @param _tokenId id of the NFT being transferred
     * @return true if all checks pass
     */
    function checkAllRules(uint256 balanceFrom, uint256 balanceTo, address _from, address _to, address _sender, uint256 _tokenId) external onlyOwner returns (bool) {
        return _checkAllRules(balanceFrom, balanceTo, _from, _to, _sender, _tokenId, ActionTypes.NONE);
    }

    /**
     * @dev This function is the one called from the contract that implements this handler. It's the legacy entry point. This function only serves as a pass-through to the active function.
     * @param _balanceFrom token balance of sender address
     * @param _balanceTo token balance of recipient address
     * @param _from sender address
     * @param _to recipient address
     * @param _amount number of tokens transferred
     * @param _tokenId the token's specific ID
     * @param _action Action Type defined by ApplicationHandlerLib -- (Purchase, Sell, Trade, Inquire) are the legacy options
     * @return Success equals true if all checks pass
     */
    function checkAllRules(uint256 _balanceFrom, uint256 _balanceTo, address _from, address _to, uint256 _amount, uint256 _tokenId, ActionTypes _action) external onlyOwner returns (bool) {
        _amount; // legacy parameter
        return _checkAllRules(_balanceFrom, _balanceTo, _from, _to, address(0), _tokenId, _action);
    }

    /**
     * @dev This function contains the logic for checking all rules. It performs all the checks for the external functions.
     * @param balanceFrom token balance of sender address
     * @param balanceTo token balance of recipient address
     * @param _from sender address
     * @param _to recipient address
     * @param _sender the address triggering the contract action
     * @param _tokenId id of the NFT being transferred
     * @param _action the client determined action, if NONE then the action is dynamically determined
     * @return true if all checks pass
     */
    function _checkAllRules(uint256 balanceFrom, uint256 balanceTo, address _from, address _to, address _sender, uint256 _tokenId, ActionTypes _action) internal returns (bool) {
        HandlerBaseS storage handlerBaseStorage = lib.handlerBaseStorage();

        bool isFromTreasuryAccount = IAppManager(handlerBaseStorage.appManager).isTreasuryAccount(_from);
        bool isToTreasuryAccount = IAppManager(handlerBaseStorage.appManager).isTreasuryAccount(_to);
        ActionTypes action;
        if (_action == ActionTypes.NONE) {
            action = determineTransferAction(_from, _to, _sender);
        } else {
            action = _action;
        }
        uint256 _amount = 1; /// currently not supporting batch NFT transactions. Only single NFT transfers.
        /// standard tagged and non-tagged rules do not apply when either to or from is a Treasury account
        if (!isFromTreasuryAccount && !isToTreasuryAccount) {
            IAppManager(handlerBaseStorage.appManager).checkApplicationRules(
                address(msg.sender),
                _sender,
                _from,
                _to,
                _amount,
                lib.nftValuationLimitStorage().nftValuationLimit,
                _tokenId,
                action,
                HandlerTypes.ERC721HANDLER
            );
            callAnotherFacet(0xcf2eaa37, abi.encodeWithSignature("checkTaggedAndTradingRules(uint256,uint256,address,address,address,uint256,uint8)", balanceFrom, balanceTo, _from, _to, _sender, _amount, action));
            callAnotherFacet(0x6c163628, abi.encodeWithSignature("checkNonTaggedRules(uint8,address,address,address,uint256,uint256)", action, _from, _to, _sender, _amount, _tokenId));
        } else if (isFromTreasuryAccount || isToTreasuryAccount) {
            emit AD1467_RulesBypassedViaTreasuryAccount(address(msg.sender), lib.handlerBaseStorage().appManager);
        }
        // if the current action is not a burn and MinHoldTime is active for any action, record ownership
        if (action != ActionTypes.BURN && lib.tokenMinHoldTimeStorage().anyActionActive) {
            lib.tokenMinHoldTimeStorage().ownershipStart[_tokenId] = block.timestamp;
        }

        return true;
    }

    /**
     * @dev This function returns the configured application manager's address.
     * @return appManagerAddress address of the connected application manager
     */
    function getAppManagerAddress() external view returns(address){
        return address(lib.handlerBaseStorage().appManager);
    }

    /**
     * @dev This function returns the configured rule processor address.
     * @return ruleProcessorAddress address of the connected Rule Processor
     */
    function getRuleProcessorAddress() external view returns(address){
        return address(lib.handlerBaseStorage().ruleProcessor);
    }

    /**
     * @dev This function returns the configured token address.
     * @return assetAddress address of the connected token
     */
    function getAssetAddress() external view returns(address){
        return address(lib.handlerBaseStorage().assetAddress);
    }
}
