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

public type DomainSummaryArr DomainSummary[];

public type LegalAgreementArr LegalAgreement[];

public type DomainSuggestionArr DomainSuggestion[];

public type TldSummaryArr TldSummary[];

public type DNSRecordArr DNSRecord[];

public type DomainForwardingArr DomainForwarding[];

public type DomainTransferIn record {
    # Authorization code from registrar for transferring a domain
    string authCode;
    Consent consent;
    # Can be more than 1 but no more than 10 years total including current registration length
    int period?;
    # Whether or not privacy has been requested
    boolean privacy?;
    # Whether or not the domain should be configured to automatically renew
    boolean renewAuto?;
    Contact contactAdmin?;
    Contact contactBilling?;
    Contact contactRegistrant?;
    Contact contactTech?;
};

public type ErrorField record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # Human-readable, English description of the problem with the contents of the field
    string message?;
    # <ul>
    # <li style='margin-left: 12px;'>JSONPath referring to a field containing an error</li>
    # <strong style='margin-left: 12px;'>OR</strong>
    # <li style='margin-left: 12px;'>JSONPath referring to a field that refers to an object containing an error, with more detail in `pathRelated`</li>
    # </ul>
    string path;
    # JSONPath referring to a field containing an error, which is referenced by `path`
    string pathRelated?;
};

public type JsonProperty record {
    string defaultValue?;
    string format?;
    record  { }  items?;
    int maxItems?;
    int maximum?;
    int minItems?;
    int minimum?;
    string pattern?;
    boolean required;
    string 'type;
};

public type Address record {
    string address1;
    string address2?;
    string city;
    # Two-letter ISO country code to be used as a hint for target region<br/><br/>
    # NOTE: These are sample values, there are many
    # <a href='http://www.iso.org/iso/country_codes.htm'>more</a>
    string country;
    # Postal or zip code
    string postalCode;
    # State or province or territory
    string state;
};

public type DomainContacts record {
    Contact contactAdmin?;
    Contact contactBilling?;
    Contact contactRegistrant;
    Contact contactTech?;
};

public type DomainForwardingMask record {
    # Displays at the top of the browser window and in search results.
    string title?;
    # A short description of your website to display in search engine results.
    string description?;
    # A list of comma-separated keywords that describes the content and purpose of your website.
    string keywords?;
};

public type ArrayOfDNSRecord DNSRecord[];

public type DomainSuggestion record {
    # Suggested domain name
    string domain;
};

public type JsonSchema record {
    string id;
    record  { }  models;
    record  { }  properties;
    string[] required;
};

public type DomainsContactsBulk record {
    Contact contactAdmin?;
    Contact contactBilling?;
    Contact contactPresence?;
    Contact contactRegistrant?;
    Contact contactTech?;
    # An array of domain names to be validated against. Alternatively, you can specify the extracted tlds. However, full domain names are required if the tld is `uk`
    string[] domains;
    # Canadian Presence Requirement (CA)
    string entityType?;
};

public type DomainPurchase record {
    Consent consent;
    Contact contactAdmin?;
    Contact contactBilling?;
    Contact contactRegistrant?;
    Contact contactTech?;
    # For internationalized domain names with non-ascii characters, the domain name is converted to punycode before format and pattern validation rules are checked
    string domain;
    string[] nameServers?;
    int period?;
    boolean privacy?;
    boolean renewAuto?;
};

public type ErrorFieldDomainContactsValidate record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # An array of domain names the error is for. If tlds are specified in the request, `domains` will contain tlds. For example, if `domains` in request is ["test1.com", "test2.uk", "net"], and the field is invalid for com and net, then one of the `fields` in response will have ["test1.com", "net"] as `domains`
    string[] domains;
    # Human-readable, English description of the problem with the contents of the field
    string message?;
    # 1) JSONPath referring to the field within the data containing an error<br/>or<br/>2) JSONPath referring to an object containing an error
    string path;
    # JSONPath referring to the field on the object referenced by `path` containing an error
    string pathRelated?;
};

public type VerificationDomainName record {
    # Status of the domain name verification
    string status;
};

