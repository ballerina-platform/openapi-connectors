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

# This type provides details about the seller's account that received (or is scheduled to receive) a payout.
public type PayoutInstrument record {
    # This string value is the last four digits of the seller's account number.
    string accountLastFourDigits?;
    # This string value indicates the type of account that received the payout. At this time, seller payouts can only be distributed to bank acounts, so the string value returned in this field will always be BankAccount.
    string instrumentType?;
    # This string value is a seller-provided nickname that the seller uses to represent the bank account.
    string nickname?;
};

# This type is the base response type of the getTransactionSummary method, and based on the filters that are used in the getTransactionSummary call URI, the response may include total count and amount of the seller's sales and credits, total count and amount of buyer refunds, and total count and amount of seller payment holds.
public type TransactionSummaryResponse record {
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount adjustmentAmount?;
    # The credit debit sign indicator for adjustment. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/finances/types/pay:BookingEntryEnum'>eBay API documentation</a>
    string adjustmentBookingEntry?;
    # Total adjustment count for given payee within a specified period.
    int adjustmentCount?;
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount balanceTransferAmount?;
    # The credit debit sign indicator for the balance transfer. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/finances/types/pay:BookingEntryEnum'>eBay API documentation</a>
    string balanceTransferBookingEntry?;
    # The total balance transfer count for given payee within the specified period.
    int balanceTransferCount?;
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount creditAmount?;
    # The enumeration value indicates whether the dollar amount in the creditAmount field is a charge (debit) to the seller or a credit. Typically, the enumeration value returned here will be CREDIT. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/finances/types/pay:BookingEntryEnum'>eBay API documentation</a>
    string creditBookingEntry?;
    # This integer value indicates the total number of the seller's sales and/or credits that match the input criteria. Note: Unless the transactionType filter is used in the request to retrieve a specific type of monetary transaction (sale, buyer refund, or seller credit), the creditCount and creditAmount fields account for both order sales and seller credits (the count and value is not distinguished between the two monetary transaction types). This field is generally returned, even if 0, but it will not be returned if a transactionType filter is used, and its value is set to either REFUND, DISPUTE, or SHIPPING_LABEL.
    int creditCount?;
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount disputeAmount?;
    # The enumeration value indicates whether the dollar amount in the disputeAmount field is a charge (debit) to the seller or a credit. Typically, the enumeration value returned here will be DEBIT, but its possible that CREDIT could be returned if the seller contested one or more payment disputes and won the dispute. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/finances/types/pay:BookingEntryEnum'>eBay API documentation</a>
    string disputeBookingEntry?;
    # This integer value indicates the total number of payment disputes that have been initiated by one or more buyers. Only the orders that match the input criteria are considered. The Payment Disputes methods in the Fulfillment API can be used by the seller to retrieve more information about any payment disputes. This field is generally returned, even if 0, but it will not be returned if a transactionType filter is used, and its value is set to any value other than DISPUTE.
    int disputeCount?;
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount nonSaleChargeAmount?;
    # The credit/debit sign indicator for the non-sale charge. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/finances/types/pay:BookingEntryEnum'>eBay API documentation</a>
    string nonSaleChargeBookingEntry?;
    # The total non-sale charge count for given payee within a specified period.
    int nonSaleChargeCount?;
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount onHoldAmount?;
    # The enumeration value indicates whether the dollar amount in the onHoldAmount field is a charge (debit) to the seller or a credit. Typically, the enumeration value returned here will be CREDIT, since on-hold funds should eventually be released as part of a payout to the seller once the hold is cleared. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/finances/types/pay:BookingEntryEnum'>eBay API documentation</a>
    string onHoldBookingEntry?;
    # This integer value indicates the total number of order sales where the associated funds are on hold. Only the orders that match the input criteria are considered. This field is generally returned, even if 0, but it will not be returned if a transactionStatus filter is used, and its value is set to any value other than FUNDS_ON_HOLD.
    int onHoldCount?;
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount refundAmount?;
    # The enumeration value indicates whether the dollar amount in the refundAmount field is a charge (debit) to the seller or a credit. Typically, the enumeration value returned here will be DEBIT since this a refund from the seller to the buyer. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/finances/types/pay:BookingEntryEnum'>eBay API documentation</a>
    string refundBookingEntry?;
    # This integer value indicates the total number of buyer refunds that match the input criteria. This field is generally returned, even if 0, but it will not be returned if a transactionType filter is used, and its value is set to any value other than REFUND.
    int refundCount?;
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount shippingLabelAmount?;
    # The enumeration value indicates whether the dollar amount in the shippingLabelAmount field is a charge (debit) to the seller or a credit. Typically, the enumeration value returned here will be DEBIT, as eBay will charge the seller when eBay shipping labels are purchased, but it can be CREDIT if the seller was refunded for a shipping label or was possibly overcharged for a shipping label. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/finances/types/pay:BookingEntryEnum'>eBay API documentation</a>
    string shippingLabelBookingEntry?;
    # This is the total number of eBay shipping labels purchased by the seller. The count returned here may depend on the specified input criteria.
    int shippingLabelCount?;
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount transferAmount?;
    # The enumeration value indicates whether the dollar amount in the transferAmount field is a charge (debit) to the seller or a credit. Typically, the enumeration value returned here will be DEBIT since this a seller reimbursement to eBay for buyer refunds. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/finances/types/pay:BookingEntryEnum'>eBay API documentation</a>
    string transferBookingEntry?;
    # This integer value indicates the total number of buyer refund transfers that match the input criteria. This field is generally returned, even if 0, but it will not be returned if a transactionType filter is used, and its value is set to any value other than TRANSFER.
    int transferCount?;
};

