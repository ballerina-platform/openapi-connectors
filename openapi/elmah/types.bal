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

public type DeploymentArr Deployment[];

public type LogArr Log[];

public type CreateBulkMessageResultArr CreateBulkMessageResult[];

public type UptimeCheckArr UptimeCheck[];

# Properties of Message.
public type Message record {
    # Used to identify which application logged this message. You can use this if you have multiple applications and services logging to the same log
    string? application?;
    # A list of breadcrumbs preceding this log message.
    Breadcrumb[]? breadcrumbs?;
    # Code can be used to include source code related to the log message. The code will typically span from a few lines before the line causing the log message
    string? code?;
    # A key/value pair of cookies. This property only makes sense for logging messages related to web requests.
    Item[]? cookies?;
    # CorrelationId can be used to group similar log messages together into a single discoverable batch. A correlation ID could be a session ID from ASP.NET Core,
    string? correlationId?;
    # A key/value pair of user-defined fields and their values. When logging an exception, the Data dictionary of
    Item[]? data?;
    # The date and time in UTC of the message. If you don't provide us with a value in dateTime, we will set the current date and time in UTC.
    string? dateTime?;
    # A longer description of the message. For errors this could be a stacktrace, but it's really up to you what to log in there.
    string? detail?;
    # A key/value pair of form fields and their values. This property makes sense if logging message related to users inputting data in a form.
    Item[]? form?;
    # The hostname of the server logging the message.
    string? hostname?;
    # The ID of this message.
    string? id?;
    # If message relates to a HTTP request, you may send the HTTP method of that request. If you don't provide us with a method, we will try to find a key named REQUEST_METHOD in serverVariables.
    string? method?;
    # A key/value pair of query string parameters. This property makes sense if logging message related to a HTTP request.
    Item[]? queryString?;
    # A key/value pair of server values. Server variables are typically related to handling requests in a webserver but could be used for other types of information as well.
    Item[]? serverVariables?;
    # An enum value representing the severity of this message. The following values are allowed: Verbose, Debug, Information, Warning, Error, Fatal
    string? severity?;
    # The source of the code logging the message. This could be the assembly name.
    string? 'source?;
    # If the message logged relates to a HTTP status code, you can put the code in this property. This would probably only be relevant for errors,
    int? statusCode?;
    # The textual title or headline of the message to log.
    string? title?;
    # The title template of the message to log. This property can be used from logging frameworks that supports
    string? titleTemplate?;
    # The type of message. If logging an error, the type of the exception would go into type but you can put anything in there, that makes sense for your domain.
    string? 'type?;
    # If message relates to a HTTP request, you may send the URL of that request. If you don't provide us with an URL, we will try to find a key named URL in serverVariables.
    string? url?;
    # An identification of the user triggering this message. You can put the users email address or your user key into this property.
    string? user?;
    # Versions can be used to distinguish messages from different versions of your software. The value of version can be a SemVer compliant string or any other
    string? 'version?;
};

# The result of create message operation.
public type CreateMessageResult record {
    # The location of the created message.
    string? location?;
};

# Properties of Log.
public type Log record {
    # Color of the log. The color will always be one of the following (green being the default):
    string? color?;
    # Returns true if the log is currently disabled. A log can be disabled either through the API
    boolean? disabled?;
    # Environment name this log is in or "Other" if not in an environment.
    string? environmentName?;
    # ID of the log.
    string? id?;
    # Name of the log.
    string? name?;
};

# Deployment information.
public type Deployment record {
    # When was this deployment created.
    string? created?;
    # The elmah.io id of the user creating this deployment. Since deployments are created on a subscription,
    string? createdBy?;
    # Sescription of this deployment in markdown or clear text.
    string? description?;
    # The ID of this deployment.
    string? id?;
    # If the deployment is attached a single log, this property is set to the ID of that log.
    string? logId?;
    # The email of the person responsible for creating this deployment.
    string? userEmail?;
    # The name of the person responsible for creating this deployment.
    string? userName?;
    # The version number of this deployment. The value of version can be a SemVer compliant string or any other
    string? 'version?;
};

