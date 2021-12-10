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

public type CompanyCodesArr CompanyCodes[];

public type CustomFieldDefinitionArr CustomFieldDefinition[];

public type EmployeeIdResponseArr EmployeeIdResponse[];

public type EmployeeInfoArr EmployeeInfo[];

public type EmployeeArr Employee[];

public type DirectDepositArr DirectDeposit[];

public type EarningArr Earning[];

public type LocalTaxArr LocalTax[];

public type PayStatementDetailsArr PayStatementDetails[];

public type PayStatementSummaryArr PayStatementSummary[];

public type ClientCredentialsResponseArr ClientCredentialsResponse[];

public type TrackingNumberResponseArr TrackingNumberResponse[];

# The Local Tax model
public type EmployeeLocaltax record {
    # Local tax exemptions value.<br  />Decimal (12,2)
    decimal? exemptions?;
    # Local tax exemptions 2 value.<br  />Decimal (12,2)
    decimal? exemptions2?;
    # Employee local tax filing status. Must match specific local tax setup. <br  /> Max length: 50
    string? filingStatus?;
    # Resident PSD (political subdivision code) applicable in PA. Must match Company setup.<br  /> Max length: 9
    string? residentPSD?;
    # Local tax code.<br  />Max length: 50
    string? taxCode?;
    # Work location PSD. Must match Company setup. <br  /> Max length: 9
    string? workPSD?;
};

# The error option model
public type ErrorOptions record {
    # The code associated with this option.
    string code?;
    # The description of the option.
    string description?;
};

public type EmployeeCustombooleanfields record {
    # The custom field category.  Acceptable value is 'PayrollAndHR'.
    string category;
    # The custom field label whose value is to be added/updated. Must match to the label defined in Web Pay Custom Fields setup.  Max length: 255.
    string? label;
    # The custom boolean field value.
    boolean? value;
};

public type CustomfielddefinitionValues record {
    # The custom field code.
    string code?;
    # The custom field description.
    string description?;
};

# The Direct Deposit model
public type DirectDeposit record {
    # Additional Direct Deposits that are not the main Direct Deposit.
    DirectdepositAdditionaldirectdeposit[] additionalDirectDeposit?;
    # The main Direct Deposit account.
    DirectdepositMaindirectdeposit mainDirectDeposit?;
};

# Add or update I-9 work authorization information.
public type EmployeeWorkeligibility record {
    # Employee USCIS or Admission Number. <br  /> Must be 7-10 characters and may begin with an 'A'
    string? alienOrAdmissionDocumentNumber?;
    # The date the I-9 Verification form was attested by Employer or Authorized representative. Common formats are *MM-DD-CCYY, CCYY-MM-DD*.
    string? attestedDate?;
    # If Foreign Passport number is provided, provide its country of issuance. Must match Paylocity setup.<br  /> Max length: 30
    string? countryOfIssuance?;
    # Foreign Passport Number.<br  /> Max length: 50
    string? foreignPassportNumber?;
    # Form I-94 admission number.<br  /> Must be 11 numeric characters
    string? i94AdmissionNumber?;
    # Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? i9DateVerified?;
    # Notes regarding employee's i9.<br  /> Max length: 4000
    string? i9Notes?;
    # Indicates if employee I9 is verified.
    boolean? isI9Verified?;
    # Indicates if employee SSN is verified.
    boolean? isSsnVerified?;
    # The date of employer verification of employee SSN. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? ssnDateVerified?;
    # Notes regarding employee's SSN.<br  /> Max length: 4000
    string? ssnNotes?;
    # Employee Visa type. Must match one of the system coded values.<br  /> Max length: 100
    string? visaType?;
    # Employee work authorization. Must match one of the system coded values.<br  /> Max length: 100
    string? workAuthorization?;
    # End date of employee work eligibility.  Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? workUntil?;
};

# The Non-Primary State Tax model
public type NonPrimaryStateTax record {
    # State tax code.<br  /> Max length: 50
    decimal? amount?;
    # Box 4(b) on form W4 (year 2020 or later): Deductions amount. <br  />Decimal (12,2)
    decimal deductionsAmount?;
    # Box 3 on form W4 (year 2020 or later): Total dependents amount. <br  />Decimal (12,2)
    decimal dependentsAmount?;
    # State tax exemptions value.<br  />Decimal (12,2)
    decimal? exemptions?;
    # State tax exemptions 2 value.<br  />Decimal (12,2)
    decimal? exemptions2?;
    # Employee state tax filing status. Common values are *S* (Single), *M* (Married).<br  />Max length: 50
    string? filingStatus?;
    # Box 2(c) on form W4 (year 2020 or later): Multiple Jobs or Spouse Works. <br  />Boolean
    boolean higherRate?;
    # Box 4(a) on form W4 (year 2020 or later): Other income amount. <br  />Decimal (12,2)
    decimal otherIncomeAmount?;
    # State Tax percentage. <br  />Decimal (12,2)
    decimal? percentage?;
    # Non-primary state tax reciprocity code.<br  /> Max length: 50
    string? reciprocityCode?;
    # Supplemental check calculation code. Common values are *Blocked* (Taxes blocked on Supplemental checks), *Supp* (Use supplemental Tax Rate-Code). <br  />Max length: 10
    string? specialCheckCalc?;
    # Tax calculation code. Common values are *F* (Flat), *P* (Percentage), *FDFP* (Flat Dollar Amount plus Fixed Percentage). <br  />Max length: 10
    string? taxCalculationCode?;
    # State tax code.<br  /> Max length: 50
    string? taxCode?;
    # The state W4 form year <br  />Integer
    int w4FormYear?;
};

# The pay statement summary model
public type PayStatementSummary record {
    # .<br />
    boolean autoPay?;
    # .<br />
    string? beginDate?;
    # .<br />
    string? checkDate?;
    # .<br />
    int checkNumber?;
    # .<br />
    decimal? directDepositAmount?;
    # .<br />
    string? endDate?;
    # .<br />
    decimal? grossPay?;
    # .<br />
    decimal? hours?;
    # .<br />
    decimal? netCheck?;
    # .<br />
    decimal? netPay?;
    # .<br />
    decimal? overtimeDollars?;
    # .<br />
    decimal? overtimeHours?;
    # .<br />
    int process?;
    # .<br />
    decimal? regularDollars?;
    # .<br />
    decimal? regularHours?;
    # <br />
    int transactionNumber?;
    # .<br />
    int voucherNumber?;
    # .<br />
    string? workersCompCode?;
    # .<br />
    int year?;
};

# The address model
public type StagedemployeeHomeaddress record {
    # 1st address line.<br  /> Max length: 40
    string? address1?;
    # 2nd address line. <br  /> Max length: 40
    string? address2?;
    # City.<br  /> Max length: 40
    string? city?;
    # Country.<br  /> Max length: 30
    string? country?;
    # County.<br  /> Max length: 30
    string? county?;
    # Email. <br  />Max length: 50
    string? emailAddress?;
    # Mobile phone number.<br  /> Max length: 12
    string? mobilePhone?;
    # Phone number.<br  /> Max length: 12
    string? phone?;
    # Postal code.<br  /> Max length: 10
    string? postalCode?;
    # State or province.<br  /> Max length: 2
    string? state?;
};

# The State Tax model
public type StateTax record {
    # State tax code.<br  /> Max length: 50
    decimal? amount?;
    # Box 4(b) on form W4 (year 2020 or later): Deductions amount. <br  />Decimal (12,2)
    decimal deductionsAmount?;
    # Box 3 on form W4 (year 2020 or later): Total dependents amount. <br  />Decimal (12,2)
    decimal dependentsAmount?;
    # State tax exemptions value.<br  />Decimal (12,2)
    decimal? exemptions?;
    # State tax exemptions 2 value.<br  />Decimal (12,2)
    decimal? exemptions2?;
    # Employee state tax filing status. Common values are *S* (Single), *M* (Married).<br  />Max length: 50
    string? filingStatus?;
    # Box 2(c) on form W4 (year 2020 or later): Multiple Jobs or Spouse Works. <br  />Boolean
    boolean higherRate?;
    # Box 4(a) on form W4 (year 2020 or later): Other income amount. <br  />Decimal (12,2)
    decimal otherIncomeAmount?;
    # State Tax percentage. <br  />Decimal (12,2)
    decimal? percentage?;
    # Supplemental check calculation code. Common values are *Blocked* (Taxes blocked on Supplemental checks), *Supp* (Use supplemental Tax Rate-Code). <br  />Max length: 10
    string? specialCheckCalc?;
    # Tax calculation code. Common values are *F* (Flat), *P* (Percentage), *FDFP* (Flat Dollar Amount plus Fixed Percentage). <br  />Max length: 10
    string? taxCalculationCode?;
    # State tax code.<br  /> Max length: 50
    string? taxCode?;
    # The state W4 form year <br  />Integer
    int w4FormYear?;
};

