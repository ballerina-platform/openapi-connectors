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

# GitLab version info
public type VersionResponse record {
    # GitLab version
    string 'version?;
    # Revision number
    string revision?;
};

# Access request info
public type GroupAccessRequest record {
    # The ID or URL-encoded path of the project owned by the authenticated user
    int id?;
    # Username
    string username?;
    # Actual name
    string name?;
    # If user is active or not
    string state?;
    # Created date/time
    string created_at?;
    # Requested date/time
    string requested_at?;
};

# Access token info
public type AccessTokenList record {
    # User ID
    int user_id?;
    # The name of the project access token
    string name?;
    # The token expires at midnight UTC on that date
    string expires_at?;
    # The ID or URL-encoded path of the project
    int id?;
    # If token is active or not
    boolean active?;
    # The token creation date/time
    string created_at?;
    # Is the token is revoked
    boolean revoked?;
};

# Access request info
public type ProjectAccessResponse record {
    # The ID or URL-encoded path of the project owned by the authenticated user
    int id?;
    # Username
    string username?;
    # Actual name
    string name?;
    # If user is active or not
    string state?;
    # Created date/time
    string created_at?;
    # Requested date/time
    string requested_at?;
};

# Access request info
public type ProjectAccessApprove record {
    # The ID or URL-encoded path of the project owned by the authenticated user
    int id?;
    # Username
    string username?;
    # Actual name
    string name?;
    # If user is active or not
    string state?;
    # Created date/time
    string created_at?;
    # A valid access level (defaults: 30, the Developer role)
    int access_level?;
};

# Access request info
public type GroupAccessResponse record {
    # The ID or URL-encoded path of the project owned by the authenticated user
    int id?;
    # Username
    string username?;
    # Actual name
    string name?;
    # If user is active or not
    string state?;
    # Created date/time
    string created_at?;
    # Requested date/time
    string requested_at?;
};

# Access token info
public type Accesstokenlist1 record {
    # User ID
    anydata user_id?;
    # The name of the project access token
    string name?;
    # The token expires at midnight UTC on that date
    string expires_at?;
    # The ID or URL-encoded path of the project
    int id?;
    # If token is active or not
    boolean active?;
    # The token creation date/time
    string created_at?;
    # Is the token is revoked
    boolean revoked?;
};

# Access request info
public type ProjectAccessRequest record {
    # The ID or URL-encoded path of the project owned by the authenticated use
    int id?;
    # Username
    string username?;
    # Actual name
    string name?;
    # If user is active or not
    string state?;
    # Created date/time
    string created_at?;
    # Requested date/time
    string requested_at?;
};

# Access request info
public type GroupAccessApprove record {
    # The ID or URL-encoded path of the project owned by the authenticated use
    int id?;
    # Username
    string username?;
    # Actual name
    string name?;
    # If user is active or not
    string state?;
    # Created date/time
    string created_at?;
    # A valid access level (defaults: 30, the Developer role)
    int access_level?;
};

