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
    # Configurations related to client authentication
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
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

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://accounts.google.com/o/oauth2/token";
|};

# An API executable entry point.
public type GoogleAppsScriptTypeExecutionApiEntryPoint record {
    # API executable entry point configuration.
    GoogleAppsScriptTypeExecutionApiConfig entryPointConfig?;
};

# Request with deployment information to update an existing deployment.
public type UpdateDeploymentRequest record {
    # Metadata the defines how a deployment is configured.
    DeploymentConfig deploymentConfig?;
};

# Request to create a script project. Request to create a script project.
public type CreateProjectRequest record {
    # The Drive ID of a parent file that the created script project is bound to. This is usually the ID of a Google Doc, Google Sheet, Google Form, or Google Slides file. If not set, a standalone script project is created.
    string parentId?;
    # The title for the project.
    string title?;
};

# An object that provides information about the nature of an error resulting from an attempted execution of a script function using the Apps Script API. If a run call succeeds but the script function (or Apps Script itself) throws an exception, the response body's error field contains a Status object. The `Status` object's `details` field contains an array with a single one of these `ExecutionError` objects.
public type ExecutionError record {
    # The error message thrown by Apps Script, usually localized into the user's language.
    string errorMessage?;
    # The error type, for example `TypeError` or `ReferenceError`. If the error type is unavailable, this field is not included.
    string errorType?;
    # An array of objects that provide a stack trace through the script to show where the execution failed, with the deepest call first.
    ScriptStackTraceElement[] scriptStackTraceElements?;
};

# A simple user profile resource.
public type GoogleAppsScriptTypeUser record {
    # The user's domain.
    string domain?;
    # The user's identifying email address.
    string email?;
    # The user's display name.
    string name?;
    # The user's photo.
    string photoUrl?;
};

# The result of an execution.
public type ScriptExecutionResult record {
    # `Value` represents a dynamically typed value which is the outcome of an executed script.
    Value returnValue?;
};

# Representation of a single script deployment.
public type Deployment record {
    # Metadata the defines how a deployment is configured.
    DeploymentConfig deploymentConfig?;
    # The deployment ID for this deployment.
    string deploymentId?;
    # The deployment's entry points.
    EntryPoint[] entryPoints?;
    # Last modified date time stamp.
    string updateTime?;
};

# A configuration that defines how a deployment is accessed externally.
public type EntryPoint record {
    # An add-on entry point.
    GoogleAppsScriptTypeAddOnEntryPoint addOn?;
    # The type of the entry point.
    string entryPointType?;
    # An API executable entry point.
    GoogleAppsScriptTypeExecutionApiEntryPoint executionApi?;
    # A web application entry point.
    GoogleAppsScriptTypeWebAppEntryPoint webApp?;
};

# A request to run the function in a script. The script is identified by the specified `script_id`. Executing a function on a script returns results based on the implementation of the script.
public type ExecutionRequest record {
    # If `true` and the user is an owner of the script, the script runs at the most recently saved version rather than the version deployed for use with the Apps Script API. Optional; default is `false`.
    boolean devMode?;
    # The name of the function to execute in the given script. The name does not include parentheses or parameters. It can reference a function in an included library such as `Library.libFunction1`.
    string 'function?;
    # The parameters to be passed to the function being executed. The object type for each parameter should match the expected type in Apps Script. Parameters cannot be Apps Script-specific object types (such as a `Document` or a `Calendar`); they can only be primitive types such as `string`, `number`, `array`, `object`, or `boolean`. Optional.
    anydata[] parameters?;
    # *Deprecated*. For use with Android add-ons only. An ID that represents the user's current session in the Android app for Google Docs or Sheets, included as extra data in the [Intent](https://developer.android.com/guide/components/intents-filters.html) that launches the add-on. When an Android add-on is run with a session state, it gains the privileges of a [bound](https://developers.google.com/apps-script/guides/bound) script—that is, it can access information like the user's current cursor position (in Docs) or selected cell (in Sheets). To retrieve the state, call `Intent.getStringExtra("com.google.android.apps.docs.addons.SessionState")`. Optional.
    string sessionState?;
};

