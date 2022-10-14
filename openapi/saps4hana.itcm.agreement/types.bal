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

import ballerina/constraint;

public type AgreementType record {
    boolean canConditionRecordValidityDiffer?;
    @constraint:String {maxLength: 4}
    string externalConditionTypeTableGroup?;
    boolean isEnhancedProcessingVakeyActive?;
    @constraint:String {maxLength: 4}
    string externalFinalSettlementOrderType?;
    @constraint:String {maxLength: 35}
    string language?;
    @constraint:String {maxLength: 4}
    string externalManualAccrualOrderType?;
    @constraint:String {maxLength: 1}
    string externalManualPaymentProcedure?;
    @constraint:String {maxLength: 1}
    string externalMinValueForFinalSettlement?;
    @constraint:String {maxLength: 4}
    string externalPartialSettlementOrderType?;
    @constraint:String {maxLength: 1}
    string externalPaymentMethod?;
    boolean canManualAccrualsBePosted?;
    @constraint:String {maxLength: 4}
    string rebateAgreementType;
    boolean shallManualAccrualsBeReversed?;
    string text?;
};

public type AgreementTextType record {
    @constraint:String {maxLength: 4}
    string externalId?;
    AgreementTextTypeName[] names?;
};

public type AgreementHeaderDTOIncoming record {
    int additionalValueDays?;
    AgreementAccrualDTOIncoming[] accruals?;
    @constraint:String {maxLength: 240}
    string description?;
    @constraint:String {maxLength: 1}
    string externalStatus?;
    AgreementTextDTOOutgoing[] texts?;
    @constraint:String {maxLength: 4}
    string externalType?;
    string validFrom?;
    string validTo?;
    int businessSystem;
    string externalCustomerId?;
    boolean isMarkedForDeletion = false;
    string fixedValueDate?;
    @constraint:String {maxLength: 1}
    string externalPaymentMethod?;
    @constraint:String {maxLength: 4}
    string externalPaymentTerms?;
    string promotionExternalID?;
    @constraint:String {maxLength: 40}
    string reference?;
    SalesArea externalSalesArea?;
    SalesDocument salesHeader;
    boolean isInPrecisionMode?;
};

public type AgreementTextDTOOutgoing record {
    AgreementTextType 'type?;
    @constraint:String {maxLength: 35}
    string language?;
    string text?;
};

public type AgreementTextTypeName record {
    string text?;
    @constraint:String {maxLength: 35}
    string language?;
};

public type AgreementAccrualDTOIncoming record {
    string accrualAttributes?;
    @constraint:String {maxLength: 3}
    string conditionCurrency?;
    string conditionRecordAttributes?;
    @constraint:String {maxLength: 10}
    string conditionRecordNumber?;
    string conditionTypeExternalId?;
    HierarchyNodeKey customerHierarchyNode?;
    @constraint:String {maxLength: 10}
    string customerExternalId?;
    string externalKey;
    Amount maxPayOutAmount?;
    Amount openAccrualAmount?;
    Amount paidOutAmount?;
    HierarchyNodeKey productHierarchyNodeLevel1?;
    HierarchyNodeKey productHierarchyNodeLevel2?;
    HierarchyNodeKey productHierarchyNodeLevel3?;
    @constraint:String {maxLength: 40}
    string externalProductId?;
    Amount rebateAmount?;
    int rebateBaseAmount?;
    @constraint:String {maxLength: 3}
    string rebateBaseUnit?;
    @constraint:Number {maxValue: 100}
    decimal rebatePercentage?;
    SalesArea externalSalesArea?;
};

public type Amount record {
    decimal amount?;
    @constraint:String {maxLength: 3}
    string currencyCode?;
};

public type ResponseAgreementDeletionMessage record {
    string externalid?;
    string message?;
    string timestamp?;
};

public type SalesArea record {
    @constraint:String {maxLength: 2}
    string distributionChannel?;
    @constraint:String {maxLength: 2}
    string salesDivision?;
    @constraint:String {maxLength: 4}
    string salesOrganization?;
};

public type ResponseDeleteMessage record {
    string message?;
    string timestamp?;
};

public type ResponseMessage record {
    string 'error?;
    string message?;
    string timestamp?;
};

public type HierarchyNodeKey record {
    @constraint:String {maxLength: 20}
    string hierarchyID?;
    @constraint:String {maxLength: 18}
    string hierarchyNodeID?;
    @constraint:String {maxLength: 2}
    string hierarchyTypeCode?;
};

public type ConditionTypeText record {
    @constraint:String {maxLength: 4}
    string externalConditonTypeId?;
    string text?;
    @constraint:String {maxLength: 35}
    string language?;
};

public type SalesDocument record {
    @constraint:String {maxLength: 3}
    string currencyCode?;
    @constraint:String {maxLength: 40}
    string displayID;
};

public type ResponseAgreementMessage record {
    string externalid?;
    string message?;
    string timestamp?;
};

public type ResponseForbiddenMessage record {
    string message?;
    string timestamp?;
    string uri?;
};
