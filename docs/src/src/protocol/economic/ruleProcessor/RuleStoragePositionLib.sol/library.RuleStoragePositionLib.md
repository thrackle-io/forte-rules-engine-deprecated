# RuleStoragePositionLib
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/c68a304eba8615cfb7f60cfb23fe792f1083c190/src/protocol/economic/ruleProcessor/RuleStoragePositionLib.sol)

**Author:**
@ShaneDuncan602 @oscarsernarosero @TJ-Everett

Library for Rules

*This contract serves as the storage library for the rules Diamond. It basically serves up the storage position for all rules*


## State Variables
### DIAMOND_CUT_STORAGE_POSITION

```solidity
bytes32 constant DIAMOND_CUT_STORAGE_POSITION = bytes32(uint256(keccak256("diamond-cut.storage")) - 1);
```


### ACCOUNT_MAX_TRADE_SIZE
every rule has its own storage


```solidity
bytes32 constant ACCOUNT_MAX_TRADE_SIZE = bytes32(uint256(keccak256("account-max-trade-volume")) - 1);
```


### ACCOUNT_MAX_BUY_SELL_VOLUME_POSITION

```solidity
bytes32 constant ACCOUNT_MAX_BUY_SELL_VOLUME_POSITION = bytes32(uint256(keccak256("account-max-buy-sell-volume")) - 1);
```


### BUY_FEE_BY_TOKEN_MAX_TRADING_VOLUME_POSITION

```solidity
bytes32 constant BUY_FEE_BY_TOKEN_MAX_TRADING_VOLUME_POSITION = bytes32(uint256(keccak256("amm.fee-by-volume")) - 1);
```


### TOKEN_MAX_PRICE_VOLATILITY_POSITION

```solidity
bytes32 constant TOKEN_MAX_PRICE_VOLATILITY_POSITION = bytes32(uint256(keccak256("token-max-price-volatility")) - 1);
```


### TOKEN_MAX_TRADING_VOLUME_POSITION

```solidity
bytes32 constant TOKEN_MAX_TRADING_VOLUME_POSITION = bytes32(uint256(keccak256("token-max-trading-volume")) - 1);
```


### TOKEN_MIN_TX_SIZE_POSITION

```solidity
bytes32 constant TOKEN_MIN_TX_SIZE_POSITION = bytes32(uint256(keccak256("token-min-tx-size")) - 1);
```


### TOKEN_MIN_HOLD_TIME_POSITION

```solidity
bytes32 constant TOKEN_MIN_HOLD_TIME_POSITION = bytes32(uint256(keccak256("token-min-hold-time")) - 1);
```


### ACCOUNT_MIN_MAX_TOKEN_BALANCE_POSITION

```solidity
bytes32 constant ACCOUNT_MIN_MAX_TOKEN_BALANCE_POSITION =
    bytes32(uint256(keccak256("account-min-max-token-balance")) - 1);
```


### TOKEN_MAX_SUPPLY_VOLATILITY_POSITION

```solidity
bytes32 constant TOKEN_MAX_SUPPLY_VOLATILITY_POSITION = bytes32(uint256(keccak256("token-max-supply-volatility")) - 1);
```


### ACC_APPROVE_DENY_ORACLE_POSITION

```solidity
bytes32 constant ACC_APPROVE_DENY_ORACLE_POSITION = bytes32(uint256(keccak256("account-approve-deny-oracle")) - 1);
```


### ACC_APPROVE_DENY_ORACLE_FLEXIBLE_POSITION

```solidity
bytes32 constant ACC_APPROVE_DENY_ORACLE_FLEXIBLE_POSITION =
    bytes32(uint256(keccak256("account-approve-deny-oracle-flexible")) - 1);
```


### ACC_MAX_VALUE_BY_ACCESS_LEVEL_POSITION

```solidity
bytes32 constant ACC_MAX_VALUE_BY_ACCESS_LEVEL_POSITION =
    bytes32(uint256(keccak256("account-max-value-by-access-level")) - 1);
```


