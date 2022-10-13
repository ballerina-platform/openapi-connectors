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
    # All requests on the Botify API needs to include an API key. The API key can be provided as part of the query string or as a request header. The name of the API key needs to be `Authorization`.
    string authorization;
|};

# This is a generated connector for [Botify API v1.0.0](https://developers.botify.com/reference) OpenAPI specification.
# API for Internet Archive's Search-related services.
@display {label: "Botify", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Request a [Botify Account](https://www.botify.com/request-a-demo) and obtain tokens following [this guide](https://www.botify.com/blog/seo-guide-botify-api).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.botify.com/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # List all analyses for a project
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + page - Page Number 
    # + size - Page Size 
    # + return - Successful operation 
    remote isolated function getProjectAnalyses(string username, string projectSlug, int? page = (), int? size = ()) returns InlineResponse200|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}`;
        map<anydata> queryParam = {"page": page, "size": size};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get an Analysis detail
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + return - Successful operation 
    remote isolated function getAnalysisSummary(string username, string projectSlug, string analysisSlug) returns AnalysisDetail|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/${getEncodedUri(analysisSlug)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AnalysisDetail response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Return global statistics for an analysis
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + return - Successful operation 
    remote isolated function getCrawlStatistics(string username, string projectSlug, string analysisSlug) returns CrawlStatistics|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/${getEncodedUri(analysisSlug)}/crawl_statistics`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CrawlStatistics response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Return crawl statistics grouped by time frequency (1 min, 5 mins or 60 min)
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + 'limit - max number of elements to retrieve 
    # + frequency - Aggregation frequency 
    # + return - Successful operation 
    remote isolated function getCrawlStatisticsByFrequency(string username, string projectSlug, string analysisSlug, string frequency, int? 'limit = ()) returns CrawlStatisticsTime|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/${getEncodedUri(analysisSlug)}/crawl_statistics/time`;
        map<anydata> queryParam = {"limit": 'limit, "frequency": frequency};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CrawlStatisticsTime response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Return a list of 1000 latest URLs crawled (all crawled URLs or only URLS with HTTP errors)
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + listType - URLs list type (crawled URLs or error URLs) 
    # + return - Successful operation 
    remote isolated function getCrawlStatisticsUrls(string username, string projectSlug, string analysisSlug, string listType) returns json[]|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/${getEncodedUri(analysisSlug)}/crawl_statistics/urls/${getEncodedUri(listType)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List of Orphan URLs
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + medium - Type of traffic, value: 'organic' (from search engine)or 'social' (from a social network) 
    # + 'source - Traffic source, value: name of the search engine or social network 
    # + page - Page Number 
    # + size - Page Size 
    # + return - Successful operation 
    remote isolated function getGanalyticsOrphanURLs(string username, string projectSlug, string analysisSlug, string medium, string 'source, int? page = (), int? size = ()) returns InlineResponse2001|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/${getEncodedUri(analysisSlug)}/features/ganalytics/orphan_urls/${getEncodedUri(medium)}/${getEncodedUri('source)}`;
        map<anydata> queryParam = {"page": page, "size": size};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get inlinks percentiles
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + return - Successful operation 
    remote isolated function getLinksPercentiles(string username, string projectSlug, string analysisSlug) returns LinksPercentiles|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/${getEncodedUri(analysisSlug)}/features/links/percentiles`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LinksPercentiles response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Lost pagerank
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + return - Successful operation 
    remote isolated function getPageRankLost(string username, string projectSlug, string analysisSlug) returns PageRankLost|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/${getEncodedUri(analysisSlug)}/features/pagerank/lost`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PageRankLost response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get global information of the sitemaps found (sitemaps indexes, invalid sitemaps urls, etc
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + return - Successful operation 
    remote isolated function getSitemapsReport(string username, string projectSlug, string analysisSlug) returns SitemapsReport|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/${getEncodedUri(analysisSlug)}/features/sitemaps/report`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SitemapsReport response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Sample list of URLs which were found in your sitemaps but outside of the
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + page - Page Number 
    # + size - Page Size 
    # + return - Successful operation 
    remote isolated function getSitemapsSamplesOutOfConfig(string username, string projectSlug, string analysisSlug, int? page = (), int? size = ()) returns InlineResponse2002|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/${getEncodedUri(analysisSlug)}/features/sitemaps/samples/out_of_config`;
        map<anydata> queryParam = {"page": page, "size": size};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2002 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Sample list of URLs which were found in your sitemaps, within the project
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + page - Page Number 
    # + size - Page Size 
    # + return - Successful operation 
    remote isolated function getSitemapsSamplesSitemapsOnly(string username, string projectSlug, string analysisSlug, int? page = (), int? size = ()) returns InlineResponse2002|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/${getEncodedUri(analysisSlug)}/features/sitemaps/samples/sitemap_only`;
        map<anydata> queryParam = {"page": page, "size": size};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2002 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Top domains
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + page - Page Number 
    # + size - Page Size 
    # + return - Successful operation 
    remote isolated function getLinksTopDomains(string username, string projectSlug, string analysisSlug, int? page = (), int? size = ()) returns InlineResponse2003|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/${getEncodedUri(analysisSlug)}/features/top_domains/domains`;
        map<anydata> queryParam = {"page": page, "size": size};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2003 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Top subddomains
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + page - Page Number 
    # + size - Page Size 
    # + return - Successful operation 
    remote isolated function getLinksTopSubdomains(string username, string projectSlug, string analysisSlug, int? page = (), int? size = ()) returns InlineResponse2003|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/${getEncodedUri(analysisSlug)}/features/top_domains/subdomains`;
        map<anydata> queryParam = {"page": page, "size": size};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2003 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Executes a query and returns a paginated response
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + area - Analysis context to execute the query 
    # + page - Page Number 
    # + size - Page Size 
    # + payload - Query urls 
    # + return - Successful operation 
    remote isolated function getUrls(string username, string projectSlug, string analysisSlug, UrlsQuery payload, string area = "current", int? page = (), int? size = ()) returns InlineResponse2004|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/${getEncodedUri(analysisSlug)}/urls`;
        map<anydata> queryParam = {"area": area, "page": page, "size": size};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2004 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Query aggregator
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + area - Analysis context to execute the queries 
    # + payload - Aggregated query urls 
    # + return - Successful operation 
    remote isolated function getUrlsAggs(string username, string projectSlug, string analysisSlug, UrlsAggsQueries payload, string area = "current") returns json[]|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/${getEncodedUri(analysisSlug)}/urls/aggs`;
        map<anydata> queryParam = {"area": area};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Gets an Analysis datamodel
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + area - Analysis context to execute the queries 
    # + return - Successful operation 
    remote isolated function getUrlsDatamodel(string username, string projectSlug, string analysisSlug, string area = "current") returns CrawlDatamodel|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/${getEncodedUri(analysisSlug)}/urls/datamodel`;
        map<anydata> queryParam = {"area": area};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CrawlDatamodel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # A list of the CSV Exports requests and their current status
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + page - Page Number 
    # + size - Page Size 
    # + return - Successful operation 
    remote isolated function getUrlsExports(string username, string projectSlug, string analysisSlug, int? page = (), int? size = ()) returns InlineResponse2005|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/${getEncodedUri(analysisSlug)}/urls/export`;
        map<anydata> queryParam = {"page": page, "size": size};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2005 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Creates a new UrlExport object and starts a task that will export the results into a csv
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + area - Analysis context to execute the queries 
    # + payload - Query urls 
    # + return - Successful operation 
    remote isolated function createUrlsExport(string username, string projectSlug, string analysisSlug, UrlsQuery payload, string area = "current") returns CsvExportStatus|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/${getEncodedUri(analysisSlug)}/urls/export`;
        map<anydata> queryParam = {"area": area};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CsvExportStatus response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Checks the status of an CSVUrlExportJob object
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + urlExportId - Url Export ID 
    # + return - Successful operation 
    remote isolated function getUrlsExportStatus(string username, string projectSlug, string analysisSlug, string urlExportId) returns CsvExportStatus|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/${getEncodedUri(analysisSlug)}/urls/export/${getEncodedUri(urlExportId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CsvExportStatus response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Return most frequent segments (= suggested patterns in the previous version)
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + area - Analysis context to execute the queries 
    # + payload - Aggregated url query 
    # + return - Successful operation 
    remote isolated function getUrlsSuggestedFilters(string username, string projectSlug, string analysisSlug, UrlsAggsQuery payload, string area = "current") returns UrlsAggsQuery|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/${getEncodedUri(analysisSlug)}/urls/suggested_filters`;
        map<anydata> queryParam = {"area": area};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UrlsAggsQuery response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Gets the detail of an URL for an analysis
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + url - (Urlencoded) Searched URL 
    # + fields - comma separated list of fields to return (c.f. URLs Datamodel) 
    # + return - Successful operation 
    remote isolated function getUrlDetail(string username, string projectSlug, string analysisSlug, string url, string[]? fields = ()) returns UrlDetail|error {
        string resourcePath = string `/analyses/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/${getEncodedUri(analysisSlug)}/urls/${getEncodedUri(url)}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UrlDetail response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all active projects for the user
    #
    # + username - User's identifier 
    # + page - Page Number 
    # + size - Page Size 
    # + return - Successful operation 
    remote isolated function getUserProjects(string username, int? page = (), int? size = ()) returns InlineResponse2006|error {
        string resourcePath = string `/projects/${getEncodedUri(username)}`;
        map<anydata> queryParam = {"page": page, "size": size};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2006 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Match and replace parts of a URL based on rules passed in POST data
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + return - Successful operation 
    remote isolated function testUrlRewritingRules(string username, string projectSlug) returns URLRewritingRulesSerializer|error {
        string resourcePath = string `/projects/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/features/url_rewriting/rules_validator`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        URLRewritingRulesSerializer response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # List all the project's saved filters (each filter's name, ID and filter value)
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + page - Page Number 
    # + size - Page Size 
    # + return - Successful operation 
    remote isolated function getSavedFilters(string username, string projectSlug, int? page = (), int? size = ()) returns InlineResponse2007|error {
        string resourcePath = string `/projects/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/filters`;
        map<anydata> queryParam = {"page": page, "size": size};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2007 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieves a specific saved filter's name, ID and filter value
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + identifier - Saved Filter's identifier 
    # + return - Successful operation 
    remote isolated function getSavedFilter(string username, string projectSlug, string identifier) returns ProjectSavedFilter|error {
        string resourcePath = string `/projects/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/filters/${getEncodedUri(identifier)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ProjectSavedFilter response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Project Query aggregator
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + area - Analysis context to execute the queries 
    # + lastAnalysisSlug - Last analysis on the trend 
    # + nbAnalyses - Max number of analysis to return 
    # + payload - Aggregated query urls 
    # + return - Successful operation 
    remote isolated function getProjectUrlsAggs(string username, string projectSlug, UrlsAggsQueries payload, string area = "current", string? lastAnalysisSlug = (), int nbAnalyses = 20) returns Default|error {
        string resourcePath = string `/projects/${getEncodedUri(username)}/${getEncodedUri(projectSlug)}/urls/aggs`;
        map<anydata> queryParam = {"area": area, "last_analysis_slug": lastAnalysisSlug, "nb_analyses": nbAnalyses};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Default response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
