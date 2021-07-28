## Overview
OpenFIGI is an entry point to multiple tools for identifying, mapping and requesting a free and open symbology dataset. This connector provides the facility to map from third-party identifiers to FIGI and  Get the current list of values for the enum-like properties on Mapping Job.
 
This module supports v3 version.
 
## Prerequisites
Before using this connector in your Ballerina application, complete the following:

* Create OpenFIGI account
* Obtaining tokens
    * Follow [this link](https://www.openfigi.com/api) to obtain an API key
* Configure the connector with obtained tokens
 
## Quickstart
 
To use the openfigi connector in your Ballerina application, update the .bal file as follows:
* Mapping third party identifiers to FIGIs
### Step 1: Import the module
```ballerina
import ballerinax/openfigi;
```
### Step 2: Add the API key to your Config.toml
```ballerina
   [apiKeyConfig.apiKeys]
    X-OPENFIGI-APIKEY = "<API key>"
```
### Step 3: Initialize a client
```ballerina
openfigi:Client baseClient = check new Client(apiKeyConfig);
```
### Step 4: Map the third party identifiers to FIGIs
```ballerina
    openfigi:MappingJob mapping = {
        idType: "<ID Type>",
        idValue: <ID value>
    };
    openfigi:BulkMappingJob bulkJob = [mapping];
    openfigi:BulkMappingJobResult result = check baseClient->mapping(bulkJob);
```