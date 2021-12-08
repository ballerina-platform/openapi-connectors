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
    }
    # Login
    #
    # + return - Your tokens 
    remote isolated function login(LoginRequest payload) returns ApiCredentials|error {
        string path = string `/v2/public/security/login`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ApiCredentials response = check self.clientEp->post(path, request, headers = accHeaders, targetType = ApiCredentials);
        return response;
    }
    # User Registration
    #
    # + return - Customer registered 
    remote isolated function register(RegisterRequest payload) returns http:Response|error {
        string path = string `/v2/public/security/register`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Lost password
    #
    # + payload - Your email 
    # + return - New password sent 
    remote isolated function lostPassword(BeezupCommonEmail payload) returns http:Response|error {
        string path = string `/v2/public/security/lostpassword`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get public channel index
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Channel list regrouped by country and links to list of values 
    remote isolated function getChannelsIndex(string? ifNoneMatch = ()) returns PublicChannelIndex|error {
        string path = string `/v2/public/channels/`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PublicChannelIndex response = check self.clientEp->get(path, accHeaders, targetType = PublicChannelIndex);
        return response;
    }
    # The channel list for one country
    #
    # + countryIsoCode - The country iso code alpha 3 based on this: https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3#Decoding_table \ To know which country are available you have to use the operation: GetChannelsByCountry 
    # + acceptEncoding - Allows the client to indicate whether it accepts a compressed encoding to reduce traffic size. 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - The channel list for one country 
    remote isolated function getChannels(string countryIsoCode, string[] acceptEncoding, string? ifNoneMatch = ()) returns PublicChannelInfoList|error {
        string path = string `/v2/public/channels/${countryIsoCode}`;
        map<any> headerValues = {"Accept-Encoding": acceptEncoding, "If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PublicChannelInfoList response = check self.clientEp->get(path, accHeaders, targetType = PublicChannelInfoList);
        return response;
    }
    # Get all list names
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Get the list names 
    remote isolated function getPublicLovIndex(string? ifNoneMatch = ()) returns PublicLovIndex|error {
        string path = string `/v2/public/lov/`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PublicLovIndex response = check self.clientEp->get(path, accHeaders, targetType = PublicLovIndex);
        return response;
    }
    # Get all list names
    #
    # + return - Get the list names 
    remote isolated function getUserLovIndex() returns UserLovIndex|error {
        string path = string `/v2/user/lov/`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UserLovIndex response = check self.clientEp->get(path, accHeaders, targetType = UserLovIndex);
        return response;
    }
    # The index of all operations and LOV
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - OK 
    remote isolated function getCustomerIndex(string? ifNoneMatch = ()) returns CustomerIndex|error {
        string path = string `/v2/user/customer/`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CustomerIndex response = check self.clientEp->get(path, accHeaders, targetType = CustomerIndex);
        return response;
    }
    # Get user account information
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - User account information 
    remote isolated function getUserAccountInfo(string? ifNoneMatch = ()) returns AccountInfo|error {
        string path = string `/v2/user/customer/account`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AccountInfo response = check self.clientEp->get(path, accHeaders, targetType = AccountInfo);
        return response;
    }
    # Resend email activation
    #
    # + return - Email activation resent 
    remote isolated function resendEmailActivation() returns http:Response|error {
        string path = string `/v2/user/customer/account/resendEmailActivation`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Activate the user account
    #
    # + payload - The email activation id received by email. 
    # + return - User account activated. 
    remote isolated function activateUserAccount(string payload) returns http:Response|error {
        string path = string `/v2/user/customer/account/activate`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Save user personal information
    #
    # + return - User account information updated 
    remote isolated function savePersonalInfo(PersonalInfo payload) returns http:Response|error {
        string path = string `/v2/user/customer/account/personalInfo`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Change company information
    #
    # + return - Company information saved 
    remote isolated function saveCompanyInfo(CompanyInfo payload) returns http:Response|error {
        string path = string `/v2/user/customer/account/companyInfo`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get profile picture information
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Profile picture information 
    remote isolated function getProfilePictureInfo(string? ifNoneMatch = ()) returns ProfilePictureInfoResponse|error {
        string path = string `/v2/user/customer/account/profilePictureInfo`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ProfilePictureInfoResponse response = check self.clientEp->get(path, accHeaders, targetType = ProfilePictureInfoResponse);
        return response;
    }
    # Change user picture information
    #
    # + return - User profile picture information saved. 
    remote isolated function saveProfilePictureInfo(ProfilePictureInfo payload) returns http:Response|error {
        string path = string `/v2/user/customer/account/profilePictureInfo`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get credit card information
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - User credit card information 
    remote isolated function getCreditCardInfo(string? ifNoneMatch = ()) returns CreditCardInfoResponse|error {
        string path = string `/v2/user/customer/account/creditCardInfo`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CreditCardInfoResponse response = check self.clientEp->get(path, accHeaders, targetType = CreditCardInfoResponse);
        return response;
    }
    # Save user credit card info
    #
    # + payload - Credit card info 
    # + return - The credit card information has been accepted for processing, the authorization will be processed shortly. 
    remote isolated function saveCreditCardInfo(CreditCardInfo payload) returns http:Response|error {
        string path = string `/v2/user/customer/account/creditCardInfo`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Change user email
    #
    # + return - Email updated 
    remote isolated function changeEmail(ChangeEmailRequest payload) returns http:Response|error {
        string path = string `/v2/user/customer/account/changeEmail`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Change user password
    #
    # + return - Password updated 
    remote isolated function changePassword(ChangePasswordRequest payload) returns http:Response|error {
        string path = string `/v2/user/customer/account/changePassword`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Log out the current user from go2
    #
    # + return - User logout 
    remote isolated function logout() returns http:Response|error {
        string path = string `/v2/user/customer/security/logout`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Zendesk token
    #
    # + return - A JWT token to connect the Zendesk Web Widget 
    remote isolated function zendeskToken() returns ZendeskToken|error {
        string path = string `/v2/user/customer/zendeskToken`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ZendeskToken response = check self.clientEp->get(path, accHeaders, targetType = ZendeskToken);
        return response;
    }
    # Get store list
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Store list 
    remote isolated function getStores(string? ifNoneMatch = ()) returns StoreList|error {
        string path = string `/v2/user/customer/stores`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        StoreList response = check self.clientEp->get(path, accHeaders, targetType = StoreList);
        return response;
    }
    # Create a new store
    #
    # + return - The store has been created successfully. The http header Location contains the new resource url. The body contains the link to the new resource. 
    remote isolated function createStore(CreateStoreRequest payload) returns LinksGetstorelink|error {
        string path = string `/v2/user/customer/stores`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LinksGetstorelink response = check self.clientEp->post(path, request, headers = accHeaders, targetType = LinksGetstorelink);
        return response;
    }
    # Get store's information
    #
    # + storeId - Your store identifier 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - The store information 
    remote isolated function getStore(string storeId, string? ifNoneMatch = ()) returns Store|error {
        string path = string `/v2/user/customer/stores/${storeId}`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Store response = check self.clientEp->get(path, accHeaders, targetType = Store);
        return response;
    }
    # Delete a store
    #
    # + storeId - Your store identifier 
    # + return - Store deleted 
    remote isolated function deleteStore(string storeId) returns http:Response|error {
        string path = string `/v2/user/customer/stores/${storeId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Update some store's information.
    #
    # + storeId - Your store identifier 
    # + return - Store updated 
    remote isolated function updateStore(string storeId, UpdateStoreRequest payload) returns http:Response|error {
        string path = string `/v2/user/customer/stores/${storeId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get store's rights
    #
    # + storeId - Your store identifier 
    # + return - The store's rights 
    remote isolated function getRights(string storeId) returns FunctionalityRightInfo[]|error {
        string path = string `/v2/user/customer/stores/${storeId}/rights`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FunctionalityRightInfo[] response = check self.clientEp->get(path, accHeaders, targetType = FunctionalityRightInfoArr);
        return response;
    }
    # Get store's alerts
    #
    # + storeId - Your store identifier 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - User account alerts information 
    remote isolated function getStoreAlerts(string storeId, string? ifNoneMatch = ()) returns StoreAlerts|error {
        string path = string `/v2/user/customer/stores/${storeId}/alerts`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        StoreAlerts response = check self.clientEp->get(path, accHeaders, targetType = StoreAlerts);
        return response;
    }
    # Save store alerts
    #
    # + storeId - Your store identifier 
    # + return - Store alerts saved 
    remote isolated function saveStoreAlerts(string storeId, SaveStoreAlertsRequest payload) returns http:Response|error {
        string path = string `/v2/user/customer/stores/${storeId}/alerts`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get shares related to this store
    #
    # + storeId - Your store identifier 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - The sharing list of the store 
    remote isolated function getStoreShares(string storeId, string? ifNoneMatch = ()) returns StoreShares|error {
        string path = string `/v2/user/customer/stores/${storeId}/shares`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        StoreShares response = check self.clientEp->get(path, accHeaders, targetType = StoreShares);
        return response;
    }
    # Share a store to another user
    #
    # + storeId - Your store identifier 
    # + payload - Your friend's email 
    # + return - Store shared 
    remote isolated function shareStore(string storeId, FriendEmail payload) returns http:Response|error {
        string path = string `/v2/user/customer/stores/${storeId}/shares`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Delete a share of a store to another user
    #
    # + storeId - Your store identifier 
    # + userId - The friend user id 
    # + return - Share deleted 
    remote isolated function deleteStoreShare(string storeId, string userId) returns http:Response|error {
        string path = string `/v2/user/customer/stores/${storeId}/shares/${userId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Get friend information
    #
    # + userId - Your friend user id 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Get friend info 
    remote isolated function getFriendInfo(string userId, string? ifNoneMatch = ()) returns UserFriendInfo|error {
        string path = string `/v2/user/customer/friends/${userId}`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UserFriendInfo response = check self.clientEp->get(path, accHeaders, targetType = UserFriendInfo);
        return response;
    }
    # Get billing periods conditions
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Get the billing periods conditions 
    remote isolated function getBillingPeriods(string? ifNoneMatch = ()) returns BillingPeriodList|error {
        string path = string `/v2/user/customer/billingPeriods`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BillingPeriodList response = check self.clientEp->get(path, accHeaders, targetType = BillingPeriodList);
        return response;
    }
    # Get all standard offers
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Get all standard offers 
    remote isolated function getStandardOffers(string? ifNoneMatch = ()) returns StandardOffers|error {
        string path = string `/v2/user/customer/offers`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        StandardOffers response = check self.clientEp->get(path, accHeaders, targetType = StandardOffers);
        return response;
    }
    # Get offer pricing
    #
    # + return - Get the offer proposal considering your current contract 
    remote isolated function getOffer(OfferRequest payload) returns Offer|error {
        string path = string `/v2/user/customer/offers`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Offer response = check self.clientEp->post(path, request, headers = accHeaders, targetType = Offer);
        return response;
    }
    # Get contract list
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Contract list 
    remote isolated function getContracts(string? ifNoneMatch = ()) returns Contracts|error {
        string path = string `/v2/user/customer/contracts`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Contracts response = check self.clientEp->get(path, accHeaders, targetType = Contracts);
        return response;
    }
    # Create a new contract
    #
    # + return - New contract has been created. Some warnings can be present in response. 
    remote isolated function createContract(CreateContract payload) returns CreateContractResponse|error {
        string path = string `/v2/user/customer/contracts`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateContractResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType = CreateContractResponse);
        return response;
    }
    # Schedule termination of your current contract at the end of the commitment.
    #
    # + payload - Indicate the termination reason 
    # + return - Your current contract termination has been scheduled 
    remote isolated function terminateCurrentContract(TerminateContract payload) returns http:Response|error {
        string path = string `/v2/user/customer/contracts/current/disableAutoRenewal`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Reactivate your terminated contract.
    #
    # + return - Your current contract has been resumed 
    remote isolated function reactivateCurrentContract() returns http:Response|error {
        string path = string `/v2/user/customer/contracts/current/reenableAutoRenewal`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Delete your next contract
    #
    # + return - Next contract has been deleted 
    remote isolated function deleteNextContract() returns http:Response|error {
        string path = string `/v2/user/customer/contracts/next`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Get all your invoices
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Get all invoices of a customer 
    remote isolated function getInvoices(string? ifNoneMatch = ()) returns InvoiceList|error {
        string path = string `/v2/user/customer/invoices`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InvoiceList response = check self.clientEp->get(path, accHeaders, targetType = InvoiceList);
        return response;
    }
    # Get the index of the catalog API
    #
    # + return - OK 
    remote isolated function catalogIndex() returns CatalogIndex|error {
        string path = string `/v2/user/catalogs/`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CatalogIndex response = check self.clientEp->get(path, accHeaders, targetType = CatalogIndex);
        return response;
    }
    # Get the BeezUP columns
    #
    # + return - The catalog API index 
    remote isolated function catalogGetbeezupcolumns() returns BeezUPColumnConfiguration[]|error {
        string path = string `/v2/user/catalogs/beezupColumns`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BeezUPColumnConfiguration[] response = check self.clientEp->get(path, accHeaders, targetType = BeezUPColumnConfigurationArr);
        return response;
    }
    # Get the index of the catalog API for this store
    #
    # + storeId - Your store identifier 
    # + return - The catalog index 
    remote isolated function catalogStoreIndex(string storeId) returns CatalogStoreIndex|error {
        string path = string `/v2/user/catalogs/${storeId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CatalogStoreIndex response = check self.clientEp->get(path, accHeaders, targetType = CatalogStoreIndex);
        return response;
    }
    # Get the last input configuration
    #
    # + storeId - Your store identifier 
    # + return - OK 
    remote isolated function importationGetmanualupdatelastinputconfig(string storeId) returns LastManualImportInputConfiguration|error {
        string path = string `/v2/user/catalogs/${storeId}/inputConfiguration`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        LastManualImportInputConfiguration response = check self.clientEp->get(path, accHeaders, targetType = LastManualImportInputConfiguration);
        return response;
    }
    # Get catalog column list
    #
    # + storeId - Your store identifier 
    # + return - Catalog column list 
    remote isolated function catalogGetcatalogcolumns(string storeId) returns CatalogColumnList|error {
        string path = string `/v2/user/catalogs/${storeId}/catalogColumns`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CatalogColumnList response = check self.clientEp->get(path, accHeaders, targetType = CatalogColumnList);
        return response;
    }
    # Change Catalog Column User Name
    #
    # + storeId - Your store identifier 
    # + columnId - The catalog column identifier 
    # + return - Catalog column user name changed 
    remote isolated function catalogChangecatalogcolumnusername(string storeId, string columnId, ChangeUserColumnNameRequest payload) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/catalogColumns/${columnId}/rename`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get custom column list
    #
    # + storeId - Your store identifier 
    # + return - Custom column list 
    remote isolated function catalogGetcustomcolumns(string storeId) returns CustomColumnList|error {
        string path = string `/v2/user/catalogs/${storeId}/customColumns`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CustomColumnList response = check self.clientEp->get(path, accHeaders, targetType = CustomColumnList);
        return response;
    }
    # Create or replace a custom column
    #
    # + storeId - Your store identifier 
    # + columnId - The custom column identifier 
    # + return - Custom column saved 
    remote isolated function catalogSavecustomcolumn(string storeId, string columnId, CreateCustomColumnRequest payload) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/customColumns/${columnId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Delete custom column
    #
    # + storeId - Your store identifier 
    # + columnId - The custom column identifier 
    # + return - Custom column deleted 
    remote isolated function catalogDeletecustomcolumn(string storeId, string columnId) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/customColumns/${columnId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Change Custom Column User Name
    #
    # + storeId - Your store identifier 
    # + columnId - The custom column identifier 
    # + return - Custom column renamed 
    remote isolated function catalogChangecustomcolumnusername(string storeId, string columnId, ChangeUserColumnNameRequest payload) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/customColumns/${columnId}/rename`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get the encrypted custom column expression
    #
    # + storeId - Your store identifier 
    # + columnId - The custom column identifier 
    # + return - Encrypted expression 
    remote isolated function catalogGetcustomcolumnexpression(string storeId, string columnId) returns string|error {
        string path = string `/v2/user/catalogs/${storeId}/customColumns/${columnId}/expression`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(path, accHeaders, targetType = string);
        return response;
    }
    # Change custom column expression
    #
    # + storeId - Your store identifier 
    # + columnId - The custom column identifier 
    # + return - Custom column expression saved 
    remote isolated function catalogChangecustomcolumnexpression(string storeId, string columnId, ChangeCustomColumnExpressionRequest payload) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/customColumns/${columnId}/expression`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Compute the expression for this catalog.
    #
    # + storeId - Your store identifier 
    # + return - Compute an expression 
    remote isolated function catalogComputeexpression(string storeId, ComputeExpressionRequest payload) returns string|error {
        string path = string `/v2/user/catalogs/${storeId}/customColumns/computeExpression`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        string response = check self.clientEp->post(path, request, headers = accHeaders, targetType = string);
        return response;
    }
    # Get category list
    #
    # + storeId - Your store identifier 
    # + acceptEncoding - Indicates that the client accepts that the response will be compressed to reduce traffic size. 
    # + return - Categories 
    remote isolated function catalogGetcategories(string storeId, string[] acceptEncoding) returns CategoryList|error {
        string path = string `/v2/user/catalogs/${storeId}/categories`;
        map<any> headerValues = {"Accept-Encoding": acceptEncoding, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CategoryList response = check self.clientEp->get(path, accHeaders, targetType = CategoryList);
        return response;
    }
    # Get product list
    #
    # + storeId - Your store identifier 
    # + return - Product list 
    remote isolated function catalogGetproducts(string storeId, GetProductsRequest payload) returns ProductList|error {
        string path = string `/v2/user/catalogs/${storeId}/products/list`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProductList response = check self.clientEp->post(path, request, headers = accHeaders, targetType = ProductList);
        return response;
    }
    # Get random product list
    #
    # + storeId - Your store identifier 
    # + return - Random product list 
    remote isolated function catalogGetrandomproducts(string storeId) returns RandomProductList|error {
        string path = string `/v2/user/catalogs/${storeId}/products/random`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        RandomProductList response = check self.clientEp->get(path, accHeaders, targetType = RandomProductList);
        return response;
    }
    # Get product by ProductId
    #
    # + storeId - Your store identifier 
    # + productId - The product identifier you want to get 
    # + return - Product 
    remote isolated function catalogGetproductbyproductid(string storeId, string productId) returns Product|error {
        string path = string `/v2/user/catalogs/${storeId}/products/${productId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Product response = check self.clientEp->get(path, accHeaders, targetType = Product);
        return response;
    }
    # Get product by Sku
    #
    # + storeId - Your store identifier 
    # + sku - The product sku you want to get 
    # + return - Product 
    remote isolated function catalogGetproductbysku(string storeId, string sku) returns Product|error {
        string path = string `/v2/user/catalogs/${storeId}/products`;
        map<anydata> queryParam = {"sku": sku};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Product response = check self.clientEp->get(path, accHeaders, targetType = Product);
        return response;
    }
    # Get the latest catalog importation reporting for all your stores
    #
    # + return - The last importation reportings 
    remote isolated function importationGetreportingsallstores() returns ImportationsPerStoreResponse|error {
        string path = string `/v2/user/catalogs/importations`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ImportationsPerStoreResponse response = check self.clientEp->get(path, accHeaders, targetType = ImportationsPerStoreResponse);
        return response;
    }
    # Get the latest catalog importation reporting
    #
    # + storeId - Your store identifier 
    # + return - The last importation reportings 
    remote isolated function importationGetreportings(string storeId) returns ImportationsResponse|error {
        string path = string `/v2/user/catalogs/${storeId}/importations`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ImportationsResponse response = check self.clientEp->get(path, accHeaders, targetType = ImportationsResponse);
        return response;
    }
    # Start Manual Import
    #
    # + storeId - Your store identifier 
    # + return - Catalog importation started 
    remote isolated function importationStartmanualupdate(string storeId, StartManualImportRequest payload) returns LinksImportationGetimportationmonitoringlink|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/start`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LinksImportationGetimportationmonitoringlink response = check self.clientEp->post(path, request, headers = accHeaders, targetType = LinksImportationGetimportationmonitoringlink);
        return response;
    }
    # Get the importation status
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + return - OK 
    remote isolated function importationGetimportationmonitoring(string storeId, string executionId) returns ImportationMonitoring|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ImportationMonitoring response = check self.clientEp->get(path, accHeaders, targetType = ImportationMonitoring);
        return response;
    }
    # Cancel importation
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + return - Catalog importation canceled 
    remote isolated function importationCancel(string storeId, string executionId) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/cancel`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get technical progression
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + return - When the technical progression is correctly retrived 
    remote isolated function importationTechnicalprogression(string storeId, string executionId) returns ImportationTechnicalProgression|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/technicalProgression`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ImportationTechnicalProgression response = check self.clientEp->get(path, accHeaders, targetType = ImportationTechnicalProgression);
        return response;
    }
    # Configure remaining catalog columns
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + return - Remaining catalog columns have been configured. This operation has no impact on the current catalog until you commit the catalog importation. 
    remote isolated function importationConfigureremainingcatalogcolumns(string storeId, string executionId) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/configureRemainingCatalogColumns`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Commit columns
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + return - Columns configuration have been committed. This operation has no impact on the current catalog until you commit the catalog importation. 
    remote isolated function importationCommitcolumns(string storeId, string executionId) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/commitColumns`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Commit Importation
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + return - Catalog importation committed 
    remote isolated function importationCommit(string storeId, string executionId) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/commit`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get the product sample related to this importation with all columns (catalog and custom)
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + productSampleIndex - Index of the product sample. Starting from 0 to 99. 
    # + return - OK 
    remote isolated function importationGetproductsample(string storeId, string executionId, int productSampleIndex) returns ProductSample|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/productSamples/${productSampleIndex}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ProductSample response = check self.clientEp->get(path, accHeaders, targetType = ProductSample);
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
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/productSamples/${productSampleIndex}/customColumns/${columnId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(path, accHeaders, targetType = string);
        return response;
    }
    # Get detected catalog columns during this importation.
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + return - OK 
    remote isolated function importationGetdetectedcatalogcolumns(string storeId, string executionId) returns DetectedCatalogColumnList|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/catalogColumns`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DetectedCatalogColumnList response = check self.clientEp->get(path, accHeaders, targetType = DetectedCatalogColumnList);
        return response;
    }
    # Configure catalog column
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + columnId - The custom column identifier 
    # + return - Catalog column configured. This operation has no impact on the current catalog until you commit the catalog importation. 
    remote isolated function importationConfigurecatalogcolumn(string storeId, string executionId, string columnId, ConfigureCatalogColumnCatalogRequest payload) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/catalogColumns/${columnId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Ignore Column
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + columnId - The custom column identifier 
    # + return - Catalog column ignored. This operation has no impact on the current catalog until you commit the catalog importation. 
    remote isolated function importationIgnorecolumn(string storeId, string executionId, string columnId) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/catalogColumns/${columnId}/ignore`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Reattend Column
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + columnId - The custom column identifier 
    # + return - Catalog column reattended. This operation has no impact on the current catalog until you commit the catalog importation. 
    remote isolated function importationReattendcolumn(string storeId, string executionId, string columnId) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/catalogColumns/${columnId}/reattend`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Map catalog column to a BeezUP column
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + columnId - The catalog column identifier 
    # + return - Catalog column mapped. This operation has no impact on the current catalog until you commit the catalog importation. 
    remote isolated function importationMapcatalogcolumn(string storeId, string executionId, string columnId, MapBeezUPColumnRequest payload) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/catalogColumns/${columnId}/map`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Unmap catalog column
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + columnId - The catalog column identifier 
    # + return - Catalog Column unmapped. This operation has no impact on the current catalog until you commit the catalog importation. 
    remote isolated function importationUnmapcatalogcolumn(string storeId, string executionId, string columnId) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/catalogColumns/${columnId}/unmap`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get custom columns currently place in this importation
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + return - Custom columns of current Importation successfully retrieved 
    remote isolated function importationGetcustomcolumns(string storeId, string executionId) returns ImportationCustomColumnList|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/customColumns`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ImportationCustomColumnList response = check self.clientEp->get(path, accHeaders, targetType = ImportationCustomColumnList);
        return response;
    }
    # Get the encrypted custom column expression in this importation
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + columnId - The custom column identifier 
    # + return - Encrypted expression 
    remote isolated function importationGetcustomcolumnexpression(string storeId, string executionId, string columnId) returns string|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/customColumns/${columnId}/expression`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(path, accHeaders, targetType = string);
        return response;
    }
    # Create or replace a custom column
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + columnId - The custom column identifier 
    # + return - Custom column configured. This operation has no impact on the current catalog until you commit the catalog importation. 
    remote isolated function importationSavecustomcolumn(string storeId, string executionId, string columnId, ChangeCustomColumnRequest payload) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/customColumns/${columnId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Delete Custom Column
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + columnId - The custom column identifier 
    # + return - When the custom column for this importation is correctly deleted 
    remote isolated function importationDeletecustomcolumn(string storeId, string executionId, string columnId) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/customColumns/${columnId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Map custom column to a BeezUP column
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + columnId - The custom column identifier 
    # + return - Custom column mapped. This operation has no impact on the current catalog until you commit the catalog importation. 
    remote isolated function importationMapcustomcolumn(string storeId, string executionId, string columnId, MapBeezUPColumnRequest payload) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/customColumns/${columnId}/map`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Unmap custom column
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + columnId - The custom column identifier 
    # + return - Custom column unmapped. This operation has no impact on the current catalog until you commit the catalog importation. 
    remote isolated function importationUnmapcustomcolumn(string storeId, string executionId, string columnId) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/customColumns/${columnId}/unmap`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Importation Get Products Report
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + return - Get Products Report Response 
    remote isolated function importationGetproductsreport(string storeId, string executionId, GetImportationProductsReportRequest payload) returns GetImportationProductsReportResponse|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/products/list`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetImportationProductsReportResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType = GetImportationProductsReportResponse);
        return response;
    }
    # Importation Get Report
    #
    # + storeId - Your store identifier 
    # + executionId - The execution identifier of you catalog importation 
    # + return - Get Report Response 
    remote isolated function importationGetreport(string storeId, string executionId) returns GetImportationReportResponse|error {
        string path = string `/v2/user/catalogs/${storeId}/importations/${executionId}/report`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetImportationReportResponse response = check self.clientEp->get(path, accHeaders, targetType = GetImportationReportResponse);
        return response;
    }
    # Activate the auto importation of the last successful manual catalog importation.
    #
    # + storeId - Your store identifier 
    # + return - Auto import activated 
    remote isolated function importationActivateautoimport(string storeId) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/autoImport/activate`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get the auto import configuration
    #
    # + storeId - Your store identifier 
    # + return - Auto import configuration 
    remote isolated function autoGetautoimportconfiguration(string storeId) returns AutoImportConfiguration|error {
        string path = string `/v2/user/catalogs/${storeId}/autoImport`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AutoImportConfiguration response = check self.clientEp->get(path, accHeaders, targetType = AutoImportConfiguration);
        return response;
    }
    # Delete Auto Import
    #
    # + storeId - Your store identifier 
    # + return - Auto import deleted 
    remote isolated function autoDeleteautoimport(string storeId) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/autoImport`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Start Auto Import Manually
    #
    # + storeId - Your store identifier 
    # + return - Catalog importation started 
    remote isolated function autoStartautoimport(string storeId) returns LinksImportationGetimportationmonitoringlink|error {
        string path = string `/v2/user/catalogs/${storeId}/autoImport/start`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        LinksImportationGetimportationmonitoringlink response = check self.clientEp->post(path, request, headers = accHeaders, targetType = LinksImportationGetimportationmonitoringlink);
        return response;
    }
    # Pause Auto Import
    #
    # + storeId - Your store identifier 
    # + return - Auto import paused 
    remote isolated function autoPauseautoimport(string storeId) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/autoImport/pause`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Resume Auto Import
    #
    # + storeId - Your store identifier 
    # + return - Auto import resumed 
    remote isolated function autoResumeautoimport(string storeId) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/autoImport/resume`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Configure Auto Import Interval
    #
    # + storeId - Your store identifier 
    # + return - Auto import scheduling interval saved 
    remote isolated function autoConfigureautoimportinterval(string storeId, ConfigureAutoImportIntervalRequest payload) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/autoImport/scheduling/interval`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Configure Auto Import Schedules
    #
    # + storeId - Your store identifier 
    # + return - Auto import scheduling saved 
    remote isolated function autoScheduleautoimport(string storeId, ScheduleAutoImportRequest payload) returns http:Response|error {
        string path = string `/v2/user/catalogs/${storeId}/autoImport/scheduling/schedules`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # List all available channel for this store
    #
    # + storeId - The store identifier 
    # + return - Available channel list for this store 
    remote isolated function getAvailableChannels(string storeId) returns ChannelHeader[]|error {
        string path = string `/v2/user/channels/`;
        map<anydata> queryParam = {"storeId": storeId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ChannelHeader[] response = check self.clientEp->get(path, accHeaders, targetType = ChannelHeaderArr);
        return response;
    }
    # Get channel information
    #
    # + channelId - The channel identifier 
    # + return - Channel information 
    remote isolated function getChannelInfo(string channelId) returns ChannelInfo|error {
        string path = string `/v2/user/channels/${channelId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ChannelInfo response = check self.clientEp->get(path, accHeaders, targetType = ChannelInfo);
        return response;
    }
    # Get channel categories
    #
    # + channelId - The channel identifier 
    # + acceptEncoding - Indicates that the client accepts that the response will be compressed to reduce traffic size. 
    # + return - Channel categories 
    remote isolated function getChannelCategories(string channelId, string[] acceptEncoding) returns ChannelRootCategory|error {
        string path = string `/v2/user/channels/${channelId}/categories`;
        map<any> headerValues = {"Accept-Encoding": acceptEncoding, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ChannelRootCategory response = check self.clientEp->get(path, accHeaders, targetType = ChannelRootCategory);
        return response;
    }
    # Get channel columns
    #
    # + channelId - The channel identifier 
    # + acceptEncoding - Indicates that the client accepts that the response will be compressed to reduce traffic size. 
    # + payload - Allow you to filter the channel column identifier list your want to get 
    # + return - Channel columns 
    remote isolated function getChannelColumns(string channelId, string[] acceptEncoding, BeezupCommonChannelcolumnid[] payload) returns ChannelColumn[]|error {
        string path = string `/v2/user/channels/${channelId}/columns`;
        map<any> headerValues = {"Accept-Encoding": acceptEncoding, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ChannelColumn[] response = check self.clientEp->post(path, request, headers = accHeaders, targetType = ChannelColumnArr);
        return response;
    }
    # List all your current channel catalogs
    #
    # + storeId - The store identifier 
    # + return - OK 
    remote isolated function getChannelCatalogs(string? storeId = ()) returns ChannelCatalogList|error {
        string path = string `/v2/user/channelCatalogs/`;
        map<anydata> queryParam = {"storeId": storeId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ChannelCatalogList response = check self.clientEp->get(path, accHeaders, targetType = ChannelCatalogList);
        return response;
    }
    # Add a new channel catalog
    #
    # + return - When the channel has been successfully added for this store 
    remote isolated function addChannelCatalog(AddChannelCatalogRequest payload) returns LinksGetchannelcataloglink|error {
        string path = string `/v2/user/channelCatalogs/`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LinksGetchannelcataloglink response = check self.clientEp->post(path, request, headers = accHeaders, targetType = LinksGetchannelcataloglink);
        return response;
    }
    # Get the channel catalog information
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog 
    remote isolated function getChannelCatalog(string channelCatalogId) returns ChannelCatalog|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ChannelCatalog response = check self.clientEp->get(path, accHeaders, targetType = ChannelCatalog);
        return response;
    }
    # Delete the channel catalog
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog deleted 
    remote isolated function deleteChannelCatalog(string channelCatalogId) returns http:Response|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Get channel catalog filter operators
    #
    # + return - Channel catalog  filter operator list 
    remote isolated function getChannelCatalogFilterOperators() returns FilterOperator[]|error {
        string path = string `/v2/user/channelCatalogs/filterOperators`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FilterOperator[] response = check self.clientEp->get(path, accHeaders, targetType = FilterOperatorArr);
        return response;
    }
    # Enable a channel catalog
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog enabled 
    remote isolated function enableChannelCatalog(string channelCatalogId) returns http:Response|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/enable`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Disable a channel catalog
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog disabled 
    remote isolated function disableChannelCatalog(string channelCatalogId) returns http:Response|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/disable`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Configure channel catalog general settings
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog general settings configured 
    remote isolated function configureChannelCatalogGeneralSettings(string channelCatalogId, GeneralSettings payload) returns http:Response|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/settings/general`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Configure channel catalog cost settings
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog cost settings configured 
    remote isolated function configureChannelCatalogCostSettings(string channelCatalogId, CostSettings payload) returns http:Response|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/settings/cost`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Configure channel catalog column mappings
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog column mappings configured 
    remote isolated function configureChannelCatalogColumnMappings(string channelCatalogId, ChannelCatalogColumnMappingList payload) returns http:Response|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/columnMappings`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get channel catalog categories
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog category mappings 
    remote isolated function getChannelCatalogCategories(string channelCatalogId) returns ChannelCatalogCategoryConfigurationList|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/categories`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ChannelCatalogCategoryConfigurationList response = check self.clientEp->get(path, accHeaders, targetType = ChannelCatalogCategoryConfigurationList);
        return response;
    }
    # Disable a channel catalog category mapping
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog category mapping disabled 
    remote isolated function disableChannelCatalogCategoryMapping(string channelCatalogId) returns http:Response|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/categories/disableMapping`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Reenable a channel catalog category mapping
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog category mapping reenabled 
    remote isolated function reenableChannelCatalogCategoryMapping(string channelCatalogId) returns http:Response|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/categories/reenableMapping`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Configure channel catalog category
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog category configured 
    remote isolated function configureChannelCatalogCategory(string channelCatalogId, ConfigureCategoryRequest payload) returns http:Response|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/categories/configure`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get channel catalog exclusion filters
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog exclusion filter list 
    remote isolated function getChannelCatalogExclusionFilters(string channelCatalogId) returns ExclusionFiltersResponse|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/exclusionFilters`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ExclusionFiltersResponse response = check self.clientEp->get(path, accHeaders, targetType = ExclusionFiltersResponse);
        return response;
    }
    # Configure channel catalog exclusion filters
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog exclusion filter list configured 
    remote isolated function configureChannelCatalogExclusionFilters(string channelCatalogId, ExclusionFilters payload) returns http:Response|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/exclusionFilters`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get channel catalog product information list
    #
    # + channelCatalogId - The channel catalog identifier 
    # + payload - The channel catalog product list filter 
    # + return - Channel catalog product information 
    remote isolated function getChannelCatalogProductInfoList(string channelCatalogId, GetChannelCatalogProductInfoListRequest payload) returns ChannelCatalogProductInfoList|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/products`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ChannelCatalogProductInfoList response = check self.clientEp->post(path, request, headers = accHeaders, targetType = ChannelCatalogProductInfoList);
        return response;
    }
    # Export channel catalog product information list
    #
    # + channelCatalogId - The channel catalog identifier 
    # + format - The file type of the exportation 
    # + payload - The channel catalog product list filter 
    # + return - Channel catalog product information list exported 
    remote isolated function exportChannelCatalogProductInfoList(string channelCatalogId, string format, GetChannelCatalogProductInfoListRequest payload) returns BeezupCommonLink3|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/products/export`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BeezupCommonLink3 response = check self.clientEp->post(path, request, headers = accHeaders, targetType = BeezupCommonLink3);
        return response;
    }
    # Get channel catalog products' counters
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog products' counters 
    remote isolated function getChannelCatalogProductsCounters(string channelCatalogId) returns ChannelCatalogProductsCounters|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/products/counters`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ChannelCatalogProductsCounters response = check self.clientEp->get(path, accHeaders, targetType = ChannelCatalogProductsCounters);
        return response;
    }
    # Get channel catalog products related to these channel catalogs
    #
    # + return - The channel catalog product by channel catalog 
    remote isolated function getChannelCatalogProductByChannelCatalog(ChannelCatalogProductByChannelCatalogRequest payload) returns ChannelCatalogProductByChannelCatalogResponse|error {
        string path = string `/v2/user/channelCatalogs/products`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ChannelCatalogProductByChannelCatalogResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType = ChannelCatalogProductByChannelCatalogResponse);
        return response;
    }
    # Get channel catalog product information
    #
    # + channelCatalogId - The channel catalog identifier 
    # + productId - The product identifier 
    # + return - Channel catalog product information 
    remote isolated function getChannelCatalogProductInfo(string channelCatalogId, string productId) returns ChannelCatalogProductInfo|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/products/${productId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ChannelCatalogProductInfo response = check self.clientEp->get(path, accHeaders, targetType = ChannelCatalogProductInfo);
        return response;
    }
    # Override channel catalog product values
    #
    # + channelCatalogId - The channel catalog identifier 
    # + productId - The product identifier 
    # + return - Channel catalog product overriden 
    remote isolated function overrideChannelCatalogProductValues(string channelCatalogId, string productId, ProductOverrides payload) returns http:Response|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/products/${productId}/overrides`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Delete a specific channel catalog product value override
    #
    # + channelCatalogId - The channel catalog identifier 
    # + productId - The product identifier 
    # + channelColumnId - The channel column identifier 
    # + return - Channel catalog product value override deleted 
    remote isolated function deleteChannelCatalogProductValueOverride(string channelCatalogId, string productId, string channelColumnId) returns http:Response|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/products/${productId}/overrides/${channelColumnId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Get channel catalog product value override compatibilities status
    #
    # + channelCatalogId - The channel catalog identifier 
    # + productId - The product identifier 
    # + return - placeholder. will be completed soon. 
    remote isolated function getChannelCatalogProductValueOverrideCopy(string channelCatalogId, string productId) returns http:Response|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/products/${productId}/overrides/copy`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Copy channel catalog product value override
    #
    # + channelCatalogId - The channel catalog identifier 
    # + productId - The product identifier 
    # + return - Channel catalog product value override deleted 
    remote isolated function configureChannelCatalogProductValueOverrideCopy(string channelCatalogId, string productId) returns http:Response|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/products/${productId}/overrides/copy`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Disable channel catalog product
    #
    # + channelCatalogId - The channel catalog identifier 
    # + productId - The product identifier 
    # + return - Channel catalog product disabled 
    remote isolated function disableChannelCatalogProduct(string channelCatalogId, string productId) returns http:Response|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/products/${productId}/disable`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Reenable channel catalog product
    #
    # + channelCatalogId - The channel catalog identifier 
    # + productId - The product identifier 
    # + return - Channel catalog product reenabled 
    remote isolated function reenableChannelCatalogProduct(string channelCatalogId, string productId) returns http:Response|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/products/${productId}/reenable`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get the exportation cache information
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog exportation cache information 
    remote isolated function getChannelCatalogExportationCacheInfo(string channelCatalogId) returns ChannelCatalogExportCacheInfoResponse|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/exportations/cache`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ChannelCatalogExportCacheInfoResponse response = check self.clientEp->get(path, accHeaders, targetType = ChannelCatalogExportCacheInfoResponse);
        return response;
    }
    # Clear the exportation cache
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog exportation cache cleared 
    remote isolated function clearChannelCatalogExportationCache(string channelCatalogId) returns http:Response|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/exportations/cache/clear`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get the exportation history
    #
    # + channelCatalogId - The channel catalog identifier 
    # + pageNumber - The page number you want to get 
    # + pageSize - The entry count you want to get 
    # + return - Channel catalog exportation history 
    remote isolated function getChannelCatalogExportationHistory(string channelCatalogId, int pageNumber, int pageSize) returns ChannelCatalogExportationHistory|error {
        string path = string `/v2/user/channelCatalogs/${channelCatalogId}/exportations/history`;
        map<anydata> queryParam = {"pageNumber": pageNumber, "pageSize": pageSize};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ChannelCatalogExportationHistory response = check self.clientEp->get(path, accHeaders, targetType = ChannelCatalogExportationHistory);
        return response;
    }
    # Get your marketplace channel catalog list
    #
    # + storeId - The StoreId to filter by 
    # + return - Marketplace channel catalog list 
    remote isolated function getMarketplaceChannelCatalogs(string? storeId = ()) returns MarketplaceChannelCatalogList|error {
        string path = string `/v2/user/marketplaces/channelcatalogs/`;
        map<anydata> queryParam = {"storeId": storeId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        MarketplaceChannelCatalogList response = check self.clientEp->get(path, accHeaders, targetType = MarketplaceChannelCatalogList);
        return response;
    }
    # [PREVIEW] Launch a publication of the catalog to the marketplace
    #
    # + marketplaceTechnicalCode - Marketplace Technical Code to query (required) 
    # + accountId - Account Id to query (required) 
    # + return - Publication request accepted 
    remote isolated function publishCatalogToMarketplace(string marketplaceTechnicalCode, int accountId, PublishCatalogToMarketplaceRequest payload) returns http:Response|error {
        string path = string `/v2/user/marketplaces/channelcatalogs/publications/${marketplaceTechnicalCode}/${accountId}/publish`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
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
        string path = string `/v2/user/marketplaces/channelcatalogs/publications/${marketplaceTechnicalCode}/${accountId}/history`;
        map<anydata> queryParam = {"channelCatalogId": channelCatalogId, "count": count, "publicationTypes": publicationTypes};
        map<Encoding> queryParamEncoding = {"publicationTypes": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AccountPublications response = check self.clientEp->get(path, accHeaders, targetType = AccountPublications);
        return response;
    }
    # Get the marketplace settings for a channel catalog
    #
    # + channelCatalogId - Channel Catalog Id to query (required) 
    # + return - Successfully fetched channel catalog settings 
    remote isolated function getChannelCatalogMarketplaceSettings(string channelCatalogId) returns ChannelCatalogMarketplaceSettings|error {
        string path = string `/v2/user/marketplaces/channelcatalogs/${channelCatalogId}/settings`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ChannelCatalogMarketplaceSettings response = check self.clientEp->get(path, accHeaders, targetType = ChannelCatalogMarketplaceSettings);
        return response;
    }
    # Save new marketplace settings for a channel catalog
    #
    # + channelCatalogId - Channel Catalog Id to query 
    # + payload - Settings to save 
    # + return - Successfully saved channel catalog marketplace settings 
    remote isolated function setChannelCatalogMarketplaceSettings(string channelCatalogId, SetChannelCatalogMarketplaceSettingsRequest payload) returns http:Response|error {
        string path = string `/v2/user/marketplaces/channelcatalogs/${channelCatalogId}/settings`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
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
        string path = string `/v2/user/marketplaces/orders/`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OrderIndex response = check self.clientEp->get(path, accHeaders, targetType = OrderIndex);
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
        string path = string `/v2/user/marketplaces/orders/status`;
        map<anydata> queryParam = {"storeId": storeId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AccountSynchronizationList response = check self.clientEp->get(path, accHeaders, targetType = AccountSynchronizationList);
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
        string path = string `/v2/user/marketplaces/orders/harvest`;
        map<anydata> queryParam = {"storeId": storeId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get list of configured automatic Order status transitions
    #
    # + storeId - The StoreId to filter by 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Successfully fetched list of configured automatic Order status transitions 
    remote isolated function getAutomaticTransitions(string? storeId = (), string? ifNoneMatch = ()) returns AutomaticTransitionInfoList|error {
        string path = string `/v2/user/marketplaces/orders/automaticTransitions`;
        map<anydata> queryParam = {"storeId": storeId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AutomaticTransitionInfoList response = check self.clientEp->get(path, accHeaders, targetType = AutomaticTransitionInfoList);
        return response;
    }
    # Configure new or existing automatic Order status transition
    #
    # + return - Successfully confirugred new or existing automatic Order status transition 
    remote isolated function configureAutomaticTransitions(ConfigureAutomaticTransitionRequest payload) returns http:Response|error {
        string path = string `/v2/user/marketplaces/orders/automaticTransitions`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
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
        string path = string `/v2/user/marketplaces/orders/list/full`;
        map<any> headerValues = {"Accept-Encoding": acceptEncoding, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrderListFull response = check self.clientEp->post(path, request, headers = accHeaders, targetType = OrderListFull);
        return response;
    }
    # [DEPRECATED] Get a paginated list of all Orders without details
    #
    # + return - Successfully fetched the list of Orders 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getOrderListLight(OrderListRequest payload) returns OrderListLight|error {
        string path = string `/v2/user/marketplaces/orders/list/light`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrderListLight response = check self.clientEp->post(path, request, headers = accHeaders, targetType = OrderListLight);
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
        string path = string `/v2/user/marketplaces/orders/exportations`;
        map<anydata> queryParam = {"pageNumber": pageNumber, "pageSize": pageSize, "storeId": storeId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OrderExportations response = check self.clientEp->get(path, accHeaders, targetType = OrderExportations);
        return response;
    }
    # Request a new Order report exportation to be generated
    #
    # + return - Successfully requested new Order report exportation generation 
    remote isolated function exportOrders(ExportOrderListRequest payload) returns http:Response|error {
        string path = string `/v2/user/marketplaces/orders/exportations`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # [DEPRECATED] Send a batch of operations to set an Order's merchant information  (max 100 items per call)
    #
    # + return - Succesfully received and processed batched operations. Please check response to see the status per operation. 
    # 
    # # Deprecated
    @deprecated
    remote isolated function setMerchantOrderInfoList(SetMerchantOrderInfoListRequest payload) returns BatchOrderOperationResponse|error {
        string path = string `/v2/user/marketplaces/orders/batches/setMerchantOrderInfos`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchOrderOperationResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType = BatchOrderOperationResponse);
        return response;
    }
    # [DEPRECATED] Send a batch of operations to clear an Order's merchant information (max 100 items per call)
    #
    # + return - Succesfully received and processed batched operations. Please check response to see the status per operation. 
    # 
    # # Deprecated
    @deprecated
    remote isolated function clearMerchantOrderInfoList(ClearMerchantOrderInfoListRequest payload) returns BatchOrderOperationResponse|error {
        string path = string `/v2/user/marketplaces/orders/batches/clearMerchantOrderInfos`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchOrderOperationResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType = BatchOrderOperationResponse);
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
        string path = string `/v2/user/marketplaces/orders/batches/changeOrders/${changeOrderType}`;
        map<anydata> queryParam = {"userName": userName, "testMode": testMode};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchOrderOperationResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType = BatchOrderOperationResponse);
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
        string path = string `/v2/user/marketplaces/orders/${marketplaceTechnicalCode}/${accountId}/${beezUPOrderId}`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Order response = check self.clientEp->get(path, accHeaders, targetType = Order);
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
        string path = string `/v2/user/marketplaces/orders/${marketplaceTechnicalCode}/${accountId}/${beezUPOrderId}`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->head(path, accHeaders);
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
        string path = string `/v2/user/marketplaces/orders/${marketplaceTechnicalCode}/${accountId}/${beezUPOrderId}/history`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OrderHistory response = check self.clientEp->get(path, accHeaders, targetType = OrderHistory);
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
        string path = string `/v2/user/marketplaces/orders/${marketplaceTechnicalCode}/${accountId}/${beezUPOrderId}/harvest`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
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
        string path = string `/v2/user/marketplaces/orders/${marketplaceTechnicalCode}/${accountId}/${beezUPOrderId}/setMerchantOrderInfo`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
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
        string path = string `/v2/user/marketplaces/orders/${marketplaceTechnicalCode}/${accountId}/${beezUPOrderId}/clearMerchantOrderInfo`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
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
        string path = string `/v2/user/marketplaces/orders/${marketplaceTechnicalCode}/${accountId}/${beezUPOrderId}/${changeOrderType}`;
        map<anydata> queryParam = {"userName": userName, "testMode": testMode};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Match": ifMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get current synchronization status between your marketplaces and BeezUP accounts
    #
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + storeIds - StoredIds to filter 
    # + return - Successfully fetched the list of MarketplaceBusinessCode ready for Order Management 
    remote isolated function getMarketplaceAccountsSynchronizationV3(string? ifNoneMatch = (), string[]? storeIds = ()) returns AccountSynchronizationList|error {
        string path = string `/orders/v3/status`;
        map<anydata> queryParam = {"storeIds": storeIds};
        map<Encoding> queryParamEncoding = {"storeIds": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AccountSynchronizationList response = check self.clientEp->get(path, accHeaders, targetType = AccountSynchronizationList);
        return response;
    }
    # Send harvest request to all your marketplaces
    #
    # + storeId - The StoreId to filter by 
    # + return - Successfully sent harvest request to all marketplaces 
    remote isolated function harvestAllV3(string? storeId = ()) returns http:Response|error {
        string path = string `/orders/v3/harvest`;
        map<anydata> queryParam = {"storeId": storeId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get a paginated list of all Orders with all Order and Order Item(s) properties
    #
    # + acceptEncoding - Allows the client to indicate wether it accepts a compressed encoding to reduce traffic size 
    # + return - Successfully fetched the full list of Orders 
    remote isolated function getOrderListFullV3(string acceptEncoding, OrderListRequest payload) returns OrderListFullWithLinks|error {
        string path = string `/orders/v3/list/full`;
        map<any> headerValues = {"Accept-Encoding": acceptEncoding, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrderListFullWithLinks response = check self.clientEp->post(path, request, headers = accHeaders, targetType = OrderListFullWithLinks);
        return response;
    }
    # Get a paginated list of all Orders without details
    #
    # + return - Successfully fetched the list of Orders 
    remote isolated function getOrderListLightV3(OrderListRequest payload) returns OrderListLightWithLinks|error {
        string path = string `/orders/v3/list/light`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrderListLightWithLinks response = check self.clientEp->post(path, request, headers = accHeaders, targetType = OrderListLightWithLinks);
        return response;
    }
    # Get full Order and Order Item(s) properties
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Successfully fetched Order and Order Item(s) properties 
    remote isolated function getOrderV3(string marketplaceTechnicalCode, int accountId, string beezUPOrderId, string? ifNoneMatch = ()) returns OrderWithLinks|error {
        string path = string `/orders/v3/${marketplaceTechnicalCode}/${accountId}/${beezUPOrderId}`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OrderWithLinks response = check self.clientEp->get(path, accHeaders, targetType = OrderWithLinks);
        return response;
    }
    # Get the meta information about the order (ETag, Last-Modified)
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + ifNoneMatch - ETag value to identify the last known version of requested resource.\ To avoid useless exchange, we recommend you to indicate the ETag you previously got from this operation.\ If the ETag value does not match the response will be 200 to give you a new content, otherwise the response will be: 304 Not Modified, without any content.\ For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3 
    # + return - Successfully fetched Order and Order Item(s) properties 
    remote isolated function headOrderV3(string marketplaceTechnicalCode, int accountId, string beezUPOrderId, string? ifNoneMatch = ()) returns http:Response|error {
        string path = string `/orders/v3/${marketplaceTechnicalCode}/${accountId}/${beezUPOrderId}`;
        map<any> headerValues = {"If-None-Match": ifNoneMatch, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->head(path, accHeaders);
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
        string path = string `/orders/v3/${marketplaceTechnicalCode}/${accountId}/${beezUPOrderId}/${changeOrderType}`;
        map<anydata> queryParam = {"userName": userName, "testMode": testMode};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get an Order's harvest and change history
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + return - Successfully fetched Order history 
    remote isolated function getOrderHistoryV3(string marketplaceTechnicalCode, int accountId, string beezUPOrderId) returns OrderHistory|error {
        string path = string `/orders/v3/${marketplaceTechnicalCode}/${accountId}/${beezUPOrderId}/history`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OrderHistory response = check self.clientEp->get(path, accHeaders, targetType = OrderHistory);
        return response;
    }
    # Send harvest request for a single Order
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + return - Successfully sent Order harvest request 
    remote isolated function harvestOrderV3(string marketplaceTechnicalCode, int accountId, string beezUPOrderId) returns http:Response|error {
        string path = string `/orders/v3/${marketplaceTechnicalCode}/${accountId}/${beezUPOrderId}/harvest`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Send harvest request for an Account
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + return - Successfully sent Order harvest request 
    remote isolated function harvestAccount(string marketplaceTechnicalCode, int accountId, string? marketplaceOrderId = (), string? beezUPOrderId = ()) returns http:Response|error {
        string path = string `/orders/v3/${marketplaceTechnicalCode}/${accountId}/harvest`;
        map<anydata> queryParam = {"marketplaceOrderId": marketplaceOrderId, "beezUPOrderId": beezUPOrderId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get the order change reporting
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + orderChangeExecutionUUID - The order change execution id 
    # + return - Successfully fetched Order change reporting 
    remote isolated function getOrderChangeReportingV3(string marketplaceTechnicalCode, int accountId, string beezUPOrderId, string orderChangeExecutionUUID) returns ChangeOrderReporting|error {
        string path = string `/orders/v3/${marketplaceTechnicalCode}/${accountId}/${beezUPOrderId}/history/${orderChangeExecutionUUID}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ChangeOrderReporting response = check self.clientEp->get(path, accHeaders, targetType = ChangeOrderReporting);
        return response;
    }
    # Set an Order's merchant information
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + testMode - If true, the operation will be not be sent to marketplace. But the validation will be taken in account. 
    # + return - Set Order merchant order info accepted 
    remote isolated function setMerchantOrderInfoV3(string marketplaceTechnicalCode, int accountId, string beezUPOrderId, SetMerchantOrderInfoRequest payload, boolean testMode = false) returns http:Response|error {
        string path = string `/orders/v3/${marketplaceTechnicalCode}/${accountId}/${beezUPOrderId}/setMerchantOrderInfo`;
        map<anydata> queryParam = {"testMode": testMode};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Clear an Order's merchant information
    #
    # + marketplaceTechnicalCode - The marketplace technical code 
    # + beezUPOrderId - The BeezUP Order identifier 
    # + testMode - If true, the operation will be not be sent to marketplace. But the validation will be taken in account. 
    # + return - Clear Order merchant order info accepted 
    remote isolated function clearMerchantOrderInfoV3(string marketplaceTechnicalCode, int accountId, string beezUPOrderId, boolean testMode = false) returns http:Response|error {
        string path = string `/orders/v3/${marketplaceTechnicalCode}/${accountId}/${beezUPOrderId}/clearMerchantOrderInfo`;
        map<anydata> queryParam = {"testMode": testMode};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Send a batch of operations to set an Order's merchant information  (max 100 items per call)
    #
    # + testMode - If true, the operation will be not be sent to marketplace. But the validation will be taken in account. 
    # + return - Succesfully received and processed batched operations. Please check response to see the status per operation. 
    remote isolated function setMerchantOrderInfoListV3(SetMerchantOrderInfoListRequest payload, boolean testMode = false) returns BatchOrderOperationResponse|error {
        string path = string `/orders/v3/batches/setMerchantOrderInfos`;
        map<anydata> queryParam = {"testMode": testMode};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchOrderOperationResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType = BatchOrderOperationResponse);
        return response;
    }
    # Send a batch of operations to clear an Order's merchant information (max 100 items per call)
    #
    # + testMode - If true, the operation will be not be sent to marketplace. But the validation will be taken in account. 
    # + return - Succesfully received and processed batched operations. Please check response to see the status per operation. 
    remote isolated function clearMerchantOrderInfoListV3(ClearMerchantOrderInfoListRequest payload, boolean testMode = false) returns BatchOrderOperationResponse|error {
        string path = string `/orders/v3/batches/clearMerchantOrderInfos`;
        map<anydata> queryParam = {"testMode": testMode};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchOrderOperationResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType = BatchOrderOperationResponse);
        return response;
    }
    # Send a batch of operations to change your marketplace Order information: accept, ship, etc.  (max 100 items per call)
    #
    # + userName - Sometimes the user in the e-commerce application is not the same as user associated with the current subscription key. We recommend providing your application's user login. 
    # + testMode - If true, the operation will be not be sent to marketplace. But the validation will be taken in account. 
    # + changeOrderType - The Order change type 
    # + return - Succesfully received and processed batched operations. Please check response to see the status per operation. 
    remote isolated function changeOrderListV2(string userName, string changeOrderType, ChangeOrderListRequestV2 payload, boolean testMode = false) returns BatchOrderOperationResponse|error {
        string path = string `/orders/v3/batches/changeOrders/${changeOrderType}`;
        map<anydata> queryParam = {"userName": userName, "testMode": testMode};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchOrderOperationResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType = BatchOrderOperationResponse);
        return response;
    }
    # Send a batch of operations to change your marketplace Order information: accept, ship, etc.  (max 100 items per call)
    #
    # + userName - Sometimes the user in the e-commerce application is not the same as user associated with the current subscription key. We recommend providing your application's user login. 
    # + testMode - If true, the operation will be not be sent to marketplace. But the validation will be taken in account. 
    # + return - Succesfully received and processed batched operations. Please check response to see the status per operation. 
    remote isolated function changeOrderListV3(string userName, ChangeOrderListRequest payload, boolean testMode = false) returns BatchOrderOperationResponse|error {
        string path = string `/orders/v3/batches/changeOrders`;
        map<anydata> queryParam = {"userName": userName, "testMode": testMode};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchOrderOperationResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType = BatchOrderOperationResponse);
        return response;
    }
    # Get the subscription list
    #
    # + return - The subscription list 
    remote isolated function getSubscriptionList() returns SubscriptionIndex[]|error {
        string path = string `/v2/user/marketplaces/orders/subscriptions/`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SubscriptionIndex[] response = check self.clientEp->get(path, accHeaders, targetType = SubscriptionIndexArr);
        return response;
    }
    # Get a subscription to the orders
    #
    # + return - Subscription info 
    remote isolated function getSubscription(string id) returns SubscriptionIndex|error {
        string path = string `/v2/user/marketplaces/orders/subscriptions/${id}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SubscriptionIndex response = check self.clientEp->get(path, accHeaders, targetType = SubscriptionIndex);
        return response;
    }
    # Creates a subscription to the orders
    #
    # + return - Subscription creation accepted 
    remote isolated function createSubscription(string id, CreateSubscriptionRequest payload) returns http:Response|error {
        string path = string `/v2/user/marketplaces/orders/subscriptions/${id}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Delete a subscription to the orders
    #
    # + return - Subscription deletion accepted 
    remote isolated function deleteSubscription(string id) returns http:Response|error {
        string path = string `/v2/user/marketplaces/orders/subscriptions/${id}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Get the push reporting related to this subscription
    #
    # + return - Subscription push reporting info 
    remote isolated function getSubscriptionPushReporting(string id, int? pageNumber = (), int? pageSize = ()) returns SubscriptionPushReporting[]|error {
        string path = string `/v2/user/marketplaces/orders/subscriptions/${id}/reporting`;
        map<anydata> queryParam = {"pageNumber": pageNumber, "pageSize": pageSize};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SubscriptionPushReporting[] response = check self.clientEp->get(path, accHeaders, targetType = SubscriptionPushReportingArr);
        return response;
    }
    # Activate a subscription to the orders
    #
    # + return - Subscription activation accepted 
    remote isolated function activateSubscription(string id, ActivateSubscriptionRequest payload) returns http:Response|error {
        string path = string `/v2/user/marketplaces/orders/subscriptions/${id}/activate`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Deactivate a subscription to the orders
    #
    # + return - Subscription deactivation accepted 
    remote isolated function deactivateSubscription(string id) returns http:Response|error {
        string path = string `/v2/user/marketplaces/orders/subscriptions/${id}/deactivate`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Force retry push orders immediatly
    #
    # + return - Retry push orders request accepted 
    remote isolated function retryPushOrders(string id) returns http:Response|error {
        string path = string `/v2/user/marketplaces/orders/subscriptions/${id}/retry`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get Order Invoice general settings
    #
    # + return - Settings successfully retrieved 
    remote isolated function getOrderInvoiceGeneralSettings() returns GetOrderInvoiceGeneralSettingsResponse|error {
        string path = string `/v2/user/marketplaces/orders/invoices/settings/general`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetOrderInvoiceGeneralSettingsResponse response = check self.clientEp->get(path, accHeaders, targetType = GetOrderInvoiceGeneralSettingsResponse);
        return response;
    }
    # Save Order Invoice general settings
    #
    # + return - General Settings successfully saved 
    remote isolated function saveOrderInvoiceGeneralSettings(OrderInvoiceGeneralSettings payload) returns http:Response|error {
        string path = string `/v2/user/marketplaces/orders/invoices/settings/general`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get Order Invoice design settings
    #
    # + return - Design successfully retrieved 
    remote isolated function getOrderInvoiceDesignSettings() returns OrderInvoiceDesignSettings|error {
        string path = string `/v2/user/marketplaces/orders/invoices/settings/design`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OrderInvoiceDesignSettings response = check self.clientEp->get(path, accHeaders, targetType = OrderInvoiceDesignSettings);
        return response;
    }
    # Save Order Invoice design settings
    #
    # + return - Design successfully saved 
    remote isolated function saveOrderInvoiceDesignSettings(OrderInvoiceDesignSettings payload) returns http:Response|error {
        string path = string `/v2/user/marketplaces/orders/invoices/settings/design`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # View a preview an Order Invoice using custom design settings
    #
    # + acceptEncoding - Allows the client to indicate wether it accepts a compressed encoding to reduce traffic size 
    # + return - Design Preview successfully retrieved 
    remote isolated function getOrderInvoiceDesignSettingsPreview(string acceptEncoding, OrderInvoiceDesignSettings payload) returns GetOrderInvoiceDesignPreviewResponse|error {
        string path = string `/v2/user/marketplaces/orders/invoices/settings/design/preview`;
        map<any> headerValues = {"Accept-Encoding": acceptEncoding, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetOrderInvoiceDesignPreviewResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType = GetOrderInvoiceDesignPreviewResponse);
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
        string path = string `/v2/user/marketplaces/orders/invoices/${marketplaceTechnicalCode}/${accountId}/${beezUPOrderUUID}/generate`;
        map<anydata> queryParam = {"userName": userName};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
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
        string path = string `/v2/user/marketplaces/orders/invoices/${marketplaceTechnicalCode}/${accountId}/${beezUPOrderUUID}/preview`;
        map<any> headerValues = {"Accept-Encoding": acceptEncoding, "Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PreviewOrderInvoiceResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType = PreviewOrderInvoiceResponse);
        return response;
    }
    # Returns the PDF version of the invoice
    #
    # + return - The PDF version of the HTML invoice URL in the request 
    remote isolated function getOrderInvoicePdf(GetOrderInvoicePdfFromHtmlInvoiceUrlRequest payload) returns string|error {
        string path = string `/v2/user/marketplaces/orders/invoices/getPdfInvoice`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        string response = check self.clientEp->post(path, request, headers = accHeaders, targetType = string);
        return response;
    }
    # Get the Analytics API operation index
    #
    # + return - Analytics API operation index 
    remote isolated function analyticsIndex() returns AnalyticsIndex|error {
        string path = string `/v2/user/analytics/`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AnalyticsIndex response = check self.clientEp->get(path, accHeaders, targetType = AnalyticsIndex);
        return response;
    }
    # Get the Analytics API operation index for one store
    #
    # + storeId - Your store identifier 
    # + return - Analytics API operation index for one store 
    remote isolated function analyticsStoreIndex(string storeId) returns AnalyticsStoreIndex|error {
        string path = string `/v2/user/analytics/${storeId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AnalyticsStoreIndex response = check self.clientEp->get(path, accHeaders, targetType = AnalyticsStoreIndex);
        return response;
    }
    # Get the global synchronization status of clicks and orders
    #
    # + return - The tracking status informations 
    remote isolated function getTrackingStatus() returns TrackingStatus|error {
        string path = string `/v2/user/analytics/tracking/status`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        TrackingStatus response = check self.clientEp->get(path, accHeaders, targetType = TrackingStatus);
        return response;
    }
    # Get the synchronization status of clicks and orders of a store
    #
    # + storeId - Your store identifier 
    # + return - Store Tracking Status 
    remote isolated function getStoreTrackingStatus(string storeId) returns StoreTrackingStatus|error {
        string path = string `/v2/user/analytics/${storeId}/tracking/status`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        StoreTrackingStatus response = check self.clientEp->get(path, accHeaders, targetType = StoreTrackingStatus);
        return response;
    }
    # Get the latest tracked clicks
    #
    # + storeId - Your store identifier 
    # + count - The amount of clicks to retrieve 
    # + return - Click list 
    remote isolated function getStoreTrackedClicks(string storeId, int count = 100) returns TrackedClicks|error {
        string path = string `/v2/user/analytics/${storeId}/tracking/clicks`;
        map<anydata> queryParam = {"count": count};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        TrackedClicks response = check self.clientEp->get(path, accHeaders, targetType = TrackedClicks);
        return response;
    }
    # Get the latest tracked orders
    #
    # + storeId - Your store identifier 
    # + count - The amount of orders to retrieve 
    # + return - Order list 
    remote isolated function getStoreTrackedOrders(string storeId, int count = 100) returns TrackedOrders|error {
        string path = string `/v2/user/analytics/${storeId}/tracking/orders`;
        map<anydata> queryParam = {"count": count};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        TrackedOrders response = check self.clientEp->get(path, accHeaders, targetType = TrackedOrders);
        return response;
    }
    # Get the latest tracked external orders
    #
    # + storeId - Your store identifier 
    # + count - The amount of external orders to retrieve 
    # + return - External Order list 
    remote isolated function getStoreTrackedExternalOrders(string storeId, int count = 100) returns TrackedExternalOrders|error {
        string path = string `/v2/user/analytics/${storeId}/tracking/externalorders`;
        map<anydata> queryParam = {"count": count};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        TrackedExternalOrders response = check self.clientEp->get(path, accHeaders, targetType = TrackedExternalOrders);
        return response;
    }
    # Get the report by day for a StoreId
    #
    # + return - Your reporting by day 
    remote isolated function getStoreReportByDayPerStore(ReportByDayRequest payload) returns ReportByDayPerStoreResponse|error {
        string path = string `/v2/user/analytics/reports/byday`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ReportByDayPerStoreResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType = ReportByDayPerStoreResponse);
        return response;
    }
    # Get the report by day for a StoreId
    #
    # + storeId - Your store identifier 
    # + return - Your reporting by day 
    remote isolated function getStoreReportByDay(string storeId, ReportByDayRequest payload) returns ReportByDayResponse|error {
        string path = string `/v2/user/analytics/${storeId}/reports/byday`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ReportByDayResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType = ReportByDayResponse);
        return response;
    }
    # Get the report by channel
    #
    # + storeId - Your store identifier 
    # + return - Your reporting by channel 
    remote isolated function getStoreReportByChannel(string storeId, ReportByChannelRequest payload) returns ReportByChannelResponse|error {
        string path = string `/v2/user/analytics/${storeId}/reports/bychannel`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ReportByChannelResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType = ReportByChannelResponse);
        return response;
    }
    # Get the report by category
    #
    # + storeId - Your store identifier 
    # + return - Your reporting by channel 
    remote isolated function getStoreReportByCategory(string storeId, ReportByCategoryRequest payload) returns ReportByCategoryResponse|error {
        string path = string `/v2/user/analytics/${storeId}/reports/bycategory`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ReportByCategoryResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType = ReportByCategoryResponse);
        return response;
    }
    # Get the report by product
    #
    # + storeId - Your store identifier 
    # + return - Your reporting by product 
    remote isolated function getStoreReportByProduct(string storeId, ReportByProductRequest payload) returns ReportByProductResponse|error {
        string path = string `/v2/user/analytics/${storeId}/reports/byproduct`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ReportByProductResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType = ReportByProductResponse);
        return response;
    }
    # Optimise all products
    #
    # + storeId - Your store identifier 
    # + return - Products optimisatized 
    remote isolated function optimiseAll(string storeId, string actionName, OptimiseAllRequest payload) returns http:Response|error {
        string path = string `/v2/user/analytics/${storeId}/optimisations/all/${actionName}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Optimise products by page
    #
    # + storeId - Your store identifier 
    # + return - Products optimisatized 
    remote isolated function optimise(string storeId, string actionName, OptimiseRequest payload) returns http:Response|error {
        string path = string `/v2/user/analytics/${storeId}/optimisations/${actionName}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Optimise products by channel
    #
    # + storeId - Your store identifier 
    # + channelId - The channel identifier concerned by this optimisation 
    # + return - Products optimisatized 
    remote isolated function optimiseByChannel(string storeId, string channelId, string actionName) returns http:Response|error {
        string path = string `/v2/user/analytics/${storeId}/optimisations/bychannel/${channelId}/${actionName}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Optimise products by category
    #
    # + storeId - Your store identifier 
    # + catalogCategoryId - The category identifier concerned by this optimisation 
    # + payload - The channel identifier list concerned by this optimisation 
    # + return - Products optimisatized 
    remote isolated function optimiseByCategory(string storeId, string catalogCategoryId, string actionName, string[] payload) returns http:Response|error {
        string path = string `/v2/user/analytics/${storeId}/optimisations/bycategory/${catalogCategoryId}/${actionName}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Optimise product
    #
    # + storeId - Your store identifier 
    # + productId - The product identifier concerned by this optimisation 
    # + payload - The channel identifier list concerned by this optimisation 
    # + return - Product(s) optimisatized 
    remote isolated function optimiseByProduct(string storeId, string productId, string actionName, string[] payload) returns http:Response|error {
        string path = string `/v2/user/analytics/${storeId}/optimisations/byproduct/${productId}/${actionName}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Copy product optimisations between 2 channels
    #
    # + storeId - Your store identifier 
    # + return - Products optimisatisation copied 
    remote isolated function copyOptimisation(string storeId, CopyOptimisationRequest payload) returns CopyOptimisationResponse|error {
        string path = string `/v2/user/analytics/${storeId}/optimisations/copy`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CopyOptimisationResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType = CopyOptimisationResponse);
        return response;
    }
    # Get report filter list for the given store
    #
    # + storeId - Your store identifier 
    # + return - Report filter list 
    remote isolated function getReportFilters(string storeId) returns ReportFilterList|error {
        string path = string `/v2/user/analytics/${storeId}/reports/filters`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ReportFilterList response = check self.clientEp->get(path, accHeaders, targetType = ReportFilterList);
        return response;
    }
    # Get the report filter description
    #
    # + storeId - Your store identifier 
    # + reportFilterId - Your report filter identifier 
    # + return - Report filter 
    remote isolated function getReportFilter(string storeId, string reportFilterId) returns ReportFilter|error {
        string path = string `/v2/user/analytics/${storeId}/reports/filters/${reportFilterId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ReportFilter response = check self.clientEp->get(path, accHeaders, targetType = ReportFilter);
        return response;
    }
    # Save the report filter
    #
    # + storeId - Your store identifier 
    # + reportFilterId - Your report filter identifier 
    # + return - Report filter saved 
    remote isolated function saveReportFilter(string storeId, string reportFilterId, SaveReportFilterRequest payload) returns http:Response|error {
        string path = string `/v2/user/analytics/${storeId}/reports/filters/${reportFilterId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Delete the report filter
    #
    # + storeId - Your store identifier 
    # + reportFilterId - Your report filter identifier 
    # + return - Report filter deleted 
    remote isolated function deleteReportFilter(string storeId, string reportFilterId) returns http:Response|error {
        string path = string `/v2/user/analytics/${storeId}/reports/filters/${reportFilterId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Gets the list of rules for a given store
    #
    # + storeId - Your store identifier 
    # + return - Rule list 
    remote isolated function getRules(string storeId) returns RuleList|error {
        string path = string `/v2/user/analytics/${storeId}/rules`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        RuleList response = check self.clientEp->get(path, accHeaders, targetType = RuleList);
        return response;
    }
    # Rule creation
    #
    # + storeId - Your store identifier 
    # + return - Rule created 
    remote isolated function createRule(string storeId, CreateRuleRequest payload) returns http:Response|error {
        string path = string `/v2/user/analytics/${storeId}/rules`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Gets the rule
    #
    # + storeId - Your store identifier 
    # + ruleId - Your rule identifier 
    # + return - Get Rule 
    remote isolated function getRule(string storeId, string ruleId) returns Rule|error {
        string path = string `/v2/user/analytics/${storeId}/rules/${ruleId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Rule response = check self.clientEp->get(path, accHeaders, targetType = Rule);
        return response;
    }
    # Delete Rule
    #
    # + storeId - Your store identifier 
    # + ruleId - Your rule identifier 
    # + return - Rule deleted 
    remote isolated function deleteRule(string storeId, string ruleId) returns http:Response|error {
        string path = string `/v2/user/analytics/${storeId}/rules/${ruleId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Update Rule
    #
    # + storeId - Your store identifier 
    # + ruleId - Your rule identifier 
    # + return - Rule updated 
    remote isolated function updateRule(string storeId, string ruleId, UpdateRuleRequest payload) returns http:Response|error {
        string path = string `/v2/user/analytics/${storeId}/rules/${ruleId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Move the rule up
    #
    # + storeId - Your store identifier 
    # + ruleId - Your rule identifier 
    # + return - Rule moved up 
    remote isolated function moveUpRule(string storeId, string ruleId) returns http:Response|error {
        string path = string `/v2/user/analytics/${storeId}/rules/${ruleId}/moveup`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Move the rule down
    #
    # + storeId - Your store identifier 
    # + ruleId - Your rule identifier 
    # + return - Rule moved down 
    remote isolated function moveDownRule(string storeId, string ruleId) returns http:Response|error {
        string path = string `/v2/user/analytics/${storeId}/rules/${ruleId}/movedown`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Enable rule
    #
    # + storeId - Your store identifier 
    # + ruleId - Your rule identifier 
    # + return - Rune enabled 
    remote isolated function enableRule(string storeId, string ruleId) returns http:Response|error {
        string path = string `/v2/user/analytics/${storeId}/rules/${ruleId}/enable`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Disable rule
    #
    # + storeId - Your store identifier 
    # + ruleId - Your rule identifier 
    # + return - Rule disabled 
    remote isolated function disableRule(string storeId, string ruleId) returns http:Response|error {
        string path = string `/v2/user/analytics/${storeId}/rules/${ruleId}/disable`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Run all rules for this store
    #
    # + storeId - Your store identifier 
    # + return - All rules executed. 
    remote isolated function runRules(string storeId) returns http:Response|error {
        string path = string `/v2/user/analytics/${storeId}/rules/run`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Run rule
    #
    # + storeId - Your store identifier 
    # + ruleId - Your rule identifier 
    # + return - Rule executed 
    remote isolated function runRule(string storeId, string ruleId) returns http:Response|error {
        string path = string `/v2/user/analytics/${storeId}/rules/${ruleId}/run`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get the rules execution history
    #
    # + storeId - Your store identifier 
    # + pageNumber - The page to retrieve 
    # + pageSize - The count of rule history to retrieve 
    # + return - Rules executions list 
    remote isolated function getRulesExecutions(string storeId, int pageNumber, int pageSize) returns RuleExecutionReportings|error {
        string path = string `/v2/user/analytics/${storeId}/rules/executions`;
        map<anydata> queryParam = {"pageNumber": pageNumber, "pageSize": pageSize};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        RuleExecutionReportings response = check self.clientEp->get(path, accHeaders, targetType = RuleExecutionReportings);
        return response;
    }
    # List all your current channel catalogs configured to use legacy tracking format
    #
    # + storeId - The store identifier 
    # + return - OK 
    remote isolated function getLegacyTrackingChannelCatalogs(string? storeId = ()) returns LegacyTrackingChannelCatalogList|error {
        string path = string `/v2/user/legacyTracking/channelCatalogs/`;
        map<anydata> queryParam = {"storeId": storeId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        LegacyTrackingChannelCatalogList response = check self.clientEp->get(path, accHeaders, targetType = LegacyTrackingChannelCatalogList);
        return response;
    }
    # Get the channel catalog configured to use legacy tracking format information
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog configured to use legacy tracking format 
    remote isolated function getLegacyTrackingChannelCatalog(string channelCatalogId) returns LegacyTrackingChannelCatalog|error {
        string path = string `/v2/user/legacyTracking/channelCatalogs/${channelCatalogId}`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        LegacyTrackingChannelCatalog response = check self.clientEp->get(path, accHeaders, targetType = LegacyTrackingChannelCatalog);
        return response;
    }
    # Migrate a channel catalog to current tracking format
    #
    # + channelCatalogId - The channel catalog identifier 
    # + return - Channel catalog migrated 
    remote isolated function migrateLegacyTrackingChannelCatalog(string channelCatalogId) returns http:Response|error {
        string path = string `/v2/user/legacyTracking/channelCatalogs/${channelCatalogId}/migrate`;
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
}
