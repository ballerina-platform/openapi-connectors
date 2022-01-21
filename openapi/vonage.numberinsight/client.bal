// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # You can find your API key in your [account overview](https://dashboard.nexmo.com/account-overview)
    string apiKey;
    # You can find your API secret in your [account overview](https://dashboard.nexmo.com/account-overview)
    string apiSecret;
|};

# This is a generated connector for [Vonage Number Insight API v1.0.10](https://nexmo-api-specification.herokuapp.com/number-insight) OpenAPI specification. 
# The Number Insight API delivers real-time intelligence about the validity, reachability and roaming status of a phone number and tells you how to format the number correctly in your application. 
# There are three levels of Number Insight API available: [Basic, Standard and Advanced](https://developer.nexmo.com/number-insight/overview#basic-standard-and-advanced-apis). The advanced API is available asynchronously as well as synchronously.
# More Number Insight API documentation is at https://developer.nexmo.com/number-insight/overview#number-insight-api-overview.
@display {label: "Vonage Number Insight", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Vonage account](https://www.vonage.com/) and obtain tokens by following [this guide](https://developer.nexmo.com/concepts/guides/authentication).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.nexmo.com/ni") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Basic Number Insight
    #
    # + format - The format of the response 
    # + number - A single phone number that you need insight about in national or international format. 
    # + country - If a number does not have a country code or is uncertain, set the two-character country code. This code must be in ISO 3166-1 alpha-2 format and in upper case. For example, GB or US. If you set country and number is already in [E.164](https://en.wikipedia.org/wiki/E.164) format, country must match the country code in number. 
    # + return - OK 
    remote isolated function getNumberInsightBasic(string format, string number, string? country = ()) returns NiResponseJsonBasic|error {
        string resourcePath = string `/basic/${format}`;
        map<anydata> queryParam = {"number": number, "country": country, "api_key": self.apiKeyConfig.apiKey, "api_secret": self.apiKeyConfig.apiSecret};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        NiResponseJsonBasic response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/standard/${format}`;
        map<anydata> queryParam = {"number": number, "country": country, "cnam": cnam, "api_key": self.apiKeyConfig.apiKey, "api_secret": self.apiKeyConfig.apiSecret};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        NiResponseJsonStandard response = check self.clientEp->get(resourcePath);
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
    # # Deprecated parameters
    # + ip - This parameter is deprecated as we are no longer able to retrieve reliable IP data globally from carriers.  
    # + return - OK 
    remote isolated function getNumberInsightAsync(string format, string callback, string number, string? country = (), boolean cnam = false, @deprecated string? ip = ()) returns NiResponseAsync|error {
        string resourcePath = string `/advanced/async/${format}`;
        map<anydata> queryParam = {"callback": callback, "number": number, "country": country, "cnam": cnam, "ip": ip, "api_key": self.apiKeyConfig.apiKey, "api_secret": self.apiKeyConfig.apiSecret};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        NiResponseAsync response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Advanced Number Insight (sync)
    #
    # + format - The format of the response 
    # + number - A single phone number that you need insight about in national or international format. 
    # + country - If a number does not have a country code or is uncertain, set the two-character country code. This code must be in ISO 3166-1 alpha-2 format and in upper case. For example, GB or US. If you set country and number is already in [E.164](https://en.wikipedia.org/wiki/E.164) format, country must match the country code in number. 
    # + cnam - Indicates if the name of the person who owns the phone number should be looked up and returned in the response. Set to true to receive phone number owner name in the response. This features is available for US numbers only and incurs an additional charge. 
    # + ip - This parameter is deprecated as we are no longer able to retrieve reliable IP data globally from carriers.  
    # # Deprecated parameters
    # + ip - This parameter is deprecated as we are no longer able to retrieve reliable IP data globally from carriers.  
    # + return - OK 
    remote isolated function getNumberInsightAdvanced(string format, string number, string? country = (), boolean cnam = false, @deprecated string? ip = ()) returns NiResponseJsonAdvanced|error {
        string resourcePath = string `/advanced/${format}`;
        map<anydata> queryParam = {"number": number, "country": country, "cnam": cnam, "ip": ip, "api_key": self.apiKeyConfig.apiKey, "api_secret": self.apiKeyConfig.apiSecret};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        NiResponseJsonAdvanced response = check self.clientEp->get(resourcePath);
        return response;
    }
}
