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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key 'Ocp-Apim-Subscription-Key'
    string ocpApimSubscriptionKey;
|};

# This is a generated connector for [BeezUP Merchant API v2.0](https://api-docs.beezup.com/swagger-ui/) OpenAPI specification. BeezUP Merchant API provides capability to read and write BeezUP data such as accounts, stores, product catalog, channel search etc.
@display {label: "BeezUP Merchant", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [BeezUP account](www.beezup.com) and obtain tokens by following [this guide](https://api-docs.beezup.com/swagger-ui/).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.beezup.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Login
    #
    # + return - Your tokens 
    remote isolated function login(LoginRequest payload) returns ApiCredentials|error {
        string resourcePath = string `/v2/public/security/login`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApiCredentials response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # User Registration
    #
    # + return - Customer registered 
    remote isolated function register(RegisterRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/public/security/register`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Lost password
    #
    # + payload - Your email 
    # + return - New password sent 
    remote isolated function lostPassword(BeezupCommonEmail payload) returns http:Response|error {
        string resourcePath = string `/v2/public/security/lostpassword`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get public channel index
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Channel list regrouped by country and links to list of values 
    remote isolated function getChannelsIndex(string? ifNoneMatch = ()) returns PublicChannelIndex|error {
        string resourcePath = string `/v2/public/channels/`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PublicChannelIndex response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # The channel list for one country
    #
    # + countryIsoCode - The country iso code alpha 3 based on this: https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3#Decoding_table \ To know which country are available you have to use the operation: GetChannelsByCountry 
    # + acceptEncoding - Allows the client to indicate whether it accepts a compressed encoding to reduce traffic size. 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - The channel list for one country 
    remote isolated function getChannels(string countryIsoCode, string[] acceptEncoding, string? ifNoneMatch = ()) returns PublicChannelInfoList|error {
        string resourcePath = string `/v2/public/channels/${getEncodedUri(countryIsoCode)}`;
        map<any> headerValues = {"Accept-Encoding": acceptEncoding, "If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PublicChannelInfoList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get all list names
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Get the list names 
    remote isolated function getPublicLovIndex(string? ifNoneMatch = ()) returns PublicLovIndex|error {
        string resourcePath = string `/v2/public/lov/`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PublicLovIndex response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get all list names
    #
    # + return - Get the list names 
    remote isolated function getUserLovIndex() returns UserLovIndex|error {
        string resourcePath = string `/v2/user/lov/`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserLovIndex response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # The index of all operations and LOV
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - OK 
    remote isolated function getCustomerIndex(string? ifNoneMatch = ()) returns CustomerIndex|error {
        string resourcePath = string `/v2/user/customer/`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CustomerIndex response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get user account information
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - User account information 
    remote isolated function getUserAccountInfo(string? ifNoneMatch = ()) returns AccountInfo|error {
        string resourcePath = string `/v2/user/customer/account`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Resend email activation
    #
    # + return - Email activation resent 
    remote isolated function resendEmailActivation() returns http:Response|error {
        string resourcePath = string `/v2/user/customer/account/resendEmailActivation`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Activate the user account
    #
    # + payload - The email activation id received by email. 
    # + return - User account activated. 
    remote isolated function activateUserAccount(string payload) returns http:Response|error {
        string resourcePath = string `/v2/user/customer/account/activate`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Save user personal information
    #
    # + return - User account information updated 
    remote isolated function savePersonalInfo(PersonalInfo payload) returns http:Response|error {
        string resourcePath = string `/v2/user/customer/account/personalInfo`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Change company information
    #
    # + return - Company information saved 
    remote isolated function saveCompanyInfo(CompanyInfo payload) returns http:Response|error {
        string resourcePath = string `/v2/user/customer/account/companyInfo`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Get profile picture information
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Profile picture information 
    remote isolated function getProfilePictureInfo(string? ifNoneMatch = ()) returns ProfilePictureInfoResponse|error {
        string resourcePath = string `/v2/user/customer/account/profilePictureInfo`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ProfilePictureInfoResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Change user picture information
    #
    # + return - User profile picture information saved. 
    remote isolated function saveProfilePictureInfo(ProfilePictureInfo payload) returns http:Response|error {
        string resourcePath = string `/v2/user/customer/account/profilePictureInfo`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Get credit card information
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - User credit card information 
    remote isolated function getCreditCardInfo(string? ifNoneMatch = ()) returns CreditCardInfoResponse|error {
        string resourcePath = string `/v2/user/customer/account/creditCardInfo`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CreditCardInfoResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Save user credit card info
    #
    # + payload - Credit card info 
    # + return - The credit card information has been accepted for processing, the authorization will be processed shortly. 
    remote isolated function saveCreditCardInfo(CreditCardInfo payload) returns http:Response|error {
        string resourcePath = string `/v2/user/customer/account/creditCardInfo`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Change user email
    #
    # + return - Email updated 
    remote isolated function changeEmail(ChangeEmailRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/customer/account/changeEmail`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Change user password
    #
    # + return - Password updated 
    remote isolated function changePassword(ChangePasswordRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/customer/account/changePassword`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Log out the current user from go2
    #
    # + return - User logout 
    remote isolated function logout() returns http:Response|error {
        string resourcePath = string `/v2/user/customer/security/logout`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Zendesk token
    #
    # + return - A JWT token to connect the Zendesk Web Widget 
    remote isolated function zendeskToken() returns ZendeskToken|error {
        string resourcePath = string `/v2/user/customer/zendeskToken`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ZendeskToken response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get store list
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Store list 
    remote isolated function getStores(string? ifNoneMatch = ()) returns StoreList|error {
        string resourcePath = string `/v2/user/customer/stores`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        StoreList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new store
    #
    # + return - The store has been created successfully. The http header Location contains the new resource url. The body contains the link to the new resource. 
    remote isolated function createStore(CreateStoreRequest payload) returns LinksGetstorelink|error {
        string resourcePath = string `/v2/user/customer/stores`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LinksGetstorelink response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get store's information
    #
    # + storeId - Your store identifier 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - The store information 
    remote isolated function getStore(string storeId, string? ifNoneMatch = ()) returns Store|error {
        string resourcePath = string `/v2/user/customer/stores/${getEncodedUri(storeId)}`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Store response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete a store
    #
    # + storeId - Your store identifier 
    # + return - Store deleted 
    remote isolated function deleteStore(string storeId) returns http:Response|error {
        string resourcePath = string `/v2/user/customer/stores/${getEncodedUri(storeId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Update some store's information.
    #
    # + storeId - Your store identifier 
    # + return - Store updated 
    remote isolated function updateStore(string storeId, UpdateStoreRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/customer/stores/${getEncodedUri(storeId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Get store's rights
    #
    # + storeId - Your store identifier 
    # + return - The store's rights 
    remote isolated function getRights(string storeId) returns FunctionalityRightInfo[]|error {
        string resourcePath = string `/v2/user/customer/stores/${getEncodedUri(storeId)}/rights`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FunctionalityRightInfo[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get store's alerts
    #
    # + storeId - Your store identifier 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - User account alerts information 
    remote isolated function getStoreAlerts(string storeId, string? ifNoneMatch = ()) returns StoreAlerts|error {
        string resourcePath = string `/v2/user/customer/stores/${getEncodedUri(storeId)}/alerts`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        StoreAlerts response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Save store alerts
    #
    # + storeId - Your store identifier 
    # + return - Store alerts saved 
    remote isolated function saveStoreAlerts(string storeId, SaveStoreAlertsRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/customer/stores/${getEncodedUri(storeId)}/alerts`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get shares related to this store
    #
    # + storeId - Your store identifier 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - The sharing list of the store 
    remote isolated function getStoreShares(string storeId, string? ifNoneMatch = ()) returns StoreShares|error {
        string resourcePath = string `/v2/user/customer/stores/${getEncodedUri(storeId)}/shares`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        StoreShares response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Share a store to another user
    #
    # + storeId - Your store identifier 
    # + payload - Your friend's email 
    # + return - Store shared 
    remote isolated function shareStore(string storeId, FriendEmail payload) returns http:Response|error {
        string resourcePath = string `/v2/user/customer/stores/${getEncodedUri(storeId)}/shares`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a share of a store to another user
    #
    # + storeId - Your store identifier 
    # + userId - The friend user id 
    # + return - Share deleted 
    remote isolated function deleteStoreShare(string storeId, string userId) returns http:Response|error {
        string resourcePath = string `/v2/user/customer/stores/${getEncodedUri(storeId)}/shares/${getEncodedUri(userId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get friend information
    #
    # + userId - Your friend user id 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Get friend info 
    remote isolated function getFriendInfo(string userId, string? ifNoneMatch = ()) returns UserFriendInfo|error {
        string resourcePath = string `/v2/user/customer/friends/${getEncodedUri(userId)}`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserFriendInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get billing periods conditions
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Get the billing periods conditions 
    remote isolated function getBillingPeriods(string? ifNoneMatch = ()) returns BillingPeriodList|error {
        string resourcePath = string `/v2/user/customer/billingPeriods`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BillingPeriodList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get all standard offers
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Get all standard offers 
    remote isolated function getStandardOffers(string? ifNoneMatch = ()) returns StandardOffers|error {
        string resourcePath = string `/v2/user/customer/offers`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        StandardOffers response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get offer pricing
    #
    # + return - Get the offer proposal considering your current contract 
    remote isolated function getOffer(OfferRequest payload) returns Offer|error {
        string resourcePath = string `/v2/user/customer/offers`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Offer response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get contract list
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Contract list 
    remote isolated function getContracts(string? ifNoneMatch = ()) returns Contracts|error {
        string resourcePath = string `/v2/user/customer/contracts`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Contracts response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new contract
    #
    # + return - New contract has been created. Some warnings can be present in response. 
    remote isolated function createContract(CreateContract payload) returns CreateContractResponse|error {
        string resourcePath = string `/v2/user/customer/contracts`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateContractResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Schedule termination of your current contract at the end of the commitment.
    #
    # + payload - Indicate the termination reason 
    # + return - Your current contract termination has been scheduled 
    remote isolated function terminateCurrentContract(TerminateContract payload) returns http:Response|error {
        string resourcePath = string `/v2/user/customer/contracts/current/disableAutoRenewal`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Reactivate your terminated contract.
    #
    # + return - Your current contract has been resumed 
    remote isolated function reactivateCurrentContract() returns http:Response|error {
        string resourcePath = string `/v2/user/customer/contracts/current/reenableAutoRenewal`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete your next contract
    #
    # + return - Next contract has been deleted 
    remote isolated function deleteNextContract() returns http:Response|error {
        string resourcePath = string `/v2/user/customer/contracts/next`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get all your invoices
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Get all invoices of a customer 
    remote isolated function getInvoices(string? ifNoneMatch = ()) returns InvoiceList|error {
        string resourcePath = string `/v2/user/customer/invoices`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InvoiceList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the index of the catalog API
    #
    # + return - OK 
    remote isolated function catalogIndex() returns CatalogIndex|error {
        string resourcePath = string `/v2/user/catalogs/`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CatalogIndex response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the BeezUP columns
    #
    # + return - The catalog API index 
    remote isolated function catalogGetbeezupcolumns() returns BeezUPColumnConfiguration[]|error {
        string resourcePath = string `/v2/user/catalogs/beezupColumns`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BeezUPColumnConfiguration[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the index of the catalog API for this store
    #
    # + storeId - Your store identifier 
    # + return - The catalog index 
    remote isolated function catalogStoreIndex(string storeId) returns CatalogStoreIndex|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CatalogStoreIndex response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the last input configuration
    #
    # + storeId - Your store identifier 
    # + return - OK 
    remote isolated function importationGetmanualupdatelastinputconfig(string storeId) returns LastManualImportInputConfiguration|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/inputConfiguration`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LastManualImportInputConfiguration response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get catalog column list
    #
    # + storeId - Your store identifier 
    # + return - Catalog column list 
    remote isolated function catalogGetcatalogcolumns(string storeId) returns CatalogColumnList|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/catalogColumns`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CatalogColumnList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Change Catalog Column User Name
    #
    # + storeId - Your store identifier 
    # + columnId - The catalog column identifier 
    # + return - Catalog column user name changed 
    remote isolated function catalogChangecatalogcolumnusername(string storeId, string columnId, ChangeUserColumnNameRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/catalogColumns/${getEncodedUri(columnId)}/rename`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get custom column list
    #
    # + storeId - Your store identifier 
    # + return - Custom column list 
    remote isolated function catalogGetcustomcolumns(string storeId) returns CustomColumnList|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/customColumns`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CustomColumnList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create or replace a custom column
    #
    # + storeId - Your store identifier 
    # + columnId - The custom column identifier 
    # + return - Custom column saved 
    remote isolated function catalogSavecustomcolumn(string storeId, string columnId, CreateCustomColumnRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/customColumns/${getEncodedUri(columnId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete custom column
    #
    # + storeId - Your store identifier 
    # + columnId - The custom column identifier 
    # + return - Custom column deleted 
    remote isolated function catalogDeletecustomcolumn(string storeId, string columnId) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/customColumns/${getEncodedUri(columnId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Change Custom Column User Name
    #
    # + storeId - Your store identifier 
    # + columnId - The custom column identifier 
    # + return - Custom column renamed 
    remote isolated function catalogChangecustomcolumnusername(string storeId, string columnId, ChangeUserColumnNameRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/customColumns/${getEncodedUri(columnId)}/rename`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the encrypted custom column expression
    #
    # + storeId - Your store identifier 
    # + columnId - The custom column identifier 
    # + return - Encrypted expression 
    remote isolated function catalogGetcustomcolumnexpression(string storeId, string columnId) returns string|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/customColumns/${getEncodedUri(columnId)}/expression`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Change custom column expression
    #
    # + storeId - Your store identifier 
    # + columnId - The custom column identifier 
    # + return - Custom column expression saved 
    remote isolated function catalogChangecustomcolumnexpression(string storeId, string columnId, ChangeCustomColumnExpressionRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/customColumns/${getEncodedUri(columnId)}/expression`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Compute the expression for this catalog.
    #
    # + storeId - Your store identifier 
    # + return - Compute an expression 
    remote isolated function catalogComputeexpression(string storeId, ComputeExpressionRequest payload) returns string|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/customColumns/computeExpression`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get category list
    #
    # + storeId - Your store identifier 
    # + acceptEncoding - Indicates that the client accepts that the response will be compressed to reduce traffic size. 
    # + return - Categories 
    remote isolated function catalogGetcategories(string storeId, string[] acceptEncoding) returns CategoryList|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/categories`;
        map<any> headerValues = {"Accept-Encoding": acceptEncoding, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CategoryList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get product list
    #
    # + storeId - Your store identifier 
    # + return - Product list 
    remote isolated function catalogGetproducts(string storeId, GetProductsRequest payload) returns ProductList|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/products/list`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProductList response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get random product list
    #
    # + storeId - Your store identifier 
    # + return - Random product list 
    remote isolated function catalogGetrandomproducts(string storeId) returns RandomProductList|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/products/random`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RandomProductList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get product by ProductId
    #
    # + storeId - Your store identifier 
    # + productId - The product identifier you want to get 
    # + return - Product 
    remote isolated function catalogGetproductbyproductid(string storeId, string productId) returns Product|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/products/${getEncodedUri(productId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Product response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get product by Sku
    #
    # + storeId - Your store identifier 
    # + sku - The product sku you want to get 
    # + return - Product 
    remote isolated function catalogGetproductbysku(string storeId, string sku) returns Product|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/products`;
        map<anydata> queryParam = {"sku": sku};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Product response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the latest catalog importation reporting for all your stores
    #
    # + return - The last importation reportings 
    remote isolated function importationGetreportingsallstores() returns ImportationsPerStoreResponse|error {
        string resourcePath = string `/v2/user/catalogs/importations`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ImportationsPerStoreResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the latest catalog importation reporting
    #
    # + storeId - Your store identifier 
    # + return - The last importation reportings 
    remote isolated function importationGetreportings(string storeId) returns ImportationsResponse|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ImportationsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Start Manual Import
    #
    # + storeId - Your store identifier 
    # + return - Catalog importation started 
    remote isolated function importationStartmanualupdate(string storeId, StartManualImportRequest payload) returns LinksImportationGetimportationmonitoringlink|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/start`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LinksImportationGetimportationmonitoringlink response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the importation status
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + return - OK 
    remote isolated function importationGetimportationmonitoring(string storeId, string executionId) returns ImportationMonitoring|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ImportationMonitoring response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Cancel importation
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + return - Catalog importation canceled 
    remote isolated function importationCancel(string storeId, string executionId) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/cancel`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get technical progression
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + return - When the technical progression is correctly retrived 
    remote isolated function importationTechnicalprogression(string storeId, string executionId) returns ImportationTechnicalProgression|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/technicalProgression`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ImportationTechnicalProgression response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Configure remaining catalog columns
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + return - Remaining catalog columns have been configured. This operation has no impact on the current catalog until you commit the catalog importation. 
    remote isolated function importationConfigureremainingcatalogcolumns(string storeId, string executionId) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/configureRemainingCatalogColumns`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Commit columns
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + return - Columns configuration have been committed. This operation has no impact on the current catalog until you commit the catalog importation. 
    remote isolated function importationCommitcolumns(string storeId, string executionId) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/commitColumns`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Commit Importation
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + return - Catalog importation committed 
    remote isolated function importationCommit(string storeId, string executionId) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/commit`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the product sample related to this importation with all columns (catalog and custom)
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + productSampleIndex - Index of the product sample. Starting from 0 to 99. 
    # + return - OK 
    remote isolated function importationGetproductsample(string storeId, string executionId, int productSampleIndex) returns ProductSample|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/productSamples/${getEncodedUri(productSampleIndex)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ProductSample response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get product sample custom column value related to this importation.
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + productSampleIndex - Index of the product sample. Starting from 0 to 99. 
    # + columnId - The custom column identifier 
    # + return - Product sample custom column value 
    remote isolated function importationGetproductsamplecustomcolumnvalue(string storeId, string executionId, int productSampleIndex, string columnId) returns string|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/productSamples/${getEncodedUri(productSampleIndex)}/customColumns/${getEncodedUri(columnId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get detected catalog columns during this importation.
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + return - OK 
    remote isolated function importationGetdetectedcatalogcolumns(string storeId, string executionId) returns DetectedCatalogColumnList|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/catalogColumns`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DetectedCatalogColumnList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Configure catalog column
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + columnId - The custom column identifier 
    # + return - Catalog column configured. This operation has no impact on the current catalog until you commit the catalog importation. 
    remote isolated function importationConfigurecatalogcolumn(string storeId, string executionId, string columnId, ConfigureCatalogColumnCatalogRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/catalogColumns/${getEncodedUri(columnId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Ignore Column
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + columnId - The custom column identifier 
    # + return - Catalog column ignored. This operation has no impact on the current catalog until you commit the catalog importation. 
    remote isolated function importationIgnorecolumn(string storeId, string executionId, string columnId) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/catalogColumns/${getEncodedUri(columnId)}/ignore`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Reattend Column
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + columnId - The custom column identifier 
    # + return - Catalog column reattended. This operation has no impact on the current catalog until you commit the catalog importation. 
    remote isolated function importationReattendcolumn(string storeId, string executionId, string columnId) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/catalogColumns/${getEncodedUri(columnId)}/reattend`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Map catalog column to a BeezUP column
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + columnId - The catalog column identifier 
    # + return - Catalog column mapped. This operation has no impact on the current catalog until you commit the catalog importation. 
    remote isolated function importationMapcatalogcolumn(string storeId, string executionId, string columnId, MapBeezUPColumnRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/catalogColumns/${getEncodedUri(columnId)}/map`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Unmap catalog column
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + columnId - The catalog column identifier 
    # + return - Catalog Column unmapped. This operation has no impact on the current catalog until you commit the catalog importation. 
    remote isolated function importationUnmapcatalogcolumn(string storeId, string executionId, string columnId) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/catalogColumns/${getEncodedUri(columnId)}/unmap`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get custom columns currently place in this importation
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + return - Custom columns of current Importation successfully retrieved 
    remote isolated function importationGetcustomcolumns(string storeId, string executionId) returns ImportationCustomColumnList|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/customColumns`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ImportationCustomColumnList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the encrypted custom column expression in this importation
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + columnId - The custom column identifier 
    # + return - Encrypted expression 
    remote isolated function importationGetcustomcolumnexpression(string storeId, string executionId, string columnId) returns string|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/customColumns/${getEncodedUri(columnId)}/expression`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create or replace a custom column
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + columnId - The custom column identifier 
    # + return - Custom column configured. This operation has no impact on the current catalog until you commit the catalog importation. 
    remote isolated function importationSavecustomcolumn(string storeId, string executionId, string columnId, ChangeCustomColumnRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/customColumns/${getEncodedUri(columnId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Custom Column
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + columnId - The custom column identifier 
    # + return - When the custom column for this importation is correctly deleted 
    remote isolated function importationDeletecustomcolumn(string storeId, string executionId, string columnId) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/customColumns/${getEncodedUri(columnId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Map custom column to a BeezUP column
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + columnId - The custom column identifier 
    # + return - Custom column mapped. This operation has no impact on the current catalog until you commit the catalog importation. 
    remote isolated function importationMapcustomcolumn(string storeId, string executionId, string columnId, MapBeezUPColumnRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/customColumns/${getEncodedUri(columnId)}/map`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Unmap custom column
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + columnId - The custom column identifier 
    # + return - Custom column unmapped. This operation has no impact on the current catalog until you commit the catalog importation. 
    remote isolated function importationUnmapcustomcolumn(string storeId, string executionId, string columnId) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/customColumns/${getEncodedUri(columnId)}/unmap`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Importation Get Products Report
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + return - Get Products Report Response 
    remote isolated function importationGetproductsreport(string storeId, string executionId, GetImportationProductsReportRequest payload) returns GetImportationProductsReportResponse|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/products/list`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetImportationProductsReportResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Importation Get Report
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + return - Get Report Response 
    remote isolated function importationGetreport(string storeId, string executionId) returns GetImportationReportResponse|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/importations/${getEncodedUri(executionId)}/report`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetImportationReportResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Activate the auto importation of the last successful manual catalog importation.
    #
    # + storeId - Your store identifier 
    # + return - Auto import activated 
    remote isolated function importationActivateautoimport(string storeId) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/autoImport/activate`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the auto import configuration
    #
    # + storeId - Your store identifier 
    # + return - Auto import configuration 
    remote isolated function autoGetautoimportconfiguration(string storeId) returns AutoImportConfiguration|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/autoImport`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AutoImportConfiguration response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Auto Import
    #
    # + storeId - Your store identifier 
    # + return - Auto import deleted 
    remote isolated function autoDeleteautoimport(string storeId) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/autoImport`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Start Auto Import Manually
    #
    # + storeId - Your store identifier 
    # + return - Catalog importation started 
    remote isolated function autoStartautoimport(string storeId) returns LinksImportationGetimportationmonitoringlink|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/autoImport/start`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        LinksImportationGetimportationmonitoringlink response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Pause Auto Import
    #
    # + storeId - Your store identifier 
    # + return - Auto import paused 
    remote isolated function autoPauseautoimport(string storeId) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/autoImport/pause`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Resume Auto Import
    #
    # + storeId - Your store identifier 
    # + return - Auto import resumed 
    remote isolated function autoResumeautoimport(string storeId) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/autoImport/resume`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Configure Auto Import Interval
    #
    # + storeId - Your store identifier 
    # + return - Auto import scheduling interval saved 
    remote isolated function autoConfigureautoimportinterval(string storeId, ConfigureAutoImportIntervalRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/autoImport/scheduling/interval`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Configure Auto Import Schedules
    #
    # + storeId - Your store identifier 
    # + return - Auto import scheduling saved 
    remote isolated function autoScheduleautoimport(string storeId, ScheduleAutoImportRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/catalogs/${getEncodedUri(storeId)}/autoImport/scheduling/schedules`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # List all available channel for this store
    #
    # + storeId - The store identifier 
    # + return - Available channel list for this store 
    remote isolated function getAvailableChannels(string storeId) returns ChannelHeader[]|error {
        string resourcePath = string `/v2/user/channels/`;
        map<anydata> queryParam = {"storeId": storeId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChannelHeader[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get channel information
    #
    # + channelId - The channel identifier 
    # + return - Channel information 
    remote isolated function getChannelInfo(string channelId) returns ChannelInfo|error {
        string resourcePath = string `/v2/user/channels/${getEncodedUri(channelId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChannelInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get channel categories
    #
    # + channelId - The channel identifier 
    # + acceptEncoding - Indicates that the client accepts that the response will be compressed to reduce traffic size. 
    # + return - Channel categories 
    remote isolated function getChannelCategories(string channelId, string[] acceptEncoding) returns ChannelRootCategory|error {
        string resourcePath = string `/v2/user/channels/${getEncodedUri(channelId)}/categories`;
        map<any> headerValues = {"Accept-Encoding": acceptEncoding, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChannelRootCategory response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get channel columns
    #
    # + channelId - The channel identifier 
    # + acceptEncoding - Indicates that the client accepts that the response will be compressed to reduce traffic size. 
    # + payload - Allow you to filter the channel column identifier list your want to get 
    # + return - Channel columns 
    remote isolated function getChannelColumns(string channelId, string[] acceptEncoding, BeezupCommonChannelcolumnid[] payload) returns ChannelColumn[]|error {
        string resourcePath = string `/v2/user/channels/${getEncodedUri(channelId)}/columns`;
        map<any> headerValues = {"Accept-Encoding": acceptEncoding, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ChannelColumn[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # List all your current channel catalogs
    #
    # + storeId - The store identifier 
    # + return - OK 
    remote isolated function getChannelCatalogs(string? storeId = ()) returns ChannelCatalogList|error {
        string resourcePath = string `/v2/user/channelCatalogs/`;
        map<anydata> queryParam = {"storeId": storeId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChannelCatalogList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add a new channel catalog
    #
    # + return - When the channel has been successfully added for this store 
    remote isolated function addChannelCatalog(AddChannelCatalogRequest payload) returns LinksGetchannelcataloglink|error {
        string resourcePath = string `/v2/user/channelCatalogs/`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LinksGetchannelcataloglink response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the channel catalog information
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog 
    remote isolated function getChannelCatalog(string channelCatalogId) returns ChannelCatalog|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChannelCatalog response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete the channel catalog
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog deleted 
    remote isolated function deleteChannelCatalog(string channelCatalogId) returns http:Response|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get channel catalog filter operators
    #
    # + return - Channel catalog  filter operator list 
    remote isolated function getChannelCatalogFilterOperators() returns FilterOperator[]|error {
        string resourcePath = string `/v2/user/channelCatalogs/filterOperators`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FilterOperator[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Enable a channel catalog
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog enabled 
    remote isolated function enableChannelCatalog(string channelCatalogId) returns http:Response|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/enable`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Disable a channel catalog
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog disabled 
    remote isolated function disableChannelCatalog(string channelCatalogId) returns http:Response|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/disable`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Configure channel catalog general settings
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog general settings configured 
    remote isolated function configureChannelCatalogGeneralSettings(string channelCatalogId, GeneralSettings payload) returns http:Response|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/settings/general`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Configure channel catalog cost settings
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog cost settings configured 
    remote isolated function configureChannelCatalogCostSettings(string channelCatalogId, CostSettings payload) returns http:Response|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/settings/cost`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Configure channel catalog column mappings
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog column mappings configured 
    remote isolated function configureChannelCatalogColumnMappings(string channelCatalogId, ChannelCatalogColumnMappingList payload) returns http:Response|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/columnMappings`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Get channel catalog categories
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog category mappings 
    remote isolated function getChannelCatalogCategories(string channelCatalogId) returns ChannelCatalogCategoryConfigurationList|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/categories`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChannelCatalogCategoryConfigurationList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Disable a channel catalog category mapping
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog category mapping disabled 
    remote isolated function disableChannelCatalogCategoryMapping(string channelCatalogId) returns http:Response|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/categories/disableMapping`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Reenable a channel catalog category mapping
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog category mapping reenabled 
    remote isolated function reenableChannelCatalogCategoryMapping(string channelCatalogId) returns http:Response|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/categories/reenableMapping`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Configure channel catalog category
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog category configured 
    remote isolated function configureChannelCatalogCategory(string channelCatalogId, ConfigureCategoryRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/categories/configure`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get channel catalog exclusion filters
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog exclusion filter list 
    remote isolated function getChannelCatalogExclusionFilters(string channelCatalogId) returns ExclusionFiltersResponse|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/exclusionFilters`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ExclusionFiltersResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Configure channel catalog exclusion filters
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog exclusion filter list configured 
    remote isolated function configureChannelCatalogExclusionFilters(string channelCatalogId, ExclusionFilters payload) returns http:Response|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/exclusionFilters`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Get channel catalog product information list
    #
    # + channelCatalogId - The channel catalog identifier 
    # + payload - The channel catalog product list filter 
    # + return - Channel catalog product information 
    remote isolated function getChannelCatalogProductInfoList(string channelCatalogId, GetChannelCatalogProductInfoListRequest payload) returns ChannelCatalogProductInfoList|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/products`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ChannelCatalogProductInfoList response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Export channel catalog product information list
    #
    # + channelCatalogId - The channel catalog identifier 
    # + format - The file type of the exportation 
    # + payload - The channel catalog product list filter 
    # + return - Channel catalog product information list exported 
    remote isolated function exportChannelCatalogProductInfoList(string channelCatalogId, string format, GetChannelCatalogProductInfoListRequest payload) returns BeezupCommonLink3|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/products/export`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BeezupCommonLink3 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get channel catalog products' counters
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog products' counters 
    remote isolated function getChannelCatalogProductsCounters(string channelCatalogId) returns ChannelCatalogProductsCounters|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/products/counters`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChannelCatalogProductsCounters response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get channel catalog products related to these channel catalogs
    #
    # + return - The channel catalog product by channel catalog 
    remote isolated function getChannelCatalogProductByChannelCatalog(ChannelCatalogProductByChannelCatalogRequest payload) returns ChannelCatalogProductByChannelCatalogResponse|error {
        string resourcePath = string `/v2/user/channelCatalogs/products`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ChannelCatalogProductByChannelCatalogResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get channel catalog product information
    #
    # + channelCatalogId - The channel catalog identifier 
    # + productId - The product identifier 
    # + return - Channel catalog product information 
    remote isolated function getChannelCatalogProductInfo(string channelCatalogId, string productId) returns ChannelCatalogProductInfo|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/products/${getEncodedUri(productId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChannelCatalogProductInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Override channel catalog product values
    #
    # + channelCatalogId - The channel catalog identifier 
    # + productId - The product identifier 
    # + return - Channel catalog product overriden 
    remote isolated function overrideChannelCatalogProductValues(string channelCatalogId, string productId, ProductOverrides payload) returns http:Response|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/products/${getEncodedUri(productId)}/overrides`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a specific channel catalog product value override
    #
    # + channelCatalogId - The channel catalog identifier 
    # + productId - The product identifier 
    # + channelColumnId - The channel column identifier 
    # + return - Channel catalog product value override deleted 
    remote isolated function deleteChannelCatalogProductValueOverride(string channelCatalogId, string productId, string channelColumnId) returns http:Response|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/products/${getEncodedUri(productId)}/overrides/${getEncodedUri(channelColumnId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get channel catalog product value override compatibilities status
    #
    # + channelCatalogId - The channel catalog identifier 
    # + productId - The product identifier 
    # + return - placeholder. will be completed soon. 
    remote isolated function getChannelCatalogProductValueOverrideCopy(string channelCatalogId, string productId) returns http:Response|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/products/${getEncodedUri(productId)}/overrides/copy`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Copy channel catalog product value override
    #
    # + channelCatalogId - The channel catalog identifier 
    # + productId - The product identifier 
    # + return - Channel catalog product value override deleted 
    remote isolated function configureChannelCatalogProductValueOverrideCopy(string channelCatalogId, string productId) returns http:Response|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/products/${getEncodedUri(productId)}/overrides/copy`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Disable channel catalog product
    #
    # + channelCatalogId - The channel catalog identifier 
    # + productId - The product identifier 
    # + return - Channel catalog product disabled 
    remote isolated function disableChannelCatalogProduct(string channelCatalogId, string productId) returns http:Response|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/products/${getEncodedUri(productId)}/disable`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Reenable channel catalog product
    #
    # + channelCatalogId - The channel catalog identifier 
    # + productId - The product identifier 
    # + return - Channel catalog product reenabled 
    remote isolated function reenableChannelCatalogProduct(string channelCatalogId, string productId) returns http:Response|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/products/${getEncodedUri(productId)}/reenable`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the exportation cache information
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog exportation cache information 
    remote isolated function getChannelCatalogExportationCacheInfo(string channelCatalogId) returns ChannelCatalogExportCacheInfoResponse|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/exportations/cache`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChannelCatalogExportCacheInfoResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Clear the exportation cache
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog exportation cache cleared 
    remote isolated function clearChannelCatalogExportationCache(string channelCatalogId) returns http:Response|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/exportations/cache/clear`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the exportation history
    #
    # + channelCatalogId - The channel catalog identifier 
    # + pageNumber - The page number you want to get 
    # + pageSize - The entry count you want to get 
    # + return - Channel catalog exportation history 
    remote isolated function getChannelCatalogExportationHistory(string channelCatalogId, int pageNumber, int pageSize) returns ChannelCatalogExportationHistory|error {
        string resourcePath = string `/v2/user/channelCatalogs/${getEncodedUri(channelCatalogId)}/exportations/history`;
        map<anydata> queryParam = {"pageNumber": pageNumber, "pageSize": pageSize};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChannelCatalogExportationHistory response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get your marketplace channel catalog list
    #
    # + storeId - The StoreId to filter by 
    # + return - Marketplace channel catalog list 
    remote isolated function getMarketplaceChannelCatalogs(string? storeId = ()) returns MarketplaceChannelCatalogList|error {
        string resourcePath = string `/v2/user/marketplaces/channelcatalogs/`;
        map<anydata> queryParam = {"storeId": storeId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MarketplaceChannelCatalogList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # [PREVIEW] Launch a publication of the catalog to the marketplace
    #
    # + marketplaceTechnicalCode - Marketplace Technical Code to query (required) 
    # + accountId - Account Id to query (required) 
    # + return - Publication request accepted 
    remote isolated function publishCatalogToMarketplace(string marketplaceTechnicalCode, int accountId, PublishCatalogToMarketplaceRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/marketplaces/channelcatalogs/publications/${getEncodedUri(marketplaceTechnicalCode)}/${getEncodedUri(accountId)}/publish`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Fetch the publication history for an account, sorted by descending start date
    #
    # + marketplaceTechnicalCode - Marketplace Technical Code to query (required) 
    # + accountId - Account Id to query (required) 
    # + channelCatalogId - Channel Catalog Id by which to filter (optional) 
    # + count - Amount of entries to fetch (optional, default set to 10) 
    # + publicationTypes - Publication types by which to filter (optional) 
    # + return - Successfully fetched channel catalog settings 
    remote isolated function getPublications(string marketplaceTechnicalCode, int accountId, string[] publicationTypes, string? channelCatalogId = (), int count = 10) returns AccountPublications|error {
        string resourcePath = string `/v2/user/marketplaces/channelcatalogs/publications/${getEncodedUri(marketplaceTechnicalCode)}/${getEncodedUri(accountId)}/history`;
        map<anydata> queryParam = {"channelCatalogId": channelCatalogId, "count": count, "publicationTypes": publicationTypes};
        map<Encoding> queryParamEncoding = {"publicationTypes": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountPublications response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the marketplace settings for a channel catalog
    #
    # + channelCatalogId - Channel Catalog Id to query (required) 
    # + return - Successfully fetched channel catalog settings 
    remote isolated function getChannelCatalogMarketplaceSettings(string channelCatalogId) returns ChannelCatalogMarketplaceSettings|error {
        string resourcePath = string `/v2/user/marketplaces/channelcatalogs/${getEncodedUri(channelCatalogId)}/settings`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChannelCatalogMarketplaceSettings response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Save new marketplace settings for a channel catalog
    #
    # + channelCatalogId - Channel Catalog Id to query 
    # + payload - Settings to save 
    # + return - Successfully saved channel catalog marketplace settings 
    remote isolated function setChannelCatalogMarketplaceSettings(string channelCatalogId, SetChannelCatalogMarketplaceSettingsRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/marketplaces/channelcatalogs/${getEncodedUri(channelCatalogId)}/settings`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # [DEPRECATED] Get all actions you can do on the order API
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Order index 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getOrderIndex(string? ifNoneMatch = ()) returns OrderIndex|error {
        string resourcePath = string `/v2/user/marketplaces/orders/`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        OrderIndex response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # [DEPRECATED] Get current synchronization status between your marketplaces and BeezUP accounts
    #
    # + storeId - The StoreId to filter by 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Successfully fetched current synchronization status 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getMarketplaceAccountsSynchronization(string? storeId = (), string? ifNoneMatch = ()) returns AccountSynchronizationList|error {
        string resourcePath = string `/v2/user/marketplaces/orders/status`;
        map<anydata> queryParam = {"storeId": storeId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountSynchronizationList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # [DEPRECATED] Send harvest request to all your marketplaces
    #
    # + storeId - The StoreId to filter by 
    # + return - Successfully sent harvest request to all marketplaces 
    # 
    # # Deprecated
    @deprecated
    remote isolated function harvestAll(string? storeId = ()) returns http:Response|error {
        string resourcePath = string `/v2/user/marketplaces/orders/harvest`;
        map<anydata> queryParam = {"storeId": storeId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get list of configured automatic Order status transitions
    #
    # + storeId - The StoreId to filter by 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Successfully fetched list of configured automatic Order status transitions 
    remote isolated function getAutomaticTransitions(string? storeId = (), string? ifNoneMatch = ()) returns AutomaticTransitionInfoList|error {
        string resourcePath = string `/v2/user/marketplaces/orders/automaticTransitions`;
        map<anydata> queryParam = {"storeId": storeId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AutomaticTransitionInfoList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Configure new or existing automatic Order status transition
    #
    # + return - Successfully confirugred new or existing automatic Order status transition 
    remote isolated function configureAutomaticTransitions(ConfigureAutomaticTransitionRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/marketplaces/orders/automaticTransitions`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # [DEPRECATED] Get a paginated list of all Orders with all Order and Order Item(s) properties
    #
    # + acceptEncoding - Allows the client to indicate wether it accepts a compressed encoding to reduce traffic size 
    # + return - Successfully fetched the full list of Orders 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getOrderListFull(string[] acceptEncoding, OrderListRequest payload) returns OrderListFull|error {
        string resourcePath = string `/v2/user/marketplaces/orders/list/full`;
        map<any> headerValues = {"Accept-Encoding": acceptEncoding, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OrderListFull response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # [DEPRECATED] Get a paginated list of all Orders without details
    #
    # + return - Successfully fetched the list of Orders 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getOrderListLight(OrderListRequest payload) returns OrderListLight|error {
        string resourcePath = string `/v2/user/marketplaces/orders/list/light`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OrderListLight response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a paginated list of Order report exportations
    #
    # + pageNumber - The page number you want to get 
    # + pageSize - The entry count you want to get 
    # + storeId - The store identifier to regroup the order exportations 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Successfully fetched the list of Order report exportations 
    remote isolated function getOrderExportations(int pageNumber, int pageSize, string storeId, string? ifNoneMatch = ()) returns OrderExportations|error {
        string resourcePath = string `/v2/user/marketplaces/orders/exportations`;
        map<anydata> queryParam = {"pageNumber": pageNumber, "pageSize": pageSize, "storeId": storeId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        OrderExportations response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request a new Order report exportation to be generated
    #
    # + return - Successfully requested new Order report exportation generation 
    remote isolated function exportOrders(ExportOrderListRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/marketplaces/orders/exportations`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # [DEPRECATED] Send a batch of operations to set an Order's merchant information  (max 100 items per call)
    #
    # + return - Succesfully received and processed batched operations. Please check response to see the status per operation. 
    # 
    # # Deprecated
    @deprecated
    remote isolated function setMerchantOrderInfoList(SetMerchantOrderInfoListRequest payload) returns BatchOrderOperationResponse|error {
        string resourcePath = string `/v2/user/marketplaces/orders/batches/setMerchantOrderInfos`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchOrderOperationResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # [DEPRECATED] Send a batch of operations to clear an Order's merchant information (max 100 items per call)
    #
    # + return - Succesfully received and processed batched operations. Please check response to see the status per operation. 
    # 
    # # Deprecated
    @deprecated
    remote isolated function clearMerchantOrderInfoList(ClearMerchantOrderInfoListRequest payload) returns BatchOrderOperationResponse|error {
        string resourcePath = string `/v2/user/marketplaces/orders/batches/clearMerchantOrderInfos`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchOrderOperationResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # [DEPRECATED] Send a batch of operations to change your marketplace Order information: accept, ship, etc.  (max 100 items per call)
    #
    # + changeOrderType - The Order change type 
    # + userName - Sometimes the user in the e-commerce application is not the same as user associated with the current subscription key. We recommend providing your application's user login. 
    # + testMode - If true, the operation will be not be sent to marketplace. But the validation will be taken in account. 
    # + return - Succesfully received and processed batched operations. Please check response to see the status per operation. 
    # 
    # # Deprecated
    @deprecated
    remote isolated function changeOrderList(string changeOrderType, string userName, ChangeOrderListRequest payload, boolean testMode = false) returns BatchOrderOperationResponse|error {
        string resourcePath = string `/v2/user/marketplaces/orders/batches/changeOrders/${getEncodedUri(changeOrderType)}`;
        map<anydata> queryParam = {"userName": userName, "testMode": testMode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchOrderOperationResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # [DEPRECATED] DEPRECATED - Get full Order and Order Item(s) properties
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Successfully fetched Order and Order Item(s) properties 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getOrder(string marketplaceTechnicalCode, int accountId, string beezUPOrderId, string? ifNoneMatch = ()) returns Order|error {
        string resourcePath = string `/v2/user/marketplaces/orders/${getEncodedUri(marketplaceTechnicalCode)}/${getEncodedUri(accountId)}/${getEncodedUri(beezUPOrderId)}`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Order response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # [DEPRECATED] DEPRECATED - Get the meta information about the order (ETag, Last-Modified)
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Successfully fetched Order and Order Item(s) properties 
    # 
    # # Deprecated
    @deprecated
    remote isolated function headOrder(string marketplaceTechnicalCode, int accountId, string beezUPOrderId, string? ifNoneMatch = ()) returns http:Response|error {
        string resourcePath = string `/v2/user/marketplaces/orders/${getEncodedUri(marketplaceTechnicalCode)}/${getEncodedUri(accountId)}/${getEncodedUri(beezUPOrderId)}`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->head(resourcePath, httpHeaders);
        return response;
    }
    # [DEPRECATED] Get an Order's harvest and change history
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Successfully fetched Order history 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getOrderHistory(string marketplaceTechnicalCode, int accountId, string beezUPOrderId, string? ifNoneMatch = ()) returns OrderHistory|error {
        string resourcePath = string `/v2/user/marketplaces/orders/${getEncodedUri(marketplaceTechnicalCode)}/${getEncodedUri(accountId)}/${getEncodedUri(beezUPOrderId)}/history`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        OrderHistory response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # [DEPRECATED] Send harvest request for a single Order
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + return - Successfully sent Order harvest request 
    # 
    # # Deprecated
    @deprecated
    remote isolated function harvestOrder(string marketplaceTechnicalCode, int accountId, string beezUPOrderId) returns http:Response|error {
        string resourcePath = string `/v2/user/marketplaces/orders/${getEncodedUri(marketplaceTechnicalCode)}/${getEncodedUri(accountId)}/${getEncodedUri(beezUPOrderId)}/harvest`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # [DEPRECATED] Set an Order's merchant information
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + return - Successfully set Order merchant order info set 
    # 
    # # Deprecated
    @deprecated
    remote isolated function setMerchantOrderInfo(string marketplaceTechnicalCode, int accountId, string beezUPOrderId, SetMerchantOrderInfoRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/marketplaces/orders/${getEncodedUri(marketplaceTechnicalCode)}/${getEncodedUri(accountId)}/${getEncodedUri(beezUPOrderId)}/setMerchantOrderInfo`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # [DEPRECATED] Clear an Order's merchant information
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + return - Successfully cleared Order merchant order info set 
    # 
    # # Deprecated
    @deprecated
    remote isolated function clearMerchantOrderInfo(string marketplaceTechnicalCode, int accountId, string beezUPOrderId) returns http:Response|error {
        string resourcePath = string `/v2/user/marketplaces/orders/${getEncodedUri(marketplaceTechnicalCode)}/${getEncodedUri(accountId)}/${getEncodedUri(beezUPOrderId)}/clearMerchantOrderInfo`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # [DEPRECATED] Change your marketplace Order Information (accept, ship, etc.)
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + changeOrderType - The Order change type 
    # + userName - Sometimes the user in the e-commerce application is not the same as user associated with the current subscription key. We recommend providing your application's user login. 
    # + testMode - If true, the operation will be not be sent to marketplace. But the validation will be taken in account. 
    # + ifMatch - ETag value to identify the last known version of requested resource.\ To ensure that you are making a change on the lastest version of the resource.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Order change request accepted 
    # 
    # # Deprecated
    @deprecated
    remote isolated function changeOrder(string marketplaceTechnicalCode, int accountId, string beezUPOrderId, string changeOrderType, string userName, string ifMatch, ChangeOrderRequest payload, boolean testMode = false) returns http:Response|error {
        string resourcePath = string `/v2/user/marketplaces/orders/${getEncodedUri(marketplaceTechnicalCode)}/${getEncodedUri(accountId)}/${getEncodedUri(beezUPOrderId)}/${getEncodedUri(changeOrderType)}`;
        map<anydata> queryParam = {"userName": userName, "testMode": testMode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Match": ifMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get current synchronization status between your marketplaces and BeezUP accounts
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + storeIds - StoredIds to filter 
    # + return - Successfully fetched the list of MarketplaceBusinessCode ready for Order Management 
    remote isolated function getMarketplaceAccountsSynchronizationV3(string? ifNoneMatch = (), string[]? storeIds = ()) returns AccountSynchronizationList|error {
        string resourcePath = string `/orders/v3/status`;
        map<anydata> queryParam = {"storeIds": storeIds};
        map<Encoding> queryParamEncoding = {"storeIds": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountSynchronizationList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Send harvest request to all your marketplaces
    #
    # + storeId - The StoreId to filter by 
    # + return - Successfully sent harvest request to all marketplaces 
    remote isolated function harvestAllV3(string? storeId = ()) returns http:Response|error {
        string resourcePath = string `/orders/v3/harvest`;
        map<anydata> queryParam = {"storeId": storeId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a paginated list of all Orders with all Order and Order Item(s) properties
    #
    # + acceptEncoding - Allows the client to indicate wether it accepts a compressed encoding to reduce traffic size 
    # + return - Successfully fetched the full list of Orders 
    remote isolated function getOrderListFullV3(string acceptEncoding, OrderListRequest payload) returns OrderListFullWithLinks|error {
        string resourcePath = string `/orders/v3/list/full`;
        map<any> headerValues = {"Accept-Encoding": acceptEncoding, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OrderListFullWithLinks response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a paginated list of all Orders without details
    #
    # + return - Successfully fetched the list of Orders 
    remote isolated function getOrderListLightV3(OrderListRequest payload) returns OrderListLightWithLinks|error {
        string resourcePath = string `/orders/v3/list/light`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OrderListLightWithLinks response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get full Order and Order Item(s) properties
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Successfully fetched Order and Order Item(s) properties 
    remote isolated function getOrderV3(string marketplaceTechnicalCode, int accountId, string beezUPOrderId, string? ifNoneMatch = ()) returns OrderWithLinks|error {
        string resourcePath = string `/orders/v3/${getEncodedUri(marketplaceTechnicalCode)}/${getEncodedUri(accountId)}/${getEncodedUri(beezUPOrderId)}`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        OrderWithLinks response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the meta information about the order (ETag, Last-Modified)
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Successfully fetched Order and Order Item(s) properties 
    remote isolated function headOrderV3(string marketplaceTechnicalCode, int accountId, string beezUPOrderId, string? ifNoneMatch = ()) returns http:Response|error {
        string resourcePath = string `/orders/v3/${getEncodedUri(marketplaceTechnicalCode)}/${getEncodedUri(accountId)}/${getEncodedUri(beezUPOrderId)}`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->head(resourcePath, httpHeaders);
        return response;
    }
    # Change your marketplace Order Information (accept, ship, etc.)
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + changeOrderType - The Order change type 
    # + userName - Sometimes the user in the e-commerce application is not the same as user associated with the current subscription key. We recommend providing your application's user login. 
    # + testMode - If true, the operation will be not be sent to marketplace. But the validation will be taken in account. 
    # + return - Order change request accepted 
    remote isolated function changeOrderV3(string marketplaceTechnicalCode, int accountId, string beezUPOrderId, string changeOrderType, string userName, ChangeOrderRequest payload, boolean testMode = false) returns http:Response|error {
        string resourcePath = string `/orders/v3/${getEncodedUri(marketplaceTechnicalCode)}/${getEncodedUri(accountId)}/${getEncodedUri(beezUPOrderId)}/${getEncodedUri(changeOrderType)}`;
        map<anydata> queryParam = {"userName": userName, "testMode": testMode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get an Order's harvest and change history
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + return - Successfully fetched Order history 
    remote isolated function getOrderHistoryV3(string marketplaceTechnicalCode, int accountId, string beezUPOrderId) returns OrderHistory|error {
        string resourcePath = string `/orders/v3/${getEncodedUri(marketplaceTechnicalCode)}/${getEncodedUri(accountId)}/${getEncodedUri(beezUPOrderId)}/history`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        OrderHistory response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Send harvest request for a single Order
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + return - Successfully sent Order harvest request 
    remote isolated function harvestOrderV3(string marketplaceTechnicalCode, int accountId, string beezUPOrderId) returns http:Response|error {
        string resourcePath = string `/orders/v3/${getEncodedUri(marketplaceTechnicalCode)}/${getEncodedUri(accountId)}/${getEncodedUri(beezUPOrderId)}/harvest`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Send harvest request for an Account
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + return - Successfully sent Order harvest request 
    remote isolated function harvestAccount(string marketplaceTechnicalCode, int accountId, string? marketplaceOrderId = (), string? beezUPOrderId = ()) returns http:Response|error {
        string resourcePath = string `/orders/v3/${getEncodedUri(marketplaceTechnicalCode)}/${getEncodedUri(accountId)}/harvest`;
        map<anydata> queryParam = {"marketplaceOrderId": marketplaceOrderId, "beezUPOrderId": beezUPOrderId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the order change reporting
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + orderChangeExecutionUUID - The order change execution id 
    # + return - Successfully fetched Order change reporting 
    remote isolated function getOrderChangeReportingV3(string marketplaceTechnicalCode, int accountId, string beezUPOrderId, string orderChangeExecutionUUID) returns ChangeOrderReporting|error {
        string resourcePath = string `/orders/v3/${getEncodedUri(marketplaceTechnicalCode)}/${getEncodedUri(accountId)}/${getEncodedUri(beezUPOrderId)}/history/${getEncodedUri(orderChangeExecutionUUID)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChangeOrderReporting response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Set an Order's merchant information
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + testMode - If true, the operation will be not be sent to marketplace. But the validation will be taken in account. 
    # + return - Set Order merchant order info accepted 
    remote isolated function setMerchantOrderInfoV3(string marketplaceTechnicalCode, int accountId, string beezUPOrderId, SetMerchantOrderInfoRequest payload, boolean testMode = false) returns http:Response|error {
        string resourcePath = string `/orders/v3/${getEncodedUri(marketplaceTechnicalCode)}/${getEncodedUri(accountId)}/${getEncodedUri(beezUPOrderId)}/setMerchantOrderInfo`;
        map<anydata> queryParam = {"testMode": testMode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Clear an Order's merchant information
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + testMode - If true, the operation will be not be sent to marketplace. But the validation will be taken in account. 
    # + return - Clear Order merchant order info accepted 
    remote isolated function clearMerchantOrderInfoV3(string marketplaceTechnicalCode, int accountId, string beezUPOrderId, boolean testMode = false) returns http:Response|error {
        string resourcePath = string `/orders/v3/${getEncodedUri(marketplaceTechnicalCode)}/${getEncodedUri(accountId)}/${getEncodedUri(beezUPOrderId)}/clearMerchantOrderInfo`;
        map<anydata> queryParam = {"testMode": testMode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Send a batch of operations to set an Order's merchant information  (max 100 items per call)
    #
    # + testMode - If true, the operation will be not be sent to marketplace. But the validation will be taken in account. 
    # + return - Succesfully received and processed batched operations. Please check response to see the status per operation. 
    remote isolated function setMerchantOrderInfoListV3(SetMerchantOrderInfoListRequest payload, boolean testMode = false) returns BatchOrderOperationResponse|error {
        string resourcePath = string `/orders/v3/batches/setMerchantOrderInfos`;
        map<anydata> queryParam = {"testMode": testMode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchOrderOperationResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Send a batch of operations to clear an Order's merchant information (max 100 items per call)
    #
    # + testMode - If true, the operation will be not be sent to marketplace. But the validation will be taken in account. 
    # + return - Succesfully received and processed batched operations. Please check response to see the status per operation. 
    remote isolated function clearMerchantOrderInfoListV3(ClearMerchantOrderInfoListRequest payload, boolean testMode = false) returns BatchOrderOperationResponse|error {
        string resourcePath = string `/orders/v3/batches/clearMerchantOrderInfos`;
        map<anydata> queryParam = {"testMode": testMode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchOrderOperationResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Send a batch of operations to change your marketplace Order information: accept, ship, etc.  (max 100 items per call)
    #
    # + userName - Sometimes the user in the e-commerce application is not the same as user associated with the current subscription key. We recommend providing your application's user login. 
    # + testMode - If true, the operation will be not be sent to marketplace. But the validation will be taken in account. 
    # + changeOrderType - The Order change type 
    # + return - Succesfully received and processed batched operations. Please check response to see the status per operation. 
    remote isolated function changeOrderListV2(string userName, string changeOrderType, ChangeOrderListRequestV2 payload, boolean testMode = false) returns BatchOrderOperationResponse|error {
        string resourcePath = string `/orders/v3/batches/changeOrders/${getEncodedUri(changeOrderType)}`;
        map<anydata> queryParam = {"userName": userName, "testMode": testMode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchOrderOperationResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Send a batch of operations to change your marketplace Order information: accept, ship, etc.  (max 100 items per call)
    #
    # + userName - Sometimes the user in the e-commerce application is not the same as user associated with the current subscription key. We recommend providing your application's user login. 
    # + testMode - If true, the operation will be not be sent to marketplace. But the validation will be taken in account. 
    # + return - Succesfully received and processed batched operations. Please check response to see the status per operation. 
    remote isolated function changeOrderListV3(string userName, ChangeOrderListRequest payload, boolean testMode = false) returns BatchOrderOperationResponse|error {
        string resourcePath = string `/orders/v3/batches/changeOrders`;
        map<anydata> queryParam = {"userName": userName, "testMode": testMode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchOrderOperationResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the subscription list
    #
    # + return - The subscription list 
    remote isolated function getSubscriptionList() returns SubscriptionIndex[]|error {
        string resourcePath = string `/v2/user/marketplaces/orders/subscriptions/`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SubscriptionIndex[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a subscription to the orders
    #
    # + return - Subscription info 
    remote isolated function getSubscription(string id) returns SubscriptionIndex|error {
        string resourcePath = string `/v2/user/marketplaces/orders/subscriptions/${getEncodedUri(id)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SubscriptionIndex response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Creates a subscription to the orders
    #
    # + return - Subscription creation accepted 
    remote isolated function createSubscription(string id, CreateSubscriptionRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/marketplaces/orders/subscriptions/${getEncodedUri(id)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a subscription to the orders
    #
    # + return - Subscription deletion accepted 
    remote isolated function deleteSubscription(string id) returns http:Response|error {
        string resourcePath = string `/v2/user/marketplaces/orders/subscriptions/${getEncodedUri(id)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get the push reporting related to this subscription
    #
    # + return - Subscription push reporting info 
    remote isolated function getSubscriptionPushReporting(string id, int? pageNumber = (), int? pageSize = ()) returns SubscriptionPushReporting[]|error {
        string resourcePath = string `/v2/user/marketplaces/orders/subscriptions/${getEncodedUri(id)}/reporting`;
        map<anydata> queryParam = {"pageNumber": pageNumber, "pageSize": pageSize};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SubscriptionPushReporting[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Activate a subscription to the orders
    #
    # + return - Subscription activation accepted 
    remote isolated function activateSubscription(string id, ActivateSubscriptionRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/marketplaces/orders/subscriptions/${getEncodedUri(id)}/activate`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Deactivate a subscription to the orders
    #
    # + return - Subscription deactivation accepted 
    remote isolated function deactivateSubscription(string id) returns http:Response|error {
        string resourcePath = string `/v2/user/marketplaces/orders/subscriptions/${getEncodedUri(id)}/deactivate`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Force retry push orders immediatly
    #
    # + return - Retry push orders request accepted 
    remote isolated function retryPushOrders(string id) returns http:Response|error {
        string resourcePath = string `/v2/user/marketplaces/orders/subscriptions/${getEncodedUri(id)}/retry`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Order Invoice general settings
    #
    # + return - Settings successfully retrieved 
    remote isolated function getOrderInvoiceGeneralSettings() returns GetOrderInvoiceGeneralSettingsResponse|error {
        string resourcePath = string `/v2/user/marketplaces/orders/invoices/settings/general`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetOrderInvoiceGeneralSettingsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Save Order Invoice general settings
    #
    # + return - General Settings successfully saved 
    remote isolated function saveOrderInvoiceGeneralSettings(OrderInvoiceGeneralSettings payload) returns http:Response|error {
        string resourcePath = string `/v2/user/marketplaces/orders/invoices/settings/general`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Order Invoice design settings
    #
    # + return - Design successfully retrieved 
    remote isolated function getOrderInvoiceDesignSettings() returns OrderInvoiceDesignSettings|error {
        string resourcePath = string `/v2/user/marketplaces/orders/invoices/settings/design`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        OrderInvoiceDesignSettings response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Save Order Invoice design settings
    #
    # + return - Design successfully saved 
    remote isolated function saveOrderInvoiceDesignSettings(OrderInvoiceDesignSettings payload) returns http:Response|error {
        string resourcePath = string `/v2/user/marketplaces/orders/invoices/settings/design`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # View a preview an Order Invoice using custom design settings
    #
    # + acceptEncoding - Allows the client to indicate wether it accepts a compressed encoding to reduce traffic size 
    # + return - Design Preview successfully retrieved 
    remote isolated function getOrderInvoiceDesignSettingsPreview(string acceptEncoding, OrderInvoiceDesignSettings payload) returns GetOrderInvoiceDesignPreviewResponse|error {
        string resourcePath = string `/v2/user/marketplaces/orders/invoices/settings/design/preview`;
        map<any> headerValues = {"Accept-Encoding": acceptEncoding, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetOrderInvoiceDesignPreviewResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Generate an Order Invoice
    #
    # + marketplaceTechnicalCode - The Marketplace Technical Code 
    # + accountId - The Account Identifier 
    # + beezUPOrderUUID - The BeezUP Order UUID 
    # + userName - Sometimes the user in the e-commerce application is not the same as user associated with the current subscription key. We recommend providing your application's user login. 
    # + return - Request Accepted. 
    remote isolated function generateOrderInvoice(string marketplaceTechnicalCode, string accountId, string beezUPOrderUUID, string userName, GenerateOrderInvoiceRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/marketplaces/orders/invoices/${getEncodedUri(marketplaceTechnicalCode)}/${getEncodedUri(accountId)}/${getEncodedUri(beezUPOrderUUID)}/generate`;
        map<anydata> queryParam = {"userName": userName};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # View a preview an Order Invoice
    #
    # + marketplaceTechnicalCode - The Marketplace Technical Code 
    # + accountId - The Account Identifier 
    # + beezUPOrderUUID - The BeezUP Order UUID 
    # + acceptEncoding - Allows the client to indicate wether it accepts a compressed encoding to reduce traffic size 
    # + return - Order Invoice preview successfully returned. 
    remote isolated function getOrderInvoicePreview(string marketplaceTechnicalCode, string accountId, string beezUPOrderUUID, string acceptEncoding, PreviewOrderInvoiceRequest payload) returns PreviewOrderInvoiceResponse|error {
        string resourcePath = string `/v2/user/marketplaces/orders/invoices/${getEncodedUri(marketplaceTechnicalCode)}/${getEncodedUri(accountId)}/${getEncodedUri(beezUPOrderUUID)}/preview`;
        map<any> headerValues = {"Accept-Encoding": acceptEncoding, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PreviewOrderInvoiceResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns the PDF version of the invoice
    #
    # + return - The PDF version of the HTML invoice URL in the request 
    remote isolated function getOrderInvoicePdf(GetOrderInvoicePdfFromHtmlInvoiceUrlRequest payload) returns string|error {
        string resourcePath = string `/v2/user/marketplaces/orders/invoices/getPdfInvoice`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the Analytics API operation index
    #
    # + return - Analytics API operation index 
    remote isolated function analyticsIndex() returns AnalyticsIndex|error {
        string resourcePath = string `/v2/user/analytics/`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AnalyticsIndex response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the Analytics API operation index for one store
    #
    # + storeId - Your store identifier 
    # + return - Analytics API operation index for one store 
    remote isolated function analyticsStoreIndex(string storeId) returns AnalyticsStoreIndex|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AnalyticsStoreIndex response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the global synchronization status of clicks and orders
    #
    # + return - The tracking status informations 
    remote isolated function getTrackingStatus() returns TrackingStatus|error {
        string resourcePath = string `/v2/user/analytics/tracking/status`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TrackingStatus response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the synchronization status of clicks and orders of a store
    #
    # + storeId - Your store identifier 
    # + return - Store Tracking Status 
    remote isolated function getStoreTrackingStatus(string storeId) returns StoreTrackingStatus|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/tracking/status`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        StoreTrackingStatus response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the latest tracked clicks
    #
    # + storeId - Your store identifier 
    # + count - The amount of clicks to retrieve 
    # + return - Click list 
    remote isolated function getStoreTrackedClicks(string storeId, int count = 100) returns TrackedClicks|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/tracking/clicks`;
        map<anydata> queryParam = {"count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TrackedClicks response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the latest tracked orders
    #
    # + storeId - Your store identifier 
    # + count - The amount of orders to retrieve 
    # + return - Order list 
    remote isolated function getStoreTrackedOrders(string storeId, int count = 100) returns TrackedOrders|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/tracking/orders`;
        map<anydata> queryParam = {"count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TrackedOrders response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the latest tracked external orders
    #
    # + storeId - Your store identifier 
    # + count - The amount of external orders to retrieve 
    # + return - External Order list 
    remote isolated function getStoreTrackedExternalOrders(string storeId, int count = 100) returns TrackedExternalOrders|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/tracking/externalorders`;
        map<anydata> queryParam = {"count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TrackedExternalOrders response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the report by day for a StoreId
    #
    # + return - Your reporting by day 
    remote isolated function getStoreReportByDayPerStore(ReportByDayRequest payload) returns ReportByDayPerStoreResponse|error {
        string resourcePath = string `/v2/user/analytics/reports/byday`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ReportByDayPerStoreResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the report by day for a StoreId
    #
    # + storeId - Your store identifier 
    # + return - Your reporting by day 
    remote isolated function getStoreReportByDay(string storeId, ReportByDayRequest payload) returns ReportByDayResponse|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/reports/byday`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ReportByDayResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the report by channel
    #
    # + storeId - Your store identifier 
    # + return - Your reporting by channel 
    remote isolated function getStoreReportByChannel(string storeId, ReportByChannelRequest payload) returns ReportByChannelResponse|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/reports/bychannel`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ReportByChannelResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the report by category
    #
    # + storeId - Your store identifier 
    # + return - Your reporting by channel 
    remote isolated function getStoreReportByCategory(string storeId, ReportByCategoryRequest payload) returns ReportByCategoryResponse|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/reports/bycategory`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ReportByCategoryResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the report by product
    #
    # + storeId - Your store identifier 
    # + return - Your reporting by product 
    remote isolated function getStoreReportByProduct(string storeId, ReportByProductRequest payload) returns ReportByProductResponse|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/reports/byproduct`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ReportByProductResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Optimise all products
    #
    # + storeId - Your store identifier 
    # + return - Products optimisatized 
    remote isolated function optimiseAll(string storeId, string actionName, OptimiseAllRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/optimisations/all/${getEncodedUri(actionName)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Optimise products by page
    #
    # + storeId - Your store identifier 
    # + return - Products optimisatized 
    remote isolated function optimise(string storeId, string actionName, OptimiseRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/optimisations/${getEncodedUri(actionName)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Optimise products by channel
    #
    # + storeId - Your store identifier 
    # + channelId - The channel identifier concerned by this optimisation 
    # + return - Products optimisatized 
    remote isolated function optimiseByChannel(string storeId, string channelId, string actionName) returns http:Response|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/optimisations/bychannel/${getEncodedUri(channelId)}/${getEncodedUri(actionName)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Optimise products by category
    #
    # + storeId - Your store identifier 
    # + catalogCategoryId - The category identifier concerned by this optimisation 
    # + payload - The channel identifier list concerned by this optimisation 
    # + return - Products optimisatized 
    remote isolated function optimiseByCategory(string storeId, string catalogCategoryId, string actionName, string[] payload) returns http:Response|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/optimisations/bycategory/${getEncodedUri(catalogCategoryId)}/${getEncodedUri(actionName)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Optimise product
    #
    # + storeId - Your store identifier 
    # + productId - The product identifier concerned by this optimisation 
    # + payload - The channel identifier list concerned by this optimisation 
    # + return - Product(s) optimisatized 
    remote isolated function optimiseByProduct(string storeId, string productId, string actionName, string[] payload) returns http:Response|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/optimisations/byproduct/${getEncodedUri(productId)}/${getEncodedUri(actionName)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Copy product optimisations between 2 channels
    #
    # + storeId - Your store identifier 
    # + return - Products optimisatisation copied 
    remote isolated function copyOptimisation(string storeId, CopyOptimisationRequest payload) returns CopyOptimisationResponse|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/optimisations/copy`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CopyOptimisationResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get report filter list for the given store
    #
    # + storeId - Your store identifier 
    # + return - Report filter list 
    remote isolated function getReportFilters(string storeId) returns ReportFilterList|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/reports/filters`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ReportFilterList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the report filter description
    #
    # + storeId - Your store identifier 
    # + reportFilterId - Your report filter identifier 
    # + return - Report filter 
    remote isolated function getReportFilter(string storeId, string reportFilterId) returns ReportFilter|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/reports/filters/${getEncodedUri(reportFilterId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ReportFilter response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Save the report filter
    #
    # + storeId - Your store identifier 
    # + reportFilterId - Your report filter identifier 
    # + return - Report filter saved 
    remote isolated function saveReportFilter(string storeId, string reportFilterId, SaveReportFilterRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/reports/filters/${getEncodedUri(reportFilterId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete the report filter
    #
    # + storeId - Your store identifier 
    # + reportFilterId - Your report filter identifier 
    # + return - Report filter deleted 
    remote isolated function deleteReportFilter(string storeId, string reportFilterId) returns http:Response|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/reports/filters/${getEncodedUri(reportFilterId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Gets the list of rules for a given store
    #
    # + storeId - Your store identifier 
    # + return - Rule list 
    remote isolated function getRules(string storeId) returns RuleList|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/rules`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RuleList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Rule creation
    #
    # + storeId - Your store identifier 
    # + return - Rule created 
    remote isolated function createRule(string storeId, CreateRuleRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/rules`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Gets the rule
    #
    # + storeId - Your store identifier 
    # + ruleId - Your rule identifier 
    # + return - Get Rule 
    remote isolated function getRule(string storeId, string ruleId) returns Rule|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/rules/${getEncodedUri(ruleId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Rule response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Rule
    #
    # + storeId - Your store identifier 
    # + ruleId - Your rule identifier 
    # + return - Rule deleted 
    remote isolated function deleteRule(string storeId, string ruleId) returns http:Response|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/rules/${getEncodedUri(ruleId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Update Rule
    #
    # + storeId - Your store identifier 
    # + ruleId - Your rule identifier 
    # + return - Rule updated 
    remote isolated function updateRule(string storeId, string ruleId, UpdateRuleRequest payload) returns http:Response|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/rules/${getEncodedUri(ruleId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Move the rule up
    #
    # + storeId - Your store identifier 
    # + ruleId - Your rule identifier 
    # + return - Rule moved up 
    remote isolated function moveUpRule(string storeId, string ruleId) returns http:Response|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/rules/${getEncodedUri(ruleId)}/moveup`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Move the rule down
    #
    # + storeId - Your store identifier 
    # + ruleId - Your rule identifier 
    # + return - Rule moved down 
    remote isolated function moveDownRule(string storeId, string ruleId) returns http:Response|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/rules/${getEncodedUri(ruleId)}/movedown`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Enable rule
    #
    # + storeId - Your store identifier 
    # + ruleId - Your rule identifier 
    # + return - Rune enabled 
    remote isolated function enableRule(string storeId, string ruleId) returns http:Response|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/rules/${getEncodedUri(ruleId)}/enable`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Disable rule
    #
    # + storeId - Your store identifier 
    # + ruleId - Your rule identifier 
    # + return - Rule disabled 
    remote isolated function disableRule(string storeId, string ruleId) returns http:Response|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/rules/${getEncodedUri(ruleId)}/disable`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Run all rules for this store
    #
    # + storeId - Your store identifier 
    # + return - All rules executed. 
    remote isolated function runRules(string storeId) returns http:Response|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/rules/run`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Run rule
    #
    # + storeId - Your store identifier 
    # + ruleId - Your rule identifier 
    # + return - Rule executed 
    remote isolated function runRule(string storeId, string ruleId) returns http:Response|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/rules/${getEncodedUri(ruleId)}/run`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the rules execution history
    #
    # + storeId - Your store identifier 
    # + pageNumber - The page to retrieve 
    # + pageSize - The count of rule history to retrieve 
    # + return - Rules executions list 
    remote isolated function getRulesExecutions(string storeId, int pageNumber, int pageSize) returns RuleExecutionReportings|error {
        string resourcePath = string `/v2/user/analytics/${getEncodedUri(storeId)}/rules/executions`;
        map<anydata> queryParam = {"pageNumber": pageNumber, "pageSize": pageSize};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RuleExecutionReportings response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all your current channel catalogs configured to use legacy tracking format
    #
    # + storeId - The store identifier 
    # + return - OK 
    remote isolated function getLegacyTrackingChannelCatalogs(string? storeId = ()) returns LegacyTrackingChannelCatalogList|error {
        string resourcePath = string `/v2/user/legacyTracking/channelCatalogs/`;
        map<anydata> queryParam = {"storeId": storeId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LegacyTrackingChannelCatalogList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the channel catalog configured to use legacy tracking format information
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog configured to use legacy tracking format 
    remote isolated function getLegacyTrackingChannelCatalog(string channelCatalogId) returns LegacyTrackingChannelCatalog|error {
        string resourcePath = string `/v2/user/legacyTracking/channelCatalogs/${getEncodedUri(channelCatalogId)}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LegacyTrackingChannelCatalog response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Migrate a channel catalog to current tracking format
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog migrated 
    remote isolated function migrateLegacyTrackingChannelCatalog(string channelCatalogId) returns http:Response|error {
        string resourcePath = string `/v2/user/legacyTracking/channelCatalogs/${getEncodedUri(channelCatalogId)}/migrate`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
