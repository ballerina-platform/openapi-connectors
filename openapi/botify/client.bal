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
    }
    # List all analyses for a project
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + page - Page Number 
    # + size - Page Size 
    # + return - Successful operation 
    remote isolated function getProjectAnalyses(string username, string projectSlug, int? page = (), int? size = ()) returns InlineResponse200|error {
        string  path = string `/analyses/${username}/${projectSlug}`;
        map<anydata> queryParam = {"page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse200);
        return response;
    }
    # Get an Analysis detail
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + return - Successful operation 
    remote isolated function getAnalysisSummary(string username, string projectSlug, string analysisSlug) returns AnalysisDetail|error {
        string  path = string `/analyses/${username}/${projectSlug}/${analysisSlug}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AnalysisDetail response = check self.clientEp-> get(path, accHeaders, targetType = AnalysisDetail);
        return response;
    }
    # Return global statistics for an analysis
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + return - Successful operation 
    remote isolated function getCrawlStatistics(string username, string projectSlug, string analysisSlug) returns CrawlStatistics|error {
        string  path = string `/analyses/${username}/${projectSlug}/${analysisSlug}/crawl_statistics`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CrawlStatistics response = check self.clientEp-> get(path, accHeaders, targetType = CrawlStatistics);
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
        string  path = string `/analyses/${username}/${projectSlug}/${analysisSlug}/crawl_statistics/time`;
        map<anydata> queryParam = {"limit": 'limit, "frequency": frequency};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CrawlStatisticsTime response = check self.clientEp-> get(path, accHeaders, targetType = CrawlStatisticsTime);
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
        string  path = string `/analyses/${username}/${projectSlug}/${analysisSlug}/crawl_statistics/urls/${listType}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json[] response = check self.clientEp-> get(path, accHeaders, targetType = jsonArr);
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
        string  path = string `/analyses/${username}/${projectSlug}/${analysisSlug}/features/ganalytics/orphan_urls/${medium}/${'source}`;
        map<anydata> queryParam = {"page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2001);
        return response;
    }
    # Get inlinks percentiles
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + return - Successful operation 
    remote isolated function getLinksPercentiles(string username, string projectSlug, string analysisSlug) returns LinksPercentiles|error {
        string  path = string `/analyses/${username}/${projectSlug}/${analysisSlug}/features/links/percentiles`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        LinksPercentiles response = check self.clientEp-> get(path, accHeaders, targetType = LinksPercentiles);
        return response;
    }
    # Lost pagerank
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + return - Successful operation 
    remote isolated function getPageRankLost(string username, string projectSlug, string analysisSlug) returns PageRankLost|error {
        string  path = string `/analyses/${username}/${projectSlug}/${analysisSlug}/features/pagerank/lost`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PageRankLost response = check self.clientEp-> get(path, accHeaders, targetType = PageRankLost);
        return response;
    }
    # Get global information of the sitemaps found (sitemaps indexes, invalid sitemaps urls, etc
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + analysisSlug - Analysis' identifier 
    # + return - Successful operation 
    remote isolated function getSitemapsReport(string username, string projectSlug, string analysisSlug) returns SitemapsReport|error {
        string  path = string `/analyses/${username}/${projectSlug}/${analysisSlug}/features/sitemaps/report`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SitemapsReport response = check self.clientEp-> get(path, accHeaders, targetType = SitemapsReport);
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
        string  path = string `/analyses/${username}/${projectSlug}/${analysisSlug}/features/sitemaps/samples/out_of_config`;
        map<anydata> queryParam = {"page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2002 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2002);
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
        string  path = string `/analyses/${username}/${projectSlug}/${analysisSlug}/features/sitemaps/samples/sitemap_only`;
        map<anydata> queryParam = {"page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2002 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2002);
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
        string  path = string `/analyses/${username}/${projectSlug}/${analysisSlug}/features/top_domains/domains`;
        map<anydata> queryParam = {"page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2003 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2003);
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
        string  path = string `/analyses/${username}/${projectSlug}/${analysisSlug}/features/top_domains/subdomains`;
        map<anydata> queryParam = {"page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2003 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2003);
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
        string  path = string `/analyses/${username}/${projectSlug}/${analysisSlug}/urls`;
        map<anydata> queryParam = {"area": area, "page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2004 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse2004);
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
        string  path = string `/analyses/${username}/${projectSlug}/${analysisSlug}/urls/aggs`;
        map<anydata> queryParam = {"area": area};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json[] response = check self.clientEp->post(path, request, headers = accHeaders, targetType=jsonArr);
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
        string  path = string `/analyses/${username}/${projectSlug}/${analysisSlug}/urls/datamodel`;
        map<anydata> queryParam = {"area": area};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CrawlDatamodel response = check self.clientEp-> get(path, accHeaders, targetType = CrawlDatamodel);
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
        string  path = string `/analyses/${username}/${projectSlug}/${analysisSlug}/urls/export`;
        map<anydata> queryParam = {"page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2005 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2005);
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
        string  path = string `/analyses/${username}/${projectSlug}/${analysisSlug}/urls/export`;
        map<anydata> queryParam = {"area": area};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CsvExportStatus response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CsvExportStatus);
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
        string  path = string `/analyses/${username}/${projectSlug}/${analysisSlug}/urls/export/${urlExportId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CsvExportStatus response = check self.clientEp-> get(path, accHeaders, targetType = CsvExportStatus);
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
        string  path = string `/analyses/${username}/${projectSlug}/${analysisSlug}/urls/suggested_filters`;
        map<anydata> queryParam = {"area": area};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UrlsAggsQuery response = check self.clientEp->post(path, request, headers = accHeaders, targetType=UrlsAggsQuery);
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
        string  path = string `/analyses/${username}/${projectSlug}/${analysisSlug}/urls/${url}`;
        map<anydata> queryParam = {"fields": fields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UrlDetail response = check self.clientEp-> get(path, accHeaders, targetType = UrlDetail);
        return response;
    }
    # List all active projects for the user
    #
    # + username - User's identifier 
    # + page - Page Number 
    # + size - Page Size 
    # + return - Successful operation 
    remote isolated function getUserProjects(string username, int? page = (), int? size = ()) returns InlineResponse2006|error {
        string  path = string `/projects/${username}`;
        map<anydata> queryParam = {"page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2006 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2006);
        return response;
    }
    # Match and replace parts of a URL based on rules passed in POST data
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + return - Successful operation 
    remote isolated function testUrlRewritingRules(string username, string projectSlug) returns URLRewritingRulesSerializer|error {
        string  path = string `/projects/${username}/${projectSlug}/features/url_rewriting/rules_validator`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        URLRewritingRulesSerializer response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = URLRewritingRulesSerializer);
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
        string  path = string `/projects/${username}/${projectSlug}/filters`;
        map<anydata> queryParam = {"page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2007 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2007);
        return response;
    }
    # Retrieves a specific saved filter's name, ID and filter value
    #
    # + username - User's identifier 
    # + projectSlug - Project's identifier 
    # + identifier - Saved Filter's identifier 
    # + return - Successful operation 
    remote isolated function getSavedFilter(string username, string projectSlug, string identifier) returns ProjectSavedFilter|error {
        string  path = string `/projects/${username}/${projectSlug}/filters/${identifier}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ProjectSavedFilter response = check self.clientEp-> get(path, accHeaders, targetType = ProjectSavedFilter);
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
        string  path = string `/projects/${username}/${projectSlug}/urls/aggs`;
        map<anydata> queryParam = {"area": area, "last_analysis_slug": lastAnalysisSlug, "nb_analyses": nbAnalyses};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Default response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Default);
        return response;
    }
}
