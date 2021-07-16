import  ballerina/test;
import  ballerina/http;

configurable http:OAuth2ClientCredentialsGrantConfig & readonly authConfig = ?;
ClientConfig clientConfig = {authConfig : authConfig};

@test:Config {}
isolated function  testSearch() {
}

@test:Config {}
isolated function  testSearchByImage() {
}

@test:Config {}
isolated function  testGetItem() {
}

@test:Config {}
isolated function  testGetItemByLegacyId() {
}

@test:Config {}
isolated function  testGetItems() {
}

@test:Config {}
isolated function  testGetItemsByItemGroup() {
}

@test:Config {}
isolated function  testCheckCompatibility() {
}

@test:Config {}
isolated function  testAddItem() {
}

@test:Config {}
isolated function  testGetShoppingCart() {
}

@test:Config {}
isolated function  testRemoveItem() {
}

@test:Config {}
isolated function  testUpdateQuantity() {
}
