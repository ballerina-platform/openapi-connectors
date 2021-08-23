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

import ballerina/http;
import ballerina/url;
import ballerina/lang.'string;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig auth;
    # The HTTP version understood by the client
    string httpVersion = "1.1";
    # Configurations related to HTTP/1.x protocol
    http:ClientHttp1Settings http1Settings = {};
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings = {};
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with Redirection
    http:FollowRedirects? followRedirects = ();
    # Configurations associated with request pooling
    http:PoolConfiguration? poolConfig = ();
    # HTTP caching related configurations
    http:CacheConfig cache = {};
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig? circuitBreaker = ();
    # Configurations associated with retrying
    http:RetryConfig? retryConfig = ();
    # Configurations associated with cookies
    http:CookieConfig? cookieConfig = ();
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits = {};
    # SSL/TLS-related options
    http:ClientSecureSocket? secureSocket = ();
|};

# This is a generated connector for [Bitbucket API v2.0](https://developer.atlassian.com/bitbucket/api/2/reference/) OpenAPI Specification.
# Code against the Bitbucket API to automate simple tasks, embed Bitbucket data into your own site, build mobile or desktop apps,  
# or even add custom UI add-ons into Bitbucket itself using the Connect framework.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Bitbucket account](https://bitbucket.org/product/) and obtain tokens following  
    # [this guide](https://developer.atlassian.com/bitbucket/api/2/reference/meta/authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.bitbucket.org/2.0") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Returns a list of all repositories
    #
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + role - Filters the result based on the authenticated user's role on each repository. member-returns repositories 
    # to which the user has explicit read access. contributor- returns repositories to which the user has explicit write access. 
    # admin- returns repositories to which the user has explicit administrator access. owner-returns all repositories owned 
    # by the current user
    # + q - Query string to narrow down the response as https://developer.atlassian.com/bitbucket/api/2/reference/meta/filtering
    # + sort - Field by which the results should be sorted as https://developer.atlassian.com/bitbucket/api/2/reference/meta/filtering
    # + return - The repositories owned by the specified account.
    remote isolated function listWorkspaces(string workspace, string? role = (), string? q = (), string? sort = ()) returns 
                                            PaginatedRepositories|error {
        string  path = string `/repositories/${workspace}`;
        map<anydata> queryParam = {"role": role, "q": q, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        PaginatedRepositories response = check self.clientEp-> get(path, targetType = PaginatedRepositories);
        return response;
    }
    # Returns all pull requests
    #
    # + repoSlug - This can either be the repository slug or the UUID of the repository,
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + state - Only return pull requests that are in this state. This parameter can be repeated.
    # + return - All pull requests on the specified repository.
    remote isolated function listPullrequets(string repoSlug, string workspace, string? state = ()) returns PaginatedPullrequests|error {
        string  path = string `/repositories/${workspace}/${repoSlug}/pullrequests`;
        map<anydata> queryParam = {"state": state};
        path = path + check getPathForQueryParam(queryParam);
        PaginatedPullrequests response = check self.clientEp-> get(path, targetType = PaginatedPullrequests);
        return response;
    }
    # Returns the specified pull request
    #
    # + pullRequestId - The id of the pull request
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for 
    # example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: `{workspace UUID}`
    # + return - The pull request object
    remote isolated function getPullRequestByID(int pullRequestId, string repoSlug, string workspace) returns Pullrequest|error {
        string  path = string `/repositories/${workspace}/${repoSlug}/pullrequests/${pullRequestId}`;
        Pullrequest response = check self.clientEp-> get(path, targetType = Pullrequest);
        return response;
    }
    # Returns the object describing this repository
    #
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for 
    # example: {repository UUID}
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: {workspace UUID}
    # + return - The repository object
    remote isolated function getRepositoryDetail(string repoSlug, string workspace) returns Repository|error {
        string  path = string `/repositories/${workspace}/${repoSlug}`;
        Repository response = check self.clientEp-> get(path, targetType = Repository);
        return response;
    }
    # Creates a new repository
    #
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for 
    # example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: `{workspace UUID}`
    # + payload - The repository that is to be created. Note that most object elements are optional. Elements "owner" 
    # and "full_name" are ignored as the URL implies them
    # + return - The newly created repository.
    remote isolated function createNewRepository(string repoSlug, string workspace, Repository payload) returns Repository|error {
        string  path = string `/repositories/${workspace}/${repoSlug}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Repository response = check self.clientEp->post(path, request, targetType=Repository);
        return response;
    }
    # Deletes the repository
    #
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for 
    # example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: `{workspace UUID}`
    # + return - Indicates successful deletion
    remote isolated function deleteRepository(string repoSlug, string workspace) returns http:Response|error {
        string  path = string `/repositories/${workspace}/${repoSlug}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Returns the specified issue
    #
    # + issueId - The issue id
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for 
    # example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: `{workspace UUID}`
    # + return - The issue object
    remote isolated function getIssueByID(string issueId, string repoSlug, string workspace) returns Issue|error {
        string  path = string `/repositories/${workspace}/${repoSlug}/issues/${issueId}`;
        Issue response = check self.clientEp-> get(path, targetType = Issue);
        return response;
    }
    # Deletes the specified issue
    #
    # + issueId - The issue id
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for 
    # example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: `{workspace UUID}`
    # + return - The issue object
    remote isolated function deleteIssue(string issueId, string repoSlug, string workspace) returns http:Response|error {
        string  path = string `/repositories/${workspace}/${repoSlug}/issues/${issueId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Returns the issues in the issue tracker
    #
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for 
    # example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: `{workspace UUID}`
    # + q - Query string to narrow down the response as  https://developer.atlassian.com/bitbucket/api/2/reference/meta/filtering
    # + sort - Field by which the results should be sorted as https://developer.atlassian.com/bitbucket/api/2/reference/meta/filtering
    # + return - A paginated list of the issues matching any filter criteria that were provided
    remote isolated function listIssues(string repoSlug, string workspace, string? q = (), string? sort = ()) returns PaginatedIssues|error {
        string  path = string `/repositories/${workspace}/${repoSlug}/issues`;
        map<anydata> queryParam = {"q": q, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        PaginatedIssues response = check self.clientEp-> get(path, targetType = PaginatedIssues);
        return response;
    }
    # Creates a new issue
    #
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for 
    # example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: `{workspace UUID}`
    # + payload - The new issue. The only required element is `title`. All other elements can be omitted from the body
    # + return - The newly created issue
    remote isolated function createIssue(string repoSlug, string workspace, Issue payload) returns Issue|error {
        string  path = string `/repositories/${workspace}/${repoSlug}/issues`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Issue response = check self.clientEp->post(path, request, targetType=Issue);
        return response;
    }
    # Returns a list of all comments on an issue
    #
    # + issueId - The issue id
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for 
    # example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: `{workspace UUID}`
    # + return - A paginated list of issue comments
    remote isolated function listComments(string issueId, string repoSlug, string workspace) returns PaginatedIssueComments|error {
        string  path = string `/repositories/${workspace}/${repoSlug}/issues/${issueId}/comments`;
        PaginatedIssueComments response = check self.clientEp-> get(path, targetType = PaginatedIssueComments);
        return response;
    }
    # Creates a new issue comment
    #
    # + issueId - The issue id
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for 
    # example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: `{workspace UUID}`
    # + payload - The new issue comment object
    # + return - The newly created comment
    remote isolated function createNewIssueComment(string issueId, string repoSlug, string workspace, IssueComment payload) returns http:Response|error {
        string  path = string `/repositories/${workspace}/${repoSlug}/issues/${issueId}/comments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Returns the specified issue comment object
    #
    # + commentId - The id of the comment
    # + issueId - The issue id
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for 
    # example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: `{workspace UUID}`
    # + return - The issue comment
    remote isolated function getCommentByID(int commentId, string issueId, string repoSlug, string workspace) returns IssueComment|error {
        string  path = string `/repositories/${workspace}/${repoSlug}/issues/${issueId}/comments/${commentId}`;
        IssueComment response = check self.clientEp-> get(path, targetType = IssueComment);
        return response;
    }
    # Updates the content of the specified issue comment
    #
    # + commentId - The id of the comment
    # + issueId - The issue id
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, 
    # for example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, 
    # for example: `{workspace UUID}`
    # + payload - The updated comment
    # + return - The updated issue comment
    remote isolated function updateComment(int commentId, string issueId, string repoSlug, string workspace, IssueComment payload) returns IssueComment|error {
        string  path = string `/repositories/${workspace}/${repoSlug}/issues/${issueId}/comments/${commentId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IssueComment response = check self.clientEp->put(path, request, targetType=IssueComment);
        return response;
    }
    # Deletes the specified comment
    #
    # + commentId - The id of the comment
    # + issueId - The issue id
    # + repoSlug - This can either be the repository slug or the UUID of the repository
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + return - Indicates successful deletion
    remote isolated function deleteComment(int commentId, string issueId, string repoSlug, string workspace) returns http:Response|error {
        string  path = string `/repositories/${workspace}/${repoSlug}/issues/${issueId}/comments/${commentId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Returns the requested workspace
    #
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + return - The workspace.
    remote isolated function getWorkSpaceByID(string workspace) returns Workspace|error {
        string  path = string `/workspaces/${workspace}`;
        Workspace response = check self.clientEp-> get(path, targetType = Workspace);
        return response;
    }
    # Returns the requested project
    #
    # + projectKey - The project in question. This is the actual `key` assigned to the project
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + return - The project that is part of a workspace
    remote isolated function getProjectByProjectKey(string projectKey, string workspace) returns Project|error {
        string  path = string `/workspaces/${workspace}/projects/${projectKey}`;
        Project response = check self.clientEp-> get(path, targetType = Project);
        return response;
    }
    # Creates or Updates a project
    #
    # + projectKey - The project in question. This is the actual `key` assigned to the project.
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + payload - The project object
    # + return - The existing project is has been updated
    remote isolated function createOrUpdateProject(string projectKey, string workspace, Project payload) returns Project|error {
        string  path = string `/workspaces/${workspace}/projects/${projectKey}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Project response = check self.clientEp->put(path, request, targetType=Project);
        return response;
    }
    # Deletes a project.
    #
    # + projectKey - The project in question. This is the actual `key` assigned
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: `{workspace UUID}`
    # + return - Successful deletion.
    remote isolated function deleteProject(string projectKey, string workspace) returns http:Response|error {
        string  path = string `/workspaces/${workspace}/projects/${projectKey}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
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
