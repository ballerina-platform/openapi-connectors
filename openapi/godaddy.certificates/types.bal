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

public type CertificateArr Certificate[];

public type DomainVerificationSummaryArr DomainVerificationSummary[];

public type ErrorField record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # Description of the problem with the contents of the field
    string message?;
    # JSONPath referring to the field within the submitted data containing an error
    string path;
};

public type DomainVerificationDetail record {
    *DomainVerificationSummary;
    # Contains information about the last Certificate Authority Authorization (CAA) Lookup details for the specified domain.
    DomainverificationdetailCertificateauthorityauthorization certificateAuthorityAuthorization?;
};

public type PEMCertificates record {
    # End entity certificate in PEM format
    string certificate;
    # CA Cross Intermediate certificate in PEM format
    string cross?;
    # CA Signing Intermediate certificate in PEM format
    string intermediate?;
    # CA Root certificate in PEM format
    string root?;
};

public type CertificateContact record {
    # Email address of requestor contact
    string email;
    # Only used for EVSSL. Job title of requestor contact
    string jobTitle?;
    # First name of requestor contact
    string nameFirst;
    # Last name of requestor contact
    string nameLast;
    # Middle initial of requestor contact
    string nameMiddle?;
    # Phone number for requestor contact
    string phone;
    # Suffix of requestor contact
    string suffix?;
};

public type CertificateSiteSeal record {
    # Certificate Seal HTML
    string html;
};

public type Pagination record {
    # URI to access the first page
    string first?;
    # URI to access the previous page
    string previous?;
    # URI to access the next page
    string next?;
    # URI to access the last page
    string last?;
    # Number of records available
    int total?;
};

public type CertificateCreate record {
    # Required if client would like to receive stateful actions via callback during certificate lifecyle
    string callbackUrl?;
    # Name to be secured in certificate. If provided, CN field in CSR will be ignored.
    string commonName?;
    CertificateContact contact;
    # Certificate Signing Request
    string csr;
    # Only used for OV
    boolean intelVPro?;
    CertificateOrganizationCreate organization?;
    # Number of years for certificate validity period
    int period;
    # Type of product requesting a certificate. Only required non-renewal
    string productType;
    # Root Type. Depending on certificate expiration date, SHA_1 not be allowed. Will default to SHA_2 if expiration date exceeds sha1 allowed date
    string rootType?;
    # Number of subject alternative names(SAN) to be included in certificate 
    string slotSize?;
    # Subject Alternative names. Collection of subjectAlternativeNames to be included in certificate.
    string[] subjectAlternativeNames?;
};

public type CertificateEmailHistory record {
    # Email Id
    int id;
    # Shopper Id requested certificate
    int accountId;
    # Email template type name
    string templateType;
    # Email from address
    string fromType;
    # Email address email was sent
    string recipients;
    # Email message
    string body;
    # Date email sent
    string dateEntered;
    # Email subject
    string subject;
};

public type ExternalAccountBinding record {
    # ACME directory resource URL.
    string directoryUrl;
    # EAB key identifier for the ACME account.
    string keyId;
    # EAB HMAC key for the ACME account
    string hmacKey;
};

public type JurisdictionOfIncorporation record {
    string city?;
    string country;
    string county?;
    string state?;
};

public type CertificateOrganizationCreate record {
    CertificateAddress address?;
    # Only for EVSSL. The DBA(does business as) name for the organization.
    string assumedName?;
    # Name of organization that owns common name
    string name;
    # Phone number for organization
    string phone;
    # Only for EVSSL.
    string registrationAgent?;
    # Only for EVSSL.
    string registrationNumber?;
};

public type ArrayOfCertificateAction CertificateAction[];

public type CertificateAction record {
    # Date action created
    string createdAt;
    string 'type;
};