# A breadcrumb represent a step preceding a log message.
public type Breadcrumb record {
    # An action representing the breadcrumb. You can set a custom action or use one of the built-in: click, submit, navigation, request, error.
    string action?;
    # The date and time in UTC of the breadcrumb. If no date and time is provided, we will use the current date and time in UTC.
    string dateTime?;
    # A message representing the breadcrumb. This should elaborate on the action.
    string message?;
    # An enum value representing the severity of this breadcrumb. The following values are allowed: Verbose, Debug, Information, Warning, Error, Fatal.
    string severity?;
};

# Message summary.
public type MessagesResult record {
    # Log messages.
    MessageOverview[]? messages?;
    # The total number of log messages found.
    int? total?;
};

# The result of create bulk operation.
public type CreateBulkMessageResult record {
    # The location of the created message if StatusCode equals Created.
    string? location?;
    # Status code of the individual messages as if it were being created through the non-bulk endpoint.
    int? statusCode?;
};

# Deployment information.
public type CreateDeployment record {
    # When was this deployment created in UTC. Defaults to current time if not specified.
    string created?;
    # Optional description of this deployment. Can be markdown or clear text.
    string description?;
    # As default, deployments are attached all logs of the organization. If you want a deployment to
    string logId?;
    # The email of the person responsible for creating this deployment. This can be the email taken from
    string userEmail?;
    # The name of the person responsible for creating this deployment. This can be the name taken from
    string userName?;
    # The version number of this deployment. The value of version can be a SemVer compliant string or any other
    string 'version;
};

# The result of create deployment operation.
public type CreateDeploymentResult record {
    # The location of the created deployment.
    string? location?;
};

# Message overview.
public type MessageOverview record {
    # Used to identify which application logged this message. You can use this if you have multiple applications and services logging to the same log
    string application?;
    # A list of breadcrumbs preceding this log message.
    Breadcrumb[] breadcrumbs?;
    # Code can be used to include source code related to the log message. The code will typically span from a few lines before the line causing the log message
    string code?;
    # A key/value pair of cookies. This property only makes sense for logging messages related to web requests.
    Item[] cookies?;
    # CorrelationId can be used to group similar log messages together into a single discoverable batch. A correlation ID could be a session ID from ASP.NET Core,
    string correlationId?;
    # A key/value pair of user-defined fields and their values. When logging an exception, the Data dictionary of
    Item[] data?;
    # The date and time in UTC of the message. If you don't provide us with a value in dateTime, we will set the current date and time in UTC.
    string dateTime?;
    # A longer description of the message. For errors this could be a stacktrace, but it's really up to you what to log in there.
    string detail?;
    # A key/value pair of form fields and their values. This property makes sense if logging message related to users inputting data in a form.
    Item[] form?;
    # The hostname of the server logging the message.
    string hostname?;
    # The ID of this message.
    string id?;
    # If message relates to a HTTP request, you may send the HTTP method of that request. If you don't provide us with a method, we will try to find a key named REQUEST_METHOD in serverVariables.
    string method?;
    # A key/value pair of query string parameters. This property makes sense if logging message related to a HTTP request.
    Item[] queryString?;
    # A key/value pair of server values. Server variables are typically related to handling requests in a webserver but could be used for other types of information as well.
    Item[] serverVariables?;
    # An enum value representing the severity of this message. The following values are allowed: Verbose, Debug, Information, Warning, Error, Fatal
    string severity?;
    # The source of the code logging the message. This could be the assembly name.
    string 'source?;
    # If the message logged relates to a HTTP status code, you can put the code in this property. This would probably only be relevant for errors,
    int statusCode?;
    # The textual title or headline of the message to log.
    string title?;
    # The title template of the message to log. This property can be used from logging frameworks that supports
    string titleTemplate?;
    # The type of message. If logging an error, the type of the exception would go into type but you can put anything in there, that makes sense for your domain.
    string 'type?;
    # If message relates to a HTTP request, you may send the URL of that request. If you don't provide us with an URL, we will try to find a key named URL in serverVariables.
    string url?;
    # An identification of the user triggering this message. You can put the users email address or your user key into this property.
    string user?;
    # Versions can be used to distinguish messages from different versions of your software. The value of version can be a SemVer compliant string or any other
    string 'version?;
};

