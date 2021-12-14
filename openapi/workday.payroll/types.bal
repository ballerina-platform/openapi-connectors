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

public type CompanyInstance record {
    *CompanyDetail;
};

public type RunCategory2 record {
    *InstanceModelReference;
};

public type WorkerDetail record {
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type NextPeriodToProcess record {
    *InstanceModelReference;
};

public type InputLine record {
    Type? 'type?;
    # The value for the input line.
    int? value?;
    # Id of the instance
    string? id?;
};

public type Currency record {
    *InstanceModelReference;
};

public type CountryDataForLocationData record {
    # A preview of the instance
    string? descriptor?;
};

public type JobData record {
    Location? location?;
    # The business title for the position.
    string? businessTitle?;
    Worker? 'worker?;
    SupervisoryOrganization? supervisoryOrganization?;
    # The next pay period start date for the job.
    string? nextPayPeriodStartDate?;
    JobType? jobType?;
    JobProfile? jobProfile?;
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type PayComponentDetail record {
    # The payroll code of the pay component.
    string? code?;
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type ValidationErrorModelReference record {
    *ErrorModelReference;
    # An array of validation errors
    ErrorModelReference[]? errors?;
};

public type PayrollInputView record {
    # The run category for the payroll input.
    RunCategoryDetail[]? runCategories?;
    PayComponent? payComponent?;
    # The text comment for this input.
    string? comment?;
    # The start date before which this input does not apply.
    string? startDate?;
    Currency? currency?;
    # The worktags associated with the payroll input.
    Worktag[]? worktags?;
    # The details for this payroll input.
    InputLine[]? inputDetails?;
    # If true, the payroll input is ongoing.
    boolean? ongoing?;
    Position? position?;
    # The editability status indicating the fields that can be updated in the payroll input request. Possible values: all, none, endDateOnly
    string? fieldEditability?;
    # The end date after which this input does not apply.
    string? endDate?;
    WorkerDc? 'worker?;
    # If true, the input is for an adjustment as opposed to an override.
    boolean? adjustment?;
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type InputInterfaceDetail record {
    # The alternate ID of the related calculation for the pay component and pay component related calculation.
    string? name?;
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type RunCategory record {
    *InstanceModelReference;
};

public type LocationDataJobView record {
    Country? country?;
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type Position record {
    *InstanceModelReference;
};

public type PeriodSchedule record {
    *InstanceModelReference;
};

public type FirstProcessingPeriod record {
    *InstanceModelReference;
};

public type StateDetail record {
    # The Payroll Authority Tax Code for a Payroll Tax Authority.
    string? payrollStateAuthorityTaxCode?;
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type FacetsModelReference FacetsModelReferenceInner[]?;

public type MultipleInstanceModelReference record {
    int? total?;
    InstanceModelReference[]? data?;
};

public type CompanyDetail2 record {
    # Id of the instance
    string? id?;
};

public type JobProfile record {
    *JobProfileJobView;
};

public type CompanyDetail record {
    # The Reference ID to use for lookups within our Workday Web Services. For supervisory organizations, this is also the Organization_ID.
    string? company?;
    # The FEIN for the US company.
    string? fein?;
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type PayComponent record {
    *PayComponentDetail;
};

public type CurrentPeriodInProgress record {
    *InstanceModelReference;
};

public type Country record {
    *CountryDataForLocationData;
};

public type PayRunGroupSimpleViewDetail record {
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type ErrorModelReference record {
    # A description of the error
    string? _error;
};

public type CompanySuiRateDetails record {
    CompanyInstanceDetail? companyInstance;
    StateInstanceDetail? stateInstance;
    # If true, the SUI rate is exempt.
    boolean? exempt?;
    # The start date for company tax reporting.
    string? startDate;
    # The deduction for company tax reporting.
    string? taxCode;
    # The payroll tax authority EIN field for company tax reporting.
    string? ein?;
    # The end date for company tax reporting.
    string? endDate?;
    # The tax override rate for company tax reporting.
    string? applicableRate?;
    # Id of the instance
    string? id?;
};

public type PayGroupDetailMiniViewDetail record {
    RunCategory2? runCategory?;
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type CompanyInstanceDetail record {
    *CompanyDetail2;
};

public type LastPeriodCompleted record {
    *InstanceModelReference;
};

public type WorkerDc record {
    *WorkerDetail;
};

public type SupervisoryOrganizationJobView record {
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

# collection something or other
public type InlineResponse200 record {
    PayGroupViewDetail[]? data?;
    int? total?;
};

public type State2 record {
    # Id of the instance
    string? id?;
};

public type InstanceModelReference record {
    # wid / id / reference id
    string? id;
    # A description of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
};

public type Worker record {
    *WorkerJobView;
};

public type StateInstanceDetail record {
    *State2;
};

public type RunCategoryDetail record {
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type SuiRatesSummary record {
    # Unique identifier for company SUI rate.
    string? id?;
    # The EIN value for the company SUI rate.
    string? ein?;
    # The start date value of the row for company SUI rate.
    string? startDate?;
    # If true, the SUI rate is exempt.
    boolean? exempt?;
    # The end date value of the row for company SUI rate.
    string? endDate?;
    # The EIN type. Valid values: SUI EIN, STATE EIN, FEIN.
    string? einType?;
    # The rate type. Valid values: OR for override rate, DR for default rate.
    string? rateType?;
    # The payroll tax code. As of v1, the default value is W_SUIER.
    string? taxCode?;
    # The applicable rate for the company SUI.
    string? applicableRate?;
    StateInstance? stateInstance?;
    CompanyInstance? companyInstance?;
};

public type PayGroup record {
    *PayGroupSimpleViewDetail;
};

public type WorkerJobView record {
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type PayGroupSimpleViewDetail record {
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type JobTypeData record {
    # A preview of the instance
    string? descriptor?;
};

public type SupervisoryOrganization record {
    *SupervisoryOrganizationJobView;
};

public type Worktag record {
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type JobProfileJobView record {
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type PayGroupDetailView record {
    RunCategory? runCategory?;
    CurrentPeriodInProgress? currentPeriodInProgress?;
    NextPeriodToProcess? nextPeriodToProcess?;
    FirstProcessingPeriod? firstProcessingPeriod?;
    LastPeriodCompleted? lastPeriodCompleted?;
    PeriodSchedule? periodSchedule?;
    # Contains one or more pay groups that are processed or run at the same time.
    PayRunGroupSimpleViewDetail[]? payRunGroup?;
    PayGroup? payGroup?;
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type Type record {
    *InputInterfaceDetail;
};

public type JobType record {
    *JobTypeData;
};

public type PayGroupViewDetail record {
    Country? country?;
    # Contains the pay group detail.
    PayGroupDetailMiniViewDetail[]? payGroupDetails?;
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

# collection something or other
public type InlineResponse2001 record {
    JobData[]? data?;
    int? total?;
};

# collection something or other
public type InlineResponse2003 record {
    PayrollInputView[]? data?;
    int? total?;
};

# collection something or other
public type InlineResponse2002 record {
    PayGroupDetailView[]? data?;
    int? total?;
};

# collection something or other
public type InlineResponse2004 record {
    SuiRatesSummary[]? data?;
    int? total?;
};

# This object represents the possible facets for this resource
public type FacetsModelReferenceInner record {
    # A description of the facet
    string? descriptor?;
    # The alias used to select the facet
    string? facetParameter?;
    # the facet values
    record {
        # The number of instances returned by this facet
        int? count?;
        # wid / id / reference id
        string? id;
        # A description of the facet
        string? descriptor?;
        # A link to the instance
        string? href?;
    }[]? values?;
};

public type StateInstance record {
    *StateDetail;
};

public type Location record {
    *LocationDataJobView;
};