# The Tracking Number Response model
public type TrackingNumberResponse record {
    # The unique tracking number
    string trackingNumber?;
};

# The address model
public type StagedemployeeWorkaddress record {
    # 1st address line.<br  /> Max length: 40
    string? address1?;
    # 2nd address line. <br  /> Max length: 40
    string? address2?;
    # City.<br  /> Max length: 40
    string? city?;
    # Country.<br  /> Max length: 30
    string? country?;
    # County.<br  /> Max length: 30
    string? county?;
    # Email. <br  />Max length: 50
    string? emailAddress?;
    # Mobile phone number.<br  /> Max length: 12
    string? mobilePhone?;
    # Employee pager number.<br  /> Max length: 20
    string? pager?;
    # Phone number.<br  /> Max length: 12
    string? phone?;
    # Phone number extension.<br  /> Max length: 10
    string? phoneExtension?;
    # Postal code.<br  /> Max length: 10
    string? postalCode?;
    # State or province.<br  /> Max length: 2
    string? state?;
};

# The pay statement details model
public type PayStatementDetails record {
    # .<br />
    decimal? amount?;
    # .<br />
    string? checkDate?;
    # .<br />
    string? det?;
    # .<br />
    string? detCode?;
    # .<br />
    string? detType?;
    # .<br />
    decimal? eligibleCompensation?;
    # .<br />
    decimal? hours?;
    # .<br />
    decimal? rate?;
    # <br />
    int transactionNumber?;
    # .<br />
    string? transactionType?;
    # .<br />
    int year?;
};

# The employee status model
public type StagedemployeeStatus record {
    # Adjusted seniority date. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? adjustedSeniorityDate?;
    # Employee status change reason. Must match Company setup.<br  /> Max length: 15
    string? changeReason?;
    # Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? effectiveDate?;
    # Employee current work status. Common values are *A* (Active), *L* (Leave of Absence), *T* (Terminated). <br  />Max length: 20
    string? employeeStatus?;
    # Employee hired date. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? hireDate?;
    # Indicates if employee eligible for rehire.
    boolean? isEligibleForRehire?;
};

# Add or update home department cost center, position, supervisor, reviewer, employment type, EEO class, pay settings, and union information.
public type EmployeeDepartmentposition record {
    # Employee department/position change reason. Must match Company setup. <br  />Max length: 15
    string? changeReason?;
    # Employee clock badge number. Defaults to employeeId. <br  />Max length: 10
    string? clockBadgeNumber?;
    # Employer defined location, like *branch, division, department*, etc. Must match Company setup. <br  />Max length: 10
    string? costCenter1?;
    # Employer defined location, like *branch, division, department*, etc. Must match Company setup. <br  />Max length: 10
    string? costCenter2?;
    # Employer defined location, like *branch, division, department*, etc. Must match Company setup. <br  />Max length: 10
    string? costCenter3?;
    # The date the position takes effect. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? effectiveDate?;
    # Employee current employment type. Common values *RFT (Regular Full Time), RPT (Regular Part Time), SNL (Seasonal), TFT (Temporary Full Time), TPT (Temporary Part Time)*. <br  />Max length: 10
    string? employeeType?;
    # Values are configured in Company > Setup > HR > EEO Classes.<br  /> Max length: 10
    string? equalEmploymentOpportunityClass?;
    # Indicates if employee is exempt from minimum wage.
    boolean? isMinimumWageExempt?;
    # Indicates if employee is exempt from overtime.
    boolean? isOvertimeExempt?;
    # Indicates if employee is a supervisor or reviewer.
    boolean? isSupervisorReviewer?;
    # Indicates if union dues are collected.
    boolean? isUnionDuesCollected?;
    # Indicates if initiations fees are collected.
    boolean? isUnionInitiationCollected?;
    # Employee current job title. <br  />Max length: 50
    string? jobTitle?;
    # Employee pay group. Must match Company setup. <br  /> Max length: 20
    string? payGroup?;
    # Employee position code. Must match Company setup.<br  />Max length: 20
    string? positionCode?;
    # Company number of reviewer.<br />Max length: 9
    string? reviewerCompanyNumber?;
    # Employee id of the reviewer.<br />Max length: 10
    string? reviewerEmployeeId?;
    # Employee work shift.<br  />Max length: 255
    string? shift?;
    # Supervisor's company number. Defaults to employee company number.<br  />Max length: 9
    string? supervisorCompanyNumber?;
    # EmployeeId of the supervisor. <br  />Max length: 10
    string? supervisorEmployeeId?;
    # Indicates if employee receives tips.
    string? tipped?;
    # Employee union affiliation effective date. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? unionAffiliationDate?;
    # Employee union code. Must match Company setup. <br  />Max length: 10
    string? unionCode?;
    # Employee union position. Must match Company setup. <br  />Max length: 30
    string? unionPosition?;
    # Employee worker compensation code. Must match Company setup.<br  /> Max length: 10
    string? workersCompensation?;
};

public type EmployeeCustomnumberfields record {
    # The custom field category.  Acceptable value is 'PayrollAndHR'.
    string category;
    # The custom field label whose value is to be added/updated.  Must match to the label defined in Web Pay Custom Fields setup.  Max length: 255.
    string? label;
    # The custom number field value.  Decimal (18,6).
    decimal? value;
};

public type EmployeeCustomtextfields record {
    # The custom field category.  Acceptable value is 'PayrollAndHR'.
    string category;
    # The custom field label whose value is to be added/updated.  Must match to the label defined in Web Pay Custom Fields setup.  Max length: 255.
    string? label;
    # The custom text field value.  Max length: 255.
    string? value;
};

# The benefit setup model
public type BenefitSetup record {
    # Benefit Class code. Values are configured in Web Pay Company > Setup > Benefits > Classes.<br  />Max length: 30
    string? benefitClass?;
    # Date when Benefit Class takes effect. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? benefitClassEffectiveDate?;
    # Salary used to configure benefits.<br  />Decimal(12,2)
    decimal? benefitSalary?;
    # Date when Benefit Salary takes effect. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? benefitSalaryEffectiveDate?;
    # Applicable only for HR Enhanced clients and Benefit Classes with ACA Employment Type of Full Time.
    boolean? doNotApplyAdministrativePeriod?;
    # Only valid for HR Enhanced clients and Benefit Classes that are ACA Employment Type of Full Time.
    boolean? isMeasureAcaEligibility?;
};

# The emergency contact model
public type EmployeeEmergencycontacts record {
    # 1st address line.
    string? address1?;
    # 2nd address line.
    string? address2?;
    # City.
    string? city?;
    # County.
    string? country?;
    # Country.  Must be a valid 3 character country code.  Common values are *USA* (United States), *CAN* (Canada).
    string? county?;
    # Contact email.  Must be valid email address format.
    string? email?;
    # Required. Contact first name. <br  />Max length: 40
    string? firstName;
    # Contact Home Phone.  Valid phone format  *(###) #######* or *######-####* or *### ### ####* or *##########* or, if international, starts with *+#*, only spaces and digits allowed.
    string? homePhone?;
    # Required. Contact last name. <br  />Max length: 40
    string? lastName;
    # Contact Mobile Phone.  Valid phone format  *(###) #######* or *######-####* or *### ### ####* or *##########* or, if international, starts with *+#*, only spaces and digits allowed.
    string? mobilePhone?;
    # Notes. <br  />Max length: 1000
    string? notes?;
    # Contact Pager.  Valid phone format  *(###) #######* or *######-####* or *### ### ####* or *##########* or, if international, starts with *+#*, only spaces and digits allowed.
    string? pager?;
    # Required. Contact primary phone type.  Must match Company setup.  Valid  values are H (Home), M (Mobile), P (Pager), W (Work)
    string? primaryPhone?;
    # Required. Contact priority. Valid values are *P* (Primary) or *S* (Secondary).
    string? priority?;
    # Required. Contact relationship.  Must match Company setup.  Common values are Spouse, Mother, Father.
    string? relationship?;
    # State or Province.  If U.S. address, must be valid 2 character state code.  Common values are *IL* (Illinois), *CA* (California).
    string? state?;
    # Valid values are *true* or *false*.
    boolean syncEmployeeInfo?;
    # Work Extension.
    string? workExtension?;
    # Contact Work Phone.  Valid phone format  *(###) #######* or *######-####* or *### ### ####* or *##########* or, if international, starts with *+#*, only spaces and digits allowed.
    string? workPhone?;
    # Postal code.  If U.S. address, must be a valid zip code.
    string? zip?;
};

