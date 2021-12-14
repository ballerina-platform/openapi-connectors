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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `Apikey`
    string apikey;
|};

# This is a generated connector from [Cloudmersive](https://account.cloudmersive.com) OpenAPI specification.
# The Cloudmersive Virus Scan API lets you scan files and content for viruses and identify security issues with content.
@display {label: "Cloudmersive Virus Scan", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Cloudmersive account](https://account.cloudmersive.com/login) and obtain tokens following [this guide](https://account.cloudmersive.com/keys).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://testapi.cloudmersive.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Scan a website for malicious content and threats
    #
    # + return - OK 
    remote isolated function scanWebsite(WebsiteScanRequest payload) returns WebsiteScanResult|error {
        string resourcePath = string `/virus/scan/website`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WebsiteScanResult response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Scan an Azure Blob for viruses
    #
    # + connectionString - Connection string for the Azure Blob Storage Account; you can get this connection string from the Access Keys tab of the Storage Account blade in the Azure Portal. 
    # + containerName - Name of the Blob container within the Azure Blob Storage account 
    # + blobPath - Path to the blob within the container, such as 'hello.pdf' or '/folder/subfolder/world.pdf' 
    # + return - OK 
    remote isolated function scanCloudStorageScanAzureBlob(string connectionString, string containerName, string blobPath) returns CloudStorageVirusScanResult|error {
        string resourcePath = string `/virus/scan/cloud-storage/azure-blob/single`;
        map<any> headerValues = {"connectionString": connectionString, "containerName": containerName, "blobPath": blobPath, "Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        CloudStorageVirusScanResult response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Advanced Scan an Azure Blob for viruses
    #
    # + connectionString - Connection string for the Azure Blob Storage Account; you can get this connection string from the Access Keys tab of the Storage Account blade in the Azure Portal. 
    # + containerName - Name of the Blob container within the Azure Blob Storage account 
    # + blobPath - Path to the blob within the container, such as 'hello.pdf' or '/folder/subfolder/world.pdf' 
    # + allowExecutables - Set to false to block executable files (program code) from being allowed in the input file.  Default is false (recommended). 
    # + allowInvalidFiles - Set to false to block invalid files, such as a PDF file that is not really a valid PDF file, or a Word Document that is not a valid Word Document.  Default is false (recommended). 
    # + allowScripts - Set to false to block script files, such as a PHP files, Python scripts, and other malicious content or security threats that can be embedded in the file.  Set to true to allow these file types.  Default is false (recommended). 
    # + allowPasswordProtectedFiles - Set to false to block password protected and encrypted files, such as encrypted zip and rar files, and other files that seek to circumvent scanning through passwords.  Set to true to allow these file types.  Default is false (recommended). 
    # + allowMacros - Set to false to block macros and other threats embedded in document files, such as Word, Excel and PowerPoint embedded Macros, and other files that contain embedded content threats.  Set to true to allow these file types.  Default is false (recommended). 
    # + restrictFileTypes - Specify a restricted set of file formats to allow as clean as a comma-separated list of file formats, such as .pdf,.docx,.png would allow only PDF, PNG and Word document files.  All files must pass content verification against this list of file formats, if they do not, then the result will be returned as CleanResult=false.  Set restrictFileTypes parameter to null or empty string to disable; default is disabled. 
    # + return - OK 
    remote isolated function scanCloudStorageScanAzureBlobAdvanced(string connectionString, string containerName, string blobPath, boolean? allowExecutables = (), boolean? allowInvalidFiles = (), boolean? allowScripts = (), boolean? allowPasswordProtectedFiles = (), boolean? allowMacros = (), string? restrictFileTypes = ()) returns CloudStorageAdvancedVirusScanResult|error {
        string resourcePath = string `/virus/scan/cloud-storage/azure-blob/single/advanced`;
        map<any> headerValues = {"connectionString": connectionString, "containerName": containerName, "blobPath": blobPath, "allowExecutables": allowExecutables, "allowInvalidFiles": allowInvalidFiles, "allowScripts": allowScripts, "allowPasswordProtectedFiles": allowPasswordProtectedFiles, "allowMacros": allowMacros, "restrictFileTypes": restrictFileTypes, "Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        CloudStorageAdvancedVirusScanResult response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Scan an AWS S3 file for viruses
    #
    # + accessKey - AWS S3 access key for the S3 bucket; you can get this from My Security Credentials in the AWS console 
    # + secretKey - AWS S3 secret key for the S3 bucket; you can get this from My Security Credentials in the AWS console 
    # + bucketRegion - Name of the region of the S3 bucket, such as 'US-East-1' 
    # + bucketName - Name of the S3 bucket 
    # + keyName - Key name (also called file name) of the file in S3 that you wish to scan for viruses 
    # + return - OK 
    remote isolated function scanCloudStorageScanAwsS3file(string accessKey, string secretKey, string bucketRegion, string bucketName, string keyName) returns CloudStorageVirusScanResult|error {
        string resourcePath = string `/virus/scan/cloud-storage/aws-s3/single`;
        map<any> headerValues = {"accessKey": accessKey, "secretKey": secretKey, "bucketRegion": bucketRegion, "bucketName": bucketName, "keyName": keyName, "Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        CloudStorageVirusScanResult response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Advanced Scan an AWS S3 file for viruses
    #
    # + accessKey - AWS S3 access key for the S3 bucket; you can get this from My Security Credentials in the AWS console 
    # + secretKey - AWS S3 secret key for the S3 bucket; you can get this from My Security Credentials in the AWS console 
    # + bucketRegion - Name of the region of the S3 bucket, such as 'US-East-1' 
    # + bucketName - Name of the S3 bucket 
    # + keyName - Key name (also called file name) of the file in S3 that you wish to scan for viruses 
    # + allowExecutables - Set to false to block executable files (program code) from being allowed in the input file.  Default is false (recommended). 
    # + allowInvalidFiles - Set to false to block invalid files, such as a PDF file that is not really a valid PDF file, or a Word Document that is not a valid Word Document.  Default is false (recommended). 
    # + allowScripts - Set to false to block script files, such as a PHP files, Python scripts, and other malicious content or security threats that can be embedded in the file.  Set to true to allow these file types.  Default is false (recommended). 
    # + allowPasswordProtectedFiles - Set to false to block password protected and encrypted files, such as encrypted zip and rar files, and other files that seek to circumvent scanning through passwords.  Set to true to allow these file types.  Default is false (recommended). 
    # + allowMacros - Set to false to block macros and other threats embedded in document files, such as Word, Excel and PowerPoint embedded Macros, and other files that contain embedded content threats.  Set to true to allow these file types.  Default is false (recommended). 
    # + restrictFileTypes - Specify a restricted set of file formats to allow as clean as a comma-separated list of file formats, such as .pdf,.docx,.png would allow only PDF, PNG and Word document files.  All files must pass content verification against this list of file formats, if they do not, then the result will be returned as CleanResult=false.  Set restrictFileTypes parameter to null or empty string to disable; default is disabled. 
    # + return - OK 
    remote isolated function scanCloudStorageScanAwsS3fileAdvanced(string accessKey, string secretKey, string bucketRegion, string bucketName, string keyName, boolean? allowExecutables = (), boolean? allowInvalidFiles = (), boolean? allowScripts = (), boolean? allowPasswordProtectedFiles = (), boolean? allowMacros = (), string? restrictFileTypes = ()) returns CloudStorageAdvancedVirusScanResult|error {
        string resourcePath = string `/virus/scan/cloud-storage/aws-s3/single/advanced`;
        map<any> headerValues = {"accessKey": accessKey, "secretKey": secretKey, "bucketRegion": bucketRegion, "bucketName": bucketName, "keyName": keyName, "allowExecutables": allowExecutables, "allowInvalidFiles": allowInvalidFiles, "allowScripts": allowScripts, "allowPasswordProtectedFiles": allowPasswordProtectedFiles, "allowMacros": allowMacros, "restrictFileTypes": restrictFileTypes, "Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        CloudStorageAdvancedVirusScanResult response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
}
