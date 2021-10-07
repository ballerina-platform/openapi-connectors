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
    # Represents API Key `api-key`
    string apiKey;
|};

# This is a generated connector for [New York Times Article Search API v1.0.0](https://developer.nytimes.com/docs/articlesearch-product/1/overview) OpenAPI specification.
# With the Article Search API, you can search New York Times articles from Sept. 18, 1851 to today, retrieving headlines, abstracts, lead paragraphs, links to associated multimedia and other article metadata.  
# Use the Article Search API to look up articles by keyword. You can refine your search using filters and facets.
@display {label: "New York Times Article Search", iconPath: "resources/nytimes.articlesearch.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [NYTimes account](https://developer.nytimes.com/accounts/login) and obtain tokens following [this guide](https://developer.nytimes.com/get-started).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.nytimes.com/svc/search/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Article Search
    #
    # + q - Search query term. Search is performed on the article body, headline and byline. 
    # + fq - "Filtered search query using standard Lucene syntax.  The filter query can be specified with or without a limiting field: label.  See Filtering Your Search for more information about filtering." 
    # + beginDate - "Format: YYYYMMDD  Restricts responses to results with publication dates of the date specified or later." 
    # + endDate - "Format: YYYYMMDD  Restricts responses to results with publication dates of the date specified or earlier." 
    # + sort - "By default, search results are sorted by their relevance to the query term (q). Use the sort parameter to sort by pub_date." 
    # + fl - "Comma-delimited list of fields (no limit)   Limits the fields returned in your search results. By default (unless you include an fl list in your request), the following fields are returned:    web_url   snippet   lead_paragraph   abstract   print_page   blog   source   multimedia   headline   keywords   pub_date   document_type   news_desk   byline   type_of_material   _id   word_count" 
    # + hl - Enables highlighting in search results. When set to true, the query term (q) is highlighted in the headline and lead_paragraph fields. Note: If highlighting is enabled, snippet will be returned even if it is not specified in your fl list." 
    # + page - "The value of page corresponds to a set of 10 results (it does not indicate the starting number of the result set). For example, page=0 corresponds to records 0-9. To return records 10-19, set page to 1, not 10." 
    # + facetField - Comma-delimited list of facets Specifies the sets of facet values to include in the facets array at the end of response, which collects the facet values from all the search results. By default no facet fields will be returned. Below is the list of valid facets: section_name document_type type_of_material source day_of_week To learn more about using facets, see Using Facets. 
    # + facetFilter - When set to true, facet counts will respect any applied filters (fq, date range, etc.) in addition to the main query term. To filter facet counts, specifying at least one facet_field is required. To learn more about using facets, see Using Facets. 
    # + return - The docs requested by the article search. 
    remote isolated function articleSearch(string? q = (), string? fq = (), string? beginDate = (), string? endDate = (), string? sort = (), string? fl = (), boolean hl = false, int page = 0, string? facetField = (), boolean facetFilter = false) returns InlineResponse200|error {
        string  path = string `/articlesearch.json`;
        map<anydata> queryParam = {"q": q, "fq": fq, "begin_date": beginDate, "end_date": endDate, "sort": sort, "fl": fl, "hl": hl, "page": page, "facet_field": facetField, "facet_filter": facetFilter, "api-key": self.apiKeyConfig.apiKey};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp-> get(path, targetType = InlineResponse200);
        return response;
    }
}
