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
    # Represents API Key `token`
    string token;
|};

# This is a generated connector for [Icons8 API v3.0](https://developers.icons8.com/docs/getting-started) OpenAPI specification.  
# The Icons8 API provides the capability to search and obtain icons.
@display {label: "Icons8", iconPath: "resources/icons8.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Icons8 account](https://icons8.com/) and obtain tokens by following [this guide](https://developers.icons8.com/).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.icons8.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Categories
    #
    # + platform - the platform that we are searching icons for 
    # + language - the language code to get localized result 
    # + return - OK 
    remote isolated function getCategories(string platform, string language) returns Categories|error {
        string  path = string `/api/iconsets/v3/categories?platform=${platform}&language=${language}`;
        map<anydata> queryParam = {"token": self.apiKeyConfig.token};
        path = path + check getPathForQueryParam(queryParam);
        Categories response = check self.clientEp-> get(path, targetType = Categories);
        return response;
    }
    # By Category
    #
    # + category - the code of category 
    # + subcategory - the code of subcategory 
    # + amount - the maximum number of icons which you'd like to receive 
    # + offset - the offset from the first received result 
    # + platform - the style of the icons 
    # + language - the language code to get localized result 
    # + return - OK 
    remote isolated function getByCategory(string category, string subcategory, decimal amount, decimal offset, string platform, string language) returns Icon|error {
        string  path = string `/api/iconsets/v3/category?category=${category}&subcategory=${subcategory}&amount=${amount}&offset=${offset}&platform=${platform}&language=${language}`;
        map<anydata> queryParam = {"token": self.apiKeyConfig.token};
        path = path + check getPathForQueryParam(queryParam);
        Icon response = check self.clientEp-> get(path, targetType = Icon);
        return response;
    }
    # Latest
    #
    # + amount - the maximum number of icons which you'd like to receive 
    # + offset - the offset from the first received result 
    # + term - Term 
    # + platform - the style of the icons 
    # + language - the language code to get localized result 
    # + return - OK 
    remote isolated function getLatest(decimal amount, decimal offset, string term, string platform, string language) returns LatestIcons|error {
        string  path = string `/api/iconsets/v3/latest?term=${term}&amount=${amount}&offset=${offset}&platform=${platform}&language=${language}`;
        map<anydata> queryParam = {"token": self.apiKeyConfig.token};
        path = path + check getPathForQueryParam(queryParam);
        LatestIcons response = check self.clientEp-> get(path, targetType = LatestIcons);
        return response;
    }
    # By Keyword v3
    #
    # + term - the name or tag of the icon or any other phrase. e.g. use "@home" to find icons with the tag "home" and "=home" to find icons with the name "home" 
    # + amount - the maximum number of icons which you'd like to receive (will be multiplied by platforms count, if you didn't specify the platform and didn't set the 'exact_amount' parameter) 
    # + exactAmount - set it to 'true' if you'd like to receive the exact amount of icons, not multiplied by platforms count 
    # + offset - the offset from the first received result 
    # + platform - the style of the icons 
    # + language - the language code to get localized result 
    # + return - OK 
    remote isolated function getByKeyword(string term, decimal amount, boolean exactAmount, decimal offset, string platform, string language) returns Category|error {
        string  path = string `/api/iconsets/v3/search?term=${term}&amount=${amount}&offset=${offset}&platform=${platform}&language=${language}&exact_amount=${exactAmount}`;
        map<anydata> queryParam = {"token": self.apiKeyConfig.token};
        path = path + check getPathForQueryParam(queryParam);
        Category response = check self.clientEp-> get(path, targetType = Category);
        return response;
    }
    # Totals
    #
    # + since - the optional date to calculate the total number of icons that were created after it. It should be in format "four year digits - dash - two month number digits - dash - two day number digits. For example 2014-12-31 means "31th of December, 2014". 
    # + return - OK 
    remote isolated function getTotals(string since) returns TotalsResponse|error {
        string  path = string `/api/iconsets/v3/total?since=${since}`;
        map<anydata> queryParam = {"token": self.apiKeyConfig.token};
        path = path + check getPathForQueryParam(queryParam);
        TotalsResponse response = check self.clientEp-> get(path, targetType = TotalsResponse);
        return response;
    }
    # From a Collection
    #
    # + payload - Item to be added 
    # + return - OK 
    remote isolated function postCollection(PostCollectionRequest payload) returns CreatedItem|error {
        string  path = string `/api/task/web-font/collection`;
        map<anydata> queryParam = {"token": self.apiKeyConfig.token};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreatedItem response = check self.clientEp->post(path, request, targetType=CreatedItem);
        return response;
    }
    # From Separate Icons
    #
    # + payload - Item to be added 
    # + return - OK 
    remote isolated function postIcons(PostIconsRequest payload) returns CreatedItem|error {
        string  path = string `/api/task/web-font/icons`;
        map<anydata> queryParam = {"token": self.apiKeyConfig.token};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreatedItem response = check self.clientEp->post(path, request, targetType=CreatedItem);
        return response;
    }
}
