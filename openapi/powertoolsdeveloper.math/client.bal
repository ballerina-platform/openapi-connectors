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

# This is a generated connector for [Apptigent PowerTools Developer API v2021.1.01](https://portal.apptigent.com/node/612) OpenAPI specification.
# 'Apptigent PowerTools Developer Edition is a powerful suite of API endpoints for custom applications running on any stack. 
# Manipulate text, modify collections, format dates and times, convert currency, perform advanced mathematical calculations, shorten URL's, encode strings, convert text to speech, translate content into multiple languages, process images, and more. 
# PowerTools is the ultimate developer toolkit.'
# This connector provides the capability for mathematical calculations and conversions.
@display {label: "PowerTools Developer Math", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [Apptigent account](https://portal.apptigent.com/user/register) and obtain tokens following [this guide](https://portal.apptigent.com/start).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://connect.apptigent.com/api/utilities") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Math - Calculate average
    #
    # + payload - Series calculation parameters 
    # + return - OK 
    remote isolated function calculateAverage(InputCalculateSeries payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateAverage`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate median
    #
    # + payload - Series calculation parameters 
    # + return - OK 
    remote isolated function calculateMedian(InputCalculateSeries payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateMedian`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate minimum or maximum
    #
    # + payload - Series calculation parameters 
    # + return - OK 
    remote isolated function calculateMinMax(InputCalculateMinMax payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateMinMax`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate sum
    #
    # + payload - Series calculation parameters 
    # + return - OK 
    remote isolated function calculateSum(InputCalculateSeries payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateSum`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate power
    #
    # + payload - Power calculation parameters 
    # + return - OK 
    remote isolated function calculatePower(InputCalculatePower payload) returns OutputNumber|error {
        string resourcePath = string `/CalculatePower`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate variance
    #
    # + payload - Series calculation parameters 
    # + return - OK 
    remote isolated function calculateVariance(InputCalculateSeries payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateVariance`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Addition
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateAddition(InputCalculateNumbers payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateAddition`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Subtraction
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateSubtraction(InputCalculateNumbers payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateSubtraction`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Multiplication
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateMultiplication(InputCalculateNumbers payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateMultiplication`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Division
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateDivision(InputCalculateNumbers payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateDivision`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Modulo
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateModulo(InputCalculateNumbers payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateModulo`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Nth Root
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateNthRoot(InputCalculateNumbers payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateNthRoot`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Square Root
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateSquareRoot(InputCalculateNumber payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateSquareRoot`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Logarithm
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateLogarithm(InputCalculateNumber payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateLogarithm`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Sine
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateSine(InputCalculateNumber payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateSine`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Cosine
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateCosine(InputCalculateNumber payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateCosine`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Tangent
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateTangent(InputCalculateNumber payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateTangent`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Absolute
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateAbsolute(InputCalculateNumber payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateAbsolute`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Convert angle
    #
    # + payload - Input convert angle parameters 
    # + return - OK 
    remote isolated function convertAngle(InputConvertAngle payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertAngle`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Convert area
    #
    # + payload - Input convert area parameters 
    # + return - OK 
    remote isolated function convertArea(InputConvertArea payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertArea`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Convert distance
    #
    # + payload - Input convert distance parameters 
    # + return - OK 
    remote isolated function convertDistance(InputConvertDistance payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertDistance`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Convert duration
    #
    # + payload - Input convert duration parameters 
    # + return - OK 
    remote isolated function convertDuration(InputConvertDuration payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertDuration`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Convert energy
    #
    # + payload - Input convert energy parameters 
    # + return - OK 
    remote isolated function convertEnergy(InputConvertEnergy payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertEnergy`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Convert power
    #
    # + payload - Input convert power parameters 
    # + return - OK 
    remote isolated function convertPower(InputConvertPower payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertPower`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Convert speed
    #
    # + payload - Input convert speed parameters 
    # + return - OK 
    remote isolated function convertSpeed(InputConvertSpeed payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertSpeed`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Convert temperature
    #
    # + payload - Input convert temperature parameters 
    # + return - OK 
    remote isolated function convertTemperature(InputConvertTemperature payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertTemperature`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Convert volume
    #
    # + payload - Input convert volume parameters 
    # + return - OK 
    remote isolated function convertVolume(InputConvertVolume payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertVolume`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Convert weight
    #
    # + payload - Input convert weight parameters 
    # + return - OK 
    remote isolated function convertWeight(InputConvertWeight payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertWeight`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Random number
    #
    # + payload - Input number range parameters 
    # + return - OK 
    remote isolated function randomNumber(InputNumberRange payload) returns OutputNumber|error {
        string resourcePath = string `/RandomNumber`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Round number
    #
    # + payload - Numeric calculation parameters 
    # + return - OK 
    remote isolated function roundNumber(InputCalculateNumber payload) returns OutputNumber|error {
        string resourcePath = string `/RoundNumber`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate standard deviation
    #
    # + payload - Series calculation parameters 
    # + return - OK 
    remote isolated function standardDeviation(InputCalculateSeries payload) returns OutputNumber|error {
        string resourcePath = string `/StandardDeviation`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