# This type is used by the response payload of the getSellerFundsSummary method. All of the funds returned in getSellerFundsSummary are funds that have not yet been paid to the seller through a seller payout. If there are no funds that are pending, on hold, or being processed for the seller's account, no response payload is returned, and an http status code of 204 - No Content is returned instead.
public type SellerFundsSummaryResponse record {
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount availableFunds?;
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount fundsOnHold?;
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount processingFunds?;
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount totalFunds?;
};

# This field is returned for NON_SALE_CHARGE transactions that contain non-transactional seller fees.
public type Reference record {
    # The identifier of the transaction as specified by the referenceType. For example, with a referenceType of item_id, the referenceId refers to a unique item. This item may have several NON_SALE_CHARGE transactions.
    string referenceId?;
    # An enumeration value that identifies the reference type associated with the referenceId. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/finances/types/pay:ReferenceTypeEnum'>eBay API documentation</a>
    string referenceType?;
};

# This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
public type Amount record {
    # A three-letter ISO 4217 code that indicates the currency of the amount in the value field. This field is always returned with any container using Amount type. Default: The currency of the authenticated user's country. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/finances/types/ba:CurrencyCodeEnum'>eBay API documentation</a>
    string currency?;
    # The three-letter ISO 4217 code representing the currency of the amount in the convertedFromValue field. This value is the pre-conversion currency. This field is only returned if/when currency conversion was applied by eBay. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/finances/types/ba:CurrencyCodeEnum'>eBay API documentation</a>
    string convertedFromCurrency?;
    # The monetary amount before any conversion is performed, in the currency specified by the convertedFromCurrency field. This value is the pre-conversion amount. The value field contains the converted amount of this value, in the currency specified by the currency field. This field is only returned if/when currency conversion was applied by eBay.
    string convertedFromValue?;
    # The exchange rate used for the monetary conversion. This field shows the exchange rate used to convert the dollar value in the value field from the dollar value in the convertedFromValue field. This field is only returned when eBay does a currency version, and a currency conversion is generally needed if the buyer is viewing, or has purchased an item on an international site. This field is only returned if/when currency conversion was applied by eBay.
    string exchangeRate?;
    # The monetary amount, in the currency specified by the currency field. This field is always returned with any container using Amount type.
    string value?;
};

# This type is used by the balanceAdjustment container, which shows the seller payout balance that will be applied toward the charges outlined in the charges array.
public type BalanceAdjustment record {
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount adjustmentAmount?;
    # The enumeration value returned here indicates if the charge is a DEBIT or a CREDIT to the seller. Generally, all transfer transaction types are going to be DEBIT, since the money is being tranferred from the seller to eBay. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/finances/types/pay:BookingEntryEnum'>eBay API documentation</a>
    string adjustmentType?;
};

