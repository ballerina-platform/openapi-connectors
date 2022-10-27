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

# This is a generated connector for [Bitbucket API v2.0](https://developer.atlassian.com/bitbucket/api/2/reference/) OpenAPI Specification.
# Code against the Bitbucket API to automate simple tasks, embed Bitbucket data into your own site, build mobile or desktop apps,  or even add custom UI add-ons into Bitbucket itself using the Connect framework.
@display {label: "Bitbucket", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Bitbucket account](https://bitbucket.org/product/) and obtain tokens following  [this guide](https://developer.atlassian.com/bitbucket/api/2/reference/meta/authentication).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.bitbucket.org/2.0") returns error? {
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
    # Returns a list of all repositories
    #
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for example: `{workspace UUID}`. 
    # + role - Filters the result based on the authenticated user's role on each repository. member-returns repositories to which the user has explicit read access. contributor- returns repositories to which the user has explicit write access. admin- returns repositories to which the user has explicit administrator access. owner-returns all repositories owned by the current user 
    # + q - Query string to narrow down the response as https://developer.atlassian.com/bitbucket/api/2/reference/meta/filtering 
    # + sort - Field by which the results should be sorted as https://developer.atlassian.com/bitbucket/api/2/reference/meta/filtering 
    # + return - The repositories owned by the specified account. 
    remote isolated function listWorkspaces(string workspace, string? role = (), string? q = (), string? sort = ()) returns PaginatedRepositories|error {
        string resourcePath = string `/repositories/${getEncodedUri(workspace)}`;
        map<anydata> queryParam = {"role": role, "q": q, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PaginatedRepositories response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns all pull requests
    #
    # + repoSlug - This can either be the repository slug or the UUID of the repository, surrounded by curly-braces, for example: `{repository UUID}`. 
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for example: `{workspace UUID}`. 
    # + state - Only return pull requests that are in this state. This parameter can be repeated. 
    # + return - All pull requests on the specified repository. 
    remote isolated function listPullrequets(string repoSlug, string workspace, string? state = ()) returns PaginatedPullrequests|error {
        string resourcePath = string `/repositories/${getEncodedUri(workspace)}/${getEncodedUri(repoSlug)}/pullrequests`;
        map<anydata> queryParam = {"state": state};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PaginatedPullrequests response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the specified pull request
    #
    # + pullRequestId - The id of the pull request 
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for example: `{repository UUID}` 
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for example: `{workspace UUID}` 
    # + return - The pull request object 
    remote isolated function getPullRequestByID(int pullRequestId, string repoSlug, string workspace) returns Pullrequest|error {
        string resourcePath = string `/repositories/${getEncodedUri(workspace)}/${getEncodedUri(repoSlug)}/pullrequests/${getEncodedUri(pullRequestId)}`;
        Pullrequest response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the object describing this repository
    #
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for example: {repository UUID} 
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for example: {workspace UUID} 
    # + return - The repository object 
    remote isolated function getRepositoryDetail(string repoSlug, string workspace) returns Repository|error {
        string resourcePath = string `/repositories/${getEncodedUri(workspace)}/${getEncodedUri(repoSlug)}`;
        Repository response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new repository
    #
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for example: `{repository UUID}` 
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for example: `{workspace UUID}` 
    # + payload - The repository that is to be created. Note that most object elements are optional. Elements "owner" and "full_name" are ignored as the URL implies them 
    # + return - The newly created repository. 
    remote isolated function createNewRepository(string repoSlug, string workspace, Repository payload) returns Repository|error {
        string resourcePath = string `/repositories/${getEncodedUri(workspace)}/${getEncodedUri(repoSlug)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Repository response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Deletes the repository
    #
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for example: `{repository UUID}` 
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for example: `{workspace UUID}` 
    # + return - Indicates successful deletion 
    remote isolated function deleteRepository(string repoSlug, string workspace) returns http:Response|error {
        string resourcePath = string `/repositories/${getEncodedUri(workspace)}/${getEncodedUri(repoSlug)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns the specified issue
    #
    # + issueId - The issue id 
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for example: `{repository UUID}` 
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for example: `{workspace UUID}` 
    # + return - The issue object 
    remote isolated function getIssueByID(string issueId, string repoSlug, string workspace) returns Issue|error {
        string resourcePath = string `/repositories/${getEncodedUri(workspace)}/${getEncodedUri(repoSlug)}/issues/${getEncodedUri(issueId)}`;
        Issue response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes the specified issue
    #
    # + issueId - The issue id 
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for example: `{repository UUID}` 
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for example: `{workspace UUID}` 
    # + return - The issue object 
    remote isolated function deleteIssue(string issueId, string repoSlug, string workspace) returns http:Response|error {
        string resourcePath = string `/repositories/${getEncodedUri(workspace)}/${getEncodedUri(repoSlug)}/issues/${getEncodedUri(issueId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns the issues in the issue tracker
    #
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for example: `{repository UUID}` 
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for example: `{workspace UUID}` 
    # + q - Query string to narrow down the response as  https://developer.atlassian.com/bitbucket/api/2/reference/meta/filtering 
    # + sort - Field by which the results should be sorted as https://developer.atlassian.com/bitbucket/api/2/reference/meta/filtering 
    # + return - A paginated list of the issues matching any filter criteria that were provided 
    remote isolated function listIssues(string repoSlug, string workspace, string? q = (), string? sort = ()) returns PaginatedIssues|error {
        string resourcePath = string `/repositories/${getEncodedUri(workspace)}/${getEncodedUri(repoSlug)}/issues`;
        map<anydata> queryParam = {"q": q, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PaginatedIssues response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new issue
    #
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for example: `{repository UUID}` 
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for example: `{workspace UUID}` 
    # + payload - The new issue. The only required element is `title`. All other elements can be omitted from the body 
    # + return - The newly created issue 
    remote isolated function createIssue(string repoSlug, string workspace, Issue payload) returns Issue|error {
        string resourcePath = string `/repositories/${getEncodedUri(workspace)}/${getEncodedUri(repoSlug)}/issues`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Issue response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of all comments on an issue
    #
    # + issueId - The issue id 
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for example: `{repository UUID}` 
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for example: `{workspace UUID}` 
    # + return - A paginated list of issue comments 
    remote isolated function listComments(string issueId, string repoSlug, string workspace) returns PaginatedIssueComments|error {
        string resourcePath = string `/repositories/${getEncodedUri(workspace)}/${getEncodedUri(repoSlug)}/issues/${getEncodedUri(issueId)}/comments`;
        PaginatedIssueComments response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new issue comment
    #
    # + issueId - The issue id 
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for example: `{repository UUID}` 
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for example: `{workspace UUID}` 
    # + payload - The new issue comment object 
    # + return - The newly created comment 
    remote isolated function createNewIssueComment(string issueId, string repoSlug, string workspace, IssueComment payload) returns http:Response|error {
        string resourcePath = string `/repositories/${getEncodedUri(workspace)}/${getEncodedUri(repoSlug)}/issues/${getEncodedUri(issueId)}/comments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the specified issue comment object
    #
    # + commentId - The id of the comment 
    # + issueId - The issue id 
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for example: `{repository UUID}` 
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for example: `{workspace UUID}` 
    # + return - The issue comment 
    remote isolated function getCommentByID(int commentId, string issueId, string repoSlug, string workspace) returns IssueComment|error {
        string resourcePath = string `/repositories/${getEncodedUri(workspace)}/${getEncodedUri(repoSlug)}/issues/${getEncodedUri(issueId)}/comments/${getEncodedUri(commentId)}`;
        IssueComment response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates the content of the specified issue comment
    #
    # + commentId - The id of the comment 
    # + issueId - The issue id 
    # + repoSlug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for example: `{repository UUID}` 
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for example: `{workspace UUID}` 
    # + payload - The updated comment 
    # + return - The updated issue comment 
    remote isolated function updateComment(int commentId, string issueId, string repoSlug, string workspace, IssueComment payload) returns IssueComment|error {
        string resourcePath = string `/repositories/${getEncodedUri(workspace)}/${getEncodedUri(repoSlug)}/issues/${getEncodedUri(issueId)}/comments/${getEncodedUri(commentId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IssueComment response = check self.clientEp->put(resourcePath, request);
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
        string resourcePath = string `/repositories/${getEncodedUri(workspace)}/${getEncodedUri(repoSlug)}/issues/${getEncodedUri(issueId)}/comments/${getEncodedUri(commentId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns the requested workspace
    #
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID 
    # + return - The workspace. 
    remote isolated function getWorkSpaceByID(string workspace) returns Workspace|error {
        string resourcePath = string `/workspaces/${getEncodedUri(workspace)}`;
        Workspace response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the requested project
    #
    # + projectKey - The project in question. This is the actual `key` assigned to the project 
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID 
    # + return - The project that is part of a workspace 
    remote isolated function getProjectByProjectKey(string projectKey, string workspace) returns Project|error {
        string resourcePath = string `/workspaces/${getEncodedUri(workspace)}/projects/${getEncodedUri(projectKey)}`;
        Project response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates or Updates a project
    #
    # + projectKey - The project in question. This is the actual `key` assigned to the project. 
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID 
    # + payload - The project object 
    # + return - The existing project is has been updated 
    remote isolated function createOrUpdateProject(string projectKey, string workspace, Project payload) returns Project|error {
        string resourcePath = string `/workspaces/${getEncodedUri(workspace)}/projects/${getEncodedUri(projectKey)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Project response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes a project.
    #
    # + projectKey - The project in question. This is the actual `key` assigned to the project. 
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for example: `{workspace UUID}` 
    # + return - Successful deletion. 
    remote isolated function deleteProject(string projectKey, string workspace) returns http:Response|error {
        string resourcePath = string `/workspaces/${getEncodedUri(workspace)}/projects/${getEncodedUri(projectKey)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
}
