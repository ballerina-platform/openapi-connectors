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

public type SalesDivisionResponseNotFound record {
    int count?;
    ExternalDistributionChannelDTO[] 'distribution\-channels?;
    string message?;
    string timestamp?;
};

public type SalesOrganizationResponseNotFound record {
    int count?;
    ExternalDistributionChannelDTO[] 'distribution\-channels?;
    string message?;
    string timestamp?;
};

public type DistributionChannelResponseNotFound record {
    string message?;
    string externalid?;
    string timestamp?;
};

public type SalesOrganizationResponse record {
    string externalId?;
    string message?;
    ExternalSalesOrganizationDTO 'sales\-organization?;
    string timestamp?;
};

public type SalesAreaResponse record {
    string externalid?;
    string message?;
    ExternalSalesAreaDTO 'sales\-areas?;
    string timestamp?;
};

public type ExternalSalesOrganizationDescriptionDTO record {
    string description?;
    string languageKey?;
};

public type ExternalSalesDivisionDTO record {
    ExternalSalesDivisionDescriptionDTO[] descriptions?;
    string externalId;
};

public type SalesDivisionResponse record {
    string externalid?;
    string message?;
    ExternalSalesDivisionDTO 'sales\-divisions?;
    string timestamp?;
};

public type ExternalDistributionChannelDescriptionDTO record {
    string description?;
    string languageKey?;
};

public type SalesDivisionDeleteResponse record {
    string externalid?;
    string message?;
    string timestamp?;
};

public type ExternalSalesOrganizationDTO record {
    ExternalSalesOrganizationDescriptionDTO[] descriptions?;
    string externalCompanyCodeId?;
    string externalId;
};

public type ExternalDistributionChannelDTO record {
    ExternalDistributionChannelDescriptionDTO[] descriptions?;
    string externalId;
};

public type SalesOrganizationDeleteResponse record {
    string externalid?;
    string message?;
    string timestamp?;
};

public type SalesOrgDeleteResponse record {
    string externalid?;
    string message?;
    string timestamp?;
};

public type ExternalSalesDivisionDescriptionDTO record {
    string description?;
    string languageKey?;
};

public type ResponseMessage record {
    string message?;
    string uri?;
    string timestamp?;
};

public type ResponseUnauthorizedMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type SalesAreaDeleteResponse record {
    string externalid?;
    string message?;
    string timestamp?;
};

public type ResponseNotFoundMessage record {
    string message?;
    string _error?;
    string timestamp?;
};

public type ExternalSalesAreaDTO record {
    ExternalSalesAreaDescriptionDTO[] descriptions?;
    string externalDistributionChannel?;
    string externalId;
    string externalSalesDivision?;
    string externalSalesOrganization?;
};

public type DistributionChannelResponse record {
    ExternalDistributionChannelDTO 'distribution\-channels?;
    string externalid?;
    string message?;
    string timestamp?;
};

public type ExternalSalesAreaDescriptionDTO record {
    string description?;
    string languageKey?;
};

public type SalesAreaResponseNotFound record {
    int count?;
    ExternalDistributionChannelDTO[] 'distribution\-channels?;
    string message?;
    string timestamp?;
};

public type ResponseForbiddenMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type ResponseCreated record {
    string externalId?;
    string message?;
    string timestamp?;
};

public type DistributionChannelDeleteResponse record {
    string message?;
    string externalid?;
    string timestamp?;
};
