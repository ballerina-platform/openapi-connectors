import  ballerina/http;

# Fetch the latest currency exchange rates via API. ExchangeRate-API is free and unlimited.
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    # Client initialization.
    #
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Returns error at failure of client initialization
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.exchangerate-api.com/v4") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Returns latest exchange rates in parameter-supplied base currency.
    #
    # + base_currency - **Base Currency**. *Example: USD*. You an use any of the ISO 4217 currency codes we support. See https://www.exchangerate-api.com/docs/supported-currencies
    # + return - Successful response
    remote isolated function  latestBybase_currency(string base_currency) returns InlineResponse200|error {
        string  path = string `/latest/${base_currency}`;
        InlineResponse200 response = check self.clientEp-> get(path, targetType = InlineResponse200);
        return response;
    }
}
