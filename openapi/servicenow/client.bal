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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig|http:CredentialsConfig auth;
    # The HTTP version understood by the client
    string httpVersion = "1.1";
    # Configurations related to HTTP/1.x protocol
    http:ClientHttp1Settings http1Settings = {};
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings = {};
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with Redirection
    http:FollowRedirects? followRedirects = ();
    # Configurations associated with request pooling
    http:PoolConfiguration? poolConfig = ();
    # HTTP caching related configurations
    http:CacheConfig cache = {};
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig? circuitBreaker = ();
    # Configurations associated with retrying
    http:RetryConfig? retryConfig = ();
    # Configurations associated with cookies
    http:CookieConfig? cookieConfig = ();
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits = {};
    # SSL/TLS-related options
    http:ClientSecureSocket? secureSocket = ();
|};

# This is a generated connector for [ServiceNow REST API Quebec version] (https://developer.servicenow.com/dev.do#!/reference/api/quebec/rest) OpenAPI Specification.
# ServiceNow provides extensive access to instances through a set of RESTful APIs.
@display {label: "ServiceNow", iconPath: "resources/servicenow.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [ServiceNow instance](https://developer.servicenow.com/dev.do) and obtain tokens by following [this guide](https://docs.servicenow.com/bundle/quebec-platform-administration/page/administer/security/task/t_SettingUpOAuth.html).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Retrieves multiple records for the specified table.
    #
    # + tableName - Name of the table from which to retrieve the record.
    # + nameValuePairs - Name-value pairs to use to filter the result set. This parameter is mutually exclusive with sysparm_query.
    # + sysparmDisplayValue - Data retrieval operation for reference and choice fields.
    # + sysparmExcludeReferenceLink - Flag that indicates whether to exclude Table API links for reference fields
    # + sysparmFields - Comma-separated list of fields to return in the response.
    # + sysparmLimit - Maximum number of records to return. For requests that exceed this number of records, use the sysparm_offset parameter to paginate record retrieval. Note - Unusually large sysparm_limit values can impact system performance.
    # + sysparmNoCount - Flag that indicates whether to execute a select count(*) query on the table to return the number of rows in the associated table.
    # + sysparmOffset - Starting record index for which to begin retrieving records. Use this value to paginate record retrieval. This functionality enables the retrieval of all records, regardless of the number of records, in small manageable chunks.
    # + sysparmQuery - Encoded query used to filter the result set. Syntax - sysparm_query=<col_name><operator><value>.
    # + sysparmQueryCategory - Name of the category to use for queries.
    # + sysparmQueryNoDomain - Flag that indicates whether to restrict the record search to only the domains for which the logged in user is configured.
    # + sysparmSuppressPaginationHeader - Flag that indicates whether to remove the Link header from the response. The Link header provides various URLs to relative pages in the record set which you can use to paginate the returned record set.
    # + sysparmView - UI view for which to render the data. Determines the fields returned in the response.
    # + accept - Data format of the response body.
    # + return - If successful, returns a JSON object that includes all records of the table. Otherwise returns the relevant error.
    remote isolated function getRecordList(string tableName, string? nameValuePairs = (), string? sysparmDisplayValue = (), boolean? sysparmExcludeReferenceLink = (), string? sysparmFields = (), decimal? sysparmLimit = (), boolean? sysparmNoCount = (), decimal? sysparmOffset = (), string? sysparmQuery = (), string? sysparmQueryCategory = (), boolean? sysparmQueryNoDomain = (), boolean? sysparmSuppressPaginationHeader = (), string? sysparmView = (), string? accept = ()) returns json|error {
        string  path = string `/api/now/table/${tableName}`;
        map<anydata> queryParam = {"name-value pairs": nameValuePairs, "sysparm_display_value": sysparmDisplayValue, "sysparm_exclude_reference_link": sysparmExcludeReferenceLink, "sysparm_fields": sysparmFields, "sysparm_limit": sysparmLimit, "sysparm_no_count": sysparmNoCount, "sysparm_offset": sysparmOffset, "sysparm_query": sysparmQuery, "sysparm_query_category": sysparmQueryCategory, "sysparm_query_no_domain": sysparmQueryNoDomain, "sysparm_suppress_pagination_header": sysparmSuppressPaginationHeader, "sysparm_view": sysparmView};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Inserts one record in the specified table. Multiple record insertion is not supported by this method.
    #
    # + tableName - Name of the table in which to save the record.
    # + payload - Field name and the associated value for each parameter to define in the specified record in JSON format.
    # + sysparmDisplayValue - Data retrieval operation for reference and choice fields.
    # + sysparmExcludeReferenceLink - Flag that indicates whether to exclude Table API links for reference fields
    # + sysparmFields - Comma-separated list of fields to return in the response.
    # + sysparmInputDisplayValue - Flag that indicates whether to set field values using the display value or the actual value.
    # + sysparmView - UI view for which to render the data. Determines the fields returned in the response.
    # + accept - Data format of the response body.
    # + contentType - Data format of the request body.
    # + xNoResponseBody - By default, responses include body content detailing the new record. Set this header to true in the request to suppress the response body.
    # + return - If successful, returns a JSON object that includes created record of the table. Otherwise returns the relevant error.
    remote isolated function createRecord(string tableName, json payload, string? sysparmDisplayValue = (), boolean? sysparmExcludeReferenceLink = (), string? sysparmFields = (), boolean? sysparmInputDisplayValue = (), string? sysparmView = (), string? accept = (), string? contentType = (), string? xNoResponseBody = ()) returns json|error {
        string  path = string `/api/now/table/${tableName}`;
        map<anydata> queryParam = {"sysparm_display_value": sysparmDisplayValue, "sysparm_exclude_reference_link": sysparmExcludeReferenceLink, "sysparm_fields": sysparmFields, "sysparm_input_display_value": sysparmInputDisplayValue, "sysparm_view": sysparmView};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "X-no-response-body": xNoResponseBody};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload);
        json response = check self.clientEp->post(path, request, headers = accHeaders, targetType=json);
        return response;
    }
    # Retrieves the record identified by the specified sys_id from the specified table.
    #
    # + tableName - Name of the table from which to retrieve the record.
    # + sysId - Sys_id of the record to retrieve
    # + sysparmDisplayValue - Data retrieval operation for reference and choice fields.
    # + sysparmExcludeReferenceLink - Flag that indicates whether to exclude Table API links for reference fields
    # + sysparmFields - Comma-separated list of fields to return in the response.
    # + sysparmQueryNoDomain - Flag that indicates whether to restrict the record search to only the domains for which the logged in user is configured.
    # + sysparmView - UI view for which to render the data. Determines the fields returned in the response.
    # + accept - Data format of the response body.
    # + return - If successful, returns a JSON object that includes specified record of the table. Otherwise returns the relevant error.
    remote isolated function getRecordById(string tableName, string sysId, string? sysparmDisplayValue = (), boolean? sysparmExcludeReferenceLink = (), string? sysparmFields = (), boolean? sysparmQueryNoDomain = (), string? sysparmView = (), string? accept = ()) returns json|error {
        string  path = string `/api/now/table/${tableName}/${sysId}`;
        map<anydata> queryParam = {"sysparm_display_value": sysparmDisplayValue, "sysparm_exclude_reference_link": sysparmExcludeReferenceLink, "sysparm_fields": sysparmFields, "sysparm_query_no_domain": sysparmQueryNoDomain, "sysparm_view": sysparmView};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Updates the specified record with the request body.
    #
    # + tableName - Name of the table in which the record is located.
    # + sysId - Unique identifier of the record to update.
    # + payload - Name-value pairs for the field(s) to update in the associated table in JSON format.
    # + sysparmDisplayValue - Data retrieval operation for reference and choice fields.
    # + sysparmExcludeReferenceLink - Flag that indicates whether to exclude Table API links for reference fields
    # + sysparmFields - Comma-separated list of fields to return in the response.
    # + sysparmInputDisplayValue - Flag that indicates whether to set field values using the display value or the actual value.
    # + sysparmQueryNoDomain - Flag that indicates whether to restrict the record search to only the domains for which the logged in user is configured.
    # + sysparmView - UI view for which to render the data. Determines the fields returned in the response.
    # + accept - Data format of the response body.
    # + contentType - Data format of the request body.
    # + xNoResponseBody - By default, responses include body content detailing the new record. Set this header to true in the request to suppress the response body.
    # + return - If successful, returns a JSON object that includes updated record of the table. Otherwise returns the relevant error.
    remote isolated function updateRecord(string tableName, string sysId, json payload, string? sysparmDisplayValue = (), boolean? sysparmExcludeReferenceLink = (), string? sysparmFields = (), boolean? sysparmInputDisplayValue = (), boolean? sysparmQueryNoDomain = (), string? sysparmView = (), string? accept = (), string? contentType = (), string? xNoResponseBody = ()) returns json|error {
        string  path = string `/api/now/table/${tableName}/${sysId}`;
        map<anydata> queryParam = {"sysparm_display_value": sysparmDisplayValue, "sysparm_exclude_reference_link": sysparmExcludeReferenceLink, "sysparm_fields": sysparmFields, "sysparm_input_display_value": sysparmInputDisplayValue, "sysparm_query_no_domain": sysparmQueryNoDomain, "sysparm_view": sysparmView};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "X-no-response-body": xNoResponseBody};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload);
        json response = check self.clientEp->put(path, request, headers = accHeaders, targetType=json);
        return response;
    }
    # Deletes the specified record from the specified table.
    #
    # + tableName - Name of the table from which to delete the specified record, such as "incident" or "asset".
    # + sysId - Sys_id of the record to delete.
    # + sysparmQueryNoDomain - Flag that indicates whether to restrict the record search to only the domains for which the logged in user is configured.
    # + accept - Data format of the response body.
    # + return - **HTTP Status Code:** `204`. Meeting updated.
    remote isolated function deleteRecord(string tableName, string sysId, boolean? sysparmQueryNoDomain = (), string? accept = ()) returns http:Response|error {
        string  path = string `/api/now/table/${tableName}/${sysId}`;
        map<anydata> queryParam = {"sysparm_query_no_domain": sysparmQueryNoDomain};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Updates the specified record with the name-value pairs included in the request body.
    #
    # + tableName - Name of the table in which to the specified record is located.
    # + sysId - Sys_id of the record to update.
    # + payload - Field name and the associated value for each parameter to define in the specified record in JSON format.
    # + sysparmDisplayValue - Data retrieval operation for reference and choice fields.
    # + sysparmFields - Comma-separated list of fields to return in the response.
    # + sysparmInputDisplayValue - Flag that indicates whether to set field values using the display value or the actual value.
    # + sysparmQueryNoDomain - Flag that indicates whether to restrict the record search to only the domains for which the logged in user is configured.
    # + sysparmView - UI view for which to render the data. Determines the fields returned in the response.
    # + accept - Data format of the response body.
    # + contentType - Data format of the request body.
    # + xNoResponseBody - By default, responses include body content detailing the new record. Set this header to true in the request to suppress the response body.
    # + return - If successful, returns a JSON object that includes updated record of the table. Otherwise returns the relevant error.
    remote isolated function patchRecordById(string tableName, string sysId, json payload, string? sysparmDisplayValue = (), string? sysparmFields = (), boolean? sysparmInputDisplayValue = (), boolean? sysparmQueryNoDomain = (), string? sysparmView = (), string? accept = (), string? contentType = (), string? xNoResponseBody = ()) returns json|error {
        string  path = string `/api/now/table/${tableName}/${sysId}`;
        map<anydata> queryParam = {"sysparm_display_value": sysparmDisplayValue, "sysparm_fields": sysparmFields, "sysparm_input_display_value": sysparmInputDisplayValue, "sysparm_query_no_domain": sysparmQueryNoDomain, "sysparm_view": sysparmView};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType, "X-no-response-body": xNoResponseBody};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload);
        json response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=json);
        return response;
    }
    # Retrieves records for the specified table and performs aggregate functions on the returned values.
    #
    # + tableName - Name of the table for which to retrieve records.
    # + nameValuePairs - An alternative to using the sysparm_query parameter. You can filter a query using key-value pairs where the key is the name of a field.
    # + sysparmAvgFields - List of fields on which to perform avg aggregate operation. You can specify multiple fields by separating each with a comma.
    # + sysparmMinFields - List of fields on which to perform min aggregate operation. You can specify multiple fields by separating each with a comma.
    # + sysparmMaxFields - List of fields on which to perform max aggregate operation. You can specify multiple fields by separating each with a comma.
    # + sysparmSumFields - List of fields on which to perform sum aggregate operation. You can specify multiple fields by separating each with a comma.
    # + sysparmCount - Flag that determines whether to return the number of records returned by the query.
    # + sysparmDisplayValue - Data retrieval operation when grouping by reference or choice fields. Based on this value, the query returns either the display value, the actual value in the database, or both.
    # + sysparmGroupBy - Fields by which to group the returned data. You can specify multiple fields by separating each field with a comma, such as sysparm_group_by=priority,state.
    # + sysparmHaving - Additional query that enables you to filter the data based on an aggregate operation. The value for this parameter must follow the syntax aggregate^field^operator^value, such as count^priority^>^3 to obtain the number of records within the query results with a priority greater than 3. You can specify multiple queries by separating each with a comma, such ascount^state^=^1,avg^priority^>^3.
    # + sysparmOrderby - Data retrieval operation when grouping by reference or choice fields. Based on this value, the query returns either the display value, the actual value in the database, or both.
    # + sysparmQuery - An encoded query. For example- (sysparm_query=active=true)(sysparm_query=caller_id=javascript:gs.getUserID()^active=true)
    # + accept - Data format of the response body.
    # + return - If successful, returns a JSON object depends on specified table and specified request parameters. Otherwise returns the relevant error.
    remote isolated function aggregate(string tableName, string? nameValuePairs = (), string? sysparmAvgFields = (), string? sysparmMinFields = (), string? sysparmMaxFields = (), string? sysparmSumFields = (), string? sysparmCount = (), string? sysparmDisplayValue = (), string? sysparmGroupBy = (), string? sysparmHaving = (), string? sysparmOrderby = (), string? sysparmQuery = (), string? accept = ()) returns json|error {
        string  path = string `/api/now/stats/${tableName}`;
        map<anydata> queryParam = {"name-value pairs": nameValuePairs, "sysparm_avg_fields": sysparmAvgFields, "sysparm_min_fields": sysparmMinFields, "sysparm_max_fields": sysparmMaxFields, "sysparm_sum_fields": sysparmSumFields, "sysparm_count": sysparmCount, "sysparm_display_value": sysparmDisplayValue, "sysparm_group_by": sysparmGroupBy, "sysparm_having": sysparmHaving, "sysparm_orderby": sysparmOrderby, "sysparm_query": sysparmQuery};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Retrieves the specified import staging record and resulting transformation result.
    #
    # + stagingTableName - Name of the table from which to obtain the import data.
    # + sysId - Sys_id of the record that contains the data.
    # + accept - Data format of the response body.
    # + return - If successful, returns a JSON object. Otherwise returns the relevant error.
    remote isolated function getImportSet(string stagingTableName, string sysId, string? accept = ()) returns json|error {
        string  path = string `/api/now/import/${stagingTableName}/${sysId}`;
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Inserts incoming data into a specified staging table and triggers transformation based on predefined transform maps in the import set table.
    #
    # + stagingTableName - Name of the table from which to import the data.
    # + payload - Name-value pairs to insert in the import fields in JSON format.
    # + accept - Data format of the response body.
    # + contentType - Data format of the request body.
    # + return - If successful, returns a JSON object. Otherwise returns the relevant error.
    remote isolated function createImportSet(string stagingTableName, json payload, string? accept = (), string? contentType = ()) returns json|error {
        string  path = string `/api/now/import/${stagingTableName}`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload);
        json response = check self.clientEp->post(path, request, headers = accHeaders, targetType=json);
        return response;
    }
    # Inserts multiple records into a specified staging table and triggers transformation based on predefined transform maps or Robust Transform Engine (RTE) configurations in a single request.
    #
    # + stagingTableName - Name of the table from which to import the data.
    # + payload - Name-value pairs to insert in the import fields in JSON format.
    # + multiImportSetId - Sys_id of an entry in the Multi Import Sets [sys_multi_import_set] table. If specified, adds the current import to this multiple import set instead of adding to a new multiple import set.
    # + runAfter - Sys_id of an entry in the Import Sets [sys_import_set] table. Enables running the current import set after the specified import set is complete. You can use this parameter to enforce the sequential order of imports. This parameter is only valid in asynchronous transformations.
    # + accept - Data format of the response body.
    # + contentType - Data format of the request body.
    # + return - If successful, returns a JSON object. Otherwise returns the relevant error.
    remote isolated function createMultipleImportSet(string stagingTableName, json payload, string? multiImportSetId = (), string? runAfter = (), string? accept = (), string? contentType = ()) returns json|error {
        string  path = string `/api/now/import/${stagingTableName}/insertMultiple`;
        map<anydata> queryParam = {"multi_import_set_id": multiImportSetId, "run_after": runAfter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload);
        json response = check self.clientEp->post(path, request, headers = accHeaders, targetType=json);
        return response;
    }
    # Retrieves the activity stream for a specified Customer Service Management (CSM) case.
    #
    # + id - Sys_id or case number of the case to retrieve. Located in the Case [sn_customerservice_case] table. Results will be unpredictable if a specified case number is shared by two or more cases.
    # + sysparmActivityType - Filters the type of activities to return from the activity stream. The entries.element parameter contains the activity type for each activity.
    # + sysparmLimit - Maximum number of records to return. Unusually large sysparm_limit values can impact system performance. For requests that exceed this number of records, use the sysparm_offset parameter to paginate record retrieval.
    # + sysparmOffset - Starting record index for which to begin retrieving records. Use this value to paginate record retrieval. This functionality enables the retrieval of all records, regardless of the number of records, in small manageable chunks.
    # + accept - Data format of the response body.
    # + return - If successful, returns a JSON object. Otherwise returns the relevant error.
    remote isolated function getCaseById(string id, string? sysparmActivityType = (), decimal? sysparmLimit = (), decimal? sysparmOffset = (), string? accept = ()) returns json|error {
        string  path = string `/api/sn_customerservice/case/${id}/activities`;
        map<anydata> queryParam = {"sysparm_activity_type": sysparmActivityType, "sysparm_limit": sysparmLimit, "sysparm_offset": sysparmOffset};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Retrieves the list of possible field values for a choice or reference field in the Case [sn_customerservice_case] table.
    #
    # + fieldName - Name of a choice or reference field in the Case [sn_customerservice_case] table.
    # + sysparmDependentValue - Value to select in the Case [sn_customerservice_case] table choice field that the requested field is dependent on. Use only when requesting a choice field that is dependent on another field.
    # + sysparmLimit - Maximum number of records to return. Unusually large sysparm_limit values can impact system performance. For requests that exceed this number of records, use the sysparm_offset parameter to paginate record retrieval.
    # + sysparmOffset - Starting record index for which to begin retrieving records. Use this value to paginate record retrieval. This functionality enables the retrieval of all records, regardless of the number of records, in small manageable chunks.
    # + sysparmReferenceFieldColumns - Comma-separated list of column names, from the table of the specified reference field, to return in the response.
    # + sysparmQuery - Encoded query used to filter the result set. Queries defined using this parameter are appended to any encoded queries produced by reference qualifiers.
    # + sysparmRefQualInput - Encoded set of field values representing a current object to pass to reference qualifiers that use JavaScript functions. Use only when requesting a reference field.
    # + accept - Data format of the response body.
    # + return - If successful, returns a JSON object. Otherwise returns the relevant error.
    remote isolated function getValuesByFieldNameInCase(string fieldName, string? sysparmDependentValue = (), decimal? sysparmLimit = (), decimal? sysparmOffset = (), string? sysparmReferenceFieldColumns = (), string? sysparmQuery = (), string? sysparmRefQualInput = (), string? accept = ()) returns json|error {
        string  path = string `/api/sn_customerservice/case/field_values/${fieldName}`;
        map<anydata> queryParam = {"sysparm_dependent_value": sysparmDependentValue, "sysparm_limit": sysparmLimit, "sysparm_offset": sysparmOffset, "sysparm_reference_field_columns": sysparmReferenceFieldColumns, "sysparm_query": sysparmQuery, "sysparm_ref_qual_input": sysparmRefQualInput};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Retrieves the list of possible field values for a choice or reference field for a specified record in the Case [sn_customerservice_case] table.
    #
    # + fieldName - Name of a choice or reference field in the Case [sn_customerservice_case] table.
    # + id - Sys_id of a record. Located in the Case [sn_customerservice_case] table to use when evaluating reference qualifiers.
    # + sysparmDependentValue - Value to select in the Case [sn_customerservice_case] table choice field that the requested field is dependent on. Use only when requesting a choice field that is dependent on another field.
    # + sysparmLimit - Maximum number of records to return. Unusually large sysparm_limit values can impact system performance. For requests that exceed this number of records, use the sysparm_offset parameter to paginate record retrieval.
    # + sysparmOffset - Starting record index for which to begin retrieving records. Use this value to paginate record retrieval. This functionality enables the retrieval of all records, regardless of the number of records, in small manageable chunks.
    # + sysparmReferenceFieldColumns - Comma-separated list of column names, from the table of the specified reference field, to return in the response.
    # + sysparmQuery - Encoded query used to filter the result set. Queries defined using this parameter are appended to any encoded queries produced by reference qualifiers.
    # + sysparmRefQualInput - Encoded set of field values representing a current object to pass to reference qualifiers that use JavaScript functions. Use only when requesting a reference field.
    # + accept - Data format of the response body.
    # + return - If successful, returns a JSON object. Otherwise returns the relevant error.
    remote isolated function getValuesByCaseIdAndFieldName(string fieldName, string id, string? sysparmDependentValue = (), decimal? sysparmLimit = (), decimal? sysparmOffset = (), string? sysparmReferenceFieldColumns = (), string? sysparmQuery = (), string? sysparmRefQualInput = (), string? accept = ()) returns json|error {
        string  path = string `/api/sn_customerservice/case/${id}/field_values/${fieldName}`;
        map<anydata> queryParam = {"sysparm_dependent_value": sysparmDependentValue, "sysparm_limit": sysparmLimit, "sysparm_offset": sysparmOffset, "sysparm_reference_field_columns": sysparmReferenceFieldColumns, "sysparm_query": sysparmQuery, "sysparm_ref_qual_input": sysparmRefQualInput};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Retrieves the specified Customer Service Management (CSM) case.
    #
    # + id - Sys_id or case number for the case to retrieve. Located in the Case [sn_customerservice_case] table. Results will be unpredictable if a specified case number is shared by two or more cases.
    # + sysparmDisplayValue - Data retrieval operation for reference and choice fields. Based on this value, retrieves the display value and/or the actual value from the database.
    # + accept - Data format of the response body.
    # + return - If successful, returns a JSON object. Otherwise returns the relevant error.
    remote isolated function getCSMCaseById(string id, string? sysparmDisplayValue = (), string? accept = ()) returns json|error {
        string  path = string `/api/sn_customerservice/case/${id}`;
        map<anydata> queryParam = {"sysparm_display_value": sysparmDisplayValue};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Updates the specified existing Customer Service Management (CSM) case with the passed-in parameters.
    #
    # + id - Sys_id of the case to update. Located in the Case [sn_customerservice_case] table.
    # + payload - Field name and the associated value for each parameter to define in the specified record in JSON format.
    # + sysparmDisplayValue - Data retrieval operation for reference and choice fields. Based on this value, retrieves the display value and/or the actual value from the database.
    # + sysparmFields - Comma-separated list of fields to return in the response.
    # + sysparmGetCaseDetails - Flag that indicates whether to return the updated case record.
    # + accept - Data format of the response body.
    # + contentType - Data format of the request body.
    # + return - If successful, returns a JSON object. Otherwise returns the relevant error.
    remote isolated function updateCSMCase(string id, json payload, string? sysparmDisplayValue = (), string? sysparmFields = (), string? sysparmGetCaseDetails = (), string? accept = (), string? contentType = ()) returns json|error {
        string  path = string `/api/sn_customerservice/case/${id}`;
        map<anydata> queryParam = {"sysparm_display_value": sysparmDisplayValue, "sysparm_fields": sysparmFields, "sysparm_get_case_details": sysparmGetCaseDetails};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload);
        json response = check self.clientEp->put(path, request, headers = accHeaders, targetType=json);
        return response;
    }
    # Retrieves a specified set of Customer Service Management (CSM) cases.
    #
    # + sysparmDisplayValue - Data retrieval operation for reference and choice fields. Based on this value, retrieves the display value and/or the actual value from the database.
    # + sysparmFields - Comma-separated list of fields to return in the response.
    # + sysparmLimit - Maximum number of records to return. Unusually large sysparm_limit values can impact system performance. For requests that exceed this number of records, use the sysparm_offset parameter to paginate record retrieval.
    # + sysparmOffset - Starting record index for which to begin retrieving records. Use this value to paginate record retrieval. This functionality enables the retrieval of all records, regardless of the number of records, in small manageable chunks.
    # + sysparmQuery - Encoded query used to filter the result set.
    # + sysparmReferenceFields - Whether or not to retrieve fields from reference tables such as account, contact, consumer, and sn_app_cs_social_social_profile. By default, these fields are returned if the user has read access to them, but this adds performance overhead. When retrieving a large number of case records, this overhead can be eliminated by setting sysparm_reference_fields=false.
    # + accept - Data format of the response body.
    # + return - If successful, returns a JSON object. Otherwise returns the relevant error.
    remote isolated function getCSMCaseList(string? sysparmDisplayValue = (), string? sysparmFields = (), decimal? sysparmLimit = (), decimal? sysparmOffset = (), string? sysparmQuery = (), boolean? sysparmReferenceFields = (), string? accept = ()) returns json|error {
        string  path = string `/api/sn_customerservice/case`;
        map<anydata> queryParam = {"sysparm_display_value": sysparmDisplayValue, "sysparm_fields": sysparmFields, "sysparm_limit": sysparmLimit, "sysparm_offset": sysparmOffset, "sysparm_query": sysparmQuery, "sysparm_reference_fields": sysparmReferenceFields};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Creates a new Customer Service Management (CSM) case.
    #
    # + payload - Field name and the associated value for each parameter to define in the specified record in JSON format.
    # + accept - Data format of the response body.
    # + contentType - Data format of the request body.
    # + return - If successful, returns a JSON object. Otherwise returns the relevant error.
    remote isolated function createCSMCase(json payload, string? accept = (), string? contentType = ()) returns json|error {
        string  path = string `/api/sn_customerservice/case`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload);
        json response = check self.clientEp->post(path, request, headers = accHeaders, targetType=json);
        return response;
    }
    # Retrieves a specified set of Customer Service Management (CSM) contacts.
    #
    # + sysparmLimit - Maximum number of records to return. Unusually large sysparm_limit values can impact system performance. For requests that exceed this number of records, use the sysparm_offset parameter to paginate record retrieval.
    # + sysparmOffset - Starting record index for which to begin retrieving records. Use this value to paginate record retrieval. This functionality enables the retrieval of all records, regardless of the number of records, in small manageable chunks.
    # + sysparmQuery - Encoded query used to filter the result set.
    # + accept - Data format of the response body.
    # + return - If successful, returns a JSON object. Otherwise returns the relevant error.
    remote isolated function getCSMContactList(decimal? sysparmLimit = (), decimal? sysparmOffset = (), string? sysparmQuery = (), string? accept = ()) returns json|error {
        string  path = string `/api/now/contact`;
        map<anydata> queryParam = {"sysparm_limit": sysparmLimit, "sysparm_offset": sysparmOffset, "sysparm_query": sysparmQuery};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Creates a new Customer Service Management (CSM) contact.
    #
    # + payload - Field name and the associated value for each parameter to define in the specified record in JSON format.
    # + accept - Data format of the response body.
    # + contentType - Data format of the request body.
    # + return - If successful, returns a JSON object that includes result. Otherwise returns the relevant error.
    remote isolated function createCSMContact(json payload, string? accept = (), string? contentType = ()) returns json|error {
        string  path = string `/api/now/contact`;
        map<any> headerValues = {"Accept": accept, "Content-Type": contentType};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload);
        json response = check self.clientEp->post(path, request, headers = accHeaders, targetType=json);
        return response;
    }
    # Retrieves the specified Customer Service Management (CSM) contact.
    #
    # + id - Sys_id of the contact to retrieve. Located in the Contact [customer_contact] table.
    # + accept - Data format of the response body.
    # + return - If successful, returns a JSON object. Otherwise returns the relevant error.
    remote isolated function getCSMContactById(string id, string? accept = ()) returns json|error {
        string  path = string `/api/now/contact/${id}`;
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
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

# Generate header map for given header values.
#
# + headerParam - Headers  map
# + return - Returns generated map or error at failure of client initialization
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