public type ConsentDomainUpdate record {
    # Timestamp indicating when the end-user consented to these agreements
    string agreedAt;
    # Originating client IP address of the end-user's computer when they consented to the agreements
    string agreedBy;
    # Unique identifiers of the agreements to which the end-user has agreed, as required by the elements being updated<br/><ul><li><strong style='margin-left: 12px;'>EXPOSE_WHOIS</strong> - Required when the exposeWhois field is updated to true</li></ul>
    string[] agreementKeys;
};

public type Consent record {
    # Timestamp indicating when the end-user consented to these legal agreements
    string agreedAt;
    # Originating client IP address of the end-user's computer when they consented to these legal agreements
    string agreedBy;
    # Unique identifiers of the legal agreements to which the end-user has agreed, as returned from the/domains/agreements endpoint
    string[] agreementKeys;
};

public type DomainAvailableBulk record {
    # Domain available response array
    DomainAvailableResponse[] domains;
};

public type PrivacyPurchase record {
    Consent consent;
};

public type TldSummary record {
    # Name of the top-level domain
    string name;
    # Type of the top-level domain
    string 'type;
};

public type ErrorDomainContactsValidate record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # List of the specific fields, and the errors found with their contents
    ErrorFieldDomainContactsValidate[] fields?;
    # Human-readable, English description of the error
    string message?;
    # Stack trace indicating where the error occurred.<br/>NOTE: This attribute <strong>MAY</strong> be included for Development and Test environments. However, it <strong>MUST NOT</strong> be exposed from OTE nor Production systems
    string[] stack?;
};

public type DomainAvailableError record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # Domain name
    string domain;
    # Human-readable, English description of the error
    string message?;
    # <ul>
    # <li style='margin-left: 12px;'>JSONPath referring to a field containing an error</li>
    # <strong style='margin-left: 12px;'>OR</strong>
    # <li style='margin-left: 12px;'>JSONPath referring to a field that refers to an object containing an error, with more detail in `pathRelated`</li>
    # </ul>
    string path;
    # HTTP status code that would return for a single check
    int status;
};

public type DomainForwarding record {
    # The fqdn (domain or sub domain) to forward (ex somedomain.com or sub.somedomain.com)
    string fqdn;
    # The type of fowarding to implement<br/><ul><li><strong style='margin-left: 12px;'>MASKED</strong> - Prevents the forwarded domain or subdomain URL from displaying in the browser's address bar.</li><li><strong style='margin-left: 12px;'>REDIRECT_PERMANENT*</strong> - Redirects to the url you specified in the forwardTo field using a `301 Moved Permanently` HTTP response. The HTTP 301 response code tells user-agents (including search engines) that the location has permanently moved.</li><li><strong style='margin-left: 12px;'>REDIRECT_TEMPORARY</strong> - Redirects to the url you specified in the forwardTo field using a `302 Found` HTTP response. The HTTP 302 response code tells user-agents (including search engines) that the location has temporarily moved.</li></ul>
    string 'type;
    # Forwards http(s) traffic to this destination url (ex. http://www.somedomain.com/)
    string url;
    DomainForwardingMask mask?;
};

public type DNSRecord record {
    string data;
    string name;
    # Service port (SRV only)
    int port?;
    # Record priority (MX and SRV only)
    int priority?;
    # Service protocol (SRV only)
    string protocol?;
    # Service type (SRV only)
    string 'service?;
    int ttl?;
    string 'type;
    # Record weight (SRV only)
    int weight?;
};

public type DNSRecordCreateTypeName record {
    string data;
    # Service port (SRV only)
    int port?;
    # Record priority (MX and SRV only)
    int priority?;
    # Service protocol (SRV only)
    string protocol?;
    # Service type (SRV only)
    string 'service?;
    int ttl?;
    # Record weight (SRV only)
    int weight?;
};

public type RealNameValidation record {
    string status?;
};

public type DomainAvailableBulkMixed record {
    # Domain available response array
    DomainAvailableResponse[] domains;
    # Errors encountered while performing a domain available check
    DomainAvailableError[] errors?;
};

