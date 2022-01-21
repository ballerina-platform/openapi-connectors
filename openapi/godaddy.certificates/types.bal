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
    # 
    # In order for a domain to be eligible to be included in the certificate, the entire domain hierarchy must be scanned for DNS CAA records, as outlined by RFC 6844.
    # 
    # The absence of any CAA records found in the domain hierarchy indicates that the domain may be included in the certificate. Alternatively, if CAA records are found when scanning the domain hierarchy, the domain may be included in the certificate as long as `godaddy.com` or `starfieldtech.com` is found in the DNS record value. However, if CAA records are found, yet `godaddy.com` or `starfieldtech.com` is not found in any CAA record's value, then we must drop the domain from the certificate request.
    # 
    # In the case where there are repeated DNS errors when scanning the domain hierarchy for CAA records, thus ending in an unsuccessful scan, then the domain can still be included in the certificate provided the primary domain is not setup with DNSSEC. Conversely, if DNSSEC is found to be setup on the primary domain when scanning following repeated CAA failures, the domain must be dropped from the certificate request. Finally, if DNS errors persist to the point where a successful DNSSEC query could not be obtained, then the domain must be dropped from the certificate request.
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
    #   * `AWAITING` - Verification pending customer input
    #   * `INVALID` - SAN connected to a cancelled request
    #   * `COMPLETED` - Verification completed
    #   * `FAILED_VERIFICATION` - Verification failed
    #   * `PENDING_POSSIBLE_FRAUD` - Flagged for a system level fraud review
    #   * `VERIFIED_POSSIBLE_FRAUD` - Fraud detection reviewed but verified
    #   * `DROPPED` - SAN dropped from request
    #   * `REVOKED_CERT` - Certificate revoked
    #   * `DROPPED_GOOGLE_SAFE_BROWSING` - SAN dropped from request due to Google Safe Browsing check
    #   * `DROPPED_CERTIFICATE_AUTHORITY_AUTHORIZATION` - SAN dropped from request due to Certificate Authorization Authority DNS record check
    string status;
    # Timestamp indicating when the domain verification process was started
    string createdAt;
    # Timestamp indicating when the domain verification process was last updated
    string modifiedAt;
    # Domain verification type: 
    #   * `AUTO_GENERATED_DOMAIN_ACCESS_EMAIL_ADMIN` - Domain verified using domain control verification email sent to admin@<your.domain.com>
    #   * `AUTO_GENERATED_DOMAIN_ACCESS_EMAIL_ADMINSTRATOR` - Domain verified using domain control verification email sent to administrator@<your.domain.com>
    #   * `AUTO_GENERATED_DOMAIN_ACCESS_EMAIL_HOST_MASTER` - Domain verified using domain control verification email sent to hostmaster@<your.domain.com>
    #   * `AUTO_GENERATED_DOMAIN_ACCESS_EMAIL_POST_MASTER` - Domain verified using domain control verification email sent to postmaster@<your.domain.com>
    #   * `AUTO_GENERATED_DOMAIN_ACCESS_EMAIL_WEB_MASTER` - Domain verified using domain control verification email sent to webmaster@<your.domain.com>
    #   * `DOMAIN_ACCESS_EMAIL` - Domain verified using a domain access email
    #   * `DOMAIN_ACCESS_LETTER` - Customer completed a domain access letter which was used for domain verification
    #   * `DOMAIN_CONTROL_EMAIL` - Domain verified using HTML file or DNS zone file text value
    #   * `DOMAIN_ZONE_CONTROL` - DNS zone file containing a pre-generated text value used for domain verification
    #   * `MANUAL_DOMAIN_ACCESS_EMAIL` - DAE sent to an email address manually entered by a rep
    #   * `PREVIOUS_DOMAIN_ACCESS_EMAIL` - Customers domain access email for a prior certificate request was used for domain verification
    #   * `REGISTRATION_AUTHORITY_DOMAIN_ACCESS_LETTER` - Representative reviewed a customer provided domain access letter and verified domain
    #   * `REGISTRATION_AUTHORITY_DOMAIN_ZONE_CONTROL` - Representative verified domain using a manual domain zone control check
    #   * `REGISTRATION_AUTHORITY_OVERRIDE` - Representative verified domain using alternative methods
    #   * `REGISTRATION_AUTHORITY_WEBSITE_CONTROL` - Representative verified domain using a manual website control check
    #   * `CUSTOMER_OWNED` - Validated customer account information used for domain control verification
    #   * `WEBSITE_CONTROL` - HTML file in root website directory containing pre-generated value used for domain control verification
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
# 
# In order for a domain to be eligible to be included in the certificate, the entire domain hierarchy must be scanned for DNS CAA records, as outlined by RFC 6844.
# 
# The absence of any CAA records found in the domain hierarchy indicates that the domain may be included in the certificate. Alternatively, if CAA records are found when scanning the domain hierarchy, the domain may be included in the certificate as long as `godaddy.com` or `starfieldtech.com` is found in the DNS record value. However, if CAA records are found, yet `godaddy.com` or `starfieldtech.com` is not found in any CAA record's value, then we must drop the domain from the certificate request.
# 
# In the case where there are repeated DNS errors when scanning the domain hierarchy for CAA records, thus ending in an unsuccessful scan, then the domain can still be included in the certificate provided the primary domain is not setup with DNSSEC. Conversely, if DNSSEC is found to be setup on the primary domain when scanning following repeated CAA failures, the domain must be dropped from the certificate request. Finally, if DNS errors persist to the point where a successful DNSSEC query could not be obtained, then the domain must be dropped from the certificate request.
public type DomainverificationdetailCertificateauthorityauthorization record {
    # Returns the status of the CAA Lookup for the specified domain:
    # * `PENDING` - The CAA lookup has not yet been attempted for the specified domain.
    # * `REMOVED_DNS_ERROR` - Repeated errors occurred while scanning for CAA records, thereby resulting in a DNSSEC scan. DNS errors then prevented the system from determining if DNSSEC was enabled for the specified domain, and it had to be removed from the certificate request.
    # * `REMOVED_DNSSEC_ENABLED` - Repeated errors occurred while scanning for CAA records, thereby resulting in a DNSSEC scan. DNSSEC was determined to be enabled for the specified domain, and it had to be removed from the certificate request.
    # * `REMOVED_NOT_FOUND_CA` - CAA records were found during the CAA lookup for the speicified domain, but `godaddy.com` or `starfieldtech.com` was not listed as a value, thereby not allowing us to issue a certificate with this domain. The specified domain was removed from the certificate request.
    # * `REMOVED_UNKNOWN_CRITICAL_TAG` - A CAA record was found during the CAA lookup with its Critical bit set, as outlined by RFC 6844, yet the Tag of the CAA record was not understood (as outlined by RFC 6844). The specified domain was removed from the certificate request.
    # * `SUCCESS_CAA` - The CAA lookup was successful for the specified domain, and the domain can remain in the certificate request.
    # * `SUCCESS_DNSSEC` - Repeated errors occurred while scanning for CAA records, thereby resulting in a DNSSEC scan. The system detemined that DNSSEC was not enabled for the specified domain, so the domain is allowed to remain in the certificate request.
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
    int retryAfterSec;
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
    #   * `DV_SSL` - (Domain Validated Secure Sockets Layer) SSL certificate validated using domain name only
    #   * `DV_WILDCARD_SSL` - SSL certificate containing subdomains which is validated using domain name only
    #   * `EV_SSL` - (Extended Validation) SSL certificate validated using organization information, domain name, business legal status, and other factors
    #   * `OV_CODE_SIGNING` - Code signing SSL certificate used by software developers to digitally sign apps. Validated using organization information
    #   * `OV_DRIVER_SIGNING` - Driver signing SSL certificate request used by software developers to digitally sign secure code for Windows hardware drivers. Validated using organization information
    #   * `OV_SSL` - SSL certificate validated using organization information and domain name
    #   * `OV_WILDCARD_SSL` - SSL certificate containing subdomains which is validated using organization information and domain name
    #   * `UCC_DV_SSL` - (Unified Communication Certificate) Multi domain SSL certificate validated using domain name only
    #   * `UCC_EV_SSL` - Multi domain SSL certificate validated using organization information, domain name, business legal status, and other factors
    #   * `UCC_OV_SSL` - Multi domain SSL certificate validated using organization information and domain name
    string 'type;
    # Certificate status (if issued or revoked): 
    #   * `CANCELED` - Certificate request was canceled by customer
    #   * `DENIED` - Certificate request was denied by customer
    #   * `EXPIRED` - Issued certificate has exceeded the valid end date
    #   * `ISSUED` - Certificate has been issued and is within validity period
    #   * `PENDING_ISSUANCE` - Certificate request has completed domain verification and is in the process of being issued
    #   * `PENDING_REKEY` - Previously issued certificate was rekeyed by customer and is in the process of being reissued
    #   * `PENDING_REVOCATION` - Previously issued certificate is in the process of being revoked
    #   * `REVOKED` - Issued certificate has been revoked
    #   * `UNUSED` - Certificate in an error state
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
    #   * `FIVE` - Five slot UCC request
    #   * `TEN` - Ten slot UCC request
    #   * `FIFTEEN` - Fifteen slot UCC request
    #   * `TWENTY` - Twenty slot UCC request
    #   * `THIRTY` - Thirty slot UCC request
    #   * `FOURTY` - Fourty slot UCC request
    #   * `FIFTY` - Fifty slot UCC request
    #   * `ONE_HUNDRED` - One hundred slot UCC request
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
    #   * `DV_SSL` - (Domain Validated Secure Sockets Layer) SSL certificate validated using domain name only
    #   * `DV_WILDCARD_SSL` - SSL certificate containing subdomains which is validated using domain name only
    #   * `EV_SSL` - (Extended Validation) SSL certificate validated using organization information, domain name, business legal status, and other factors
    #   * `OV_CODE_SIGNING` - Code signing SSL certificate used by software developers to digitally sign apps. Validated using organization information
    #   * `OV_DRIVER_SIGNING` - Driver signing SSL certificate request used by software developers to digitally sign secure code for Windows hardware drivers. Validated using organization information
    #   * `OV_SSL` - SSL certificate validated using organization information and domain name
    #   * `OV_WILDCARD_SSL` - SSL certificate containing subdomains which is validated using organization information and domain name
    #   * `UCC_DV_SSL` - (Unified Communication Certificate) Multi domain SSL certificate validated using domain name only
    #   * `UCC_EV_SSL` - Multi domain SSL certificate validated using organization information, domain name, business legal status, and other factors
    #   * `UCC_OV_SSL` - Multi domain SSL certificate validated using organization information and domain name
    string 'type;
    # Certificate status (if issued or revoked): 
    #   * `CANCELED` - Certificate request was canceled by customer
    #   * `DENIED` - Certificate request was denied by customer\n  * `EXPIRED` - Issued certificate has exceeded the valid end date
    #   * `ISSUED` - Certificate has been issued and is within validity period
    #   * `PENDING_ISSUANCE` - Certificate request has completed domain verification and is in the process of being issued
    #   * `PENDING_REKEY` - Previously issued certificate was rekeyed by customer and is in the process of being reissued
    #   * `PENDING_REVOCATION` - Previously issued certificate is in the process of being revoked
    #   * `REVOKED` - Issued certificate has been revoked\n  * `UNUSED` - Certificate in an error state
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
    #   * `FIVE` - Five slot UCC request
    #   * `TEN` - Ten slot UCC request
    #   * `FIFTEEN` - Fifteen slot UCC request
    #   * `TWENTY` - Twenty slot UCC request
    #   * `THIRTY` - Thirty slot UCC request
    #   * `FOURTY` - Fourty slot UCC request
    #   * `FIFTY` - Fifty slot UCC request
    #   * `ONE_HUNDRED` - One hundred slot UCC request
    string slotSize?;
    # Subject Alternative names. Collection of subjectAlternativeNames to be included in certificate.
    string[] subjectAlternativeNames?;
    CertificateContact contact;
    CertificateOrganization organization?;
    # Certificate signing request (if present) in PEM format
    string csr?;
    # Root type: 
    #   * `GODADDY_SHA_1` - GoDaddy (Secure Hash Algorithm 1) SHA-1 root type
    #   * `GODADDY_SHA_2` - GoDaddy (Secure Hash Algorithm 2) SHA-2 root type
    #   * `STARFIELD_SHA_1` - Starfield SHA-1 root type
    #   * `STARFIELD_SHA_2` - Starfield SHA-2 root type
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
