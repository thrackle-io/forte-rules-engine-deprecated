## 2.0.0 - 2024-08-19

### Changed
- The repository was renamed to forte-rules-engine
- **The Minimum Hold Time rule was refactored to conform to common rule storage and processing conventions(breaking change)**
- **Deployment Scripts were updated to better align with the documented integration strategy and AppManager based RBAC items were removed(breaking change)**
- Documentation was added for admin role removal and renunciation
- Additional data was added to the TokenRegistered event to support offchain processing
- String parameters in the event were changed to not be indexed

### Added
- FeeCollected events are now emitted when fees are collected
- Token Max Trading Volume and Token Max Supply Volatility rule now have additional configuration functions

### Removed
- ProtocolERC20 was removed in favor of minimalistic integration strategies

## 2.1.0 - 2024-09-10

### Changed
- Example token contracts were modified to only check rules if a handler address is present
- Protocol contracts were changed to have increased visibility for several storage variables
- Additional documentation added to README

### Added
- Licensing
- Version 2.0.0 Deployment information for Arbitrum Sepolia
- Version 2.0.0 Deployment information for Optimism Sepolia
- Version 2.0.0 Deployment information for Binance Smart Chain Test
- Version 2.0.0 Deployment information for Ethereum Sepolia
- Version 2.0.0 Deployment information for Polygon Amoy
- Version 2.1.0 Deployment information for Ethereum 

## 2.2.0 - 2024-10-23

### Added
- Account Approve/Deny Oracle Flexible Rule was added to RulesProcessor and token handlers
- Deployment data for all supported chains

## 2.2.1 - 2024-11-18 

### Changed 
- Asset Handler Diamonds now use the DiamondCutFacetAppAdmin library with AppAdminOrOnlyOwner modifier to allow application admins to upgrade facets in the handler diamond 

## 2.2.2 - 2024-12-17

### Removed 
- Removed internal documentation 

### Added 
- Documentation pointers to https://docs.forterulesengine.io

### Changed 
- Updated NPM package contents