public type Error record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # List of the specific fields, and the errors found with their contents
    ErrorField[] fields?;
    # Human-readable, English description of the error
    string message?;
};

public type DomainRenew record {
    # Number of years to extend the Domain. Must not exceed maximum for TLD. When omitted, defaults to `period` specified during original purchase
    int period?;
};

public type VerificationsDomain record {
    VerificationDomainName domainName?;
    VerificationRealName realName?;
};

public type Contact record {
    Address addressMailing;
    string email;
    string fax?;
    string jobTitle?;
    string nameFirst;
    string nameLast;
    string nameMiddle?;
    string organization?;
    string phone;
};

public type LegalAgreement record {
    # Unique identifier for the legal agreement
    string agreementKey;
    # Contents of the legal agreement, suitable for embedding
    string content;
    # Title of the legal agreement
    string title;
    # URL to a page containing the legal agreement
    string url?;
};

public type DomainDetail record {
    # Authorization code for transferring the Domain
    string authCode;
    Contact contactAdmin;
    Contact contactBilling;
    Contact contactRegistrant;
    Contact contactTech;
    # Date and time when this domain was created
    string createdAt;
    # Date and time when this domain was deleted
    string deletedAt?;
    # Date and time when this domain is eligible to transfer
    string transferAwayEligibleAt?;
    # Name of the domain
    string domain;
    # Unique identifier for this Domain
    float domainId;
    # Whether or not the domain is protected from expiration
    boolean expirationProtected;
    # Date and time when this domain will expire
    string expires?;
    # Whether or not the domain contact details should be shown in the WHOIS
    boolean exposeWhois?;
    # Whether or not the domain is on-hold by the registrar
    boolean holdRegistrar;
    # Whether or not the domain is locked to prevent transfers
    boolean locked;
    # Fully-qualified domain names for DNS servers
    string[] nameServers;
    # Whether or not the domain has privacy protection
    boolean privacy;
    # Whether or not the domain is configured to automatically renew
    boolean renewAuto;
    # Date the domain must renew on
    string renewDeadline;
    # Processing status of the domain<br/><ul>
    # <li><strong style='margin-left: 12px;'>ACTIVE</strong> - All is well</li>
    # <li><strong style='margin-left: 12px;'>AWAITING*</strong> - System is waiting for the end-user to complete an action</li>
    # <li><strong style='margin-left: 12px;'>CANCELLED*</strong> - Domain has been cancelled, and may or may not be reclaimable</li>
    # <li><strong style='margin-left: 12px;'>CONFISCATED</strong> - Domain has been confiscated, usually for abuse, chargeback, or fraud</li>
    # <li><strong style='margin-left: 12px;'>DISABLED*</strong> - Domain has been disabled</li>
    # <li><strong style='margin-left: 12px;'>EXCLUDED*</strong> - Domain has been excluded from Firehose registration</li>
    # <li><strong style='margin-left: 12px;'>EXPIRED*</strong> - Domain has expired</li>
    # <li><strong style='margin-left: 12px;'>FAILED*</strong> - Domain has failed a required action, and the system is no longer retrying</li>
    # <li><strong style='margin-left: 12px;'>HELD*</strong> - Domain has been placed on hold, and likely requires intervention from Support</li>
    # <li><strong style='margin-left: 12px;'>LOCKED*</strong> - Domain has been locked, and likely requires intervention from Support</li>
    # <li><strong style='margin-left: 12px;'>PARKED*</strong> - Domain has been parked, and likely requires intervention from Support</li>
    # <li><strong style='margin-left: 12px;'>PENDING*</strong> - Domain is working its way through an automated workflow</li>
    # <li><strong style='margin-left: 12px;'>RESERVED*</strong> - Domain is reserved, and likely requires intervention from Support</li>
    # <li><strong style='margin-left: 12px;'>REVERTED</strong> - Domain has been reverted, and likely requires intervention from Support</li>
    # <li><strong style='margin-left: 12px;'>SUSPENDED*</strong> - Domain has been suspended, and likely requires intervention from Support</li>
    # <li><strong style='margin-left: 12px;'>TRANSFERRED*</strong> - Domain has been transferred out</li>
    # <li><strong style='margin-left: 12px;'>UNKNOWN</strong> - Domain is in an unknown state</li>
    # <li><strong style='margin-left: 12px;'>UNLOCKED*</strong> - Domain has been unlocked, and likely requires intervention from Support</li>
    # <li><strong style='margin-left: 12px;'>UNPARKED*</strong> - Domain has been unparked, and likely requires intervention from Support</li>
    # <li><strong style='margin-left: 12px;'>UPDATED*</strong> - Domain ownership has been transferred to another account</li>
    # </ul>
    string status;
    # Reseller subaccount shopperid who can manage the domain
    string subaccountId?;
    # Whether or not the domain is protected from transfer
    boolean transferProtected;
    VerificationsDomain verifications?;
};