# The Work Eligibility model
public type StagedemployeeWorkeligibility record {
    # Employee USCIS or Admission Number. <br  /> Must be 7-10 characters and may begin with an 'A'
    string? alienOrAdmissionDocumentNumber?;
    # The date the I-9 Verification form was attested by Employer or Authorized representative. Common formats are *MM-DD-CCYY, CCYY-MM-DD*.
    string? attestedDate?;
    # If Foreign Passport number is provided, provide its country of issuance. Must match Paylocity setup.<br  /> Max length: 30
    string? countryOfIssuance?;
    # Foreign Passport Number.<br  /> Max length: 50
    string? foreignPassportNumber?;
    # Form I-94 admission number.<br  /> Must be 11 numeric characters
    string? i94AdmissionNumber?;
    # Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? i9DateVerified?;
    # Notes regarding employee's i9.<br  /> Max length: 4000
    string? i9Notes?;
    # Indicates if employee I9 is verified.
    boolean? isI9Verified?;
    # Indicates if employee SSN is verified.
    boolean? isSsnVerified?;
    # The date of employer verification of employee SSN. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? ssnDateVerified?;
    # Notes regarding employee's SSN.<br  /> Max length: 4000
    string? ssnNotes?;
    # Employee Visa type. Must match one of the system coded values.<br  /> Max length: 100
    string? visaType?;
    # Employee work authorization. Must match one of the system coded values.<br  /> Max length: 100
    string? workAuthorization?;
    # End date of employee work eligibility.  Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? workUntil?;
};

public type CustomFieldDefinition record {
    # The custom field category.
    string category?;
    # Specifies the default value of the custom field.
    string defaultValue?;
    # Indicates whether the custom field is required.
    boolean isRequired?;
    # The custom field label.
    string label?;
    # The custom field type.
    string 'type?;
    # A set of values that are applicable to the custom field.
    CustomfielddefinitionValues[] values?;
};

# Add or update primary state tax code, amount type (taxCalculationCode), amount or percentage, filing status, exemptions, and supplemental check (specialCheckCalc) information. Only one primary state is allowed. Sending an updated primary state will replace the current primary state.
public type EmployeePrimarystatetax record {
    # State tax code.<br  /> Max length: 50
    decimal? amount?;
    # Box 4(b) on form W4 (year 2020 or later): Deductions amount. <br  />Decimal (12,2)
    decimal deductionsAmount?;
    # Box 3 on form W4 (year 2020 or later): Total dependents amount. <br  />Decimal (12,2)
    decimal dependentsAmount?;
    # State tax exemptions value.<br  />Decimal (12,2)
    decimal? exemptions?;
    # State tax exemptions 2 value.<br  />Decimal (12,2)
    decimal? exemptions2?;
    # Employee state tax filing status. Common values are *S* (Single), *M* (Married).<br  />Max length: 50
    string? filingStatus?;
    # Box 2(c) on form W4 (year 2020 or later): Multiple Jobs or Spouse Works. <br  />Boolean
    boolean higherRate?;
    # Box 4(a) on form W4 (year 2020 or later): Other income amount. <br  />Decimal (12,2)
    decimal otherIncomeAmount?;
    # State Tax percentage. <br  />Decimal (12,2)
    decimal? percentage?;
    # Supplemental check calculation code. Common values are *Blocked* (Taxes blocked on Supplemental checks), *Supp* (Use supplemental Tax Rate-Code). <br  />Max length: 10
    string? specialCheckCalc?;
    # Tax calculation code. Common values are *F* (Flat), *P* (Percentage), *FDFP* (Flat Dollar Amount plus Fixed Percentage). <br  />Max length: 10
    string? taxCalculationCode?;
    # State tax code.<br  /> Max length: 50
    string? taxCode?;
    # The state W4 form year <br  />Integer
    int w4FormYear?;
};

# Add tax form, 1099 exempt reasons and notes, and 943 agricultural employee information. Once the employee receives wages, this information cannot be updated. Add or update SUI tax state, retirement plan, and statutory information.
public type EmployeeTaxsetup record {
    # Notes for FITW exemption.<br  /> Max length: 250
    string? fitwExemptNotes?;
    # Reason code for FITW exemption. Common values are *SE* (Statutory employee), *CR* (clergy/Religious). <br  /> Max length: 30
    string? fitwExemptReason?;
    # Notes for FUTA exemption.<br  /> Max length: 250
    string? futaExemptNotes?;
    # Reason code for FUTA exemption. Common values are *501* (5019c)(3) Organization), *IC* (Independent Contractor).<br  /> Max length: 30
    string? futaExemptReason?;
    # Indicates if employee in agriculture or farming.
    boolean isEmployee943?;
    # Indicates if employee is eligible for pension.
    boolean isPension?;
    # Indicates if employee is statutory.
    boolean isStatutory?;
    # Notes for Medicare exemption.<br  /> Max length: 250
    string? medExemptNotes?;
    # Reason code for Medicare exemption. Common values are *501* (5019c)(3) Organization), *IC* (Independent Contractor).<br  /> Max length: 30
    string? medExemptReason?;
    # Notes for SITW exemption.<br  /> Max length: 250
    string? sitwExemptNotes?;
    # Reason code for SITW exemption. Common values are *SE* (Statutory employee), *CR* (clergy/Religious). <br  /> Max length: 30
    string? sitwExemptReason?;
    # Notes for Social Security exemption.<br  /> Max length: 250
    string? ssExemptNotes?;
    # Reason code for Social Security exemption. Common values are *SE* (Statutory employee), *CR* (clergy/Religious). <br  /> Max length: 30
    string? ssExemptReason?;
    # Notes for SUI exemption.<br  /> Max length: 250
    string? suiExemptNotes?;
    # Reason code for SUI exemption. Common values are *SE* (Statutory employee), *CR* (clergy/Religious). <br  /> Max length: 30
    string? suiExemptReason?;
    # Employee SUI (State Unemployment Insurance) state. <br  />Max length: 2
    string? suiState?;
    # Employee 1099R distribution code. Common values are *7* (Normal Distribution), *F* (Charitable Gift Annuity). <br  />Max length: 1
    string? taxDistributionCode1099R?;
    # Employee tax form for reporting income. Valid values are *W2, 1099M, 1099R*. Default is W2. <br  />Max length: 15
    string? taxForm?;
};

public type EmployeeCustomdatefields record {
    # The custom field category.  Acceptable value is 'PayrollAndHR'.
    string category;
    # The custom field label whose value is to be added/updated.  Must match to the label defined in Web Pay Custom Fields setup.  Max length: 255.
    string? label;
    # The custom date field value.  Common formats include MM-DD-CCYY, CCYY-MM-DD.
    string? value;
};

# The Company Codes model
public type CompanyCodes record {
    # Code.<br  /> Max length: 40
    string? code?;
    # Description. <br  /> Max length: 150
    string? description?;
};

