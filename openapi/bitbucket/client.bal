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

# Configuration for Bitbucket connector
#
# + authConfig - BearerTokenConfig or OAuth2 Refresh Token Grant Configuration
# + secureSocketConfig - SSL connection configuration
@display {label: "Connection Config"}  
public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# Connector endpoint for Bitbucket API
#
# + clientEp - Connector http endpoint
@display {label: "Bitbucket Client"}
public client class Client {
    http:Client clientEp;
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.bitbucket.org/2.0") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Returns the specified pull request
    #
    # + pull_request_id - The id of the pull request
    # + repo_slug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, 
    # for example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, 
    # for example: `{workspace UUID}`
    # + return - The pull request object
    @display {label: "Get Pull Request"}
    remote isolated function getPullRequestByID(@display {label: "Pull Request ID"} int pull_request_id, 
                                                @display {label: "Repository ID (slug) or UUID"} string repo_slug, 
                                                @display {label: "Workspace ID (slug) or UUID"} string workspace) 
                                                returns Pullrequest|error {
        string  path = string `/repositories/${workspace}/${repo_slug}/pullrequests/${pull_request_id}`;
        Pullrequest response = check self.clientEp-> get(path, targetType = Pullrequest);
        return response;
    }
    # Returns the object describing this repository
    #
    # + repo_slug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, 
    # for example: {repository UUID}
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, 
    # for example: {workspace UUID}
    # + return - The repository object
    @display {label: "Get Repository Detail"}
    remote isolated function getRepositoryDetail(@display {label: "Repository ID (slug) or UUID"} string repo_slug, 
                                                 @display {label: "Workspace ID (slug) or UUID"}string workspace) 
                                                 returns Repository|error {
        string  path = string `/repositories/${workspace}/${repo_slug}`;
        Repository response = check self.clientEp-> get(path, targetType = Repository);
        return response;
    }
    # Creates a new repository
    #
    # + repo_slug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, 
    # for example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, 
    # for example: `{workspace UUID}`
    # + payload - The repository that is to be created. Note that most object elements are optional. 
    # Elements "owner" and "full_name" are ignored as the URL implies them
    # + return - The newly created repository.
    @display {label: "Create New Repository"}
    remote isolated function createNewRepository(@display {label: "Repository ID (slug) or UUID"} string repo_slug, 
                                                 @display {label: "Workspace ID (slug) or UUID"} string workspace, 
                                                 @display {label: "Repository Detail"} Repository payload) returns 
                                                 Repository|error {
        string  path = string `/repositories/${workspace}/${repo_slug}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Repository response = check self.clientEp->post(path, request, targetType=Repository);
        return response;
    }
    # Deletes the repository
    #
    # + repo_slug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, 
    # for example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, 
    # for example: `{workspace UUID}`
    # + return - Indicates successful deletion
    @display {label: "Delete Repository"}
    remote isolated function deleteRepository(@display {label: "Repository ID (slug) or UUID"} string repo_slug, 
                                              @display {label: "Workspace ID (slug) or UUID"} string workspace) returns 
                                              error? {
        string  path = string `/repositories/${workspace}/${repo_slug}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Returns the specified issue
    #
    # + issue_id - The issue id
    # + repo_slug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for 
    # example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: `{workspace UUID}`
    # + return - The issue object
    @display {label: "Get Issue"}
    remote isolated function getIssueByID(@display {label: "Issue ID"} string issue_id, 
                                          @display {label: "Repository ID (slug) or UUID"} string repo_slug, 
                                          @display {label: "Workspace ID (slug) or UUID"} string workspace) returns 
                                          Issue|error {
        string  path = string `/repositories/${workspace}/${repo_slug}/issues/${issue_id}`;
        Issue response = check self.clientEp-> get(path, targetType = Issue);
        return response;
    }
    # Deletes the specified issue
    #
    # + issue_id - The issue id
    # + repo_slug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for 
    # example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: `{workspace UUID}`
    # + return - The issue object
    @display {label: "Delete Issue"}
    remote isolated function deleteIssue(@display {label: "Issue ID"} string issue_id, 
                                         @display {label: "Repository ID (slug) or UUID"} string repo_slug, 
                                         @display {label: "Workspace ID (slug) or UUID"} string workspace) returns error? 
                                          {
        string  path = string `/repositories/${workspace}/${repo_slug}/issues/${issue_id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Returns the issues in the issue tracker
    #
    # + repo_slug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for 
    # example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: `{workspace UUID}`
    # + return - A paginated list of the issues matching any filter criteria that were provided
    @display {label: "List Issues"}
    remote isolated function listIssues(@display {label: "Repository ID (slug) or UUID"} string repo_slug, 
                                        @display {label: "Workspace ID (slug) or UUID"} string workspace) returns 
                                        PaginatedIssues|error {
        string  path = string `/repositories/${workspace}/${repo_slug}/issues`;
        PaginatedIssues response = check self.clientEp-> get(path, targetType = PaginatedIssues);
        return response;
    }
    # Creates a new issue
    #
    # + repo_slug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for 
    # example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: `{workspace UUID}`
    # + payload - The new issue. The only required element is `title`. All other elements can be omitted from the body
    # + return - The newly created issue
    @display {label: "Create Issue"}
    remote isolated function createIssue(@display {label: "Repository ID (slug) or UUID"} string repo_slug, 
                                         @display {label: "Workspace ID (slug) or UUID"} string workspace, 
                                         @display {label: "Issue Detail"} Issue payload) returns Issue|error {
        string  path = string `/repositories/${workspace}/${repo_slug}/issues`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Issue response = check self.clientEp->post(path, request, targetType=Issue);
        return response;
    }
    # Returns a list of all comments on an issue
    #
    # + issue_id - The issue id
    # + repo_slug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for 
    # example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: `{workspace UUID}`
    # + return - A paginated list of issue comments
    @display {label: "List Comments"}
    remote isolated function listComments(@display {label: "Issue ID"} string issue_id, 
                                          @display {label: "Repository ID (slug) or UUID"} string repo_slug, 
                                          @display {label: "Workspace ID (slug) or UUID"} string workspace) returns 
                                          PaginatedIssueComments|error {
        string  path = string `/repositories/${workspace}/${repo_slug}/issues/${issue_id}/comments`;
        PaginatedIssueComments response = check self.clientEp-> get(path, targetType = PaginatedIssueComments);
        return response;
    }
    # Creates a new issue comment
    #
    # + issue_id - The issue id
    # + repo_slug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for 
    # example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: `{workspace UUID}`
    # + payload - The new issue comment object
    # + return - The newly created comment
    @display {label: "Create New Comment"}
    remote isolated function createNewIssueComment(@display {label: "Issue ID"} string issue_id, 
                                                   @display {label: "Repository ID (slug) or UUID"} string repo_slug, 
                                                   @display {label: "Workspace ID (slug) or UUID"} string workspace, 
                                                   @display {label: "Comment Details"} IssueComment payload) returns 
                                                   error? {
        string  path = string `/repositories/${workspace}/${repo_slug}/issues/${issue_id}/comments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
         _ = check self.clientEp-> post(path, request, targetType=http:Response);
    }
    # Returns the specified issue comment object
    #
    # + comment_id - The id of the comment
    # + issue_id - The issue id
    # + repo_slug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for 
    # example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: `{workspace UUID}`
    # + return - The issue comment
    @display {label: "Get Comment"}
    remote isolated function getCommentByID(@display {label: "Comment ID"} int comment_id, 
                                            @display {label: "Issue ID"} string issue_id,
                                            @display {label: "Repository ID (slug) or UUID"} string repo_slug, 
                                            @display {label: "Workspace ID (slug) or UUID"} string workspace) returns 
                                            IssueComment|error {
        string  path = string `/repositories/${workspace}/${repo_slug}/issues/${issue_id}/comments/${comment_id}`;
        IssueComment response = check self.clientEp-> get(path, targetType = IssueComment);
        return response;
    }
    # Updates the content of the specified issue comment
    #
    # + comment_id - The id of the comment
    # + issue_id - The issue id
    # + repo_slug - This can either be the repository slug or the UUID of the repository surrounded by curly-braces, for 
    # example: `{repository UUID}`
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: `{workspace UUID}`
    # + payload - The updated comment
    # + return - The updated issue comment
    @display {label: "Update Comment"}
    remote isolated function updateComment(@display {label: "Comment ID"} int comment_id, 
                                           @display {label: "Issue ID"} string issue_id, 
                                           @display {label: "Repository ID (slug) or UUID"} string repo_slug, 
                                           @display {label: "Workspace ID (slug) or UUID"} string workspace, 
                                           IssueComment payload) returns IssueComment|error {
        string  path = string `/repositories/${workspace}/${repo_slug}/issues/${issue_id}/comments/${comment_id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IssueComment response = check self.clientEp->put(path, request, targetType=IssueComment);
        return response;
    }
    # Deletes the specified comment
    #
    # + comment_id - The id of the comment
    # + issue_id - The issue id
    # + repo_slug - This can either be the repository slug or the UUID of the repository
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + return - Indicates successful deletion
    @display {label: "Delete Comment"}
    remote isolated function deleteComment(@display {label: "Comment ID"} int comment_id, 
                                           @display {label: "Issue ID"} string issue_id, 
                                           @display {label: "Repository ID (slug) or UUID"} string repo_slug, 
                                           @display {label: "Workspace ID (slug) or UUID"} string workspace) returns 
                                           error? {
        string  path = string `/repositories/${workspace}/${repo_slug}/issues/${issue_id}/comments/${comment_id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Returns the requested workspace
    #
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + return - The workspace.
    @display {label: "Get Workspace"}
    remote isolated function getWorkSpaceByID(@display {label: "Workspace ID (slug) or UUID"} string workspace) returns
                                              Workspace|error {
        string  path = string `/workspaces/${workspace}`;
        Workspace response = check self.clientEp-> get(path, targetType = Workspace);
        return response;
    }
    # Returns the requested project
    #
    # + project_key - The project in question. This is the actual `key` assigned to the project
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + return - The project that is part of a workspace
    @display {label: "Get Project"}
    remote isolated function getProjectByProjectKey(@display {label: "Project Key"} string project_key, 
                                                    @display {label: "Workspace ID (slug) or UUID"} string workspace) 
                                                    returns Project|error {
        string  path = string `/workspaces/${workspace}/projects/${project_key}`;
        Project response = check self.clientEp-> get(path, targetType = Project);
        return response;
    }
    # Creates or Updates a project
    #
    # + project_key - The project in question. This is the actual `key` assigned to the project.
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID
    # + payload - The project object
    # + return - The existing project is has been updated
    @display {label: "Create Or Update Project"}
    remote isolated function createOrUpdateProject(@display {label: "Project Key"} string project_key, 
                                                   @display {label: "Workspace ID (slug) or UUID"} string workspace, 
                                                   @display {label: "Project Detail"} Project payload) returns Project
                                                   |error {
        string  path = string `/workspaces/${workspace}/projects/${project_key}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Project response = check self.clientEp->put(path, request, targetType=Project);
        return response;
    }
    # Deletes a project.
    #
    # + project_key - The project in question. This is the actual `key` assigned
    # + workspace - This can either be the workspace ID (slug) or the workspace UUID surrounded by curly-braces, for 
    # example: `{workspace UUID}`
    # + return - Successful deletion.
    @display {label: "Delete Project"}
    remote isolated function deleteProject(@display {label: "Project Key"} string project_key, 
                                           @display {label: "Workspace ID (slug) or UUID"} string workspace) returns 
                                           error? {
        string  path = string `/workspaces/${workspace}/projects/${project_key}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
}
