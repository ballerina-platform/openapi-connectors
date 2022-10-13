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

# Result of running a website scan
public type WebsiteScanResult record {
    # True if the scan contained no threats, false otherwise
    boolean CleanResult?;
    # Type of threat returned; can be None, Malware, ForcedDownload or Phishing
    string WebsiteThreatType?;
    # Array of viruses found, if any
    VirusFound[]? FoundViruses?;
    # The remote server URL HTTP reasponse code; useful for debugging issues with scanning; typically if the remote server returns a 200 or 300-series code this means a successful response, while a 400 or 500 series code would represent an error returned from the remote server for the provided URL.
    int WebsiteHttpResponseCode?;
};

# Result of running an advanced virus scan on cloud storage
public type CloudStorageAdvancedVirusScanResult record {
    # True if the operation of retrieving the file, and scanning it were successfully completed, false if the file could not be downloaded from cloud storage, or if the file could not be scanned.  Note that successful completion does not mean the file is clean; for the output of the virus scanning operation itself, use the CleanResult and FoundViruses parameters.
    boolean Successful?;
    # True if the scan contained no viruses, false otherwise
    boolean CleanResult?;
    # True if the scan contained an executable (application code), which can be a significant risk factor
    boolean ContainsExecutable?;
    # True if the scan contained an invalid file (such as a PDF that is not a valid PDF, Word Document that is not a valid Word Document, etc.), which can be a significant risk factor
    boolean ContainsInvalidFile?;
    # True if the scan contained a script (such as a PHP script, Python script, etc.) which can be a significant risk factor
    boolean ContainsScript?;
    # True if the scan contained a password protected or encrypted file, which can be a significant risk factor
    boolean ContainsPasswordProtectedFile?;
    # True if the uploaded file is of a type that is not allowed based on the optional restrictFileTypes parameter, false otherwise; if restrictFileTypes is not set, this will always be false
    boolean ContainsRestrictedFileFormat?;
    # True if the uploaded file contains embedded Macros of other embedded threats within the document, which can be a significant risk factor
    boolean ContainsMacros?;
    # For file format verification-supported file formats, the contents-verified file format of the file.  Null indicates that the file format is not supported for contents verification.  If a Virus or Malware is found, this field will always be set to Null.
    string VerifiedFileFormat?;
    # Array of viruses found, if any
    CloudStorageVirusFound[] FoundViruses?;
    # Detailed error message if the operation was not successful
    string ErrorDetailedDescription?;
    # Size in bytes of the file that was retrieved and scanned
    int FileSize?;
};

# Request to scan a website for malicious content
public type WebsiteScanRequest record {
    # URL of the website to scan; should begin with http:// or https://
    string Url?;
};

# Result of running an advanced virus scan
public type VirusScanAdvancedResult record {
    # True if the scan contained no viruses, false otherwise
    boolean CleanResult?;
    # True if the scan contained an executable (application code), which can be a significant risk factor
    boolean ContainsExecutable?;
    # True if the scan contained an invalid file (such as a PDF that is not a valid PDF, Word Document that is not a valid Word Document, etc.), which can be a significant risk factor
    boolean ContainsInvalidFile?;
    # True if the scan contained a script (such as a PHP script, Python script, etc.) which can be a significant risk factor
    boolean ContainsScript?;
    # True if the scan contained a password protected or encrypted file, which can be a significant risk factor
    boolean ContainsPasswordProtectedFile?;
    # True if the uploaded file is of a type that is not allowed based on the optional restrictFileTypes parameter, false otherwise; if restrictFileTypes is not set, this will always be false
    boolean ContainsRestrictedFileFormat?;
    # True if the uploaded file contains embedded Macros of other embedded threats within the document, which can be a significant risk factor
    boolean ContainsMacros?;
    # True if the uploaded file contains embedded XML External Entity threats of other embedded threats within the document, which can be a significant risk factor
    boolean ContainsXmlExternalEntities?;
    # For file format verification-supported file formats, the contents-verified file format of the file.  Null indicates that the file format is not supported for contents verification.  If a Virus or Malware is found, this field will always be set to Null.
    string VerifiedFileFormat?;
    # Array of viruses found, if any
    VirusFound[] FoundViruses?;
};

# Virus positively identified
public type CloudStorageVirusFound record {
    # Name of the file containing the virus
    string FileName?;
    # Name of the virus that was found
    string VirusName?;
};

# Result of running a virus scan on cloud storage
public type CloudStorageVirusScanResult record {
    # True if the operation of retrieving the file, and scanning it were successfully completed, false if the file could not be downloaded from cloud storage, or if the file could not be scanned.  Note that successful completion does not mean the file is clean; for the output of the virus scanning operation itself, use the CleanResult and FoundViruses parameters.
    boolean Successful?;
    # True if the scan contained no viruses, false otherwise
    boolean CleanResult?;
    # Array of viruses found, if any
    CloudStorageVirusFound[] FoundViruses?;
    # Detailed error message if the operation was not successful
    string ErrorDetailedDescription?;
    # Size in bytes of the file that was retrieved and scanned
    int FileSize?;
};

# Result of running a virus scan
public type VirusScanResult record {
    # True if the scan contained no viruses, false otherwise
    boolean CleanResult?;
    # Array of viruses found, if any
    VirusFound[] FoundViruses?;
};

# Virus positively identified
public type VirusFound record {
    # Name of the file containing the virus
    string FileName?;
    # Name of the virus that was found
    string VirusName?;
};