# This type is used to display fees that are automatically deducted from seller payouts.
public type Fee record {
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount amount?;
    # A description of the fee that was deducted from the seller payout.
    string feeMemo?;
    # The enumeration value returned here indicates the type of fee that was deducted from the seller payout. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/finances/types/api:FeeTypeEnum'>eBay API documentation</a>
    string feeType?;
};

# This type is used by the charge container, which is an array of one or more charges related to the transfer.
public type Charge record {
    # The unique identifier of an order cancellation. This field is only applicable and returned if the charge is related to an order cancellation.
    string cancellationId?;
    # The unique identifier of a case filed against an order. This field is only applicable and returned if the charge is related to a case filed against an order.
    string caseId?;
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount chargeNetAmount?;
    # The unique identifier of an Item Not Received (INR) inquiry filed against an order. This field is only applicable and returned if the charge is related to has an INR inquiry filed against the order.
    string inquiryId?;
    # The unique identifier of the order that is associated with the charge.
    string orderId?;
    # The unique identifier of a third-party payment dispute filed against an order. This occurs when the buyer files a dispute against the order with their payment provider, and then the dispute comes into eBay's system. This field is only applicable and returned if the charge is related to a third-party payment dispute filed against an order.
    string paymentDisputeId?;
    # The unique identifier of a buyer refund associated with the charge.
    string refundId?;
    # The unique identifier of an order return. This field is only applicable and returned if the charge is related to an order that was returned by the buyer.
    string returnId?;
};

# This type defines the fields that can be returned in an error.
public type Error record {
    # Identifies the type of erro.
    string category?;
    # Name for the primary system where the error occurred. This is relevant for application errors.
    string domain?;
    # A unique number to identify the error.
    int errorId?;
    # An array of request elements most closely associated to the error.
    string[] inputRefIds?;
    # A more detailed explanation of the error.
    string longMessage?;
    # Information on how to correct the problem, in the end user's terms and language where applicable.
    string message?;
    # An array of request elements most closely associated to the error.
    string[] outputRefIds?;
    # An array of name/value pairs that describe details the error condition. These are useful when multiple errors are returned.
    ErrorParameter[] parameters?;
    # Further helps indicate which subsystem the error is coming from. System subcategories include: Initialization, Serialization, Security, Monitoring, Rate Limiting, etc.
    string subdomain?;
};

# This type is used to express details about the buyer associated with an order. At this time, the only field in this type is the eBay user ID of the buyer, but more fields may get added at a later date.
public type Buyer record {
    # The eBay user ID of the order's buyer.
    string username?;
};

public type ErrorParameter record {
    # The object of the error.
    string name?;
    # The value of the object.
    string value?;
};

# This is the base response type of the getTransactions method. The getTransactions response includes details on one or more monetary transactions that match the input criteria, as well as pagination data.
public type Transactions record {
    # The URI of the getTransactions method request that produced the current page of the result set.
    string href?;
    # The maximum number of monetary transactions that may be returned per page of the result set. The limit value can be passed in as a query parameter, or if omitted, its value defaults to 20. Note: If this is the last or only page of the result set, the page may contain fewer monetary transactions than the limit value. To determine the number of pages in a result set, divide the total value (total number of monetary transactions matching input criteria) by this limit value, and then round up to the next integer. For example, if the total value was 120 (120 total monetary transactions) and the limit value was 50 (show 50 monetary transactions per page), the total number of pages in the result set is three, so the seller would have to make three separate getTransactions calls to view all monetary transactions matching the input criteria. Maximum: 200 Default: 20
    int 'limit?;
    # The getTransactions method URI to use if you wish to view the next page of the result set. This field is only returned if there is a next page of results to view based on the current input criteria.
    string next?;
    # This integer value indicates the actual position that the first monetary transaction returned on the current page has in the results set. So, if you wanted to view the 11th monetary transaction of the result set, you would set the offset value in the request to 10. In the request, you can use the offset parameter in conjunction with the limit parameter to control the pagination of the output. For example, if offset is set to 30 and limit is set to 10, the method retrieves monetary transactions 31 thru 40 from the resulting collection of monetary transactions. Note: This feature employs a zero-based list, where the first item in the list has an offset of 0. Default: 0 (zero)
    int offset?;
    # The getTransactions method URI to use if you wish to view the previous page of the result set. This field is only returned if there is a previous page of results to view based on the current input criteria.
    string prev?;
    # This integer value is the total amount of monetary transactions in the result set based on the current input criteria. Based on the total number of monetary transactions that match the criteria, and on the limit and offset values, there may be additional pages in the results set.
    int total?;
    # An array of one or more monetary transactions that match the input criteria. Details for each monetary transaction may include the unique identifier of the order associated with the monetary transaction, the status of the transaction, the amount of the order, the order's buyer, and the unique identifier of the payout (if a payout has been initiated/issued for the order).
    Transaction[] transactions?;
};