### ACC_MAX_TX_VALUE_BY_RISK_SCORE_POSITION

```solidity
bytes32 constant ACC_MAX_TX_VALUE_BY_RISK_SCORE_POSITION =
    bytes32(uint256(keccak256("account-max-transaction-value-by-access-level")) - 1);
```


### ACCOUNT_MAX_VALUE_BY_RISK_SCORE_POSITION

```solidity
bytes32 constant ACCOUNT_MAX_VALUE_BY_RISK_SCORE_POSITION =
    bytes32(uint256(keccak256("account-max-value-by-risk-score")) - 1);
```


### TOKEN_MAX_DAILY_TRADES_POSITION

```solidity
bytes32 constant TOKEN_MAX_DAILY_TRADES_POSITION = bytes32(uint256(keccak256("token-max-daily-trades")) - 1);
```


### AMM_FEE_RULE_POSITION

```solidity
bytes32 constant AMM_FEE_RULE_POSITION = bytes32(uint256(keccak256("AMM.fee-rule")) - 1);
```


### ACC_MAX_VALUE_OUT_ACCESS_LEVEL_POSITION

```solidity
bytes32 constant ACC_MAX_VALUE_OUT_ACCESS_LEVEL_POSITION =
    bytes32(uint256(keccak256("account-max-value-out-by-access-level")) - 1);
```


### ENABLED_ACTIONS

```solidity
bytes32 constant ENABLED_ACTIONS = bytes32(uint256(keccak256("enabled-actions")) - 1);
```


## Functions
### accountMaxTradeSizeStorage

*Function to store Trade rules*


```solidity
function accountMaxTradeSizeStorage() internal pure returns (IRuleStorage.AccountMaxTradeSizeS storage ds);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`ds`|`IRuleStorage.AccountMaxTradeSizeS`|Data Storage of Trade Rule|


### accountMaxBuySellVolumeStorage

*Function to store Account Max Buy Volume rules*


```solidity
function accountMaxBuySellVolumeStorage() internal pure returns (IRuleStorage.TokenMaxBuySellVolumeS storage ds);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`ds`|`IRuleStorage.TokenMaxBuySellVolumeS`|Data Storage of Account Max Buy Volume Rule|


### purchaseFeeByVolumeStorage

*Function to store Purchase Fee by Volume rules*


```solidity
function purchaseFeeByVolumeStorage() internal pure returns (IRuleStorage.PurchaseFeeByVolRuleS storage ds);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`ds`|`IRuleStorage.PurchaseFeeByVolRuleS`|Data Storage of Purchase Fee by Volume Rule|


### tokenMaxPriceVolatilityStorage

*Function to store Price Volitility rules*


```solidity
function tokenMaxPriceVolatilityStorage() internal pure returns (IRuleStorage.TokenMaxPriceVolatilityS storage ds);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`ds`|`IRuleStorage.TokenMaxPriceVolatilityS`|Data Storage of Price Volitility Rule|


### tokenMaxTradingVolumeStorage

*Function to store Max Trading Volume rules*


```solidity
function tokenMaxTradingVolumeStorage() internal pure returns (IRuleStorage.TokenMaxTradingVolumeS storage ds);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`ds`|`IRuleStorage.TokenMaxTradingVolumeS`|Data Storage of Max Trading Volume Rule|


### tokenMinTxSizePosition

*Function to store Token Min Transaction Size rules*


```solidity
function tokenMinTxSizePosition() internal pure returns (IRuleStorage.TokenMinTxSizeS storage ds);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`ds`|`IRuleStorage.TokenMinTxSizeS`|Data Storage of Token Min Transaction Size Rule|


### accountMinMaxTokenBalanceStorage

*Function to store Account Min Max Token Balance rules*