# Uptime check.
public type UptimeCheck record {
    # ID of the uptime check.
    string? id?;
    # Name of the uptime check.
    string? name?;
    # Current status of the uptime check.
    string? status?;
    # Url of the uptime check.
    string? url?;
};

# The result of create log operation.
public type CreateLogResult record {
    # The location of the created log.
    string? location?;
};

# Represents a key value pair.
public type Item record {
    # The key of the item.
    string 'key?;
    # The value of the item.
    string value?;
};

# Log information.
public type CreateLog record {
    # Name of the new log.
    string name;
};

# Search properties.
public type Search record {
    # Search from this date.
    string 'from?;
    # Lucene query.
    string query?;
    # Search to this date.
    string to?;
};

# Heartbeat information.
public type CreateHeartbeat record {
    # Optional string to identify which application logged this message. You can use this if you have multiple applications and services logging to the same log.
    string application?;
    # If result is "Degraded" or "Unhealthy" you can use this property to specify why.
    string reason?;
    # The result of this heartbeat. Can be "Healthy", "Degraded", or "Unhealthy". Defaults to "Healthy"
    string result?;
    # Optional long for specifying how many milliseconds it took to execute the task resulting in this heartbeat. This can be used to get a better overview
    int took?;
    # Optional string to identify which version of your application logged this message. If not specified, any errors, warnings, or information messages will get
    string 'version?;
};

# Message information.
public type CreateMessage record {
    # Used to identify which application logged this message. You can use this if you have multiple applications and services logging to the same log
    string application?;
    # A list of breadcrumbs preceding this log message.
    Breadcrumb[] breadcrumbs?;
    # Code can be used to include source code related to the log message. The code will typically span from a few lines before the line causing the log message
    string code?;
    # A key/value pair of cookies. This property only makes sense for logging messages related to web requests.
    Item[] cookies?;
    # CorrelationId can be used to group similar log messages together into a single discoverable batch. A correlation ID could be a session ID from ASP.NET Core,
    string correlationId?;
    # A key/value pair of user-defined fields and their values. When logging an exception, the Data dictionary of
    Item[] data?;
    # The date and time in UTC of the message. If you don't provide us with a value in dateTime, we will set the current date and time in UTC.
    string dateTime?;
    # A longer description of the message. For errors this could be a stacktrace, but it's really up to you what to log in there.
    string detail?;
    # A key/value pair of form fields and their values. This property makes sense if logging message related to users inputting data in a form.
    Item[] form?;
    # The hostname of the server logging the message.
    string hostname?;
    # If message relates to a HTTP request, you may send the HTTP method of that request. If you don't provide us with a method, we will try to find a key named REQUEST_METHOD in serverVariables.
    string method?;
    # A key/value pair of query string parameters. This property makes sense if logging message related to a HTTP request.
    Item[] queryString?;
    # A key/value pair of server values. Server variables are typically related to handling requests in a webserver but could be used for other types of information as well.
    Item[] serverVariables?;
    # An enum value representing the severity of this message. The following values are allowed: Verbose, Debug, Information, Warning, Error, Fatal
    string severity?;
    # The source of the code logging the message. This could be the assembly name.
    string 'source?;
    # If the message logged relates to a HTTP status code, you can put the code in this property. This would probably only be relevant for errors,
    int statusCode?;
    # The textual title or headline of the message to log.
    string title?;
    # The title template of the message to log. This property can be used from logging frameworks that supports
    string titleTemplate?;
    # The type of message. If logging an error, the type of the exception would go into type but you can put anything in there, that makes sense for your domain.
    string 'type?;
    # If message relates to a HTTP request, you may send the URL of that request. If you don't provide us with an URL, we will try to find a key named URL in serverVariables.
    string url?;
    # An identification of the user triggering this message. You can put the users email address or your user key into this property.
    string user?;
    # Versions can be used to distinguish messages from different versions of your software. The value of version can be a SemVer compliant string or any other
    string 'version?;
};
