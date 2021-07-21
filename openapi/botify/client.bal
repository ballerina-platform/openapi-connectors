import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

# Please visit [here](https://app.botify.com/signin/) and obtain an `API Key`. 
#
# + apiKeys - Provide your API Key as `Authorization`. Eg: `{"Authorization" : "<Your API Key>"}`  
public type ApiKeysConfig record {
    map<string> apiKeys;
};

# Botify Saas API
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
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.botify.com/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys;
    }
    # List all analyses for a project
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + page - Page Number
    # + size - Page Size
    # + return - Successful operation
    remote isolated function getProjectAnalyses(string username, string project_slug, int? page = (), int? size = ()) returns InlineResponse200|error {
        string  path = string `/analyses/${username}/${project_slug}`;
        map<anydata> queryParam = {"page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse200);
        return response;
    }
    # Get an Analysis detail
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + analysis_slug - Analysis' identifier
    # + return - Successful operation
    remote isolated function getAnalysisSummary(string username, string project_slug, string analysis_slug) returns AnalysisDetail|error {
        string  path = string `/analyses/${username}/${project_slug}/${analysis_slug}`;
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AnalysisDetail response = check self.clientEp-> get(path, accHeaders, targetType = AnalysisDetail);
        return response;
    }
    # Return global statistics for an analysis
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + analysis_slug - Analysis' identifier
    # + return - Successful operation
    remote isolated function getCrawlStatistics(string username, string project_slug, string analysis_slug) returns CrawlStatistics|error {
        string  path = string `/analyses/${username}/${project_slug}/${analysis_slug}/crawl_statistics`;
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CrawlStatistics response = check self.clientEp-> get(path, accHeaders, targetType = CrawlStatistics);
        return response;
    }
    # Return crawl statistics grouped by time frequency (1 min, 5 mins or 60 min)
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + analysis_slug - Analysis' identifier
    # + frequency - Aggregation frequency
    # + 'limit - max number of elements to retrieve
    # + return - Successful operation
    remote isolated function getCrawlStatisticsByFrequency(string username, string project_slug, string analysis_slug, string frequency, int? 'limit = ()) returns CrawlStatisticsTime|error {
        string  path = string `/analyses/${username}/${project_slug}/${analysis_slug}/crawl_statistics/time`;
        map<anydata> queryParam = {"limit": 'limit, "frequency": frequency};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CrawlStatisticsTime response = check self.clientEp-> get(path, accHeaders, targetType = CrawlStatisticsTime);
        return response;
    }
    # Return a list of 1000 latest URLs crawled (all crawled URLs or only URLS with HTTP errors)
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + analysis_slug - Analysis' identifier
    # + list_type - URLs list type (crawled URLs or error URLs)
    # + return - Successful operation
    remote isolated function getCrawlStatisticsUrls(string username, string project_slug, string analysis_slug, string list_type) returns json[]|error {
        string  path = string `/analyses/${username}/${project_slug}/${analysis_slug}/crawl_statistics/urls/${list_type}`;
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json[] response = check self.clientEp-> get(path, accHeaders, targetType = jsonArr);
        return response;
    }
    # List of Orphan URLs
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + analysis_slug - Analysis' identifier
    # + medium - Type of traffic, value: 'organic' (from search engine)or 'social' (from a social network)
    # + 'source - Traffic source, value: name of the search engine or social network
    # + page - Page Number
    # + size - Page Size
    # + return - Successful operation
    remote isolated function getGanalyticsOrphanURLs(string username, string project_slug, string analysis_slug, string medium, string 'source, int? page = (), int? size = ()) returns InlineResponse2001|error {
        string  path = string `/analyses/${username}/${project_slug}/${analysis_slug}/features/ganalytics/orphan_urls/${medium}/${'source}`;
        map<anydata> queryParam = {"page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2001);
        return response;
    }
    # Get inlinks percentiles
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + analysis_slug - Analysis' identifier
    # + return - Successful operation
    remote isolated function getLinksPercentiles(string username, string project_slug, string analysis_slug) returns LinksPercentiles|error {
        string  path = string `/analyses/${username}/${project_slug}/${analysis_slug}/features/links/percentiles`;
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        LinksPercentiles response = check self.clientEp-> get(path, accHeaders, targetType = LinksPercentiles);
        return response;
    }
    # Lost pagerank
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + analysis_slug - Analysis' identifier
    # + return - Successful operation
    remote isolated function getPageRankLost(string username, string project_slug, string analysis_slug) returns PageRankLost|error {
        string  path = string `/analyses/${username}/${project_slug}/${analysis_slug}/features/pagerank/lost`;
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PageRankLost response = check self.clientEp-> get(path, accHeaders, targetType = PageRankLost);
        return response;
    }
    # Get global information of the sitemaps found (sitemaps indexes, invalid sitemaps urls, etc
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + analysis_slug - Analysis' identifier
    # + return - Successful operation
    remote isolated function getSitemapsReport(string username, string project_slug, string analysis_slug) returns SitemapsReport|error {
        string  path = string `/analyses/${username}/${project_slug}/${analysis_slug}/features/sitemaps/report`;
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SitemapsReport response = check self.clientEp-> get(path, accHeaders, targetType = SitemapsReport);
        return response;
    }
    # Sample list of URLs which were found in your sitemaps but outside of the
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + analysis_slug - Analysis' identifier
    # + page - Page Number
    # + size - Page Size
    # + return - Successful operation
    remote isolated function getSitemapsSamplesOutOfConfig(string username, string project_slug, string analysis_slug, int? page = (), int? size = ()) returns InlineResponse2002|error {
        string  path = string `/analyses/${username}/${project_slug}/${analysis_slug}/features/sitemaps/samples/out_of_config`;
        map<anydata> queryParam = {"page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2002 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2002);
        return response;
    }
    # Sample list of URLs which were found in your sitemaps, within the project
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + analysis_slug - Analysis' identifier
    # + page - Page Number
    # + size - Page Size
    # + return - Successful operation
    remote isolated function getSitemapsSamplesSitemapsOnly(string username, string project_slug, string analysis_slug, int? page = (), int? size = ()) returns InlineResponse2002|error {
        string  path = string `/analyses/${username}/${project_slug}/${analysis_slug}/features/sitemaps/samples/sitemap_only`;
        map<anydata> queryParam = {"page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2002 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2002);
        return response;
    }
    # Top domains
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + analysis_slug - Analysis' identifier
    # + page - Page Number
    # + size - Page Size
    # + return - Successful operation
    remote isolated function getLinksTopDomains(string username, string project_slug, string analysis_slug, int? page = (), int? size = ()) returns InlineResponse2003|error {
        string  path = string `/analyses/${username}/${project_slug}/${analysis_slug}/features/top_domains/domains`;
        map<anydata> queryParam = {"page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2003 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2003);
        return response;
    }
    # Top subddomains
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + analysis_slug - Analysis' identifier
    # + page - Page Number
    # + size - Page Size
    # + return - Successful operation
    remote isolated function getLinksTopSubdomains(string username, string project_slug, string analysis_slug, int? page = (), int? size = ()) returns InlineResponse2003|error {
        string  path = string `/analyses/${username}/${project_slug}/${analysis_slug}/features/top_domains/subdomains`;
        map<anydata> queryParam = {"page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2003 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2003);
        return response;
    }
    # Executes a query and returns a paginated response
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + analysis_slug - Analysis' identifier
    # + payload - Query urls
    # + area - Analysis context to execute the query
    # + page - Page Number
    # + size - Page Size
    # + return - Successful operation
    remote isolated function getUrls(string username, string project_slug, string analysis_slug, UrlsQuery payload, string area = "current", int? page = (), int? size = ()) returns InlineResponse2004|error {
        string  path = string `/analyses/${username}/${project_slug}/${analysis_slug}/urls`;
        map<anydata> queryParam = {"area": area, "page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
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
    # + project_slug - Project's identifier
    # + analysis_slug - Analysis' identifier
    # + payload - Aggregated query urls
    # + area - Analysis context to execute the queries
    # + return - Successful operation
    remote isolated function getUrlsAggs(string username, string project_slug, string analysis_slug, UrlsAggsQueries payload, string area = "current") returns json[]|error {
        string  path = string `/analyses/${username}/${project_slug}/${analysis_slug}/urls/aggs`;
        map<anydata> queryParam = {"area": area};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
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
    # + project_slug - Project's identifier
    # + analysis_slug - Analysis' identifier
    # + area - Analysis context to execute the queries
    # + return - Successful operation
    remote isolated function getUrlsDatamodel(string username, string project_slug, string analysis_slug, string area = "current") returns CrawlDatamodel|error {
        string  path = string `/analyses/${username}/${project_slug}/${analysis_slug}/urls/datamodel`;
        map<anydata> queryParam = {"area": area};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CrawlDatamodel response = check self.clientEp-> get(path, accHeaders, targetType = CrawlDatamodel);
        return response;
    }
    # A list of the CSV Exports requests and their current status
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + analysis_slug - Analysis' identifier
    # + page - Page Number
    # + size - Page Size
    # + return - Successful operation
    remote isolated function getUrlsExports(string username, string project_slug, string analysis_slug, int? page = (), int? size = ()) returns InlineResponse2005|error {
        string  path = string `/analyses/${username}/${project_slug}/${analysis_slug}/urls/export`;
        map<anydata> queryParam = {"page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2005 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2005);
        return response;
    }
    # Creates a new UrlExport object and starts a task that will export the results into a csv
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + analysis_slug - Analysis' identifier
    # + payload - Query urls
    # + area - Analysis context to execute the queries
    # + return - Successful operation
    remote isolated function createUrlsExport(string username, string project_slug, string analysis_slug, UrlsQuery payload, string area = "current") returns CsvExportStatus|error {
        string  path = string `/analyses/${username}/${project_slug}/${analysis_slug}/urls/export`;
        map<anydata> queryParam = {"area": area};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
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
    # + project_slug - Project's identifier
    # + analysis_slug - Analysis' identifier
    # + url_export_id - Url Export ID
    # + return - Successful operation
    remote isolated function getUrlsExportStatus(string username, string project_slug, string analysis_slug, string url_export_id) returns CsvExportStatus|error {
        string  path = string `/analyses/${username}/${project_slug}/${analysis_slug}/urls/export/${url_export_id}`;
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CsvExportStatus response = check self.clientEp-> get(path, accHeaders, targetType = CsvExportStatus);
        return response;
    }
    # Return most frequent segments (= suggested patterns in the previous version)
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + analysis_slug - Analysis' identifier
    # + payload - Aggregated url query
    # + area - Analysis context to execute the queries
    # + return - Successful operation
    remote isolated function getUrlsSuggestedFilters(string username, string project_slug, string analysis_slug, UrlsAggsQuery payload, string area = "current") returns UrlsAggsQuery|error {
        string  path = string `/analyses/${username}/${project_slug}/${analysis_slug}/urls/suggested_filters`;
        map<anydata> queryParam = {"area": area};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
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
    # + project_slug - Project's identifier
    # + analysis_slug - Analysis' identifier
    # + url - (Urlencoded) Searched URL
    # + fields - comma separated list of fields to return (c.f. URLs Datamodel)
    # + return - Successful operation
    remote isolated function getUrlDetail(string username, string project_slug, string analysis_slug, string url, string[]? fields = ()) returns UrlDetail|error {
        string  path = string `/analyses/${username}/${project_slug}/${analysis_slug}/urls/${url}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
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
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2006 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2006);
        return response;
    }
    # Match and replace parts of a URL based on rules passed in POST data
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + return - Successful operation
    remote isolated function testUrlRewritingRules(string username, string project_slug) returns URLRewritingRulesSerializer|error {
        string  path = string `/projects/${username}/${project_slug}/features/url_rewriting/rules_validator`;
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        URLRewritingRulesSerializer response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = URLRewritingRulesSerializer);
        return response;
    }
    # List all the project's saved filters (each filter's name, ID and filter value)
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + page - Page Number
    # + size - Page Size
    # + return - Successful operation
    remote isolated function getSavedFilters(string username, string project_slug, int? page = (), int? size = ()) returns InlineResponse2007|error {
        string  path = string `/projects/${username}/${project_slug}/filters`;
        map<anydata> queryParam = {"page": page, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2007 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2007);
        return response;
    }
    # Retrieves a specific saved filter's name, ID and filter value
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + identifier - Saved Filter's identifier
    # + return - Successful operation
    remote isolated function getSavedFilter(string username, string project_slug, string identifier) returns ProjectSavedFilter|error {
        string  path = string `/projects/${username}/${project_slug}/filters/${identifier}`;
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ProjectSavedFilter response = check self.clientEp-> get(path, accHeaders, targetType = ProjectSavedFilter);
        return response;
    }
    # Project Query aggregator
    #
    # + username - User's identifier
    # + project_slug - Project's identifier
    # + payload - Aggregated query urls
    # + area - Analysis context to execute the queries
    # + lastAnalysisSlug - Last analysis on the trend
    # + nbAnalyses - Max number of analysis to return
    # + return - Successful operation
    remote isolated function getProjectUrlsAggs(string username, string project_slug, UrlsAggsQueries payload, string area = "current", string? lastAnalysisSlug = (), int nbAnalyses = 20) returns Default|error {
        string  path = string `/projects/${username}/${project_slug}/urls/aggs`;
        map<anydata> queryParam = {"area": area, "last_analysis_slug": lastAnalysisSlug, "nb_analyses": nbAnalyses};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys.get("Authorization")};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Default response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Default);
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

# Generate header map for given header values.
#
# + headerParam - Headers  map
# + return - Returns generated map or error at failure of client initialization
isolated function  getMapForHeaders(map<any>   headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
