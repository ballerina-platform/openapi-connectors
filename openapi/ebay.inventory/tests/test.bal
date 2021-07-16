import  ballerina/test;
import  ballerina/http;

configurable http:BearerTokenConfig & readonly authConfig = ?;
ClientConfig clientConfig = {authConfig : authConfig};
Client baseClient = check new Client(clientConfig, serviceUrl = "https://api.ebay.com/sell/inventory/v1");

@test:Config {}
isolated function  testBulkCreateOrReplaceInventoryItem() {
}

@test:Config {}
isolated function  testBulkGetInventoryItem() {
}

@test:Config {}
isolated function  testBulkUpdatePriceQuantity() {
}

@test:Config {}
isolated function  testGetInventoryItem() {
}

@test:Config {}
isolated function  testCreateOrReplaceInventoryItem() {
}

@test:Config {}
isolated function  testDeleteInventoryItem() {
}

@test:Config {}
isolated function  testGetInventoryItems() {
}

@test:Config {}
isolated function  testGetProductCompatibility() {
}

@test:Config {}
isolated function  testCreateOrReplaceProductCompatibility() {
}

@test:Config {}
isolated function  testDeleteProductCompatibility() {
}

@test:Config {}
isolated function  testGetInventoryItemGroup() {
}

@test:Config {}
isolated function  testCreateOrReplaceInventoryItemGroup() {
}

@test:Config {}
isolated function  testDeleteInventoryItemGroup() {
}

@test:Config {}
isolated function  testBulkMigrateListing() {
}

@test:Config {}
isolated function  testBulkCreateOffer() {
}

@test:Config {}
isolated function  testBulkPublishOffer() {
}

@test:Config {}
isolated function  testGetOffers() {
}

@test:Config {}
isolated function  testCreateOffer() {
}

@test:Config {}
isolated function  testGetOffer() {
}

@test:Config {}
isolated function  testUpdateOffer() {
}

@test:Config {}
isolated function  testDeleteOffer() {
}

@test:Config {}
isolated function  testGetListingFees() {
}

@test:Config {}
isolated function  testPublishOffer() {
}

@test:Config {}
isolated function  testPublishOfferByInventoryItemGroup() {
}

@test:Config {}
isolated function  testWithdrawOffer() {
}

@test:Config {}
isolated function  testWithdrawOfferByInventoryItemGroup() {
}

@test:Config {}
isolated function  testGetInventoryLocation() {
}

@test:Config {}
isolated function  testCreateInventoryLocation() {
}

@test:Config {}
isolated function  testDeleteInventoryLocation() {
}

@test:Config {}
isolated function  testDisableInventoryLocation() {
}

@test:Config {}
isolated function  testEnableInventoryLocation() {
}

@test:Config {}
isolated function  testGetInventoryLocations() {
}

@test:Config {}
isolated function  testUpdateInventoryLocation() {
}
