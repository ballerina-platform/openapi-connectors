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

import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

# Configuration for PocketSmith connector
#
# + authConfig - Basic authentication or CredentialsConfig Configuration Tokens
# + secureSocketConfig - Secure Socket Configuration
public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# This is a generated connector for [PocketSmith API v2.0](https://www.pocketsmith.com/) OpenAPI specification.
# The public PocketSmith API. It's a powerful interface for online money management with cash flow forecasts as well as superb historical tracking.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [PocketSmith account](https://www.pocketsmith.com/) and obtain OAuth tokens following [this guide](https://developers.pocketsmith.com/docs/oauth).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.pocketsmith.com/v2") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Get the authorised user
    #
    # + return - Success
    remote isolated function  me() returns User|error {
        string  path = string `/me`;
        User response = check self.clientEp-> get(path, targetType = User);
        return response;
    }
    # Get user
    #
    # + id - The unique identifier of the user.
    # + return - Success
    remote isolated function getusersByid(int id) returns User|error {
        string  path = string `/users/${id}`;
        User response = check self.clientEp-> get(path, targetType = User);
        return response;
    }
    # Update user
    #
    # + id - The unique identifier of the user.
    # + payload - User information
    # + return - Success
    remote isolated function putusersByid(int id, Body payload) returns User|error {
        string  path = string `/users/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        User response = check self.clientEp->put(path, request, targetType=User);
        return response;
    }
    # Get institution
    #
    # + id - The unique identifier of the institution.
    # + return - Success
    remote isolated function getinstitutionsByid(int id) returns Institution|error {
        string  path = string `/institutions/${id}`;
        Institution response = check self.clientEp-> get(path, targetType = Institution);
        return response;
    }
    # Update institution
    #
    # + id - The unique identifier of the institution.
    # + payload - Institution information
    # + return - Success
    remote isolated function putinstitutionsByid(int id, Body1 payload) returns Institution|error {
        string  path = string `/institutions/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Institution response = check self.clientEp->put(path, request, targetType=Institution);
        return response;
    }
    # Delete institution
    #
    # + id - The unique identifier of the institution.
    # + return - Success
    remote isolated function deleteinstitutionsByid(int id) returns http:Response|error {
        string  path = string `/institutions/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List institutions in user
    #
    # + id - The unique identifier of the user
    # + return - Success
    remote isolated function getinstitutions(int id) returns Institution[]|error {
        string  path = string `/users/${id}/institutions`;
        Institution[] response = check self.clientEp-> get(path, targetType = InstitutionArr);
        return response;
    }
    # Create institution in user
    #
    # + id - The unique identifier of the user
    # + payload - Institution information
    # + return - Success
    remote isolated function postinstitutions(int id, Body2 payload) returns Institution|error {
        string  path = string `/users/${id}/institutions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Institution response = check self.clientEp->post(path, request, targetType=Institution);
        return response;
    }
    # Get account
    #
    # + id - The unique identifier of the account.
    # + return - Success
    remote isolated function getaccountsByid(int id) returns Account|error {
        string  path = string `/accounts/${id}`;
        Account response = check self.clientEp-> get(path, targetType = Account);
        return response;
    }
    # Update account
    #
    # + id - The unique identifier of the account.
    # + payload - Account information
    # + return - Success
    remote isolated function putaccountsByid(int id, Body3 payload) returns Account|error {
        string  path = string `/accounts/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Account response = check self.clientEp->put(path, request, targetType=Account);
        return response;
    }
    # Delete account
    #
    # + id - The unique identifier of the account.
    # + return - Success
    remote isolated function deleteaccountsByid(int id) returns http:Response|error {
        string  path = string `/accounts/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List accounts in user
    #
    # + id - The unique identifier of the user.
    # + return - Success
    remote isolated function getaccounts(int id) returns Account[]|error {
        string  path = string `/users/${id}/accounts`;
        Account[] response = check self.clientEp-> get(path, targetType = AccountArr);
        return response;
    }
    # Update the display order of accounts in user
    #
    # + id - The unique identifier of the user.
    # + payload - Account information
    # + return - Success
    remote isolated function putaccounts(int id, Body4 payload) returns Account[]|error {
        string  path = string `/users/${id}/accounts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Account[] response = check self.clientEp->put(path, request, targetType=AccountArr);
        return response;
    }
    # Create an account in user
    #
    # + id - The unique identifier of the user.
    # + payload - Account information
    # + return - Success
    remote isolated function postaccounts(int id, Body5 payload) returns Account|error {
        string  path = string `/users/${id}/accounts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Account response = check self.clientEp->post(path, request, targetType=Account);
        return response;
    }
    # List accounts in institution
    #
    # + id - The unique identifier of the institution.
    # + return - Success
    remote isolated function  accounts(int id) returns Account[]|error {
        string  path = string `/institutions/${id}/accounts`;
        Account[] response = check self.clientEp-> get(path, targetType = AccountArr);
        return response;
    }
    # Get transaction account
    #
    # + id - The unique identifier of the transaction account.
    # + return - Success
    remote isolated function gettransaction_accountsByid(int id) returns TransactionAccount|error {
        string  path = string `/transaction_accounts/${id}`;
        TransactionAccount response = check self.clientEp-> get(path, targetType = TransactionAccount);
        return response;
    }
    # Update transaction account
    #
    # + id - The unique identifier of the transaction account.
    # + payload - Transaction account information
    # + return - Success
    remote isolated function puttransaction_accountsByid(int id, Body6 payload) returns TransactionAccount|error {
        string  path = string `/transaction_accounts/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TransactionAccount response = check self.clientEp->put(path, request, targetType=TransactionAccount);
        return response;
    }
    # List transaction accounts in user
    #
    # + id - The unique identifier of the user.
    # + return - Success
    remote isolated function  transaction_accounts(int id) returns TransactionAccount[]|error {
        string  path = string `/users/${id}/transaction_accounts`;
        TransactionAccount[] response = check self.clientEp-> get(path, targetType = TransactionAccountArr);
        return response;
    }
    # Get a transaction
    #
    # + id - The unique identifier of the transaction.
    # + return - Success
    remote isolated function gettransactionsByid(int id) returns Transaction|error {
        string  path = string `/transactions/${id}`;
        Transaction response = check self.clientEp-> get(path, targetType = Transaction);
        return response;
    }
    # Update a transaction
    #
    # + id - The unique identifier of the transaction.
    # + payload - Transaction information
    # + labels - A new set of labels for the transaction.
    # + return - Success
    remote isolated function puttransactionsByid(int id, Body7 payload, string? labels = ()) returns Transaction|error {
        string  path = string `/transactions/${id}`;
        map<anydata> queryParam = {"labels": labels};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Transaction response = check self.clientEp->put(path, request, targetType=Transaction);
        return response;
    }
    # List transactions in user
    #
    # + id - The unique identifier of the account.
    # + startDate - Return only transactions on or after this date. Required if end_date is provided. If not provided, defaults to the furtherest date allowed by the user's subscription.
    # + endDate - Return transactions that fall on or before this date. Required if start_date is provided. If not provided, defaults to today's date.
    # + onlyUncategorised - If set, will return only uncategorised results.
    # + 'type - Only return transactions of this type.
    # + search - Return transactions matching a keyword search string. The provided string is matched against the transaction amount, account name, payee, category title, note, labels, and the date in yyyy-mm-dd format.
    # + page - Choose a particular page of the results.
    # + return - Success
    remote isolated function listTransactionsUser(int id, string? startDate = (), string? endDate = (), int? onlyUncategorised = (), string? 'type = (), string? search = (), int? page = ()) returns Transaction[]|error {
        string  path = string `/users/${id}/transactions`;
        map<anydata> queryParam = {"start_date": startDate, "end_date": endDate, "only_uncategorised": onlyUncategorised, "type": 'type, "search": search, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        Transaction[] response = check self.clientEp-> get(path, targetType = TransactionArr);
        return response;
    }
    # List transactions in account
    #
    # + id - The unique identifier of the account.
    # + startDate - Return only transactions on or after this date. Required if end_date is provided. If not provided, defaults to the furtherest date allowed by the user's subscription.
    # + endDate - Return transactions that fall on or before this date. Required if start_date is provided. If not provided, defaults to today's date.
    # + onlyUncategorised - If set, will return only uncategorised results.
    # + 'type - Only return transactions of this type.
    # + search - Return transactions matching a keyword search string. The provided string is matched against the transaction amount, account name, payee, category title, note, labels, and the date in yyyy-mm-dd format.
    # + page - Choose a particular page of the results.
    # + return - Success
    remote isolated function listTransactionsAccount(int id, string? startDate = (), string? endDate = (), int? onlyUncategorised = (), string? 'type = (), string? search = (), int? page = ()) returns Transaction[]|error {
        string  path = string `/accounts/${id}/transactions`;
        map<anydata> queryParam = {"start_date": startDate, "end_date": endDate, "only_uncategorised": onlyUncategorised, "type": 'type, "search": search, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        Transaction[] response = check self.clientEp-> get(path, targetType = TransactionArr);
        return response;
    }
    # List transactions in transaction account
    #
    # + id - The unique identifier of the transaction account.
    # + startDate - Return only transactions on or after this date. Required if `end_date` is provided. If not provided, defaults to the furtherest date allowed by the user's subscription.
    # + endDate - Return transactions that fall on or before this date. Required if `start_date` is provided. If not provided, defaults to today's date.
    # + onlyUncategorised - If set, will return only uncategorised results.
    # + 'type - Only return transactions of this type.
    # + search - Return transactions matching a keyword search string. The provided string is matched against the transaction amount, account name, payee, category title, note, labels, and the date in yyyy-mm-dd format.
    # + page - Choose a particular page of the results.
    # + return - Success
    remote isolated function gettransactions(int id, string? startDate = (), string? endDate = (), int? onlyUncategorised = (), string? 'type = (), string? search = (), int? page = ()) returns Transaction[]|error {
        string  path = string `/transaction_accounts/${id}/transactions`;
        map<anydata> queryParam = {"start_date": startDate, "end_date": endDate, "only_uncategorised": onlyUncategorised, "type": 'type, "search": search, "page": page};
        path = path + check getPathForQueryParam(queryParam);
        Transaction[] response = check self.clientEp-> get(path, targetType = TransactionArr);
        return response;
    }
    # Create a transaction in transaction account
    #
    # + id - The unique identifier of the transaction account.
    # + payload - Transaction information
    # + return - Success
    remote isolated function posttransactions(int id, Body8 payload) returns Transaction|error {
        string  path = string `/transaction_accounts/${id}/transactions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Transaction response = check self.clientEp->post(path, request, targetType=Transaction);
        return response;
    }
    # Get category
    #
    # + id - The unique identifier of the category.
    # + return - Success
    remote isolated function getcategoriesByid(int id) returns Category|error {
        string  path = string `/categories/${id}`;
        Category response = check self.clientEp-> get(path, targetType = Category);
        return response;
    }
    # Update category
    #
    # + id - The unique identifier of the category.
    # + payload - Category information
    # + return - Success
    remote isolated function putcategoriesByid(int id, Body9 payload) returns Category|error {
        string  path = string `/categories/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Category response = check self.clientEp->put(path, request, targetType=Category);
        return response;
    }
    # Delete category
    #
    # + id - The unique identifier of the category.
    # + return - Success
    remote isolated function deletecategoriesByid(int id) returns http:Response|error {
        string  path = string `/categories/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List categories in user
    #
    # + id - The unique identifier of the user.
    # + return - Success
    remote isolated function getcategories(int id) returns Category[]|error {
        string  path = string `/users/${id}/categories`;
        Category[] response = check self.clientEp-> get(path, targetType = CategoryArr);
        return response;
    }
    # Create category in user
    #
    # + id - The unique identifier of the user.
    # + payload - Categories information
    # + return - Success
    remote isolated function postcategories(int id, Body10 payload) returns Category|error {
        string  path = string `/users/${id}/categories`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Category response = check self.clientEp->post(path, request, targetType=Category);
        return response;
    }
    # List category rules in user
    #
    # + id - The unique identifier of the user.
    # + return - Success
    remote isolated function createCategoryRuleInUser(int id) returns CategoryRule[]|error {
        string  path = string `/users/${id}/category_rules`;
        CategoryRule[] response = check self.clientEp-> get(path, targetType = CategoryRuleArr);
        return response;
    }
    # Create category rule in category
    #
    # + id - The unique identifier of the category.
    # + payload - Category information
    # + return - Success
    remote isolated function createCategoryRuleInCategory(int id, Body11 payload) returns CategoryRule|error {
        string  path = string `/categories/${id}/category_rules`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CategoryRule response = check self.clientEp->post(path, request, targetType=CategoryRule);
        return response;
    }
    # List budget for user
    #
    # + id - The unique identifier of the account.
    # + rollUp - Whether parent categories should have their children rolled up into them. When used, the children will still appear in the collection on their own, but their actual and forecast figures will be rolled up to the root parent.
    # + return - Success
    remote isolated function  budget(int id, boolean? rollUp = ()) returns BudgetAnalysisPackage[]|error {
        string  path = string `/users/${id}/budget`;
        map<anydata> queryParam = {"roll_up": rollUp};
        path = path + check getPathForQueryParam(queryParam);
        BudgetAnalysisPackage[] response = check self.clientEp-> get(path, targetType = BudgetAnalysisPackageArr);
        return response;
    }
    # Get budget summary for user
    #
    # + id - The unique identifier of the user.
    # + period - The period to analyse in, one of `weeks`, `months` or `years`. Also supported is `event`, although event period analysis is only possible when the budget events gathered align, so in this case where all categories are analysed together, it's highly unlikely that event period analysis will be possible.
    # + interval - The period interval, e.g. if the interval is 2 and the period is weeks, the budget will be analysed fortnightly.
    # + startDate - The date to start analysing the budget from. This will be bumped out to make full periods as necessary.
    # + endDate - The date to stop analysing the budget from. This will be bumped out to make full periods as necessary.
    # + return - Success
    remote isolated function  budget_summary(int id, string period, int interval, string startDate, string endDate) returns BudgetAnalysisPackage[]|error {
        string  path = string `/users/${id}/budget_summary`;
        map<anydata> queryParam = {"period": period, "interval": interval, "start_date": startDate, "end_date": endDate};
        path = path + check getPathForQueryParam(queryParam);
        BudgetAnalysisPackage[] response = check self.clientEp-> get(path, targetType = BudgetAnalysisPackageArr);
        return response;
    }
    # Get trend analysis for user
    #
    # + id - The unique identifier of the user.
    # + period - The period to analyse in, one of `weeks`, `months` or `years`. Also supported is `event`, although event period analysis is only possible when the budget events gathered align, so in this case where all categories are analysed together, it's highly unlikely that event period analysis will be possible.
    # + interval - The period interval, e.g. if the interval is 2 and the period is weeks, the budget will be analysed fortnightly.
    # + startDate - The date to start analysing the budget from. This will be bumped out to make full periods as necessary.
    # + endDate - The date to stop analysing the budget from. This will be bumped out to make full periods as necessary.
    # + categories - A comma-separated list of category IDs to analyse.
    # + scenarios - A comma-separated list of scenario IDs to analyse. You're likely going to want to include all a user's scenarios here, unless you have reason to only analyse for a subset of scenarios. Regardless of what scenarios are analysed, all actuals (transactions) across all accounts will be included.
    # + return - Success
    remote isolated function  trend_analysis(int id, string period, int interval, string startDate, string endDate, string categories, string scenarios) returns BudgetAnalysisPackage[]|error {
        string  path = string `/users/${id}/trend_analysis`;
        map<anydata> queryParam = {"period": period, "interval": interval, "start_date": startDate, "end_date": endDate, "categories": categories, "scenarios": scenarios};
        path = path + check getPathForQueryParam(queryParam);
        BudgetAnalysisPackage[] response = check self.clientEp-> get(path, targetType = BudgetAnalysisPackageArr);
        return response;
    }
    # Get attachment
    #
    # + id - The unique identifier of the attachment.
    # + return - Success
    remote isolated function getattachmentsByid(int id) returns Attachment|error {
        string  path = string `/attachments/${id}`;
        Attachment response = check self.clientEp-> get(path, targetType = Attachment);
        return response;
    }
    # Update attachment
    #
    # + id - The unique identifier of the attachment.
    # + payload - Attachment information
    # + return - Success
    remote isolated function putattachmentsByid(int id, Body12 payload) returns Attachment|error {
        string  path = string `/attachments/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Attachment response = check self.clientEp->put(path, request, targetType=Attachment);
        return response;
    }
    # Delete attachment
    #
    # + id - The unique identifier of the attachment.
    # + return - Success
    remote isolated function deleteattachmentsByid(int id) returns http:Response|error {
        string  path = string `/attachments/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Lists attachments in user
    #
    # + id - The unique identifier of the user.
    # + unassigned - If set, returns unassigned attachments, that are available for assigning to a transaction.
    # + return - Success
    remote isolated function listAttachmentUser(int id, int? unassigned = ()) returns Attachment[]|error {
        string  path = string `/users/${id}/attachments`;
        map<anydata> queryParam = {"unassigned": unassigned};
        path = path + check getPathForQueryParam(queryParam);
        Attachment[] response = check self.clientEp-> get(path, targetType = AttachmentArr);
        return response;
    }
    # Create attachment in user
    #
    # + id - The unique identifier of the user.
    # + payload - Attachment information
    # + return - Success
    remote isolated function createAttachmentUser(int id, Body13 payload) returns Attachment|error {
        string  path = string `/users/${id}/attachments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Attachment response = check self.clientEp->post(path, request, targetType=Attachment);
        return response;
    }
    # List attachments in transaction
    #
    # + id - The unique identifier of the transaction.
    # + return - Success
    remote isolated function listAttachmentTransaction(int id) returns Attachment[]|error {
        string  path = string `/transactions/${id}/attachments`;
        Attachment[] response = check self.clientEp-> get(path, targetType = AttachmentArr);
        return response;
    }
    # Assigns attachment to transaction
    #
    # + id - The unique identifier of the transaction.
    # + payload - Attachement information
    # + return - Success
    remote isolated function assignsAttachmentToTransaction(int id, Body14 payload) returns Attachment|error {
        string  path = string `/transactions/${id}/attachments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Attachment response = check self.clientEp->post(path, request, targetType=Attachment);
        return response;
    }
    # Unassigns attachment in transaction
    #
    # + transaction_id - The unique identifier of the transaction.
    # + attachment_id - The unique identifier of the attachment.
    # + return - Success
    remote isolated function  attachmentsByattachment_id(int transaction_id, int attachment_id) returns http:Response|error {
        string  path = string `/transactions/${transaction_id}/attachments/${attachment_id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
