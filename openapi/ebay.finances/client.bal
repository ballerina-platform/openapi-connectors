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

import ballerina/http;
import ballerina/url;
import ballerina/lang.'string;

public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# This API is used to retrieve seller payouts and monetary transaction details related to those payouts.
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    # Client initialization.
    #
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Returns error at failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://apiz.ebay.com/sell/finances/v1") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, {auth: clientConfig.authConfig, secureSocket: secureSocketConfig});
        self.clientEp = httpEp;
    }
    # This method retrieves details on a specific seller payout. The unique identfier of the payout is passed in as a 
    # path parameter at the end of the call URI. The getPayouts method can be used to retrieve the unique identifier of 
    # a payout, or the user can check Seller Hub.
    #
    # + payout_Id - The unique identfier of the payout is passed in as a path parameter at the end of the call URI. The 
    # getPayouts method can be used to retrieve the unique identifier of a payout, or the user can check Seller Hub to get the payout ID.
    # + return - Success
    remote isolated function getPayout(string payout_Id) returns Payout|error {
        string path = string `/payout/${payout_Id}`;
        Payout response = check self.clientEp->get(path, targetType = Payout);
        return response;
    }
    # This method is used to retrieve the details of one or more seller payouts. By using the filter query parameter, 
    # users can retrieve payouts processed within a specific date range, and/or they can retrieve payouts in a specific 
    # state. There are also pagination and sort query parameters that allow users to control the payouts that are returned 
    # in the response. If no payouts match the input criteria, an empty payload is returned.
    #
    # + filter - The three filter types that can be used here are discussed below. If none of these filters are used, 
    # all recent payouts in all states are returned: payoutDate: search for payouts within a specific range of dates. 
    # The date format to use is YYYY-MM-DDTHH:MM:SS.SSSZ. Below is the proper syntax to use if filtering by a date 
    # range: https://apiz.ebay.com/sell/finances/v1/payout?filter=payoutDate:[2018-12-17T00:00:01.000Z..2018-12-24T00:00:01.000Z] 
    # Alternatively, the user could omit the ending date, and the date range would include the starting date and up to 
    # 90 days past that date, or the current date if the starting date is less than 90 days in the past. 
    # lastAttemptedPayoutDate: search for attempted payouts that failed within a specific range of dates. 
    # In order to use this filter, the payoutStatus filter must also be used and its value must be set to 
    # RETRYABLE_FAILED. The date format to use is YYYY-MM-DDTHH:MM:SS.SSSZ. The same syntax used for the payoutDate 
    # filter is also used for the lastAttemptedPayoutDate filter. This filter is only applicable (and will return results) 
    # if one or more seller payouts have failed, but are retryable. payoutStatus: search for payouts in a particular 
    # state. Only one payout state can be specified with this filter. The supported payoutStatus values are as follows: 
    # INITIATED: search for payouts that have been initiated but not processed. SUCCEEDED: search for successful payouts. 
    # RETRYABLE_FAILED: search for payouts that failed, but ones which will be tried again. This value must be used if 
    # filtering by lastAttemptedPayoutDate. TERMINAL_FAILED: search for payouts that failed, and ones that will not be 
    # tried again. REVERSED: search for payouts that were reversed. Below is the proper syntax to use if filtering by 
    # payout status: https://apiz.ebay.com/sell/finances/v1/payout?filter=payoutStatus:{SUCCEEDED} If both the 
    # payoutDate and payoutStatus filters are used, payouts must satisfy both criteria to be returned. For 
    # implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/sell/finances/types/cos:FilterField
    # + sort - By default, payouts or failed payouts that match the input criteria are sorted in ascending order 
    # according to the payout date/last attempted payout date (oldest payouts returned first). To view payouts in 
    # descending order instead (most recent payouts/attempted payouts first), you would include the sort query parameter, 
    # and then set the value of its field parameter to payoutDate or lastAttemptedPayoutDate (if searching for failed, 
    # retrybable payouts). Below is the proper syntax to use if filtering by a payout date range in descending order: 
    # https://apiz.ebay.com/sell/finances/v1/payout?filter=payoutDate:[2018-12-17T00:00:01.000Z..2018-12-24T00:00:01.000Z]&amp;sort=payoutDate Payouts can only be sorted according to payout date, and can not be sorted by payout status. For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/sell/finances/types/cos:SortField
    # + 'limit - The number of payouts to return per page of the result set. Use this parameter in conjunction with 
    # the offset parameter to control the pagination of the output. For example, if offset is set to 10 and limit is set
    # to 10, the method retrieves payouts 11 thru 20 from the result set. Note: This feature employs a zero-based list, 
    # where the first payout in the results set has an offset value of 0. Maximum: 200 Default: 20
    # + offset - This integer value indicates the actual position that the first payout returned on the current page has 
    # in the results set. So, if you wanted to view the 11th payout of the result set, you would set the offset value in 
    # the request to 10. In the request, you can use the offset parameter in conjunction with the limit parameter to 
    # control the pagination of the output. For example, if offset is set to 30 and limit is set to 10, the method 
    # retrieves payouts 31 thru 40 from the resulting collection of payouts. Note: This feature employs a zero-based list, 
    # where the first payout in the results set has an offset value of 0. Default: 0 (zero)
    # + return - Success
    remote isolated function getPayouts(string? filter = (), string? sort = (), string? 'limit = (), string? offset = ()) 
                                        returns Payouts|error {
        string path = string `/payout`;
        map<anydata> queryParam = {"filter": filter, "sort": sort, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        Payouts response = check self.clientEp->get(path, targetType = Payouts);
        return response;
    }
    # This method is used to retrieve cumulative values for payouts in a particular state, or all states. The metadata 
    # in the response includes total payouts, the total number of monetary transactions (sales, refunds, credits) 
    # associated with those payouts, and the total dollar value of all payouts. If the filter query parameter is used 
    # to filter by payout status, only one payout status value may be used. If the filter query parameter is not used 
    # to filter by a specific payout status, cumulative values for payouts in all states are returned. The user can also 
    # use the filter query parameter to specify a date range, and then only payouts that were processed within that date 
    # range are considered.
    #
    # + filter - The two filter types that can be used here are discussed below. One or both of these filter types can 
    # be used. If none of these filters are used, the data returned in the response will reflect payouts, in all states, 
    # processed within the last 90 days. payoutDate: consider payouts processed within a specific range of dates. 
    # The date format to use is YYYY-MM-DDTHH:MM:SS.SSSZ. Below is the proper syntax to use if filtering by a date range: 
    # https://apiz.ebay.com/sell/finances/v1/payout_summary?filter=payoutDate:[2018-12-17T00:00:01.000Z..2018-12-24T00:00:01.000Z] 
    # Alternatively, the user could omit the ending date, and the date range would include the starting date and up to 
    # 90 days past that date, or the current date if the starting date is less than 90 days in the past. payoutStatus: 
    # consider only the payouts in a particular state. Only one payout state can be specified with this filter. 
    # The supported payoutStatus values are as follows: INITIATED: search for payouts that have been initiated but not 
    # processed. SUCCEEDED: consider only successful payouts. RETRYABLE_FAILED: consider only payouts that failed, 
    # but ones which will be tried again. TERMINAL_FAILED: consider only payouts that failed, and ones that will not 
    # be tried again. REVERSED: consider only payouts that were reversed. Below is the proper syntax to use if filtering 
    # by payout status: https://apiz.ebay.com/sell/finances/v1/payout_summary?filter=payoutStatus:{SUCCEEDED} If both 
    # the payoutDate and payoutStatus filters are used, only the payouts that satisfy both criteria are considered in 
    # the results. For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/sell/finances/types/cos:FilterField
    # + return - Success
    remote isolated function getPayoutSummary(string? filter = ()) returns PayoutSummaryResponse|error {
        string path = string `/payout_summary`;
        map<anydata> queryParam = {"filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        PayoutSummaryResponse response = check self.clientEp->get(path, targetType = PayoutSummaryResponse);
        return response;
    }
    # This method allows a seller to retrieve one or monetary transactions. In this case, 'monetary transactions' 
    # include sales orders, buyer refunds, seller credits, buyer-initiated payment disputes, eBay shipping label 
    # purchases, and transfers. There are numerous input filters available for use, including filters to retrieve 
    # specific types of monetary transactions, to retrieve monetary transactions processed within a specific date range, 
    # or to retrieve monetary transactions in a specific state. See the filter field for more information on each filter, 
    # and how each one is used. There are also pagination and sort query parameters that allow users to further control 
    # the monetary transactions that are returned in the response. If no monetary transactions match the input criteria, 
    # an http status code of 204 No Content is returned with no response payload.
    #
    # + filter - Numerous filters are available for the getTransactions method, and these filters are discussed below. 
    # One or more of these filter types can be used. If none of these filters are used, all monetary transactions from 
    # the last 90 days are returned: transactionDate: search for monetary transactions that occurred within a specific 
    # range of dates. Note: All dates must be input using UTC format (YYYY-MM-DDTHH:MM:SS.SSSZ) and should be adjusted 
    # accordingly for the local timezone of the user. Below is the proper syntax to use if filtering by a date range: 
    # https://apiz.ebay.com/sell/finances/v1/transaction?filter=transactionDate:[2018-10-23T00:00:01.000Z..2018-11-09T00:00:01.000Z] 
    # Alternatively, the user could omit the ending date, and the date range would include the starting date and up to 
    # 90 days past that date, or the current date if the starting date is less than 90 days in the past. transactionType: 
    # search for a specific type of monetary transaction. The supported transactionType values are as follows: SALE: a 
    # sales order. REFUND: a refund to the buyer after an order cancellation or return. CREDIT: a credit issued by eBay 
    # to the seller's account. DISPUTE: a monetary transaction associated with a payment dispute between buyer and seller. 
    # NON_SALE_CHARGE: a monetary transaction involving a seller transferring money to eBay for the balance of a charge for 
    # NON_SALE_CHARGE transactions (transactions that contain non-transactional seller fees). These can include a 
    # one-time payment, monthly/yearly subscription fees charged monthly, NRC charges, and fee credits. SHIPPING_LABEL: 
    # a monetary transaction where eBay is billing the seller for an eBay shipping label. Note that the shipping label 
    # functionality will initially only be available to a select number of sellers. TRANSFER: A transfer is a monetary 
    # transaction where eBay is billing the seller for reimbursement of a charge. An example of a transfer is a seller 
    # reimbursing eBay for a buyer refund.Below is the proper syntax to use if filtering by a monetary transaction type: 
    # https://apiz.ebay.com/sell/finances/v1/transaction?filter=transactionType:{SALE} transactionStatus: 
    # this filter type is only applicable for sales orders, and allows the user to filter seller payouts in a particular 
    # state. The supported transactionStatus values are as follows: PAYOUT: this indicates that the proceeds from the 
    # corresponding sales order has been paid out to the seller's account. FUNDS_PROCESSING: this indicates that the 
    # funds for the corresponding monetary transaction are currently being processed. FUNDS_AVAILABLE_FOR_PAYOUT: this 
    # indicates that the proceeds from the corresponding sales order are available for a seller payout, but processing 
    # has not yet begun. FUNDS_ON_HOLD: this indicates that the proceeds from the corresponding sales order are 
    # currently being held by eBay, and are not yet available for a seller payout. COMPLETED: this indicates that the 
    # funds for the corresponding TRANSFER monetary transaction have transferred and the transaction has completed. 
    # FAILED: this indicates the process has failed for the corresponding TRANSFER monetary transaction. Below is the 
    # proper syntax to use if filtering by transaction status: 
    # https://apiz.ebay.com/sell/finances/v1/transaction?filter=transactionStatus:{PAYOUT} buyerUsername: the eBay user 
    # ID of the buyer involved in the monetary transaction. Only monetary transactions involving this buyer are returned. 
    # Below is the proper syntax to use if filtering by a specific eBay buyer: 
    # https://apiz.ebay.com/sell/finances/v1/transaction?filter=buyerUsername:{buyer1234} salesRecordReference: 
    # the unique Selling Manager identifier of the order involved in the monetary transaction. Only monetary transactions 
    # involving this Selling Manager Sales Record ID are returned. Below is the proper syntax to use if filtering by a 
    # specific Selling Manager Sales Record ID: https://apiz.ebay.com/sell/finances/v1/transaction?filter=salesRecordReference:{123} 
    # Note: For all orders originating after February 1, 2020, a value of 0 will be returned in the salesRecordReference 
    # field. So, this filter will only be useful to retrieve orders than occurred before this date. payoutId: the unique 
    # identifier of a seller payout. This value is auto-generated by eBay once the seller payout is set to be processed. 
    # Only monetary transactions involving this Payout ID are returned. Below is the proper syntax to use if filtering 
    # by a specific Payout ID: https://apiz.ebay.com/sell/finances/v1/transaction?filter=payoutId:{5000106638} 
    # transactionId: the unique identifier of a monetary transaction. For a sales order, the orderId filter should be 
    # used instead. Only the monetary transaction defined by the identifier is returned. Note: This filter cannot be 
    # used alone; the transactionType must also be specified when filtering by transaction ID. Below is the proper 
    # syntax to use if filtering by a specific transaction ID: https://apiz.ebay.com/sell/finances/v1/transaction?filter=transactionId:{03-03620-33763}&amp;filter=transactionType:{SALE} orderId: the unique identifier of a sales order. For any other monetary transaction, the transactionId filter should be used instead. Only the sales order defined by the identifier is returned. Below is the proper syntax to use if filtering by a specific order ID: https://apiz.ebay.com/sell/finances/v1/transaction?filter=orderId:{03-03620-33763} For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/sell/finances/types/cos:FilterField
    # + sort - Sorting is not yet available for the getTransactions method. By default, monetary transactions that 
    # match the input criteria are sorted in descending order according to the transaction date. For implementation 
    # help, refer to eBay API documentation at https://developer.ebay.com/api-docs/sell/finances/types/cos:SortField
    # + 'limit - The number of monetary transactions to return per page of the result set. Use this parameter in 
    # conjunction with the offset parameter to control the pagination of the output. For example, if offset is set to 10 
    # and limit is set to 10, the method retrieves monetary transactions 11 thru 20 from the result set. Note: This 
    # feature employs a zero-based list, where the first item in the list has an offset of 0. If an orderId, 
    # transactionId, or payoutId filter is included in the request, any limit value will be ignored. Maximum: 
    # 1000 Default: 20
    # + offset - This integer value indicates the actual position that the first monetary transaction returned on the 
    # current page has in the results set. So, if you wanted to view the 11th monetary transaction of the result set, 
    # you would set the offset value in the request to 10. In the request, you can use the offset parameter in 
    # conjunction with the limit parameter to control the pagination of the output. For example, if offset is set to 
    # 30 and limit is set to 10, the method retrieves transactions 31 thru 40 from the resulting collection of 
    # transactions. Note: This feature employs a zero-based list, where the first item in the list has an offset of 0. 
    # Default: 0 (zero)
    # + return - Success
    remote isolated function getTransactions(string? filter = (), string? sort = (), string? 'limit = (), string? offset = ()) returns Transactions|error {
        string path = string `/transaction`;
        map<anydata> queryParam = {"filter": filter, "sort": sort, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        Transactions response = check self.clientEp->get(path, targetType = Transactions);
        return response;
    }
    # This method is used to retrieve cumulative values for five types of monetary transactions (order sales, seller 
    # credits, buyer refunds, buyer-initiated payment disputes, eBay shipping label purchases, and transfers). 
    # If applicable, the number of payment holds and the amount of the holds are also returned. See the description 
    # for the filter query parameter for more information on the available filters. Note: Unless the transactionType 
    # filter is used to retrieve a specific type of monetary transaction (sale, buyer refund, seller credit, payment 
    # dispute, shipping label, transfer), the creditCount and creditAmount response fields account for both order sales 
    # and seller credits (the count and value is not distinguished between the two monetary transaction types).
    #
    # + filter - Numerous filters are available for the getTransactionSummary method, and these filters are discussed 
    # below. One or more of these filter types can be used. The transactionStatus filter must be used. All other filters 
    # are optional. transactionStatus: the data returned in the response pertains to the sales, payouts, and transfer 
    # status set. The supported transactionStatus values are as follows: PAYOUT: only consider monetary transactions 
    # where the proceeds from the sales order(s) have been paid out to the seller's bank account. FUNDS_PROCESSING: 
    # only consider monetary transactions where the proceeds from the sales order(s) are currently being processed. 
    # FUNDS_AVAILABLE_FOR_PAYOUT: only consider monetary transactions where the proceeds from the sales order(s) are 
    # available for a seller payout, but processing has not yet begun. FUNDS_ON_HOLD: only consider monetary 
    # transactions where the proceeds from the sales order(s) are currently being held by eBay, and are not yet 
    # available for a seller payout. COMPLETED: this indicates that the funds for the corresponding TRANSFER monetary 
    # transaction have transferred and the transaction has completed. FAILED: this indicates the process has failed for 
    # the corresponding TRANSFER monetary transaction. Below is the proper syntax to use when setting up the 
    # transactionStatus filter: https://apiz.ebay.com/sell/finances/v1/transaction_summary?filter=transactionStatus:{PAYOUT} 
    # transactionDate: only consider monetary transactions that occurred within a specific range of dates. Note: All 
    # dates must be input using UTC format (YYYY-MM-DDTHH:MM:SS.SSSZ) and should be adjusted accordingly for the local 
    # timezone of the user. Below is the proper syntax to use if filtering by a date range: 
    # https://apiz.ebay.com/sell/finances/v1/transaction_summary?filter=transactionDate:[2018-10-23T00:00:01.000Z..2018-11-09T00:00:01.000Z] 
    # Alternatively, the user could omit the ending date, and the date range would include the starting date and up to 90 
    # days past that date, or the current date if the starting date is less than 90 days in the past. transactionType: 
    # only consider a specific type of monetary transaction. The supported transactionType values are as follows: SALE: 
    # a sales order. REFUND: a refund to the buyer after an order cancellation or return. CREDIT: a credit issued by 
    # eBay to the seller's account. DISPUTE: a monetary transaction associated with a payment dispute between buyer and 
    # seller. NON_SALE_CHARGE: a monetary transaction involving a seller transferring money to eBay for the balance of a 
    # charge for NON_SALE_CHARGE transactions (transactions that contain non-transactional seller fees). These can 
    # include a one-time payment, monthly/yearly subscription fees charged monthly, NRC charges, and fee credits. 
    # SHIPPING_LABEL: a monetary transaction where eBay is billing the seller for an eBay shipping label. Note that the 
    # shipping label functionality will initially only be available to a select number of sellers. TRANSFER: A transfer 
    # is a monetary transaction where eBay is billing the seller for reimbursement of a charge. An example of a transfer 
    # is a seller reimbursing eBay for a buyer refund.Below is the proper syntax to use if filtering by a monetary 
    # transaction type: https://apiz.ebay.com/sell/finances/v1/transaction_summary?filter=transactionType:{SALE} 
    # buyerUsername: only consider monetary transactions involving a specific buyer (specified with the buyer's eBay user ID). 
    # Below is the proper syntax to use if filtering by a specific eBay buyer: 
    # https://apiz.ebay.com/sell/finances/v1/transaction_summary?filter=buyerUsername:{buyer1234} salesRecordReference: 
    # only consider monetary transactions corresponding to a specific order (identified with a Selling Manager order identifier). 
    # Below is the proper syntax to use if filtering by a specific Selling Manager Sales Record ID: 
    # https://apiz.ebay.com/sell/finances/v1/transaction_summary?filter=salesRecordReference:{123} Note: For all 
    # orders originating after February 1, 2020, a value of 0 will be returned in the salesRecordReference field. 
    # So, this filter will only be useful to retrieve orders than occurred before this date. payoutId: only consider 
    # monetary transactions related to a specific seller payout (identified with a Payout ID). This value is 
    # auto-generated by eBay once the seller payout is set to be processed. Below is the proper syntax to use if 
    # filtering by a specific Payout ID: https://apiz.ebay.com/sell/finances/v1/transaction_summary?filter=payoutId:{5000106638} 
    # transactionId: the unique identifier of a monetary transaction. For a sales order, the orderId filter should be 
    # used instead. Only the monetary transaction(s) associated with this transactionId value are returned. Note: 
    # This filter cannot be used alone; the transactionType must also be specified when filtering by transaction ID. 
    # Below is the proper syntax to use if filtering by a specific transaction ID: 
    # https://apiz.ebay.com/sell/finances/v1/transaction_summary?filter=transactionId:{03-03620-33763}&amp;filter=transactionType:{SALE} 
    # orderId: the unique identifier of a sales order. For any other monetary transaction, the transactionId filter 
    # should be used instead. Only the monetary transaction(s) associated with this orderId value are returned. 
    # Below is the proper syntax to use if filtering by a specific order ID: 
    # https://apiz.ebay.com/sell/finances/v1/transaction_summary?filter=orderId:{03-03620-33763} For implementation help, 
    # refer to eBay API documentation at https://developer.ebay.com/api-docs/sell/finances/types/cos:FilterField
    # + return - Success
    remote isolated function getTransactionSummary(string? filter = ()) returns TransactionSummaryResponse|error {
        string path = string `/transaction_summary`;
        map<anydata> queryParam = {"filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        TransactionSummaryResponse response = check self.clientEp->get(path, targetType = TransactionSummaryResponse);
        return response;
    }
    # This method retrieves detailed information regarding a TRANSFER transaction type. A TRANSFER is a monetary 
    # transaction type that involves a seller transferring money to eBay for reimbursement of one or more charges. 
    # For example, when a seller reimburses eBay for a buyer refund. If an ID is passed into the URI that is an 
    # identifier for another transaction type, this call will return an http status code of 404 Not found.
    #
    # + transfer_Id - The unique identifier of the TRANSFER transaction type you wish to retrieve.
    # + return - Success.
    remote isolated function getTransfer(string transfer_Id) returns Transfer|error {
        string path = string `/transfer/${transfer_Id}`;
        Transfer response = check self.clientEp->get(path, targetType = Transfer);
        return response;
    }
    # This method retrieves all pending funds that have not yet been distibuted through a seller payout. 
    # There are no input parameters for this method. The response payload includes available funds, funds 
    # being processed, funds on hold, and also an aggregate count of all three of these categories. If there are 
    # no funds that are pending, on hold, or being processed for the seller's account, no response payload is returned, 
    # and an http status code of 204 - No Content is returned instead.
    #
    # + return - Success
    remote isolated function getSellerFundsSummary() returns SellerFundsSummaryResponse|error {
        string path = string `/seller_funds_summary`;
        SellerFundsSummaryResponse response = check self.clientEp->get(path, targetType = SellerFundsSummaryResponse);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function getPathForQueryParam(map<anydata> queryParam) returns string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach var [key, value] in queryParam.entries() {
        if value is () {
            _ = queryParam.remove(key);
        } else {
            if string:startsWith(key, "'") {
                param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if value is string {
                string updateV = check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length() - 1);
    if param.length() == 1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
