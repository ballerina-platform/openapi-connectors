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

# Configuration record for Youtube Analytics API.
#
# + authConfig - Bearer token or OAuth2 refresh token grant configuration tokens
# + secureSocketConfig - Secure socket configuration
public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# This is a generated connector for [Youtube Analytics API v2](https://developers.google.com/youtube/analytics) OpenAPI specification.
# The Youtube Analytics API provides the capability to retrieve your YouTube Analytics data.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/identity/protocols/oauth2).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://youtubeanalytics.googleapis.com/") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Returns a collection of group items that match the API request parameters.
    #
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + groupId - The `groupId` parameter specifies the unique ID of the group for which you want to retrieve group items.
    # + onBehalfOfContentOwner - This parameter can only be used in a properly authorized request. **Note:** This parameter is intended exclusively for YouTube content partners that own and manage many different YouTube channels. The `onBehalfOfContentOwner` parameter indicates that the request's authorization credentials identify a YouTube user who is acting on behalf of the content owner specified in the parameter value. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The account that the user authenticates with must be linked to the specified YouTube content owner.
    # + return - Successful response
    remote isolated function listGroupItems(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? groupId = (), string? onBehalfOfContentOwner = ()) returns ListGroupItemsResponse|error {
        string  path = string `/v2/groupItems`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "groupId": groupId, "onBehalfOfContentOwner": onBehalfOfContentOwner};
        path = path + check getPathForQueryParam(queryParam);
        ListGroupItemsResponse response = check self.clientEp-> get(path, targetType = ListGroupItemsResponse);
        return response;
    }
    # Creates a group item.
    #
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + onBehalfOfContentOwner - This parameter can only be used in a properly authorized request. **Note:** This parameter is intended exclusively for YouTube content partners that own and manage many different YouTube channels. The `onBehalfOfContentOwner` parameter indicates that the request's authorization credentials identify a YouTube user who is acting on behalf of the content owner specified in the parameter value. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The account that the user authenticates with must be linked to the specified YouTube content owner.
    # + return - Successful response
    remote isolated function insertGroupItems(GroupItem payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? onBehalfOfContentOwner = ()) returns GroupItem|error {
        string  path = string `/v2/groupItems`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "onBehalfOfContentOwner": onBehalfOfContentOwner};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GroupItem response = check self.clientEp->post(path, request, targetType=GroupItem);
        return response;
    }
    # Removes an item from a group.
    #
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + id - The `id` parameter specifies the YouTube group item ID of the group item that is being deleted.
    # + onBehalfOfContentOwner - This parameter can only be used in a properly authorized request. **Note:** This parameter is intended exclusively for YouTube content partners that own and manage many different YouTube channels. The `onBehalfOfContentOwner` parameter indicates that the request's authorization credentials identify a YouTube user who is acting on behalf of the content owner specified in the parameter value. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The account that the user authenticates with must be linked to the specified YouTube content owner.
    # + return - Successful response
    remote isolated function deleteGroupItems(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? id = (), string? onBehalfOfContentOwner = ()) returns EmptyResponse|error {
        string  path = string `/v2/groupItems`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "id": id, "onBehalfOfContentOwner": onBehalfOfContentOwner};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        EmptyResponse response = check self.clientEp-> delete(path, request, targetType = EmptyResponse);
        return response;
    }
    # Returns a collection of groups that match the API request parameters. For example, you can retrieve all groups that the authenticated user owns, or you can retrieve one or more groups by their unique IDs.
    #
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + id - The `id` parameter specifies a comma-separated list of the YouTube group ID(s) for the resource(s) that are being retrieved. Each group must be owned by the authenticated user. In a `group` resource, the `id` property specifies the group's YouTube group ID. Note that if you do not specify a value for the `id` parameter, then you must set the `mine` parameter to `true`.
    # + mine - This parameter can only be used in a properly authorized request. Set this parameter's value to true to retrieve all groups owned by the authenticated user.
    # + onBehalfOfContentOwner - This parameter can only be used in a properly authorized request. **Note:** This parameter is intended exclusively for YouTube content partners that own and manage many different YouTube channels. The `onBehalfOfContentOwner` parameter indicates that the request's authorization credentials identify a YouTube user who is acting on behalf of the content owner specified in the parameter value. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The account that the user authenticates with must be linked to the specified YouTube content owner.
    # + pageToken - The `pageToken` parameter identifies a specific page in the result set that should be returned. In an API response, the `nextPageToken` property identifies the next page that can be retrieved.
    # + return - Successful response
    remote isolated function listGroups(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? id = (), boolean? mine = (), string? onBehalfOfContentOwner = (), string? pageToken = ()) returns ListGroupsResponse|error {
        string  path = string `/v2/groups`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "id": id, "mine": mine, "onBehalfOfContentOwner": onBehalfOfContentOwner, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListGroupsResponse response = check self.clientEp-> get(path, targetType = ListGroupsResponse);
        return response;
    }
    # Modifies a group. For example, you could change a group's title.
    #
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + onBehalfOfContentOwner - This parameter can only be used in a properly authorized request. **Note:** This parameter is intended exclusively for YouTube content partners that own and manage many different YouTube channels. The `onBehalfOfContentOwner` parameter indicates that the request's authorization credentials identify a YouTube user who is acting on behalf of the content owner specified in the parameter value. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The account that the user authenticates with must be linked to the specified YouTube content owner.
    # + return - Successful response
    remote isolated function updateGroups(Group payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? onBehalfOfContentOwner = ()) returns Group|error {
        string  path = string `/v2/groups`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "onBehalfOfContentOwner": onBehalfOfContentOwner};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Group response = check self.clientEp->put(path, request, targetType=Group);
        return response;
    }
    # Creates a group.
    #
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + onBehalfOfContentOwner - This parameter can only be used in a properly authorized request. **Note:** This parameter is intended exclusively for YouTube content partners that own and manage many different YouTube channels. The `onBehalfOfContentOwner` parameter indicates that the request's authorization credentials identify a YouTube user who is acting on behalf of the content owner specified in the parameter value. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The account that the user authenticates with must be linked to the specified YouTube content owner.
    # + return - Successful response
    remote isolated function insertGroups(Group payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? onBehalfOfContentOwner = ()) returns Group|error {
        string  path = string `/v2/groups`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "onBehalfOfContentOwner": onBehalfOfContentOwner};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Group response = check self.clientEp->post(path, request, targetType=Group);
        return response;
    }
    # Deletes a group.
    #
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + id - The `id` parameter specifies the YouTube group ID of the group that is being deleted.
    # + onBehalfOfContentOwner - This parameter can only be used in a properly authorized request. **Note:** This parameter is intended exclusively for YouTube content partners that own and manage many different YouTube channels. The `onBehalfOfContentOwner` parameter indicates that the request's authorization credentials identify a YouTube user who is acting on behalf of the content owner specified in the parameter value. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The account that the user authenticates with must be linked to the specified YouTube content owner.
    # + return - Successful response
    remote isolated function deleteGroups(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? id = (), string? onBehalfOfContentOwner = ()) returns EmptyResponse|error {
        string  path = string `/v2/groups`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "id": id, "onBehalfOfContentOwner": onBehalfOfContentOwner};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        EmptyResponse response = check self.clientEp-> delete(path, request, targetType = EmptyResponse);
        return response;
    }
    # Retrieve your YouTube Analytics reports.
    #
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + currency - The currency to which financial metrics should be converted. The default is US Dollar (USD). If the result contains no financial metrics, this flag will be ignored. Responds with an error if the specified currency is not recognized.", pattern: [A-Z]{3}
    # + dimensions - A comma-separated list of YouTube Analytics dimensions, such as `views` or `ageGroup,gender`. See the [Available Reports](/youtube/analytics/v2/available_reports) document for a list of the reports that you can retrieve and the dimensions used for those reports. Also see the [Dimensions](/youtube/analytics/v2/dimsmets/dims) document for definitions of those dimensions." pattern: [0-9a-zA-Z,]+
    # + endDate - The end date for fetching YouTube Analytics data. The value should be in `YYYY-MM-DD` format. required: true, pattern: [0-9]{4}-[0-9]{2}-[0-9]{2}
    # + filters - A list of filters that should be applied when retrieving YouTube Analytics data. The [Available Reports](/youtube/analytics/v2/available_reports) document identifies the dimensions that can be used to filter each report, and the [Dimensions](/youtube/analytics/v2/dimsmets/dims) document defines those dimensions. If a request uses multiple filters, join them together with a semicolon (`;`), and the returned result table will satisfy both filters. For example, a filters parameter value of `video==dMH0bHeiRNg;country==IT` restricts the result set to include data for the given video in Italy.",
    # + ids - Identifies the YouTube channel or content owner for which you are retrieving YouTube Analytics data. - To request data for a YouTube user, set the `ids` parameter value to `channel==CHANNEL_ID`, where `CHANNEL_ID` specifies the unique YouTube channel ID. - To request data for a YouTube CMS content owner, set the `ids` parameter value to `contentOwner==OWNER_NAME`, where `OWNER_NAME` is the CMS name of the content owner. required: true, pattern: [a-zA-Z]+==[a-zA-Z0-9_+-]+
    # + includeHistoricalChannelData - If set to true historical data (i.e. channel data from before the linking of the channel to the content owner) will be retrieved.",
    # + maxResults - The maximum number of rows to include in the response.", minValue: 1
    # + metrics - A comma-separated list of YouTube Analytics metrics, such as `views` or `likes,dislikes`. See the [Available Reports](/youtube/analytics/v2/available_reports) document for a list of the reports that you can retrieve and the metrics available in each report, and see the [Metrics](/youtube/analytics/v2/dimsmets/mets) document for definitions of those metrics. required: true, pattern: [0-9a-zA-Z,]+
    # + sort - A comma-separated list of dimensions or metrics that determine the sort order for YouTube Analytics data. By default the sort order is ascending. The '`-`' prefix causes descending sort order.", pattern: [-0-9a-zA-Z,]+
    # + startDate - The start date for fetching YouTube Analytics data. The value should be in `YYYY-MM-DD` format. required: true, pattern: "[0-9]{4}-[0-9]{2}-[0-9]{2}
    # + startIndex - An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter (one-based, inclusive).", minValue: 1
    # + return - Successful response
    remote isolated function queryReports(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? currency = (), string? dimensions = (), string? endDate = (), string? filters = (), string? ids = (), boolean? includeHistoricalChannelData = (), int? maxResults = (), string? metrics = (), string? sort = (), string? startDate = (), int? startIndex = ()) returns QueryResponse|error {
        string  path = string `/v2/reports`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "currency": currency, "dimensions": dimensions, "endDate": endDate, "filters": filters, "ids": ids, "includeHistoricalChannelData": includeHistoricalChannelData, "maxResults": maxResults, "metrics": metrics, "sort": sort, "startDate": startDate, "startIndex": startIndex};
        path = path + check getPathForQueryParam(queryParam);
        QueryResponse response = check self.clientEp-> get(path, targetType = QueryResponse);
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