# This type is used to express the details of one of the following monetary transactions: a buyer's payment for an order, a refund to the buyer for a returned item or cancelled order, or a credit issued by eBay to the seller's account.
public type Transaction record {
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount amount?;
    # The enumeration value returned in this field indicates if the monetary transaction amount is a (CREDIT) or a (DEBIT) to the seller's account. Typically, the SALE and CREDIT transaction types are credits to the seller's account, and the REFUND, DISPUTE, SHIPPING_LABEL, and TRANSFER transaction types are debits to the seller's account. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/finances/types/pay:BookingEntryEnum'>eBay API documentation</a>
    string bookingEntry?;
    # This type is used to express details about the buyer associated with an order. At this time, the only field in this type is the eBay user ID of the buyer, but more fields may get added at a later date.
    Buyer buyer?;
    # The type of fee. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/finances/types/api:FeeTypeEnum'>eBay API documentation</a>
    string feeType?;
    # The unique identifier of the eBay order associated with the monetary transaction.
    string orderId?;
    # This array shows the fees that are deducted from a seller payout for each line item in an order.
    OrderLineItem[] orderLineItems?;
    # This string value indicates the entity that is processing the payment.
    string paymentsEntity?;
    # The unique identifier of the seller payout associated with the monetary transaction. This identifier is generated once eBay begins processing the payout for the corresponding order. This field will not be returned if eBay has not yet begun processing the payout for an order.
    string payoutId?;
    # This field contains reference information for the transaction fee. This includes an ID and the type of ID provided (such as item ID).
    Reference[] references?;
    # The Sales Record Number associated with a sales order. Sales Record Numbers are Selling Manager/Selling Manager Pro identifiers that are created at order checkout. Note: For all orders originating after February 1, 2020, a value of 0 will be returned in this field. The Sales Record Number field has also been removed from Seller Hub. Instead of salesRecordReference, depend on orderId instead as the identifier of the order. The salesRecordReference field has been scheduled for deprecation, and a date for when this field will no longer be returned at all will be announced soon.
    string salesRecordReference?;
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount totalFeeBasisAmount?;
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount totalFeeAmount?;
    # This timestamp indicates when the monetary transaction (order purchase, buyer refund, seller credit) occurred. The following (UTC) format is used: YYYY-MM-DDTHH:MM:SS.SSSZ. For example, 2015-08-04T19:09:02.768Z.
    string transactionDate?;
    # The unique identifier of the monetary transaction. A monetary transaction can be a sales order, an order refund to the buyer, a credit to the seller's account, a debit to the seller for the purchase of a shipping label, or a transaction where eBay recouped money from the seller if the seller lost a buyer-initiated payment dispute.
    string transactionId?;
    # This field provides more details on shipping label transactions and transactions where the funds are being held by eBay. For shipping label transactions, the transactionMemo gives details about a purchase, a refund, or a price adjustment to the cost of the shipping label. For on-hold transactions, the transactionMemo provides information on the reason for the hold or when the hold will be released (e.g., &quot;Funds on hold. Estimated release on Jun 1&quot;). This field is only returned if applicable/available.
    string transactionMemo?;
    # This enumeration value indicates the current status of the seller payout associated with the monetary transaction. See the TransactionStatusEnum type for more information on the different states. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/finances/types/pay:TransactionStatusEnum'>eBay API documentation</a>
    string transactionStatus?;
    # This enumeration value indicates whether the monetary transaction is a buyer's payment for an order, a refund to the buyer for a returned item or cancelled order, a credit issued by eBay to the seller's account, a payment dispute between the buyer and seller, or where eBay is billing the seller for an eBay shipping label or another charge (such as a refund to a buyer). Note that the shipping label functionality will initially only be available to a select number of sellers. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/finances/types/pay:TransactionTypeEnum'>eBay API documentation</a>
    string transactionType?;
};

