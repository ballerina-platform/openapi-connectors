// Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/url;
import ballerina/lang.'string;

public type ApiKeysConfig record {
    map<string> apiKeys;
};

# This is a generated connector for [Vonage Number Insight API v1.0.10](https://nexmo-api-specification.herokuapp.com/number-insight) OpenAPI specification. 
# The Number Insight API delivers real-time intelligence about the validity, reachability and roaming status of a phone number and tells you how to format the number correctly in your application. 
# There are three levels of Number Insight API available: [Basic, Standard and Advanced](https://developer.nexmo.com/number-insight/overview#basic-standard-and-advanced-apis). The advanced API is available asynchronously as well as synchronously.
# More Number Insight API documentation is at https://developer.nexmo.com/number-insight/overview#number-insight-api-overview.
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Vonage account](https://www.vonage.com/) and obtain tokens by following [this guide](https://developer.nexmo.com/concepts/guides/authentication).
    #
    # + apiKeyConfig - Provide your API keys as `api_key` and `api_secret`. Eg: `{"api_key" : "<API key>", "api_secret" : "<API secret>"}`
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.nexmo.com/ni") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Basic Number Insight
    #
    # + format - The format of the response
    # + number - A single phone number that you need insight about in national or international format.
    # + country - If a number does not have a country code or is uncertain, set the two-character country code. This code must be in ISO 3166-1 alpha-2 format and in upper case. For example, GB or US. If you set country and number is already in [E.164](https://en.wikipedia.org/wiki/E.164) format, country must match the country code in number.
    # + return - OK
    remote isolated function getNumberInsightBasic(string format, string number, string? country = ()) returns NiResponseJsonBasic|error {
        string  path = string `/basic/${format}`;
        map<anydata> queryParam = {"number": number, "country": country, "api_key": self.apiKeys["api_key"], "api_secret": self.apiKeys["api_secret"]};
        path = path + check getPathForQueryParam(queryParam);
        NiResponseJsonBasic response = check self.clientEp-> get(path, targetType = NiResponseJsonBasic);
        return response;
    }
    # Standard Number Insight
    #
    # + format - The format of the response
    # + number - A single phone number that you need insight about in national or international format.
    # + country - If a number does not have a country code or is uncertain, set the two-character country code. This code must be in ISO 3166-1 alpha-2 format and in upper case. For example, GB or US. If you set country and number is already in [E.164](https://en.wikipedia.org/wiki/E.164) format, country must match the country code in number.
    # + cnam - Indicates if the name of the person who owns the phone number should be looked up and returned in the response. Set to true to receive phone number owner name in the response. This features is available for US numbers only and incurs an additional charge.
    # + return - OK
    remote isolated function getNumberInsightStandard(string format, string number, string? country = (), boolean cnam = false) returns NiResponseJsonStandard|error {
        string  path = string `/standard/${format}`;
        map<anydata> queryParam = {"number": number, "country": country, "cnam": cnam, "api_key": self.apiKeys["api_key"], "api_secret": self.apiKeys["api_secret"]};
        path = path + check getPathForQueryParam(queryParam);
        NiResponseJsonStandard response = check self.clientEp-> get(path, targetType = NiResponseJsonStandard);
        return response;
    }
    # Advanced Number Insight (async)
    #
    # + format - The format of the response
    # + callback - The callback URL
    # + number - A single phone number that you need insight about in national or international format.
    # + country - If a number does not have a country code or is uncertain, set the two-character country code. This code must be in ISO 3166-1 alpha-2 format and in upper case. For example, GB or US. If you set country and number is already in [E.164](https://en.wikipedia.org/wiki/E.164) format, country must match the country code in number.
    # + cnam - Indicates if the name of the person who owns the phone number should be looked up and returned in the response. Set to true to receive phone number owner name in the response. This features is available for US numbers only and incurs an additional charge.
    # + ip - This parameter is deprecated as we are no longer able to retrieve reliable IP data globally from carriers. 
    # + return - OK
    remote isolated function getNumberInsightAsync(string format, string callback, string number, string? country = (), boolean cnam = false, string? ip = ()) returns NiResponseAsync|error {
        string  path = string `/advanced/async/${format}`;
        map<anydata> queryParam = {"callback": callback, "number": number, "country": country, "cnam": cnam, "ip": ip, "api_key": self.apiKeys["api_key"], "api_secret": self.apiKeys["api_secret"]};
        path = path + check getPathForQueryParam(queryParam);
        NiResponseAsync response = check self.clientEp-> get(path, targetType = NiResponseAsync);
        return response;
    }
    # Advanced Number Insight (sync)
    #
    # + format - The format of the response
    # + number - A single phone number that you need insight about in national or international format.
    # + country - If a number does not have a country code or is uncertain, set the two-character country code. This code must be in ISO 3166-1 alpha-2 format and in upper case. For example, GB or US. If you set country and number is already in [E.164](https://en.wikipedia.org/wiki/E.164) format, country must match the country code in number.
    # + cnam - Indicates if the name of the person who owns the phone number should be looked up and returned in the response. Set to true to receive phone number owner name in the response. This features is available for US numbers only and incurs an additional charge.
    # + ip - This parameter is deprecated as we are no longer able to retrieve reliable IP data globally from carriers. 
    # + return - OK
    remote isolated function getNumberInsightAdvanced(string format, string number, string? country = (), boolean cnam = false, string? ip = ()) returns NiResponseJsonAdvanced|error {
        string  path = string `/advanced/${format}`;
        map<anydata> queryParam = {"number": number, "country": country, "cnam": cnam, "ip": ip, "api_key": self.apiKeys["api_key"], "api_secret": self.apiKeys["api_secret"]};
        path = path + check getPathForQueryParam(queryParam);
        NiResponseJsonAdvanced response = check self.clientEp-> get(path, targetType = NiResponseJsonAdvanced);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
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
