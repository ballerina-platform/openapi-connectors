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

public type AvatarIconDTO record {
    string 'type?;
    string value?;
};

public type UserResponseDTO record {
    int id?;
    string message?;
    string timestamp?;
};

public type UserNameDTO record {
    string firstName?;
    string lastName?;
};

public type UserProfileDTO record {
    AvatarIconDTO avatarIcon?;
    string creationTime?;
    string dateFormat?;
    string email?;
    string externalUserId?;
    boolean familyNameFirst?;
    int id?;
    string language?;
    string phone?;
    int pictureId?;
    string role?;
    string s4ExternalUserId?;
    string status?;
    int tenantId?;
    string timeFormat?;
    string timeZone?;
    UserNameDTO userName?;
    int userUpdateState?;
};

public type ResponseForbiddenMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type ResponseUnauthorizedMessage record {
    string message?;
    string timestamp?;
    string uri?;
};