# The employee model
public type Employee record {
    # Add up to 19 direct deposit accounts in addition to the main direct deposit account. IMPORTANT: A direct deposit update will remove ALL existing main and additional direct deposit information in WebPay and replace with information provided on the request. GET API will not return direct deposit data.
    DirectdepositAdditionaldirectdeposit[19] additionalDirectDeposit?;
    # Add Additional Rates.
    EmployeeAdditionalrate[] additionalRate?;
    #  Add or update setup values used for employee benefits integration, insurance plan settings, and ACA reporting.
    EmployeeBenefitsetup benefitSetup?;
    # Employee birthdate. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? birthDate?;
    # Company FEIN as defined in Web Pay, applicable with GET requests only.<br  /> Max length: 20
    string? companyFEIN?;
    # Company name as defined in Web Pay, applicable with GET requests only.<br  /> Max length: 50
    string? companyName?;
    # Employee is paid in this currency. <br  />Max length: 30
    string? currency?;
    # Up to 8 custom fields of boolean (checkbox) type value.
    EmployeeCustombooleanfields[8] customBooleanFields?;
    # Up to 8 custom fields of the date type value.
    EmployeeCustomdatefields[8] customDateFields?;
    # Up to 8 custom fields of the dropdown type value.
    EmployeeCustomdropdownfields[8] customDropDownFields?;
    # Up to 8 custom fields of numeric type value.
    EmployeeCustomnumberfields[8] customNumberFields?;
    # Up to 8 custom fields of text type value.
    EmployeeCustomtextfields[8] customTextFields?;
    # Add or update home department cost center, position, supervisor, reviewer, employment type, EEO class, pay settings, and union information.
    EmployeeDepartmentposition departmentPosition?;
    # Indicates if employee has disability status.
    string? disabilityDescription?;
    # Add or update Emergency Contacts.
    EmployeeEmergencycontacts[] emergencyContacts?;
    # Leave blank to have Web Pay automatically assign the next available employee ID.<br  />Max length: 10
    string? employeeId?;
    # Employee ethnicity.<br  /> Max length: 10
    string? ethnicity?;
    # Add or update federal tax amount type (taxCalculationCode), amount or percentage, filing status, and exemptions.
    EmployeeFederaltax federalTax?;
    # Employee first name. <br  />Max length: 40
    string? firstName?;
    # Employee gender. Common values *M* (Male), *F* (Female). <br  />Max length: 1
    string? gender?;
    # Add or update employee's home address, personal phone numbers, and personal email.
    EmployeeHomeaddress homeAddress?;
    # Indicates if employee meets the highly compensated employee criteria.
    boolean isHighlyCompensated?;
    # Indicates if employee is a smoker.
    boolean isSmoker?;
    # Employee last name. <br  />Max length: 40
    string? lastName?;
    # Add, update, or delete local tax code, filing status, and exemptions including  PA-PSD taxes.
    EmployeeLocaltax[5] localTax?;
    # Add the main direct deposit account. After deposits are made to any additional direct deposit accounts, the remaining net check is deposited in the main direct deposit account. IMPORTANT: A direct deposit update will remove ALL existing main and additional direct deposit information in WebPay and replace with what is provided on the request. GET API will not return direct deposit data.
    EmployeeMaindirectdeposit mainDirectDeposit?;
    # Employee marital status. Common values *D (Divorced), M (Married), S (Single), W (Widowed)*. <br  />Max length: 10
    string? maritalStatus?;
    # Employee middle name.<br  /> Max length: 20
    string? middleName?;
    # Add or update non-primary state tax code, amount type (taxCalculationCode), amount or percentage, filing status, exemptions, supplemental check (specialCheckCalc), and reciprocity code information.
    EmployeeNonprimarystatetax nonPrimaryStateTax?;
    # Percentage of employee's ownership in the company, entered as a whole number. <br  /> Decimal (12,2)
    decimal? ownerPercent?;
    # Employee preferred display name.<br  /> Max length: 20
    string? preferredName?;
    # Add or update hourly or salary pay rate, effective date, and pay frequency.
    EmployeePrimarypayrate primaryPayRate?;
    # Add or update primary state tax code, amount type (taxCalculationCode), amount or percentage, filing status, exemptions, and supplemental check (specialCheckCalc) information. Only one primary state is allowed. Sending an updated primary state will replace the current primary state.
    EmployeePrimarystatetax primaryStateTax?;
    # Prior last name if applicable.<br  />Max length: 40
    string? priorLastName?;
    # Employee preferred salutation. <br  />Max length: 10
    string? salutation?;
    # Employee social security number. Leave it blank if valid social security number not available. <br  />Max length: 11
    string? ssn?;
    # Add or update employee status, change reason, effective date, and adjusted seniority date. Note that companies that are still in Implementation cannot hire future employees.
    EmployeeStatus status?;
    # Employee name suffix. Common values are *Jr, Sr, II*.<br  />Max length: 30
    string? suffix?;
    # Add tax form, 1099 exempt reasons and notes, and 943 agricultural employee information. Once the employee receives wages, this information cannot be updated. Add or update SUI tax state, retirement plan, and statutory information.
    EmployeeTaxsetup taxSetup?;
    # Indicates if employee is a veteran.
    string? veteranDescription?;
    # Add or update Web Time badge number and charge rate and synchronize Web Pay and Web Time employee data.
    EmployeeWebtime webTime?;
    # Add or update employee's work address, phone numbers, and email. Work Location drop down field is not included.
    EmployeeWorkaddress workAddress?;
    # Add or update I-9 work authorization information.
    EmployeeWorkeligibility workEligibility?;
};

# Add or update Web Time badge number and charge rate and synchronize Web Pay and Web Time employee data.
public type EmployeeWebtime record {
    # Badge number usually issued for time and attendance system use. <br  />Max length: 50
    string? badgeNumber?;
    # Rate to be charged to third party for time worked by the employee. It is most commonly referenced in the Cost Center Charge, Cost Center Charge vs. Cost Reports, and the Customer Invoice time and attendance reports. <br  />Decimal (12,2)
    decimal? chargeRate?;
    # If set to true, changes to employee data will be reflected in Web Time.
    boolean? isTimeLaborEnabled?;
};

# Add or update employee status, change reason, effective date, and adjusted seniority date. Note that companies that are still in Implementation cannot hire future employees.
public type EmployeeStatus record {
    # Adjusted seniority date. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? adjustedSeniorityDate?;
    # Employee status change reason. Must match Company setup.<br  /> Max length: 15
    string? changeReason?;
    # Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? effectiveDate?;
    # Employee current work status. Common values are *A* (Active), *L* (Leave of Absence), *T* (Terminated). <br  />Max length: 20
    string? employeeStatus?;
    # Employee hired date. Updates to hire date are not allowed and will be ignored. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? hireDate?;
    # Indicates if employee eligible for rehire.
    boolean? isEligibleForRehire?;
    # Rehire date if employee is rehired.  Updates to re-hire date are not allowed and will be ignored. Common formats are *MM-DD-CCYY, CCYY-MM-DD*.
    string? reHireDate?;
};

# The Federal Tax model
public type StagedemployeeFederaltax record {
    # Tax amount. <br  />Decimal (12,2)
    decimal? amount?;
    # Box 4(b) on form W4 (year 2020 or later): Deductions amount. <br  />Decimal (12,2)
    decimal deductionsAmount?;
    # Box 3 on form W4 (year 2020 or later): Total dependents amount. <br  />Decimal (12,2)
    decimal dependentsAmount?;
    # Federal tax exemptions value. <br  />Decimal (12,2)
    decimal? exemptions?;
    # Employee federal filing status. Common values are *S* (Single), *M* (Married).<br  />Max length: 50
    string? filingStatus?;
    # Box 2(c) on form W4 (year 2020 or later): Multiple Jobs or Spouse Works. <br  />Boolean
    boolean higherRate?;
    # Box 4(a) on form W4 (year 2020 or later): Other income amount. <br  />Decimal (12,2)
    decimal otherIncomeAmount?;
    # Tax percentage. <br  />Decimal (12,2)
    decimal? percentage?;
    # Tax calculation code. Common values are *F* (Flat), *P* (Percentage), *FDFP* (Flat Dollar Amount plus Fixed Percentage). <br  />Max length: 10
    string? taxCalculationCode?;
    # The federal W4 form year <br  />Integer
    int w4FormYear?;
};

# Add or update non-primary state tax code, amount type (taxCalculationCode), amount or percentage, filing status, exemptions, supplemental check (specialCheckCalc), and reciprocity code information.
public type EmployeeNonprimarystatetax record {
    # State tax code.<br  /> Max length: 50
    decimal? amount?;
    # Box 4(b) on form W4 (year 2020 or later): Deductions amount. <br  />Decimal (12,2)
    decimal deductionsAmount?;
    # Box 3 on form W4 (year 2020 or later): Total dependents amount. <br  />Decimal (12,2)
    decimal dependentsAmount?;
    # State tax exemptions value.<br  />Decimal (12,2)
    decimal? exemptions?;
    # State tax exemptions 2 value.<br  />Decimal (12,2)
    decimal? exemptions2?;
    # Employee state tax filing status. Common values are *S* (Single), *M* (Married).<br  />Max length: 50
    string? filingStatus?;
    # Box 2(c) on form W4 (year 2020 or later): Multiple Jobs or Spouse Works. <br  />Boolean
    boolean higherRate?;
    # Box 4(a) on form W4 (year 2020 or later): Other income amount. <br  />Decimal (12,2)
    decimal otherIncomeAmount?;
    # State Tax percentage. <br  />Decimal (12,2)
    decimal? percentage?;
    # Non-primary state tax reciprocity code.<br  /> Max length: 50
    string? reciprocityCode?;
    # Supplemental check calculation code. Common values are *Blocked* (Taxes blocked on Supplemental checks), *Supp* (Use supplemental Tax Rate-Code). <br  />Max length: 10
    string? specialCheckCalc?;
    # Tax calculation code. Common values are *F* (Flat), *P* (Percentage), *FDFP* (Flat Dollar Amount plus Fixed Percentage). <br  />Max length: 10
    string? taxCalculationCode?;
    # State tax code.<br  /> Max length: 50
    string? taxCode?;
    # The state W4 form year <br  />Integer
    int w4FormYear?;
};

# The additional direct deposit model
public type StagedemployeeAdditionaldirectdeposit record {
    # Account number, entered without special characters and spaces. <br  />Max length: 17<br />
    string? accountNumber?;
    # Account type. Valid values are *C* (Checking), *S* (Saving), *P* (Pay Card). <br   />Max length: 1<br />
    string? accountType?;
    # Amount value to be deposited to the account.<br  />Decimal (12,2)<br />
    decimal? amount?;
    # Amount type to indicate the context of the amount. Common values are *F* (FLAT), *F-* (Net Minus), *P* (Percent). <br  /> Max length: 5<br />
    string? amountType?;
    # Indicates if account will not pre-note.<br />
    boolean? isSkipPreNote?;
    # Date to end the pre-note of the account. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.<br />
    string? preNoteDate?;
    # ABA Transit Routing Number, entered without dashes or spaces. <br  />Max length: 9<br />
    string? routingNumber?;
};