# A representation of an execution of an Apps Script function started with run. The execution response does not arrive until the function finishes executing. The maximum execution runtime is listed in the [Apps Script quotas guide](/apps-script/guides/services/quotas#current_limitations). After execution has started, it can have one of four outcomes: - If the script function returns successfully, the response field contains an ExecutionResponse object with the function's return value in the object's `result` field. - If the script function (or Apps Script itself) throws an exception, the error field contains a Status object. The `Status` object's `details` field contains an array with a single ExecutionError object that provides information about the nature of the error. - If the execution has not yet completed, the done field is `false` and the neither the `response` nor `error` fields are present. - If the `run` call itself fails (for example, because of a malformed request or an authorization error), the method returns an HTTP response code in the 4XX range with a different format for the response body. Client libraries automatically convert a 4XX response into an exception class. 
public type Operation record {
    # This field indicates whether the script execution has completed. A completed execution has a populated `response` field containing the ExecutionResponse from function that was executed.
    boolean done?;
    # If a `run` call succeeds but the script function (or Apps Script itself) throws an exception, the response body's error field contains this `Status` object.
    Status 'error?;
    # If the script function returns successfully, this field contains an ExecutionResponse object with the function's return value.
    record {} response?;
};

# An add-on entry point.
public type GoogleAppsScriptTypeAddOnEntryPoint record {
    # The add-on's required list of supported container types.
    string addOnType?;
    # The add-on's optional description.
    string description?;
    # The add-on's optional help URL.
    string helpUrl?;
    # The add-on's required post install tip URL.
    string postInstallTipUrl?;
    # The add-on's optional report issue URL.
    string reportIssueUrl?;
    # The add-on's required title.
    string title?;
};

# A web application entry point.
public type GoogleAppsScriptTypeWebAppEntryPoint record {
    # Web app entry point configuration.
    GoogleAppsScriptTypeWebAppConfig entryPointConfig?;
    # The URL for the web application.
    string url?;
};

# `Struct` represents a structured data value, consisting of fields which map to dynamically typed values.
public type Struct record {
    # Unordered map of dynamically typed values.
    record {} fields?;
};

# A stack trace through the script that shows where the execution failed.
public type ScriptStackTraceElement record {
    # The name of the function that failed.
    string 'function?;
    # The line number where the script failed.
    int lineNumber?;
};

# Resource containing usage stats for a given script, based on the supplied filter and mask present in the request.
public type Metrics record {
    # Number of active users.
    MetricsValue[] activeUsers?;
    # Number of failed executions.
    MetricsValue[] failedExecutions?;
    # Number of total executions.
    MetricsValue[] totalExecutions?;
};

# Web app entry point configuration.
public type GoogleAppsScriptTypeWebAppConfig record {
    # Who has permission to run the web app.
    string access?;
    # Who to execute the web app as.
    string executeAs?;
};

# Response with the list of Process resources.
public type ListScriptProcessesResponse record {
    # Token for the next page of results. If empty, there are no more pages remaining.
    string nextPageToken?;
    # List of processes matching request parameters.
    GoogleAppsScriptTypeProcess[] processes?;
};

# A resource representing a script project version. A version is a "snapshot" of a script project and is similar to a read-only branched release. When creating deployments, the version to use must be specified.
public type Version record {
    # When the version was created.
    string createTime?;
    # The description for this version.
    string description?;
    # The script project's Drive ID.
    string scriptId?;
    # The incremental ID that is created by Apps Script when a version is created. This is system assigned number and is immutable once created.
    int versionNumber?;
};

# A set of functions. No duplicates are permitted.
public type GoogleAppsScriptTypeFunctionSet record {
    # A list of functions composing the set.
    GoogleAppsScriptTypeFunction[] values?;
};

# API executable entry point configuration.
public type GoogleAppsScriptTypeExecutionApiConfig record {
    # Who has permission to run the API executable.
    string access?;
};

# Response with the list of the versions for the specified script project.
public type ListVersionsResponse record {
    # The token use to fetch the next page of records. if not exist in the response, that means no more versions to list.
    string nextPageToken?;
    # The list of versions.
    Version[] versions?;
};

# If a `run` call succeeds but the script function (or Apps Script itself) throws an exception, the response body's error field contains this `Status` object.
public type Status record {
    # The status code. For this API, this value either: - 10, indicating a `SCRIPT_TIMEOUT` error, - 3, indicating an `INVALID_ARGUMENT` error, or - 1, indicating a `CANCELLED` execution. 
    int code?;
    # An array that contains a single ExecutionError object that provides information about the nature of the error.
    record {}[] details?;
    # A developer-facing error message, which is in English. Any user-facing error message is localized and sent in the details field, or localized by the client.
    string message?;
};

# An object that provides the return value of a function executed using the Apps Script API. If the script function returns successfully, the response body's response field contains this `ExecutionResponse` object.
public type ExecutionResponse record {
    # The return value of the script function. The type matches the object type returned in Apps Script. Functions called using the Apps Script API cannot return Apps Script-specific objects (such as a `Document` or a `Calendar`); they can only return primitive types such as a `string`, `number`, `array`, `object`, or `boolean`.
    anydata result?;
};

