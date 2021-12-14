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
    # Represents API Key 'Authorization'
    string authorization;
|};

# This is a generated connector for [GoDaddy Certificates API v1](https://developer.godaddy.com/doc/endpoint/certificates) OpenAPI specification.
# The GoDaddy Certificates API provides capability to access GoDaddy operations related to certificates.
@display {label: "GoDaddy Certificates", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [GoDaddy account](https://sg.godaddy.com/) and obtain tokens by following [this guide](https://developer.godaddy.com/getstarted).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.ote-godaddy.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Create a pending order for certificate
    #
    # + xMarketId - Setting locale for communications such as emails and error messages 
    # + payload - The certificate order information 
    # + return - Request was successful 
    remote isolated function certificateCreate(CertificateCreate payload, string xMarketId = "Default locale for shopper account") returns CertificateIdentifier|error {
        string resourcePath = string `/v1/certificates`;
        map<any> headerValues = {"X-Market-Id": xMarketId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CertificateIdentifier response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Validate a pending order for certificate
    #
    # + xMarketId - Setting locale for communications such as emails and error messages 
    # + payload - The certificate order info 
    # + return - Request validated successfully 
    remote isolated function certificateValidate(CertificateCreate payload, string xMarketId = "Default locale for shopper account") returns http:Response|error {
        string resourcePath = string `/v1/certificates/validate`;
        map<any> headerValues = {"X-Market-Id": xMarketId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve certificate details
    #
    # + certificateId - Certificate id to lookup 
    # + return - Certificate details retrieved 
    remote isolated function certificateGet(string certificateId) returns Certificate|error {
        string resourcePath = string `/v1/certificates/${certificateId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Certificate response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve all certificate actions
    #
    # + certificateId - Certificate id to register for callback 
    # + return - Action retrieval successful 
    remote isolated function certificateActionRetrieve(string certificateId) returns ArrayOfCertificateAction|error {
        string resourcePath = string `/v1/certificates/${certificateId}/actions`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ArrayOfCertificateAction response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Resend an email
    #
    # + certificateId - Certificate id to resend email 
    # + emailId - Email id for email to resend 
    # + return - Email sent successfully 
    remote isolated function certificateResendEmail(string certificateId, string emailId) returns http:Response|error {
        string resourcePath = string `/v1/certificates/${certificateId}/email/${emailId}/resend`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Add alternate email address
    #
    # + certificateId - Certificate id to resend emails 
    # + emailAddress - Specific email address to resend email 
    # + return - Alternate email address added and emails re-sent 
    remote isolated function certificateAlternateEmailAddress(string certificateId, string emailAddress) returns CertificateEmailHistory|error {
        string resourcePath = string `/v1/certificates/${certificateId}/email/resend/${emailAddress}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        CertificateEmailHistory response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Resend email to email address
    #
    # + certificateId - Certificate id to resend emails 
    # + emailId - Email id for email to resend 
    # + emailAddress - Specific email address to resend email 
    # + return - Email sent successfully 
    remote isolated function certificateResendEmailAddress(string certificateId, string emailId, string emailAddress) returns http:Response|error {
        string resourcePath = string `/v1/certificates/${certificateId}/email/${emailId}/resend/${emailAddress}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve email history
    #
    # + certificateId - Certificate id to retrieve email history 
    # + return - Email history retrieval successful 
    remote isolated function certificateEmailHistory(string certificateId) returns CertificateEmailHistory|error {
        string resourcePath = string `/v1/certificates/${certificateId}/email/history`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CertificateEmailHistory response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve system stateful action callback url
    #
    # + certificateId - Certificate id to register for stateful action callback 
    # + return - Callback registered 
    remote isolated function certificateCallbackGet(string certificateId) returns CertificateCallback|error {
        string resourcePath = string `/v1/certificates/${certificateId}/callback`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CertificateCallback response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Register of certificate action callback
    #
    # + certificateId - Certificate id to register/replace for callback 
    # + callbackUrl - Callback url registered/replaced to receive stateful actions 
    # + return - Callback replaced/registered 
    remote isolated function certificateCallbackReplace(string certificateId, string callbackUrl) returns http:Response|error {
        string resourcePath = string `/v1/certificates/${certificateId}/callback`;
        map<anydata> queryParam = {"callbackUrl": callbackUrl};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Unregister system callback
    #
    # + certificateId - Certificate id to unregister callback 
    # + return - Callback removed 
    remote isolated function certificateCallbackDelete(string certificateId) returns http:Response|error {
        string resourcePath = string `/v1/certificates/${certificateId}/callback`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Cancel a pending certificate
    #
    # + certificateId - Certificate id to cancel 
    # + return - Certificate order has been canceled 
    remote isolated function certificateCancel(string certificateId) returns http:Response|error {
        string resourcePath = string `/v1/certificates/${certificateId}/cancel`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Download certificate
    #
    # + certificateId - Certificate id to download 
    # + return - Certificate retrieved 
    remote isolated function certificateDownload(string certificateId) returns CertificateBundle|error {
        string resourcePath = string `/v1/certificates/${certificateId}/download`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CertificateBundle response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Reissue active certificate
    #
    # + certificateId - Certificate id to reissue 
    # + payload - The reissue request info 
    # + return - Reissue request created 
    remote isolated function certificateReissue(string certificateId, CertificateReissue payload) returns http:Response|error {
        string resourcePath = string `/v1/certificates/${certificateId}/reissue`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Renew active certificate
    #
    # + certificateId - Certificate id to renew 
    # + payload - The renew request info 
    # + return - Renew request created 
    remote isolated function certificateRenew(string certificateId, CertificateRenew payload) returns http:Response|error {
        string resourcePath = string `/v1/certificates/${certificateId}/renew`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Revoke active certificate
    #
    # + certificateId - Certificate id to revoke 
    # + payload - The certificate revocation request 
    # + return - Certificate Revoked 
    remote isolated function certificateRevoke(string certificateId, CertificateRevoke payload) returns http:Response|error {
        string resourcePath = string `/v1/certificates/${certificateId}/revoke`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get Site seal
    #
    # + certificateId - Certificate id 
    # + theme - This value represents the visual theme of the seal. If seal doesn't exist, default values are used if params not present. If seal does exist, default values will not be used to update unless params present. 
    # + locale - Determine locale for text displayed in seal image and verification page. If seal doesn't exist, default values are used if params not present. If seal does exist, default values will not be used to update unless params present. 
    # + return - Site seal retrieved 
    remote isolated function certificateSitesealGet(string certificateId, string theme = "LIGHT", string locale = "en") returns CertificateSiteSeal|error {
        string resourcePath = string `/v1/certificates/${certificateId}/siteSeal`;
        map<anydata> queryParam = {"theme": theme, "locale": locale};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CertificateSiteSeal response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Check Domain Control
    #
    # + certificateId - Certificate id to lookup 
    # + return - Domain control was successful 
    remote isolated function certificateVerifydomaincontrol(string certificateId) returns http:Response|error {
        string resourcePath = string `/v1/certificates/${certificateId}/verifyDomainControl`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Search for certificate details by entitlement
    #
    # + entitlementId - Entitlement id to lookup 
    # + latest - Fetch only the most recent certificate 
    # + return - Certificate details retrieved 
    remote isolated function certificateGetEntitlement(string entitlementId, boolean latest = true) returns Certificate[]|error {
        string resourcePath = string `/v2/certificates`;
        map<anydata> queryParam = {"entitlementId": entitlementId, "latest": latest};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Certificate[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Download certificate by entitlement
    #
    # + entitlementId - Entitlement id to download 
    # + return - Certificate retrieved 
    remote isolated function certificateDownloadEntitlement(string entitlementId) returns CertificateBundle|error {
        string resourcePath = string `/v2/certificates/download`;
        map<anydata> queryParam = {"entitlementId": entitlementId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CertificateBundle response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve customer's certificates
    #
    # + customerId - An identifier for a customer 
    # + offset - Number of results to skip for pagination 
    # + 'limit - Maximum number of items to return 
    # + return - Customer certificate information retrieved. 
    remote isolated function getCustomerCertificatesByCustomerId(string customerId, int? offset = (), int? 'limit = ()) returns CertificateSummariesV2|error {
        string resourcePath = string `/v2/customers/${customerId}/certificates`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CertificateSummariesV2 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve individual certificate details
    #
    # + customerId - An identifier for a customer 
    # + certificateId - Certificate id to lookup 
    # + return - Certificate details retrieved 
    remote isolated function getCertificateDetailByCertIdentifier(string customerId, string certificateId) returns CertificateDetailV2|error {
        string resourcePath = string `/v2/customers/${customerId}/certificates/${certificateId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CertificateDetailV2 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve domain verification status
    #
    # + customerId - An identifier for a customer 
    # + certificateId - Certificate id to lookup 
    # + return - Domain verification status list for specified certificateId. 
    remote isolated function getDomainInformationByCertificateId(string customerId, string certificateId) returns DomainVerificationSummary[]|error {
        string resourcePath = string `/v2/customers/${customerId}/certificates/${certificateId}/domainVerifications`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DomainVerificationSummary[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve detailed information for supplied domain
    #
    # + customerId - An identifier for a customer 
    # + certificateId - Certificate id to lookup 
    # + domain - A valid domain name in the certificate request 
    # + return - Retrieve detailed information for supplied domain, including domain verification details and Certificate Authority Authorization (CAA) verification details. 
    remote isolated function getDomainDetailsByDomain(string customerId, string certificateId, string domain) returns DomainVerificationDetail|error {
        string resourcePath = string `/v2/customers/${customerId}/certificates/${certificateId}/domainVerifications/${domain}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DomainVerificationDetail response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieves the external account binding for the specified customer
    #
    # + customerId - An identifier for a customer 
    # + return - Acme key identifier and HMAC key for the external account binding. Directory URI is also provided for making ACME requests. 
    remote isolated function getAcmeExternalAccountBinding(string customerId) returns ExternalAccountBinding|error {
        string resourcePath = string `/v2/customers/${customerId}/certificates/acme/externalAccountBinding`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ExternalAccountBinding response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