# The additional pay rate model
public type EmployeeAdditionalrate record {
    # Not required. If populated, must match one of the system coded values available in the Additional Rates Change Reason drop down.<br />
    string? changeReason?;
    # Not required. Valid values must match one of the system coded cost centers available in the Additional Rates Cost Center level 1 drop down. This cell must be in a text format.<br />
    string? costCenter1?;
    # Not required. Valid values must match one of the system coded cost centers available in the Additional Rates Cost Center level 2 drop down. This cell must be in a text format.<br />
    string? costCenter2?;
    # Not required. Valid values must match one of the system coded cost centers available in the Additional Rates Cost Center level 3 drop down. This cell must be in a text format.<br />
    string? costCenter3?;
    # Required. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.<br />
    string? effectiveDate?;
    # Not required. Must match one of the system coded check dates available in the Additional Rates End Check Date drop down. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.<br />
    string? endCheckDate?;
    # Not required. If populated, must match one of the system coded values available in the Additional Rates Job drop down.<br />
    string? job?;
    # Required. Enter dollar amount that corresponds to the Per selection.<br />
    decimal? rate?;
    # Required. If populated, must match one of the system coded values available in the Additional Rates Rate Code drop down.<br />
    string? rateCode?;
    # Not required.<br  />Max length: 4000<br />
    string? rateNotes?;
    # Required. Valid values are HOUR or WEEK.<br />
    string? ratePer?;
    # Not required. If populated, must match one of the system coded values available in the Additional Rates Shift drop down.<br />
    string? shift?;
};

# Add or update federal tax amount type (taxCalculationCode), amount or percentage, filing status, and exemptions.
public type EmployeeFederaltax record {
    # Tax amount. <br  />Decimal (12,2)
    decimal? amount?;
    # Box 4(b) on form W4 (year 2020 or later): Deductions amount. <br  />Decimal (12,2)
    decimal deductionsAmount?;
    # Box 3 on form W4 (year 2020 or later): Total dependents amount. <br  />Decimal (12,2)
    decimal dependentsAmount?;
    # Federal tax exemptions value. <br  />Decimal (12,2)
    decimal? exemptions?;
    # Employee federal filing status. Common values are *S* (Single), *M* (Married).<br  />Max length: 50
    string? filingStatus?;
    # Box 2(c) on form W4 (year 2020 or later): Multiple Jobs or Spouse Works. <br  />Boolean
    boolean higherRate?;
    # Box 4(a) on form W4 (year 2020 or later): Other income amount. <br  />Decimal (12,2)
    decimal otherIncomeAmount?;
    # Tax percentage. <br  />Decimal (12,2)
    decimal? percentage?;
    # Tax calculation code. Common values are *F* (Flat), *P* (Percentage), *FDFP* (Flat Dollar Amount plus Fixed Percentage). <br  />Max length: 10
    string? taxCalculationCode?;
    # The federal W4 form year <br  />Integer
    int w4FormYear?;
};

# The additional direct deposit model
public type DirectdepositAdditionaldirectdeposit record {
    # Account number, entered without special characters and spaces. <br  />Max length: 17<br />
    string? accountNumber?;
    # Account type. Valid values are *C* (Checking), *S* (Saving), *P* (Pay Card). <br   />Max length: 1<br />
    string? accountType?;
    # Amount value to be deposited to the account.<br  />Decimal (12,2)<br />
    decimal? amount?;
    # Amount type to indicate the context of the amount. Common values are *F* (FLAT), *F-* (Net Minus), *P* (Percent). <br  /> Max length: 5<br />
    string? amountType?;
    # Indicates if direct deposit should be blocked when special check types such as Bonus are processed.<br />
    boolean? blockSpecial?;
    # Indicates if account will not pre-note.<br />
    boolean? isSkipPreNote?;
    # Name on the bank account. Defaults to employee's name. <br  />Max length: 30<br />
    string? nameOnAccount?;
    # Date to end the pre-note of the account. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.<br />
    string? preNoteDate?;
    # ABA Transit Routing Number, entered without dashes or spaces. <br  />Max length: 9<br />
    string? routingNumber?;
};

# Add the main direct deposit account. After deposits are made to any additional direct deposit accounts, the remaining net check is deposited in the main direct deposit account. IMPORTANT: A direct deposit update will remove ALL existing main and additional direct deposit information in WebPay and replace with what is provided on the request. GET API will not return direct deposit data.
public type EmployeeMaindirectdeposit record {
    # Account number, entered without special characters and spaces. <br  />Max length: 17
    string? accountNumber?;
    # Account type. Valid values are *C* (Checking), *S* (Saving), *P* (Pay Card). <br   />Max length: 1
    string? accountType?;
    # Indicates if direct deposit should be blocked when special check types such as Bonus are processed.<br />
    boolean? blockSpecial?;
    # Indicates if account will not pre-note.
    boolean? isSkipPreNote?;
    # Name on the bank account. Defaults to employee's name. <br  />Max length: 30<br />
    string? nameOnAccount?;
    # Date to end the pre-note of the account. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? preNoteDate?;
    # ABA Transit Routing Number, entered without dashes or spaces. <br  />Max length: 9
    string? routingNumber?;
};

# The emergency contact model
public type EmergencyContact record {
    # 1st address line.
    string? address1?;
    # 2nd address line.
    string? address2?;
    # City.
    string? city?;
    # County.
    string? country?;
    # Country.  Must be a valid 3 character country code.  Common values are *USA* (United States), *CAN* (Canada).
    string? county?;
    # Contact email.  Must be valid email address format.
    string? email?;
    # Required. Contact first name. <br  />Max length: 40
    string? firstName;
    # Contact Home Phone.  Valid phone format  *(###) #######* or *######-####* or *### ### ####* or *##########* or, if international, starts with *+#*, only spaces and digits allowed.
    string? homePhone?;
    # Required. Contact last name. <br  />Max length: 40
    string? lastName;
    # Contact Mobile Phone.  Valid phone format  *(###) #######* or *######-####* or *### ### ####* or *##########* or, if international, starts with *+#*, only spaces and digits allowed.
    string? mobilePhone?;
    # Notes. <br  />Max length: 1000
    string? notes?;
    # Contact Pager.  Valid phone format  *(###) #######* or *######-####* or *### ### ####* or *##########* or, if international, starts with *+#*, only spaces and digits allowed.
    string? pager?;
    # Required. Contact primary phone type.  Must match Company setup.  Valid  values are H (Home), M (Mobile), P (Pager), W (Work)
    string? primaryPhone?;
    # Required. Contact priority. Valid values are *P* (Primary) or *S* (Secondary).
    string? priority?;
    # Required. Contact relationship.  Must match Company setup.  Common values are Spouse, Mother, Father.
    string? relationship?;
    # State or Province.  If U.S. address, must be valid 2 character state code.  Common values are *IL* (Illinois), *CA* (California).
    string? state?;
    # Valid values are *true* or *false*.
    boolean syncEmployeeInfo?;
    # Work Extension.
    string? workExtension?;
    # Contact Work Phone.  Valid phone format  *(###) #######* or *######-####* or *### ### ####* or *##########* or, if international, starts with *+#*, only spaces and digits allowed.
    string? workPhone?;
    # Postal code.  If U.S. address, must be a valid zip code.
    string? zip?;
};

# The EmployeeId Response Model
public type EmployeeIdResponse record {
    # The EmployeeId
    string employeeId?;
};

# The Local Tax model
public type LocalTax record {
    # Local tax exemptions value.<br  />Decimal (12,2)
    decimal? exemptions?;
    # Local tax exemptions 2 value.<br  />Decimal (12,2)
    decimal? exemptions2?;
    # Employee local tax filing status. Must match specific local tax setup. <br  /> Max length: 50
    string? filingStatus?;
    # Resident PSD (political subdivision code) applicable in PA. Must match Company setup.<br  /> Max length: 9
    string? residentPSD?;
    # Local tax code.<br  />Max length: 50
    string? taxCode?;
    # Work location PSD. Must match Company setup. <br  /> Max length: 9
    string? workPSD?;
};

#  Add or update setup values used for employee benefits integration, insurance plan settings, and ACA reporting.
public type EmployeeBenefitsetup record {
    # Benefit Class code. Values are configured in Web Pay Company > Setup > Benefits > Classes.<br  />Max length: 30
    string? benefitClass?;
    # Date when Benefit Class takes effect. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? benefitClassEffectiveDate?;
    # Salary used to configure benefits.<br  />Decimal(12,2)
    decimal? benefitSalary?;
    # Date when Benefit Salary takes effect. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? benefitSalaryEffectiveDate?;
    # Applicable only for HR Enhanced clients and Benefit Classes with ACA Employment Type of Full Time.
    boolean? doNotApplyAdministrativePeriod?;
    # Only valid for HR Enhanced clients and Benefit Classes that are ACA Employment Type of Full Time.
    boolean? isMeasureAcaEligibility?;
};

