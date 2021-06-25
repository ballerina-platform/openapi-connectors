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

public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# Code against the Bitbucket API to automate simple tasks, embed Bitbucket data into your own site, build mobile or 
# desktop apps, or even add custom UI add-ons into Bitbucket itself using the Connect framework.
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.bitbucket.org/2.0") 
                                  returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    #
    # + pull_request_id - The id of the pull request.
    # + repo_slug - This can either be the repository slug or the UUID of the repository,
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + return - The pull request object
    remote isolated function getPullRequestByID(int pull_request_id, string repo_slug, string workspace) returns 
                                                Pullrequest|error {
        string  path = string `/repositories/${workspace}/${repo_slug}/pullrequests/${pull_request_id}`;
        Pullrequest response = check self.clientEp-> get(path, targetType = Pullrequest);
        return response;
    }
    #
    # + repo_slug - This can either be the repository slug or the UUID of the repository,
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + return - The repository object.
    remote isolated function getRepositoryDetail(string repo_slug, string workspace) returns Repository|error {
        string  path = string `/repositories/${workspace}/${repo_slug}`;
        Repository response = check self.clientEp-> get(path, targetType = Repository);
        return response;
    }
    #
    # + repo_slug - This can either be the repository slug or the UUID of the repository,
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + payload - The repository that is to be created. Note that most object elements are optional. Elements "owner" 
    # and "full_name" are ignored as the URL implies them.
    # + return - The newly created repository.
    remote isolated function createNewRepository(string repo_slug, string workspace, Repository payload) returns Repository|error {
        string  path = string `/repositories/${workspace}/${repo_slug}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Repository response = check self.clientEp->post(path, request, targetType=Repository);
        return response;
    }
    #
    # + repo_slug - This can either be the repository slug or the UUID of the repository,
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + return - Indicates successful deletion.
    remote isolated function deleteRepository(string repo_slug, string workspace) returns error? {
        string  path = string `/repositories/${workspace}/${repo_slug}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    #
    # + issue_id - The issue id
    # + repo_slug - This can either be the repository slug or the UUID of the repository,
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + return - The issue object.
    remote isolated function getIssueByID(string issue_id, string repo_slug, string workspace) returns Issue|error {
        string  path = string `/repositories/${workspace}/${repo_slug}/issues/${issue_id}`;
        Issue response = check self.clientEp-> get(path, targetType = Issue);
        return response;
    }
    #
    # + issue_id - The issue id
    # + repo_slug - This can either be the repository slug or the UUID of the repository,
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + return - The issue object.
    remote isolated function deleteIssue(string issue_id, string repo_slug, string workspace) returns error? {
        string  path = string `/repositories/${workspace}/${repo_slug}/issues/${issue_id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    #
    # + repo_slug - This can either be the repository slug or the UUID of the repository,
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + return - A paginated list of the issues matching any filter criteria that were provided.
    remote isolated function listIssues(string repo_slug, string workspace) returns PaginatedIssues|error {
        string  path = string `/repositories/${workspace}/${repo_slug}/issues`;
        PaginatedIssues response = check self.clientEp-> get(path, targetType = PaginatedIssues);
        return response;
    }
    #
    # + repo_slug - This can either be the repository slug or the UUID of the repository,
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + payload - The new issue. The only required element is `title`. All other elements can be omitted from the body.
    # + return - The newly created issue.
    remote isolated function createIssue(string repo_slug, string workspace, Issue payload) returns Issue|error {
        string  path = string `/repositories/${workspace}/${repo_slug}/issues`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Issue response = check self.clientEp->post(path, request, targetType=Issue);
        return response;
    }
    #
    # + issue_id - The issue id
    # + repo_slug - This can either be the repository slug or the UUID of the repository,
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + return - A paginated list of issue comments.
    remote isolated function listComments(string issue_id, string repo_slug, string workspace) returns 
                                          PaginatedIssueComments|error {
        string  path = string `/repositories/${workspace}/${repo_slug}/issues/${issue_id}/comments`;
        PaginatedIssueComments response = check self.clientEp-> get(path, targetType = PaginatedIssueComments);
        return response;
    }
    #
    # + issue_id - The issue id
    # + repo_slug - This can either be the repository slug or the UUID of the repository,
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + payload - The new issue comment object.
    # + return - The newly created comment.
    remote isolated function createNewIssueComment(string issue_id, string repo_slug, string workspace, 
                                                  IssueComment payload) returns error? {
        string  path = string `/repositories/${workspace}/${repo_slug}/issues/${issue_id}/comments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
         _ = check self.clientEp-> post(path, request, targetType=http:Response);
    }
    #
    # + comment_id - The id of the comment.
    # + issue_id - The issue id
    # + repo_slug - This can either be the repository slug or the UUID of the repository,
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + return - The issue comment.
    remote isolated function getCommentByID(int comment_id, string issue_id, string repo_slug, string workspace) returns 
                                            IssueComment|error {
        string  path = string `/repositories/${workspace}/${repo_slug}/issues/${issue_id}/comments/${comment_id}`;
        IssueComment response = check self.clientEp-> get(path, targetType = IssueComment);
        return response;
    }
    #
    # + comment_id - The id of the comment.
    # + issue_id - The issue id
    # + repo_slug - This can either be the repository slug or the UUID of the repository,
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + payload - The updated comment.
    # + return - The updated issue comment.
    remote isolated function updateComment(int comment_id, string issue_id, string repo_slug, string workspace, 
                                           IssueComment payload) returns IssueComment|error {
        string  path = string `/repositories/${workspace}/${repo_slug}/issues/${issue_id}/comments/${comment_id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IssueComment response = check self.clientEp->put(path, request, targetType=IssueComment);
        return response;
    }
    #
    # + comment_id - The id of the comment.
    # + issue_id - The issue id
    # + repo_slug - This can either be the repository slug or the UUID of the repository,
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + return - Indicates successful deletion.
    remote isolated function deleteComment(int comment_id, string issue_id, string repo_slug, string workspace) returns 
                                           error? {
        string  path = string `/repositories/${workspace}/${repo_slug}/issues/${issue_id}/comments/${comment_id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    #
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + return - The workspace.
    remote isolated function getWorkSpaceByID(string workspace) returns Workspace|error {
        string  path = string `/workspaces/${workspace}`;
        Workspace response = check self.clientEp-> get(path, targetType = Workspace);
        return response;
    }
    #
    # + project_key - The project in question. This is the actual `key` assigned
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + return - The project that is part of a workspace.
    remote isolated function getProjectByProjectKey(string project_key, string workspace) returns Project|error {
        string  path = string `/workspaces/${workspace}/projects/${project_key}`;
        Project response = check self.clientEp-> get(path, targetType = Project);
        return response;
    }
    #
    # + project_key - The project in question. This is the actual `key` assigned
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + payload - The project object
    # + return - The existing project is has been updated.
    remote isolated function createOrUpdateProject(string project_key, string workspace, Project payload) returns 
                                                   Project|error {
        string  path = string `/workspaces/${workspace}/projects/${project_key}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Project response = check self.clientEp->put(path, request, targetType=Project);
        return response;
    }
    #
    # + project_key - The project in question. This is the actual `key` assigned
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + return - Successful deletion.
    remote isolated function deleteProject(string project_key, string workspace) returns error? {
        string  path = string `/workspaces/${workspace}/projects/${project_key}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
}
