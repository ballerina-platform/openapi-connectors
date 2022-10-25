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

public type ErrorModelReference record {
    # A description of the error
    string? 'error;
};

public type OneTimePaymentInput record {
    # One-Time Payment Worktags for REST API
    PayrollWorkTags[]? payrollWorktags?;
    PaymentCurrency? paymentCurrency?;
    # The start date of the Coverage Period for the payment, which enables Workday Payroll or Payroll Integration to associate dates with the one-time payment for Fair Labor Standards Act (FLSA) reporting requirements.
    string? coverageStartDate?;
    # Amount of compensation payment
    record {} paymentAmount?;
    # The end date of the Coverage Period for the payment, which enables Workday Payroll or Payroll Integration to associate dates with the one-time payment for Fair Labor Standards Act (FLSA) reporting requirements.
    string? coverageEndDate?;
    # Additional information for this compensation payment
    string? additionalInformation?;
    # The actual amount for the ~bonus~ payment represented as a percentage.  The percentage is usually calculated as a percentage of base pay, but on the ~bonus~ plan setup it is possible to override the calculation basis to calculate as a percentage of a set of compensation elements.
    int? paymentPercent?;
    OneTimePaymentPlan? oneTimePaymentPlan?;
    # The payment date scheduled for the one-time payment request.
    string? scheduledPaymentDate?;
    # This is true if you selected Send to Payroll on the ~bonus~ payment, future payment, or one-time payment. If false, Workday Payroll doesn't process the payment.
    boolean? sendToPayroll?;
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type CreateScorecardProfiles record {
    # The ~goals~ for the Compensation Scorecard.
    CreateGoals[]? profileScorecardGoals;
    EligibilityRule? eligibilityRule;
    # Id of the instance
    string? id?;
};

public type ScoreCardProfile record {
    EligibilityRule? eligibilityRule?;
    # The goals for the Compensation Scorecard.
    ScorecardGoalSummary[]? profileScorecardGoals?;
    # Id of the instance
    string? id?;
};

public type OneTimePaymentPlanEventInput record {
    Reason? reason?;
    # The date this business process takes effect.
    string? effectiveDate?;
    # Returns the date that a compensation change is visible to a ~worker~.
    string? employeeVisibilityDate?;
    Position? position?;
    # All one-time payments associated with the event.
    OneTimePaymentInput[]? oneTimePayments?;
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type ScoreCardID record {
    *DefaultScoreCard;
};

# collection something or other
public type InlineResponse200 record {
    ScoresetContainer[]? data?;
    int? total?;
};

public type PaymentCurrency record {
    *InstanceModelReference;
};

public type CreateScorecardResults record {
    # The ~goal~ name of the scorecard criteria result.
    string? scorecardName?;
    ScoreCardID? scorecardID;
    # Scorecard Result Evaluation Date
    string? evaluationDate;
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type ScorecardID record {
    *DefaultScoreCard;
};

public type Reason record {
    *InstanceModelReference;
};

public type WorkerProfile record {
    # The primary work email address for the ~worker~.
    string? primaryWorkEmail?;
    # Identifies if the ~worker~ has a ~manager~ role.
    boolean? isManager?;
    # The primary work phone number for the ~worker~ including the area code and ~country~ code.
    string? primaryWorkPhone?;
    Location? location?;
    PrimarySupervisoryOrganization? primarySupervisoryOrganization?;
    # Returns the primary work address for the ~worker~, or from their default primary work location, full format on a single line.
    string? primaryWorkAddressText?;
    # The years of service for the ~worker~.
    int? yearsOfService?;
    # The business title for the ~worker's~ primary position. If no business title is defined for a position, the position title is returned back.
    string? businessTitle?;
    # All ~supervisory organizations~, excluding inherited organizations, in which the ~worker~ has a leadership role.
    string? supervisoryOrganizationsManaged?;
    # The birth date of the ~worker~.
    string? dateOfBirth?;
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type ScorecardGoalSummary record {
    # The weight given to the Compensation Scorecard ~Goal~. [90% will be displayed as 0.9]
    int? goalWeight?;
    # The description of the Compensation Scorecard ~Goal~.
    string? goalDescription?;
    # The name of the Compensation Scorecard ~Goal~.
    string? goalName?;
    # Id of the instance
    string? id?;
};

public type ScoreCardGoals record {
    # Replaces the description of the Compensation Scorecard Goal as of the specified effectiveDate.  Deletes the description if a description exists as of the specified effectiveDate and this field is not included in the PUT.
    string? goalDescription?;
    # Replaces the weight of the Compensation Scorecard ~Goal~ as of the specified effectiveDate.  [Weight should be entered as 0.9 for a goalWeight of 90%]
    int? goalWeight;
    # Replaces the name of the Compensation Scorecard Goal as of the specified effectiveDate.
    string? goalName;
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

public type CreateScoreCard record {
    # The Effective Date of the Compensation Scorecard in format YYYY-MM-DD
    string? effectiveDate;
    # The name of the Compensation Scorecard.
    string? scorecardName;
    # The ~goals~ for the Compensation Scorecard.
    CreateGoals[]? defaultScorecardGoals;
    # The profiles for the Compensation Scorecard.
    CreateScorecardProfiles[]? scorecardProfiles?;
    # Indicates whether the Scorecard is inactive using a value of true/false.
    boolean? inactive?;
    # The description of the Compensation Scorecard.
    string? scorecardDescription?;
    # Id of the instance
    string? id?;
};

public type ValidationErrorModelReference record {
    *ErrorModelReference;
    # An array of validation errors
    ErrorModelReference[]? errors?;
};

public type EligibilityRule record {
    *InstanceModelReference;
};

public type OneTimePaymentPlan record {
    *InstanceModelReference;
};

public type EditScoreCards record {
    # Replaces the inactive status of the Compensation Scorecard as of the specified effectiveDate.  Default value: false.
    boolean? inactive?;
    # The Effective Date of the updates to the Compensation Scorecard.  Date must be entered in format: YYYY-MM-DD.
    string? effectiveDate;
    # Replaces the description of the Compensation Scorecard as of the specified effectiveDate.  Deletes the description if a description exists as of the specified effectiveDate and this field is not included in the PUT.
    string? scorecardDescription?;
    # Replaces the array of Profile Scorecard Goals and Eligibility Rules as of the specified effectiveDate.  Creates a new array if one does not exist.  Deletes the array if one exists as of the specified effectiveDate and the array is not included in the PUT.
    ScorecardProfiles[]? scorecardProfiles?;
    # Replaces the array of Default Scorecard Goal fields as of the specified effectiveDate.
    ScoreCardGoals[]? defaultScorecardGoals;
    # Replaces the name of the Compensation Scorecard as of the specified effectiveDate.
    string? scorecardName;
    # Id of the instance
    string? id?;
};

public type Position record {
    *InstanceModelReference;
};

public type ScoresetContainer record {
    # Returns the Scorecard's Description
    string? scorecardDescription?;
    # The ~goal~ name of the scorecard criteria result.
    string? scorecardName?;
    ScorecardID? scorecardID?;
    # Returns the Scorecard Profiles for a Scorecard Result
    ScoreSet[]? profileScorecardGoalsResult?;
    DefaultScorecardGoalsResult? defaultScorecardGoalsResult?;
    # Scorecard Result Evaluation Date
    string? evaluationDate?;
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

public type PrimarySupervisoryOrganization record {
    *InstanceModelReference;
};

public type ScoreCard record {
    # Indicates whether the Scorecard is inactive using a value of true/false.
    boolean? inactive?;
    # The goals for the Compensation Scorecard.
    ScorecardGoalSummary[]? defaultScorecardGoals?;
    # The description of the Compensation Scorecard.
    string? scorecardDescription?;
    # The profiles for the Compensation Scorecard.
    ScoreCardProfile[]? scorecardProfiles?;
    # The name of the Compensation Scorecard.
    string? scorecardName?;
    # The Effective Date of the Compensation Scorecard in format YYYY-MM-DD.
    string? effectiveDate?;
    # Id of the instance
    string? id?;
};

public type CreateGoals record {
    # The description of the Compensation Scorecard Goal
    string? goalDescription?;
    # The weight given to the Compensation Scorecard Goal. [90% will be displayed as 0.9]
    int? goalWeight;
    # The name of the Compensation Scorecard Goal.
    string? goalName;
    # Id of the instance
    string? id?;
};

public type WorkerSummary record {
    # The primary work phone number for the ~worker~ including the area code and ~country~ code.
    string? primaryWorkPhone?;
    # Identifies if the ~worker~ has a ~manager~ role.
    boolean? isManager?;
    # The primary work email address for the ~worker~.
    string? primaryWorkEmail?;
    # The business title for the ~worker's~ primary position. If no business title is defined for a position, the position title is returned back.
    string? businessTitle?;
    PrimarySupervisoryOrganization? primarySupervisoryOrganization?;
    # A preview of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
};

public type ScoreGoal record {
    # Id of the instance
    string? id?;
};

public type ScorecardProfiles record {
    EligibilityRule? eligibilityRule;
    # Replaces the array of Profile Scorecard Goal fields as of the specified effectiveDate.  Creates a new array if one does not exist.  Deletes the array if one exists as of the specified effectiveDate and the scorecardProfiles array is not included in the PUT.
    ScoreCardGoals[]? profileScorecardGoals;
    # Id of the instance
    string? id?;
};

public type DefaultScoreCard record {
    # Id of the instance
    string? id?;
};

public type ScoresetScore record {
    GoalID? goalID?;
    # The ~goal~ name of the scorecard criteria result.
    string? goalName?;
    # The achievement percentage for the scorecard criteria result.
    int? achievement?;
    # The criteria weighted percentage of the scorecard criteria result.
    int? goalWeight?;
    # Id of the instance
    string? id?;
};

# collection something or other
public type InlineResponse2001 record {
    ScoreCard[]? data?;
    int? total?;
};

public type ScoreInput record {
    # The achievement percentage for the scorecard criteria result.
    int? achievement?;
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type PayrollWorkTags record {
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type ScoreSet record {
    EligibiltyRule? eligibiltyRule?;
    # The set of Performance Scores for a Compensation Scorecard.
    ScoresetScore[]? performanceScores?;
    # Calculates the total Weighted Funding Percent for all the scores in the scorecard result set.
    int? weightedFundingPercent?;
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

# collection something or other
public type InlineResponse2002 record {
    WorkerSummary[]? data?;
    int? total?;
};

public type EligibiltyRule record {
    *InstanceModelReference;
};

public type DefaultScorecardGoalsResult record {
    *ScoreSet;
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

public type Location record {
    *InstanceModelReference;
};

public type GoalID record {
    *ScoreGoal;
};