public type EmployeeCustomdropdownfields record {
    # The custom field category.  Acceptable value is 'PayrollAndHR'.
    string category;
    # The custom field label whose value is to be added/updated.  Must match to the label defined in Web Pay Custom Fields setup.  Max length: 255.
    string? label;
    # The custom dropdown field value.  Values are configured in Web Pay Company > Setup > List Values > Lookup Values > Custom Fields: PayrollAndHR.  Max length: 10.
    string? value;
};

# Add Web Time badge number and charge rate and synchronize Web Pay and Web Time employee data.
public type StagedemployeeWebtime record {
    # Badge number usually issued for time and attendance system use. <br  />Max length: 50
    string? badgeNumber?;
    # Rate to be charged to third party for time worked by the employee. It is most commonly referenced in the Cost Center Charge, Cost Center Charge vs. Cost Reports, and the Customer Invoice time and attendance reports. <br  />Decimal (12,2)
    decimal? chargeRate?;
    # If set to true, changes to employee data will be reflected in Web Time.
    boolean? isTimeLaborEnabled?;
};

# Add or update employee's home address, personal phone numbers, and personal email.
public type EmployeeHomeaddress record {
    # 1st address line.<br  /> Max length: 40
    string? address1?;
    # 2nd address line. <br  /> Max length: 40
    string? address2?;
    # City.<br  /> Max length: 40
    string? city?;
    # Country.<br  /> Max length: 30
    string? country?;
    # County.<br  /> Max length: 30
    string? county?;
    # Email. <br  />Max length: 50
    string? emailAddress?;
    # Mobile phone number.<br  /> Max length: 12
    string? mobilePhone?;
    # Phone number.<br  /> Max length: 12
    string? phone?;
    # Postal code.<br  /> Max length: 10
    string? postalCode?;
    # State or province.<br  /> Max length: 2
    string? state?;
};

# The staged employee model
public type StagedEmployee record {
    # Add up to 19 direct deposit accounts in addition to the main direct deposit account. IMPORTANT: A direct deposit update will remove ALL existing main and additional direct deposit information in WebPay and replace with information provided on the request. GET API will not return direct deposit data.
    StagedemployeeAdditionaldirectdeposit[4] additionalDirectDeposit?;
    # Add setup values used for employee benefits integration, insurance plan settings, and ACA reporting.
    StagedemployeeBenefitsetup[1] benefitSetup?;
    # Employee birthdate. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? birthDate?;
    # Up to 8 custom fields of boolean (checkbox) type value.
    EmployeeCustombooleanfields[8] customBooleanFields?;
    # Up to 8 custom fields of the date type value.
    EmployeeCustomdatefields[8] customDateFields?;
    # Up to 8 custom fields of the dropdown type value.
    EmployeeCustomdropdownfields[8] customDropDownFields?;
    # Up to 8 custom fields of numeric type value.
    EmployeeCustomnumberfields[8] customNumberFields?;
    # Up to 8 custom fields of text type value.
    EmployeeCustomtextfields[8] customTextFields?;
    # Add home department cost center, position, supervisor, reviewer, employment type, EEO class, pay settings, and union information.
    StagedemployeeDepartmentposition[1] departmentPosition?;
    # Indicates if employee has disability status.
    string? disabilityDescription?;
    # Leave blank to have Web Pay automatically assign the next available employee ID.<br  /> Max length: 10
    string? employeeId?;
    # Employee ethnicity.<br  /> Max length: 10
    string? ethnicity?;
    # Add federal tax amount type (taxCalculationCode), amount or percentage, filing status, and exemptions.
    StagedemployeeFederaltax[1] federalTax?;
    # Employee first name. <br  />Max length: 40
    string? firstName?;
    # Reason code for FITW exemption. Common values are *SE* (Statutory employee), *CR* (clergy/Religious). <br  /> Max length: 30
    string? fitwExemptReason?;
    # Reason code for FUTA exemption. Common values are *501* (5019c)(3) Organization), *IC* (Independent Contractor).<br  /> Max length: 30
    string? futaExemptReason?;
    # Employee gender. Common values *M* (Male), *F* (Female). <br  />Max length: 1
    string? gender?;
    # Add employee's home address, personal phone numbers, and personal email.
    StagedemployeeHomeaddress[1] homeAddress?;
    # Indicates if employee in agriculture or farming.
    boolean? isEmployee943?;
    # Indicates if employee is a smoker.
    boolean? isSmoker?;
    # Employee last name. <br  />Max length: 40
    string? lastName?;
    # Add local tax code, filing status, and exemptions including PA-PSD taxes.
    EmployeeLocaltax[5] localTax?;
    # Add the main direct deposit account. After deposits are made to any additional direct deposit accounts, the remaining net check is deposited in the main direct deposit account. IMPORTANT: A direct deposit update will remove ALL existing main and additional direct deposit information in WebPay and replace with what is provided on the request. GET API will not return direct deposit data.
    StagedemployeeMaindirectdeposit[1] mainDirectDeposit?;
    # Employee marital status. Common values *D (Divorced), M (Married), S (Single), W (Widowed)*. <br  />Max length: 10
    string? maritalStatus?;
    # Reason code for Medicare exemption. Common values are *501* (5019c)(3) Organization), *IC* (Independent Contractor).<br  /> Max length: 30
    string? medExemptReason?;
    # Employee middle name.<br  /> Max length: 20
    string? middleName?;
    # Add non-primary state tax code, amount type (taxCalculationCode), amount or percentage, filing status, exemptions, supplemental check (specialCheckCalc), and reciprocity code information.
    StagedemployeeNonprimarystatetax[1] nonPrimaryStateTax?;
    # Employee preferred display name.<br  /> Max length: 20
    string? preferredName?;
    # Add hourly or salary pay rate, effective date, and pay frequency.
    StagedemployeePrimarypayrate[1] primaryPayRate?;
    # Add primary state tax code, amount type (taxCalculationCode), amount or percentage, filing status, exemptions, and supplemental check (specialCheckCalc) information. Only one primary state is allowed.
    StagedemployeePrimarystatetax[1] primaryStateTax?;
    # Prior last name if applicable.<br  />Max length: 40
    string? priorLastName?;
    # Employee preferred salutation. <br  />Max length: 10
    string? salutation?;
    # Reason code for SITW exemption. Common values are *SE* (Statutory employee), *CR* (clergy/Religious). <br  /> Max length: 30
    string? sitwExemptReason?;
    # Reason code for Social Security exemption. Common values are *SE* (Statutory employee), *CR* (clergy/Religious). <br  /> Max length: 30
    string? ssExemptReason?;
    # Employee social security number. Leave it blank if valid social security number not available. <br  />Max length: 11
    string? ssn?;
    # Add employee status, change reason, effective date, and adjusted seniority date. Note that companies that are still in Implementation cannot hire future employees.
    StagedemployeeStatus[1] status?;
    # Employee name suffix. Common values are *Jr, Sr, II*.<br  />Max length: 30
    string? suffix?;
    # Reason code for SUI exemption. Common values are *SE* (Statutory employee), *CR* (clergy/Religious). <br  /> Max length: 30
    string? suiExemptReason?;
    # Employee SUI (State Unemployment Insurance) state. <br  />Max length: 2
    string? suiState?;
    # Employee 1099R distribution code. Common values are *7* (Normal Distribution), *F* (Charitable Gift Annuity). <br  />Max length: 1
    string? taxDistributionCode1099R?;
    # Employee tax form for reporting income. Valid values are *W2, 1099M, 1099R*. Default is W2. <br  />Max length: 15
    string? taxForm?;
    # Indicates if employee is a veteran.
    string? veteranDescription?;
    # Add Web Time badge number and charge rate and synchronize Web Pay and Web Time employee data.
    StagedemployeeWebtime webTime?;
    # Add employee's work address, phone numbers, and email. Work Location drop down field is not included.
    StagedemployeeWorkaddress[1] workAddress?;
    # Add I-9 work authorization information.
    StagedemployeeWorkeligibility[1] workEligibility?;
};

# The employee info model
public type EmployeeInfo record {
    # Employee Id.<br  /> Max length: 10
    string? employeeId?;
    # Employee current work status. Common values are *A* (Active), *L* (Leave of Absence), *T* (Terminated). <br  />Max length: 20
    string? statusCode?;
    # Employee current work status type. <br  />Max length: 10
    string? statusTypeCode?;
};

