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

import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

# Configuration for  Azure Data Lake Storage connector
#
# + authConfig - Basic authentication or CredentialsConfig Configuration Tokens
# + secureSocketConfig - Secure Socket Configuration 
public type ClientConfig record {
    http:BearerTokenConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# This is a generated connector for [Azure DataLake Storage (Gen2) API version 2019-10-31](https://azure.microsoft.com/en-us/solutions/data-lake/) OpenAPI specification. 
# Azure Data Lake Storage provides storage for Hadoop and other big data workloads.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Azure Data Lake account](https://azure.microsoft.com/en-us/solutions/data-lake/) and obtain OAuth tokens following [this guide](https://docs.microsoft.com/en-us/azure/active-directory/develop/quickstart-register-app).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # List Filesystems
    #
    # + 'resource - The value must be "account" for all account operations.
    # + prefix - Filters results to filesystems within the specified prefix.
    # + continuation - The number of filesystems returned with each invocation is limited. If the number of filesystems to be returned exceeds this limit, a continuation token is returned in the response header x-ms-continuation. When a continuation token is  returned in the response, it must be specified in a subsequent invocation of the list operation to continue listing the filesystems.
    # + maxResults - An optional value that specifies the maximum number of items to return. If omitted or greater than 5,000, the response will include up to 5,000 items.
    # + xMsClientRequestId - A UUID recorded in the analytics logs for troubleshooting and correlation.
    # + timeout - An optional operation timeout value in seconds. The period begins when the request is received by the service. If the timeout value elapses before the operation completes, the operation fails.
    # + xMsDate - Specifies the Coordinated Universal Time (UTC) for the request.  This is required when using shared key authorization.
    # + xMsVersion - Specifies the version of the REST protocol used for processing the request. This is required when using shared key authorization.
    # + return - OK
    remote isolated function filesystemList(string 'resource, string? prefix = (), string? continuation = (), int? maxResults = (), string? xMsClientRequestId = (), int? timeout = (), string? xMsDate = (), string? xMsVersion = ()) returns FilesystemList|error {
        string  path = string `/`;
        map<anydata> queryParam = {"resource": 'resource, "prefix": prefix, "continuation": continuation, "maxResults": maxResults, "timeout": timeout};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-client-request-id": xMsClientRequestId, "x-ms-date": xMsDate, "x-ms-version": xMsVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FilesystemList response = check self.clientEp-> get(path, accHeaders, targetType = FilesystemList);
        return response;
    }
    # List Paths
    #
    # + filesystem - The filesystem identifier.  The value must start and end with a letter or number and must contain only letters, numbers, and the dash (-) character.  Consecutive dashes are not permitted.  All letters must be lowercase.  The value must have between 3 and 63 characters.
    # + 'resource - The value must be "filesystem" for all filesystem operations.
    # + recursive - If "true", all paths are listed; otherwise, only paths at the root of the filesystem are listed.  If "directory" is specified, the list will only include paths that share the same root.
    # + xMsClientRequestId - A UUID recorded in the analytics logs for troubleshooting and correlation.
    # + timeout - An optional operation timeout value in seconds. The period begins when the request is received by the service. If the timeout value elapses before the operation completes, the operation fails.
    # + xMsDate - Specifies the Coordinated Universal Time (UTC) for the request.  This is required when using shared key authorization.
    # + xMsVersion - Specifies the version of the REST protocol used for processing the request. This is required when using shared key authorization.
    # + directory - Filters results to paths within the specified directory. An error occurs if the directory does not exist.
    # + continuation - The number of paths returned with each invocation is limited. If the number of paths to be returned exceeds this limit, a continuation token is returned in the response header x-ms-continuation. When a continuation token is  returned in the response, it must be specified in a subsequent invocation of the list operation to continue listing the paths.
    # + maxResults - An optional value that specifies the maximum number of items to return. If omitted or greater than 5,000, the response will include up to 5,000 items.
    # + upn - Optional. Valid only when Hierarchical Namespace is enabled for the account. If "true", the user identity values returned in the owner and group fields of each list entry will be transformed from Azure Active Directory Object IDs to User Principal Names.  If "false", the values will be returned as Azure Active Directory Object IDs. The default value is false. Note that group and application Object IDs are not translated because they do not have unique friendly names.
    # + return - Ok
    remote isolated function pathList(string filesystem, string 'resource, boolean recursive, string? xMsClientRequestId = (), int? timeout = (), string? xMsDate = (), string? xMsVersion = (), string? directory = (), string? continuation = (), int? maxResults = (), boolean? upn = ()) returns PathList|error {
        string  path = string `/${filesystem}`;
        map<anydata> queryParam = {"resource": 'resource, "timeout": timeout, "directory": directory, "recursive": recursive, "continuation": continuation, "maxResults": maxResults, "upn": upn};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-client-request-id": xMsClientRequestId, "x-ms-date": xMsDate, "x-ms-version": xMsVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PathList response = check self.clientEp-> get(path, accHeaders, targetType = PathList);
        return response;
    }
    # Create Filesystem
    #
    # + filesystem - The filesystem identifier.  The value must start and end with a letter or number and must contain only letters, numbers, and the dash (-) character.  Consecutive dashes are not permitted.  All letters must be lowercase.  The value must have between 3 and 63 characters.
    # + 'resource - The value must be "filesystem" for all filesystem operations.
    # + xMsClientRequestId - A UUID recorded in the analytics logs for troubleshooting and correlation.
    # + timeout - An optional operation timeout value in seconds. The period begins when the request is received by the service. If the timeout value elapses before the operation completes, the operation fails.
    # + xMsDate - Specifies the Coordinated Universal Time (UTC) for the request.  This is required when using shared key authorization.
    # + xMsVersion - Specifies the version of the REST protocol used for processing the request. This is required when using shared key authorization.
    # + xMsProperties - User-defined properties to be stored with the filesystem, in the format of a comma-separated list of name and value pairs "n1=v1, n2=v2, ...", where each value is a base64 encoded string. Note that the string may only contain ASCII characters in the ISO-8859-1 character set.
    # + return - Created
    remote isolated function filesystemCreate(string filesystem, string 'resource, string? xMsClientRequestId = (), int? timeout = (), string? xMsDate = (), string? xMsVersion = (), string? xMsProperties = ()) returns http:Response|error {
        string  path = string `/${filesystem}`;
        map<anydata> queryParam = {"resource": 'resource, "timeout": timeout};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-client-request-id": xMsClientRequestId, "x-ms-date": xMsDate, "x-ms-version": xMsVersion, "x-ms-properties": xMsProperties};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Delete Filesystem
    #
    # + filesystem - The filesystem identifier.  The value must start and end with a letter or number and must contain only letters, numbers, and the dash (-) character.  Consecutive dashes are not permitted.  All letters must be lowercase.  The value must have between 3 and 63 characters.
    # + 'resource - The value must be "filesystem" for all filesystem operations.
    # + xMsClientRequestId - A UUID recorded in the analytics logs for troubleshooting and correlation.
    # + timeout - An optional operation timeout value in seconds. The period begins when the request is received by the service. If the timeout value elapses before the operation completes, the operation fails.
    # + xMsDate - Specifies the Coordinated Universal Time (UTC) for the request.  This is required when using shared key authorization.
    # + xMsVersion - Specifies the version of the REST protocol used for processing the request. This is required when using shared key authorization.
    # + ifModifiedSince - Optional. A date and time value. Specify this header to perform the operation only if the resource has been modified since the specified date and time.
    # + ifUnmodifiedSince - Optional. A date and time value. Specify this header to perform the operation only if the resource has not been modified since the specified date and time.
    # + return - Accepted
    remote isolated function filesystemDelete(string filesystem, string 'resource, string? xMsClientRequestId = (), int? timeout = (), string? xMsDate = (), string? xMsVersion = (), string? ifModifiedSince = (), string? ifUnmodifiedSince = ()) returns http:Response|error {
        string  path = string `/${filesystem}`;
        map<anydata> queryParam = {"resource": 'resource, "timeout": timeout};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-client-request-id": xMsClientRequestId, "x-ms-date": xMsDate, "x-ms-version": xMsVersion, "If-Modified-Since": ifModifiedSince, "If-Unmodified-Since": ifUnmodifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Set Filesystem Properties
    #
    # + filesystem - The filesystem identifier.  The value must start and end with a letter or number and must contain only letters, numbers, and the dash (-) character.  Consecutive dashes are not permitted.  All letters must be lowercase.  The value must have between 3 and 63 characters.
    # + 'resource - The value must be "filesystem" for all filesystem operations.
    # + xMsClientRequestId - A UUID recorded in the analytics logs for troubleshooting and correlation.
    # + timeout - An optional operation timeout value in seconds. The period begins when the request is received by the service. If the timeout value elapses before the operation completes, the operation fails.
    # + xMsDate - Specifies the Coordinated Universal Time (UTC) for the request.  This is required when using shared key authorization.
    # + xMsVersion - Specifies the version of the REST protocol used for processing the request. This is required when using shared key authorization.
    # + xMsProperties - Optional. User-defined properties to be stored with the filesystem, in the format of a comma-separated list of name and value pairs "n1=v1, n2=v2, ...", where each value is a base64 encoded string. Note that the string may only contain ASCII characters in the ISO-8859-1 character set.  If the filesystem exists, any properties not included in the list will be removed.  All properties are removed if the header is omitted.  To merge new and existing properties, first get all existing properties and the current E-Tag, then make a conditional request with the E-Tag and include values for all properties.
    # + ifModifiedSince - Optional. A date and time value. Specify this header to perform the operation only if the resource has been modified since the specified date and time.
    # + ifUnmodifiedSince - Optional. A date and time value. Specify this header to perform the operation only if the resource has not been modified since the specified date and time.
    # + return - Ok
    remote isolated function filesystemSetproperties(string filesystem, string 'resource, string? xMsClientRequestId = (), int? timeout = (), string? xMsDate = (), string? xMsVersion = (), string? xMsProperties = (), string? ifModifiedSince = (), string? ifUnmodifiedSince = ()) returns http:Response|error {
        string  path = string `/${filesystem}`;
        map<anydata> queryParam = {"resource": 'resource, "timeout": timeout};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-client-request-id": xMsClientRequestId, "x-ms-date": xMsDate, "x-ms-version": xMsVersion, "x-ms-properties": xMsProperties, "If-Modified-Since": ifModifiedSince, "If-Unmodified-Since": ifUnmodifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> patch(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get Filesystem Properties.
    #
    # + filesystem - The filesystem identifier.  The value must start and end with a letter or number and must contain only letters, numbers, and the dash (-) character.  Consecutive dashes are not permitted.  All letters must be lowercase.  The value must have between 3 and 63 characters.
    # + 'resource - The value must be "filesystem" for all filesystem operations.
    # + xMsClientRequestId - A UUID recorded in the analytics logs for troubleshooting and correlation.
    # + timeout - An optional operation timeout value in seconds. The period begins when the request is received by the service. If the timeout value elapses before the operation completes, the operation fails.
    # + xMsDate - Specifies the Coordinated Universal Time (UTC) for the request.  This is required when using shared key authorization.
    # + xMsVersion - Specifies the version of the REST protocol used for processing the request. This is required when using shared key authorization.
    # + return - Ok
    remote isolated function filesystemGetproperties(string filesystem, string 'resource, string? xMsClientRequestId = (), int? timeout = (), string? xMsDate = (), string? xMsVersion = ()) returns http:Response|error {
        string  path = string `/${filesystem}`;
        map<anydata> queryParam = {"resource": 'resource, "timeout": timeout};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-client-request-id": xMsClientRequestId, "x-ms-date": xMsDate, "x-ms-version": xMsVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> head(path, accHeaders);
        return response;
    }
    # Read File
    #
    # + filesystem - The filesystem identifier.
    # + pathParam - The file or directory path.
    # + xMsClientRequestId - A UUID recorded in the analytics logs for troubleshooting and correlation.
    # + timeout - An optional operation timeout value in seconds. The period begins when the request is received by the service. If the timeout value elapses before the operation completes, the operation fails.
    # + xMsDate - Specifies the Coordinated Universal Time (UTC) for the request.  This is required when using shared key authorization.
    # + xMsVersion - Specifies the version of the REST protocol used for processing the request. This is required when using shared key authorization.
    # + range - The HTTP Range request header specifies one or more byte ranges of the resource to be retrieved.
    # + xMsLeaseId - Optional. If this header is specified, the operation will be performed only if both of the following conditions are met: i) the path's lease is currently active and ii) the lease ID specified in the request matches that of the path.
    # + xMsRangeGetContentMd5 - Optional. When this header is set to "true" and specified together with the Range header, the service returns the MD5 hash for the range, as long as the range is less than or equal to 4MB in size. If this header is specified without the Range header, the service returns status code 400 (Bad Request). If this header is set to true when the range exceeds 4 MB in size, the service returns status code 400 (Bad Request).
    # + ifMatch - Optional.  An ETag value. Specify this header to perform the operation only if the resource's ETag matches the value specified. The ETag must be specified in quotes.
    # + ifNoneMatch - Optional.  An ETag value or the special wildcard ("*") value. Specify this header to perform the operation only if the resource's ETag does not match the value specified. The ETag must be specified in quotes.
    # + ifModifiedSince - Optional. A date and time value. Specify this header to perform the operation only if the resource has been modified since the specified date and time.
    # + ifUnmodifiedSince - Optional. A date and time value. Specify this header to perform the operation only if the resource has not been modified since the specified date and time.
    # + return - Ok
    remote isolated function pathRead(string filesystem, string pathParam, string? xMsClientRequestId = (), int? timeout = (), string? xMsDate = (), string? xMsVersion = (), string? range = (), string? xMsLeaseId = (), boolean? xMsRangeGetContentMd5 = (), string? ifMatch = (), string? ifNoneMatch = (), string? ifModifiedSince = (), string? ifUnmodifiedSince = ()) returns string|error {
        string  path = string `/${filesystem}/${pathParam}`;
        map<anydata> queryParam = {"timeout": timeout};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-client-request-id": xMsClientRequestId, "x-ms-date": xMsDate, "x-ms-version": xMsVersion, "Range": range, "x-ms-lease-id": xMsLeaseId, "x-ms-range-get-content-md5": xMsRangeGetContentMd5, "If-Match": ifMatch, "If-None-Match": ifNoneMatch, "If-Modified-Since": ifModifiedSince, "If-Unmodified-Since": ifUnmodifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Create File | Create Directory | Rename File | Rename Directory
    #
    # + filesystem - The filesystem identifier.
    # + pathParam - The file or directory path.
    # + xMsClientRequestId - A UUID recorded in the analytics logs for troubleshooting and correlation.
    # + timeout - An optional operation timeout value in seconds. The period begins when the request is received by the service. If the timeout value elapses before the operation completes, the operation fails.
    # + xMsDate - Specifies the Coordinated Universal Time (UTC) for the request.  This is required when using shared key authorization.
    # + xMsVersion - Specifies the version of the REST protocol used for processing the request. This is required when using shared key authorization.
    # + 'resource - Required only for Create File and Create Directory. The value must be "file" or "directory".
    # + continuation - Optional.  When renaming a directory, the number of paths that are renamed with each invocation is limited.  If the number of paths to be renamed exceeds this limit, a continuation token is returned in this response header.  When a continuation token is returned in the response, it must be specified in a subsequent invocation of the rename operation to continue renaming the directory.
    # + mode - Optional. Valid only when namespace is enabled. This parameter determines the behavior of the rename operation. The value must be "legacy" or "posix", and the default value will be "posix". 
    # + cacheControl - Optional.  The service stores this value and includes it in the "Cache-Control" response header for "Read File" operations for "Read File" operations.
    # + contentEncoding - Optional.  Specifies which content encodings have been applied to the file. This value is returned to the client when the "Read File" operation is performed.
    # + contentLanguage - Optional.  Specifies the natural language used by the intended audience for the file.
    # + contentDisposition - Optional.  The service stores this value and includes it in the "Content-Disposition" response header for "Read File" operations.
    # + xMsCacheControl - Optional.  The service stores this value and includes it in the "Cache-Control" response header for "Read File" operations.
    # + xMsContentType - Optional.  The service stores this value and includes it in the "Content-Type" response header for "Read File" operations.
    # + xMsContentEncoding - Optional.  The service stores this value and includes it in the "Content-Encoding" response header for "Read File" operations.
    # + xMsContentLanguage - Optional.  The service stores this value and includes it in the "Content-Language" response header for "Read File" operations.
    # + xMsContentDisposition - Optional.  The service stores this value and includes it in the "Content-Disposition" response header for "Read File" operations.
    # + xMsRenameSource - An optional file or directory to be renamed.  The value must have the following format: "/{filesystem}/{path}".  If "x-ms-properties" is specified, the properties will overwrite the existing properties; otherwise, the existing properties will be preserved. This value must be a URL percent-encoded string. Note that the string may only contain ASCII characters in the ISO-8859-1 character set.
    # + xMsLeaseId - Optional.  A lease ID for the path specified in the URI.  The path to be overwritten must have an active lease and the lease ID must match.
    # + xMsSourceLeaseId - Optional for rename operations.  A lease ID for the source path.  The source path must have an active lease and the lease ID must match.
    # + xMsProperties - Optional.  User-defined properties to be stored with the file or directory, in the format of a comma-separated list of name and value pairs "n1=v1, n2=v2, ...", where each value is a base64 encoded string. Note that the string may only contain ASCII characters in the ISO-8859-1 character set.
    # + xMsPermissions - Optional and only valid if Hierarchical Namespace is enabled for the account. Sets POSIX access permissions for the file owner, the file owning group, and others. Each class may be granted read, write, or execute permission.  The sticky bit is also supported.  Both symbolic (rwxrw-rw-) and 4-digit octal notation (e.g. 0766) are supported.
    # + xMsUmask - Optional and only valid if Hierarchical Namespace is enabled for the account. When creating a file or directory and the parent folder does not have a default ACL, the umask restricts the permissions of the file or directory to be created.  The resulting permission is given by p & ^u, where p is the permission and u is the umask.  For example, if p is 0777 and u is 0057, then the resulting permission is 0720.  The default permission is 0777 for a directory and 0666 for a file.  The default umask is 0027.  The umask must be specified in 4-digit octal notation (e.g. 0766).
    # + ifMatch - Optional.  An ETag value. Specify this header to perform the operation only if the resource's ETag matches the value specified. The ETag must be specified in quotes.
    # + ifNoneMatch - Optional.  An ETag value or the special wildcard ("*") value. Specify this header to perform the operation only if the resource's ETag does not match the value specified. The ETag must be specified in quotes.
    # + ifModifiedSince - Optional. A date and time value. Specify this header to perform the operation only if the resource has been modified since the specified date and time.
    # + ifUnmodifiedSince - Optional. A date and time value. Specify this header to perform the operation only if the resource has not been modified since the specified date and time.
    # + xMsSourceIfMatch - Optional.  An ETag value. Specify this header to perform the rename operation only if the source's ETag matches the value specified. The ETag must be specified in quotes.
    # + xMsSourceIfNoneMatch - Optional.  An ETag value or the special wildcard ("*") value. Specify this header to perform the rename operation only if the source's ETag does not match the value specified. The ETag must be specified in quotes.
    # + xMsSourceIfModifiedSince - Optional. A date and time value. Specify this header to perform the rename operation only if the source has been modified since the specified date and time.
    # + xMsSourceIfUnmodifiedSince - Optional. A date and time value. Specify this header to perform the rename operation only if the source has not been modified since the specified date and time.
    # + return - The file or directory was created.
    remote isolated function pathCreate(string filesystem, string pathParam, string? xMsClientRequestId = (), int? timeout = (), string? xMsDate = (), string? xMsVersion = (), string? 'resource = (), string? continuation = (), string? mode = (), string? cacheControl = (), string? contentEncoding = (), string? contentLanguage = (), string? contentDisposition = (), string? xMsCacheControl = (), string? xMsContentType = (), string? xMsContentEncoding = (), string? xMsContentLanguage = (), string? xMsContentDisposition = (), string? xMsRenameSource = (), string? xMsLeaseId = (), string? xMsSourceLeaseId = (), string? xMsProperties = (), string? xMsPermissions = (), string? xMsUmask = (), string? ifMatch = (), string? ifNoneMatch = (), string? ifModifiedSince = (), string? ifUnmodifiedSince = (), string? xMsSourceIfMatch = (), string? xMsSourceIfNoneMatch = (), string? xMsSourceIfModifiedSince = (), string? xMsSourceIfUnmodifiedSince = ()) returns http:Response|error {
        string  path = string `/${filesystem}/${pathParam}`;
        map<anydata> queryParam = {"timeout": timeout, "resource": 'resource, "continuation": continuation, "mode": mode};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-client-request-id": xMsClientRequestId, "x-ms-date": xMsDate, "x-ms-version": xMsVersion, "Cache-Control": cacheControl, "Content-Encoding": contentEncoding, "Content-Language": contentLanguage, "Content-Disposition": contentDisposition, "x-ms-cache-control": xMsCacheControl, "x-ms-content-type": xMsContentType, "x-ms-content-encoding": xMsContentEncoding, "x-ms-content-language": xMsContentLanguage, "x-ms-content-disposition": xMsContentDisposition, "x-ms-rename-source": xMsRenameSource, "x-ms-lease-id": xMsLeaseId, "x-ms-source-lease-id": xMsSourceLeaseId, "x-ms-properties": xMsProperties, "x-ms-permissions": xMsPermissions, "x-ms-umask": xMsUmask, "If-Match": ifMatch, "If-None-Match": ifNoneMatch, "If-Modified-Since": ifModifiedSince, "If-Unmodified-Since": ifUnmodifiedSince, "x-ms-source-if-match": xMsSourceIfMatch, "x-ms-source-if-none-match": xMsSourceIfNoneMatch, "x-ms-source-if-modified-since": xMsSourceIfModifiedSince, "x-ms-source-if-unmodified-since": xMsSourceIfUnmodifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Lease Path
    #
    # + filesystem - The filesystem identifier.
    # + pathParam - The file or directory path.
    # + xMsLeaseAction - There are five lease actions: "acquire", "break", "change", "renew", and "release". Use "acquire" and specify the "x-ms-proposed-lease-id" and "x-ms-lease-duration" to acquire a new lease. Use "break" to break an existing lease. When a lease is broken, the lease break period is allowed to elapse, during which time no lease operation except break and release can be performed on the file. When a lease is successfully broken, the response indicates the interval in seconds until a new lease can be acquired. Use "change" and specify the current lease ID in "x-ms-lease-id" and the new lease ID in "x-ms-proposed-lease-id" to change the lease ID of an active lease. Use "renew" and specify the "x-ms-lease-id" to renew an existing lease. Use "release" and specify the "x-ms-lease-id" to release a lease.
    # + xMsClientRequestId - A UUID recorded in the analytics logs for troubleshooting and correlation.
    # + timeout - An optional operation timeout value in seconds. The period begins when the request is received by the service. If the timeout value elapses before the operation completes, the operation fails.
    # + xMsDate - Specifies the Coordinated Universal Time (UTC) for the request.  This is required when using shared key authorization.
    # + xMsVersion - Specifies the version of the REST protocol used for processing the request. This is required when using shared key authorization.
    # + xMsLeaseDuration - The lease duration is required to acquire a lease, and specifies the duration of the lease in seconds.  The lease duration must be between 15 and 60 seconds or -1 for infinite lease.
    # + xMsLeaseBreakPeriod - The lease break period duration is optional to break a lease, and  specifies the break period of the lease in seconds.  The lease break  duration must be between 0 and 60 seconds.
    # + xMsLeaseId - Required when "x-ms-lease-action" is "renew", "change" or "release". For the renew and release actions, this must match the current lease ID.
    # + xMsProposedLeaseId - Required when "x-ms-lease-action" is "acquire" or "change".  A lease will be acquired with this lease ID if the operation is successful.
    # + ifMatch - Optional.  An ETag value. Specify this header to perform the operation only if the resource's ETag matches the value specified. The ETag must be specified in quotes.
    # + ifNoneMatch - Optional.  An ETag value or the special wildcard ("*") value. Specify this header to perform the operation only if the resource's ETag does not match the value specified. The ETag must be specified in quotes.
    # + ifModifiedSince - Optional. A date and time value. Specify this header to perform the operation only if the resource has been modified since the specified date and time.
    # + ifUnmodifiedSince - Optional. A date and time value. Specify this header to perform the operation only if the resource has not been modified since the specified date and time.
    # + return - The "renew", "change" or "release" action was successful.
    remote isolated function pathLease(string filesystem, string pathParam, string xMsLeaseAction, string? xMsClientRequestId = (), int? timeout = (), string? xMsDate = (), string? xMsVersion = (), int? xMsLeaseDuration = (), int? xMsLeaseBreakPeriod = (), string? xMsLeaseId = (), string? xMsProposedLeaseId = (), string? ifMatch = (), string? ifNoneMatch = (), string? ifModifiedSince = (), string? ifUnmodifiedSince = ()) returns http:Response|error {
        string  path = string `/${filesystem}/${pathParam}`;
        map<anydata> queryParam = {"timeout": timeout};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-client-request-id": xMsClientRequestId, "x-ms-date": xMsDate, "x-ms-version": xMsVersion, "x-ms-lease-action": xMsLeaseAction, "x-ms-lease-duration": xMsLeaseDuration, "x-ms-lease-break-period": xMsLeaseBreakPeriod, "x-ms-lease-id": xMsLeaseId, "x-ms-proposed-lease-id": xMsProposedLeaseId, "If-Match": ifMatch, "If-None-Match": ifNoneMatch, "If-Modified-Since": ifModifiedSince, "If-Unmodified-Since": ifUnmodifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Delete File | Delete Directory
    #
    # + filesystem - The filesystem identifier.
    # + pathParam - The file or directory path.
    # + xMsClientRequestId - A UUID recorded in the analytics logs for troubleshooting and correlation.
    # + timeout - An optional operation timeout value in seconds. The period begins when the request is received by the service. If the timeout value elapses before the operation completes, the operation fails.
    # + xMsDate - Specifies the Coordinated Universal Time (UTC) for the request.  This is required when using shared key authorization.
    # + xMsVersion - Specifies the version of the REST protocol used for processing the request. This is required when using shared key authorization.
    # + recursive - Required and valid only when the resource is a directory.  If "true", all paths beneath the directory will be deleted. If "false" and the directory is non-empty, an error occurs.
    # + continuation - Optional.  When deleting a directory, the number of paths that are deleted with each invocation is limited.  If the number of paths to be deleted exceeds this limit, a continuation token is returned in this response header.  When a continuation token is returned in the response, it must be specified in a subsequent invocation of the delete operation to continue deleting the directory.
    # + xMsLeaseId - The lease ID must be specified if there is an active lease.
    # + ifMatch - Optional.  An ETag value. Specify this header to perform the operation only if the resource's ETag matches the value specified. The ETag must be specified in quotes.
    # + ifNoneMatch - Optional.  An ETag value or the special wildcard ("*") value. Specify this header to perform the operation only if the resource's ETag does not match the value specified. The ETag must be specified in quotes.
    # + ifModifiedSince - Optional. A date and time value. Specify this header to perform the operation only if the resource has been modified since the specified date and time.
    # + ifUnmodifiedSince - Optional. A date and time value. Specify this header to perform the operation only if the resource has not been modified since the specified date and time.
    # + return - The file was deleted.
    remote isolated function pathDelete(string filesystem, string pathParam, string? xMsClientRequestId = (), int? timeout = (), string? xMsDate = (), string? xMsVersion = (), boolean? recursive = (), string? continuation = (), string? xMsLeaseId = (), string? ifMatch = (), string? ifNoneMatch = (), string? ifModifiedSince = (), string? ifUnmodifiedSince = ()) returns http:Response|error {
        string  path = string `/${filesystem}/${pathParam}`;
        map<anydata> queryParam = {"timeout": timeout, "recursive": recursive, "continuation": continuation};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-client-request-id": xMsClientRequestId, "x-ms-date": xMsDate, "x-ms-version": xMsVersion, "x-ms-lease-id": xMsLeaseId, "If-Match": ifMatch, "If-None-Match": ifNoneMatch, "If-Modified-Since": ifModifiedSince, "If-Unmodified-Since": ifUnmodifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Append Data | Flush Data | Set Properties | Set Access Control
    #
    # + filesystem - The filesystem identifier.
    # + pathParam - The file or directory path.
    # + action - The action must be "append" to upload data to be appended to a file, "flush" to flush previously uploaded data to a file, "setProperties" to set the properties of a file or directory, or "setAccessControl" to set the owner, group, permissions, or access control list for a file or directory.  Note that Hierarchical Namespace must be enabled for the account in order to use access control.  Also note that the Access Control List (ACL) includes permissions for the owner, owning group, and others, so the x-ms-permissions and x-ms-acl request headers are mutually exclusive.
    # + xMsClientRequestId - A UUID recorded in the analytics logs for troubleshooting and correlation.
    # + timeout - An optional operation timeout value in seconds. The period begins when the request is received by the service. If the timeout value elapses before the operation completes, the operation fails.
    # + xMsDate - Specifies the Coordinated Universal Time (UTC) for the request.  This is required when using shared key authorization.
    # + xMsVersion - Specifies the version of the REST protocol used for processing the request. This is required when using shared key authorization.
    # + position - This parameter allows the caller to upload data in parallel and control the order in which it is appended to the file.  It is required when uploading data to be appended to the file and when flushing previously uploaded data to the file.  The value must be the position where the data is to be appended.  Uploaded data is not immediately flushed, or written, to the file.  To flush, the previously uploaded data must be contiguous, the position parameter must be specified and equal to the length of the file after all data has been written, and there must not be a request entity body included with the request.
    # + retainUncommittedData - Valid only for flush operations.  If "true", uncommitted data is retained after the flush operation completes; otherwise, the uncommitted data is deleted after the flush operation.  The default is false.  Data at offsets less than the specified position are written to the file when flush succeeds, but this optional parameter allows data after the flush position to be retained for a future flush operation.
    # + close - Azure Storage Events allow applications to receive notifications when files change. When Azure Storage Events are enabled, a file changed event is raised. This event has a property indicating whether this is the final change to distinguish the difference between an intermediate flush to a file stream and the final close of a file stream. The close query parameter is valid only when the action is "flush" and change notifications are enabled. If the value of close is "true" and the flush operation completes successfully, the service raises a file change notification with a property indicating that this is the final update (the file stream has been closed). If "false" a change notification is raised indicating the file has changed. The default is false. This query parameter is set to true by the Hadoop ABFS driver to indicate that the file stream has been closed."
    # + contentLength - Required for "Append Data" and "Flush Data".  Must be 0 for "Flush Data".  Must be the length of the request content in bytes for "Append Data".
    # + contentMd5 - Optional. An MD5 hash of the request content. This header is valid on "Append" and "Flush" operations. This hash is used to verify the integrity of the request content during transport. When this header is specified, the storage service compares the hash of the content that has arrived with this header value. If the two hashes do not match, the operation will fail with error code 400 (Bad Request). Note that this MD5 hash is not stored with the file. This header is associated with the request content, and not with the stored content of the file itself.
    # + xMsLeaseId - The lease ID must be specified if there is an active lease.
    # + xMsCacheControl - Optional and only valid for flush and set properties operations.  The service stores this value and includes it in the "Cache-Control" response header for "Read File" operations.
    # + xMsContentType - Optional and only valid for flush and set properties operations.  The service stores this value and includes it in the "Content-Type" response header for "Read File" operations.
    # + xMsContentDisposition - Optional and only valid for flush and set properties operations.  The service stores this value and includes it in the "Content-Disposition" response header for "Read File" operations.
    # + xMsContentEncoding - Optional and only valid for flush and set properties operations.  The service stores this value and includes it in the "Content-Encoding" response header for "Read File" operations.
    # + xMsContentLanguage - Optional and only valid for flush and set properties operations.  The service stores this value and includes it in the "Content-Language" response header for "Read File" operations.
    # + xMsContentMd5 - Optional and only valid for "Flush & Set Properties" operations.  The service stores this value and includes it in the "Content-Md5" response header for "Read & Get Properties" operations. If this property is not specified on the request, then the property will be cleared for the file. Subsequent calls to "Read & Get Properties" will not return this property unless it is explicitly set on that file again.
    # + xMsProperties - Optional.  User-defined properties to be stored with the file or directory, in the format of a comma-separated list of name and value pairs "n1=v1, n2=v2, ...", where each value is a base64 encoded string. Note that the string may only contain ASCII characters in the ISO-8859-1 character set. Valid only for the setProperties operation. If the file or directory exists, any properties not included in the list will be removed.  All properties are removed if the header is omitted.  To merge new and existing properties, first get all existing properties and the current E-Tag, then make a conditional request with the E-Tag and include values for all properties.
    # + xMsOwner - Optional and valid only for the setAccessControl operation. Sets the owner of the file or directory.
    # + xMsGroup - Optional and valid only for the setAccessControl operation. Sets the owning group of the file or directory.
    # + xMsPermissions - Optional and only valid if Hierarchical Namespace is enabled for the account. Sets POSIX access permissions for the file owner, the file owning group, and others. Each class may be granted read, write, or execute permission.  The sticky bit is also supported.  Both symbolic (rwxrw-rw-) and 4-digit octal notation (e.g. 0766) are supported. Invalid in conjunction with x-ms-acl.
    # + xMsAcl - Optional and valid only for the setAccessControl operation. Sets POSIX access control rights on files and directories. The value is a comma-separated list of access control entries that fully replaces the existing access control list (ACL).  Each access control entry (ACE) consists of a scope, a type, a user or group identifier, and permissions in the format "[scope:][type]:[id]:[permissions]". The scope must be "default" to indicate the ACE belongs to the default ACL for a directory; otherwise scope is implicit and the ACE belongs to the access ACL.  There are four ACE types: "user" grants rights to the owner or a named user, "group" grants rights to the owning group or a named group, "mask" restricts rights granted to named users and the members of groups, and "other" grants rights to all users not found in any of the other entries. The user or group identifier is omitted for entries of type "mask" and "other".  The user or group identifier is also omitted for the owner and owning group.  The permission field is a 3-character sequence where the first character is 'r' to grant read access, the second character is 'w' to grant write access, and the third character is 'x' to grant execute permission.  If access is not granted, the '-' character is used to denote that the permission is denied. For example, the following ACL grants read, write, and execute rights to the file owner and john.doe@contoso, the read right to the owning group, and nothing to everyone else: "user::rwx,user:john.doe@contoso:rwx,group::r--,other::---,mask=rwx". Invalid in conjunction with x-ms-permissions.
    # + ifMatch - Optional for Flush Data and Set Properties, but invalid for Append Data.  An ETag value. Specify this header to perform the operation only if the resource's ETag matches the value specified. The ETag must be specified in quotes.
    # + ifNoneMatch - Optional for Flush Data and Set Properties, but invalid for Append Data.  An ETag value or the special wildcard ("*") value. Specify this header to perform the operation only if the resource's ETag does not match the value specified. The ETag must be specified in quotes.
    # + ifModifiedSince - Optional for Flush Data and Set Properties, but invalid for Append Data. A date and time value. Specify this header to perform the operation only if the resource has been modified since the specified date and time.
    # + ifUnmodifiedSince - Optional for Flush Data and Set Properties, but invalid for Append Data. A date and time value. Specify this header to perform the operation only if the resource has not been modified since the specified date and time.
    # + return - The data was flushed (written) to the file or the properties were set successfully.
    remote isolated function pathUpdate(string filesystem,string pathParam,string action,string? xMsClientRequestId=(),int?timeout=(),string?xMsDate=(),string?xMsVersion=(),int?position=(),boolean?retainUncommittedData=(),boolean?close=(),int?contentLength=(),string?contentMd5=(),string?xMsLeaseId=(),string?xMsCacheControl=(),string?xMsContentType=(),string?xMsContentDisposition=(),string?xMsContentEncoding=(),string?xMsContentLanguage=(),string?xMsContentMd5=(),string?xMsProperties=(),string?xMsOwner=(),string?xMsGroup=(),string?xMsPermissions=(),string?xMsAcl=(),string?ifMatch=(),string?ifNoneMatch=(),string?ifModifiedSince=(),string?ifUnmodifiedSince=())returns http:Response | error{
        string  path = string `/${filesystem}/${pathParam}`;
        map<anydata> queryParam = {"timeout": timeout, "action": action, "position": position, "retainUncommittedData": retainUncommittedData, "close": close};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-client-request-id": xMsClientRequestId, "x-ms-date": xMsDate, "x-ms-version": xMsVersion, "Content-Length": contentLength, "Content-MD5": contentMd5, "x-ms-lease-id": xMsLeaseId, "x-ms-cache-control": xMsCacheControl, "x-ms-content-type": xMsContentType, "x-ms-content-disposition": xMsContentDisposition, "x-ms-content-encoding": xMsContentEncoding, "x-ms-content-language": xMsContentLanguage, "x-ms-content-md5": xMsContentMd5, "x-ms-properties": xMsProperties, "x-ms-owner": xMsOwner, "x-ms-group": xMsGroup, "x-ms-permissions": xMsPermissions, "x-ms-acl": xMsAcl, "If-Match": ifMatch, "If-None-Match": ifNoneMatch, "If-Modified-Since": ifModifiedSince, "If-Unmodified-Since": ifUnmodifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        http:Response  response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=http:Response );
        return response;
    } 
    # Get Properties | Get Status | Get Access Control List | Check Access
    #
    # + filesystem - The filesystem identifier.
    # + pathParam - The file or directory path.
    # + xMsClientRequestId - A UUID recorded in the analytics logs for troubleshooting and correlation.
    # + timeout - An optional operation timeout value in seconds. The period begins when the request is received by the service. If the timeout value elapses before the operation completes, the operation fails.
    # + xMsDate - Specifies the Coordinated Universal Time (UTC) for the request.  This is required when using shared key authorization.
    # + xMsVersion - Specifies the version of the REST protocol used for processing the request. This is required when using shared key authorization.
    # + action - Optional. If the value is "getStatus" only the system defined properties for the path are returned. If the value is "getAccessControl" the access control list is returned in the response headers (Hierarchical Namespace must be enabled for the account), otherwise the properties are returned.
    # + upn - Optional. Valid only when Hierarchical Namespace is enabled for the account. If "true", the user identity values returned in the x-ms-owner, x-ms-group, and x-ms-acl response headers will be transformed from Azure Active Directory Object IDs to User Principal Names.  If "false", the values will be returned as Azure Active Directory Object IDs. The default value is false. Note that group and application Object IDs are not translated because they do not have unique friendly names.
    # + fsAction - Required only for check access action. Valid only when Hierarchical Namespace is enabled for the account. File system operation read/write/execute in string form, matching regex pattern '[rwx-]{3}'
    # + xMsLeaseId - Optional. If this header is specified, the operation will be performed only if both of the following conditions are met: i) the path's lease is currently active and ii) the lease ID specified in the request matches that of the path.
    # + ifMatch - Optional.  An ETag value. Specify this header to perform the operation only if the resource's ETag matches the value specified. The ETag must be specified in quotes.
    # + ifNoneMatch - Optional.  An ETag value or the special wildcard ("*") value. Specify this header to perform the operation only if the resource's ETag does not match the value specified. The ETag must be specified in quotes.
    # + ifModifiedSince - Optional. A date and time value. Specify this header to perform the operation only if the resource has been modified since the specified date and time.
    # + ifUnmodifiedSince - Optional. A date and time value. Specify this header to perform the operation only if the resource has not been modified since the specified date and time.
    # + return - Returns all properties for the file or directory.
    remote isolated function pathGetproperties(string filesystem, string pathParam, string? xMsClientRequestId = (), int? timeout = (), string? xMsDate = (), string? xMsVersion = (), string? action = (), boolean? upn = (), string? fsAction = (), string? xMsLeaseId = (), string? ifMatch = (), string? ifNoneMatch = (), string? ifModifiedSince = (), string? ifUnmodifiedSince = ()) returns http:Response | error {
        string  path = string `/${filesystem}/${pathParam}`;
        map<anydata> queryParam = {"timeout": timeout, "action": action, "upn": upn, "fsAction": fsAction};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-ms-client-request-id": xMsClientRequestId, "x-ms-date": xMsDate, "x-ms-version": xMsVersion, "x-ms-lease-id": xMsLeaseId, "If-Match": ifMatch, "If-None-Match": ifNoneMatch, "If-Modified-Since": ifModifiedSince, "If-Unmodified-Since": ifUnmodifiedSince};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response  response = check self.clientEp-> head(path, accHeaders);
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