public type DomainAvailableResponse record {
    # Whether or not the domain name is available
    boolean available;
    # Currency in which the `price` is listed. Only returned if tld is offered
    string currency?;
    # Whether or not the `available` answer has been definitively verified with the registry
    boolean definitive;
    # Domain name
    string domain;
    # Number of years included in the price. Only returned if tld is offered
    int period?;
    # Price of the domain excluding taxes or fees. Only returned if tld is offered
    int price?;
};

public type ErrorLimit record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # List of the specific fields, and the errors found with their contents
    ErrorField[] fields?;
    # Human-readable, English description of the error
    string message?;
    # Number of seconds to wait before attempting a similar request
    int retryAfterSec;
};

public type DNSRecordCreateType record {
    string data;
    string name;
    # Service port (SRV only)
    int port?;
    # Record priority (MX and SRV only)
    int priority?;
    # Service protocol (SRV only)
    string protocol?;
    # Service type (SRV only)
    string 'service?;
    int ttl?;
    # Record weight (SRV only)
    int weight?;
};

public type DomainPurchaseResponse record {
    # Currency in which the `total` is listed
    string currency?;
    # Number items included in the order
    int itemCount;
    # Unique identifier of the order processed to purchase the domain
    int orderId;
    # Total cost of the domain and any selected add-ons
    int total;
};

public type DomainForwardingCreate record {
    # The type of fowarding to implement<br/><ul><li><strong style='margin-left: 12px;'>MASKED</strong> - Prevents the forwarded domain or subdomain URL from displaying in the browser's address bar.</li><li><strong style='margin-left: 12px;'>REDIRECT_PERMANENT*</strong> - Redirects to the url you specified in the forwardTo field using a `301 Moved Permanently` HTTP response. The HTTP 301 response code tells user-agents (including search engines) that the location has permanently moved.</li><li><strong style='margin-left: 12px;'>REDIRECT_TEMPORARY</strong> - Redirects to the url you specified in the forwardTo field using a `302 Found` HTTP response. The HTTP 302 response code tells user-agents (including search engines) that the location has temporarily moved.</li></ul>
    string 'type;
    # Forwards http(s) traffic to this destination url (ex. http://www.somedomain.com/)
    string url;
    DomainForwardingMask mask?;
};

public type DomainUpdate record {
    # Whether or not the domain should be locked to prevent transfers
    boolean locked?;
    # Fully-qualified domain names for Name Servers to associate with the domain
    record {}[] nameServers?;
    # Whether or not the domain should be configured to automatically renew
    boolean renewAuto?;
    # Reseller subaccount shopperid who can manage the domain
    string subaccountId?;
    # Whether or not the domain contact details should be shown in the WHOIS
    boolean exposeWhois?;
    ConsentDomainUpdate consent?;
};

