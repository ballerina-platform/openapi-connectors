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

public type ExternalCustomerHierarchyNodeKeyVDTO record {
    string customerHierarchyNodeId;
    string customerHierarchyTypeCode;
    string hierarchyId;
};

public type ResponseNotFoundPromotionDeletionMessage record {
    string externalId?;
    string message?;
    ExternalPromotionDTO promotion?;
    string timestamp?;
};

public type ExternalPromotionReferenceDTO record {
    string documentId?;
    string documentType?;
};

public type ResponsePromotionDeleteAllMessage record {
    int count?;
    string message?;
    string timestamp?;
};

public type ResponseMessage record {
    string message?;
    string uri?;
    string timestamp?;
};

public type  InlineResponse400 ResponseInvalidCustomer|ResponseInvalidDate|ResponseInvalidProduct;

public type ResponseUnauthorizedMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type ResponseInvalidCustomer record {
    string message?;
    string uri?;
    string timestamp?;
};

public type ExternalProductHierarchyNodeKeyVDTO record {
    string hierarchyId;
    string productHierarchyNodeId;
    string productHierarchyTypeCode;
};

public type ResponsePromotionDeletionMessage record {
    string externalId?;
    string message?;
    string timestamp?;
};

public type ResponseExternalPromotionListMessage record {
    string message?;
    ExternalPromotionDTO[] promotions?;
    string timestamp?;
};

public type ResponseInvalidDate record {
    int externalId?;
    string message?;
    string timestamp?;
};

public type ResponseNotFoundMessage record {
    string message?;
    string _error?;
    string timestamp?;
};

public type ResponseExternalPromotionMessage record {
    string externalId?;
    string message?;
    int count?;
    ExternalPromotionDTO promotion?;
    string timestamp?;
};

public type PromotionTypeCodeV record {
    string promotionTypeCode?;
};

public type ResponsePromotionCreationMessage record {
    int externalId?;
    string message?;
    string timestamp?;
};

public type ExternalPromotionCustomerVDTO record {
    string customerExternalId?;
    ExternalCustomerHierarchyNodeKeyVDTO customerHierarchyNodeKey?;
};

public type ExternalPromotionDTO record {
    int businessSystem;
    string description?;
    ExternalPromotionReferenceDTO[] documentReferences?;
    string externalId;
    ExternalSalesAreaVDTO externalSalesArea?;
    int id?;
    string internalId?;
    boolean isMarkedForDeletion?;
    ExternalPromotionCustomerVDTO promotionCustomer;
    PromotionDateDTO[] promotionDates;
    ExternalPromotionProductDTO[] promotionProducts;
    string status?;
    PromotionTypeCodeV[] types?;
};

public type ResponseForbiddenMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type ResponseInvalidProduct record {
    string message?;
    string uri?;
    string timestamp?;
};

public type ExternalPromotionProductDTO record {
    string productExternalId;
    ExternalProductHierarchyNodeKeyVDTO productHierarchyNodeKey;
};

public type PromotionDateDTO record {
    string promotionDateTypeCode;
    string validFrom;
    string validTo;
};

public type ResponseNotFoundPromotionMessage record {
    string externalId?;
    string message?;
    ExternalPromotionDTO promotion?;
    string timestamp?;
};

public type ExternalSalesAreaVDTO record {
    string distributionChannel?;
    string salesDivision?;
    string salesOrganization?;
};
