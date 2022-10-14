// Copyright (c) 2022 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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
    # Represents API Key `user_key`
    string userKey;
|};

# Search for information on companies using a website or company name and get access to Company Data, News, Blog Posts, Competitor Lists and much more.
@display {label: "Owler", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Owler account](https://corp.owler.com/) and obtain the API key.
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.owler.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Basic Search Company by Ticker or Website or Name or PermID
    #
    # + q - Search term 
    # + fields - Fields to be searched - name, website, ticker, permid. If not specfied, will be searched against all fields 
    # + 'limit - Number of results to be displayed - 10 (by default, if not specified) to 30 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + return - Search Results 
    remote isolated function basicCompanySearch(string q, string[]? fields = (), string? 'limit = (), string format = "json") returns BasicResults|error {
        string resourcePath = string `/v1/company/basicsearch`;
        map<anydata> queryParam = {"q": q, "fields": fields, "limit": 'limit, "format": format};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"user_key": self.apiKeyConfig.userKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BasicResults response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Competitor information by Id
    #
    # + companyId - Company Id 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + return - Competitors Data 
    remote isolated function geCompetiterInformationById(string companyId, string format = "json") returns CompanyCompetitorVO|error {
        string resourcePath = string `/v1/company/competitor/id/${getEncodedUri(companyId)}`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeyConfig.userKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CompanyCompetitorVO response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Competitor information by URL
    #
    # + website - Company Id 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + return - Competitors Data 
    remote isolated function getCompetitorInformationByUrl(string website, string format = "json") returns CompanyCompetitorVO|error {
        string resourcePath = string `/v1/company/competitor/url/${getEncodedUri(website)}`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeyConfig.userKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CompanyCompetitorVO response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Competitor information by Id
    #
    # + companyId - Company Id 
    # + paginationId - Pass pagination_id as * in the first API request. The API response will return top competitors along with the next pagination_id which can be passed in the subsequent API request to get the next set of competitors. Repeat this process until needed or till the pagination_id returned is blank. Note:Every response will have maximum of 50 competitors. 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + return - Competitors Data 
    remote isolated function getCompetitorInformationByIdPremium(string companyId, string? paginationId = (), string format = "json") returns Competitors|error {
        string resourcePath = string `/v1/company/competitorpremium/id/${getEncodedUri(companyId)}`;
        map<anydata> queryParam = {"pagination_id": paginationId, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeyConfig.userKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Competitors response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Competitor information by Url
    #
    # + website - Company Id 
    # + paginationId - Pass pagination_id as * in the first API request. The API response will return top competitors along with the next pagination_id which can be passed in the subsequent API request to get the next set of competitors. Repeat this process until needed or till the pagination_id returned is blank. Note:Every response will have maximum of 50 competitors. 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + return - Competitors Data 
    remote isolated function getCompetitorInformationByUrlPremium(string website, string? paginationId = (), string format = "json") returns Competitors|error {
        string resourcePath = string `/v1/company/competitorpremium/url/${getEncodedUri(website)}`;
        map<anydata> queryParam = {"pagination_id": paginationId, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeyConfig.userKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Competitors response = check self.clientEp->get(resourcePath, httpHeaders);
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
        string resourcePath = string `/v1/company/fuzzysearch`;
        map<anydata> queryParam = {"q": q, "fields": fields, "limit": 'limit, "format": format};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"user_key": self.apiKeyConfig.userKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FuzzyResults response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Company by Id
    #
    # + companyId - Company Id 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + return - Company Data 
    remote isolated function getCompanyById(string companyId, string format = "json") returns Company|error {
        string resourcePath = string `/v1/company/id/${getEncodedUri(companyId)}`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeyConfig.userKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Company response = check self.clientEp->get(resourcePath, httpHeaders);
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
        string resourcePath = string `/v1/company/search`;
        map<anydata> queryParam = {"q": q, "fields": fields, "limit": 'limit, "format": format};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"user_key": self.apiKeyConfig.userKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Results response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Company by URL
    #
    # + website - Company Domain 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + return - Company Data 
    remote isolated function getCompanyByUrl(string website, string format = "json") returns Company|error {
        string resourcePath = string `/v1/company/url/${getEncodedUri(website)}`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeyConfig.userKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Company response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Complete Company Info by Id
    #
    # + companyId - Company Id 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + return - Company Data 
    remote isolated function getCompanyByIdPremium(string companyId, string format = "json") returns Company|error {
        string resourcePath = string `/v1/companypremium/id/${getEncodedUri(companyId)}`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeyConfig.userKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Company response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Basic Company Info by Url
    #
    # + website - Company Domain 
    # + format - Format of the response content - json (by default if not specified), xml 
    # + return - Company Data 
    remote isolated function getCompanyByUrlPremium(string website, string format = "json") returns Company|error {
        string resourcePath = string `/v1/companypremium/url/${getEncodedUri(website)}`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"user_key": self.apiKeyConfig.userKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Company response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Feeds for given Company Ids
    #
    # + format - Format of the response content - json (by default if not specified), xml 
    # + companyId - Company Ids separated by comma (Maximum of 150 Company Ids) 
    # + 'limit - Number of results to be displayed - 10 (by default, if not specified) to 100 
    # + paginationId - Pass pagination_id as blank in the first API request. The API response will return the latest feeds along with the next pagination_id which can be passed in the subsequent API request to get the next set of feeds. Repeat this process until needed or till the pagination_id returned is blank 
    # + category - Categories separated by comma. If not specified, will search against all categories 
    # + return - Feeds Data 
    remote isolated function getFeedsForCompanyIds(string[] companyId, string format = "json", string 'limit = "10", string paginationId = "*", string[]? category = ()) returns Results|error {
        string resourcePath = string `/v1/feed`;
        map<anydata> queryParam = {"format": format, "company_id": companyId, "limit": 'limit, "pagination_id": paginationId, "category": category};
        map<Encoding> queryParamEncoding = {"company_id": {style: FORM, explode: false}, "category": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"user_key": self.apiKeyConfig.userKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Results response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Feeds for given Company Websites
    #
    # + format - Format of the response content - json (by default if not specified), xml 
    # + domain - Company Websites separated by comma (Maximum of 10 Company Websites) 
    # + 'limit - Number of results to be displayed - 10 (by default, if not specified) to 100 
    # + paginationId - Pass pagination_id as blank in the first API request. The API response will return the latest feeds along with the next pagination_id which can be passed in the subsequent API request to get the next set of feeds. Repeat this process until needed or till the pagination_id returned is blank 
    # + category - Categories separated by comma. If not specified, will search against all categories 
    # + return - Feeds Data 
    remote isolated function getFeedsForCompanyUrls(string[] domain, string format = "json", string 'limit = "10", string paginationId = "*", string[]? category = ()) returns Results|error {
        string resourcePath = string `/v1/feed/url`;
        map<anydata> queryParam = {"format": format, "domain": domain, "limit": 'limit, "pagination_id": paginationId, "category": category};
        map<Encoding> queryParamEncoding = {"domain": {style: FORM, explode: false}, "category": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"user_key": self.apiKeyConfig.userKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Results response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
