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
import ballerina/url;
import ballerina/lang.'string;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# Search for information on companies using a website or company name and get access to Company Data, News, Blog Posts, Competitor Lists and much more.
@display {label: "Owler", iconPath: "resources/owler.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Owler account](https://corp.owler.com/) and obtain the API key.
    #
    # + apiKeyConfig - Provide your API key as `user_key`. Eg: `{"user_key" : "<API key>"}` 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.owler.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Basic Search Company by Ticker or Website or Name or PermID
    #
    # + q - Search term 
    # + fields - Fields to be searched - name, website, ticker, permid. If not specfied, will be searched against all fields 
    # + 'limit - Number of results to be displayed - 10 (by default, if not specified) to 30 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + return - Search Results 
    remote isolated function basicCompanySearch(string q, string[]? fields = (), string? 'limit = (), string format = "json") returns BasicResults|error {
        string  path = string `/v1/company/basicsearch`;
        map<anydata> queryParam = {"q": q, "fields": fields, "limit": 'limit, "format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeys["user_key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BasicResults response = check self.clientEp-> get(path, accHeaders, targetType = BasicResults);
        return response;
    }
    # Get Competitor information by Id
    #
    # + companyId - Company Id 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + return - Competitors Data 
    remote isolated function geCompetiterInformationById(string companyId, string format = "json") returns CompanyCompetitorVO|error {
        string  path = string `/v1/company/competitor/id/${companyId}`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeys["user_key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CompanyCompetitorVO response = check self.clientEp-> get(path, accHeaders, targetType = CompanyCompetitorVO);
        return response;
    }
    # Get Competitor information by URL
    #
    # + website - Company Id 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + return - Competitors Data 
    remote isolated function getCompetitorInformationByUrl(string website, string format = "json") returns CompanyCompetitorVO|error {
        string  path = string `/v1/company/competitor/url/${website}`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeys["user_key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CompanyCompetitorVO response = check self.clientEp-> get(path, accHeaders, targetType = CompanyCompetitorVO);
        return response;
    }
    # Get Competitor information by Id
    #
    # + companyId - Company Id 
    # + paginationId - Pass pagination_id as * in the first API request. The API response will return top competitors along with the next pagination_id which can be passed in the subsequent API request to get the next set of competitors. Repeat this process until needed or till the pagination_id returned is blank. Note:Every response will have maximum of 50 competitors. 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + return - Competitors Data 
    remote isolated function getCompetitorInformationByIdPremium(string companyId, string? paginationId = (), string format = "json") returns Competitors|error {
        string  path = string `/v1/company/competitorpremium/id/${companyId}`;
        map<anydata> queryParam = {"pagination_id": paginationId, "format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeys["user_key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Competitors response = check self.clientEp-> get(path, accHeaders, targetType = Competitors);
        return response;
    }
    # Get Competitor information by Url
    #
    # + website - Company Id 
    # + paginationId - Pass pagination_id as * in the first API request. The API response will return top competitors along with the next pagination_id which can be passed in the subsequent API request to get the next set of competitors. Repeat this process until needed or till the pagination_id returned is blank. Note:Every response will have maximum of 50 competitors. 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + return - Competitors Data 
    remote isolated function getCompetitorInformationByUrlPremium(string website, string? paginationId = (), string format = "json") returns Competitors|error {
        string  path = string `/v1/company/competitorpremium/url/${website}`;
        map<anydata> queryParam = {"pagination_id": paginationId, "format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeys["user_key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Competitors response = check self.clientEp-> get(path, accHeaders, targetType = Competitors);
        return response;
    }
    # Fuzzy Search Company by Name or Address or Phone
    #
    # + q - Search term 
    # + fields - Fields to be searched - name, website, ticker, permid, address, phone. Each field and its corresponding value has to be specified 
    # + 'limit - Number of results to be displayed - 10 (by default, if not specified) to 30 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + return - Search Results 
    remote isolated function fuzzyCompanySearch(string q, string[] fields, string? 'limit = (), string format = "json") returns FuzzyResults|error {
        string  path = string `/v1/company/fuzzysearch`;
        map<anydata> queryParam = {"q": q, "fields": fields, "limit": 'limit, "format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeys["user_key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FuzzyResults response = check self.clientEp-> get(path, accHeaders, targetType = FuzzyResults);
        return response;
    }
    # Get Company by Id
    #
    # + companyId - Company Id 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + return - Company Data 
    remote isolated function getCompanyById(string companyId, string format = "json") returns Company|error {
        string  path = string `/v1/company/id/${companyId}`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeys["user_key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Company response = check self.clientEp-> get(path, accHeaders, targetType = Company);
        return response;
    }
    # Search Company by Ticker or Website or Name or PermID
    #
    # + q - Search term 
    # + fields - Fields to be searched - name, website, ticker. If not specified, will be searched against all fields 
    # + 'limit - Number of results to be displayed - 10 (by default, if not specified) to 30 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + return - Search Results 
    remote isolated function searchCompany(string q, string[]? fields = (), string? 'limit = (), string format = "json") returns Results|error {
        string  path = string `/v1/company/search`;
        map<anydata> queryParam = {"q": q, "fields": fields, "limit": 'limit, "format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeys["user_key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Results response = check self.clientEp-> get(path, accHeaders, targetType = Results);
        return response;
    }
    # Get Company by URL
    #
    # + website - Company Domain 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + return - Company Data 
    remote isolated function getCompanyByUrl(string website, string format = "json") returns Company|error {
        string  path = string `/v1/company/url/${website}`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeys["user_key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Company response = check self.clientEp-> get(path, accHeaders, targetType = Company);
        return response;
    }
    # Get Complete Company Info by Id
    #
    # + companyId - Company Id 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + return - Company Data 
    remote isolated function getCompanyByIdPremium(string companyId, string format = "json") returns Company|error {
        string  path = string `/v1/companypremium/id/${companyId}`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeys["user_key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Company response = check self.clientEp-> get(path, accHeaders, targetType = Company);
        return response;
    }
    # Get Basic Company Info by Url
    #
    # + website - Company Domain 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + return - Company Data 
    remote isolated function getCompanyByUrlPremium(string website, string format = "json") returns Company|error {
        string  path = string `/v1/companypremium/url/${website}`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeys["user_key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Company response = check self.clientEp-> get(path, accHeaders, targetType = Company);
        return response;
    }
    # Get Feeds for given Company Ids
    #
    # + companyId - Company Ids separated by comma (Maximum of 150 Company Ids) 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + 'limit - Number of results to be displayed - 10 (by default, if not specified) to 100 
    # + paginationId - Pass pagination_id as blank in the first API request. The API response will return the latest feeds along with the next pagination_id which can be passed in the subsequent API request to get the next set of feeds. Repeat this process until needed or till the pagination_id returned is blank 
    # + category - Categories separated by comma. If not specified, will search against all categories 
    # + return - Feeds Data 
    remote isolated function getFeedsForCompanyIds(string[] companyId, string format = "json", string 'limit = "10", string paginationId = "*", string[]? category = ()) returns Results|error {
        string  path = string `/v1/feed`;
        map<anydata> queryParam = {"format": format, "company_id": companyId, "limit": 'limit, "pagination_id": paginationId, "category": category};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeys["user_key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Results response = check self.clientEp-> get(path, accHeaders, targetType = Results);
        return response;
    }
    # Get Feeds for given Company Websites
    #
    # + domain - Company Websites separated by comma (Maximum of 10 Company Websites) 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + 'limit - Number of results to be displayed - 10 (by default, if not specified) to 100 
    # + paginationId - Pass pagination_id as blank in the first API request. The API response will return the latest feeds along with the next pagination_id which can be passed in the subsequent API request to get the next set of feeds. Repeat this process until needed or till the pagination_id returned is blank 
    # + category - Categories separated by comma. If not specified, will search against all categories 
    # + return - Feeds Data 
    remote isolated function getFeedsForCompanyUrls(string[] domain, string format = "json", string 'limit = "10", string paginationId = "*", string[]? category = ()) returns Results|error {
        string  path = string `/v1/feed/url`;
        map<anydata> queryParam = {"format": format, "domain": domain, "limit": 'limit, "pagination_id": paginationId, "category": category};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeys["user_key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Results response = check self.clientEp-> get(path, accHeaders, targetType = Results);
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

# Generate header map for given header values.
#
# + headerParam - Headers  map 
# + return - Returns generated map or error at failure of client initialization 
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
