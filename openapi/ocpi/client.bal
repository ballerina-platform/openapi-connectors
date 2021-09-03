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

# This is a generated connector for [OCPI v2.2](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf) OpenAPI specification.
# The Open Charge Point Interface (OCPI) enables a scalable, automated EV roaming setup between Charge Point Operators  and 
# e-Mobility Service Providers. It supports authorization, charge point information exchange (including live status updates 
# and transaction events), charge detail record exchange, remote charge point commands and the exchange of  smart-charging 
# related information between parties.
@display {label: "OCPI", iconPath: "resources/ocpi.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization doesn't require setting the API credentials.
    # Follow the section [OCPI v2.2 - 4. Transport and format section](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#transport_and_format_pagination) and obtain tokens according to your Open Charge Point network. Some operations may require setting the token as a parameter.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "http://localhost:8080") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Gets connection status
    #
    # + authorization - Authorization token 
    # + countryCode - Country code 
    # + partyID - Party ID 
    # + return - OK 
    remote isolated function getConnectionStatus(string authorization, string countryCode, string partyID) returns string|error {
        string  path = string `/admin/connection-status/${countryCode}/${partyID}`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Generates registration tokens
    #
    # + authorization - Authorization token 
    # + payload - An array of Basic roles 
    # + return - OK 
    remote isolated function generateRegistrationToken(string authorization, BasicRole[] payload) returns json|error {
        string  path = string `/admin/generate-registration-token`;
        map<any> headerValues = {"Authorization": authorization};
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
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Communicates between CPO and eMSP
    #
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + payload - Request body 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function postMessage(string xRequestId, string payload, string? ocnSignature = ()) returns OcpiResponseObject|error {
        string  path = string `/ocn/message`;
        map<any> headerValues = {"X-Request-ID": xRequestId, "OCN-Signature": ocnSignature};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseObject response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseObject);
        return response;
    }
    # Gets registry information
    #
    # + return - OK 
    remote isolated function getMyNodeInfo() returns json|error {
        string  path = string `/ocn/registry/node-info`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Gets registry details of Providers and Operators by country code and party ID
    #
    # + countryCode - Country code 
    # + partyID - Party ID 
    # + return - OK 
    remote isolated function getNodeOf(string countryCode, string partyID) returns json|error {
        string  path = string `/ocn/registry/node/${countryCode}/${partyID}`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Fetches information about the supported endpoints for this version
    #
    # + authorization - Authorization token 
    # + return - OK 
    remote isolated function getVersionsDetail(string authorization) returns OcpiResponseVersionDetail|error {
        string  path = string `/ocpi/2.2`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseVersionDetail response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseVersionDetail);
        return response;
    }
    # Fetches information about the supported versions.
    #
    # + authorization - Authorization token 
    # + return - OK 
    remote isolated function getVersions(string authorization) returns OcpiResponseListVersion|error {
        string  path = string `/ocpi/versions`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseListVersion response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseListVersion);
        return response;
    }
    # Fetches charge detail records last updated (which in the current version of OCPI can only be the creation Date/Time) between the {date_from} and {date_to} (paginated).
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + ocnSignature - OCN Signature 
    # + dateFrom - Only return CDRs that have last_updated after or equal to this Date/Time (inclusive) 
    # + dateTo - Only return CDRs that have last_updated up to this Date/Time, but not including (exclusive) 
    # + offset - The offset of the first object returned. Default is 0 
    # + 'limit - Maximum number of objects to GET 
    # + return - OK 
    remote isolated function getCdrsFromDataOwner(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string? ocnSignature = (), string? dateFrom = (), string? dateTo = (), int? offset = (), int? 'limit = ()) returns OcpiResponseCDRList|error {
        string  path = string `/ocpi/sender/2.2/cdrs`;
        map<anydata> queryParam = {"date_from": dateFrom, "date_to": dateTo, "offset": offset, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseCDRList response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseCDRList);
        return response;
    }
    # Gets CDR detail by ID from sender
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + uid - UID 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function getCdrPageFromDataOwner(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string uid, string? ocnSignature = ()) returns OcpiResponseCDRList|error {
        string  path = string `/ocpi/sender/2.2/cdrs/page/${uid}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseCDRList response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseCDRList);
        return response;
    }
    # Gets CDRs by ID from the receiver
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + cdrID - Charge Detail Record ID 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function getClientOwnedCdr(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string cdrID, string? ocnSignature = ()) returns OcpiResponseCDR|error {
        string  path = string `/ocpi/receiver/2.2/cdrs/${cdrID}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseCDR response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseCDR);
        return response;
    }
    # Creates a new CDR
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + payload - CDR Details 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function postClientOwnedCdr(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, CDR payload, string? ocnSignature = ()) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/cdrs`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Creates new charging profile
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + uid - UID 
    # + payload - Charging profile details 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function postGenericChargingProfileResult(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string uid, GenericChargingProfileResult payload, string? ocnSignature = ()) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/2.2/sender/chargingprofiles/result/${uid}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Sends or Updates a  ChargingProfile by the Sender
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + sessionId - Session ID 
    # + payload - Active charging profile details 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function putSenderChargingProfile(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string sessionId, ActiveChargingProfile payload, string? ocnSignature = ()) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/2.2/sender/chargingprofiles/${sessionId}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Gets the active ActiveChargingProfile by receiver
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + sessionId - Session ID 
    # + duration - Charging duration 
    # + responseUrl - URL that the ActiveChargingProfileResult POST should be send to. This URL might contain an unique ID to be able to distinguish between GETActiveChargingProfile requests 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function getReceiverChargingProfile(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string sessionId, int duration, string responseUrl, string? ocnSignature = ()) returns OcpiResponseChargingProfileResponse|error {
        string  path = string `/ocpi/2.2/receiver/chargingprofiles/${sessionId}`;
        map<anydata> queryParam = {"duration": duration, "response_url": responseUrl};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseChargingProfileResponse response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseChargingProfileResponse);
        return response;
    }
    # Creates/updates a ChargingProfile for a specific charging session
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + sessionId - Session ID 
    # + payload - Charging profile details 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function putReceiverChargingProfile(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string sessionId, SetChargingProfile payload, string? ocnSignature = ()) returns OcpiResponseChargingProfileResponse|error {
        string  path = string `/ocpi/2.2/receiver/chargingprofiles/${sessionId}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseChargingProfileResponse response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseChargingProfileResponse);
        return response;
    }
    # Cancels an existing ChargingProfile for a specific charging session
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + sessionId - The unique id that identifies the session in the CPO platform 
    # + responseUrl - URL that the ClearProfileResult POST should be send to. This URL might contain an unique ID to be able to distinguish between DELETE ChargingProfile requests. 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function deleteReceiverChargingProfile(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string sessionId, string responseUrl, string? ocnSignature = ()) returns OcpiResponseChargingProfileResponse|error {
        string  path = string `/ocpi/2.2/receiver/chargingprofiles/${sessionId}`;
        map<anydata> queryParam = {"response_url": responseUrl};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        OcpiResponseChargingProfileResponse response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = OcpiResponseChargingProfileResponse);
        return response;
    }
    # Receive the asynchronous response from the Charge Point.
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + command - Command of the request 
    # + uid - Unique id as a URL segment 
    # + payload - command details 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function postAsyncResponse(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string command, string uid, CommandResult payload, string? ocnSignature = ()) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/sender/2.2/commands/${command}/${uid}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Cancel an existing reservation
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + payload - Reservation detail for cancellation 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function postCancelReservation(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, CancelReservation payload, string? ocnSignature = ()) returns OcpiResponseCommandResponse|error {
        string  path = string `/ocpi/receiver/2.2/commands/CANCEL_RESERVATION`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseCommandResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseCommandResponse);
        return response;
    }
    # Reserves a (specific) connector of a Charge Point for a given Token
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + payload - Reservation details 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function postReserveNow(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, ReserveNow payload, string? ocnSignature = ()) returns OcpiResponseCommandResponse|error {
        string  path = string `/ocpi/receiver/2.2/commands/RESERVE_NOW`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseCommandResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseCommandResponse);
        return response;
    }
    # Starts a session.
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + payload - Session details 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function postStartSession(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, StartSession payload, string? ocnSignature = ()) returns OcpiResponseCommandResponse|error {
        string  path = string `/ocpi/receiver/2.2/commands/START_SESSION`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseCommandResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseCommandResponse);
        return response;
    }
    # Stops a session
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + payload - Session details 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function postStopSession(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, StopSession payload, string? ocnSignature = ()) returns OcpiResponseCommandResponse|error {
        string  path = string `/ocpi/receiver/2.2/commands/STOP_SESSION`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseCommandResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseCommandResponse);
        return response;
    }
    # Unlocks a connector of a Charge Point
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + payload - Charge connector details 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function postUnlockConnector(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, UnlockConnector payload, string? ocnSignature = ()) returns OcpiResponseCommandResponse|error {
        string  path = string `/ocpi/receiver/2.2/commands/UNLOCK_CONNECTOR`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseCommandResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseCommandResponse);
        return response;
    }
    # Retrieves the credentials object to access the server’s platform
    #
    # + authorization - Authorization token 
    # + return - OK 
    remote isolated function getCredentials(string authorization) returns OcpiResponseCredentials|error {
        string  path = string `/ocpi/2.2/credentials`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseCredentials response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseCredentials);
        return response;
    }
    # Provides the server with an updated credentials object to access the client’s system
    #
    # + authorization - Authorization token 
    # + payload - Credentials detail 
    # + return - OK 
    remote isolated function putCredentials(string authorization, Credentials payload) returns OcpiResponseCredentials|error {
        string  path = string `/ocpi/2.2/credentials`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseCredentials response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseCredentials);
        return response;
    }
    # Provides the server with a credentials object to access the client’s system (i.e. register)
    #
    # + authorization - Authorization token 
    # + payload - Credentials Detail 
    # + return - OK 
    remote isolated function postCredentials(string authorization, Credentials payload) returns OcpiResponseCredentials|error {
        string  path = string `/ocpi/2.2/credentials`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseCredentials response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseCredentials);
        return response;
    }
    # Informs the server that its credentials to the client’s system are now invalid (i.e. unregister)
    #
    # + authorization - Authorization token 
    # + return - OK 
    remote isolated function deleteCredentials(string authorization) returns OcpiResponse|error {
        string  path = string `/ocpi/2.2/credentials`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        OcpiResponse response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = OcpiResponse);
        return response;
    }
    # Fetches a list of Locations, last updated between the {date_from} and {date_to} (paginated), or get a specificLocation, EVSE or Connector
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + ocnSignature - OCN Signature 
    # + dateFrom - Only return CDRs that have last_updated after or equal to this Date/Time(inclusive) 
    # + dateTo - Only return CDRs that have last_updated up to this Date/Time, but not including (exclusive) 
    # + offset - The offset of the first object returned. Default is 0 
    # + 'limit - Maximum number of objects to GET 
    # + return - OK 
    remote isolated function getLocationListFromDataOwner(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string? ocnSignature = (), string? dateFrom = (), string? dateTo = (), int? offset = (), int? 'limit = ()) returns OcpiResponseLocationList|error {
        string  path = string `/ocpi/sender/2.2/locations`;
        map<anydata> queryParam = {"date_from": dateFrom, "date_to": dateTo, "offset": offset, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseLocationList response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseLocationList);
        return response;
    }
    # Lists of all available Locations with valid EVSEs
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + uid - Page ID 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function getLocationPageFromDataOwner(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string uid, string? ocnSignature = ()) returns OcpiResponseLocationList|error {
        string  path = string `/ocpi/sender/2.2/locations/page/${uid}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseLocationList response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseLocationList);
        return response;
    }
    # Retrieves information about one specific Location
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + locationID - ID of the charging location of an operator 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function getLocationObjectFromDataOwner(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string locationID, string? ocnSignature = ()) returns OcpiResponseLocation|error {
        string  path = string `/ocpi/sender/2.2/locations/${locationID}`;
        map<any> headerValues = {"Authorization": authorization, "X-Request-ID": xRequestId, "OCN-Signature": ocnSignature, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseLocation response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseLocation);
        return response;
    }
    # Retrieves a Location, EVSE by ID
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party id of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + locationID - ID of the charging location of an operator 
    # + evseUID - ID of the EVSE 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function getEvseObjectFromDataOwner(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string locationID, string evseUID, string? ocnSignature = ()) returns OcpiResponseEvse|error {
        string  path = string `/ocpi/sender/2.2/locations/${locationID}/${evseUID}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseEvse response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseEvse);
        return response;
    }
    # Retrieves a Location, EVSE or Connector by ID
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + locationID - ID of the charging location of an operator 
    # + evseUID - ID of the EVSE 
    # + connectorID - Connector ID 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function getConnectorObjectFromDataOwner(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string locationID, string evseUID, string connectorID, string? ocnSignature = ()) returns OcpiResponseConnector|error {
        string  path = string `/ocpi/sender/2.2/locations/${locationID}/${evseUID}/${connectorID}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseConnector response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseConnector);
        return response;
    }
    # Retrieves a Location as it is stored in the eMSP system.
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the CPO requesting data from the eMSP system 
    # + partyID - Party ID (Provider ID) of the CPO requesting data from the eMSP system 
    # + locationID - Location.id of the Location object to retrieve 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function getClientOwnedLocation(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string locationID, string? ocnSignature = ()) returns OcpiResponseLocation|error {
        string  path = string `/ocpi/receiver/2.2/locations/${countryCode}/${partyID}/${locationID}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseLocation response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseLocation);
        return response;
    }
    # Pushes new/updated Location and/or Connector to the eMSP
    #
    # + authorization - Authorization token 
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
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function putClientOwnedLocation(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string locationID, Location payload, string? ocnSignature = ()) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/locations/${countryCode}/${partyID}/${locationID}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Notifies the eMSP of partial updates to a Location, EVSE or Connector (such as the status).
    #
    # + authorization - Authorization token 
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
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function patchClientOwnedLocation(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string locationID, json payload, string? ocnSignature = ()) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/locations/${countryCode}/${partyID}/${locationID}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Retrieves a Location as it is stored in the eMSP system by EVSE UID
    #
    # + authorization - Authorization token 
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
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function getClientOwnedEvse(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string locationID, string evseUID, string? ocnSignature = ()) returns OcpiResponseEvse|error {
        string  path = string `/ocpi/receiver/2.2/locations/${countryCode}/${partyID}/${locationID}/${evseUID}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseEvse response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseEvse);
        return response;
    }
    # Pushes new/updated Location, EVSE and/or Connector to the eMSP by EVSE UID
    #
    # + authorization - Authorization token 
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
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function putClientOwnedEvse(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string locationID, string evseUID, Evse payload, string? ocnSignature = ()) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/locations/${countryCode}/${partyID}/${locationID}/${evseUID}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Notifies the eMSP of partial updates to a Location, EVSE or Connector (such as the status) by EVSE UID
    #
    # + authorization - Authorization token 
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
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function patchClientOwnedEvse(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string locationID, string evseUID, json payload, string? ocnSignature = ()) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/locations/${countryCode}/${partyID}/${locationID}/${evseUID}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Retrieves a Location as it is stored in the eMSP system by EVSE UID and Connector ID
    #
    # + authorization - Authorization token 
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
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function getClientOwnedConnector(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string locationID, string evseUID, string connectorID, string? ocnSignature = ()) returns OcpiResponseConnector|error {
        string  path = string `/ocpi/receiver/2.2/locations/${countryCode}/${partyID}/${locationID}/${evseUID}/${connectorID}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseConnector response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseConnector);
        return response;
    }
    # Pushes new/updated Location, EVSE and/or Connector to the eMSP by EVSE UID and connector ID
    #
    # + authorization - Authorization token 
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
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function putClientOwnedConnector(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string locationID, string evseUID, string connectorID, Connector payload, string? ocnSignature = ()) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/locations/${countryCode}/${partyID}/${locationID}/${evseUID}/${connectorID}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Notifies the eMSP of partial updates to a Location, EVSE or Connector (such as the status) by EVSE UID and connector ID
    #
    # + authorization - Authorization token 
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
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function patchClientOwnedConnector(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string locationID, string evseUID, string connectorID, json payload, string? ocnSignature = ()) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/locations/${countryCode}/${partyID}/${locationID}/${evseUID}/${connectorID}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Updates OCN rules - `whitelist`
    #
    # + authorization - Authorization token 
    # + payload - OCN Rules List Details 
    # + return - OK 
    remote isolated function updateWhitelist(string authorization, OcnRulesListParty[] payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/ocnrules/whitelist`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    #
    # + authorization - Authorization token 
    # + payload - OCN Rules List Details 
    # + return - OK 
    remote isolated function appendToWhitelist(string authorization, OcnRulesListParty payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/ocnrules/whitelist`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Updates OCN rules - `blacklist`
    #
    # + authorization - Authorization token 
    # + payload - OCN Rules List Details 
    # + return - OK 
    remote isolated function updateBlacklist(string authorization, OcnRulesListParty[] payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/ocnrules/blacklist`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    #
    # + authorization - Authorization token 
    # + payload - OCN Rules List Details 
    # + return - OK 
    remote isolated function appendToBlacklist(string authorization, OcnRulesListParty payload) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/ocnrules/blacklist`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Updates OCN Rules - `signature`
    #
    # + authorization - Authorization token 
    # + return - OK 
    remote isolated function updateSignatures(string authorization) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/ocnrules/signatures`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        OcpiResponseUnit response = check self.clientEp-> put(path, request, headers = accHeaders, targetType = OcpiResponseUnit);
        return response;
    }
    # Updates OCN Rules - `block-all`
    #
    # + authorization - Authorization token 
    # + return - OK 
    remote isolated function blockAll(string authorization) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/ocnrules/block-all`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        OcpiResponseUnit response = check self.clientEp-> put(path, request, headers = accHeaders, targetType = OcpiResponseUnit);
        return response;
    }
    # Deletes OCN Rules - `whitelist` by country code and party ID
    #
    # + authorization - Authorization token 
    # + countryCode - Country code 
    # + partyID - Party ID 
    # + return - OK 
    remote isolated function deleteFromWhitelist(string authorization, string countryCode, string partyID) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/ocnrules/whitelist/${countryCode}/${partyID}`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        OcpiResponseUnit response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = OcpiResponseUnit);
        return response;
    }
    # Deletes OCN Rules - `blacklist` by country code and party ID
    #
    # + authorization - Authorization token 
    # + countryCode - Country code 
    # + partyID - Party ID 
    # + return - OK 
    remote isolated function deleteFromBlacklist(string authorization, string countryCode, string partyID) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/ocnrules/blacklist/${countryCode}/${partyID}`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        OcpiResponseUnit response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = OcpiResponseUnit);
        return response;
    }
    # Gets all OCN Rules
    #
    # + authorization - Authorization token 
    # + return - OK 
    remote isolated function getRules(string authorization) returns OcpiResponseOcnRules|error {
        string  path = string `/ocpi/receiver/2.2/ocnrules`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseOcnRules response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseOcnRules);
        return response;
    }
    # Fetches Session objects of charging sessions last updated between the {date_from} and {date_to}
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + ocnSignature - OCN Signature 
    # + dateFrom - Only return Sessions that have last_updated after or equal to this Date/Time(inclusive) 
    # + dateTo - Only return Sessions that have last_updated up to this Date/Time, but not including (exclusive) 
    # + offset - The offset of the first object returned. Default is 0 
    # + 'limit - Maximum number of objects to GET 
    # + return - OK 
    remote isolated function getSessionsFromDataOwner(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string? ocnSignature = (), string? dateFrom = (), string? dateTo = (), int? offset = (), int? 'limit = ()) returns OcpiResponseSessionList|error {
        string  path = string `/ocpi/sender/2.2/sessions`;
        map<anydata> queryParam = {"date_from": dateFrom, "date_to": dateTo, "offset": offset, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseSessionList response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseSessionList);
        return response;
    }
    # Fetches Session objects of charging sessions
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + uid - Page ID 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function getSessionsPageFromDataOwner(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string uid, string? ocnSignature = ()) returns OcpiResponseSessionList|error {
        string  path = string `/ocpi/sender/2.2/sessions/page/${uid}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseSessionList response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseSessionList);
        return response;
    }
    # Sets/Updates the driver’s Charging Preferences for the charging session
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + sessionID - Charging session ID 
    # + payload - Charging preferences details 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function putChargingPreferences(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string sessionID, ChargingPreferences payload, string? ocnSignature = ()) returns OcpiResponseChargingPreferencesResponse|error {
        string  path = string `/ocpi/sender/2.2/sessions/${sessionID}/charging_preferences`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseChargingPreferencesResponse response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseChargingPreferencesResponse);
        return response;
    }
    # Retrieves a Session object from the eMSP’s system with Session.id equal to {session_id}
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the CPO performing the GET on the eMSP’s system 
    # + partyID - Party ID (Provider ID) of the CPO performing the GET on the eMSP’s system 
    # + sessionID - ID of the Session object to get from the eMSP’s system. 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function getClientOwnedSession(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string sessionID, string? ocnSignature = ()) returns OcpiResponseSession|error {
        string  path = string `/ocpi/receiver/2.2/sessions/${countryCode}/${partyID}/${sessionID}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseSession response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseSession);
        return response;
    }
    # Informs the eMSP’s system about a new/updated Session object in the CPO’s system
    #
    # + authorization - Authorization token 
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
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function putClientOwnedSession(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string sessionID, Session payload, string? ocnSignature = ()) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/sessions/${countryCode}/${partyID}/${sessionID}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Updates the Session object with Session.id equal to {session_id}
    #
    # + authorization - Authorization token 
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
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function patchClientOwnedSession(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string sessionID, json payload, string? ocnSignature = ()) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/sessions/${countryCode}/${partyID}/${sessionID}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Retrieves a Tariff as it is stored in the eMSP’s system
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the CPO performing the PUT request on the eMSP’s system 
    # + partyID - Party ID (Provider ID) of the CPO performing the PUT request on the eMSP’ssystem 
    # + tariffID - Tariff.id of the Tariff object to retrieve 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function getClientOwnedTariff(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string tariffID, string? ocnSignature = ()) returns OcpiResponseTariff|error {
        string  path = string `/ocpi/receiver/2.2/tariffs/${countryCode}/${partyID}/${tariffID}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseTariff response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseTariff);
        return response;
    }
    # Pushes new/updated Tariff object to the eMSP.
    #
    # + authorization - Authorization token 
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
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function putClientOwnedTariff(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string tariffID, Tariff payload, string? ocnSignature = ()) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/tariffs/${countryCode}/${partyID}/${tariffID}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Deletes a Tariff object which is not used any more and will not be used in future either
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the CPO performing the PUT request on the eMSP’s system 
    # + partyID - Party ID (Provider ID) of the CPO performing the PUT request on the eMSP’ssystem 
    # + tariffID - Tariff.id of the Tariff object to delete 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function deleteClientOwnedTariff(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string tariffID, string? ocnSignature = ()) returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/tariffs/${countryCode}/${partyID}/${tariffID}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        OcpiResponseUnit response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = OcpiResponseUnit);
        return response;
    }
    # Returns Tariff objects from the CPO, last updated between the {date_from} and {date_to}
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + ocnSignature - OCN Signature 
    # + dateFrom - Only return Tariffs that have last_updated after or equal to this Date/Time(inclusive). 
    # + dateTo - Only return Tariffs that have last_updated up to this Date/Time, but notincluding (exclusive) 
    # + offset - The offset of the first object returned. Default is 0 
    # + 'limit - Maximum number of objects to GET 
    # + return - OK 
    remote isolated function getTariffsFromDataOwner(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string? ocnSignature = (), string? dateFrom = (), string? dateTo = (), int? offset = (), int? 'limit = ()) returns OcpiResponseTariffList|error {
        string  path = string `/ocpi/sender/2.2/tariffs`;
        map<anydata> queryParam = {"date_from": dateFrom, "date_to": dateTo, "offset": offset, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseTariffList response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseTariffList);
        return response;
    }
    # Returns Tariff objects from the CPO by page ID
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + uid - Page ID 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function getTariffsPageFromDataOwner(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string uid, string? ocnSignature = ()) returns OcpiResponseTariffList|error {
        string  path = string `/ocpi/sender/2.2/tariffs/page/${uid}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseTariffList response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseTariffList);
        return response;
    }
    # Gets the list of known Tokens, last updated between the {date_from} and {date_to}(Paginated)
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + ocnSignature - OCN Signature 
    # + dateFrom - Only return Tokens that have last_updated after or equal to this Date/Time(inclusive) 
    # + dateTo - Only return Tokens that have last_updated up to this Date/Time, but not including (exclusive) 
    # + offset - The offset of the first object returned. Default is 0 
    # + 'limit - Maximum number of objects to GET 
    # + return - OK 
    remote isolated function getTokensFromDataOwner(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string? ocnSignature = (), string? dateFrom = (), string? dateTo = (), int? offset = (), int? 'limit = ()) returns OcpiResponseTokenList|error {
        string  path = string `/ocpi/sender/2.2/tokens`;
        map<anydata> queryParam = {"date_from": dateFrom, "date_to": dateTo, "offset": offset, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseTokenList response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseTokenList);
        return response;
    }
    # Gets the list of known Tokens Page ID
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + uid - Page ID 
    # + ocnSignature - OCN Signature 
    # + return - OK 
    remote isolated function getTokensPageFromDataOwner(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string uid, string? ocnSignature = ()) returns OcpiResponseTokenList|error {
        string  path = string `/ocpi/sender/2.2/tokens/page/${uid}`;
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseTokenList response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseTokenList);
        return response;
    }
    # Does a 'real-time' authorization request to the eMSP system, validating if a Token might be used (at the optionally given Location)
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + tokenUID - Token.uid of the Token for which authorization is requested. 
    # + payload - Location references details 
    # + ocnSignature - OCN Signature 
    # + 'type - Token type of the Token for which this authorization is. Default if omitted- RFID 
    # + return - OK 
    remote isolated function postRealTimeTokenAuthorization(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string tokenUID, LocationReferences payload, string? ocnSignature = (), string 'type = "RFID") returns OcpiResponseAuthorizationInfo|error {
        string  path = string `/ocpi/sender/2.2/tokens/${tokenUID}/authorize`;
        map<anydata> queryParam = {"type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseAuthorizationInfo response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OcpiResponseAuthorizationInfo);
        return response;
    }
    # Retrieves a Token as it is stored in the CPO system
    #
    # + authorization - Authorization token 
    # + xRequestId - Every request shall contain a unique request ID, the response to this request shall contain the same ID 
    # + xCorrelationId - Every request/response shall contain a unique correlation ID, every response to this request shall contain the same ID 
    # + ocpiFromCountryCode - Country code of the connected party this message is sent from 
    # + ocpiFromPartyId - Party ID of the connected party this message is sent from 
    # + ocpiToCountryCode - Country code of the connected party this message is to be sent to 
    # + ocpiToPartyId - Party ID of the connected party this message is to be sent to 
    # + countryCode - Country code of the eMSP requesting this GET from the CPO system 
    # + partyID - Party ID (Provider ID) of the eMSP requesting this GET from the CPO system 
    # + tokenUID - Token.uid of the Token object to retrieve 
    # + ocnSignature - OCN Signature 
    # + 'type - Token.type of the Token to retrieve. Default if omitted- RFID 
    # + return - OK 
    remote isolated function getClientOwnedToken(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string tokenUID, string? ocnSignature = (), string 'type = "RFID") returns OcpiResponseToken|error {
        string  path = string `/ocpi/receiver/2.2/tokens/${countryCode}/${partyID}/${tokenUID}`;
        map<anydata> queryParam = {"type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OcpiResponseToken response = check self.clientEp-> get(path, accHeaders, targetType = OcpiResponseToken);
        return response;
    }
    # Pushes new/updated Token object to the CPO
    #
    # + authorization - Authorization token 
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
    # + ocnSignature - OCN Signature 
    # + 'type - Token.type of the Token of the (new) Token object (to replace). Default if omitted:RFID 
    # + return - OK 
    remote isolated function putClientOwnedToken(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string tokenUID, Token payload, string? ocnSignature = (), string 'type = "RFID") returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/tokens/${countryCode}/${partyID}/${tokenUID}`;
        map<anydata> queryParam = {"type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OcpiResponseUnit response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OcpiResponseUnit);
        return response;
    }
    # Notifies the CPO of partial updates to a Token
    #
    # + authorization - Authorization token 
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
    # + ocnSignature - OCN Signature 
    # + 'type - Token.type of the Token of the Token object 
    # + return - OK 
    remote isolated function patchClientOwnedToken(string authorization, string xRequestId, string xCorrelationId, string ocpiFromCountryCode, string ocpiFromPartyId, string ocpiToCountryCode, string ocpiToPartyId, string countryCode, string partyID, string tokenUID, json payload, string? ocnSignature = (), string 'type = "RFID") returns OcpiResponseUnit|error {
        string  path = string `/ocpi/receiver/2.2/tokens/${countryCode}/${partyID}/${tokenUID}`;
        map<anydata> queryParam = {"type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": authorization, "OCN-Signature": ocnSignature, "X-Request-ID": xRequestId, "X-Correlation-ID": xCorrelationId, "OCPI-from-country-code": ocpiFromCountryCode, "OCPI-from-party-id": ocpiFromPartyId, "OCPI-to-country-code": ocpiToCountryCode, "OCPI-to-party-id": ocpiToPartyId};
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
