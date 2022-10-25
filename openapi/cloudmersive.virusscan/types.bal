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
    # Represents API Key `Apikey`
    @display {label: "", kind: "password"}
    string apikey;
|};

# Result of running a website scan
public type WebsiteScanResult record {
    # True if the scan contained no threats, false otherwise
    boolean CleanResult?;
    # Type of threat returned; can be None, Malware, ForcedDownload or Phishing
    string WebsiteThreatType?;
    # Array of viruses found, if any
    VirusFound[]? FoundViruses?;
    # The remote server URL HTTP reasponse code; useful for debugging issues with scanning; typically if the remote server returns a 200 or 300-series code this means a successful response, while a 400 or 500 series code would represent an error returned from the remote server for the provided URL.
    int WebsiteHttpResponseCode?;
};

# Result of running an advanced virus scan on cloud storage
public type CloudStorageAdvancedVirusScanResult record {
    # True if the operation of retrieving the file, and scanning it were successfully completed, false if the file could not be downloaded from cloud storage, or if the file could not be scanned.  Note that successful completion does not mean the file is clean; for the output of the virus scanning operation itself, use the CleanResult and FoundViruses parameters.
    boolean Successful?;
    # True if the scan contained no viruses, false otherwise
    boolean CleanResult?;
    # True if the scan contained an executable (application code), which can be a significant risk factor
    boolean ContainsExecutable?;
    # True if the scan contained an invalid file (such as a PDF that is not a valid PDF, Word Document that is not a valid Word Document, etc.), which can be a significant risk factor
    boolean ContainsInvalidFile?;
    # True if the scan contained a script (such as a PHP script, Python script, etc.) which can be a significant risk factor
    boolean ContainsScript?;
    # True if the scan contained a password protected or encrypted file, which can be a significant risk factor
    boolean ContainsPasswordProtectedFile?;
    # True if the uploaded file is of a type that is not allowed based on the optional restrictFileTypes parameter, false otherwise; if restrictFileTypes is not set, this will always be false
    boolean ContainsRestrictedFileFormat?;
    # True if the uploaded file contains embedded Macros of other embedded threats within the document, which can be a significant risk factor
    boolean ContainsMacros?;
    # For file format verification-supported file formats, the contents-verified file format of the file.  Null indicates that the file format is not supported for contents verification.  If a Virus or Malware is found, this field will always be set to Null.
    string VerifiedFileFormat?;
    # Array of viruses found, if any
    CloudStorageVirusFound[] FoundViruses?;
    # Detailed error message if the operation was not successful
    string ErrorDetailedDescription?;
    # Size in bytes of the file that was retrieved and scanned
    int FileSize?;
};

# Request to scan a website for malicious content
public type WebsiteScanRequest record {
    # URL of the website to scan; should begin with http:// or https://
    string Url?;
};

# Result of running an advanced virus scan
public type VirusScanAdvancedResult record {
    # True if the scan contained no viruses, false otherwise
    boolean CleanResult?;
    # True if the scan contained an executable (application code), which can be a significant risk factor
    boolean ContainsExecutable?;
    # True if the scan contained an invalid file (such as a PDF that is not a valid PDF, Word Document that is not a valid Word Document, etc.), which can be a significant risk factor
    boolean ContainsInvalidFile?;
    # True if the scan contained a script (such as a PHP script, Python script, etc.) which can be a significant risk factor
    boolean ContainsScript?;
    # True if the scan contained a password protected or encrypted file, which can be a significant risk factor
    boolean ContainsPasswordProtectedFile?;
    # True if the uploaded file is of a type that is not allowed based on the optional restrictFileTypes parameter, false otherwise; if restrictFileTypes is not set, this will always be false
    boolean ContainsRestrictedFileFormat?;
    # True if the uploaded file contains embedded Macros of other embedded threats within the document, which can be a significant risk factor
    boolean ContainsMacros?;
    # True if the uploaded file contains embedded XML External Entity threats of other embedded threats within the document, which can be a significant risk factor
    boolean ContainsXmlExternalEntities?;
    # For file format verification-supported file formats, the contents-verified file format of the file.  Null indicates that the file format is not supported for contents verification.  If a Virus or Malware is found, this field will always be set to Null.
    string VerifiedFileFormat?;
    # Array of viruses found, if any
    VirusFound[] FoundViruses?;
};

# Virus positively identified
public type CloudStorageVirusFound record {
    # Name of the file containing the virus
    string FileName?;
    # Name of the virus that was found
    string VirusName?;
};

# Result of running a virus scan on cloud storage
public type CloudStorageVirusScanResult record {
    # True if the operation of retrieving the file, and scanning it were successfully completed, false if the file could not be downloaded from cloud storage, or if the file could not be scanned.  Note that successful completion does not mean the file is clean; for the output of the virus scanning operation itself, use the CleanResult and FoundViruses parameters.
    boolean Successful?;
    # True if the scan contained no viruses, false otherwise
    boolean CleanResult?;
    # Array of viruses found, if any
    CloudStorageVirusFound[] FoundViruses?;
    # Detailed error message if the operation was not successful
    string ErrorDetailedDescription?;
    # Size in bytes of the file that was retrieved and scanned
    int FileSize?;
};

# Result of running a virus scan
public type VirusScanResult record {
    # True if the scan contained no viruses, false otherwise
    boolean CleanResult?;
    # Array of viruses found, if any
    VirusFound[] FoundViruses?;
};

# Virus positively identified
public type VirusFound record {
    # Name of the file containing the virus
    string FileName?;
    # Name of the virus that was found
    string VirusName?;
};