public type DomainSummary record {
    # Authorization code for transferring the Domain
    string authCode?;
    Contact contactAdmin?;
    Contact contactBilling?;
    Contact contactRegistrant;
    Contact contactTech?;
    # Date and time when this domain was created
    string createdAt;
    # Date and time when this domain was deleted
    string deletedAt?;
    # Date and time when this domain is eligible to transfer
    string transferAwayEligibleAt?;
    # Name of the domain
    string domain;
    # Unique identifier for this Domain
    float domainId;
    # Whether or not the domain is protected from expiration
    boolean expirationProtected;
    # Date and time when this domain will expire
    string expires?;
    # Whether or not the domain contact details should be shown in the WHOIS
    boolean exposeWhois?;
    # Whether or not the domain is on-hold by the registrar
    boolean holdRegistrar;
    # Whether or not the domain is locked to prevent transfers
    boolean locked;
    # Fully-qualified domain names for DNS servers
    string[] nameServers?;
    # Whether or not the domain has privacy protection
    boolean privacy;
    # Whether or not the domain is configured to automatically renew
    boolean renewAuto;
    # Date the domain must renew on
    string renewDeadline;
    # Whether or not the domain is eligble for renewal based on status
    boolean renewable?;
    # Processing status of the domain<br/><ul>
    # <li><strong style='margin-left: 12px;'>ACTIVE</strong> - All is well</li>
    # <li><strong style='margin-left: 12px;'>AWAITING*</strong> - System is waiting for the end-user to complete an action</li>
    # <li><strong style='margin-left: 12px;'>CANCELLED*</strong> - Domain has been cancelled, and may or may not be reclaimable</li>
    # <li><strong style='margin-left: 12px;'>CONFISCATED</strong> - Domain has been confiscated, usually for abuse, chargeback, or fraud</li>
    # <li><strong style='margin-left: 12px;'>DISABLED*</strong> - Domain has been disabled</li>
    # <li><strong style='margin-left: 12px;'>EXCLUDED*</strong> - Domain has been excluded from Firehose registration</li>
    # <li><strong style='margin-left: 12px;'>EXPIRED*</strong> - Domain has expired</li>
    # <li><strong style='margin-left: 12px;'>FAILED*</strong> - Domain has failed a required action, and the system is no longer retrying</li>
    # <li><strong style='margin-left: 12px;'>HELD*</strong> - Domain has been placed on hold, and likely requires intervention from Support</li>
    # <li><strong style='margin-left: 12px;'>LOCKED*</strong> - Domain has been locked, and likely requires intervention from Support</li>
    # <li><strong style='margin-left: 12px;'>PARKED*</strong> - Domain has been parked, and likely requires intervention from Support</li>
    # <li><strong style='margin-left: 12px;'>PENDING*</strong> - Domain is working its way through an automated workflow</li>
    # <li><strong style='margin-left: 12px;'>RESERVED*</strong> - Domain is reserved, and likely requires intervention from Support</li>
    # <li><strong style='margin-left: 12px;'>REVERTED</strong> - Domain has been reverted, and likely requires intervention from Support</li>
    # <li><strong style='margin-left: 12px;'>SUSPENDED*</strong> - Domain has been suspended, and likely requires intervention from Support</li>
    # <li><strong style='margin-left: 12px;'>TRANSFERRED*</strong> - Domain has been transferred out</li>
    # <li><strong style='margin-left: 12px;'>UNKNOWN</strong> - Domain is in an unknown state</li>
    # <li><strong style='margin-left: 12px;'>UNLOCKED*</strong> - Domain has been unlocked, and likely requires intervention from Support</li>
    # <li><strong style='margin-left: 12px;'>UNPARKED*</strong> - Domain has been unparked, and likely requires intervention from Support</li>
    # <li><strong style='margin-left: 12px;'>UPDATED*</strong> - Domain ownership has been transferred to another account</li>
    # </ul>
    string status;
    # Whether or not the domain is protected from transfer
    boolean transferProtected;
};

