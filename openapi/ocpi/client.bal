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
import ballerina/url;
import ballerina/lang.'string;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector for [OCPI v2.2](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf) OpenAPI specification.
# The Open Charge Point Interface (OCPI) enables a scalable, automated EV roaming setup between Charge Point Operators  and e-Mobility Service Providers. It supports authorization, charge point information exchange (including live status updates and transaction events), charge detail record exchange, remote charge point commands and the exchange of  smart-charging related information between parties.
@display {label: "OCPI", iconPath: "resources/ocpi.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. Follow the section [OCPI v2.2 - 4. Transport and format section](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#transport_and_format_pagination) and obtain tokens according to your Open Charge Point network.
    #
    # + apiKeyConfig - Provide your API Key as `authorization`. Eg: {authorization : Token <Your API_Key>}, The literal 'Token' indicates that the token-based authentication mechanism is used, in OCPI this is called the 'credentials token'.'Credentials tokens' are exchanged via the credentials module. These are different 'tokens' then the Tokens exchanged via theToken Module: Tokens used by drivers to authorize charging. To prevent confusion, when talking about the token used here in theHTTP Authorization header, call them: 'Credentials Tokens' 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "http://localhost:8080") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # gets connection status
    #
    # + countryCode - Country code 
    # + partyID - Party ID 
    # + return - OK 
    remote isolated function getConnectionStatus(string countryCode, string partyID) returns string|error {
        string  path = string `/admin/connection-status/${countryCode}/${partyID}`;
        map<any> headerValues = {"authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Generates registration tokens
    #
    # + payload - An array of Basic roles 
    # + return - OK 
    remote isolated function generateRegistrationToken(BasicRole[] payload) returns json|error {
        string  path = string `/admin/generate-registration-token`;
        map<any> headerValues = {"authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, headers = accHeaders, targetType=json);
        return response;
    }
    # Gets health of the OCN
    #
    # + return - OK 
    remote isolated function getHealth() returns string|error {
        string  path = string `/health`;
        map<any> headerValues = {"authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Communicates between CPO and eMSP
    #
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + ocnSignature - OCN Signature 
    # + payload - Request body 
    # + return - OK 
    remote isolated function postMessage(string xRequestId, string ocnSignature, string payload) returns OcpiResponseObject|error {
        string  path = string `/ocn/message`;
        map<any> headerValues = {"X-Request-ID": xRequestId, "OCN-Signature": ocnSignature, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseObject response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseObject);
        return response;
    }
    # gets registry information
    #
    # + return - OK 
    remote isolated function getMyNodeInfo() returns json|error {
        string  path = string `/ocn/registry/node-info`;
        map<any> headerValues = {"authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Gets registry details of Providers and Operators by country code and party ID
    #
    # + countryCode - Country code 
    # + partyID - Party ID 
    # + return - OK 
    remote isolated function getNodeOf(string countryCode, string partyID) returns json|error {
        string  path = string `/ocn/registry/node/${countryCode}/${partyID}`;
        map<any> headerValues = {"authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # fetches information about the supported endpoints for this version
    #
    # + return - OK 
    remote isolated function getVersionsDetail() returns OcpiResponseVersionDetail|error {
        string  path = string `/ocpi/2.2`;
        map<any> headerValues = {"authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseVersionDetail response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseVersionDetail);
        return response;
    }
    # Fetches information about the supported versions.
    #
    # + return - OK 
    remote isolated function getVersions() returns OcpiResponseListVersion|error {
        string  path = string `/ocpi/versions`;
        map<any> headerValues = {"authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseListVersion response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseListVersion);
        return response;
    }
    # Fetches charge detail records last updated (which in the current version of OCPI can only be the creation Date/Time) between the {date_from} and {date_to} (paginated).
    #
    # + ocnSignature - OCN-Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + dateFrom - Only return CDRs that have last_updated after or equal to this Date/Time (inclusive) 
    # + dateTo - Only return CDRs that have last_updated up to this Date/Time, but not including (exclusive) 
    # + offset - The offset of the first object returned. Default is 0 
    # + 'limit - Maximum number of objects to GET 
    # + return - OK 
    remote isolated function getCdrsFromDataOwner(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string? dateFrom = (), string? dateTo = (), int? offset = (), int? 'limit = ()) returns OcpiResponseCDRList|error {
        string  path = string `/ocpi/sender/2.2/cdrs`;
        map<anydata> queryParam = {"date_from": dateFrom, "date_to": dateTo, "offset": offset, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseCDRList response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseCDRList);
        return response;
    }
    # Gets CDR detail by ID from sender
    #
    # + ocnSignature - OCN signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + uid - UID 
    # + return - OK 
    remote isolated function getCdrPageFromDataOwner(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string uid) returns OcpiResponseCDRList|error {
        string  path = string `/ocpi/sender/2.2/cdrs/page/${uid}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseCDRList response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseCDRList);
        return response;
    }
    # Gets CDRs by ID from the receiver
    #
    # + ocnSignature - OCN signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + cdrID - Charge Detail Record ID 
    # + return - OK 
    remote isolated function getClientOwnedCdr(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string cdrID) returns OcpiResponseCDR|error {
        string  path = string `/ocpi/receiver/2.2/cdrs/${cdrID}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseCDR response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseCDR);
        return response;
    }
    # Creates a new CDR
    #
    # + ocnSignature - OCN signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + payload - CDR Details 
    # + return - OK 
    remote isolated function postClientOwnedCdr(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, CDR payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/cdrs`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Creates new charging profile
    #
    # + ocnSignature - OCN signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + uid - UID 
    # + payload - Charging profile details 
    # + return - OK 
    remote isolated function postGenericChargingProfileResult(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string uid, GenericChargingProfileResult payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/2.2/sender/chargingprofiles/result/${uid}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Sends or Updates a  ChargingProfile by the Sender
    #
    # + ocnSignature - OCN signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + sessionId - Session ID 
    # + payload - Active charging profile details 
    # + return - OK 
    remote isolated function putSenderChargingProfile(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string sessionId, ActiveChargingProfile payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/2.2/sender/chargingprofiles/${sessionId}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Gets the active ActiveChargingProfile by receiver
    #
    # + ocnSignature - OCN signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + sessionId - Session ID 
    # + duration - Charging duration 
    # + responseUrl - URL that the ActiveChargingProfileResult POST should be send to. This URL might contain an unique ID to be able to distinguish between GETActiveChargingProfile requests 
    # + return - OK 
    remote isolated function getReceiverChargingProfile(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string sessionId, int duration, string responseUrl) returns OcpiResponseChargingProfileResponse|error {
        string  path = string `/ocpi/2.2/receiver/chargingprofiles/${sessionId}`;
        map<anydata> queryParam = {"duration": duration, "response_url": responseUrl};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseChargingProfileResponse response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseChargingProfileResponse);
        return response;
    }
    # Creates/updates a ChargingProfile for a specific charging session
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + sessionId - Session ID 
    # + payload - Charging profile details 
    # + return - OK 
    remote isolated function putReceiverChargingProfile(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string sessionId, SetChargingProfile payload) returns OcpiResponseChargingProfileResponse|error {
        string  path = string `/ocpi/2.2/receiver/chargingprofiles/${sessionId}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseChargingProfileResponse response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseChargingProfileResponse);
        return response;
    }
    # Cancels an existing ChargingProfile for a specific charging session
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + sessionId - The unique id that identifies the session in the CPO platform 
    # + responseUrl - URL that the ClearProfileResult POST should be send to. This URL might contain an unique ID to be able to distinguish between DELETE ChargingProfile requests. 
    # + return - OK 
    remote isolated function deleteReceiverChargingProfile(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string sessionId, string responseUrl) returns OcpiResponseChargingProfileResponse|error {
        string  path = string `/ocpi/2.2/receiver/chargingprofiles/${sessionId}`;
        map<anydata> queryParam = {"response_url": responseUrl};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        OcpiResponseChargingProfileResponse response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = OcpiResponseChargingProfileResponse);
        return response;
    }
    # Receive the asynchronous response from the Charge Point.
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + command - Command of the request 
    # + uid - Unique id as a URL segment 
    # + payload - command details 
    # + return - OK 
    remote isolated function postAsyncResponse(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string command, string uid, CommandResult payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/sender/2.2/commands/${command}/${uid}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Cancel an existing reservation
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + payload - Reservation detail for cancellation 
    # + return - OK 
    remote isolated function postCancelReservation(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, CancelReservation payload) returns OcpiResponseCommandResponse|error {
        string  path = string `/ocpi/receiver/2.2/commands/CANCEL_RESERVATION`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseCommandResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseCommandResponse);
        return response;
    }
    # Reserve a (specific) connector of a Charge Point for a given Token
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + payload - Reservation details 
    # + return - OK 
    remote isolated function postReserveNow(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, ReserveNow payload) returns OcpiResponseCommandResponse|error {
        string  path = string `/ocpi/receiver/2.2/commands/RESERVE_NOW`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseCommandResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseCommandResponse);
        return response;
    }
    # Starts a session.
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + payload - Session details 
    # + return - OK 
    remote isolated function postStartSession(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, StartSession payload) returns OcpiResponseCommandResponse|error {
        string  path = string `/ocpi/receiver/2.2/commands/START_SESSION`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseCommandResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseCommandResponse);
        return response;
    }
    # Stops a session
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + payload - Session details 
    # + return - OK 
    remote isolated function postStopSession(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, StopSession payload) returns OcpiResponseCommandResponse|error {
        string  path = string `/ocpi/receiver/2.2/commands/STOP_SESSION`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseCommandResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseCommandResponse);
        return response;
    }
    # Unlock a connector of a Charge Point
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + payload - Charge connector details 
    # + return - OK 
    remote isolated function postUnlockConnector(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, UnlockConnector payload) returns OcpiResponseCommandResponse|error {
        string  path = string `/ocpi/receiver/2.2/commands/UNLOCK_CONNECTOR`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseCommandResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseCommandResponse);
        return response;
    }
    # Retrieves the credentials object to access the server’s platform
    #
    # + return - OK 
    remote isolated function getCredentials() returns OcpiResponseCredentials|error {
        string  path = string `/ocpi/2.2/credentials`;
        map<any> headerValues = {"authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseCredentials response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseCredentials);
        return response;
    }
    # Provides the server with an updated credentials object to access the client’s system
    #
    # + payload - Credentials detail 
    # + return - OK 
    remote isolated function putCredentials(Credentials payload) returns OcpiResponseCredentials|error {
        string  path = string `/ocpi/2.2/credentials`;
        map<any> headerValues = {"authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseCredentials response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseCredentials);
        return response;
    }
    # Provides the server with a credentials object to access the client’s system (i.e. register)
    #
    # + payload - Credentials Detail 
    # + return - OK 
    remote isolated function postCredentials(Credentials payload) returns OcpiResponseCredentials|error {
        string  path = string `/ocpi/2.2/credentials`;
        map<any> headerValues = {"authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseCredentials response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseCredentials);
        return response;
    }
    # Informs the server that its credentials to the client’s system are now invalid (i.e. unregister)
    #
    # + return - OK 
    remote isolated function deleteCredentials() returns OcpiResponse|error {
        string  path = string `/ocpi/2.2/credentials`;
        map<any> headerValues = {"authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        OcpiResponse response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = OcpiResponse);
        return response;
    }
    # Fetches a list of Locations, last updated between the {date_from} and {date_to} (paginated), or get a specificLocation, EVSE or Connector
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + dateFrom - Only return CDRs that have last_updated after or equal to this Date/Time(inclusive) 
    # + dateTo - Only return CDRs that have last_updated up to this Date/Time, but not including (exclusive) 
    # + offset - The offset of the first object returned. Default is 0 
    # + 'limit - Maximum number of objects to GET 
    # + return - OK 
    remote isolated function getLocationListFromDataOwner(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string? dateFrom = (), string? dateTo = (), int? offset = (), int? 'limit = ()) returns OcpiResponseLocationList|error {
        string  path = string `/ocpi/sender/2.2/locations`;
        map<anydata> queryParam = {"date_from": dateFrom, "date_to": dateTo, "offset": offset, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseLocationList response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseLocationList);
        return response;
    }
    # Lists of all available Locations with valid EVSEs
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + uid - Page ID 
    # + return - OK 
    remote isolated function getLocationPageFromDataOwner(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string uid) returns OcpiResponseLocationList|error {
        string  path = string `/ocpi/sender/2.2/locations/page/${uid}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseLocationList response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseLocationList);
        return response;
    }
    # Retrieves information about one specific Location
    #
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + ocnSignature - OCN Signature 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + locationID - ID of the charging location of an operator 
    # + return - OK 
    remote isolated function getLocationObjectFromDataOwner(string xRequestId, string ocnSignature, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string locationID) returns OcpiResponseLocation|error {
        string  path = string `/ocpi/sender/2.2/locations/${locationID}`;
        map<any> headerValues = {"X-Request-ID": xRequestId, "OCN-Signature": ocnSignature, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseLocation response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseLocation);
        return response;
    }
    # Retrieves a Location, EVSE by ID
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party id of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + locationID - ID of the charging location of an operator 
    # + evseUID - ID of the EVSE 
    # + return - OK 
    remote isolated function getEvseObjectFromDataOwner(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string locationID, string evseUID) returns OcpiResponseEvse|error {
        string  path = string `/ocpi/sender/2.2/locations/${locationID}/${evseUID}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseEvse response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseEvse);
        return response;
    }
    # Retrieves a Location, EVSE or Connector by ID
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + locationID - ID of the charging location of an operator 
    # + evseUID - ID of the EVSE 
    # + connectorID - Connector ID 
    # + return - OK 
    remote isolated function getConnectorObjectFromDataOwner(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string locationID, string evseUID, string connectorID) returns OcpiResponseConnector|error {
        string  path = string `/ocpi/sender/2.2/locations/${locationID}/${evseUID}/${connectorID}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseConnector response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseConnector);
        return response;
    }
    # Retrieve a Location as it is stored in the eMSP system.
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the CPO requesting data from the eMSP system 
    # + partyID - Party ID (Provider ID) of the CPO requesting data from the eMSP system 
    # + locationID - Location.id of the Location object to retrieve 
    # + return - OK 
    remote isolated function getClientOwnedLocation(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string locationID) returns OcpiResponseLocation|error {
        string  path = string `/ocpi/receiver/2.2/locations/${countryCode}/${partyID}/${locationID}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseLocation response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseLocation);
        return response;
    }
    # Push new/updated Location and/or Connector to the eMSP
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the CPO requesting this PUT to the eMSP system. This shall be the same value as the country_code in the Location object being pushed 
    # + partyID - Party ID (Provider ID) of the CPO requesting this PUT to the eMSP system. This shall be the same value as the party_id in the Location object being pushed. 
    # + locationID - Location.id of the new Location object, or the Location of which an EVSE orConnector object is pushed 
    # + payload - Location details 
    # + return - OK 
    remote isolated function putClientOwnedLocation(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string locationID, Location payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/locations/${countryCode}/${partyID}/${locationID}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Notify the eMSP of partial updates to a Location, EVSE or Connector (such as the status).
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code 
    # + partyID - Party ID 
    # + locationID - ID of the charging location of an operator 
    # + payload - Location details 
    # + return - OK 
    remote isolated function patchClientOwnedLocation(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string locationID, json payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/locations/${countryCode}/${partyID}/${locationID}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Retrieve a Location as it is stored in the eMSP system by EVSE UID
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the CPO requesting data from the eMSP system. 
    # + partyID - Party ID (Provider ID) of the CPO requesting data from the eMSP system. 
    # + locationID - Location.id of the Location object to retrieve 
    # + evseUID - Evse.uid, required when requesting an EVSE or Connector object 
    # + return - OK 
    remote isolated function getClientOwnedEvse(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string locationID, string evseUID) returns OcpiResponseEvse|error {
        string  path = string `/ocpi/receiver/2.2/locations/${countryCode}/${partyID}/${locationID}/${evseUID}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseEvse response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseEvse);
        return response;
    }
    # Push new/updated Location, EVSE and/or Connector to the eMSP by EVSE UID
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the CPO requesting this PUT to the eMSP system. This shall be the same value as the country_code in the Location object being pushed 
    # + partyID - Party ID (Provider ID) of the CPO requesting this PUT to the eMSP system. ThisSHALL be the same value as the party_id in the Location object being pushed. 
    # + locationID - Location.id of the new Location object, or the Location of which an EVSE orConnector object is pushed 
    # + evseUID - Evse.uid, required when an EVSE or Connector object is pushed 
    # + payload - EVSE details 
    # + return - OK 
    remote isolated function putClientOwnedEvse(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string locationID, string evseUID, Evse payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/locations/${countryCode}/${partyID}/${locationID}/${evseUID}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Notify the eMSP of partial updates to a Location, EVSE or Connector (such as the status) by EVSE UID
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the CPO requesting this PATCH to the eMSP system 
    # + partyID - Party ID (Provider ID) of the CPO requesting this PATCH to the eMSP system 
    # + locationID - ID of the charging location of an operator 
    # + evseUID - ID of the EVSE 
    # + payload - Request body details 
    # + return - OK 
    remote isolated function patchClientOwnedEvse(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string locationID, string evseUID, json payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/locations/${countryCode}/${partyID}/${locationID}/${evseUID}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Retrieve a Location as it is stored in the eMSP system by EVSE UID and Connector ID
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the CPO requesting this PUT to the eMSP system. This shall be the same value as the country_code in the Location object being pushed. 
    # + partyID - Party ID (Provider ID) of the CPO requesting this PUT to the eMSP system. ThisSHALL be the same value as the party_id in the Location object being pushed 
    # + locationID - Location.id of the new Location object, or the Location of which an EVSE orConnector object is pushed 
    # + evseUID - Evse.uid, required when an EVSE or Connector object is pushed. 
    # + connectorID - Connector.id, required when a Connector object is pushed. 
    # + return - OK 
    remote isolated function getClientOwnedConnector(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string locationID, string evseUID, string connectorID) returns OcpiResponseConnector|error {
        string  path = string `/ocpi/receiver/2.2/locations/${countryCode}/${partyID}/${locationID}/${evseUID}/${connectorID}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseConnector response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseConnector);
        return response;
    }
    # Push new/updated Location, EVSE and/or Connector to the eMSP by EVSE UID and connector ID
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the CPO requesting this PUT to the eMSP system. This shall be the same value as the country_code in the Location object being pushed 
    # + partyID - Party ID (Provider ID) of the CPO requesting this PUT to the eMSP system. This shall be the same value as the party_id in the Location object being pushed. 
    # + locationID - Location.id of the new Location object, or the Location of which an EVSE orConnector object is pushed 
    # + evseUID - Evse.uid, required when an EVSE or Connector object is pushed. 
    # + connectorID - Connector.id, required when a Connector object is pushed 
    # + payload - Connector Details 
    # + return - OK 
    remote isolated function putClientOwnedConnector(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string locationID, string evseUID, string connectorID, Connector payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/locations/${countryCode}/${partyID}/${locationID}/${evseUID}/${connectorID}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Notify the eMSP of partial updates to a Location, EVSE or Connector (such as the status) by EVSE UID and connector ID
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the CPO requesting this PATCH to the eMSP system 
    # + partyID - Party ID (Provider ID) of the CPO requesting this PATCH to the eMSP system 
    # + locationID - ID of the charging location of an operator 
    # + evseUID - ID of the EVSE 
    # + connectorID - ID of the Connector 
    # + payload - OCPI request details 
    # + return - OK 
    remote isolated function patchClientOwnedConnector(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string locationID, string evseUID, string connectorID, json payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/locations/${countryCode}/${partyID}/${locationID}/${evseUID}/${connectorID}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Updates OCN rules - `whitelist`
    #
    # + payload - OCN Rules List Details 
    # + return - OK 
    remote isolated function updateWhitelist(OcnRulesListParty[] payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/ocnrules/whitelist`;
        map<any> headerValues = {"authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    #
    # + payload - OCN Rules List Details 
    # + return - OK 
    remote isolated function appendToWhitelist(OcnRulesListParty payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/ocnrules/whitelist`;
        map<any> headerValues = {"authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Updates OCN rules - `blacklist`
    #
    # + payload - OCN Rules List Details 
    # + return - OK 
    remote isolated function updateBlacklist(OcnRulesListParty[] payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/ocnrules/blacklist`;
        map<any> headerValues = {"authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    #
    # + payload - OCN Rules List Details 
    # + return - OK 
    remote isolated function appendToBlacklist(OcnRulesListParty payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/ocnrules/blacklist`;
        map<any> headerValues = {"authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Updates OCN Rules - `signature`
    #
    # + return - OK 
    remote isolated function updateSignatures() returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/ocnrules/signatures`;
        map<any> headerValues = {"authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        OcpiResponseUnit response = check self.clientEp-> put(path, request, headers = accHeaders, targetType = OcpiResponseUnit);
        return response;
    }
    # Update OCN Rules - `block-all`
    #
    # + return - OK 
    remote isolated function blockAll() returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/ocnrules/block-all`;
        map<any> headerValues = {"authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        OcpiResponseUnit response = check self.clientEp-> put(path, request, headers = accHeaders, targetType = OcpiResponseUnit);
        return response;
    }
    # Deletes OCN Rules - `whitelist` by country code and party ID
    #
    # + countryCode - Country code 
    # + partyID - Party ID 
    # + return - OK 
    remote isolated function deleteFromWhitelist(string countryCode, string partyID) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/ocnrules/whitelist/${countryCode}/${partyID}`;
        map<any> headerValues = {"authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        OcpiResponseUnit response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = OcpiResponseUnit);
        return response;
    }
    # Deletes OCN Rules - `blacklist` by country code and party ID
    #
    # + countryCode - Country code 
    # + partyID - Party ID 
    # + return - OK 
    remote isolated function deleteFromBlacklist(string countryCode, string partyID) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/ocnrules/blacklist/${countryCode}/${partyID}`;
        map<any> headerValues = {"authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        OcpiResponseUnit response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = OcpiResponseUnit);
        return response;
    }
    # Gets all OCN Rules
    #
    # + return - OK 
    remote isolated function getRules() returns OcpiResponseOcnRules|error {
        string  path = string `/ocpi/receiver/2.2/ocnrules`;
        map<any> headerValues = {"authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseOcnRules response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseOcnRules);
        return response;
    }
    # Fetches Session objects of charging sessions last updated between the {date_from} and {date_to}
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + dateFrom - Only return Sessions that have last_updated after or equal to this Date/Time(inclusive) 
    # + dateTo - Only return Sessions that have last_updated up to this Date/Time, but not including (exclusive) 
    # + offset - The offset of the first object returned. Default is 0 
    # + 'limit - Maximum number of objects to GET 
    # + return - OK 
    remote isolated function getSessionsFromDataOwner(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string? dateFrom = (), string? dateTo = (), int? offset = (), int? 'limit = ()) returns OcpiResponseSessionList|error {
        string  path = string `/ocpi/sender/2.2/sessions`;
        map<anydata> queryParam = {"date_from": dateFrom, "date_to": dateTo, "offset": offset, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseSessionList response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseSessionList);
        return response;
    }
    # Fetches Session objects of charging sessions
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + uid - Page ID 
    # + return - OK 
    remote isolated function getSessionsPageFromDataOwner(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string uid) returns OcpiResponseSessionList|error {
        string  path = string `/ocpi/sender/2.2/sessions/page/${uid}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseSessionList response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseSessionList);
        return response;
    }
    # Sets/Updates the driver’s Charging Preferences for the charging session
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + sessionID - Charging session ID 
    # + payload - Charging preferences details 
    # + return - OK 
    remote isolated function putChargingPreferences(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string sessionID, ChargingPreferences payload) returns OcpiResponseChargingPreferencesResponse|error {
        string  path = string `/ocpi/sender/2.2/sessions/${sessionID}/charging_preferences`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseChargingPreferencesResponse response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseChargingPreferencesResponse);
        return response;
    }
    # Retrieves a Session object from the eMSP’s system with Session.id equal to {session_id}
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the CPO performing the GET on the eMSP’s system 
    # + partyID - Party ID (Provider ID) of the CPO performing the GET on the eMSP’s system 
    # + sessionID - ID of the Session object to get from the eMSP’s system. 
    # + return - OK 
    remote isolated function getClientOwnedSession(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string sessionID) returns OcpiResponseSession|error {
        string  path = string `/ocpi/receiver/2.2/sessions/${countryCode}/${partyID}/${sessionID}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseSession response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseSession);
        return response;
    }
    # Inform the eMSP’s system about a new/updated Session object in the CPO’s system
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the CPO performing this PUT on the eMSP’s system. This shall be the same value as the country_code in the Session object being pushed. 
    # + partyID - Party ID (Provider ID) of the CPO performing this PUT on the eMSP’s system.This shall be the same value as the party_id in the Session object being pushed. 
    # + sessionID - ID of the new or updated Session object. 
    # + payload - Session details 
    # + return - OK 
    remote isolated function putClientOwnedSession(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string sessionID, Session payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/sessions/${countryCode}/${partyID}/${sessionID}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Updates the Session object with Session.id equal to {session_id}
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the CPO 
    # + partyID - Country code of the CPO 
    # + sessionID - ID of the charging session 
    # + payload - Request Body detail 
    # + return - OK 
    remote isolated function patchClientOwnedSession(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string sessionID, json payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/sessions/${countryCode}/${partyID}/${sessionID}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Retrieves a Tariff as it is stored in the eMSP’s system
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the CPO performing the PUT request on the eMSP’s system 
    # + partyID - Party ID (Provider ID) of the CPO performing the PUT request on the eMSP’ssystem 
    # + tariffID - Tariff.id of the Tariff object to retrieve 
    # + return - OK 
    remote isolated function getClientOwnedTariff(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string tariffID) returns OcpiResponseTariff|error {
        string  path = string `/ocpi/receiver/2.2/tariffs/${countryCode}/${partyID}/${tariffID}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseTariff response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseTariff);
        return response;
    }
    # Push new/updated Tariff object to the eMSP.
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the CPO performing the PUT request on the eMSP’s system.This shall be the same value as the country_code in the Tariff object being pushed 
    # + partyID - Party ID (Provider ID) of the CPO performing the PUT request on the eMSP’ssystem. This shall be the same value as the party_id in the Tariff object being pushed 
    # + tariffID - Tariff.id of the Tariff object to create or replace 
    # + payload - Tariff detail 
    # + return - OK 
    remote isolated function putClientOwnedTariff(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string tariffID, Tariff payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/tariffs/${countryCode}/${partyID}/${tariffID}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Delete a Tariff object which is not used any more and will not be used in future either
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the CPO performing the PUT request on the eMSP’s system 
    # + partyID - Party ID (Provider ID) of the CPO performing the PUT request on the eMSP’ssystem 
    # + tariffID - Tariff.id of the Tariff object to delete 
    # + return - OK 
    remote isolated function deleteClientOwnedTariff(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string tariffID) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/tariffs/${countryCode}/${partyID}/${tariffID}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        OcpiResponseUnit response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = OcpiResponseUnit);
        return response;
    }
    # Returns Tariff objects from the CPO, last updated between the {date_from} and {date_to}
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + dateFrom - Only return Tariffs that have last_updated after or equal to this Date/Time(inclusive). 
    # + dateTo - Only return Tariffs that have last_updated up to this Date/Time, but notincluding (exclusive) 
    # + offset - The offset of the first object returned. Default is 0 
    # + 'limit - Maximum number of objects to GET 
    # + return - OK 
    remote isolated function getTariffsFromDataOwner(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string? dateFrom = (), string? dateTo = (), int? offset = (), int? 'limit = ()) returns OcpiResponseTariffList|error {
        string  path = string `/ocpi/sender/2.2/tariffs`;
        map<anydata> queryParam = {"date_from": dateFrom, "date_to": dateTo, "offset": offset, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseTariffList response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseTariffList);
        return response;
    }
    # Returns Tariff objects from the CPO by page ID
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + uid - Page ID 
    # + return - OK 
    remote isolated function getTariffsPageFromDataOwner(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string uid) returns OcpiResponseTariffList|error {
        string  path = string `/ocpi/sender/2.2/tariffs/page/${uid}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseTariffList response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseTariffList);
        return response;
    }
    # Get the list of known Tokens, last updated between the {date_from} and {date_to}(Paginated)
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + dateFrom - Only return Tokens that have last_updated after or equal to this Date/Time(inclusive) 
    # + dateTo - Only return Tokens that have last_updated up to this Date/Time, but not including (exclusive) 
    # + offset - The offset of the first object returned. Default is 0 
    # + 'limit - Maximum number of objects to GET 
    # + return - OK 
    remote isolated function getTokensFromDataOwner(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string? dateFrom = (), string? dateTo = (), int? offset = (), int? 'limit = ()) returns OcpiResponseTokenList|error {
        string  path = string `/ocpi/sender/2.2/tokens`;
        map<anydata> queryParam = {"date_from": dateFrom, "date_to": dateTo, "offset": offset, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseTokenList response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseTokenList);
        return response;
    }
    # Get the list of known Tokens Page ID
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + uid - Page ID 
    # + return - OK 
    remote isolated function getTokensPageFromDataOwner(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string uid) returns OcpiResponseTokenList|error {
        string  path = string `/ocpi/sender/2.2/tokens/page/${uid}`;
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseTokenList response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseTokenList);
        return response;
    }
    # Do a 'real-time' authorization request to the eMSP system, validating if a Token might be used (at the optionally given Location)
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + tokenUID - Token.uid of the Token for which authorization is requested. 
    # + payload - Location references details 
    # + 'type - Token type of the Token for which this authorization is. Default if omitted- RFID 
    # + return - OK 
    remote isolated function postRealTimeTokenAuthorization(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string tokenUID, LocationReferences payload, string 'type = "RFID") returns OcpiResponseAuthorizationInfo|error {
        string  path = string `/ocpi/sender/2.2/tokens/${tokenUID}/authorize`;
        map<anydata> queryParam = {"type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseAuthorizationInfo response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseAuthorizationInfo);
        return response;
    }
    # Retrieves a Token as it is stored in the CPO system
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the eMSP requesting this GET from the CPO system 
    # + partyID - Party ID (Provider ID) of the eMSP requesting this GET from the CPO system 
    # + tokenUID - Token.uid of the Token object to retrieve 
    # + 'type - Token.type of the Token to retrieve. Default if omitted- RFID 
    # + return - OK 
    remote isolated function getClientOwnedToken(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string tokenUID, string 'type = "RFID") returns OcpiResponseToken|error {
        string  path = string `/ocpi/receiver/2.2/tokens/${countryCode}/${partyID}/${tokenUID}`;
        map<anydata> queryParam = {"type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseToken response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseToken);
        return response;
    }
    # Pushes new/updated Token object to the CPO
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the eMSP sending this PUT request to the CPO system. This shall be the same value as the country_code in the Token object being pushed. 
    # + partyID - Party ID (Provider ID) of the eMSP sending this PUT request to the CPO system. This shall be the same value as the party_id in the Token object being pushed. 
    # + tokenUID - Token.uid of the (new) Token object (to replace) 
    # + payload - Token details 
    # + 'type - Token.type of the Token of the (new) Token object (to replace). Default if omitted:RFID 
    # + return - OK 
    remote isolated function putClientOwnedToken(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string tokenUID, Token payload, string 'type = "RFID") returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/tokens/${countryCode}/${partyID}/${tokenUID}`;
        map<anydata> queryParam = {"type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Notifies the CPO of partial updates to a Token
    #
    # + ocnSignature - OCN Signature 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the eMSP sending this PATCH request to the CPO system 
    # + partyID - Party ID (Provider ID) of the eMSP sending this PATCH request to the CPO system 
    # + tokenUID - Token.uid of the (new) Token object (to replace) 
    # + payload - Request body details 
    # + 'type - Token.type of the Token of the Token object 
    # + return - OK 
    remote isolated function patchClientOwnedToken(string ocnSignature, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string tokenUID, json payload, string 'type = "RFID") returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/tokens/${countryCode}/${partyID}/${tokenUID}`;
        map<anydata> queryParam = {"type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId, "authorization": self.apiKeys["authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map 
# + return - Returns generated Path or error at failure of client initialization 
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}

# Generate header map for given header values.
#
# + headerParam - Headers  map 
# + return - Returns generated map or error at failure of client initialization 
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
