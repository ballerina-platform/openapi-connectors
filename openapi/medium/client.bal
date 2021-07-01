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

# Configuration record for Medium
#
# + authConfig - Bearer Token or OAuth2 Refresh Token Grant Configuration Tokens
# + secureSocketConfig - Secure Socket Configuration 
public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# Client endpoint for Medium API
#
# + clientEp - Client for Medium API
public client class Client {
    http:Client clientEp;
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.medium.com/v1") returns 
                                  error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Get the authenticated user’s details
    #
    # + return - If success returns details of the user who has granted permission to the application otherwise the 
    # relevant error
    @display {label: "Get User Detail"}
    remote isolated function getUserDetail() returns UserResponse|error {
        string  path = string `/me`;
        UserResponse response = check self.clientEp-> get(path, targetType = UserResponse);
        return response;
    }
    # List the user’s publications
    #
    # + userId - A unique identifier for the user.
    # + return - If success returns a list of publications that the user is subscribed to, writes to, or edits otherwise 
    # the relevant error
    @display {label: "Get Publication List"}
    remote isolated function getPublicationList(@display {label: "User ID"} string userId) returns PublicationResponse|
                                                error {
        string  path = string `/users/${userId}/publications`;
        PublicationResponse response = check self.clientEp-> get(path, targetType = PublicationResponse);
        return response;
    }
    # List contributors for a given publication
    #
    # + publicationId - A unique identifier for the publication.
    # + return - If success returns a list of contributors
    @display {label: "Get Contributor List"}
    remote isolated function getContributorList(@display {label: "Publication ID"} string publicationId) returns 
                                                ContributorResponse|error {
        string  path = string `/publications/${publicationId}/contributors`;
        ContributorResponse response = check self.clientEp-> get(path, targetType = ContributorResponse);
        return response;
    }
    # Creates a post on the authenticated user’s profile
    #
    # + authorId - authorId is the user id of the authenticated user.
    # + payload - Creates a post for user.
    # + return - If success returns a Post record that includes the newly created post detail otherwise the relevant
    #  error
    @display {label: "Create Post"}
    remote isolated function createUserPost(@display {label: "User ID"} string authorId, 
                                            @display {label: "Post Detail"} Post payload) returns 
                                            PostResponse|error {
        string  path = string `/users/${authorId}/posts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PostResponse response = check self.clientEp->post(path, request, targetType=PostResponse);
        return response;
    }
}
