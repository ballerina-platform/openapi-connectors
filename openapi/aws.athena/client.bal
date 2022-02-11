// Copyright (c) 2022 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Amazon Signature authorization v4
    string authorization;
|};

# This is a generated connector for [Amazon Athena API](https://docs.aws.amazon.com/athena/latest/APIReference/Welcome.html) OpenAPI specification. '<p>Amazon Athena is an interactive query service that lets you use standard SQL to analyze data directly in Amazon S3. You can point Athena at your data in Amazon S3 and run ad-hoc queries and get results in seconds. Athena is serverless, so there is no infrastructure to set up or manage. You pay only for the queries you run. Athena scales automatically—executing queries in parallel—so results are fast, even with large datasets and complex queries. For more information, see <a href="http://docs.aws.amazon.com/athena/latest/ug/what-is.html">What is Amazon Athena</a> in the <i>Amazon Athena User Guide</i>.</p> <p>If you connect to Athena using the JDBC driver, use version 1.1.0 of the driver or later with the Amazon Athena API. Earlier version drivers do not support the API. For more information and to download the driver, see <a href="https://docs.aws.amazon.com/athena/latest/ug/connect-with-jdbc.html">Accessing Amazon Athena with JDBC</a>.</p> <p>For code samples using the Amazon Web Services SDK for Java, see <a href="https://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.</p>'
@display {label: "Amazon Athena", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [AWS account](https://aws.amazon.com/?nc2=h_lg) and obtain OAuth tokens following [this guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/RESTAuthentication.html).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://athena.us-east-1.amazonaws.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Returns the details of a single named query or a list of up to 50 queries, which you provide as an array of query ID strings. Requires you to have access to the workgroup in which the queries were saved. Use <a>ListNamedQueriesInput</a> to get the list of named query IDs in the specified workgroup. If information could not be retrieved for a submitted query ID, information about the query ID submitted is listed under <a>UnprocessedNamedQueryId</a>. Named queries differ from executed queries. Use <a>BatchGetQueryExecutionInput</a> to get details about each unique query execution, and <a>ListQueryExecutionsInput</a> to get a list of query execution IDs.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Batch get named query 
    # + return - Success 
    remote isolated function batchGetNamedQuery(string xAmzTarget, BatchGetNamedQueryInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns BatchGetNamedQueryOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.BatchGetNamedQuery`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchGetNamedQueryOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Returns the details of a single query execution or a list of up to 50 query executions, which you provide as an array of query execution ID strings. Requires you to have access to the workgroup in which the queries ran. To get a list of query execution IDs, use <a>ListQueryExecutionsInput$WorkGroup</a>. Query executions differ from named (saved) queries. Use <a>BatchGetNamedQueryInput</a> to get details about named queries.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Batch get query execution input 
    # + return - Success 
    remote isolated function batchGetQueryExecution(string xAmzTarget, BatchGetQueryExecutionInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns BatchGetQueryExecutionOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.BatchGetQueryExecution`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchGetQueryExecutionOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Creates (registers) a data catalog with the specified name and properties. Catalogs created are visible to all users of the same Amazon Web Services account.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Create data catalog input 
    # + return - Success 
    remote isolated function createDataCatalog(string xAmzTarget, CreateDataCatalogInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns CreateDataCatalogOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.CreateDataCatalog`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateDataCatalogOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # <p>Creates a named query in the specified workgroup. Requires that you have access to the workgroup.</p> <p>For code samples using the Amazon Web Services SDK for Java, see <a href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.</p>
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Create named query input 
    # + return - Success 
    remote isolated function createNamedQuery(string xAmzTarget, CreateNamedQueryInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns CreateNamedQueryOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.CreateNamedQuery`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateNamedQueryOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Creates a prepared statement for use with SQL queries in Athena.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Create prepared statement input 
    # + return - Success 
    remote isolated function createPreparedStatement(string xAmzTarget, CreatePreparedStatementInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns CreatePreparedStatementOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.CreatePreparedStatement`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreatePreparedStatementOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Creates a workgroup with the specified name.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Create workgroup input 
    # + return - Success 
    remote isolated function createWorkGroup(string xAmzTarget, CreateWorkGroupInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns CreateWorkGroupOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.CreateWorkGroup`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateWorkGroupOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Deletes a data catalog.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Delete data catalog input 
    # + return - Success 
    remote isolated function deleteDataCatalog(string xAmzTarget, DeleteDataCatalogInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns DeleteDataCatalogOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.DeleteDataCatalog`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DeleteDataCatalogOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # <p>Deletes the named query if you have access to the workgroup in which the query was saved.</p> <p>For code samples using the Amazon Web Services SDK for Java, see <a href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.</p>
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Delete named query input 
    # + return - Success 
    remote isolated function deleteNamedQuery(string xAmzTarget, DeleteNamedQueryInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns DeleteNamedQueryOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.DeleteNamedQuery`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DeleteNamedQueryOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Deletes the prepared statement with the specified name from the specified workgroup.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Delete prepared statement input 
    # + return - Success 
    remote isolated function deletePreparedStatement(string xAmzTarget, DeletePreparedStatementInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns DeletePreparedStatementOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.DeletePreparedStatement`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DeletePreparedStatementOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Deletes the workgroup with the specified name. The primary workgroup cannot be deleted.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Delete workgroup input 
    # + return - Success 
    remote isolated function deleteWorkGroup(string xAmzTarget, DeleteWorkGroupInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns DeleteWorkGroupOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.DeleteWorkGroup`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DeleteWorkGroupOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Returns the specified data catalog.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Get data catalog input 
    # + return - Success 
    remote isolated function getDataCatalog(string xAmzTarget, GetDataCatalogInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns GetDataCatalogOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.GetDataCatalog`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetDataCatalogOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Returns a database object for the specified database and data catalog.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Get database input 
    # + return - Success 
    remote isolated function getDatabase(string xAmzTarget, GetDatabaseInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns GetDatabaseOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.GetDatabase`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetDatabaseOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Returns information about a single query. Requires that you have access to the workgroup in which the query was saved.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Get named query input 
    # + return - Success 
    remote isolated function getNamedQuery(string xAmzTarget, GetNamedQueryInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns GetNamedQueryOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.GetNamedQuery`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetNamedQueryOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieves the prepared statement with the specified name from the specified workgroup.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Get prepared statement input 
    # + return - Success 
    remote isolated function getPreparedStatement(string xAmzTarget, GetPreparedStatementInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns GetPreparedStatementOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.GetPreparedStatement`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetPreparedStatementOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Returns information about a single execution of a query if you have access to the workgroup in which the query ran. Each time a query executes, information about the query execution is saved with a unique ID.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Get query execution input 
    # + return - Success 
    remote isolated function getQueryExecution(string xAmzTarget, GetQueryExecutionInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns GetQueryExecutionOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.GetQueryExecution`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetQueryExecutionOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # <p>Streams the results of a single query execution specified by <code>QueryExecutionId</code> from the Athena query results location in Amazon S3. For more information, see <a href="https://docs.aws.amazon.com/athena/latest/ug/querying.html">Query Results</a> in the <i>Amazon Athena User Guide</i>. This request does not execute the query but returns results. Use <a>StartQueryExecution</a> to run a query.</p> <p>To stream query results successfully, the IAM principal with permission to call <code>GetQueryResults</code> also must have permissions to the Amazon S3 <code>GetObject</code> action for the Athena query results location.</p> <important> <p>IAM principals with permission to the Amazon S3 <code>GetObject</code> action for the query results location are able to retrieve query results from Amazon S3 even if permission to the <code>GetQueryResults</code> action is denied. To restrict user or role access, ensure that Amazon S3 permissions to the Athena query location are denied.</p> </important>
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + maxResults - Pagination limit 
    # + nextToken - Pagination token 
    # + xAmzTarget - Amazon target action 
    # + payload - Get query results input 
    # + return - Success 
    remote isolated function getQueryResults(string xAmzTarget, GetQueryResultsInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = (), string? maxResults = (), string? nextToken = ()) returns GetQueryResultsOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.GetQueryResults`;
        map<anydata> queryParam = {"MaxResults": maxResults, "NextToken": nextToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetQueryResultsOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Returns table metadata for the specified catalog, database, and table.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Get table metadata input 
    # + return - Success 
    remote isolated function getTableMetadata(string xAmzTarget, GetTableMetadataInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns GetTableMetadataOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.GetTableMetadata`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetTableMetadataOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Returns information about the workgroup with the specified name.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Get workgroup input 
    # + return - Success 
    remote isolated function getWorkGroup(string xAmzTarget, GetWorkGroupInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns GetWorkGroupOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.GetWorkGroup`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetWorkGroupOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Lists the data catalogs in the current Amazon Web Services account.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + maxResults - Pagination limit 
    # + nextToken - Pagination token 
    # + xAmzTarget - Amazon target action 
    # + payload - List data catalogs input 
    # + return - Success 
    remote isolated function listDataCatalogs(string xAmzTarget, ListDataCatalogsInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = (), string? maxResults = (), string? nextToken = ()) returns ListDataCatalogsOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.ListDataCatalogs`;
        map<anydata> queryParam = {"MaxResults": maxResults, "NextToken": nextToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListDataCatalogsOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Lists the databases in the specified data catalog.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + maxResults - Pagination limit 
    # + nextToken - Pagination token 
    # + xAmzTarget - Amazon target action 
    # + payload - List databases input 
    # + return - Success 
    remote isolated function listDatabases(string xAmzTarget, ListDatabasesInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = (), string? maxResults = (), string? nextToken = ()) returns ListDatabasesOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.ListDatabases`;
        map<anydata> queryParam = {"MaxResults": maxResults, "NextToken": nextToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListDatabasesOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Returns a list of engine versions that are available to choose from, including the Auto option.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - List engine versions input 
    # + return - Success 
    remote isolated function listEngineVersions(string xAmzTarget, ListEngineVersionsInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns ListEngineVersionsOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.ListEngineVersions`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListEngineVersionsOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # <p>Provides a list of available query IDs only for queries saved in the specified workgroup. Requires that you have access to the specified workgroup. If a workgroup is not specified, lists the saved queries for the primary workgroup.</p> <p>For code samples using the Amazon Web Services SDK for Java, see <a href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.</p>
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + maxResults - Pagination limit 
    # + nextToken - Pagination token 
    # + xAmzTarget - Amazon target action 
    # + payload - List named queries input 
    # + return - Success 
    remote isolated function listNamedQueries(string xAmzTarget, ListNamedQueriesInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = (), string? maxResults = (), string? nextToken = ()) returns ListNamedQueriesOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.ListNamedQueries`;
        map<anydata> queryParam = {"MaxResults": maxResults, "NextToken": nextToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListNamedQueriesOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Lists the prepared statements in the specfied workgroup.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + maxResults - Pagination limit 
    # + nextToken - Pagination token 
    # + xAmzTarget - Amazon target action 
    # + payload - List prepared statements input 
    # + return - Success 
    remote isolated function listPreparedStatements(string xAmzTarget, ListPreparedStatementsInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = (), string? maxResults = (), string? nextToken = ()) returns ListPreparedStatementsOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.ListPreparedStatements`;
        map<anydata> queryParam = {"MaxResults": maxResults, "NextToken": nextToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListPreparedStatementsOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # <p>Provides a list of available query execution IDs for the queries in the specified workgroup. If a workgroup is not specified, returns a list of query execution IDs for the primary workgroup. Requires you to have access to the workgroup in which the queries ran.</p> <p>For code samples using the Amazon Web Services SDK for Java, see <a href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.</p>
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + maxResults - Pagination limit 
    # + nextToken - Pagination token 
    # + xAmzTarget - Amazon target action 
    # + payload - List query executions input 
    # + return - Success 
    remote isolated function listQueryExecutions(string xAmzTarget, ListQueryExecutionsInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = (), string? maxResults = (), string? nextToken = ()) returns ListQueryExecutionsOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.ListQueryExecutions`;
        map<anydata> queryParam = {"MaxResults": maxResults, "NextToken": nextToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListQueryExecutionsOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Lists the metadata for the tables in the specified data catalog database.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + maxResults - Pagination limit 
    # + nextToken - Pagination token 
    # + xAmzTarget - Amazon target action 
    # + payload - List table metadata input 
    # + return - Success 
    remote isolated function listTableMetadata(string xAmzTarget, ListTableMetadataInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = (), string? maxResults = (), string? nextToken = ()) returns ListTableMetadataOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.ListTableMetadata`;
        map<anydata> queryParam = {"MaxResults": maxResults, "NextToken": nextToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListTableMetadataOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Lists the tags associated with an Athena workgroup or data catalog resource.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + maxResults - Pagination limit 
    # + nextToken - Pagination token 
    # + xAmzTarget - Amazon target action 
    # + payload - List tags for resource input 
    # + return - Success 
    remote isolated function listTagsForResource(string xAmzTarget, ListTagsForResourceInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = (), string? maxResults = (), string? nextToken = ()) returns ListTagsForResourceOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.ListTagsForResource`;
        map<anydata> queryParam = {"MaxResults": maxResults, "NextToken": nextToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListTagsForResourceOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Lists available workgroups for the account.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + maxResults - Pagination limit 
    # + nextToken - Pagination token 
    # + xAmzTarget - Amazon target action 
    # + payload - List workgroups input 
    # + return - Success 
    remote isolated function listWorkGroups(string xAmzTarget, ListWorkGroupsInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = (), string? maxResults = (), string? nextToken = ()) returns ListWorkGroupsOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.ListWorkGroups`;
        map<anydata> queryParam = {"MaxResults": maxResults, "NextToken": nextToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListWorkGroupsOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Runs the SQL query statements contained in the <code>Query</code>. Requires you to have access to the workgroup in which the query ran. Running queries against an external catalog requires <a>GetDataCatalog</a> permission to the catalog. For code samples using the Amazon Web Services SDK for Java, see <a href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Start query execution input 
    # + return - Success 
    remote isolated function startQueryExecution(string xAmzTarget, StartQueryExecutionInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns StartQueryExecutionOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.StartQueryExecution`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StartQueryExecutionOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # <p>Stops a query execution. Requires you to have access to the workgroup in which the query ran.</p> <p>For code samples using the Amazon Web Services SDK for Java, see <a href="http://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.</p>
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Stop query execution input 
    # + return - Success 
    remote isolated function stopQueryExecution(string xAmzTarget, StopQueryExecutionInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns StopQueryExecutionOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.StopQueryExecution`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StopQueryExecutionOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Adds one or more tags to an Athena resource. A tag is a label that you assign to a resource. In Athena, a resource can be a workgroup or data catalog. Each tag consists of a key and an optional value, both of which you define. For example, you can use tags to categorize Athena workgroups or data catalogs by purpose, owner, or environment. Use a consistent set of tag keys to make it easier to search and filter workgroups or data catalogs in your account. For best practices, see <a href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">Tagging Best Practices</a>. Tag keys can be from 1 to 128 UTF-8 Unicode characters, and tag values can be from 0 to 256 UTF-8 Unicode characters. Tags can use letters and numbers representable in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case-sensitive. Tag keys must be unique per resource. If you specify more than one tag, separate them by commas.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - tag resource input 
    # + return - Success 
    remote isolated function tagResource(string xAmzTarget, TagResourceInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns TagResourceOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.TagResource`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TagResourceOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Removes one or more tags from a data catalog or workgroup resource.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Untag resource input 
    # + return - Success 
    remote isolated function untagResource(string xAmzTarget, UntagResourceInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns UntagResourceOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.UntagResource`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UntagResourceOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Updates the data catalog that has the specified name.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Update data catalog input 
    # + return - Success 
    remote isolated function updateDataCatalog(string xAmzTarget, UpdateDataCatalogInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns UpdateDataCatalogOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.UpdateDataCatalog`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateDataCatalogOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Updates a prepared statement.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Update prepared statement input 
    # + return - Success 
    remote isolated function updatePreparedStatement(string xAmzTarget, UpdatePreparedStatementInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns UpdatePreparedStatementOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.UpdatePreparedStatement`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdatePreparedStatementOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Updates the workgroup with the specified name. The workgroup's name cannot be changed.
    #
    # + xAmzContentSha256 - Amazon content sha256 
    # + xAmzDate - The date that is used to create the signature. The format must be ISO 8601 basic format (YYYYMMDD'T'HHMMSS'Z'). For example, the following date time is a valid X-Amz-Date value `20120325T120000Z`. 
    # + xAmzAlgorithm - The hash algorithm that you used to create the request signature. 
    # + xAmzCredential - The credential scope value, which is a string that includes your access key, the date, the region you are targeting, the service you are requesting, and a termination string ("aws4_request"). The value is expressed in the following format access_key/YYYYMMDD/region/service/aws4_request. 
    # + xAmzSecurityToken - The temporary security token that was obtained through a call to AWS Security Token Service (AWS STS). 
    # + xAmzSignature - Specifies the hex-encoded signature that was calculated from the string to sign and the derived signing key. 
    # + xAmzSignedheaders - Specifies all the HTTP headers that were included as part of the canonical request. 
    # + xAmzTarget - Amazon targert action 
    # + payload - Update workgroup input 
    # + return - Success 
    remote isolated function updateWorkGroup(string xAmzTarget, UpdateWorkGroupInput payload, string? xAmzContentSha256 = (), string? xAmzDate = (), string? xAmzAlgorithm = (), string? xAmzCredential = (), string? xAmzSecurityToken = (), string? xAmzSignature = (), string? xAmzSignedheaders = ()) returns UpdateWorkGroupOutput|error {
        string resourcePath = string `/#X-Amz-Target=AmazonAthena.UpdateWorkGroup`;
        map<any> headerValues = {"X-Amz-Content-Sha256": xAmzContentSha256, "X-Amz-Date": xAmzDate, "X-Amz-Algorithm": xAmzAlgorithm, "X-Amz-Credential": xAmzCredential, "X-Amz-Security-Token": xAmzSecurityToken, "X-Amz-Signature": xAmzSignature, "X-Amz-SignedHeaders": xAmzSignedheaders, "X-Amz-Target": xAmzTarget, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateWorkGroupOutput response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
}