public type VerificationRealName record {
    # Status of the real name verification<br/><ul> <li><strong style='margin-left: 12px;'>APPROVED</strong> - All is well</li> <li><strong style='margin-left: 12px;'>PENDING</strong> - Real name verification is working its way through the workflow</li> <li><strong style='margin-left: 12px;'>REJECTED_DOCUMENT_OUTDATED</strong> - Local government verification shows there is a newer version of your document.  Upload the latest version of the document and retry real name verification</li> <li><strong style='margin-left: 12px;'>REJECTED_EXPIRED_BUSINESS_LICENSE</strong> - Business license is expired</li> <li><strong style='margin-left: 12px;'>REJECTED_EXPIRED_ORGANIZATION_CODE</strong> - Organization code certificate number has expired</li> <li><strong style='margin-left: 12px;'>REJECTED_ILLEGIBLE_DOCUMENT_NAME</strong> - There isn’t a clear name on your uploaded document, please upload a different document to retry real name verification</li> <li><strong style='margin-left: 12px;'>REJECTED_ILLEGIBLE_IDENTIFICATION</strong> - Registrant identification is not clear.  Upload a better image to retry</li> <li><strong style='margin-left: 12px;'>REJECTED_INCOMPLETE_IDENTIFICATION</strong> - Registrant identification is incomplete</li> <li><strong style='margin-left: 12px;'>REJECTED_INCOMPLETE_REGISTRATION_LETTER</strong> - Registration letter is incomplete</li> <li><strong style='margin-left: 12px;'>REJECTED_INCONSISTENT_IDENTITY_CARD</strong> - Provided identity card is inconsistent with the identity card on record</li> <li><strong style='margin-left: 12px;'>REJECTED_INCONSISTENT_ORGANIZATION_CODE</strong> - Provided organization information is inconsistent with the results obtained using the submitted organization code</li> <li><strong style='margin-left: 12px;'>REJECTED_INCONSISTENT_REGISTRANT_NAME</strong> - Name on the registrant identification does not match the name in the system</li> <li><strong style='margin-left: 12px;'>REJECTED_INVALID_BUSINESS_LICENSE_OR_ORGANIZATION_CODE</strong> - Your document contains an invalid business license or organization code certificate number</li> <li><strong style='margin-left: 12px;'>REJECTED_INVALID_DOCUMENT</strong> - Document is invalid.  Please upload another document to retry real name verification</li> <li><strong style='margin-left: 12px;'>REJECTED_MISMATCH_BUSINESS_ID</strong> - Business id does not match the business id in the document</li> <li><strong style='margin-left: 12px;'>REJECTED_MISMATCH_BUSINESS_NAME</strong> - Business name does not match the business name in the document</li> <li><strong style='margin-left: 12px;'>REJECTED_MISMATCH_DOCUMENT_ID</strong> - Document id does not match the id in the document</li> <li><strong style='margin-left: 12px;'>REJECTED_MISMATCH_DOCUMENT_NAME</strong> - Document name does not match the name in the document</li> <li><strong style='margin-left: 12px;'>REJECTED_MISMATCH_DOCUMENT_TYPE</strong> - Document type does not match the document</li> <li><strong style='margin-left: 12px;'>REJECTED_MISMATCH_REGISTRANT_INFO</strong> - The information provided for the registrant does not match the document</li> <li><strong style='margin-left: 12px;'>REJECTED_MISMATCH_REGISTRANT_LOCALITY</strong> - Registrant region is overseas, but a local identity document was provided</li> <li><strong style='margin-left: 12px;'>REJECTED_MISMATCH_REGISTRANT_NAME</strong> - Registrant name has been changed, so the request must be resubmitted</li> <li><strong style='margin-left: 12px;'>REJECTED_UNABLE_TO_OPEN</strong> - Registrant identification could not be opened.  Please upload the document again to retry real name verification</li> <li><strong style='margin-left: 12px;'>REJECTED_UNABLE_TO_VERIFY</strong> - Unable to initiate verification.  Please upload the document again to retry real name verification</li> <li><strong style='margin-left: 12px;'>REJECTED_UNKNOWN_ERROR</strong> - Document was rejected due to an unknown error. For more information, contact customer support</li> <li><strong style='margin-left: 12px;'>UNABLE_TO_RETRIEVE_STATUS</strong> - Unable to retrieve status for the real name verification process.  Retry, if this status persists, contact customer support</li> </ul>
    string status;
};

public type Domain record {
    float id?;
};

public type JsonDataType record {
    string format?;
    string pattern?;
    string 'type;
};
