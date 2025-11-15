// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {GNad} from "../contracts/core/GNad.sol";
import {BondingCurveFactory} from "../contracts/factories/BondingCurveFactory.sol";
import {FeeVault} from "../contracts/vaults/FeeVault.sol";
import {WMon} from "../contracts/tokens/WMon.sol";

/**
 * @title DeployScript
 * @notice Deployment script for GNad.Fun contracts
 * @dev Deploys contracts in the correct order with proper initialization
 */
contract DeployScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployer = vm.addr(deployerPrivateKey);

        vm.startBroadcast(deployerPrivateKey);

        console.log("Deploying from address:", deployer);
        console.log("Deployer balance:", deployer.balance);

        // Step 1: Deploy WMon (Wrapped Monad token)
        console.log("\n=== Deploying WMon ===");
        WMon wMon = new WMon();
        console.log("WMon deployed at:", address(wMon));

        // Step 2: Deploy FeeVault (multisig fee vault)
        console.log("\n=== Deploying FeeVault ===");
        address[] memory owners = new address[](1);
        owners[0] = deployer; // Replace with actual multisig owners
        FeeVault vault = new FeeVault(address(wMon), owners, 1); // threshold = 1 for testing
        console.log("FeeVault deployed at:", address(vault));

        // Step 3: Deploy BondingCurveFactory
        console.log("\n=== Deploying BondingCurveFactory ===");
        BondingCurveFactory factory = new BondingCurveFactory(
            deployer, // owner
            address(0), // gNad - will be set after GNad deployment
            address(wMon)
        );
        console.log("BondingCurveFactory deployed at:", address(factory));

        // Step 4: Deploy GNad (main contract)
        console.log("\n=== Deploying GNad ===");
        GNad gnad = new GNad(address(wMon), address(vault));
        console.log("GNad deployed at:", address(gnad));

        // Step 5: Initialize GNad with factory
        console.log("\n=== Initializing GNad ===");
        gnad.initialize(address(factory));
        console.log("GNad initialized");

        // Step 6: Set GNad address in factory
        console.log("\n=== Configuring Factory ===");
        factory.setGNad(address(gnad));
        console.log("Factory configured");

        vm.stopBroadcast();

        console.log("\n=== Deployment Summary ===");
        console.log("WMon:", address(wMon));
        console.log("FeeVault:", address(vault));
        console.log("BondingCurveFactory:", address(factory));
        console.log("GNad:", address(gnad));
    }
}

