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

public type Userinfo record {
    # The user's email address.
    string email?;
    # The user's last name.
    string family_name?;
    # The user's gender.
    string gender?;
    # The user's first name.
    string given_name?;
    # The hosted domain e.g. example.com if the user is Google apps user.
    string hd?;
    # The obfuscated ID of the user.
    string id?;
    # URL of the profile page.
    string link?;
    # The user's preferred locale.
    string locale?;
    # The user's full name.
    string name?;
    # URL of the user's picture image.
    string picture?;
    # Boolean flag which is true if the email address is verified. Always verified because we only return the user's primary email address.
    boolean verified_email?;
};

public type Tokeninfo record {
    # Who is the intended audience for this token. In general the same as issued_to.
    string audience?;
    # The email address of the user. Present only if the email scope is present in the request.
    string email?;
    # The expiry time of the token, as number of seconds left until expiry.
    int expires_in?;
    # To whom was the token issued to. In general the same as audience.
    string issued_to?;
    # The space separated list of scopes granted to this token.
    string scope?;
    # The obfuscated user id.
    string user_id?;
    # Boolean flag which is true if the email address is verified. Present only if the email scope is present in the request.
    boolean verified_email?;
};
