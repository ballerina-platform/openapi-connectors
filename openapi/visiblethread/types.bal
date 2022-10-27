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
    # All requests on the VisibleThread API needs to include an API key. The API key can be provided as part of the query string or as a request header. The name of the API key needs to be `apiKey`
    @display {label: "", kind: "password"}
    string apiKey;
|};

public type DocumentListSummaryArr DocumentListSummary[];

public type ScanResponseSummaryArr ScanResponseSummary[];

public type NewscanresponseWeburls record {
    string url;
    int id;
};

public type ScanDetailed record {
    string title;
    WebUrl[] webUrls;
    Stats stats;
};

public type VerylongsentencesInner record {
    int 'start?;
    int end?;
    int wordCount?;
};

public type ScanResponseDetailed record {
    int id?;
    string started?;
    string eta?;
    string completed?;
    ScanDetailed scan?;
};

public type PassivesInner record {
    int 'start?;
    int end?;
    string verb?;
    string passivePiece?;
};

public type DocumentListSummary record {
    int id?;
    string name?;
};

public type NewscanScansettings record {
    int longSentenceWordCount?;
    int veryLongSentenceWordCount?;
};

public type Passives PassivesInner[];

public type HiddenVerbs HiddenverbsInner[];

public type ScanResponseSummary record {
    int id?;
    string started?;
    string eta?;
    string completed?;
    ScanSummary scan?;
};

public type LongSentences LongsentencesInner[];

public type VeryLongSentences VerylongsentencesInner[];

public type DocumentResponseDetailed record {
    int id?;
    string started?;
    string eta?;
    string completed?;
    string title?;
    Stats stats?;
    NewdocumentresponseScansettings scanSettings?;
    DocumentresponsedetailedParagraphs[] paragraphs?;
};

public type Search record {
    int docId;
    int dictId;
};

public type LongsentencesInner record {
    int 'start?;
    int end?;
    int wordCount?;
};

public type Adverbs AdverbsInner[];

public type WebResponseNotReady record {
    int id?;
    string started?;
    string eta?;
};

public type DocumentResponseNotReady record {
    int id?;
    string started?;
    string eta?;
};

public type NewscanWeburls record {
    string url;
};

public type HiddenverbsInner record {
    int 'start?;
    int end?;
    string noun?;
    string text?;
};

public type NewScanResponse record {
    int id;
    string title;
    NewscanresponseWeburls[] webUrls;
};

public type WebUrl record {
    *WebUrlHeader;
    Analysis analysis;
};

public type WebUrlDetail record {
    string title;
    string url;
    Stats stats;
    DocumentresponsedetailedParagraphs[] paragraphs?;
};

public type NewDocumentResponse record {
    int docId;
    string task;
    NewdocumentresponseScansettings scanSettings;
};

public type DocumentresponsedetailedParagraphs record {
    string text?;
    int paragraphIndex?;
    int paragraphCounter?;
    DocumentresponsedetailedStats stats?;
};

public type AdverbsInner record {
    int 'start?;
    int end?;
    string text?;
};

public type NewScan record {
    string title;
    NewscanWeburls[] webUrls;
    NewscanScansettings scanSettings?;
};

public type DocumentresponsedetailedStats record {
    LongSentences[] longSentences?;
    Passives[] passives?;
    VeryLongSentences[] veryLongSentences?;
    HiddenVerbs[] hiddenVerbs?;
    Adverbs[] adverbs?;
};

public type ScanSummary record {
    string title;
    WebUrlHeader[] webUrls;
};

public type Analysis record {
    string title?;
    Stats stats?;
};

public type WebUrlHeader record {
    int id;
    string url;
};

public type Stats record {
    int avgSentenceLength?;
    int fleschReadingLevel?;
    int wordCount?;
    int sentenceCount?;
    int longSentenceCount?;
    float fleschKincaidGradeLevel?;
    int passiveSentenceCount?;
};

public type NewdocumentresponseScansettings record {
    int longSentenceWordCount?;
    int veryLongSentenceWordCount?;
};
