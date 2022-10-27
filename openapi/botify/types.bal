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
import ballerina/constraint;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # All requests on the Botify API needs to include an API key. The API key can be provided as part of the query string or as a request header. The name of the API key needs to be `Authorization`.
    @display {label: "", kind: "password"}
    string authorization;
|};

public type jsonArr json[];

public type CrawlDatamodelGroup record {
    # 
    string id;
    # 
    string name;
};

public type RewritingRuleSerializer record {
    # 
    boolean ignore_case;
    # 
    string regex;
    # 
    string replace;
};

public type User record {
    # 
    string company_name?;
    # 
    string date_joined?;
    # 
    string email?;
    # 
    string first_name?;
    # 
    string is_organization?;
    # 
    string last_name?;
    # 
    string login?;
    # 
    string status?;
    # 
    string url?;
};

public type SitemapsReportOnly record {
    # 
    int in_configuration;
    # 
    int out_of_configuration;
};

public type InlineResponse200 record {
    # 
    int count?;
    # 
    string next?;
    # 
    int page?;
    # 
    string previous?;
    # 
    Analysis[] results?;
    # 
    int size?;
};

public type String record {
};

public type CrawlStatisticsUrls record {
    # 
    string content_type;
    # 
    string date;
    # 
    int delay_first_byte;
    # 
    int delay_last_byte;
    # 
    boolean gzip;
    # 
    int http;
    # 
    int length;
    # 
    string redirects_to?;
    # 
    string url;
};

public type SitemapsReportSitemapError record {
    # 
    string message;
    # 
    string 'type;
};

public type SitemapsReportSitemap record {
    SitemapsReportSitemapError 'error?;
    # 
    string file_type?;
    # 
    int invalid_urls?;
    # 
    string[] sitemap_indexes?;
    # 
    string url;
    # 
    int valid_urls?;
};

# Detailed information of error
public type DefaultpayloadError record {
    # Error Code
    string error_code?;
    # If available, detailed error
    record {} error_detail?;
    # Error Message
    string message?;
};

public type UrlsAggsQueries UrlsAggsQuery[];

public type CrawlStatistics record {
    # 
    int depth_current;
    # 
    string last_upd_dt;
    # 
    int pages_dones;
    # 
    int pages_dones_2xx;
    # 
    int pages_dones_3xx;
    # 
    int pages_dones_4xx;
    # 
    int pages_dones_5xx;
    # 
    int pages_dones_networkerror;
    # 
    int pages_dones_xxx;
    # 
    int pages_known;
};

public type AnalysisDetail record {
    # 
    string config?;
    # 
    string date_finished?;
    # Date of last modified analysis
    string date_last_modified?;
    # 
    string date_launched?;
    # 
    string failures?;
    # 
    string features?;
    # 
    int id?;
    # 
    string name?;
    # 
    string red_button_domain?;
    # 
    string slug?;
    # 
    string url?;
    # 
    string urls_done?;
    # 
    string urls_in_queue?;
    User user;
};

public type ProjectSavedFilter record {
    # 
    record {} filters;
    # 
    string identifier?;
    # 
    string name;
};

public type CrawlOrphanURLs record {
    # 
    string url;
    # 
    int visits;
};

public type UrlsErrorAgg record {
    # 
    string error_code;
    # 
    string message;
};

public type ProjectSettingsSerializer record {
    # 
    string[] allowed_domains;
    # 
    string[] blacklisted_domains;
    # 
    boolean compare_crawl?;
    # 
    boolean crawl_gzip?;
    # 
    string extra_headers?;
    # Keep email in case user delete his social auth connection
    string google_analytics_account_email?;
    # 
    @constraint:Int {minValue: 1, maxValue: 90}
    int google_analytics_nb_days?;
    # 
    @constraint:Int {minValue: -2147483648, maxValue: 2147483647}
    int google_analytics_site_id?;
    # 
    @constraint:Int {minValue: -2147483648, maxValue: 2147483647}
    int google_social_auth_id?;
    # 
    string has_robots_txt?;
    # 
    string[] header_settings;
    # 
    @constraint:Int {maxValue: 2147483647}
    int max_depth?;
    # 
    @constraint:Int {minValue: 1, maxValue: 2147483647}
    int max_nb_pages;
    # 
    @constraint:Int {minValue: 1, maxValue: 2147483647}
    int max_pages_per_sec?;
    # 
    boolean respect_nofollow?;
    # 
    string[] sitemaps;
    # 
    string[] start_urls;
    # 
    string user_agent?;
};

public type SitemapsReport record {
    # 
    int count;
    # 
    SitemapsReportSitemap[] errors;
    # 
    SitemapsReportSitemap[] sitemap_indexes;
    SitemapsReportOnly sitemap_only;
    # 
    SitemapsReportSitemap[] sitemaps;
};

public type UrlsAggsQuery record {
    # 
    record {}[] aggs?;
    # 
    record {} filters?;
};

public type LinksPercentilesItem record {
    # 
    int avg;
    # 
    int id;
    # 
    int max;
    # 
    int metric_total;
    # 
    int min;
    # 
    int url_total;
};

