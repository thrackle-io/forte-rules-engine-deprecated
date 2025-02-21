// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "test/util/TestCommonFoundry.sol";

interface NFT {
    function confirmTreasuryAddress() external;
}

contract FaultyDummyTreasury {
    error CannotReceive(uint256 weis);

    function acceptTreasuryRole(address nft) external {
        NFT(nft).confirmTreasuryAddress();
    }

    receive() external payable {
        revert CannotReceive(msg.value);
    }
}

contract DummyTreasury {
    uint256 public balance;

    function acceptTreasuryRole(address nft) external {
        NFT(nft).confirmTreasuryAddress();
    }

    receive() external payable {
        balance += msg.value;
    }
}

contract ApplicationERC721ExampleTest is TestCommonFoundry {
    function setUp() public {
        vm.warp(Blocktime);
        setUpProcotolAndCreateERC20AndDiamondHandler();
    }

    function testERC721_ApplicationERC721Examples_AndHandlerVersions() public view {
        string memory version = VersionFacet(address(applicationNFTHandler)).version();
        assertEq(version, "2.3.0");
    }

    function testERC721_ApplicationERC721Examples_OwnerOrAdminMint() public endWithStopPrank {
        /// since this is the default implementation, we only need to test the negative case
        switchToUser();
        vm.expectRevert(0x2a79d188);
        applicationNFT.safeMint(appAdministrator);

        switchToAccessLevelAdmin();
        vm.expectRevert(0x2a79d188);
        applicationNFT.safeMint(appAdministrator);

        switchToRuleAdmin();
        vm.expectRevert(0x2a79d188);
        applicationNFT.safeMint(appAdministrator);

        switchToRiskAdmin();
        vm.expectRevert(0x2a79d188);
        applicationNFT.safeMint(appAdministrator);
    }
}
