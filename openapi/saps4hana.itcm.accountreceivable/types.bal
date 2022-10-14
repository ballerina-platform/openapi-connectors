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

public type ReasonCodeDTO record {
    string code?;
    string description?;
    int id?;
    string reasonCodeTradeType?;
};

public type ResidualAccountingDocumentItem4ApiDTO record {
    string accountingDocument?;
    string accountingDocumentItem?;
    string accountingDocumentItemText?;
    decimal amountInTransactionCurrency?;
    string assignmentReference?;
    string clearedAccountingDocument?;
    string clearedAccountingDocumentItem?;
    string clearedDate?;
    string clearedFiscalYear?;
    string clearingAccountingDocument?;
    string clearingDocFiscalYear?;
    string companyCode?;
    string creationDate?;
    string creationTime?;
    string customer?;
    string customerName?;
    string fiscalYear?;
    string invoiceItemReference?;
    string invoiceReference?;
    boolean isOpen?;
    string itemText?;
    string lastChangedDate?;
    string paymentDifferenceReason?;
    string tradeType?;
    string transactionCurrency?;
};

public type ResponseAROpenItemsMessage record {
    string invoiceReference?;
    string message?;
    string timestamp?;
};

public type ReasonCodeMockDTO record {
    string CompanyCode?;
    boolean IsDisputed?;
    string PaymentDifferenceReason?;
    boolean PaytDiffIsChargedToSprtGLAcct?;
    ReasonCodeDescriptionDto[] to_Text?;
};

public type ResidualAccountingDocumentItemDTO record {
    string ACCOUNTINGDOCUMENT?;
    string ACCOUNTINGDOCUMENTITEM?;
    decimal AMOUNTINTRANSACTIONCURRENCY?;
    string ASSIGNMENTREFERENCE?;
    string BILLINGDOCUMENT?;
    int CHANGEDOCUMENTCREATIONDATE?;
    int CHANGEDOCUMENTCREATIONTIME?;
    string CLEAREDACCOUNTINGDOCUMENT?;
    string CLEAREDACCOUNTINGDOCUMENTITEM?;
    string CLEAREDFISCALYEAR?;
    string CLEARINGACCOUNTINGDOCUMENT?;
    int CLEARINGCREATIONDATE?;
    int CLEARINGDATE?;
    string CLEARINGDOCFISCALYEAR?;
    string COMPANYCODE?;
    int CREATIONDATE?;
    int CREATIONTIME?;
    string CUSTOMER?;
    string DEBITCREDITCODE?;
    string FISCALYEAR?;
    string INVOICEITEMREFERENCE?;
    string INVOICEREFERENCE?;
    string INVOICEREFERENCEFISCALYEAR?;
    string ITEMTTEXT?;
    int LASTCHANGEDATE?;
    int OPENITEMCREATIONDATE?;
    int OPENITEMCREATIONTIME?;
    string PAYMENTDIFFERENCEREASON?;
    string TRANSACTIONCURRENCY?;
    int amountInCompanyCodeCurrency?;
    string lastChangeDateTime?;
    string recordScenario?;
    SalesAreaDTO salesArea?;
    string sortedTime?;
};

public type ResponseForbiddenMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type ResponseReasonCodesMessage record {
    string invoiceReference?;
    string message?;
    string timestamp?;
};

public type ReceivedParamDTO record {
    ResidualAccountingDocumentItemDTO[] arOpenItemList?;
    string invoiceReference?;
    SalesAreaDTO salesArea?;
};

public type SalesAreaDTO record {
    string distributionChannelCode?;
    string salesDivision?;
    string salesOrganizationID?;
};

public type ResponseMessage record {
    string 'error?;
    string message?;
    string timestamp?;
    string uri?;
};

public type ReasonCodeDescriptionDto record {
    string Language?;
    string PaymentDifferenceReason?;
    string PaymentDifferenceReasonDesc?;
    string PaymentDifferenceReasonName?;
};