public type CsvExportStatus record {
    # Analysis context to execute the queries
    int area?;
    # 
    string date_created?;
    # 
    string job_id?;
    # 
    string job_status?;
    # 
    string job_url?;
    # 
    @constraint:Int {maxValue: 2147483647}
    int nb_results?;
    UrlsQuery query;
    # 
    string results?;
};

public type Default record {
};

public type UrlsQuery record {
    # 
    string[] fields?;
    # 
    record {} filters?;
    # 
    record {}[] sort?;
};

public type PageRankLost record {
    # 
    float 'external;
    # 
    float non_crawled;
    # 
    float robots_txt;
};

public type UrlDetail record {
};

public type LinksTopDomainsSamples record {
    # 
    string[] sources;
    # 
    int unique_links;
    # 
    string url;
};

public type CrawlDatamodelField record {
    # 
    string group;
    # 
    string id;
    # 
    boolean multiple;
    # 
    string name;
    # 
    string[] permissions;
    # 
    string subtype;
    # 
    string 'type;
};

public type Project record {
    # 
    boolean active?;
    ProjectSettingsSerializer current_settings;
    # 
    string date_created?;
    # 
    string name;
    # 
    string slug;
    User user;
};

public type CrawlDatamodel record {
    # 
    CrawlDatamodelField[] fields;
    # 
    CrawlDatamodelGroup[] groups;
};

public type CrawlStatisticsTime record {
    # 
    CrawlStatisticsTimePoint[] avg_delay;
    # 
    CrawlStatisticsTimePoint[] avg_size;
    # 
    string frequency;
    # 
    CrawlStatisticsTimePoint[] http_code_2xx;
    # 
    CrawlStatisticsTimePoint[] http_code_3xx;
    # 
    CrawlStatisticsTimePoint[] http_code_4xx;
    # 
    CrawlStatisticsTimePoint[] http_code_5xx;
    # 
    CrawlStatisticsTimePoint[] http_code_xxx;
    # 
    string last_update_date;
    # 
    CrawlStatisticsTimePoint[] new_urls;
};

public type URLRewritingRulesSerializer record {
    # 
    RewritingRuleSerializer[] rules;
    # 
    string[] urls;
};

public type Analysis record {
    # 
    string config?;
    # 
    string date_created?;
    # 
    string date_finished?;
    # Date of last modified analysis
    string date_last_modified?;
    # 
    string date_launched?;
    # 
    string features?;
    # 
    int id?;
    # 
    string name?;
    # 
    string slug?;
    # 
    string status?;
    # 
    string url?;
    # 
    string urls_done?;
    # 
    string urls_in_queue?;
    User user;
};

public type CrawlStatisticsTimePoint record {
    # 
    int count;
    # 
    string datetime;
};

public type InlineResponse2001 record {
    # 
    int count?;
    # 
    string next?;
    # 
    int page?;
    # 
    string previous?;
    # 
    CrawlOrphanURLs[] results?;
    # 
    int size?;
};

# default payload for object for all HTTP codes that are not covered individually
public type DefaultPayload record {
    # Detailed information of error
    DefaultpayloadError 'error?;
};

public type LinksPercentiles record {
    # 
    string domain;
    # 
    LinksPercentilesItem[] percentiles;
};

public type InlineResponse2003 record {
    # 
    int count?;
    # 
    string next?;
    # 
    int page?;
    # 
    string previous?;
    # 
    LinksTopDomains[] results?;
    # 
    int size?;
};

public type InlineResponse2002 record {
    # 
    int count?;
    # 
    string next?;
    # 
    int page?;
    # 
    string previous?;
    # 
    string[] results?;
    # 
    int size?;
};

public type FieldValues record {
    # 
    int count;
    # 
    FieldValuesResult[] results;
};

public type UrlsAgg record {
    # 
    record {}[] aggs?;
    # 
    int count;
};

public type InlineResponse2005 record {
    # 
    int count?;
    # 
    string next?;
    # 
    int page?;
    # 
    string previous?;
    # 
    CsvExportStatus[] results?;
    # 
    int size?;
};

public type FieldValuesResult record {
    # 
    int nb_urls;
    # 
    string value;
};

public type InlineResponse2004 record {
    # 
    int count?;
    # 
    string next?;
    # 
    int page?;
    # 
    string previous?;
    # 
    UrlDetail[] results?;
    # 
    int size?;
};

public type InlineResponse2007 record {
    # 
    int count?;
    # 
    string next?;
    # 
    int page?;
    # 
    string previous?;
    # 
    ProjectSavedFilter[] results?;
    # 
    int size?;
};

public type LinksTopDomains record {
    # 
    string domain;
    # 
    int follow_links;
    # 
    LinksTopDomainsSamples[] follow_samples;
    # 
    int nofollow_links;
    # 
    LinksTopDomainsSamples[] nofollow_samples;
    # 
    int unique_follow_links;
    # 
    int unique_nofollow_links;
};

public type UrlsAggs record {
    UrlsAgg data?;
    UrlsErrorAgg 'error?;
    # 
    int status;
};

public type InlineResponse2006 record {
    # 
    int count?;
    # 
    string next?;
    # 
    int page?;
    # 
    string previous?;
    # 
    Project[] results?;
    # 
    int size?;
};