public type CertificateReissue record {
    # Required if client would like to receive stateful action via callback during certificate lifecyle
    string callbackUrl?;
    # The common name of certificate to be secured
    string commonName?;
    # Certificate Signing Request.
    string csr?;
    # In hours, time to delay revoking existing certificate after issuance of new certificate. If revokeExistingCertOnIssuance is enabled, this value will be ignored
    int delayExistingRevoke?;
    # Root Type. Depending on certificate expiration date, SHA_1 not be allowed. Will default to SHA_2 if expiration date exceeds sha1 allowed date
    string rootType?;
    # Only used for UCC products. An array of subject alternative names to include in certificate.
    string[] subjectAlternativeNames?;
};

public type CertificateOrganization record {
    CertificateAddress address;
    # Only for EVSSL. The DBA(does business as) name for the organization.
    string assumedName?;
    JurisdictionOfIncorporation jurisdictionOfIncorporation?;
    # Name of organization that owns common name
    string name;
    # Phone number for organization
    string phone;
    # Only for EVSSL.
    string registrationAgent?;
    # Only for EVSSL.
    string registrationNumber?;
};

public type CertificateIdentifier record {
    # The unique identifier of the certificate request. Only present if verified.
    string certificateId;
};

public type DomainVerificationSummary record {
    # Domain name
    string domain;
    # A unique identifier that can be leveraged for retrieving domain verification related information. Primarily used when troubleshooting a request
    int domainEntityId;
    # DCE verification type token (if DCE verification type).
    string dceToken?;
    # Domain verification status: 
    string status;
    # Timestamp indicating when the domain verification process was started
    string createdAt;
    # Timestamp indicating when the domain verification process was last updated
    string modifiedAt;
    # Domain verification type: 
    string 'type;
    # Type of domain name used for domain verification
    string usage;
};

public type CertificateBundle record {
    PEMCertificates pems;
    # Serial number of certificate requested
    string serialNumber;
};

public type Error record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # List of the specific fields, and the errors found with their contents
    ErrorField[] fields?;
    # Description of the error
    string message?;
};

public type CertificateCallback record {
    # Callback url registered to receive stateful actions
    string callbackUrl;
};

public type CertificateSummariesV2 record {
    # List of certificates for a specified customer.
    CertificateSummaryV2[] certificates;
    Pagination pagination;
};

# Contains information about the last Certificate Authority Authorization (CAA) Lookup details for the specified domain.
public type DomainverificationdetailCertificateauthorityauthorization record {
    # Returns the status of the CAA Lookup for the specified domain:
    string status?;
    # Details all the individual DNS paths that were scanned for CAA records for this domain, as detailed by RFC 6844. This element not only contains the parts determined from parsing the domain, but also any CNAME or DNAME targets specified by any of those individual parts.
    string[] queryPaths?;
    # Returns a list of fix recommendations if the query was unsuccessful, or if the domain was dropped from the certificate request, so that a subsequent certificate request with the specified domain will successfully pass its CAA scan.
    string[] recommendations?;
    # The date the certificate request completed processing.
    string completedAt?;
};

public type SubjectAlternativeNameDetails record {
    # Total number of page results
    string status;
    # Subject alternative name to be included in certificate
    string subjectAlternativeName;
};

public type CertificateRenew record {
    # Required if client would like to receive stateful actions via callback during certificate lifecyle
    string callbackUrl?;
    # The common name of certificate to be secured
    string commonName?;
    # Certificate Signing Request.
    string csr?;
    # Number of years for certificate validity period, if different from previous certificate
    int period?;
    # Root Type. Depending on certificate expiration date, SHA_1 not be allowed. Will default to SHA_2 if expiration date exceeds sha1 allowed date
    string rootType?;
    # Only used for UCC products. An array of subject alternative names to include in certificate. Not including a subject alternative name that was in the previous certificate will remove it from the renewed certificate.
    string[] subjectAlternativeNames?;
};

public type CertificateRevoke record {
    # Reason for revocation
    string reason;
};

public type ErrorLimit record {
    # Number of seconds to wait before attempting a similar request
    int retryAfterSec?;
    *Error;
};