# `ListValue` is a wrapper around a repeated field of values.
public type ListValue record {
    # Repeated field of dynamically typed values.
    Value[] values?;
};

# Represents a function in a script project.
public type GoogleAppsScriptTypeFunction record {
    # The function name in the script project.
    string name?;
};

# Representation of a single script process execution that was started from the script editor, a trigger, an application, or using the Apps Script API. This is distinct from the `Operation` resource, which only represents executions started via the Apps Script API.
public type GoogleAppsScriptTypeProcess record {
    # Duration the execution spent executing.
    string duration?;
    # Name of the function the started the execution.
    string functionName?;
    # The executions status.
    string processStatus?;
    # The executions type.
    string processType?;
    # Name of the script being executed.
    string projectName?;
    # Time the execution started.
    string startTime?;
    # The executing users access level to the script.
    string userAccessLevel?;
};

# Response with the list of Process resources.
public type ListUserProcessesResponse record {
    # Token for the next page of results. If empty, there are no more pages remaining.
    string nextPageToken?;
    # List of processes matching request parameters.
    GoogleAppsScriptTypeProcess[] processes?;
};

# Response with the list of deployments for the specified Apps Script project.
public type ListDeploymentsResponse record {
    # The list of deployments.
    Deployment[] deployments?;
    # The token that can be used in the next call to get the next page of results.
    string nextPageToken?;
};

# The script project resource.
public type Project record {
    # When the script was created.
    string createTime?;
    # A simple user profile resource.
    GoogleAppsScriptTypeUser creator?;
    # A simple user profile resource.
    GoogleAppsScriptTypeUser lastModifyUser?;
    # The parent's Drive ID that the script will be attached to. This is usually the ID of a Google Document or Google Sheet. This filed is optional, and if not set, a stand-alone script will be created.
    string parentId?;
    # The script project's Drive ID.
    string scriptId?;
    # The title for the project.
    string title?;
    # When the script was last updated.
    string updateTime?;
};

# The Content resource.
public type Content record {
    # The list of script project files. One of the files is a script manifest; it must be named "appsscript", must have type of JSON, and include the manifest configurations for the project.
    File[] files?;
    # The script project's Drive ID.
    string scriptId?;
};

# `Value` represents a dynamically typed value which is the outcome of an executed script.
public type Value record {
    # Represents a boolean value.
    boolean boolValue?;
    # Represents raw byte values.
    string bytesValue?;
    # Represents a date in ms since the epoch.
    string dateValue?;
    # `ListValue` is a wrapper around a repeated field of values.
    ListValue listValue?;
    # Represents a null value.
    string nullValue?;
    # Represents a double value.
    decimal numberValue?;
    # Represents a structured proto value.
    record {} protoValue?;
    # Represents a string value.
    string stringValue?;
    # `Struct` represents a structured data value, consisting of fields which map to dynamically typed values.
    Struct structValue?;
};

# Metrics value that holds number of executions counted.
public type MetricsValue record {
    # Required field indicating the end time of the interval.
    string endTime?;
    # Required field indicating the start time of the interval.
    string startTime?;
    # Indicates the number of executions counted.
    string value?;
};

# Metadata the defines how a deployment is configured.
public type DeploymentConfig record {
    # The description for this deployment.
    string description?;
    # The manifest file name for this deployment.
    string manifestFileName?;
    # The script project's Drive ID.
    string scriptId?;
    # The version number on which this deployment is based.
    int versionNumber?;
};

# The response for executing or debugging a function in an Apps Script project.
public type ExecuteStreamResponse record {
    # The result of an execution.
    ScriptExecutionResult result?;
};

# An individual file within a script project. A file is a third-party source code created by one or more developers. It can be a server-side JS code, HTML, or a configuration file. Each script project can contain multiple files.
public type File record {
    # Creation date timestamp. This read-only field is only visible to users who have WRITER permission for the script project.
    string createTime?;
    # A set of functions. No duplicates are permitted.
    GoogleAppsScriptTypeFunctionSet functionSet?;
    # A simple user profile resource.
    GoogleAppsScriptTypeUser lastModifyUser?;
    # The name of the file. The file extension is not part of the file name, which can be identified from the type field.
    string name?;
    # The file content.
    string 'source?;
    # The type of the file.
    string 'type?;
    # Last modified date timestamp. This read-only field is only visible to users who have WRITER permission for the script project.
    string updateTime?;
};
