# DIAMOND UPGRADE REVERSION PLAN

If a diamond upgrade reversion is required, the next steps must be followed:

1. Determine if the upgraded facet has changed at all (logic, function signatures, etc.). If not, skip next step and continue to step 3.
2. If the contract has changed, then use the version control system to go back to the desired state of the contract and build the entire repo to make sure that the `out` directory has the desired abi.
3. Checkout the `deployments/$CHAIN_ID/$TIMESTAMP/diamonds.json` file and find the facet to revert to its previous state. Make sure that the address of the facet recorded there is not the latest one. You can do this by looking at the historical version of this file through the version control system.
4. Configure the environment variables to carry out the reversion. Specifically set the following variables in the root `.env` file:
    ```
    DEPLOYMENT_OWNER_KEY=<YOUR_DEPLOYMENT_OWNER_KEY>
    FACET_NAME_TO_REVERT=<THE_NAME_OF_THE_FACET_CONTRACT_TO_REVERT>
    FACET_TIMESTAMP=<THE_TIMESTAMP_OF_THE_DIAMOND_TO_REVERT> # Find this in the deployments directory, its the name of the folder for when the diamond was deployed
    REVERT_TO_FACET_ADDRESS=<THE_PREVIOUS_RECORDED_ADDRESS_OF_THE_FACET>
    RECORD_DEPLOYMENTS_FOR_ALL_CHAINS=<true/false> #true if testing in 31337 and recorded values are needed
    DEPLOYMENT_OUT_DIR=<THE_NAME_OF_THE_DIRECTORY_CONTAINING_DEPLOYED_OUTPUT_TO_UPGRADE>
    ```
4. Finally, run the following script:
    ```
    forge script --ffi script/clientScripts/RevertAFacetUpgrade.s.sol --broadcast --rpc-url <YOUR_RPC_URL>
    ```

Notice that the environment variables are automatically cleaned by the script. This is to prevent accidental faulty upgrades. Also, the script makes sure that the reversion was successful by checking that the old selectors are first removed, the new ones are in the diamond, and that they are configured to point to the correct facet address as well as updating the address 
within the deployment directory.