# The employee earning model
public type Earning record {
    # Third-party agency associated with earning. Must match Company setup.<br  />Max length: 10
    string? agency?;
    # Value that matches CalculationCode to add to gross wages. For percentage (%), enter whole number (10 = 10%).  <br  />Decimal(12,2)
    decimal? amount?;
    # Year to Date dollar amount not to be exceeded for an earning in the calendar year. Used only with company driven maximums. <br  />Decimal(12,2)
    decimal? annualMaximum?;
    # Defines how earnings are calculated. Common values are *% (percentage of gross), flat (flat dollar amount)*. Defaulted to the Company setup calcCode for earning. <br  />Max length: 20
    string? calculationCode?;
    # Cost Center associated with earning. Must match Company setup.<br  /> Max length: 10
    string? costCenter1?;
    # Cost Center associated with earning. Must match Company setup.<br  /> Max length: 10
    string? costCenter2?;
    # Cost Center associated with earning. Must match Company setup.<br  /> Max length: 10
    string? costCenter3?;
    # Earning code. Must match Company setup. <br  />Max length: 10
    string? earningCode;
    # Date earning is active. Defaulted to run date or check date based on Company setup. Common formats are MM-DD-CCYY, CCYY-MM-DD.
    string? effectiveDate?;
    # Stop date of an earning. Common formats are MM-DD-CCYY, CCYY-MM-DD.
    string? endDate?;
    # Needed if earning is applied differently from the payroll frequency (one time earning for example).<br  /> Max length: 5
    string? frequency?;
    # Dollar amount. The employee earning will stop when the goal amount is reached.<br  /> Decimal(12,2)
    decimal? goal?;
    # The value is used in conjunction with the Rate field. When entering Group Term Life Insurance (GTL), it should contain the full amount of the group term life insurance policy. <br  /> Decimal(12,2)
    decimal? hoursOrUnits?;
    # Used for ACA. If not entered, defaulted to Company earning setup.
    boolean? isSelfInsured?;
    # Job code associated with earnings. Must match Company setup.<br  /> Max length: 20
    string? jobCode?;
    # Information to print on the check stub if agency is set up for this earning. <br  />Max length: 50
    string? miscellaneousInfo?;
    # Amount already paid to employee toward goal. <br  /> Decimal(12,2)
    decimal? paidTowardsGoal?;
    # Maximum amount of the earning on a single paycheck. <br  /> Decimal(12,2)
    decimal? payPeriodMaximum?;
    # Minimum amount of the earning on a single paycheck. <br  /> Decimal(12,2)
    decimal? payPeriodMinimum?;
    # Rate is used in conjunction with the hoursOrUnits field. <br  /> Decimal(12,2)
    decimal? rate?;
    # Rate Code applies to additional pay rates entered for an employee. Must match Company setup. <br  /> Max length: 10
    string? rateCode?;
    # Start date of an earning based on payroll calendar. Common formats are MM-DD-CCYY, CCYY-MM-DD.
    string? startDate;
};

# The Primary Pay Rate model
public type StagedemployeePrimarypayrate record {
    # Employee base rate, used for Hourly employees. <br  />Decimal (12,2)
    decimal? baseRate?;
    # Pay rate change reason.<br  /> Max length: 30
    string? changeReason?;
    # Employee default hours consistently worked. If autoPayType is set to D, employee will be paid hourly base rate for the defaultHours. <br  />Decimal (12,2)
    decimal? defaultHours?;
    # The date the employee's pay rate takes effect. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? effectiveDate?;
    # If set to *True*, employee will be paid automatically using deafultHours.
    boolean? isAutoPay?;
    # Employee current pay frequency. Common values are *A (Annual), B (Bi-Weekly), D (Daily), M (Monthly), S (Semi-Monthly), Q (Quarterly), W (Weekly)*. <br  />Max length: 5
    string? payFrequency?;
    # Employee pay grade. Must match Company setup. <br  /> Max length: 10
    string? payGrade?;
    # Employee pay type (rate code). Valid values are *Hourly* or *Salary*. <br  />Max length: 10
    string? payType?;
    # Employee base rate frequency used with payType Hourly. Common values are *Hour, Week*. Default is Hour. <br  />Max length: 10
    string? ratePer?;
    # Employee gross salary per pay period used with payType Salary.<br  />Decimal (12,2)
    decimal? salary?;
};

# The Main Direct Deposit model
public type StagedemployeeMaindirectdeposit record {
    # Account number, entered without special characters and spaces. <br  />Max length: 17
    string? accountNumber?;
    # Account type. Valid values are *C* (Checking), *S* (Saving), *P* (Pay Card). <br   />Max length: 1
    string? accountType?;
    # Indicates if account will not pre-note.
    boolean? isSkipPreNote?;
    # Date to end the pre-note of the account. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? preNoteDate?;
    # ABA Transit Routing Number, entered without dashes or spaces. <br  />Max length: 9
    string? routingNumber?;
};

# The Add Client Secret Request Model
public type AddClientSecret record {
    # A value sent with the 'ACTION NEEDED: Web Link API Credentials Expiring Soon.' email notification.
    string code;
};

# The error model
public type Error record {
    # The name of the field, or property in the request message that contains an error.
    string 'field?;
    # The error message.
    string message?;
    # A list of options associated with this error. These options may indicate valid values for the field, or property that contains an error.
    ErrorOptions[] options?;
    # The JSON path of the field, or property, that contains an error in the request message.
    string path?;
};

# The Non-Primary State Tax model
public type StagedemployeeNonprimarystatetax record {
    # State tax code.<br  /> Max length: 50
    decimal? amount?;
    # Box 4(b) on form W4 (year 2020 or later): Deductions amount. <br  />Decimal (12,2)
    decimal deductionsAmount?;
    # Box 3 on form W4 (year 2020 or later): Total dependents amount. <br  />Decimal (12,2)
    decimal dependentsAmount?;
    # State tax exemptions value.<br  />Decimal (12,2)
    decimal? exemptions?;
    # State tax exemptions 2 value.<br  />Decimal (12,2)
    decimal? exemptions2?;
    # Employee state tax filing status. Common values are *S* (Single), *M* (Married).<br  />Max length: 50
    string? filingStatus?;
    # Box 2(c) on form W4 (year 2020 or later): Multiple Jobs or Spouse Works. <br  />Boolean
    boolean higherRate?;
    # Box 4(a) on form W4 (year 2020 or later): Other income amount. <br  />Decimal (12,2)
    decimal otherIncomeAmount?;
    # State Tax percentage. <br  />Decimal (12,2)
    decimal? percentage?;
    # Non-primary state tax reciprocity code.<br  /> Max length: 50
    string? reciprocityCode?;
    # Supplemental check calculation code. Common values are *Blocked* (Taxes blocked on Supplemental checks), *Supp* (Use supplemental Tax Rate-Code). <br  />Max length: 10
    string? specialCheckCalc?;
    # Tax calculation code. Common values are *F* (Flat), *P* (Percentage), *FDFP* (Flat Dollar Amount plus Fixed Percentage). <br  />Max length: 10
    string? taxCalculationCode?;
    # State tax code.<br  /> Max length: 50
    string? taxCode?;
    # The state W4 form year <br  />Integer
    int w4FormYear?;
};

# The State Tax model
public type StagedemployeePrimarystatetax record {
    # State tax code.<br  /> Max length: 50
    decimal? amount?;
    # Box 4(b) on form W4 (year 2020 or later): Deductions amount. <br  />Decimal (12,2)
    decimal deductionsAmount?;
    # Box 3 on form W4 (year 2020 or later): Total dependents amount. <br  />Decimal (12,2)
    decimal dependentsAmount?;
    # State tax exemptions value.<br  />Decimal (12,2)
    decimal? exemptions?;
    # State tax exemptions 2 value.<br  />Decimal (12,2)
    decimal? exemptions2?;
    # Employee state tax filing status. Common values are *S* (Single), *M* (Married).<br  />Max length: 50
    string? filingStatus?;
    # Box 2(c) on form W4 (year 2020 or later): Multiple Jobs or Spouse Works. <br  />Boolean
    boolean higherRate?;
    # Box 4(a) on form W4 (year 2020 or later): Other income amount. <br  />Decimal (12,2)
    decimal otherIncomeAmount?;
    # State Tax percentage. <br  />Decimal (12,2)
    decimal? percentage?;
    # Supplemental check calculation code. Common values are *Blocked* (Taxes blocked on Supplemental checks), *Supp* (Use supplemental Tax Rate-Code). <br  />Max length: 10
    string? specialCheckCalc?;
    # Tax calculation code. Common values are *F* (Flat), *P* (Percentage), *FDFP* (Flat Dollar Amount plus Fixed Percentage). <br  />Max length: 10
    string? taxCalculationCode?;
    # State tax code.<br  /> Max length: 50
    string? taxCode?;
    # The state W4 form year <br  />Integer
    int w4FormYear?;
};

