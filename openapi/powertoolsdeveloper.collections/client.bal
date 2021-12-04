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
    # Represents API Key `X-IBM-Client-Id`
    string xIbmClientId;
|};

# This is a generated connector for [Apptigent PowerTools Developer API v2021.1.01](https://portal.apptigent.com/node/612) OpenAPI specification.
# 'Apptigent PowerTools Developer Edition is a powerful suite of API endpoints for custom applications running on any stack. 
# Manipulate text, modify collections, format dates and times, convert currency, perform advanced mathematical calculations, shorten URL''s, encode strings, convert text to speech, translate content into multiple languages, process images, and more. 
# PowerTools is the ultimate developer toolkit.'
# This connector provides the capability to modify collections.
@display {label: "PowerTools Developer Collections", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [Apptigent account](https://portal.apptigent.com/user/register) and obtain tokens following [this guide](https://portal.apptigent.com/start).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://connect.apptigent.com/api/utilities") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Collections - Add to collection
    #
    # + payload - Collection modification parameters 
    # + return - OK 
    remote isolated function addToCollection(InputCollectionModify payload) returns OutputCollectionResult|error {
        string  path = string `/AddToCollection`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputCollectionResult response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputCollectionResult);
        return response;
    }
    # Collections - Remove from collection
    #
    # + payload - Collection modification parameters 
    # + return - OK 
    remote isolated function removeFromCollection(InputCollectionModify payload) returns OutputCollectionResult|error {
        string  path = string `/RemoveFromCollection`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputCollectionResult response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputCollectionResult);
        return response;
    }
    # Collections - Filter collection
    #
    # + payload - Filter collection parameters 
    # + return - OK 
    remote isolated function filterCollection(InputCollectionFilter payload) returns OutputCollectionResult|error {
        string  path = string `/FilterCollection`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputCollectionResult response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputCollectionResult);
        return response;
    }
    # Collections - Sort collection
    #
    # + payload - Sort collection parameters 
    # + return - OK 
    remote isolated function sortCollection(InputCollectionSort payload) returns OutputCollectionResult|error {
        string  path = string `/SortCollection`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputCollectionResult response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputCollectionResult);
        return response;
    }
    # Collections - Count collection
    #
    # + payload - Count collection parameters 
    # + return - OK 
    remote isolated function countCollection(InputCollectionCount payload) returns OutputNumber|error {
        string  path = string `/CountCollection`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputNumber response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputNumber);
        return response;
    }
    # Collections - Split collection
    #
    # + payload - Split collection parameters 
    # + return - OK 
    remote isolated function splitCollection(InputCollectionSplit payload) returns OutputMultiCollection|error {
        string  path = string `/SplitCollection`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputMultiCollection response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputMultiCollection);
        return response;
    }
    # Collections - Replace values in collection
    #
    # + payload - Replace values in collection parameters 
    # + return - OK 
    remote isolated function replaceValuesInCollection(InputCollectionReplace payload) returns OutputCollectionResult|error {
        string  path = string `/ReplaceValuesInCollection`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputCollectionResult response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputCollectionResult);
        return response;
    }
    # Collections - Contains string
    #
    # + payload - Collection search parameters 
    # + return - OK 
    remote isolated function collectionContainsString(InputCollectionSearch payload) returns OutputCollectionString|error {
        string  path = string `/CollectionContainsString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputCollectionString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputCollectionString);
        return response;
    }
    # Collections - Starts with string
    #
    # + payload - Collection search parameters 
    # + return - OK 
    remote isolated function collectionStartsWithString(InputCollectionSearch payload) returns OutputCollectionString|error {
        string  path = string `/CollectionStartsWithString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputCollectionString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputCollectionString);
        return response;
    }
    # Collections - Ends with string
    #
    # + payload - Collection search parameters 
    # + return - OK 
    remote isolated function collectionEndsWithString(InputCollectionSearch payload) returns OutputCollectionString|error {
        string  path = string `/CollectionEndsWithString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputCollectionString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputCollectionString);
        return response;
    }
    # Collections - Contains number
    #
    # + payload - Collection search parameters 
    # + return - OK 
    remote isolated function collectionContainsNumber(InputCollectionSearchNumeric payload) returns OutputCollectionNumber|error {
        string  path = string `/CollectionContainsNumber`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputCollectionNumber response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputCollectionNumber);
        return response;
    }
    # Collections - Collection to JSON
    #
    # + payload - Collection conversion parameters 
    # + return - OK 
    remote isolated function collectionToJSON(InputCollectionConversion payload) returns OutputString|error {
        string  path = string `/CollectionToJSON`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # Collections - Collection to XML
    #
    # + payload - Collection conversion parameters 
    # + return - OK 
    remote isolated function collectionToXml(InputCollectionConversionXML payload) returns OutputString|error {
        string  path = string `/CollectionToXML`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
}
