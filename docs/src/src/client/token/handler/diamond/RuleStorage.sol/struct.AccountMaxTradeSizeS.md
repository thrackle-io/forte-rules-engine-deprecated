# AccountMaxTradeSizeS
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/bdbc52f883a20b14a0585dd8216061e6f7e40df3/src/client/token/handler/diamond/RuleStorage.sol)


```solidity
struct AccountMaxTradeSizeS {
    mapping(ActionTypes => Rule) accountMaxTradeSize;
    mapping(address => uint256) boughtInPeriod;
    mapping(address => uint64) lastPurchaseTime;
    mapping(address => uint256) salesInPeriod;
    mapping(address => uint64) lastSellTime;
    uint256 ruleChangeDate;
}
```

