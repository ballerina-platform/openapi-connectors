import  ballerina/test;
import  ballerina/http;

configurable http:BearerTokenConfig & readonly authConfig = ?;
ClientConfig clientConfig = {authConfig : authConfig};
Client baseClient = check new Client(clientConfig, serviceUrl = "https://api.ebay.com/sell/analytics/v1");

@test:Config {}
isolated function  testGetCustomerServiceMetric() {
}

@test:Config {}
isolated function  testFindSellerStandardsProfiles() {
}

@test:Config {}
isolated function  testGetSellerStandardsProfile() {
}

@test:Config {}
isolated function  testGetTrafficReport() {
}
