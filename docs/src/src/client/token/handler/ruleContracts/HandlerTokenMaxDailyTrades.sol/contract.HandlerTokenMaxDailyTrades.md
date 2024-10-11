# HandlerTokenMaxDailyTrades
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/4a2e9b2745fc1ebf2913bcb6fdbbd0ad4f2bfe93/src/client/token/handler/ruleContracts/HandlerTokenMaxDailyTrades.sol)

**Inherits:**
[RuleAdministratorOnly](/src/protocol/economic/RuleAdministratorOnly.sol/contract.RuleAdministratorOnly.md), [ActionTypesArray](/src/client/common/ActionTypesArray.sol/contract.ActionTypesArray.md), [ITokenHandlerEvents](/src/common/IEvents.sol/interface.ITokenHandlerEvents.md), [IAssetHandlerErrors](/src/common/IErrors.sol/interface.IAssetHandlerErrors.md)

**Author:**
@ShaneDuncan602 @oscarsernarosero @TJ-Everett

*Setters and getters for the rule in the handler. Meant to be inherited by a handler
facet to easily support the rule.*


## Functions
### setTokenMaxDailyTradesId

Rule Setters and Getters

that setting a rule will automatically activate it.

*Set the TokenMaxDailyTrades. Restricted to rule administrators only.*


```solidity
function setTokenMaxDailyTradesId(ActionTypes[] calldata _actions, uint32 _ruleId)
    external
    ruleAdministratorOnly(lib.handlerBaseStorage().appManager);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_actions`|`ActionTypes[]`|the action types|
|`_ruleId`|`uint32`|Rule Id to set|


### setTokenMaxDailyTradesIdFull

that setting a rule will automatically activate it.

This function does not check that the array length is greater than zero to allow for clearing out of the action types data

*Set the setTokenMaxDailyTrades Rule suite. Restricted to rule administrators only.*


```solidity
function setTokenMaxDailyTradesIdFull(ActionTypes[] calldata _actions, uint32[] calldata _ruleIds)
    external
    ruleAdministratorOnly(lib.handlerBaseStorage().appManager);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_actions`|`ActionTypes[]`|actions to have the rule applied to|
|`_ruleIds`|`uint32[]`|Rule Id corresponding to the actions|


### clearTokenMaxDailyTrades

*Clear the rule data structure*


```solidity
function clearTokenMaxDailyTrades() internal;
```

### resetTokenMaxDailyTrades

*reset the ruleChangeDate within the rule data struct. This will signal the rule check to clear the accumulator data prior to checking the rule.*


```solidity
function resetTokenMaxDailyTrades() internal;
```

### setTokenMaxDailyTradesIdUpdate

that setting a rule will automatically activate it.

*Set the TokenMaxDailyTrades.*


```solidity
function setTokenMaxDailyTradesIdUpdate(ActionTypes _action, uint32 _ruleId) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_action`|`ActionTypes`|the action type to set the rule|
|`_ruleId`|`uint32`|Rule Id to set|


### activateTokenMaxDailyTrades

*enable/disable rule. Disabling a rule will save gas on transfer transactions.*


```solidity
function activateTokenMaxDailyTrades(ActionTypes[] calldata _actions, bool _on)
    external
    ruleAdministratorOnly(lib.handlerBaseStorage().appManager);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_actions`|`ActionTypes[]`|the action types|
|`_on`|`bool`|boolean representing if a rule must be checked or not.|


### getTokenMaxDailyTradesId

*Retrieve the token max daily trades rule id*


```solidity
function getTokenMaxDailyTradesId(ActionTypes _action) external view returns (uint32);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_action`|`ActionTypes`|the action type|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint32`|tokenMaxDailyTradesRuleId|


### isTokenMaxDailyTradesActive

*Tells you if the tokenMaxDailyTradesRule is active or not.*


```solidity
function isTokenMaxDailyTradesActive(ActionTypes _action) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_action`|`ActionTypes`|the action type|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|boolean representing if the rule is active|


