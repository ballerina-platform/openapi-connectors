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

public type AgreementType record {
    boolean canConditionRecordValidityDiffer?;
    string externalConditionTypeTableGroup?;
    boolean isEnhancedProcessingVakeyActive?;
    string externalFinalSettlementOrderType?;
    string language?;
    string externalManualAccrualOrderType?;
    string externalManualPaymentProcedure?;
    string externalMinValueForFinalSettlement?;
    string externalPartialSettlementOrderType?;
    string externalPaymentMethod?;
    boolean canManualAccrualsBePosted?;
    string rebateAgreementType;
    boolean shallManualAccrualsBeReversed?;
    string text?;
};

public type AgreementTextType record {
    string externalId?;
    AgreementTextTypeName[] names?;
};

public type AgreementHeaderDTOIncoming record {
    int additionalValueDays?;
    AgreementAccrualDTOIncoming[] accruals?;
    string description?;
    string externalStatus?;
    AgreementTextDTOOutgoing[] texts?;
    string externalType?;
    string validFrom?;
    string validTo?;
    int businessSystem;
    string externalCustomerId?;
    boolean isMarkedForDeletion?;
    string fixedValueDate?;
    string externalPaymentMethod?;
    string externalPaymentTerms?;
    string promotionExternalID?;
    string reference?;
    SalesArea externalSalesArea?;
    SalesDocument salesHeader;
    boolean isInPrecisionMode?;
};

public type AgreementTextDTOOutgoing record {
    AgreementTextType 'type?;
    string language?;
    string text?;
};

public type AgreementTextTypeName record {
    string text?;
    string language?;
};

public type AgreementAccrualDTOIncoming record {
    string accrualAttributes?;
    string conditionCurrency?;
    string conditionRecordAttributes?;
    string conditionRecordNumber?;
    string conditionTypeExternalId?;
    HierarchyNodeKey customerHierarchyNode?;
    string customerExternalId?;
    string externalKey;
    Amount maxPayOutAmount?;
    Amount openAccrualAmount?;
    Amount paidOutAmount?;
    HierarchyNodeKey productHierarchyNodeLevel1?;
    HierarchyNodeKey productHierarchyNodeLevel2?;
    HierarchyNodeKey productHierarchyNodeLevel3?;
    string externalProductId?;
    Amount rebateAmount?;
    int rebateBaseAmount?;
    string rebateBaseUnit?;
    decimal rebatePercentage?;
    SalesArea externalSalesArea?;
};

public type Amount record {
    decimal amount?;
    string currencyCode?;
};

public type ResponseAgreementDeletionMessage record {
    string externalid?;
    string message?;
    string timestamp?;
};

public type SalesArea record {
    string distributionChannel?;
    string salesDivision?;
    string salesOrganization?;
};

public type ResponseDeleteMessage record {
    string message?;
    string timestamp?;
};

public type ResponseMessage record {
    string _error?;
    string message?;
    string timestamp?;
};

public type HierarchyNodeKey record {
    string hierarchyID?;
    string hierarchyNodeID?;
    string hierarchyTypeCode?;
};

public type ConditionTypeText record {
    string externalConditonTypeId?;
    string text?;
    string language?;
};

public type SalesDocument record {
    string currencyCode?;
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
