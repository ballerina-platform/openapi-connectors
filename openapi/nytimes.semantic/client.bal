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

# This is a generated connector from [New York Times Semantic API v2.0.0](https://developer.nytimes.com/docs/semantic-api-product/1/overview) OpenAPI specification.
# With the New York Times Semantic API you can get sementic terms (people, places, organizations, and locations).
# The Semantic API complements the Articles API. With the Semantic API, you get access to the long list of people, places, organizations and other locations, entities and descriptors that make up the controlled vocabulary used as metadata by The New York Times (sometimes referred to as Times Tags and used for Times Topics pages).
# The Semantic API uses concepts which are, by definition, terms in The New York Times controlled vocabulary. Like the way facets are used in the Articles API, concepts are a good way to uncover articles of interest in The New York Times archive, and at the same time, limit the scope and number of those articles. The Semantic API maps to external semantic data resources, in a fashion consistent with the idea of linked data. The Semantic API also provides combination and relationship information to other, similar concepts in The New York Times controlled vocabulary.
@display {label: "New York Times Semantic", iconPath: "resources/nytimes.semantic.svg"}
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
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.nytimes.com/svc/semantic/v2/concept") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Get Concepts.
    #
    # + conceptType - The type of the concept, used for Constructing a Semantic API Request by Concept Type and Specific Concept Name. The parameter is defined as a name-value pair, as in "concept_type=[nytd_geo|nytd_per|nytd_org|nytd_des]". 
    # + specificConcept - The name of the concept, used for Constructing a Semantic API Request by Concept Type and Specific Concept Name. The parameter is defined in the URI path, as the element immediately preceding ".json" like with "Baseball.json". 
    # + fields - "all" or comma-separated list of specific optional fields: pages, ticker_symbol, links, taxonomy, combinations, geocodes, article_list, scope_notes, search_api_query Optional fields are returned in result_set. They are briefly explained here: pages: A list of topic pages associated with a specific concept. ticker_symbol: If this concept is a publicly traded company, this field contains the ticker symbol. links: A list of links from this concept to external data resources. taxonomy: For descriptor concepts, this field returns a list of taxonomic relations to other concepts. combinations: For descriptor concepts, this field returns a list of the specific meanings tis concept takes on when combined with other concepts. geocodes: For geographic concepts, the full GIS record from geonames. article_list: A list of up to 10 articles associated with this concept. scope_notes: Scope notes contains clarifications and meaning definitions that explicate the relationship between the concept and an article. search_api_query: Returns the request one would need to submit to the Article Search API to obtain a list of articles annotated with this concept. 
    # + query - Precedes the search term string. Used in a Search Query. Except for &lt;specific_concept_name&gt;, Search Query will take the required parameters listed above (&lt;concept_type&gt;, &lt;concept_uri&gt;, &lt;article_uri&gt;) as an optional_parameter in addition to the query=&lt;query_term&gt;. 
    # + return - An array of Concepts 
    remote isolated function getConcepts(string conceptType, string specificConcept, string query, string? fields = ()) returns InlineResponse200|error {
        string  path = string `/name/${conceptType}/${specificConcept}.json`;
        map<anydata> queryParam = {"fields": fields, "query": query, "api-key": self.apiKeyConfig.apiKey};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp-> get(path, targetType = InlineResponse200);
        return response;
    }
    # Search Concepts.
    #
    # + query - Precedes the search term string. Used in a Search Query. Except for &lt;specific_concept_name&gt;, Search Query will take the required parameters listed above (&lt;concept_type&gt;, &lt;concept_uri&gt;, &lt;article_uri&gt;) as an optional_parameter in addition to the query=&lt;query_term&gt;. 
    # + offset - Integer value for the index count from the first concept to the last concept, sorted alphabetically. Used in a Search Query. A Search Query will return up to 10 concepts in its results. 
    # + fields - "all" or comma-separated list of specific optional fields: pages, ticker_symbol, links, taxonomy, combinations, geocodes, article_list, scope_notes, search_api_query Optional fields are returned in result_set. They are briefly explained here: pages: A list of topic pages associated with a specific concept. ticker_symbol: If this concept is a publicly traded company, this field contains the ticker symbol. links: A list of links from this concept to external data resources. taxonomy: For descriptor concepts, this field returns a list of taxonomic relations to other concepts. combinations: For descriptor concepts, this field returns a list of the specific meanings tis concept takes on when combined with other concepts. geocodes: For geographic concepts, the full GIS record from geonames. article_list: A list of up to 10 articles associated with this concept. scope_notes: Scope notes contains clarifications and meaning definitions that explicate the relationship between the concept and an article. search_api_query: Returns the request one would need to submit to the Article Search API to obtain a list of articles annotated with this concept. 
    # + return - An array of Concepts 
    remote isolated function searchConcepts(string query, int offset = 10, string? fields = ()) returns InlineResponse2001|error {
        string  path = string `/search.json`;
        map<anydata> queryParam = {"query": query, "offset": offset, "fields": fields, "api-key": self.apiKeyConfig.apiKey};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp-> get(path, targetType = InlineResponse2001);
        return response;
    }
}