public type CertificateSummaryV2 record {
    # The unique identifier of the certificate request.
    string certificateId;
    # Common name for the certificate request.
    string commonName;
    # Validity period of order. Specified in years.
    int period;
    # Certificate type: 
    string 'type;
    # Certificate status (if issued or revoked): 
    string status;
    # Date that the certificate request was received.
    string createdAt;
    # The date the certificate request completed processing (if issued or revoked).
    string completedAt?;
    # The end date of the certificate's validity (if issued or revoked).
    string validEndAt?;
    # The start date of the certificate's validity (if issued or revoked).
    string validStartAt?;
    # The revocation date of certificate (if revoked).
    string revokedAt?;
    # Only returned when a renewal is available.
    boolean renewalAvailable?;
    # Serial number of certificate (if issued or revoked).
    string serialNumber?;
    # Number of subject alternative names (SAN) to be included in certificate (if UCC): 
    string slotSize?;
    # Subject Alternative names (if UCC). Collection of subjectAlternativeNames to be included in certificate.
    string[] subjectAlternativeNames?;
};

public type CertificateAddress record {
    # Address line 1 of organization address
    string address1;
    # Address line 2 of organization address
    string address2?;
    # City/Locality of organization address
    string city?;
    # Two character country code of organization
    string country;
    # Postal code of organization address
    string postalCode?;
    # Full name of State/Province/Territory of organization address
    string state?;
};

public type CertificateDetailV2 record {
    # The unique identifier of the certificate request. Only present if no errors returned
    string certificateId;
    # Common name of certificate
    string commonName;
    # Validity period of order. Specified in years
    int period;
    # Certificate type: 
    string 'type;
    # Certificate status (if issued or revoked): 
    string status;
    # The date the certificate was ordered.
    string createdAt;
    # The date the certificate request completed processing.
    string completedAt?;
    # The end date of the certificate's validity (if issued or revoked).
    string validEndAt?;
    # The start date of the certificate's validity (if issued or revoked).
    string validStartAt?;
    # The revocation date of certificate (if revoked).
    string revokedAt?;
    # Only returned when a renewal is available.
    boolean renewalAvailable?;
    # Serial number of certificate (if issued or revoked)
    string serialNumber?;
    # Hexadecmial format for Serial number of certificate(if issued or revoked)
    string serialNumberHex?;
    # Number of subject alternative names (SAN) to be included in certificate (if UCC): 
    string slotSize?;
    # Subject Alternative names. Collection of subjectAlternativeNames to be included in certificate.
    string[] subjectAlternativeNames?;
    CertificateContact contact;
    CertificateOrganization organization?;
    # Certificate signing request (if present) in PEM format
    string csr?;
    # Root type: 
    string rootType?;
    # Only present if certificate order has been denied
    string deniedReason?;
    # Percentage of completion for certificate vetting
    int progress?;
};

public type Certificate record {
    # The unique identifier of the certificate request. Only present if no errors returned
    string certificateId;
    # Common name of certificate
    string commonName?;
    CertificateContact contact;
    # The date the certificate was ordered.
    string createdAt;
    # Only present if certificate order has been denied
    string deniedReason?;
    CertificateOrganization organization?;
    # Validity period of order. Specified in years
    int period;
    # Certificate product type
    string productType;
    # Percentage of completion for certificate vetting
    int progress?;
    # The revocation date of certificate (if revoked).
    string revokedAt?;
    # Root Type
    string rootType?;
    # Serial number of certificate (if issued or revoked)
    string serialNumber?;
    # Hexadecmial format for Serial number of certificate(if issued or revoked)
    string serialNumberHex?;
    # Number of subject alternative names(SAN) to be included in certificate 
    string slotSize?;
    # Status of certificate
    string status;
    # Contains subject alternative names set
    SubjectAlternativeNameDetails[] subjectAlternativeNames?;
    # The end date of the certificate's validity (if issued or revoked).
    string validEnd?;
    # The start date of the certificate's validity (if issued or revoked).
    string validStart?;
};
