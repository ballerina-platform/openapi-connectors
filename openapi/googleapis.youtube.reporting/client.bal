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

# Configuration record for Youtube Reporting API.
#
# + authConfig - Bearer token or OAuth2 refresh token grant configuration tokens
# + secureSocketConfig - Secure socket configuration
public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# This is a generated connector for [Youtube Reporting API v1](https://developers.google.com/youtube/reporting) OpenAPI specification.
# The Youtube Reporting API provides the capability to schedule reporting jobs containing your YouTube Analytics data and download the resulting bulk data reports in the form of CSV files.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/identity/protocols/oauth2).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://youtubereporting.googleapis.com/") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Lists jobs.
    #
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + includeSystemManaged - If set to true, also system-managed jobs will be returned; otherwise only user-created jobs will be returned. System-managed jobs can neither be modified nor deleted.
    # + onBehalfOfContentOwner - The content owner's external ID on which behalf the user is acting on. If not set, the user is acting for himself (his own channel).
    # + pageSize - Requested page size. Server may return fewer jobs than requested. If unspecified, server will pick an appropriate default.
    # + pageToken - A token identifying a page of results the server should return. Typically, this is the value of ListReportTypesResponse.next_page_token returned in response to the previous call to the `ListJobs` method.
    # + return - Successful response
    remote isolated function listJobs(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? includeSystemManaged = (), string? onBehalfOfContentOwner = (), int? pageSize = (), string? pageToken = ()) returns ListJobsResponse|error {
        string  path = string `/v1/jobs`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "includeSystemManaged": includeSystemManaged, "onBehalfOfContentOwner": onBehalfOfContentOwner, "pageSize": pageSize, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListJobsResponse response = check self.clientEp-> get(path, targetType = ListJobsResponse);
        return response;
    }
    # Creates a job and returns it.
    #
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + onBehalfOfContentOwner - The content owner's external ID on which behalf the user is acting on. If not set, the user is acting for himself (his own channel).
    # + return - Successful response
    remote isolated function createJob(Job payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? onBehalfOfContentOwner = ()) returns Job|error {
        string  path = string `/v1/jobs`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "onBehalfOfContentOwner": onBehalfOfContentOwner};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Job response = check self.clientEp->post(path, request, targetType=Job);
        return response;
    }
    # Gets a job.
    #
    # + jobId - The ID of the job to retrieve.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + onBehalfOfContentOwner - The content owner's external ID on which behalf the user is acting on. If not set, the user is acting for himself (his own channel).
    # + return - Successful response
    remote isolated function getJob(string jobId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? onBehalfOfContentOwner = ()) returns Job|error {
        string  path = string `/v1/jobs/${jobId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "onBehalfOfContentOwner": onBehalfOfContentOwner};
        path = path + check getPathForQueryParam(queryParam);
        Job response = check self.clientEp-> get(path, targetType = Job);
        return response;
    }
    # Deletes a job.
    #
    # + jobId - The ID of the job to delete.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + onBehalfOfContentOwner - The content owner's external ID on which behalf the user is acting on. If not set, the user is acting for himself (his own channel).
    # + return - Successful response
    remote isolated function deleteJob(string jobId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? onBehalfOfContentOwner = ()) returns error? {
        string  path = string `/v1/jobs/${jobId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "onBehalfOfContentOwner": onBehalfOfContentOwner};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Lists reports created by a specific job. Returns NOT_FOUND if the job does not exist.
    #
    # + jobId - The ID of the job.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + createdAfter - If set, only reports created after the specified date/time are returned.
    # + onBehalfOfContentOwner - The content owner's external ID on which behalf the user is acting on. If not set, the user is acting for himself (his own channel).
    # + pageSize - Requested page size. Server may return fewer report types than requested. If unspecified, server will pick an appropriate default.
    # + pageToken - A token identifying a page of results the server should return. Typically, this is the value of ListReportsResponse.next_page_token returned in response to the previous call to the `ListReports` method.
    # + startTimeAtOrAfter - If set, only reports whose start time is greater than or equal the specified date/time are returned.
    # + startTimeBefore - If set, only reports whose start time is smaller than the specified date/time are returned.
    # + return - Successful response
    remote isolated function listJobReports(string jobId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? createdAfter = (), string? onBehalfOfContentOwner = (), int? pageSize = (), string? pageToken = (), string? startTimeAtOrAfter = (), string? startTimeBefore = ()) returns ListReportsResponse|error {
        string  path = string `/v1/jobs/${jobId}/reports`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "createdAfter": createdAfter, "onBehalfOfContentOwner": onBehalfOfContentOwner, "pageSize": pageSize, "pageToken": pageToken, "startTimeAtOrAfter": startTimeAtOrAfter, "startTimeBefore": startTimeBefore};
        path = path + check getPathForQueryParam(queryParam);
        ListReportsResponse response = check self.clientEp-> get(path, targetType = ListReportsResponse);
        return response;
    }
    # Gets the metadata of a specific report.
    #
    # + jobId - The ID of the job.
    # + reportId - The ID of the report to retrieve.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + onBehalfOfContentOwner - The content owner's external ID on which behalf the user is acting on. If not set, the user is acting for himself (his own channel).
    # + return - Successful response
    remote isolated function getJobReports(string jobId, string reportId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? onBehalfOfContentOwner = ()) returns Report|error {
        string  path = string `/v1/jobs/${jobId}/reports/${reportId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "onBehalfOfContentOwner": onBehalfOfContentOwner};
        path = path + check getPathForQueryParam(queryParam);
        Report response = check self.clientEp-> get(path, targetType = Report);
        return response;
    }
    # Method for media download. Download is supported on the URI `/v1/media/{+name}?alt=media`.
    #
    # + resourceName - Name of the media that is being downloaded.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function downloadMedia(string resourceName, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns GdataMedia|error {
        string  path = string `/v1/media/${resourceName}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        GdataMedia response = check self.clientEp-> get(path, targetType = GdataMedia);
        return response;
    }
    # Lists report types.
    #
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + includeSystemManaged - If set to true, also system-managed report types will be returned; otherwise only the report types that can be used to create new reporting jobs will be returned.
    # + onBehalfOfContentOwner - The content owner's external ID on which behalf the user is acting on. If not set, the user is acting for himself (his own channel).
    # + pageSize - Requested page size. Server may return fewer report types than requested. If unspecified, server will pick an appropriate default.
    # + pageToken - A token identifying a page of results the server should return. Typically, this is the value of ListReportTypesResponse.next_page_token returned in response to the previous call to the `ListReportTypes` method.
    # + return - Successful response
    remote isolated function listReportTypes(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? includeSystemManaged = (), string? onBehalfOfContentOwner = (), int? pageSize = (), string? pageToken = ()) returns ListReportTypesResponse|error {
        string  path = string `/v1/reportTypes`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "includeSystemManaged": includeSystemManaged, "onBehalfOfContentOwner": onBehalfOfContentOwner, "pageSize": pageSize, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListReportTypesResponse response = check self.clientEp-> get(path, targetType = ListReportTypesResponse);
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
