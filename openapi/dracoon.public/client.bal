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
import ballerina/mime;

# This is a generated connector from [Dracoon API v4.28.3](https://www.dracoon.com/en/home) OpenAPI specification.
# REST Web Services for DRACOON. <a title='Developer Information' href='https://developer.dracoon.com'>Developer Information</a>&emsp;&emsp;<a title='Get SDKs on GitHub' href='https://github.com/dracoon'>Get SDKs on GitHub</a><br><br><a title='Terms of service' href='https://www.dracoon.com/terms/general-terms-and-conditions/'>Terms of service</a>
@display {label: "Dracoon Public", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Dracoon account](https://www.dracoon.com/en/home) and obtain OAuth tokens following [this guide](https://cloud.support.dracoon.com/hc/en-us/articles/360001329825-OAuth-2-0-example).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://stats.bis.org/api/v1") returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Request public Download Share information
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + accessKey - Access key 
    # + return - OK 
    remote isolated function requestPublicDownloadShareInfo(string accessKey, string? xSdsDateFormat = ()) returns PublicDownloadShare|error {
        string resourcePath = string `/v4/public/shares/downloads/${getEncodedUri(accessKey)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PublicDownloadShare response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Generate download URL
    #
    # + accessKey - Access key 
    # + return - Created 
    remote isolated function generateDownloadUrlPublic(string accessKey, PublicDownloadTokenGenerateRequest payload) returns PublicDownloadTokenGenerateResponse|error {
        string resourcePath = string `/v4/public/shares/downloads/${getEncodedUri(accessKey)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PublicDownloadTokenGenerateResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Download file with token
    #
    # + accessKey - Access key 
    # + token - Download token 
    # + range - Range  e.g. `bytes=0-999` 
    # + genericMimetype - Always return `application/octet-stream` instead of specific mimetype 
    # + inline - Use Content-Disposition: `inline` instead of `attachment` 
    # + return - OK 
    remote isolated function downloadFileViaTokenPublic(string accessKey, string token, string? range = (), boolean? genericMimetype = (), boolean? inline = ()) returns http:Response|error {
        string resourcePath = string `/v4/public/shares/downloads/${getEncodedUri(accessKey)}/${getEncodedUri(token)}`;
        map<anydata> queryParam = {"generic_mimetype": genericMimetype, "inline": inline};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Range": range};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Download file with token
    #
    # + accessKey - Access key 
    # + token - Download token 
    # + range - Range  e.g. `bytes=0-999` 
    # + genericMimetype - Always return `application/octet-stream` instead of specific mimetype 
    # + inline - Use Content-Disposition: `inline` instead of `attachment` 
    # + return - OK 
    remote isolated function downloadfileviatokenpublic1(string accessKey, string token, string? range = (), boolean? genericMimetype = (), boolean? inline = ()) returns http:Response|error {
        string resourcePath = string `/v4/public/shares/downloads/${getEncodedUri(accessKey)}/${getEncodedUri(token)}`;
        map<anydata> queryParam = {"generic_mimetype": genericMimetype, "inline": inline};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Range": range};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->head(resourcePath, httpHeaders);
        return response;
    }
    # Request public Upload Share information
    #
    # + xSdsSharePassword - Upload share password. Should be base64-encoded. Plain X-Sds-Share-Passwords are *deprecated* and will be removed in the future 
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + accessKey - Access key 
    # + return - OK 
    remote isolated function requestPublicUploadShareInfo(string accessKey, string? xSdsSharePassword = (), string? xSdsDateFormat = ()) returns PublicUploadShare|error {
        string resourcePath = string `/v4/public/shares/uploads/${getEncodedUri(accessKey)}`;
        map<any> headerValues = {"X-Sds-Share-Password": xSdsSharePassword, "X-Sds-Date-Format": xSdsDateFormat};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PublicUploadShare response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create new file upload channel
    #
    # + accessKey - Access key 
    # + return - Created 
    remote isolated function createShareUploadChannel(string accessKey, CreateShareUploadChannelRequest payload) returns CreateShareUploadChannelResponse|error {
        string resourcePath = string `/v4/public/shares/uploads/${getEncodedUri(accessKey)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateShareUploadChannelResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Request status of S3 file upload
    #
    # + accessKey - Access key 
    # + uploadId - Upload channel ID 
    # + return - OK 
    remote isolated function requestUploadStatusPublic(string accessKey, string uploadId) returns S3ShareUploadStatus|error {
        string resourcePath = string `/v4/public/shares/uploads/${getEncodedUri(accessKey)}/${getEncodedUri(uploadId)}`;
        S3ShareUploadStatus response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Complete file upload
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + accessKey - Access key 
    # + uploadId - Upload channel ID 
    # + payload - Mandatory for encrypted shares 
    # + return - Created 
    remote isolated function completeFileUploadViaShare(string accessKey, string uploadId, UserFileKeyList payload, string? xSdsDateFormat = ()) returns PublicUploadedFileData|error {
        string resourcePath = string `/v4/public/shares/uploads/${getEncodedUri(accessKey)}/${getEncodedUri(uploadId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PublicUploadedFileData response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Upload file
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + accessKey - Access key 
    # + uploadId - Upload channel ID 
    # + contentRange - Content-Range  e.g. `bytes 0-999/3980` 
    # + payload - File 
    # + return - Created 
    remote isolated function uploadfileasbinarypublic1(string accessKey, string uploadId, AccessKeyUploadIdBody payload, string? xSdsDateFormat = (), string? contentRange = ()) returns ChunkUploadResponse|error {
        string resourcePath = string `/v4/public/shares/uploads/${getEncodedUri(accessKey)}/${getEncodedUri(uploadId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "Content-Range": contentRange};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        ChunkUploadResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Cancel file upload
    #
    # + accessKey - Access key 
    # + uploadId - Upload channel ID 
    # + return - No Content 
    remote isolated function cancelFileUploadViaShare(string accessKey, string uploadId) returns http:Response|error {
        string resourcePath = string `/v4/public/shares/uploads/${getEncodedUri(accessKey)}/${getEncodedUri(uploadId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Complete S3 file upload
    #
    # + accessKey - Access key 
    # + uploadId - Upload channel ID 
    # + return - Accepted 
    remote isolated function completeS3FileUploadViaShare(string accessKey, string uploadId, CompleteS3ShareUploadRequest payload) returns http:Response|error {
        string resourcePath = string `/v4/public/shares/uploads/${getEncodedUri(accessKey)}/${getEncodedUri(uploadId)}/s3`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Generate presigned URLs for S3 file upload
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + accessKey - Access key 
    # + uploadId - Upload channel ID 
    # + return - Created 
    remote isolated function generatePresignedUrlsPublic(string accessKey, string uploadId, GeneratePresignedUrlsRequest payload, string? xSdsDateFormat = ()) returns PresignedUrlList|error {
        string resourcePath = string `/v4/public/shares/uploads/${getEncodedUri(accessKey)}/${getEncodedUri(uploadId)}/s3_urls`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PresignedUrlList response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request third-party software dependencies
    #
    # + return - OK 
    remote isolated function requestThirdPartyDependencies() returns ThirdPartyDependenciesData[]|error {
        string resourcePath = string `/v4/public/software/third_party_dependencies`;
        ThirdPartyDependenciesData[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Request software version information
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + return - OK 
    remote isolated function requestSoftwareVersion(string? xSdsDateFormat = ()) returns SoftwareVersionData|error {
        string resourcePath = string `/v4/public/software/version`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SoftwareVersionData response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request system information
    #
    # + isEnabled - Show only enabled authentication methods 
    # + return - OK 
    remote isolated function requestSystemInfo(boolean? isEnabled = ()) returns SystemInfo|error {
        string resourcePath = string `/v4/public/system/info`;
        map<anydata> queryParam = {"is_enabled": isEnabled};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SystemInfo response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Request Active Directory authentication information
    #
    # + isGlobalAvailable - Show only global available items 
    # + return - OK 
    remote isolated function requestActiveDirectoryAuthInfo(boolean? isGlobalAvailable = ()) returns ActiveDirectoryAuthInfo|error {
        string resourcePath = string `/v4/public/system/info/auth/ad`;
        map<anydata> queryParam = {"is_global_available": isGlobalAvailable};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ActiveDirectoryAuthInfo response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Request OpenID Connect provider authentication information
    #
    # + isGlobalAvailable - Show only global available items 
    # + return - OK 
    remote isolated function requestOpenIdAuthInfo(boolean? isGlobalAvailable = ()) returns OpenIdAuthInfo|error {
        string resourcePath = string `/v4/public/system/info/auth/openid`;
        map<anydata> queryParam = {"is_global_available": isGlobalAvailable};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        OpenIdAuthInfo response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Request system time
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + return - OK 
    remote isolated function requestSystemTime(string? xSdsDateFormat = ()) returns SdsServerTime|error {
        string resourcePath = string `/v4/public/time`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SdsServerTime response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
