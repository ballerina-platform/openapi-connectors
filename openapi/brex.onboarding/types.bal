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

# If the application status is APPROVED, array of bank cash management accounts (note there is currently only one account per customer).
public type Account record {
    # Brex cash management account Id.
    string id;
    # Domestic and international ACH/Wire instructions.
    Instruction instructions?;
    # Created date and time.
    string created_at;
};

# Company business address (must be in the US; no PO box or virtual/forwarding addresses allowed).
public type Address record {
    # Address line 1, no PO Box.
    string? line1?;
    # Address line 2 (e.g., apartment, suite, unit, or building).
    string? line2?;
    # City, district, suburb, town, or village.
    string? city?;
    # For US-addressed the 2-letter State abbreviation. For international-addresses the County, Providence, or Region.
    string? state?;
    # Two-letter country code (ISO 3166-1 alpha-2).
    string? country?;
    # ZIP or postal code.
    string? postal_code?;
    # Phone number.
    string? phone_number?;
};

# Submit a new referral to Brex for onboarding.
public type CreateReferralRequest record {
    # Partner referral code to attribute this prospect to if they sign up.
    string referral_code;
    # Required information about the referred prospect.
    Applicant applicant;
    # Information about the business the application is for.
    Business business?;
    # When set to `EMAIL_OUTBOUND`, Brex will email the referred customer directly to prompt them to create their account rather than rely on the partner to direct the customer to claim the account. If not provided, the partner is responsible to contact the customer and the value defaults to `NO_OUTBOUND`.
    ContactPreference contact_preference?;
};

# Request for creating new document upload url.
public type CreateDocumentRequest record {
    # Type of document being submitted. Allowable types:
    # - ARTICLES_OF_INCORPORATION
    # - IRS_EIN_CONFIRMATION (IRS CP 575 or 147C form)
    # - IRS_EIN_APPLICATION (IRS SS4 form)
    # - CERTIFICATE_GOOD_STANDING
    DocumentType 'type;
};

# Array of Brex products that the customer has applied for. This is a gated feature available to select clients only.
public type Product record {
    # Available if customer applied for Brex Cash.
    Cash cash;
};

# Available if customer applied for Brex Cash.
public type Cash record {
    # An array of bank cash management accounts
    Account[]? accounts?;
    # Application information.
    Application application;
};

public type Document record {
    # This is a presigned S3 link that should be used to attach the document.
    # The maximum size accepted for this document is 50 MB
    string uri;
    # Unique identifier for the document.
    string id;
};

# Domestic and international ACH/Wire instructions.
public type Instruction record {
    # Domestic ACH/Wire instructions.
    DomesticInstruction domestic;
    # International Wire instructions.
    InternationalInstruction international;
};

# Beneficial owner type
public type Prong string;

# Status of the referral. `UNCLAIMED` or `EXPIRED` unless the customer completes sign up. Customers are attributed once `ACTIVE` until the account is `CLOSED`.
public type ReferralStatus string;

# Information about the business the application is for.
public type Business record {
    # Company legal name.
    string? legal_name?;
    # Incorporation type of the company referred
    IncorporationType incorporation_type?;
    # Company Employer Identification Number(EIN).
    string? employer_identification_number?;
    # Business website (or link to Amazon store for sellers).
    string? website_url?;
    # Brief description of the business activity.
    string? activity_description?;
    # Company business address (must be in the US; no PO box or virtual/forwarding addresses allowed).
    Address address?;
    # List of beneficial owners of the company
    BeneficialOwner[]? beneficial_owners?;
    # Company business address (must be in the US; no PO box or virtual/forwarding addresses allowed).
    Address alternate_address?;
};

public type ReferralPage record {
    string? next_cursor?;
    Referral[] items;
};

# Document identifying the owner.
public type IdentityDocument record {
    # Country where the identity document was issued.
    string country;
    # Either US SSN or US/International Passport.
    IdentityDocumentType 'type;
    # US SSN or Passport number.
    string number;
};

# Type of document being submitted. Allowable types:
# - ARTICLES_OF_INCORPORATION
# - IRS_EIN_CONFIRMATION (IRS CP 575 or 147C form)
# - IRS_EIN_APPLICATION (IRS SS4 form)
# - CERTIFICATE_GOOD_STANDING
public type DocumentType string;

# Incorporation type of the company referred
public type IncorporationType string;

# Either US SSN or US/International Passport.
public type IdentityDocumentType string;

public type Referral record {
    # Unique identifier for the referral.
    string id;
    # Signup URL to redirect prospects to complete their onboarding flow. *Note*: Necessary disclosures must be shown when the prospect clicks on this link
    string referral_signup_url;
    # The time at which this referral link expires at.
    string expires_at;
    # Status of the referral. `UNCLAIMED` or `EXPIRED` unless the customer completes sign up. Customers are attributed once `ACTIVE` until the account is `CLOSED`.
    ReferralStatus status;
    Product[] products;
};

# Domestic ACH/Wire instructions.
public type DomesticInstruction record {
    # Account type.
    string account_type;
    # Account number.
    string bank_account_number;
    # Routing number.
    string bank_routing_number;
    # Beneficiary name.
    string beneficiary_name;
    # Beneficiary address.
    string beneficiary_address;
    # Bank name.
    string bank_name;
    # Bank address.
    string bank_address;
};

# Application status of a product
public type ApplicationStatus string;

# International Wire instructions.
public type InternationalInstruction record {
    # Account type.
    string account_type;
    # Swift account number.
    string swift_account_number;
    # Swift bank number.
    string swift_bank_number;
    # Beneficiary name.
    string beneficiary_name;
    # Beneficiary address.
    string beneficiary_address;
    # Bank name.
    string bank_name;
    # Bank address.
    string bank_address;
    # Special instructions.
    string special_instructions;
};

# When set to `EMAIL_OUTBOUND`, Brex will email the referred customer directly to prompt them to create their account rather than rely on the partner to direct the customer to claim the account. If not provided, the partner is responsible to contact the customer and the value defaults to `NO_OUTBOUND`.
public type ContactPreference string;

# Federal law requires us to collect information for anyone who owns 25% or more of the company.
public type BeneficialOwner record {
    # Legal full name.
    string legal_name;
    # Relationship of this beneficial owner for this company.
    CompanyRelationship company_relationship?;
    # Date of birth.
    string? date_of_birth?;
    # Document identifying the owner.
    IdentityDocument identity_document?;
    # Company business address (must be in the US; no PO box or virtual/forwarding addresses allowed).
    Address address?;
    # Beneficial owner type
    Prong prong;
};

# Required information about the referred prospect.
public type Applicant record {
    # Last name of the applying customer.
    string last_name;
    # First name of the applying customer.
    string first_name;
    # Business Email of the applying customer.
    string email;
};

# Application information.
public type Application record {
    # Application status of a product
    ApplicationStatus status;
};

# Relationship of this beneficial owner for this company.
public type CompanyRelationship string;
