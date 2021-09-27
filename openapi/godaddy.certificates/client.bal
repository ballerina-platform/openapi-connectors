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

# This is a generated connector for [GoDaddy Certificates API v1](https://developer.godaddy.com/doc/endpoint/certificates) OpenAPI specification. 
# The GoDaddy Certificates API provides capability to access GoDaddy operations related to certificates.
@display {label: "Godaddy Certificates", iconPath: "resources/godaddy.certificates.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [GoDaddy account](https://sg.godaddy.com/) and obtain tokens by following [this guide](https://developer.godaddy.com/getstarted).
    #
    # + apiKeyConfig - Provide your API Key as `Authorization`. Eg: {Authorization : sso-key [<API_KEY>]:[<API_SECRET>]}
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.ote-godaddy.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Create a pending order for certificate
    #
    # + payload - The certificate order information
    # + xMarketId - Setting locale for communications such as emails and error messages
    # + return - Request was successful
    remote isolated function certificateCreate(CertificateCreate payload, string xMarketId = "Default locale for shopper account") returns CertificateIdentifier|error {
        string  path = string `/v1/certificates`;
        map<any> headerValues = {"X-Market-Id": xMarketId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CertificateIdentifier response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CertificateIdentifier);
        return response;
    }
    # Validate a pending order for certificate
    #
    # + payload - The certificate order info
    # + xMarketId - Setting locale for communications such as emails and error messages
    # + return - Request validated successfully
    remote isolated function certificateValidate(CertificateCreate payload, string xMarketId = "Default locale for shopper account") returns http:Response|error {
        string  path = string `/v1/certificates/validate`;
        map<any> headerValues = {"X-Market-Id": xMarketId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Retrieve certificate details
    #
    # + certificateId - Certificate id to lookup
    # + return - Certificate details retrieved
    remote isolated function certificateGet(string certificateId) returns Certificate|error {
        string  path = string `/v1/certificates/${certificateId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Certificate response = check self.clientEp-> get(path, accHeaders, targetType = Certificate);
        return response;
    }
    # Retrieve all certificate actions
    #
    # + certificateId - Certificate id to register for callback
    # + return - Action retrieval successful
    remote isolated function certificateActionRetrieve(string certificateId) returns ArrayOfCertificateAction|error {
        string  path = string `/v1/certificates/${certificateId}/actions`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ArrayOfCertificateAction response = check self.clientEp-> get(path, accHeaders, targetType = ArrayOfCertificateAction);
        return response;
    }
    # Resend an email
    #
    # + certificateId - Certificate id to resend email
    # + emailId - Email id for email to resend
    # + return - Email sent successfully
    remote isolated function certificateResendEmail(string certificateId, string emailId) returns http:Response|error {
        string  path = string `/v1/certificates/${certificateId}/email/${emailId}/resend`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Add alternate email address
    #
    # + certificateId - Certificate id to resend emails
    # + emailAddress - Specific email address to resend email
    # + return - Alternate email address added and emails re-sent
    remote isolated function certificateAlternateEmailAddress(string certificateId, string emailAddress) returns CertificateEmailHistory|error {
        string  path = string `/v1/certificates/${certificateId}/email/resend/${emailAddress}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        CertificateEmailHistory response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = CertificateEmailHistory);
        return response;
    }
    # Resend email to email address
    #
    # + certificateId - Certificate id to resend emails
    # + emailId - Email id for email to resend
    # + emailAddress - Specific email address to resend email
    # + return - Email sent successfully
    remote isolated function certificateResendEmailAddress(string certificateId, string emailId, string emailAddress) returns http:Response|error {
        string  path = string `/v1/certificates/${certificateId}/email/${emailId}/resend/${emailAddress}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve email history
    #
    # + certificateId - Certificate id to retrieve email history
    # + return - Email history retrieval successful
    remote isolated function certificateEmailHistory(string certificateId) returns CertificateEmailHistory|error {
        string  path = string `/v1/certificates/${certificateId}/email/history`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CertificateEmailHistory response = check self.clientEp-> get(path, accHeaders, targetType = CertificateEmailHistory);
        return response;
    }
    # Retrieve system stateful action callback url
    #
    # + certificateId - Certificate id to register for stateful action callback
    # + return - Callback registered
    remote isolated function certificateCallbackGet(string certificateId) returns CertificateCallback|error {
        string  path = string `/v1/certificates/${certificateId}/callback`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CertificateCallback response = check self.clientEp-> get(path, accHeaders, targetType = CertificateCallback);
        return response;
    }
    # Register of certificate action callback
    #
    # + certificateId - Certificate id to register/replace for callback
    # + callbackUrl - Callback url registered/replaced to receive stateful actions
    # + return - Callback replaced/registered
    remote isolated function certificateCallbackReplace(string certificateId, string callbackUrl) returns http:Response|error {
        string  path = string `/v1/certificates/${certificateId}/callback`;
        map<anydata> queryParam = {"callbackUrl": callbackUrl};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Unregister system callback
    #
    # + certificateId - Certificate id to unregister callback
    # + return - Callback removed
    remote isolated function certificateCallbackDelete(string certificateId) returns http:Response|error {
        string  path = string `/v1/certificates/${certificateId}/callback`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Cancel a pending certificate
    #
    # + certificateId - Certificate id to cancel
    # + return - Certificate order has been canceled
    remote isolated function certificateCancel(string certificateId) returns http:Response|error {
        string  path = string `/v1/certificates/${certificateId}/cancel`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Download certificate
    #
    # + certificateId - Certificate id to download
    # + return - Certificate retrieved
    remote isolated function certificateDownload(string certificateId) returns CertificateBundle|error {
        string  path = string `/v1/certificates/${certificateId}/download`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CertificateBundle response = check self.clientEp-> get(path, accHeaders, targetType = CertificateBundle);
        return response;
    }
    # Reissue active certificate
    #
    # + certificateId - Certificate id to reissue
    # + payload - The reissue request info
    # + return - Reissue request created
    remote isolated function certificateReissue(string certificateId, CertificateReissue payload) returns http:Response|error {
        string  path = string `/v1/certificates/${certificateId}/reissue`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Renew active certificate
    #
    # + certificateId - Certificate id to renew
    # + payload - The renew request info
    # + return - Renew request created
    remote isolated function certificateRenew(string certificateId, CertificateRenew payload) returns http:Response|error {
        string  path = string `/v1/certificates/${certificateId}/renew`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Revoke active certificate
    #
    # + certificateId - Certificate id to revoke
    # + payload - The certificate revocation request
    # + return - Certificate Revoked
    remote isolated function certificateRevoke(string certificateId, CertificateRevoke payload) returns http:Response|error {
        string  path = string `/v1/certificates/${certificateId}/revoke`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Get Site seal
    #
    # + certificateId - Certificate id
    # + theme - This value represents the visual theme of the seal. If seal doesn't exist, default values are used if params not present. If seal does exist, default values will not be used to update unless params present.
    # + locale - Determine locale for text displayed in seal image and verification page. If seal doesn't exist, default values are used if params not present. If seal does exist, default values will not be used to update unless params present.
    # + return - Site seal retrieved
    remote isolated function certificateSitesealGet(string certificateId, string theme = "LIGHT", string locale = "en") returns CertificateSiteSeal|error {
        string  path = string `/v1/certificates/${certificateId}/siteSeal`;
        map<anydata> queryParam = {"theme": theme, "locale": locale};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CertificateSiteSeal response = check self.clientEp-> get(path, accHeaders, targetType = CertificateSiteSeal);
        return response;
    }
    # Check Domain Control
    #
    # + certificateId - Certificate id to lookup
    # + return - Domain control was successful
    remote isolated function certificateVerifydomaincontrol(string certificateId) returns http:Response|error {
        string  path = string `/v1/certificates/${certificateId}/verifyDomainControl`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Search for certificate details by entitlement
    #
    # + entitlementId - Entitlement id to lookup
    # + latest - Fetch only the most recent certificate
    # + return - Certificate details retrieved
    remote isolated function certificateGetEntitlement(string entitlementId, boolean latest = true) returns Certificate[]|error {
        string  path = string `/v2/certificates`;
        map<anydata> queryParam = {"entitlementId": entitlementId, "latest": latest};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Certificate[] response = check self.clientEp-> get(path, accHeaders, targetType = CertificateArr);
        return response;
    }
    # Download certificate by entitlement
    #
    # + entitlementId - Entitlement id to download
    # + return - Certificate retrieved
    remote isolated function certificateDownloadEntitlement(string entitlementId) returns CertificateBundle|error {
        string  path = string `/v2/certificates/download`;
        map<anydata> queryParam = {"entitlementId": entitlementId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CertificateBundle response = check self.clientEp-> get(path, accHeaders, targetType = CertificateBundle);
        return response;
    }
    # Retrieve customer's certificates
    #
    # + customerId - An identifier for a customer
    # + offset - Number of results to skip for pagination
    # + 'limit - Maximum number of items to return
    # + return - Customer certificate information retrieved.
    remote isolated function getCustomerCertificatesByCustomerId(string customerId, int? offset = (), int? 'limit = ()) returns CertificateSummariesV2|error {
        string  path = string `/v2/customers/${customerId}/certificates`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CertificateSummariesV2 response = check self.clientEp-> get(path, accHeaders, targetType = CertificateSummariesV2);
        return response;
    }
    # Retrieve individual certificate details
    #
    # + customerId - An identifier for a customer
    # + certificateId - Certificate id to lookup
    # + return - Certificate details retrieved
    remote isolated function getCertificateDetailByCertIdentifier(string customerId, string certificateId) returns CertificateDetailV2|error {
        string  path = string `/v2/customers/${customerId}/certificates/${certificateId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CertificateDetailV2 response = check self.clientEp-> get(path, accHeaders, targetType = CertificateDetailV2);
        return response;
    }
    # Retrieve domain verification status
    #
    # + customerId - An identifier for a customer
    # + certificateId - Certificate id to lookup
    # + return - Domain verification status list for specified certificateId.
    remote isolated function getDomainInformationByCertificateId(string customerId, string certificateId) returns DomainVerificationSummary[]|error {
        string  path = string `/v2/customers/${customerId}/certificates/${certificateId}/domainVerifications`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DomainVerificationSummary[] response = check self.clientEp-> get(path, accHeaders, targetType = DomainVerificationSummaryArr);
        return response;
    }
    # Retrieve detailed information for supplied domain
    #
    # + customerId - An identifier for a customer
    # + certificateId - Certificate id to lookup
    # + domain - A valid domain name in the certificate request
    # + return - Retrieve detailed information for supplied domain, including domain verification details and Certificate Authority Authorization (CAA) verification details.
    remote isolated function getDomainDetailsByDomain(string customerId, string certificateId, string domain) returns DomainVerificationDetail|error {
        string  path = string `/v2/customers/${customerId}/certificates/${certificateId}/domainVerifications/${domain}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DomainVerificationDetail response = check self.clientEp-> get(path, accHeaders, targetType = DomainVerificationDetail);
        return response;
    }
    # Retrieves the external account binding for the specified customer
    #
    # + customerId - An identifier for a customer
    # + return - Acme key identifier and HMAC key for the external account binding. Directory URI is also provided for making ACME requests.
    remote isolated function getAcmeExternalAccountBinding(string customerId) returns ExternalAccountBinding|error {
        string  path = string `/v2/customers/${customerId}/certificates/acme/externalAccountBinding`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ExternalAccountBinding response = check self.clientEp-> get(path, accHeaders, targetType = ExternalAccountBinding);
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