```solidity
function accountMinMaxTokenBalanceStorage()
    internal
    pure
    returns (IRuleStorage.AccountMinMaxTokenBalanceS storage ds);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`ds`|`IRuleStorage.AccountMinMaxTokenBalanceS`|Data Storage of Account Min Max Token Balance Rule|


### tokenMaxSupplyVolatilityStorage

*Function to store Max Supply Volitility rules*


```solidity
function tokenMaxSupplyVolatilityStorage() internal pure returns (IRuleStorage.TokenMaxSupplyVolatilityS storage ds);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`ds`|`IRuleStorage.TokenMaxSupplyVolatilityS`|Data Storage of Max Supply Volitility Rule|


### accountApproveDenyOracleStorage

*Function to store Oracle rules*


```solidity
function accountApproveDenyOracleStorage() internal pure returns (IRuleStorage.AccountApproveDenyOracleS storage ds);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`ds`|`IRuleStorage.AccountApproveDenyOracleS`|Data Storage of Oracle Rule|


### accountApproveDenyOracleFlexibleStorage

*Function to store Flexible Oracle rules*


```solidity
function accountApproveDenyOracleFlexibleStorage()
    internal
    pure
    returns (IRuleStorage.AccountApproveDenyOracleFlexibleS storage ds);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`ds`|`IRuleStorage.AccountApproveDenyOracleFlexibleS`|Data Storage of Flexible Oracle Rule|


### accountMaxValueByAccessLevelStorage

*Function to store Account Max Value Access Level rules*


```solidity
function accountMaxValueByAccessLevelStorage()
    internal
    pure
    returns (IRuleStorage.AccountMaxValueByAccessLevelS storage ds);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`ds`|`IRuleStorage.AccountMaxValueByAccessLevelS`|Data Storage of Account Max Value Access Level Rule|


### accountMaxTxValueByRiskScoreStorage

*Function to store Account Max Tx Value by Risk rules*


```solidity
function accountMaxTxValueByRiskScoreStorage()
    internal
    pure
    returns (IRuleStorage.AccountMaxTxValueByRiskScoreS storage ds);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`ds`|`IRuleStorage.AccountMaxTxValueByRiskScoreS`|Data Storage of Account Max Tx Value by Risk Rule|


### tokenMinHoldTimeStorage

*Function to store Token Min Hold Time rules*


```solidity
function tokenMinHoldTimeStorage() internal pure returns (IRuleStorage.TokenMinHoldTimeS storage ds);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`ds`|`IRuleStorage.TokenMinHoldTimeS`|Data Storage of Token Min Hold Time Rule|


### accountMaxValueByRiskScoreStorage

*Function to store Account Max Value By Risk Score rules*


```solidity
function accountMaxValueByRiskScoreStorage()
    internal
    pure
    returns (IRuleStorage.AccountMaxValueByRiskScoreS storage ds);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`ds`|`IRuleStorage.AccountMaxValueByRiskScoreS`|Data Storage of Account Max Value By Risk Score Rule|


### TokenMaxDailyTradesStorage

*Function to store Token Max Daily Trades rules*


```solidity
function TokenMaxDailyTradesStorage() internal pure returns (IRuleStorage.TokenMaxDailyTradesS storage ds);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`ds`|`IRuleStorage.TokenMaxDailyTradesS`|Data Storage of Token Max Daily Trades rule|


### ammFeeRuleStorage

*Function to store AMM Fee rules*


```solidity
function ammFeeRuleStorage() internal pure returns (IRuleStorage.AMMFeeRuleS storage ds);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`ds`|`IRuleStorage.AMMFeeRuleS`|Data Storage of AMM Fee rule|


### accountMaxValueOutByAccessLevelStorage

*Function to store Account Max Value Out By Access Level rules*


```solidity
function accountMaxValueOutByAccessLevelStorage()
    internal
    pure
    returns (IRuleStorage.AccountMaxValueOutByAccessLevelS storage ds);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`ds`|`IRuleStorage.AccountMaxValueOutByAccessLevelS`|Data Storage of Account Max Value Out By Access Level rule|


### enabledActions

*Function to access storage for EnabledActions*


```solidity
function enabledActions() internal pure returns (IRuleStorage.EnabledActions storage ds);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`ds`|`IRuleStorage.EnabledActions`|Data Storage for RuleApplicationValidationFacet - EnabledActions|


