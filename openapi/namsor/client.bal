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
    # All requests on the NamSor API needs to include an API key. The API key can be provided as part of the query string or as a request header. The name of the API key needs to be `X-API-KEY`
    string xApiKey;
|};

# This is a generated connector for [NamSor API v2](https://v2.namsor.com/NamSorAPIv2/index.html) OpenAPI specification. 
# The NamSor API provides the capability to process personal names (gender, cultural origin or ethnicity) in all alphabets or languages.
@display {label: "NamSor", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [NamSor Account](https://v2.namsor.com/NamSorAPIv2/sign-in.html) and obtain tokens following [this guide](https://v2.namsor.com/NamSorAPIv2/apidoc.html).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://v2.namsor.com/NamSorAPIv2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # [USES 10 UNITS PER NAME] Infer the likely country of residence of a personal full name, or one surname. Assumes names as they are in the country of residence OR the country of origin.
    #
    # + personalNameFull - Personal full name 
    # + return - A origined name. 
    remote isolated function country(string personalNameFull) returns PersonalNameGeoOut|error {
        string resourcePath = string `/api2/json/country/${personalNameFull}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PersonalNameGeoOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Infer the likely type of a proper noun (personal name, brand name, place name etc.)
    #
    # + properNoun - The proper noun 
    # + return - A typed name. 
    remote isolated function nameType(string properNoun) returns ProperNounCategorizedOut|error {
        string resourcePath = string `/api2/json/nameType/${properNoun}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ProperNounCategorizedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Activate/deactivate an API Key.
    #
    # + 'source - The API Key to set as enabled/disabled. 
    # + disabled - Disbled/Not disabled 
    # + return - Disabled the API Key. 
    remote isolated function disable(string 'source, boolean disabled) returns http:Response|error {
        string resourcePath = string `/api2/json/disable/${'source}/${disabled}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # [USES 10 UNITS PER NAME] Infer the likely country of origin of a personal name. Assumes names as they are in the country of origin. For US, CA, AU, NZ and other melting-pots : use 'diaspora' instead.
    #
    # + firstName - First name 
    # + lastName - Last name 
    # + return - A origined name. 
    remote isolated function origin(string firstName, string lastName) returns FirstLastNameOriginedOut|error {
        string resourcePath = string `/api2/json/origin/${firstName}/${lastName}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FirstLastNameOriginedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the current software version
    #
    # + return - The current software version 
    remote isolated function softwareVersion() returns SoftwareVersionOut|error {
        string resourcePath = string `/api2/json/softwareVersion`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SoftwareVersionOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Prints the current status of the classifiers. A classifier name in apiStatus corresponds to a service name in apiServices.
    #
    # + return - Available classifiers and status 
    remote isolated function apiStatus() returns APIClassifiersStatusOut|error {
        string resourcePath = string `/api2/json/apiStatus`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        APIClassifiersStatusOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List of classification services and usage cost in Units per classification (default is 1=ONE Unit). Some API endpoints (ex. Corridor) combine multiple classifiers.
    #
    # + return - Available services 
    remote isolated function availableServices() returns APIServicesOut|error {
        string resourcePath = string `/api2/json/apiServices`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        APIServicesOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Print the taxonomy classes valid for the given classifier.
    #
    # + classifierName - Name of the classifier 
    # + return - Available plans 
    remote isolated function taxonomyClasses(string classifierName) returns APIClassifierTaxonomyOut|error {
        string resourcePath = string `/api2/json/taxonomyClasses/${classifierName}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        APIClassifierTaxonomyOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Print current API usage.
    #
    # + return - Print current API usage. 
    remote isolated function apiUsage() returns APIPeriodUsageOut|error {
        string resourcePath = string `/api2/json/apiUsage`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        APIPeriodUsageOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Print historical API usage.
    #
    # + return - Print historical API usage (NB. new output format form v2.0.15) 
    remote isolated function apiUsageHistory() returns APIUsageHistoryOut|error {
        string resourcePath = string `/api2/json/apiUsageHistory`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        APIUsageHistoryOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Print historical API usage (in an aggregated view, by service, by day/hour/min).
    #
    # + return - Print historical API usage. 
    remote isolated function apiUsageHistoryAggregate() returns APIUsageAggregatedOut|error {
        string resourcePath = string `/api2/json/apiUsageHistoryAggregate`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        APIUsageAggregatedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Activate/deactivate learning from a source.
    #
    # + 'source - The API Key to set as learnable/non learnable. 
    # + learnable - Learnable/non learnable. 
    # + return - Set learning from source. 
    remote isolated function learnable(string 'source, boolean learnable) returns http:Response|error {
        string resourcePath = string `/api2/json/learnable/${'source}/${learnable}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Activate/deactivate anonymization for a source.
    #
    # + 'source - The API Key to set as anonymized/non anonymized. 
    # + anonymized - Anonymized/non anonymized. 
    # + return - Anonymization of a source. 
    remote isolated function anonymize(string 'source, boolean anonymized) returns http:Response|error {
        string resourcePath = string `/api2/json/anonymize/${'source}/${anonymized}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Infer the likely type of a proper noun (personal name, brand name, place name etc.)
    #
    # + properNoun - The proper noun 
    # + countryIso2 - ISO2 country code 
    # + return - A typed name. 
    remote isolated function nameTypeGeo(string properNoun, string countryIso2) returns ProperNounCategorizedOut|error {
        string resourcePath = string `/api2/json/nameTypeGeo/${properNoun}/${countryIso2}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ProperNounCategorizedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Infer the likely common type of up to 100 proper nouns (personal name, brand name, place name etc.)
    #
    # + payload - A list of proper names 
    # + return - A list of commonTypeized names. 
    remote isolated function nameTypeBatch(BatchNameIn payload) returns BatchProperNounCategorizedOut|error {
        string resourcePath = string `/api2/json/nameTypeBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchProperNounCategorizedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Infer the likely common type of up to 100 proper nouns (personal name, brand name, place name etc.)
    #
    # + payload - A list of proper names 
    # + return - A list of commonTypeized names. 
    remote isolated function nameTypeGeoBatch(BatchNameGeoIn payload) returns BatchProperNounCategorizedOut|error {
        string resourcePath = string `/api2/json/nameTypeGeoBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchProperNounCategorizedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # [USES 20 UNITS PER NAME COUPLE] Infer several classifications for a cross border interaction between names (ex. remit, travel, intl com)
    #
    # + countryIso2From - Start ISO2 country code to filter 
    # + firstNameFrom - Start first name to filter 
    # + lastNameFrom - Start last name to filter 
    # + countryIso2To - End ISO2 country code to filter 
    # + firstNameTo - End first name to filter 
    # + lastNameTo - End last name to filter 
    # + return - Two classified names. 
    remote isolated function corridor(string countryIso2From, string firstNameFrom, string lastNameFrom, string countryIso2To, string firstNameTo, string lastNameTo) returns CorridorOut|error {
        string resourcePath = string `/api2/json/corridor/${countryIso2From}/${firstNameFrom}/${lastNameFrom}/${countryIso2To}/${firstNameTo}/${lastNameTo}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CorridorOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # [USES 20 UNITS PER NAME PAIR] Infer several classifications for up to 100 cross border interaction between names (ex. remit, travel, intl com)
    #
    # + payload - A list of name pairs, with country code (nameFrom -> nameTo). 
    # + return - A list of classified name pairs. 
    remote isolated function corridorBatch(BatchCorridorIn payload) returns BatchCorridorOut|error {
        string resourcePath = string `/api2/json/corridorBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchCorridorOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Infer the likely gender of a name.
    #
    # + firstName - First name 
    # + lastName - Last name 
    # + return - A genderized name. 
    remote isolated function gender(string firstName, string lastName) returns FirstLastNameGenderedOut|error {
        string resourcePath = string `/api2/json/gender/${firstName}/${lastName}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FirstLastNameGenderedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Infer the likely gender of a name, given a local context (ISO2 country code).
    #
    # + firstName - First name 
    # + lastName - Last name 
    # + countryIso2 - ISO2 country code 
    # + return - A genderized name. 
    remote isolated function genderGeo(string firstName, string lastName, string countryIso2) returns FirstLastNameGenderedOut|error {
        string resourcePath = string `/api2/json/genderGeo/${firstName}/${lastName}/${countryIso2}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FirstLastNameGenderedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Infer the likely gender of up to 100 names, each given a local context (ISO2 country code).
    #
    # + payload - A list of names, with country code. 
    # + return - A list of genderized names. 
    remote isolated function genderGeoBatch(BatchFirstLastNameGeoIn payload) returns BatchFirstLastNameGenderedOut|error {
        string resourcePath = string `/api2/json/genderGeoBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchFirstLastNameGenderedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Infer the likely gender of up to 100 names, detecting automatically the cultural context.
    #
    # + payload - A list of personal names 
    # + return - A list of genderized names. 
    remote isolated function genderBatch(BatchFirstLastNameIn payload) returns BatchFirstLastNameGenderedOut|error {
        string resourcePath = string `/api2/json/genderBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchFirstLastNameGenderedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Infer the likely gender of a full name, given a local context (ISO2 country code).
    #
    # + fullName - Full name 
    # + countryIso2 - ISO2 country code 
    # + return - A genderized name. 
    remote isolated function genderFullGeo(string fullName, string countryIso2) returns PersonalNameGenderedOut|error {
        string resourcePath = string `/api2/json/genderFullGeo/${fullName}/${countryIso2}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PersonalNameGenderedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Infer the likely gender of a full name, ex. John H. Smith
    #
    # + fullName - Full name 
    # + return - A genderized name. 
    remote isolated function genderFull(string fullName) returns PersonalNameGenderedOut|error {
        string resourcePath = string `/api2/json/genderFull/${fullName}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PersonalNameGenderedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Infer the likely gender of up to 100 full names, detecting automatically the cultural context.
    #
    # + payload - A list of personal names 
    # + return - A list of genderized names. 
    remote isolated function genderFullBatch(BatchPersonalNameIn payload) returns BatchPersonalNameGenderedOut|error {
        string resourcePath = string `/api2/json/genderFullBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchPersonalNameGenderedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Infer the likely gender of up to 100 full names, with a given cultural context (country ISO2 code).
    #
    # + payload - A list of personal names, with a country ISO2 code 
    # + return - A list of genderized names. 
    remote isolated function genderFullGeoBatch(BatchPersonalNameGeoIn payload) returns BatchPersonalNameGenderedOut|error {
        string resourcePath = string `/api2/json/genderFullGeoBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchPersonalNameGenderedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # [USES 10 UNITS PER NAME] Infer the likely country of origin of up to 100 names, detecting automatically the cultural context.
    #
    # + payload - A list of personal names 
    # + return - A list of genderized names. 
    remote isolated function originBatch(BatchFirstLastNameIn payload) returns BatchFirstLastNameOriginedOut|error {
        string resourcePath = string `/api2/json/originBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchFirstLastNameOriginedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # [USES 10 UNITS PER NAME] Infer the likely country of residence of up to 100 personal full names, or surnames. Assumes names as they are in the country of residence OR the country of origin.
    #
    # + payload - A list of personal names 
    # + return - A list of genderized names. 
    remote isolated function countryBatch(BatchPersonalNameIn payload) returns BatchPersonalNameGeoOut|error {
        string resourcePath = string `/api2/json/countryBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchPersonalNameGeoOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # [USES 10 UNITS PER NAME] Infer a US resident's likely race/ethnicity according to US Census taxonomy W_NL (white, non latino), HL (hispano latino),  A (asian, non latino), B_NL (black, non latino). Optionally add header X-OPTION-USRACEETHNICITY-TAXONOMY: USRACEETHNICITY-6CLASSES for two additional classes, AI_AN (American Indian or Alaskan Native) and PI (Pacific Islander).
    #
    # + firstName - First name 
    # + lastName - Last name 
    # + return - a US resident's likely race/ethnicity : W_NL (white, non latino), HL (hispano latino),  A (asian, non latino), B_NL (black, non latino), AI_AN (American Indian or Alaskan Native*) and PI (Pacific Islander*). *optionally 
    remote isolated function usRaceEthnicity(string firstName, string lastName) returns FirstLastNameUSRaceEthnicityOut|error {
        string resourcePath = string `/api2/json/usRaceEthnicity/${firstName}/${lastName}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FirstLastNameUSRaceEthnicityOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # [USES 10 UNITS PER NAME] Infer a US resident's likely race/ethnicity according to US Census taxonomy, using (optional) ZIP5 code info. Output is W_NL (white, non latino), HL (hispano latino),  A (asian, non latino), B_NL (black, non latino). Optionally add header X-OPTION-USRACEETHNICITY-TAXONOMY: USRACEETHNICITY-6CLASSES for two additional classes, AI_AN (American Indian or Alaskan Native) and PI (Pacific Islander).
    #
    # + firstName - First name 
    # + lastName - Last name 
    # + zip5Code - 5-digit ZIP Code 
    # + return - a US resident's likely race/ethnicity : W_NL (white, non latino), HL (hispano latino),  A (asian, non latino), B_NL (black, non latino), AI_AN (American Indian or Alaskan Native*) and PI (Pacific Islander*). *optionally 
    remote isolated function usRaceEthnicityZIP5(string firstName, string lastName, string zip5Code) returns FirstLastNameUSRaceEthnicityOut|error {
        string resourcePath = string `/api2/json/usRaceEthnicityZIP5/${firstName}/${lastName}/${zip5Code}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FirstLastNameUSRaceEthnicityOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # [USES 10 UNITS PER NAME] Infer up-to 100 US resident's likely race/ethnicity according to US Census taxonomy. Output is W_NL (white, non latino), HL (hispano latino),  A (asian, non latino), B_NL (black, non latino). Optionally add header X-OPTION-USRACEETHNICITY-TAXONOMY: USRACEETHNICITY-6CLASSES for two additional classes, AI_AN (American Indian or Alaskan Native) and PI (Pacific Islander).
    #
    # + payload - A list of personal names 
    # + return - A list of US resident's likely race/ethnicity. W_NL (white, non latino), HL (hispano latino),  A (asian, non latino), B_NL (black, non latino), AI_AN (American Indian or Alaskan Native*) and PI (Pacific Islander*). *optionally 
    remote isolated function usRaceEthnicityBatch(BatchFirstLastNameGeoIn payload) returns BatchFirstLastNameUSRaceEthnicityOut|error {
        string resourcePath = string `/api2/json/usRaceEthnicityBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchFirstLastNameUSRaceEthnicityOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # [USES 10 UNITS PER NAME] Infer up-to 100 US resident's likely race/ethnicity according to US Census taxonomy, with (optional) ZIP code. Output is W_NL (white, non latino), HL (hispano latino),  A (asian, non latino), B_NL (black, non latino). Optionally add header X-OPTION-USRACEETHNICITY-TAXONOMY: USRACEETHNICITY-6CLASSES for two additional classes, AI_AN (American Indian or Alaskan Native) and PI (Pacific Islander).
    #
    # + payload - A list of personal names 
    # + return - A list of US resident's likely race/ethnicity. W_NL (white, non latino), HL (hispano latino),  A (asian, non latino), B_NL (black, non latino), AI_AN (American Indian or Alaskan Native*) and PI (Pacific Islander*). *optionally 
    remote isolated function usZipRaceEthnicityBatch(BatchFirstLastNameGeoZippedIn payload) returns BatchFirstLastNameUSRaceEthnicityOut|error {
        string resourcePath = string `/api2/json/usZipRaceEthnicityBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchFirstLastNameUSRaceEthnicityOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # [USES 20 UNITS PER NAME] Infer the likely ethnicity/diaspora of a personal name, given a country of residence ISO2 code (ex. US, CA, AU, NZ etc.)
    #
    # + countryIso2 - ISO2 country code 
    # + firstName - First name 
    # + lastName - Last name 
    # + return - A diaspora / ethnicity for given name and geography. 
    remote isolated function diaspora(string countryIso2, string firstName, string lastName) returns FirstLastNameDiasporaedOut|error {
        string resourcePath = string `/api2/json/diaspora/${countryIso2}/${firstName}/${lastName}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FirstLastNameDiasporaedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # [USES 20 UNITS PER NAME] Infer the likely ethnicity/diaspora of up to 100 personal names, given a country of residence ISO2 code (ex. US, CA, AU, NZ etc.)
    #
    # + payload - A list of personal names 
    # + return - A list of diaspora / ethnicity given a name and residency. 
    remote isolated function diasporaBatch(BatchFirstLastNameGeoIn payload) returns BatchFirstLastNameDiasporaedOut|error {
        string resourcePath = string `/api2/json/diasporaBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchFirstLastNameDiasporaedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Infer the likely first/last name structure of a name, ex. John Smith or SMITH, John or SMITH; John. For better accuracy, provide a geographic context.
    #
    # + nameFull - Full name 
    # + countryIso2 - ISO2 country code 
    # + return - A origined name. 
    remote isolated function parseNameGeo(string nameFull, string countryIso2) returns PersonalNameParsedOut|error {
        string resourcePath = string `/api2/json/parseName/${nameFull}/${countryIso2}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PersonalNameParsedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Infer the likely first/last name structure of a name, ex. John Smith or SMITH, John or SMITH; John.
    #
    # + payload - A list of personal names 
    # + return - A list of parsed names. 
    remote isolated function parseNameBatch(BatchPersonalNameIn payload) returns BatchPersonalNameParsedOut|error {
        string resourcePath = string `/api2/json/parseNameBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchPersonalNameParsedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Infer the likely first/last name structure of a name, ex. John Smith or SMITH, John or SMITH; John. Giving a local context improves precision. 
    #
    # + payload - A list of personal names 
    # + return - A list of parsed names. 
    remote isolated function parseNameGeoBatch(BatchPersonalNameGeoIn payload) returns BatchPersonalNameParsedOut|error {
        string resourcePath = string `/api2/json/parseNameGeoBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchPersonalNameParsedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Infer the likely first/last name structure of a name, ex. 王晓明 -> 王(surname) 晓明(given name)
    #
    # + chineseName - Chinese name 
    # + return - A origined name. 
    remote isolated function parseChineseName(string chineseName) returns PersonalNameParsedOut|error {
        string resourcePath = string `/api2/json/parseChineseName/${chineseName}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PersonalNameParsedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Infer the likely first/last name structure of a name, ex. 王晓明 -> 王(surname) 晓明(given name).
    #
    # + payload - A list of personal names 
    # + return - A list of parsed names. 
    remote isolated function parseChineseNameBatch(BatchPersonalNameIn payload) returns BatchPersonalNameParsedOut|error {
        string resourcePath = string `/api2/json/parseChineseNameBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchPersonalNameParsedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Romanize the Chinese name to Pinyin, ex. 王晓明 -> Wang (surname) Xiaoming (given name)
    #
    # + chineseName - Chinese name 
    # + return - A pinyin name. 
    remote isolated function pinyinChineseName(string chineseName) returns PersonalNameParsedOut|error {
        string resourcePath = string `/api2/json/pinyinChineseName/${chineseName}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PersonalNameParsedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Romanize a list of Chinese name to Pinyin, ex. 王晓明 -> Wang (surname) Xiaoming (given name).
    #
    # + payload - A list of Chinese names 
    # + return - A list of Pinyin names. 
    remote isolated function pinyinChineseNameBatch(BatchPersonalNameIn payload) returns BatchPersonalNameParsedOut|error {
        string resourcePath = string `/api2/json/pinyinChineseNameBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchPersonalNameParsedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Return a score for matching Chinese name ex. 王晓明 with a romanized name ex. Wang Xiaoming
    #
    # + chineseSurnameLatin - Chinese sur name in latin 
    # + chineseGivenNameLatin - Chinese given name in latin 
    # + chineseName - Chinese name 
    # + return - A romanized name. 
    remote isolated function chineseNameMatch(string chineseSurnameLatin, string chineseGivenNameLatin, string chineseName) returns NameMatchedOut|error {
        string resourcePath = string `/api2/json/chineseNameMatch/${chineseSurnameLatin}/${chineseGivenNameLatin}/${chineseName}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NameMatchedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Identify Chinese name candidates, based on the romanized name (firstName = chineseGivenName; lastName=chineseSurname), ex. Wang Xiaoming
    #
    # + payload - A list of personal Chinese names in LATIN, firstName = chineseGivenName; lastName=chineseSurname 
    # + return - A list of genderized names. 
    remote isolated function chineseNameMatchBatch(BatchMatchPersonalFirstLastNameIn payload) returns BatchNameMatchedOut|error {
        string resourcePath = string `/api2/json/chineseNameMatchBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchNameMatchedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Infer the likely gender of a Chinese name in LATIN (Pinyin).
    #
    # + chineseSurnameLatin - Chinese sur name in latin 
    # + chineseGivenNameLatin - Chinese given name in latin 
    # + return - A genderized name. 
    remote isolated function genderChineseNamePinyin(string chineseSurnameLatin, string chineseGivenNameLatin) returns FirstLastNameGenderedOut|error {
        string resourcePath = string `/api2/json/genderChineseNamePinyin/${chineseSurnameLatin}/${chineseGivenNameLatin}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FirstLastNameGenderedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Infer the likely gender of up to 100 Chinese names in LATIN (Pinyin).
    #
    # + payload - A list of names, with country code. 
    # + return - A list of genderized names. 
    remote isolated function genderChineseNamePinyinBatch(BatchFirstLastNameIn payload) returns BatchFirstLastNameGenderedOut|error {
        string resourcePath = string `/api2/json/genderChineseNamePinyinBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchFirstLastNameGenderedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Infer the likely gender of a Chinese full name ex. 王晓明
    #
    # + chineseName - Chinese name 
    # + return - A genderized name. 
    remote isolated function genderChineseName(string chineseName) returns PersonalNameGenderedOut|error {
        string resourcePath = string `/api2/json/genderChineseName/${chineseName}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PersonalNameGenderedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Infer the likely gender of up to 100 full names ex. 王晓明
    #
    # + payload - A list of personal names, with a country ISO2 code 
    # + return - A list of genderized names. 
    remote isolated function genderChineseNameBatch(BatchPersonalNameIn payload) returns BatchPersonalNameGenderedOut|error {
        string resourcePath = string `/api2/json/genderChineseNameBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchPersonalNameGenderedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Identify Chinese name candidates, based on the romanized name ex. Wang Xiaoming
    #
    # + chineseSurnameLatin - Chinese sur name in latin 
    # + chineseGivenNameLatin - Chinese given name in latin 
    # + return - A romanized name. 
    remote isolated function chineseNameCandidates(string chineseSurnameLatin, string chineseGivenNameLatin) returns NameMatchCandidatesOut|error {
        string resourcePath = string `/api2/json/chineseNameCandidates/${chineseSurnameLatin}/${chineseGivenNameLatin}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NameMatchCandidatesOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Identify Chinese name candidates, based on the romanized name (firstName = chineseGivenName; lastName=chineseSurname), ex. Wang Xiaoming
    #
    # + payload - A list of personal Chinese names in LATIN, firstName = chineseGivenName; lastName=chineseSurname 
    # + return - A list of genderized names. 
    remote isolated function chineseNameCandidatesBatch(BatchFirstLastNameIn payload) returns BatchNameMatchCandidatesOut|error {
        string resourcePath = string `/api2/json/chineseNameCandidatesBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchNameMatchCandidatesOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Identify Chinese name candidates, based on the romanized name ex. Wang Xiaoming - having a known gender ('male' or 'female')
    #
    # + chineseSurnameLatin - Chinese sur name in latin 
    # + chineseGivenNameLatin - Chinese given name in latin 
    # + knownGender - Known gender 
    # + return - A romanized name. 
    remote isolated function chineseNameGenderCandidates(string chineseSurnameLatin, string chineseGivenNameLatin, string knownGender) returns NameMatchCandidatesOut|error {
        string resourcePath = string `/api2/json/chineseNameGenderCandidates/${chineseSurnameLatin}/${chineseGivenNameLatin}/${knownGender}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NameMatchCandidatesOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Identify Chinese name candidates, based on the romanized name (firstName = chineseGivenName; lastName=chineseSurname) ex. Wang Xiaoming.
    #
    # + payload - A list of personal Chinese names in LATIN, firstName = chineseGivenName; lastName=chineseSurname 
    # + return - A list of genderized names. 
    remote isolated function chineseNameCandidatesGenderBatch(BatchFirstLastNameGenderIn payload) returns BatchNameMatchCandidatesOut|error {
        string resourcePath = string `/api2/json/chineseNameCandidatesGenderBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchNameMatchCandidatesOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Infer the likely first/last name structure of a name, ex. 山本 早苗 or Yamamoto Sanae
    #
    # + japaneseName - Japanese name 
    # + return - A origined name. 
    remote isolated function parseJapaneseName(string japaneseName) returns PersonalNameParsedOut|error {
        string resourcePath = string `/api2/json/parseJapaneseName/${japaneseName}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PersonalNameParsedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Infer the likely first/last name structure of a name, ex. 山本 早苗 or Yamamoto Sanae 
    #
    # + payload - A list of personal names 
    # + return - A list of parsed names. 
    remote isolated function parseJapaneseNameBatch(BatchPersonalNameIn payload) returns BatchPersonalNameParsedOut|error {
        string resourcePath = string `/api2/json/parseJapaneseNameBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchPersonalNameParsedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Identify japanese name candidates in KANJI, based on the romanized name ex. Yamamoto Sanae - and a known gender.
    #
    # + japaneseSurnameLatin - Japanese sur name in latin 
    # + japaneseGivenNameLatin - Japanese given name in latin 
    # + knownGender - Known gender 
    # + return - A romanized name. 
    remote isolated function japaneseNameKanjiCandidates(string japaneseSurnameLatin, string japaneseGivenNameLatin, string knownGender) returns NameMatchCandidatesOut|error {
        string resourcePath = string `/api2/json/japaneseNameKanjiCandidates/${japaneseSurnameLatin}/${japaneseGivenNameLatin}/${knownGender}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NameMatchCandidatesOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Identify japanese name candidates in KANJI, based on the romanized name ex. Yamamoto Sanae
    #
    # + japaneseSurnameLatin - Japanese sur name in latin 
    # + japaneseGivenNameLatin - Japanese given name in latin 
    # + return - A romanized name. 
    remote isolated function japanesenamekanjicandidates1(string japaneseSurnameLatin, string japaneseGivenNameLatin) returns NameMatchCandidatesOut|error {
        string resourcePath = string `/api2/json/japaneseNameKanjiCandidates/${japaneseSurnameLatin}/${japaneseGivenNameLatin}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NameMatchCandidatesOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Romanize japanese name, based on the name in Kanji.
    #
    # + japaneseSurnameKanji - Japanese sur name in kanji 
    # + japaneseGivenNameKanji - Japanese given name in kanji 
    # + return - A romanized name. 
    remote isolated function japaneseNameLatinCandidates(string japaneseSurnameKanji, string japaneseGivenNameKanji) returns NameMatchCandidatesOut|error {
        string resourcePath = string `/api2/json/japaneseNameLatinCandidates/${japaneseSurnameKanji}/${japaneseGivenNameKanji}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NameMatchCandidatesOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Identify japanese name candidates in KANJI, based on the romanized name (firstName = japaneseGivenName; lastName=japaneseSurname), ex. Yamamoto Sanae
    #
    # + payload - A list of personal japanese names in LATIN, firstName = japaneseGivenName; lastName=japaneseSurname 
    # + return - A list of genderized names. 
    remote isolated function japaneseNameKanjiCandidatesBatch(BatchFirstLastNameIn payload) returns BatchNameMatchCandidatesOut|error {
        string resourcePath = string `/api2/json/japaneseNameKanjiCandidatesBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchNameMatchCandidatesOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Identify japanese name candidates in KANJI, based on the romanized name (firstName = japaneseGivenName; lastName=japaneseSurname) with KNOWN gender, ex. Yamamoto Sanae
    #
    # + payload - A list of personal japanese names in LATIN, firstName = japaneseGivenName; lastName=japaneseSurname and known gender 
    # + return - A list of genderized names. 
    remote isolated function japaneseNameGenderKanjiCandidatesBatch(BatchFirstLastNameGenderIn payload) returns BatchNameMatchCandidatesOut|error {
        string resourcePath = string `/api2/json/japaneseNameGenderKanjiCandidatesBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchNameMatchCandidatesOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Romanize japanese names, based on the name in KANJI
    #
    # + payload - A list of personal japanese names in KANJI, firstName = japaneseGivenName; lastName=japaneseSurname 
    # + return - A list of genderized names. 
    remote isolated function japaneseNameLatinCandidatesBatch(BatchFirstLastNameIn payload) returns BatchNameMatchCandidatesOut|error {
        string resourcePath = string `/api2/json/japaneseNameLatinCandidatesBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchNameMatchCandidatesOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Return a score for matching Japanese name in KANJI ex. 山本 早苗 with a romanized name ex. Yamamoto Sanae
    #
    # + japaneseSurnameLatin - Japanese sur name in latin 
    # + japaneseGivenNameLatin - Japanese given name in latin 
    # + japaneseName - Japanese name 
    # + return - A romanized name. 
    remote isolated function japaneseNameMatch(string japaneseSurnameLatin, string japaneseGivenNameLatin, string japaneseName) returns NameMatchedOut|error {
        string resourcePath = string `/api2/json/japaneseNameMatch/${japaneseSurnameLatin}/${japaneseGivenNameLatin}/${japaneseName}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NameMatchedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # [CREDITS 1 UNIT] Feedback loop to better perform matching Japanese name in KANJI ex. 山本 早苗 with a romanized name ex. Yamamoto Sanae
    #
    # + japaneseSurnameLatin - Japanese sur name in latin 
    # + japaneseGivenNameLatin - Japanese given name in latin 
    # + japaneseName - Japanese name 
    # + return - A romanized name. 
    remote isolated function japaneseNameMatchFeedbackLoop(string japaneseSurnameLatin, string japaneseGivenNameLatin, string japaneseName) returns FeedbackLoopOut|error {
        string resourcePath = string `/api2/json/japaneseNameMatchFeedbackLoop/${japaneseSurnameLatin}/${japaneseGivenNameLatin}/${japaneseName}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FeedbackLoopOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Return a score for matching a list of Japanese names in KANJI ex. 山本 早苗 with romanized names ex. Yamamoto Sanae
    #
    # + payload - A list of personal Japanese names in LATIN, firstName = japaneseGivenName; lastName=japaneseSurname 
    # + return - A list of matched names. 
    remote isolated function japaneseNameMatchBatch(BatchMatchPersonalFirstLastNameIn payload) returns BatchNameMatchedOut|error {
        string resourcePath = string `/api2/json/japaneseNameMatchBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchNameMatchedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Infer the likely gender of a Japanese name in LATIN (Pinyin).
    #
    # + japaneseSurname - Japanese sur name 
    # + japaneseGivenName - Japanese given name 
    # + return - A genderized name. 
    remote isolated function genderJapaneseNamePinyin(string japaneseSurname, string japaneseGivenName) returns FirstLastNameGenderedOut|error {
        string resourcePath = string `/api2/json/genderJapaneseName/${japaneseSurname}/${japaneseGivenName}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FirstLastNameGenderedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Infer the likely gender of up to 100 Japanese names in LATIN (Pinyin).
    #
    # + payload - A list of names, with country code. 
    # + return - A list of genderized names. 
    remote isolated function genderJapaneseNamePinyinBatch(BatchFirstLastNameIn payload) returns BatchFirstLastNameGenderedOut|error {
        string resourcePath = string `/api2/json/genderJapaneseNameBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchFirstLastNameGenderedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Infer the likely gender of a Japanese full name ex. 王晓明
    #
    # + japaneseName - Japanese name 
    # + return - A genderized name. 
    remote isolated function genderJapaneseNameFull(string japaneseName) returns PersonalNameGenderedOut|error {
        string resourcePath = string `/api2/json/genderJapaneseNameFull/${japaneseName}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PersonalNameGenderedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Infer the likely gender of up to 100 full names
    #
    # + payload - A list of personal names 
    # + return - A list of genderized names. 
    remote isolated function genderJapaneseNameFullBatch(BatchPersonalNameIn payload) returns BatchPersonalNameGenderedOut|error {
        string resourcePath = string `/api2/json/genderJapaneseNameFullBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchPersonalNameGenderedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # [USES 11 UNITS PER NAME] Infer the likely country and phone prefix, given a personal name and formatted / unformatted phone number.
    #
    # + firstName - First name 
    # + lastName - Last name 
    # + phoneNumber - Phone number 
    # + return - A name with country and phone code. 
    remote isolated function phoneCode(string firstName, string lastName, string phoneNumber) returns FirstLastNamePhoneCodedOut|error {
        string resourcePath = string `/api2/json/phoneCode/${firstName}/${lastName}/${phoneNumber}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FirstLastNamePhoneCodedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # [USES 11 UNITS PER NAME] Infer the likely phone prefix, given a personal name and formatted / unformatted phone number, with a local context (ISO2 country of residence).
    #
    # + firstName - First name 
    # + lastName - Last name 
    # + phoneNumber - Phone number 
    # + countryIso2 - ISO2 country code 
    # + return - A name with country and phone code. 
    remote isolated function phoneCodeGeo(string firstName, string lastName, string phoneNumber, string countryIso2) returns FirstLastNamePhoneCodedOut|error {
        string resourcePath = string `/api2/json/phoneCodeGeo/${firstName}/${lastName}/${phoneNumber}/${countryIso2}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FirstLastNamePhoneCodedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # [CREDITS 1 UNIT] Feedback loop to better infer the likely phone prefix, given a personal name and formatted / unformatted phone number, with a local context (ISO2 country of residence).
    #
    # + firstName - First name 
    # + lastName - Last name 
    # + phoneNumber - Phone number 
    # + phoneNumberE164 - Phone number in E164 standard 
    # + countryIso2 - ISO2 country code 
    # + return - A name with country and phone code. 
    remote isolated function phoneCodeGeoFeedbackLoop(string firstName, string lastName, string phoneNumber, string phoneNumberE164, string countryIso2) returns FirstLastNamePhoneCodedOut|error {
        string resourcePath = string `/api2/json/phoneCodeGeoFeedbackLoop/${firstName}/${lastName}/${phoneNumber}/${phoneNumberE164}/${countryIso2}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FirstLastNamePhoneCodedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # [USES 11 UNITS PER NAME] Infer the likely country and phone prefix, of up to 100 personal names, detecting automatically the local context given a name and formatted / unformatted phone number.
    #
    # + payload - A list of personal names 
    # + return - A list of genderized names. 
    remote isolated function phoneCodeBatch(BatchFirstLastNamePhoneNumberIn payload) returns BatchFirstLastNamePhoneCodedOut|error {
        string resourcePath = string `/api2/json/phoneCodeBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchFirstLastNamePhoneCodedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # [USES 11 UNITS PER NAME] Infer the likely country and phone prefix, of up to 100 personal names, with a local context (ISO2 country of residence).
    #
    # + payload - A list of personal names 
    # + return - A list of genderized names. 
    remote isolated function phoneCodeGeoBatch(BatchFirstLastNamePhoneNumberGeoIn payload) returns BatchFirstLastNamePhoneCodedOut|error {
        string resourcePath = string `/api2/json/phoneCodeGeoBatch`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchFirstLastNamePhoneCodedOut response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Infer the likely first/last name structure of a name, ex. John Smith or SMITH, John or SMITH; John. 
    #
    # + nameFull - Full name to infer 
    # + return - A origined name. 
    remote isolated function parseName(string nameFull) returns PersonalNameParsedOut|error {
        string resourcePath = string `/api2/json/parseName/${nameFull}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PersonalNameParsedOut response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