# Add or update hourly or salary pay rate, effective date, and pay frequency.
public type EmployeePrimarypayrate record {
    # Employee annual salary.<br />Decimal (12,2)
    decimal? annualSalary?;
    # Employee base rate, used for Hourly employees. <br  />Decimal (12,2)
    decimal? baseRate?;
    # The date of the first check on which the new pay rate will appear. This value is only applicable when updating an existing employee. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? beginCheckDate?;
    # Pay rate change reason.<br  /> Max length: 30
    string? changeReason?;
    # Employee default hours consistently worked. If autoPayType is set to D, employee will be paid hourly base rate for the defaultHours. <br  />Decimal (12,2)
    decimal? defaultHours?;
    # The date the employee's pay rate takes effect. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? effectiveDate?;
    # If set to *True*, employee will be paid automatically using deafultHours.
    boolean? isAutoPay?;
    # Employee current pay frequency. Common values are *A (Annual), B (Bi-Weekly), D (Daily), M (Monthly), S (Semi-Monthly), Q (Quarterly), W (Weekly)*. <br  />Max length: 5
    string? payFrequency?;
    # Employee pay grade. Must match Company setup. <br  /> Max length: 10
    string? payGrade?;
    # Pay rate notes regarding employee.<br  /> Max length: 250
    string? payRateNote?;
    # Employee pay type (rate code). Valid values are *Hourly* or *Salary*. <br  />Max length: 10
    string? payType?;
    # Employee base rate frequency used with payType Hourly. Common values are *Hour, Week*. Default is Hour. <br  />Max length: 10
    string? ratePer?;
    # Employee gross salary per pay period used with payType Salary.<br  />Decimal (12,2)
    decimal? salary?;
};

# Add or update employee's work address, phone numbers, and email. Work Location drop down field is not included.
public type EmployeeWorkaddress record {
    # 1st address line.<br  /> Max length: 40
    string? address1?;
    # 2nd address line. <br  /> Max length: 40
    string? address2?;
    # City.<br  /> Max length: 40
    string? city?;
    # Country.<br  /> Max length: 30
    string? country?;
    # County.<br  /> Max length: 30
    string? county?;
    # Email. <br  />Max length: 50
    string? emailAddress?;
    # Work Location name. <br />Max length: 50
    string? location?;
    # Employee mail stop.<br  /> Max length: 10
    string? mailStop?;
    # Mobile phone number.<br  /> Max length: 12
    string? mobilePhone?;
    # Employee pager number.<br  /> Max length: 20
    string? pager?;
    # Phone number.<br  /> Max length: 12
    string? phone?;
    # Phone number extension.<br  /> Max length: 10
    string? phoneExtension?;
    # Postal code.<br  /> Max length: 10
    string? postalCode?;
    # State or province.<br  /> Max length: 2
    string? state?;
};

# The main Direct Deposit account.
public type DirectdepositMaindirectdeposit record {
    # Account number, entered without special characters and spaces. <br  />Max length: 17
    string? accountNumber?;
    # Account type. Valid values are *C* (Checking), *S* (Saving), *P* (Pay Card). <br   />Max length: 1
    string? accountType?;
    # Indicates if direct deposit should be blocked when special check types such as Bonus are processed.<br />
    boolean? blockSpecial?;
    # Indicates if account will not pre-note.
    boolean? isSkipPreNote?;
    # Name on the bank account. Defaults to employee's name. <br  />Max length: 30<br />
    string? nameOnAccount?;
    # Date to end the pre-note of the account. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? preNoteDate?;
    # ABA Transit Routing Number, entered without dashes or spaces. <br  />Max length: 9
    string? routingNumber?;
};

# The benefit setup model
public type StagedemployeeBenefitsetup record {
    # Benefit Class code. Values are configured in Web Pay Company > Setup > Benefits > Classes.<br  />Max length: 30
    string? benefitClass?;
    # Date when Benefit Class takes effect. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? benefitClassEffectiveDate?;
    # Salary used to configure benefits.<br  />Decimal(12,2)
    decimal? benefitSalary?;
    # Date when Benefit Salary takes effect. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? benefitSalaryEffectiveDate?;
    # Applicable only for ACA Enhanced clients and Benefit Classes with ACA Employment Type of Full Time.
    boolean? doNotApplyAdministrativePeriod?;
    # Only valid for ACA Enhanced clients and Benefit Classes that are ACA Employment Type of Full Time.
    boolean? isMeasureAcaEligibility?;
};

# The Department Position model
public type StagedemployeeDepartmentposition record {
    # Employee department/position change reason. Must match Company setup. <br  />Max length: 15
    string? changeReason?;
    # Employee clock badge number. Defaults to employeeId. <br  />Max length: 10
    string? clockBadgeNumber?;
    # Employer defined location, like *branch, division, department*, etc. Must match Company setup. <br  />Max length: 10
    string? costCenter1?;
    # Employer defined location, like *branch, division, department*, etc. Must match Company setup. <br  />Max length: 10
    string? costCenter2?;
    # Employer defined location, like *branch, division, department*, etc. Must match Company setup. <br  />Max length: 10
    string? costCenter3?;
    # The date the position takes effect. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? effectiveDate?;
    # Employee current employment type. Common values *RFT (Regular Full Time), RPT (Regular Part Time), SNL (Seasonal), TFT (Temporary Full Time), TPT (Temporary Part Time)*. <br  />Max length: 10
    string? employeeType?;
    # Values are configured in Company > Setup > HR > EEO Classes.<br  /> Max length: 10
    string? equalEmploymentOpportunityClass?;
    # Indicates if employee is exempt from minimum wage.
    boolean? isMinimumWageExempt?;
    # Indicates if employee is exempt from overtime.
    boolean? isOvertimeExempt?;
    # Indicates if employee is a supervisor or reviewer.
    boolean? isSupervisorReviewer?;
    # Indicates if union dues are collected.
    boolean? isUnionDuesCollected?;
    # Indicates if initiations fees are collected.
    boolean? isUnionInitiationCollected?;
    # Employee current job title. <br  />Max length: 50
    string? jobTitle?;
    # Employee pay group. Must match Company setup. <br  /> Max length: 20
    string? payGroup?;
    # Employee position code. Must match Company setup.<br  />Max length: 20
    string? positionCode?;
    # Employee work shift.<br  />Max length: 255
    string? shift?;
    # Supervisor's company number. Defaults to employee company number.<br  />Max length: 9
    string? supervisorCompanyNumber?;
    # EmployeeId of the supervisor. <br  />Max length: 10
    string? supervisorEmployeeId?;
    # Indicates if employee receives tips.
    string? tipped?;
    # Employee union affiliation effective date. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.
    string? unionAffiliationDate?;
    # Employee union code. Must match Company setup. <br  />Max length: 10
    string? unionCode?;
    # Employee union position. Must match Company setup. <br  />Max length: 30
    string? unionPosition?;
    # Employee worker compensation code. Must match Company setup.<br  /> Max length: 10
    string? workersCompensation?;
};

# The Client Credentials Response Model
public type ClientCredentialsResponse record {
    # The client's secret
    string? clientSecret?;
    # The client's secret expiration date
    string? clientSecretExpirationDate?;
};

# The additional pay rate model
public type AdditionalRate record {
    # Not required. If populated, must match one of the system coded values available in the Additional Rates Change Reason drop down.<br />
    string? changeReason?;
    # Not required. Valid values must match one of the system coded cost centers available in the Additional Rates Cost Center level 1 drop down. This cell must be in a text format.<br />
    string? costCenter1?;
    # Not required. Valid values must match one of the system coded cost centers available in the Additional Rates Cost Center level 2 drop down. This cell must be in a text format.<br />
    string? costCenter2?;
    # Not required. Valid values must match one of the system coded cost centers available in the Additional Rates Cost Center level 3 drop down. This cell must be in a text format.<br />
    string? costCenter3?;
    # Required. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.<br />
    string? effectiveDate?;
    # Not required. Must match one of the system coded check dates available in the Additional Rates End Check Date drop down. Common formats include *MM-DD-CCYY*, *CCYY-MM-DD*.<br />
    string? endCheckDate?;
    # Not required. If populated, must match one of the system coded values available in the Additional Rates Job drop down.<br />
    string? job?;
    # Required. Enter dollar amount that corresponds to the Per selection.<br />
    decimal? rate?;
    # Required. If populated, must match one of the system coded values available in the Additional Rates Rate Code drop down.<br />
    string? rateCode?;
    # Not required.<br  />Max length: 4000<br />
    string? rateNotes?;
    # Required. Valid values are HOUR or WEEK.<br />
    string? ratePer?;
    # Not required. If populated, must match one of the system coded values available in the Additional Rates Shift drop down.<br />
    string? shift?;
};
