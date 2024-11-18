# HandlerTokenMinHoldTime
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/c24a67035f9dc2b86d52113e68cb76f2f45fa3f2/src/client/token/handler/ruleContracts/HandlerTokenMinHoldTime.sol)

**Inherits:**
[RuleAdministratorOnly](/src/protocol/economic/RuleAdministratorOnly.sol/contract.RuleAdministratorOnly.md), [ActionTypesArray](/src/client/common/ActionTypesArray.sol/contract.ActionTypesArray.md), [ITokenHandlerEvents](/src/common/IEvents.sol/interface.ITokenHandlerEvents.md), [IAssetHandlerErrors](/src/common/IErrors.sol/interface.IAssetHandlerErrors.md)

**Author:**
@ShaneDuncan602 @oscarsernarosero @TJ-Everett

*Setters and getters for the rule in the handler. Meant to be inherited by a handler
facet to easily support the rule.*


## State Variables
### MAX_HOLD_TIME_HOURS

```solidity
uint16 constant MAX_HOLD_TIME_HOURS = 43830;
```


## Functions
### activateTokenMinHoldTime

-------------SIMPLE RULE SETTERS and GETTERS---------------

*Tells you if the minimum hold time rule is active or not.*


```solidity
function activateTokenMinHoldTime(ActionTypes[] calldata _actions, bool _on)
    external
    ruleAdministratorOnly(lib.handlerBaseStorage().appManager);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_actions`|`ActionTypes[]`|the action type|
|`_on`|`bool`|boolean representing if the rule is active|


### setTokenMinHoldTime

that setting a rule will automatically activate it.

*Set the TokenMinHoldTime. Restricted to rule administrators only.*


```solidity
function setTokenMinHoldTime(ActionTypes[] calldata _actions, uint32 _ruleId)
    external
    ruleAdministratorOnly(lib.handlerBaseStorage().appManager);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_actions`|`ActionTypes[]`|the action types|
|`_ruleId`|`uint32`|the rule id|


### setTokenMinHoldTimeFull

that setting a rule will automatically activate it.

This function does not check that the array length is greater than zero to allow for clearing out of the action types data

*Set the setTokenMinHoldTimeRule suite. Restricted to rule administrators only.*


```solidity
function setTokenMinHoldTimeFull(ActionTypes[] calldata _actions, uint32[] calldata _ruleIds)
    external
    ruleAdministratorOnly(lib.handlerBaseStorage().appManager);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_actions`|`ActionTypes[]`|actions to have the rule applied to|
|`_ruleIds`|`uint32[]`|the rule ids corresponding to the actions|


### clearTokenMinHoldTime

*Clear the rule data structure*


```solidity
function clearTokenMinHoldTime() internal;
```

### resetTokenMinHoldTime

*reset the ruleChangeDate within the rule data struct. This will signal the rule check to clear the accumulator data prior to checking the rule.*


```solidity
function resetTokenMinHoldTime() internal;
```

### setTokenMinHoldTimeIdUpdate

that setting a rule will automatically activate it.

*Set the TokenMinHoldTime.*


```solidity
function setTokenMinHoldTimeIdUpdate(ActionTypes _action, uint32 _ruleId) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_action`|`ActionTypes`|the action type to set the rule|
|`_ruleId`|`uint32`|the rule id|


### getTokenMinHoldTimePeriod

*Get the minimum hold time rule hold hours*


```solidity
function getTokenMinHoldTimePeriod(ActionTypes _action) external view returns (uint32);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_action`|`ActionTypes`|the action type|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint32`|period minimum amount of time to hold the asset|


### isTokenMinHoldTimeActive

*function to check if Minumum Hold Time is active*


```solidity
function isTokenMinHoldTimeActive(ActionTypes _action) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_action`|`ActionTypes`|the action type|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|bool|


