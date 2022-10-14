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

public type ResponseNotFoundMessage record {
    string message?;
    string 'error?;
    string timestamp?;
};

public type PageDTO record {
    CustomerDTO[] content?;
    boolean first?;
    boolean last?;
    int pageNumber?;
    int pageSize?;
    int totalElements?;
    int totalPages?;
};

public type ResponseCreatedMessage record {
    string id?;
    string message?;
    string timestamp?;
};

public type ResponseForbiddenMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type CustomerDTO record {
    int businessSystem?;
    ScriptedOrganizationAddressDTO customerAddress?;
    CustomerSalesAspectDTO[] customerSalesData?;
    boolean deletionIndicator?;
    string externalID?;
    string externalId?;
    string fullName?;
    string name?;
    string supplierID?;
};

public type CustomerSalesAspectDTO record {
    CustomerPartnerRoleDTO[] customerPartnerRole?;
    SalesAreaDTO salesArea?;
};

public type CustomerPartnerRoleDTO record {
    string customerID?;
    string name?;
    string partnerCode?;
    string partnerDescription?;
};

public type SalesAreaDTO record {
    string distributionChannelCode?;
    string salesDivision?;
    string salesOrganizationID?;
};

public type ScriptedOrganizationAddressDTO record {
    string formattedOrgNameLine1?;
    string formattedOrgNameLine2?;
    string formattedOrgNameLine3?;
    string formattedOrgNameLine4?;
};

public type ResponseUnauthorizedMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type ResponseDeleteCurrencyMessage record {
    string message?;
    string timestamp?;
};
