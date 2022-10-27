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

# This is a generated connector for [Numbers API v1.5](https://math.tools/api/numbers/) OpenAPI specification.  
# Numbers API of [Math Tools](https://math.tools/) provides the capability to access the operations that are all about numbers
@display {label: "Math Tools Numbers", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Math tools account](https://math.tools/) and obtain tokens following [this guide](https://math.tools/api/numbers/).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://api.math.tools") returns error? {
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
    # Get the number of the day for current day
    #
    # + return - 200 Success response 
    remote isolated function getNumberOfTheDay() returns json|error {
        string resourcePath = string `/numbers/nod`;
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a random fact about a number
    #
    # + number - Number value 
    # + return - 200 Success response 
    remote isolated function getRandomFactNumber(int number) returns json|error {
        string resourcePath = string `/numbers/fact`;
        map<anydata> queryParam = {"number": number};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Generate random number(s)
    #
    # + min - Minimum Number value in the range 
    # + max - Maximum Number value 
    # + total - Total number of random numbers to generate. Defaults to 1 
    # + return - 200 Success response 
    remote isolated function generateRandomNumbers(int? min = (), int? max = (), int? total = ()) returns json|error {
        string resourcePath = string `/numbers/random`;
        map<anydata> queryParam = {"min": min, "max": max, "total": total};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the ordinal of the given number
    #
    # + number - Number value 
    # + return - 200 Success response 
    remote isolated function getOrdinalOfNumber(int? number = ()) returns json|error {
        string resourcePath = string `/numbers/ordinal`;
        map<anydata> queryParam = {"number": number};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the cardinal of the given number
    #
    # + number - Number value 
    # + language - Language to use 
    # + return - 200 Success response 
    remote isolated function getCardinalOfNumber(int? number = (), string? language = ()) returns json|error {
        string resourcePath = string `/numbers/cardinal`;
        map<anydata> queryParam = {"number": number, "language": language};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Spells out the number as a currency
    #
    # + number - Number to spell 
    # + language - Language to use 
    # + return - 200 Success response 
    remote isolated function spellNumberAsCurrency(int? number = (), string? language = ()) returns json|error {
        string resourcePath = string `/numbers/currency`;
        map<anydata> queryParam = {"number": number, "language": language};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Convert base 10 representation of a given number to egyptian numeral.
    #
    # + number - Number to convert 
    # + return - 200 Success response 
    remote isolated function convertBase10ToEgyptianNumeral(int? number = ()) returns json|error {
        string resourcePath = string `/numbers/numeral/egyptian`;
        map<anydata> queryParam = {"number": number};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Convert base 10 representation of a given number to chinese numeral.
    #
    # + number - Number to convert 
    # + return - 200 Success response 
    remote isolated function convertBase10ToChineseNumeral(int? number = ()) returns json|error {
        string resourcePath = string `/numbers/numeral/chinese`;
        map<anydata> queryParam = {"number": number};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Convert base 10 representation of a given number to roman numeral.
    #
    # + number - Number to convert 
    # + return - 200 Success response 
    remote isolated function convertBase10ToRomanNumeral(int? number = ()) returns json|error {
        string resourcePath = string `/numbers/numeral/roman`;
        map<anydata> queryParam = {"number": number};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Convert a given number to binary
    #
    # + number - Number to convert to binary 
    # + 'from - Base of the supplied number (Optional base 10 assumed by default) 
    # + return - 200 success response 
    remote isolated function convertGivenNumberToBinary(int number, int? 'from = ()) returns json|error {
        string resourcePath = string `/numbers/base/binary`;
        map<anydata> queryParam = {"number": number, "from": 'from};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Convert a given number to octal
    #
    # + number - Number to convert to octal 
    # + 'from - Base of the supplied number (Optional base 10 assumed by default) 
    # + return - 200 success response 
    remote isolated function convertGivenNumberToOctal(int number, int? 'from = ()) returns json|error {
        string resourcePath = string `/numbers/base/octal`;
        map<anydata> queryParam = {"number": number, "from": 'from};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Convert a given number to hexadecimal
    #
    # + number - Number to convert to hex 
    # + 'from - Base of the supplied number (Optional base 10 assumed by default) 
    # + return - 200 success response 
    remote isolated function convertToHexadecimal(int number, int? 'from = ()) returns json|error {
        string resourcePath = string `/numbers/base/hex`;
        map<anydata> queryParam = {"number": number, "from": 'from};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Convert a given number from one base to another base
    #
    # + number - Number to convert to the target base 
    # + 'from - Base of the supplied number (Optional base 10 assumed by default) 
    # + to - Target base to convert to 
    # + return - 200 success response 
    remote isolated function convertBase(int number, int to, int? 'from = ()) returns json|error {
        string resourcePath = string `/numbers/base`;
        map<anydata> queryParam = {"number": number, "from": 'from, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get digits of pi (Ã,â‚¬)
    #
    # + 'from - Optional start position 
    # + to - Optional start position 
    # + return - 200 Success response 
    remote isolated function getDigitsOfPI(int? 'from = (), int? to = ()) returns json|error {
        string resourcePath = string `/numbers/pi`;
        map<anydata> queryParam = {"from": 'from, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Checks whether a given number is a known prime number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function checkNumberIsPrime(int? number = ()) returns json|error {
        string resourcePath = string `/numbers/prime/is-prime`;
        map<anydata> queryParam = {"number": number};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Checks whether a given number is a known mersenne prime number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function checkNumberIsMersennePrime(int? number = ()) returns json|error {
        string resourcePath = string `/numbers/prime/is-mersenne-prime`;
        map<anydata> queryParam = {"number": number};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Checks whether a given number is a known fermat prime number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function checkNumberIsFermatPrice(int? number = ()) returns json|error {
        string resourcePath = string `/numbers/prime/is-fermat-prime`;
        map<anydata> queryParam = {"number": number};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Checks whether a given number is a known pell prime number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function checkNumberIsKnownPellPrime(int? number = ()) returns json|error {
        string resourcePath = string `/numbers/prime/is-pell-prime`;
        map<anydata> queryParam = {"number": number};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Checks whether a given number is a known partition prime number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function checkNumberIsKnownPartitionPrime(int? number = ()) returns json|error {
        string resourcePath = string `/numbers/prime/is-partition-prime`;
        map<anydata> queryParam = {"number": number};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Checks whether a given number is a known fibonacci prime number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function checkNumberIsKnownFibonacciPrime(int? number = ()) returns json|error {
        string resourcePath = string `/numbers/prime/is-fibonacci-prime`;
        map<anydata> queryParam = {"number": number};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the prime factors of a given number.
    #
    # + number - Number to get the factors 
    # + return - 200 Success response 
    remote isolated function getPrimeFactors(int? number = ()) returns json|error {
        string resourcePath = string `/numbers/prime/factors`;
        map<anydata> queryParam = {"number": number};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Checks whether a given number is a palindrome number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function checkNumberIsPalindrome(int? number = ()) returns json|error {
        string resourcePath = string `/numbers/is-palindrome`;
        map<anydata> queryParam = {"number": number};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Checks whether a given number is a triangle number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function checkNumberIsTriangle(int? number = ()) returns json|error {
        string resourcePath = string `/numbers/is-triangle`;
        map<anydata> queryParam = {"number": number};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Checks whether a given number is a cube number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function checkNumberIsCube(int? number = ()) returns json|error {
        string resourcePath = string `/numbers/is-cube`;
        map<anydata> queryParam = {"number": number};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Checks whether a given number is a square number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function checkNumberIsSquare(int? number = ()) returns json|error {
        string resourcePath = string `/numbers/is-square`;
        map<anydata> queryParam = {"number": number};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Checks whether a given number is a perfect number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function getNumberIsPerfect(int? number = ()) returns json|error {
        string resourcePath = string `/numbers/prime/is-perfect`;
        map<anydata> queryParam = {"number": number};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeyConfig.xMathtoolsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
