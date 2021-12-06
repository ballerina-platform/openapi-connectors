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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
    # The HTTP version understood by the client
    string httpVersion = "1.1";
    # Configurations related to HTTP/1.x protocol
    http:ClientHttp1Settings http1Settings = {};
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings = {};
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with Redirection
    http:FollowRedirects? followRedirects = ();
    # Configurations associated with request pooling
    http:PoolConfiguration? poolConfig = ();
    # HTTP caching related configurations
    http:CacheConfig cache = {};
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig? circuitBreaker = ();
    # Configurations associated with retrying
    http:RetryConfig? retryConfig = ();
    # Configurations associated with cookies
    http:CookieConfig? cookieConfig = ();
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits = {};
    # SSL/TLS-related options
    http:ClientSecureSocket? secureSocket = ();
|};

# This is a generated connector from [Azure Key Vault API v7.0](https://azure.microsoft.com/en-us/services/key-vault/) OpenAPI specification.
# The Key Vault client performs cryptographic key operations and vault operations against the Key Vault service.
@display {label: "Azure Key Vault", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Azure Key Vault account](https://azure.microsoft.com/en-us/services/key-vault/) and obtain OAuth tokens following [this guide](https://docs.microsoft.com/en-us/azure/key-vault/general/authentication#the-key-vault-request-operation-flow-with-authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # List certificates in a specified key vault
    #
    # + apiVersion - Client API version.
    # + maxresults - Maximum number of results to return in a page. If not specified the service will return up to 25 results.
    # + includePending - Specifies whether to include certificates which are not completely provisioned.
    # + return - A response message containing a list of certificates along with a link to the next page of certificates.
    remote isolated function getCertificates(string apiVersion, int? maxresults = (), boolean? includePending = ()) returns CertificateListResult|error {
        string  path = string `/certificates`;
        map<anydata> queryParam = {"maxresults": maxresults, "includePending": includePending, "api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        CertificateListResult response = check self.clientEp-> get(path, targetType = CertificateListResult);
        return response;
    }
    # Lists the certificate contacts for a specified key vault.
    #
    # + apiVersion - Client API version.
    # + return - The contacts for the key vault certificate.
    remote isolated function getCertificateContacts(string apiVersion) returns Contacts|error {
        string  path = string `/certificates/contacts`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        Contacts response = check self.clientEp-> get(path, targetType = Contacts);
        return response;
    }
    # Sets the certificate contacts for the specified key vault.
    #
    # + apiVersion - Client API version.
    # + payload - The contacts for the key vault certificate.
    # + return - The contacts for the key vault certificate.
    remote isolated function setCertificateContacts(string apiVersion, Contacts payload) returns Contacts|error {
        string  path = string `/certificates/contacts`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Contacts response = check self.clientEp->put(path, request, targetType=Contacts);
        return response;
    }
    # Deletes the certificate contacts for a specified key vault.
    #
    # + apiVersion - Client API version.
    # + return - The contacts for the key vault certificate.
    remote isolated function deleteCertificateContacts(string apiVersion) returns Contacts|error {
        string  path = string `/certificates/contacts`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Contacts response = check self.clientEp-> delete(path, request, targetType = Contacts);
        return response;
    }
    # List certificate issuers for a specified key vault.
    #
    # + apiVersion - Client API version.
    # + maxresults - Maximum number of results to return in a page. If not specified the service will return up to 25 results.
    # + return - A response message containing a list of certificate issuers in a key vault along with a link to the next page of certificate issuers.
    remote isolated function getCertificateIssuers(string apiVersion, int? maxresults = ()) returns CertificateIssuerListResult|error {
        string  path = string `/certificates/issuers`;
        map<anydata> queryParam = {"maxresults": maxresults, "api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        CertificateIssuerListResult response = check self.clientEp-> get(path, targetType = CertificateIssuerListResult);
        return response;
    }
    # Lists the specified certificate issuer.
    #
    # + issuerName - The name of the issuer.
    # + apiVersion - Client API version.
    # + return - The issuer for the key vault certificate.
    remote isolated function getCertificateIssuer(string issuerName, string apiVersion) returns IssuerBundle|error {
        string  path = string `/certificates/issuers/${issuerName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        IssuerBundle response = check self.clientEp-> get(path, targetType = IssuerBundle);
        return response;
    }
    # Sets the specified certificate issuer.
    #
    # + issuerName - The name of the issuer.
    # + apiVersion - Client API version.
    # + payload - Certificate issuer set parameter.
    # + return - The issuer for the key vault certificate.
    remote isolated function setCertificateIssuer(string issuerName, string apiVersion, CertificateIssuerSetParameters payload) returns IssuerBundle|error {
        string  path = string `/certificates/issuers/${issuerName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IssuerBundle response = check self.clientEp->put(path, request, targetType=IssuerBundle);
        return response;
    }
    # Deletes the specified certificate issuer.
    #
    # + issuerName - The name of the issuer.
    # + apiVersion - Client API version.
    # + return - The issuer for the key vault certificate.
    remote isolated function deleteCertificateIssuer(string issuerName, string apiVersion) returns IssuerBundle|error {
        string  path = string `/certificates/issuers/${issuerName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        IssuerBundle response = check self.clientEp-> delete(path, request, targetType = IssuerBundle);
        return response;
    }
    # Updates the specified certificate issuer.
    #
    # + issuerName - The name of the issuer.
    # + apiVersion - Client API version.
    # + payload - Certificate issuer update parameter.
    # + return - The issuer for the key vault certificate.
    remote isolated function updateCertificateIssuer(string issuerName, string apiVersion, CertificateIssuerUpdateParameters payload) returns IssuerBundle|error {
        string  path = string `/certificates/issuers/${issuerName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IssuerBundle response = check self.clientEp->patch(path, request, targetType=IssuerBundle);
        return response;
    }
    # Restores a backed up certificate to a vault.
    #
    # + apiVersion - Client API version.
    # + payload - The parameters to restore the certificate.
    # + return - Restored certificate bundle in the vault.
    remote isolated function restoreCertificate(string apiVersion, CertificateRestoreParameters payload) returns CertificateBundle|error {
        string  path = string `/certificates/restore`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CertificateBundle response = check self.clientEp->post(path, request, targetType=CertificateBundle);
        return response;
    }
    # Deletes a certificate from a specified key vault.
    #
    # + certificateName - The name of the certificate.
    # + apiVersion - Client API version.
    # + return - The deleted certificate.
    remote isolated function deleteCertificate(string certificateName, string apiVersion) returns DeletedCertificateBundle|error {
        string  path = string `/certificates/${certificateName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        DeletedCertificateBundle response = check self.clientEp-> delete(path, request, targetType = DeletedCertificateBundle);
        return response;
    }
    # Backs up the specified certificate.
    #
    # + certificateName - The name of the certificate.
    # + apiVersion - Client API version.
    # + return - The backup blob containing the backed up certificate.
    remote isolated function backupCertificate(string certificateName, string apiVersion) returns BackupCertificateResult|error {
        string  path = string `/certificates/${certificateName}/backup`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        BackupCertificateResult response = check self.clientEp-> post(path, request, targetType = BackupCertificateResult);
        return response;
    }
    # Creates a new certificate.
    #
    # + certificateName - The name of the certificate.
    # + apiVersion - Client API version.
    # + payload - The parameters to create a certificate.
    # + return - Created certificate bundle.
    remote isolated function createCertificate(string certificateName, string apiVersion, CertificateCreateParameters payload) returns CertificateOperation|error {
        string  path = string `/certificates/${certificateName}/create`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CertificateOperation response = check self.clientEp->post(path, request, targetType=CertificateOperation);
        return response;
    }
    # Imports a certificate into a specified key vault.
    #
    # + certificateName - The name of the certificate.
    # + apiVersion - Client API version.
    # + payload - The parameters to import the certificate.
    # + return - Imported certificate bundle to the vault.
    remote isolated function importCertificate(string certificateName, string apiVersion, CertificateImportParameters payload) returns CertificateBundle|error {
        string  path = string `/certificates/${certificateName}/import`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CertificateBundle response = check self.clientEp->post(path, request, targetType=CertificateBundle);
        return response;
    }
    # Gets the creation operation of a certificate.
    #
    # + certificateName - The name of the certificate.
    # + apiVersion - Client API version.
    # + return - The certificate operation response.
    remote isolated function getCertificateOperation(string certificateName, string apiVersion) returns CertificateOperation|error {
        string  path = string `/certificates/${certificateName}/pending`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        CertificateOperation response = check self.clientEp-> get(path, targetType = CertificateOperation);
        return response;
    }
    # Deletes the creation operation for a specific certificate.
    #
    # + certificateName - The name of the certificate.
    # + apiVersion - Client API version.
    # + return - A message containing the certificate operation response.
    remote isolated function deleteCertificateOperation(string certificateName, string apiVersion) returns CertificateOperation|error {
        string  path = string `/certificates/${certificateName}/pending`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        CertificateOperation response = check self.clientEp-> delete(path, request, targetType = CertificateOperation);
        return response;
    }
    # Updates a certificate operation.
    #
    # + certificateName - The name of the certificate.
    # + apiVersion - Client API version.
    # + payload - The certificate operation response.
    # + return - A message containing the certificate operation response.
    remote isolated function updateCertificateOperation(string certificateName, string apiVersion, CertificateOperationUpdateParameter payload) returns CertificateOperation|error {
        string  path = string `/certificates/${certificateName}/pending`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CertificateOperation response = check self.clientEp->patch(path, request, targetType=CertificateOperation);
        return response;
    }
    # Merges a certificate or a certificate chain with a key pair existing on the server.
    #
    # + certificateName - The name of the certificate.
    # + apiVersion - Client API version.
    # + payload - The parameters to merge certificate.
    # + return - Merged certificate bundle to the vault.
    remote isolated function mergeCertificate(string certificateName, string apiVersion, CertificateMergeParameters payload) returns CertificateBundle|error {
        string  path = string `/certificates/${certificateName}/pending/merge`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CertificateBundle response = check self.clientEp->post(path, request, targetType=CertificateBundle);
        return response;
    }
    # Lists the policy for a certificate.
    #
    # + certificateName - The name of the certificate in a given key vault.
    # + apiVersion - Client API version.
    # + return - The certificate policy.
    remote isolated function getCertificatePolicy(string certificateName, string apiVersion) returns CertificatePolicy|error {
        string  path = string `/certificates/${certificateName}/policy`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        CertificatePolicy response = check self.clientEp-> get(path, targetType = CertificatePolicy);
        return response;
    }
    # Updates the policy for a certificate.
    #
    # + certificateName - The name of the certificate in the given vault.
    # + apiVersion - Client API version.
    # + payload - The policy for the certificate.
    # + return - The certificate policy
    remote isolated function updateCertificatePolicy(string certificateName, string apiVersion, CertificatePolicy payload) returns CertificatePolicy|error {
        string  path = string `/certificates/${certificateName}/policy`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CertificatePolicy response = check self.clientEp->patch(path, request, targetType=CertificatePolicy);
        return response;
    }
    # List the versions of a certificate.
    #
    # + certificateName - The name of the certificate.
    # + apiVersion - Client API version.
    # + maxresults - Maximum number of results to return in a page. If not specified the service will return up to 25 results.
    # + return - A response message containing a list of certificates in the key vault along with a link to the next page of keys.
    remote isolated function getCertificateVersions(string certificateName, string apiVersion, int? maxresults = ()) returns CertificateListResult|error {
        string  path = string `/certificates/${certificateName}/versions`;
        map<anydata> queryParam = {"maxresults": maxresults, "api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        CertificateListResult response = check self.clientEp-> get(path, targetType = CertificateListResult);
        return response;
    }
    # Gets information about a certificate.
    #
    # + certificateName - The name of the certificate in the given vault.
    # + certificateVersion - The version of the certificate.
    # + apiVersion - Client API version.
    # + return - The retrieved certificate.
    remote isolated function getCertificate(string certificateName, string certificateVersion, string apiVersion) returns CertificateBundle|error {
        string  path = string `/certificates/${certificateName}/${certificateVersion}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        CertificateBundle response = check self.clientEp-> get(path, targetType = CertificateBundle);
        return response;
    }
    # Updates the specified attributes associated with the given certificate.
    #
    # + certificateName - The name of the certificate in the given key vault.
    # + certificateVersion - The version of the certificate.
    # + apiVersion - Client API version.
    # + payload - The parameters for certificate update.
    # + return - The updated certificate.
    remote isolated function updateCertificate(string certificateName, string certificateVersion, string apiVersion, CertificateUpdateParameters payload) returns CertificateBundle|error {
        string  path = string `/certificates/${certificateName}/${certificateVersion}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CertificateBundle response = check self.clientEp->patch(path, request, targetType=CertificateBundle);
        return response;
    }
    # Lists the deleted certificates in the specified vault currently available for recovery.
    #
    # + apiVersion - Client API version.
    # + maxresults - Maximum number of results to return in a page. If not specified the service will return up to 25 results.
    # + includePending - Specifies whether to include certificates which are not completely provisioned.
    # + return - A response message containing a list of deleted certificates in the vault along with a link to the next page of deleted certificates
    remote isolated function getDeletedCertificates(string apiVersion, int? maxresults = (), boolean? includePending = ()) returns DeletedCertificateListResult|error {
        string  path = string `/deletedcertificates`;
        map<anydata> queryParam = {"maxresults": maxresults, "includePending": includePending, "api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeletedCertificateListResult response = check self.clientEp-> get(path, targetType = DeletedCertificateListResult);
        return response;
    }
    # Retrieves information about the specified deleted certificate.
    #
    # + certificateName - The name of the certificate
    # + apiVersion - Client API version.
    # + return - A Certificate bundle of the certificate and its attributes
    remote isolated function getDeletedCertificate(string certificateName, string apiVersion) returns DeletedCertificateBundle|error {
        string  path = string `/deletedcertificates/${certificateName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeletedCertificateBundle response = check self.clientEp-> get(path, targetType = DeletedCertificateBundle);
        return response;
    }
    # Permanently deletes the specified deleted certificate.
    #
    # + certificateName - The name of the certificate
    # + apiVersion - Client API version.
    # + return - No content signaling that the certificate was purged forever.
    remote isolated function purgeDeletedCertificate(string certificateName, string apiVersion) returns http:Response|error {
        string  path = string `/deletedcertificates/${certificateName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Recovers the deleted certificate back to its current version under /certificates.
    #
    # + certificateName - The name of the deleted certificate
    # + apiVersion - Client API version.
    # + return - A Certificate bundle of the original certificate and its attributes
    remote isolated function recoverDeletedCertificate(string certificateName, string apiVersion) returns CertificateBundle|error {
        string  path = string `/deletedcertificates/${certificateName}/recover`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        CertificateBundle response = check self.clientEp-> post(path, request, targetType = CertificateBundle);
        return response;
    }
    # Lists the deleted keys in the specified vault.
    #
    # + apiVersion - Client API version.
    # + maxresults - Maximum number of results to return in a page. If not specified the service will return up to 25 results.
    # + return - A response message containing a list of deleted keys in the vault along with a link to the next page of deleted keys.
    remote isolated function getDeletedKeys(string apiVersion, int? maxresults = ()) returns DeletedKeyListResult|error {
        string  path = string `/deletedkeys`;
        map<anydata> queryParam = {"maxresults": maxresults, "api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeletedKeyListResult response = check self.clientEp-> get(path, targetType = DeletedKeyListResult);
        return response;
    }
    # Gets the public part of a deleted key.
    #
    # + keyName - The name of the key.
    # + apiVersion - Client API version.
    # + return - A DeletedKeyBundle consisting of a WebKey plus its Attributes and deletion information.
    remote isolated function getDeletedKey(string keyName, string apiVersion) returns DeletedKeyBundle|error {
        string  path = string `/deletedkeys/${keyName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeletedKeyBundle response = check self.clientEp-> get(path, targetType = DeletedKeyBundle);
        return response;
    }
    # Permanently deletes the specified key.
    #
    # + keyName - The name of the key
    # + apiVersion - Client API version.
    # + return - No content, signaling that the key was permanently purged.
    remote isolated function purgeDeletedKey(string keyName, string apiVersion) returns http:Response|error {
        string  path = string `/deletedkeys/${keyName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Recovers the deleted key to its latest version.
    #
    # + keyName - The name of the deleted key.
    # + apiVersion - Client API version.
    # + return - A Key bundle of the original key and its attributes
    remote isolated function recoverDeletedKey(string keyName, string apiVersion) returns KeyBundle|error {
        string  path = string `/deletedkeys/${keyName}/recover`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        KeyBundle response = check self.clientEp-> post(path, request, targetType = KeyBundle);
        return response;
    }
    # Lists deleted secrets for the specified vault.
    #
    # + apiVersion - Client API version.
    # + maxresults - Maximum number of results to return in a page. If not specified the service will return up to 25 results.
    # + return - A response message containing a list of deleted secrets in the vault, along with a link to the next page of deleted secrets.
    remote isolated function getDeletedSecrets(string apiVersion, int? maxresults = ()) returns DeletedSecretListResult|error {
        string  path = string `/deletedsecrets`;
        map<anydata> queryParam = {"maxresults": maxresults, "api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeletedSecretListResult response = check self.clientEp-> get(path, targetType = DeletedSecretListResult);
        return response;
    }
    # Gets the specified deleted secret.
    #
    # + secretName - The name of the secret.
    # + apiVersion - Client API version.
    # + return - A secret bundle of the secret and its attributes.
    remote isolated function getDeletedSecret(string secretName, string apiVersion) returns DeletedSecretBundle|error {
        string  path = string `/deletedsecrets/${secretName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeletedSecretBundle response = check self.clientEp-> get(path, targetType = DeletedSecretBundle);
        return response;
    }
    # Permanently deletes the specified secret.
    #
    # + secretName - The name of the secret.
    # + apiVersion - Client API version.
    # + return - No content signaling that the secret was purged forever.
    remote isolated function purgeDeletedSecret(string secretName, string apiVersion) returns http:Response|error {
        string  path = string `/deletedsecrets/${secretName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Recovers the deleted secret to the latest version.
    #
    # + secretName - The name of the deleted secret.
    # + apiVersion - Client API version.
    # + return - A Secret bundle of the original secret and its attributes.
    remote isolated function recoverDeletedSecret(string secretName, string apiVersion) returns SecretBundle|error {
        string  path = string `/deletedsecrets/${secretName}/recover`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        SecretBundle response = check self.clientEp-> post(path, request, targetType = SecretBundle);
        return response;
    }
    # Lists deleted storage accounts for the specified vault.
    #
    # + apiVersion - Client API version.
    # + maxresults - Maximum number of results to return in a page. If not specified the service will return up to 25 results.
    # + return - A response message containing a list of deleted storage accounts in the vault, along with a link to the next page of deleted storage accounts.
    remote isolated function getDeletedStorageAccounts(string apiVersion, int? maxresults = ()) returns DeletedStorageListResult|error {
        string  path = string `/deletedstorage`;
        map<anydata> queryParam = {"maxresults": maxresults, "api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeletedStorageListResult response = check self.clientEp-> get(path, targetType = DeletedStorageListResult);
        return response;
    }
    # Gets the specified deleted storage account.
    #
    # + storageAccountName - The name of the storage account.
    # + apiVersion - Client API version.
    # + return - The deleted storage account and information on when it will be purged, and how to recover the deleted storage account.
    remote isolated function getDeletedStorageAccount(string storageAccountName, string apiVersion) returns DeletedStorageBundle|error {
        string  path = string `/deletedstorage/${storageAccountName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeletedStorageBundle response = check self.clientEp-> get(path, targetType = DeletedStorageBundle);
        return response;
    }
    # Permanently deletes the specified storage account.
    #
    # + storageAccountName - The name of the storage account.
    # + apiVersion - Client API version.
    # + return - No content signaling that the storage account was purged forever.
    remote isolated function purgeDeletedStorageAccount(string storageAccountName, string apiVersion) returns http:Response|error {
        string  path = string `/deletedstorage/${storageAccountName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Recovers the deleted storage account.
    #
    # + storageAccountName - The name of the storage account.
    # + apiVersion - Client API version.
    # + return - A storage bundle of the original storage account and its attributes.
    remote isolated function recoverDeletedStorageAccount(string storageAccountName, string apiVersion) returns StorageBundle|error {
        string  path = string `/deletedstorage/${storageAccountName}/recover`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        StorageBundle response = check self.clientEp-> post(path, request, targetType = StorageBundle);
        return response;
    }
    # Lists deleted SAS definitions for the specified vault and storage account.
    #
    # + storageAccountName - The name of the storage account.
    # + apiVersion - Client API version.
    # + maxresults - Maximum number of results to return in a page. If not specified the service will return up to 25 results.
    # + return - A response message containing a list of deleted SAS definitions for the storage account, along with a link to the next page of deleted SAS definitions.
    remote isolated function getDeletedSasDefinitions(string storageAccountName, string apiVersion, int? maxresults = ()) returns DeletedSasDefinitionListResult|error {
        string  path = string `/deletedstorage/${storageAccountName}/sas`;
        map<anydata> queryParam = {"maxresults": maxresults, "api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeletedSasDefinitionListResult response = check self.clientEp-> get(path, targetType = DeletedSasDefinitionListResult);
        return response;
    }
    # Gets the specified deleted sas definition.
    #
    # + storageAccountName - The name of the storage account.
    # + sasDefinitionName - The name of the SAS definition.
    # + apiVersion - Client API version.
    # + return - The deleted SAS definition and information on when the it will be purged, and how to recover the deleted SAS definition.
    remote isolated function getDeletedSasDefinition(string storageAccountName, string sasDefinitionName, string apiVersion) returns DeletedSasDefinitionBundle|error {
        string  path = string `/deletedstorage/${storageAccountName}/sas/${sasDefinitionName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeletedSasDefinitionBundle response = check self.clientEp-> get(path, targetType = DeletedSasDefinitionBundle);
        return response;
    }
    # Recovers the deleted SAS definition.
    #
    # + storageAccountName - The name of the storage account.
    # + sasDefinitionName - The name of the SAS definition.
    # + apiVersion - Client API version.
    # + return - A SAS definition bundle of the original SAS definition and its attributes.
    remote isolated function recoverDeletedSasDefinition(string storageAccountName, string sasDefinitionName, string apiVersion) returns SasDefinitionBundle|error {
        string  path = string `/deletedstorage/${storageAccountName}/sas/${sasDefinitionName}/recover`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        SasDefinitionBundle response = check self.clientEp-> post(path, request, targetType = SasDefinitionBundle);
        return response;
    }
    # List keys in the specified vault.
    #
    # + apiVersion - Client API version.
    # + maxresults - Maximum number of results to return in a page. If not specified the service will return up to 25 results.
    # + return - A response message containing a list of keys in the vault along with a link to the next page of keys.
    remote isolated function getKeys(string apiVersion, int? maxresults = ()) returns KeyListResult|error {
        string  path = string `/keys`;
        map<anydata> queryParam = {"maxresults": maxresults, "api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        KeyListResult response = check self.clientEp-> get(path, targetType = KeyListResult);
        return response;
    }
    # Restores a backed up key to a vault.
    #
    # + apiVersion - Client API version.
    # + payload - The parameters to restore the key.
    # + return - Restored key bundle in the vault.
    remote isolated function restoreKey(string apiVersion, KeyRestoreParameters payload) returns KeyBundle|error {
        string  path = string `/keys/restore`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        KeyBundle response = check self.clientEp->post(path, request, targetType=KeyBundle);
        return response;
    }
    # Imports an externally created key, stores it, and returns key parameters and attributes to the client.
    #
    # + keyName - Name for the imported key.
    # + apiVersion - Client API version.
    # + payload - The parameters to import a key.
    # + return - Imported key bundle to the vault.
    remote isolated function importKey(string keyName, string apiVersion, KeyImportParameters payload) returns KeyBundle|error {
        string  path = string `/keys/${keyName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        KeyBundle response = check self.clientEp->put(path, request, targetType=KeyBundle);
        return response;
    }
    # Deletes a key of any type from storage in Azure Key Vault.
    #
    # + keyName - The name of the key to delete.
    # + apiVersion - Client API version.
    # + return - The public part of the deleted key and deletion information on when the key will be purged.
    remote isolated function deleteKey(string keyName, string apiVersion) returns DeletedKeyBundle|error {
        string  path = string `/keys/${keyName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        DeletedKeyBundle response = check self.clientEp-> delete(path, request, targetType = DeletedKeyBundle);
        return response;
    }
    # Requests that a backup of the specified key be downloaded to the client.
    #
    # + keyName - The name of the key.
    # + apiVersion - Client API version.
    # + return - The backup blob containing the backed up key.
    remote isolated function backupKey(string keyName, string apiVersion) returns BackupKeyResult|error {
        string  path = string `/keys/${keyName}/backup`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        BackupKeyResult response = check self.clientEp-> post(path, request, targetType = BackupKeyResult);
        return response;
    }
    # Creates a new key, stores it, then returns key parameters and attributes to the client.
    #
    # + keyName - The name for the new key. The system will generate the version name for the new key.
    # + apiVersion - Client API version.
    # + payload - The parameters to create a key.
    # + return - A key bundle containing the result of the create key request.
    remote isolated function createKey(string keyName, string apiVersion, KeyCreateParameters payload) returns KeyBundle|error {
        string  path = string `/keys/${keyName}/create`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        KeyBundle response = check self.clientEp->post(path, request, targetType=KeyBundle);
        return response;
    }
    # Retrieves a list of individual key versions with the same key name.
    #
    # + keyName - The name of the key.
    # + apiVersion - Client API version.
    # + maxresults - Maximum number of results to return in a page. If not specified the service will return up to 25 results.
    # + return - A response message containing a list of keys along with a link to the next page of keys.
    remote isolated function getKeyVersions(string keyName, string apiVersion, int? maxresults = ()) returns KeyListResult|error {
        string  path = string `/keys/${keyName}/versions`;
        map<anydata> queryParam = {"maxresults": maxresults, "api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        KeyListResult response = check self.clientEp-> get(path, targetType = KeyListResult);
        return response;
    }
    # Gets the public part of a stored key.
    #
    # + keyName - The name of the key to get.
    # + keyVersion - Adding the version parameter retrieves a specific version of a key.
    # + apiVersion - Client API version.
    # + return - A key bundle containing the key and its attributes.
    remote isolated function getKey(string keyName, string keyVersion, string apiVersion) returns KeyBundle|error {
        string  path = string `/keys/${keyName}/${keyVersion}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        KeyBundle response = check self.clientEp-> get(path, targetType = KeyBundle);
        return response;
    }
    # The update key operation changes specified attributes of a stored key and can be applied to any key type and key version stored in Azure Key Vault.
    #
    # + keyName - The name of key to update.
    # + keyVersion - The version of the key to update.
    # + apiVersion - Client API version.
    # + payload - The parameters of the key to update.
    # + return - The updated key.
    remote isolated function updateKey(string keyName, string keyVersion, string apiVersion, KeyUpdateParameters payload) returns KeyBundle|error {
        string  path = string `/keys/${keyName}/${keyVersion}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        KeyBundle response = check self.clientEp->patch(path, request, targetType=KeyBundle);
        return response;
    }
    # Decrypts a single block of encrypted data.
    #
    # + keyName - The name of the key.
    # + keyVersion - The version of the key.
    # + apiVersion - Client API version.
    # + payload - The parameters for the decryption operation.
    # + return - The decryption result.
    remote isolated function decrypt(string keyName, string keyVersion, string apiVersion, KeyOperationsParameters payload) returns KeyOperationResult|error {
        string  path = string `/keys/${keyName}/${keyVersion}/decrypt`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        KeyOperationResult response = check self.clientEp->post(path, request, targetType=KeyOperationResult);
        return response;
    }
    # Encrypts an arbitrary sequence of bytes using an encryption key that is stored in a key vault.
    #
    # + keyName - The name of the key.
    # + keyVersion - The version of the key.
    # + apiVersion - Client API version.
    # + payload - The parameters for the encryption operation.
    # + return - The encryption result.
    remote isolated function encrypt(string keyName, string keyVersion, string apiVersion, KeyOperationsParameters payload) returns KeyOperationResult|error {
        string  path = string `/keys/${keyName}/${keyVersion}/encrypt`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        KeyOperationResult response = check self.clientEp->post(path, request, targetType=KeyOperationResult);
        return response;
    }
    # Creates a signature from a digest using the specified key.
    #
    # + keyName - The name of the key.
    # + keyVersion - The version of the key.
    # + apiVersion - Client API version.
    # + payload - The parameters for the signing operation.
    # + return - The signature value.
    remote isolated function sign(string keyName, string keyVersion, string apiVersion, KeySignParameters payload) returns KeyOperationResult|error {
        string  path = string `/keys/${keyName}/${keyVersion}/sign`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        KeyOperationResult response = check self.clientEp->post(path, request, targetType=KeyOperationResult);
        return response;
    }
    # Unwraps a symmetric key using the specified key that was initially used for wrapping that key.
    #
    # + keyName - The name of the key.
    # + keyVersion - The version of the key.
    # + apiVersion - Client API version.
    # + payload - The parameters for the key operation.
    # + return - The unwrapped symmetric key.
    remote isolated function unwrapKey(string keyName, string keyVersion, string apiVersion, KeyOperationsParameters payload) returns KeyOperationResult|error {
        string  path = string `/keys/${keyName}/${keyVersion}/unwrapkey`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        KeyOperationResult response = check self.clientEp->post(path, request, targetType=KeyOperationResult);
        return response;
    }
    # Verifies a signature using a specified key.
    #
    # + keyName - The name of the key.
    # + keyVersion - The version of the key.
    # + apiVersion - Client API version.
    # + payload - The parameters for verify operations.
    # + return - The verification result.
    remote isolated function verify(string keyName, string keyVersion, string apiVersion, KeyVerifyParameters payload) returns KeyVerifyResult|error {
        string  path = string `/keys/${keyName}/${keyVersion}/verify`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        KeyVerifyResult response = check self.clientEp->post(path, request, targetType=KeyVerifyResult);
        return response;
    }
    # Wraps a symmetric key using a specified key.
    #
    # + keyName - The name of the key.
    # + keyVersion - The version of the key.
    # + apiVersion - Client API version.
    # + payload - The parameters for wrap operation.
    # + return - The wrapped symmetric key.
    remote isolated function wrapKey(string keyName, string keyVersion, string apiVersion, KeyOperationsParameters payload) returns KeyOperationResult|error {
        string  path = string `/keys/${keyName}/${keyVersion}/wrapkey`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        KeyOperationResult response = check self.clientEp->post(path, request, targetType=KeyOperationResult);
        return response;
    }
    # List secrets in a specified key vault.
    #
    # + apiVersion - Client API version.
    # + maxresults - Maximum number of results to return in a page. If not specified, the service will return up to 25 results.
    # + return - A response message containing a list of secrets in the vault along with a link to the next page of secrets.
    remote isolated function getSecrets(string apiVersion, int? maxresults = ()) returns SecretListResult|error {
        string  path = string `/secrets`;
        map<anydata> queryParam = {"maxresults": maxresults, "api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        SecretListResult response = check self.clientEp-> get(path, targetType = SecretListResult);
        return response;
    }
    # Restores a backed up secret to a vault.
    #
    # + apiVersion - Client API version.
    # + payload - The parameters to restore the secret.
    # + return - Restored secret bundle in the vault.
    remote isolated function restoreSecret(string apiVersion, SecretRestoreParameters payload) returns SecretBundle|error {
        string  path = string `/secrets/restore`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SecretBundle response = check self.clientEp->post(path, request, targetType=SecretBundle);
        return response;
    }
    # Sets a secret in a specified key vault.
    #
    # + secretName - The name of the secret.
    # + apiVersion - Client API version.
    # + payload - The parameters for setting the secret.
    # + return - A secret bundle containing the result of the set secret request.
    remote isolated function setSecret(string secretName, string apiVersion, SecretSetParameters payload) returns SecretBundle|error {
        string  path = string `/secrets/${secretName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SecretBundle response = check self.clientEp->put(path, request, targetType=SecretBundle);
        return response;
    }
    # Deletes a secret from a specified key vault.
    #
    # + secretName - The name of the secret.
    # + apiVersion - Client API version.
    # + return - The deleted secret and information on when the secret will be deleted, and how to recover the deleted secret.
    remote isolated function deleteSecret(string secretName, string apiVersion) returns DeletedSecretBundle|error {
        string  path = string `/secrets/${secretName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        DeletedSecretBundle response = check self.clientEp-> delete(path, request, targetType = DeletedSecretBundle);
        return response;
    }
    # Backs up the specified secret.
    #
    # + secretName - The name of the secret.
    # + apiVersion - Client API version.
    # + return - The backup blob containing the backed up secret.
    remote isolated function backupSecret(string secretName, string apiVersion) returns BackupSecretResult|error {
        string  path = string `/secrets/${secretName}/backup`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        BackupSecretResult response = check self.clientEp-> post(path, request, targetType = BackupSecretResult);
        return response;
    }
    # List all versions of the specified secret.
    #
    # + secretName - The name of the secret.
    # + apiVersion - Client API version.
    # + maxresults - Maximum number of results to return in a page. If not specified, the service will return up to 25 results.
    # + return - A response message containing a list of secrets along with a link to the next page of secrets.
    remote isolated function getSecretVersions(string secretName, string apiVersion, int? maxresults = ()) returns SecretListResult|error {
        string  path = string `/secrets/${secretName}/versions`;
        map<anydata> queryParam = {"maxresults": maxresults, "api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        SecretListResult response = check self.clientEp-> get(path, targetType = SecretListResult);
        return response;
    }
    # Get a specified secret from a given key vault.
    #
    # + secretName - The name of the secret.
    # + secretVersion - The version of the secret.
    # + apiVersion - Client API version.
    # + return - The retrieved secret.
    remote isolated function getSecret(string secretName, string secretVersion, string apiVersion) returns SecretBundle|error {
        string  path = string `/secrets/${secretName}/${secretVersion}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        SecretBundle response = check self.clientEp-> get(path, targetType = SecretBundle);
        return response;
    }
    # Updates the attributes associated with a specified secret in a given key vault.
    #
    # + secretName - The name of the secret.
    # + secretVersion - The version of the secret.
    # + apiVersion - Client API version.
    # + payload - The parameters for update secret operation.
    # + return - The updated secret.
    remote isolated function updateSecret(string secretName, string secretVersion, string apiVersion, SecretUpdateParameters payload) returns SecretBundle|error {
        string  path = string `/secrets/${secretName}/${secretVersion}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SecretBundle response = check self.clientEp->patch(path, request, targetType=SecretBundle);
        return response;
    }
    #
    # + apiVersion - Client API version.
    # + maxresults - Maximum number of results to return in a page. If not specified the service will return up to 25 results.
    # + return - A response message containing a list of storage accounts along with a link to the next page of storage accounts.
    remote isolated function getStorageAccounts(string apiVersion, int? maxresults = ()) returns StorageListResult|error {
        string  path = string `/storage`;
        map<anydata> queryParam = {"maxresults": maxresults, "api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        StorageListResult response = check self.clientEp-> get(path, targetType = StorageListResult);
        return response;
    }
    # Restores a backed up storage account to a vault.
    #
    # + apiVersion - Client API version.
    # + payload - The parameters to restore the storage account.
    # + return - Restored storage account bundle in the vault.
    remote isolated function restoreStorageAccount(string apiVersion, StorageRestoreParameters payload) returns StorageBundle|error {
        string  path = string `/storage/restore`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StorageBundle response = check self.clientEp->post(path, request, targetType=StorageBundle);
        return response;
    }
    #
    # + storageAccountName - The name of the storage account.
    # + apiVersion - Client API version.
    # + return - The retrieved storage account.
    remote isolated function getStorageAccount(string storageAccountName, string apiVersion) returns StorageBundle|error {
        string  path = string `/storage/${storageAccountName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        StorageBundle response = check self.clientEp-> get(path, targetType = StorageBundle);
        return response;
    }
    #
    # + storageAccountName - The name of the storage account.
    # + apiVersion - Client API version.
    # + payload - The parameters to create a storage account.
    # + return - The created storage account.
    remote isolated function setStorageAccount(string storageAccountName, string apiVersion, StorageAccountCreateParameters payload) returns StorageBundle|error {
        string  path = string `/storage/${storageAccountName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StorageBundle response = check self.clientEp->put(path, request, targetType=StorageBundle);
        return response;
    }
    #
    # + storageAccountName - The name of the storage account.
    # + apiVersion - Client API version.
    # + return - The deleted storage account and information on when the storage account will be deleted, and how to recover the deleted storage account.
    remote isolated function deleteStorageAccount(string storageAccountName, string apiVersion) returns DeletedStorageBundle|error {
        string  path = string `/storage/${storageAccountName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        DeletedStorageBundle response = check self.clientEp-> delete(path, request, targetType = DeletedStorageBundle);
        return response;
    }
    #
    # + storageAccountName - The name of the storage account.
    # + apiVersion - Client API version.
    # + payload - The parameters to update a storage account.
    # + return - The updated storage account.
    remote isolated function updateStorageAccount(string storageAccountName, string apiVersion, StorageAccountUpdateParameters payload) returns StorageBundle|error {
        string  path = string `/storage/${storageAccountName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StorageBundle response = check self.clientEp->patch(path, request, targetType=StorageBundle);
        return response;
    }
    # Backs up the specified storage account.
    #
    # + storageAccountName - The name of the storage account.
    # + apiVersion - Client API version.
    # + return - The backup blob containing the backed up storage account.
    remote isolated function backupStorageAccount(string storageAccountName, string apiVersion) returns BackupStorageResult|error {
        string  path = string `/storage/${storageAccountName}/backup`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        BackupStorageResult response = check self.clientEp-> post(path, request, targetType = BackupStorageResult);
        return response;
    }
    #
    # + storageAccountName - The name of the storage account.
    # + apiVersion - Client API version.
    # + payload - The parameters to regenerate storage account key.
    # + return - The updated storage account.
    remote isolated function regenerateStorageAccountKey(string storageAccountName, string apiVersion, StorageAccountRegenerteKeyParameters payload) returns StorageBundle|error {
        string  path = string `/storage/${storageAccountName}/regeneratekey`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StorageBundle response = check self.clientEp->post(path, request, targetType=StorageBundle);
        return response;
    }
    #
    # + storageAccountName - The name of the storage account.
    # + apiVersion - Client API version.
    # + maxresults - Maximum number of results to return in a page. If not specified the service will return up to 25 results.
    # + return - A response message containing a list of SAS definitions along with a link to the next page of SAS definitions.
    remote isolated function getSasDefinitions(string storageAccountName, string apiVersion, int? maxresults = ()) returns SasDefinitionListResult|error {
        string  path = string `/storage/${storageAccountName}/sas`;
        map<anydata> queryParam = {"maxresults": maxresults, "api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        SasDefinitionListResult response = check self.clientEp-> get(path, targetType = SasDefinitionListResult);
        return response;
    }
    #
    # + storageAccountName - The name of the storage account.
    # + sasDefinitionName - The name of the SAS definition.
    # + apiVersion - Client API version.
    # + return - The retrieved SAS definition.
    remote isolated function getSasDefinition(string storageAccountName, string sasDefinitionName, string apiVersion) returns SasDefinitionBundle|error {
        string  path = string `/storage/${storageAccountName}/sas/${sasDefinitionName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        SasDefinitionBundle response = check self.clientEp-> get(path, targetType = SasDefinitionBundle);
        return response;
    }
    #
    # + storageAccountName - The name of the storage account.
    # + sasDefinitionName - The name of the SAS definition.
    # + apiVersion - Client API version.
    # + payload - The parameters to create a SAS definition.
    # + return - The created SAS definition.
    remote isolated function setSasDefinition(string storageAccountName, string sasDefinitionName, string apiVersion, SasDefinitionCreateParameters payload) returns SasDefinitionBundle|error {
        string  path = string `/storage/${storageAccountName}/sas/${sasDefinitionName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SasDefinitionBundle response = check self.clientEp->put(path, request, targetType=SasDefinitionBundle);
        return response;
    }
    #
    # + storageAccountName - The name of the storage account.
    # + sasDefinitionName - The name of the SAS definition.
    # + apiVersion - Client API version.
    # + return - The deleted SAS definition and information on when the SAS definition will be deleted, and how to recover the deleted SAS definition.
    remote isolated function deleteSasDefinition(string storageAccountName, string sasDefinitionName, string apiVersion) returns DeletedSasDefinitionBundle|error {
        string  path = string `/storage/${storageAccountName}/sas/${sasDefinitionName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        DeletedSasDefinitionBundle response = check self.clientEp-> delete(path, request, targetType = DeletedSasDefinitionBundle);
        return response;
    }
    #
    # + storageAccountName - The name of the storage account.
    # + sasDefinitionName - The name of the SAS definition.
    # + apiVersion - Client API version.
    # + payload - The parameters to update a SAS definition.
    # + return - The updated SAS definition.
    remote isolated function updateSasDefinition(string storageAccountName, string sasDefinitionName, string apiVersion, SasDefinitionUpdateParameters payload) returns SasDefinitionBundle|error {
        string  path = string `/storage/${storageAccountName}/sas/${sasDefinitionName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SasDefinitionBundle response = check self.clientEp->patch(path, request, targetType=SasDefinitionBundle);
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