# This type is used to express the details of one seller payout that is returned with the getPayout or getPayouts methods.
public type Payout record {
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount amount?;
    # This field contains additional information provided by the bank and passed on by the payment processor; e.g., the manner in which the transaction will appear on the seller's bank statement. The field is returned only when provided by the bank and processor.
    string bankReference?;
    # This timestamp indicates the date/time when eBay last attempted to process a seller payout but it failed. This field is only returned if a seller payout fails, and the payoutStatus value shows RETRYABLE_FAILED or TERMINAL_FAILED. A seller can filter on the lastAttemptedPayoutDate in a getPayouts request.
    string lastAttemptedPayoutDate?;
    # This timestamp indicates when the seller payout began processing. The following format is used: YYYY-MM-DDTHH:MM:SS.SSSZ. For example, 2015-08-04T19:09:02.768Z. This field is still returned even if the payout was pending but failed (payoutStatus value shows RETRYABLE_FAILED or TERMINAL_FAILED).
    string payoutDate?;
    # The unique identifier of the seller payout. This identifier is generated once eBay begins processing the payout to the seller's bank account.
    string payoutId?;
    # This field contains information provided by upstream components, based on internal and external commitments. A typical message would contain the expected arrival time of the payout.
    string payoutMemo?;
    # This type provides details about the seller's account that received (or is scheduled to receive) a payout.
    PayoutInstrument payoutInstrument?;
    # This enumeration value indicates the current status of the seller payout. For a successful payout, the value returned will be SUCCEEDED. See the PayoutStatusEnum type for more details on each payout status value. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/finances/types/pay:PayoutStatusEnum'>eBay API documentation</a>
    string payoutStatus?;
    # This field provides more details about the current status of payout. The description returned here will correspond with enumeration value returned in the payoutStatus field. The following shows what description text might appear based on the different payoutStatus values: INITIATED: Preparing to send SUCCEEDED: Funds sent REVERSED: Waiting to retry : Money rejected by seller's bank RETRYABLE_FAILED: Waiting to retry TERMINAL_FAILED: Payout failed
    string payoutStatusDescription?;
    # This integer value indicates the number of monetary transactions (all orders, refunds, and credits, etc.) that have occurred with the corresponding payout. Its value should always be at least 1, since there is at least one order per seller payout.
    int transactionCount?;
};

# This type is the base response type of the getPayoutSummary method, and contains the total count of seller payouts (that match the input criteria), the total count of monetary transactions (order payment, buyer refunds, or seller credits) associated with those payouts, and the total value of those seller payouts.
public type PayoutSummaryResponse record {
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount amount?;
    # This integer value indicates the total count of payouts to the seller that match the input criteria. This field is always returned, even if there are no payouts that match the input criteria (its value will show 0).
    int payoutCount?;
    # This integer value indicates the total count of monetary transactions (order payments, buyer refunds, and seller credits) associated with the payouts that match the input criteria. This field is always returned, even if there are no payouts that match the input criteria (its value will show 0). If there is at least one payout that matches the input criteria, the value in this field will be at least 1.
    int transactionCount?;
};

# This type is used to show the fees that are deducted from a seller payout for each line item in an order.
public type OrderLineItem record {
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount feeBasisAmount?;
    # The unique identifier of an order line item.
    string lineItemId?;
    # An array of all fees accrued for the order line item and deducted from a seller payout.
    Fee[] marketplaceFees?;
};

