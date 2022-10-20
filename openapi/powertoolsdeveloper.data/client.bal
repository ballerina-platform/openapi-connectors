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
    # Represents API Key `X-IBM-Client-Id`
    string xIbmClientId;
|};

# This is a generated connector for [Apptigent PowerTools Developer API v2021.1.01](https://portal.apptigent.com/node/612) OpenAPI specification.
# 'Apptigent PowerTools Developer Edition is a powerful suite of API endpoints for custom applications running on any stack. 
# Manipulate text, modify collections, format dates and times, convert currency, perform advanced mathematical calculations, shorten URL's, encode strings, convert text to speech, translate content into multiple languages, process images, and more. 
# PowerTools is the ultimate developer toolkit.'
# This connector provides the capability for data conversion.
@display {label: "PowerTools Developer Data", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Please create an [Apptigent account](https://portal.apptigent.com/user/register) and obtain tokens following [this guide](https://portal.apptigent.com/start).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://connect.apptigent.com/api/utilities") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Data - JSON to HTML Table
    #
    # + payload - Input json conversion parameters 
    # + return - OK 
    remote isolated function jsonToHtml(InputJsonConversionHTML payload) returns OutputString|error {
        string resourcePath = string `/JSONtoHTML`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Data - JSON to CSV
    #
    # + payload - Input json conversion parameters 
    # + return - OK 
    remote isolated function jsonToCsv(InputJsonConversionCSV payload) returns OutputString|error {
        string resourcePath = string `/JSONtoCSV`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Data - JSON to XML
    #
    # + payload - Input json conversion parameters 
    # + return - OK 
    remote isolated function jsonToXml(InputJsonConversionXML payload) returns OutputString|error {
        string resourcePath = string `/JSONtoXML`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Data - CSV to JSON
    #
    # + payload - Input CSV conversion parameters 
    # + return - OK 
    remote isolated function csvToJson(InputCsvConversionJSON payload) returns OutputString|error {
        string resourcePath = string `/CSVtoJSON`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Data - XML to JSON
    #
    # + payload - Input XML conversion parameters 
    # + return - OK 
    remote isolated function xmlToJson(InputXmlConversionJSON payload) returns OutputString|error {
        string resourcePath = string `/XMLtoJSON`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Data - Query JSON
    #
    # + payload - Input data query parameters 
    # + return - OK 
    remote isolated function queryJson(InputDataQuery payload) returns OutputString|error {
        string resourcePath = string `/QueryJSON`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Data - Query XML
    #
    # + payload - Input data query parameters 
    # + return - OK 
    remote isolated function queryXml(InputDataQuery payload) returns OutputString|error {
        string resourcePath = string `/QueryXML`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
