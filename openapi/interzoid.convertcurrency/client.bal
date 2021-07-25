import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

# Please visit [here](https://www.interzoid.com/register) and obtain an `Private License Key`. 
#
# + apiKeys - Provide your Private License Key as `license`. Eg: `{"license" : "<Private License Key>"}` 
public type ApiKeysConfig record {
    map<string> apiKeys;
};

# This API enables you to convert an amount of one currency into another currency using current foreign exchange rates.
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    map<string> apiKeys;
    # Client initialization.
    #
    # + apiKeyConfig - API key configuration detail
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Returns error at failure of client initialization
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.interzoid.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys;
    }
    # Converts amount in one currency to that of another
    #
    # + 'from - Currency symbol for the converted from amount
    # + to - Currency symbol for the converted to amount
    # + amount - The amount of currency to be converted
    # + return - Currency rate data
    remote isolated function convertCurrency(string 'from, string to, string amount) returns CurrencyConversionInfo|error {
        string  path = string `/convertcurrency`;
        map<anydata> queryParam = {"from": 'from, "to": to, "amount": amount, license: self.apiKeys["license"]};
        path = path + check getPathForQueryParam(queryParam);
        CurrencyConversionInfo response = check self.clientEp-> get(path, targetType = CurrencyConversionInfo);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