# This type is the base response type of the getPayouts method, and contains an array of one or more payouts (that match the input criteria), the total count of payouts in the response, and various pagination data for the results set.
public type Payouts record {
    # The URI of the getPayouts call request that produced the current page of the result set.
    string href?;
    # The maximum number of payouts that may be returned per page of the result set. The limit value can be passed in as a query parameter, or if omitted, its value defaults to 20. Note: If this is the last or only page of the result set, the page may contain fewer payouts than the limit value. To determine the number of pages in a result set, divide the total value (total number of payouts matching input criteria) by this limit value, and then round up to the next integer. For example, if the total value was 120 (120 total payouts) and the limit value was 50 (show 50 payouts per page), the total number of pages in the result set is three, so the seller would have to make three separate getPayouts calls to view all payouts matching the input criteria. Maximum: 200 Default: 20
    int 'limit?;
    # The getPayouts call URI to use if you wish to view the next page of the result set. This field is only returned if there is a next page of results to view based on the current input criteria.
    string next?;
    # This integer value indicates the actual position that the first payout returned on the current page has in the results set. So, if you wanted to view the 11th payout of the result set, you would set the offset value in the request to 10. In the request, you can use the offset parameter in conjunction with the limit parameter to control the pagination of the output. For example, if offset is set to 30 and limit is set to 10, the call retrieves payouts 31 thru 40 from the resulting collection of payouts. Note: This feature employs a zero-based list, where the first item in the list has an offset of 0. Default: 0 (zero)
    int offset?;
    # An array of one or more payouts that match the input criteria. Details for each payout include the unique identifier of the payout, the status of the payout, the amount of the payout, and the number of monetary transactions associated with the payout.
    Payout[] payouts?;
    # The getPayouts call URI to use if you wish to view the previous page of the result set. This field is only returned if there is a previous page of results to view based on the current input criteria.
    string prev?;
    # This integer value is the total number of payouts in the results set based on the current input criteria. Based on the total number of payouts that match the criteria, and on the limit and offset values, there may be additional pages in the results set.
    int total?;
};

# This type is the base response type used by TRANSFER transaction type that is returned in the response.
public type Transfer record {
    # This type provided details on the funding source for the transfer.
    FundingSource fundingSource?;
    # This timestamp indicates the date/time of the transfer. The following (UTC) format is used: YYYY-MM-DDTHH:MM:SS.SSSZ. For example, 2020-08-04T19:09:02.768Z
    string transactionDate?;
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount transferAmount?;
    # This type is used by the transferDetail container, which provides more details about the transfer and the charge(s) associated with the transfer.
    TransferDetail transferDetail?;
    # The unique identifier of the TRANSFER transaction type. This is the same value that was passed into the end of the call URI.
    string transferId?;
};

# This type provided details on the funding source for the transfer.
public type FundingSource record {
    # The brand name of the credit card or the name of the financial institution that is the source of payment. This field may not be populated for other funding sources.
    string brand?;
    # This field provides a note about the funding source. If the seller's credit card or bank account is the funding source, this field might contain the last four digits of the credit card or bank account. This field may also be returned as null.
    string memo?;
    # The string value returned here indicates the funding source. Possible values include the following: AVAILABLE_FUNDS: transfer is funded with seller payout funds CREDIT_CARD: transfer is funded with seller's credit card BANK: transfer is funded with a direct debit to seller's bank account on file with eBay PAY_UPON_INVOICE: eBay will bill the seller for the transfer on the monthly invoice
    string 'type?;
};

# This type is used by the transferDetail container, which provides more details about the transfer and the charge(s) associated with the transfer.
public type TransferDetail record {
    # This type is used by the balanceAdjustment container, which shows the seller payout balance that will be applied toward the charges outlined in the charges array.
    BalanceAdjustment balanceAdjustment?;
    # This container is an array of one or more charges related to the transfer. Charges can be related to an order cancellation, order return, case, payment dispute, etc.
    Charge[] charges?;
    # This type is used to express the dollar value and currency used for any transaction retrieved with the Finances API, including an order total, a seller payout, a buyer refund, or a seller credit.
    Amount totalChargeNetAmount?;
};
