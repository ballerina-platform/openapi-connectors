## Overview
This is a generated connector for [OpenFIGI API v3](https://www.openfigi.com/api) OpenAPI Specification.

OpenFIGI API provides capability to access multiple tools for identifying, mapping and requesting a free and open symbology dataset. 
This user friendly platform provides the ultimate understanding for how a unique identifier combined with accurate, 
associated metadata can eliminate redundant mapping processes, streamline the trade workflow and reduce operational risk.
 
## Prerequisites
Before using this connector in your Ballerina application, complete the following:

* Create OpenFIGI account
* Obtaining tokens
    * Follow [this link](https://www.openfigi.com/api#api-key) to obtain an API key
 
## Quickstart
 
To use the openfigi connector in your Ballerina application, update the .bal file as follows:
* Mapping third party identifiers to FIGIs
### Step 1 - Import connector
```ballerina
import ballerinax/openfigi;
```
### Step 2 - Create a new connector instance
```ballerina
configurable openfigi:ApiKeysConfig & readonly apiKeyConfig = ?;
openfigi:Client baseClient = check new Client(apiKeyConfig);
```
### Step 3 - Invoke connector operation
1. Invoke connector operation using the client.
```ballerina
    openfigi:MappingJob mapping = {
        idType: "<ID Type>",
        idValue: <ID value>
    };
    openfigi:BulkMappingJob bulkJob = [mapping];
    openfigi:BulkMappingJobResult result = check baseClient->mapping(bulkJob);
```
2. Use `bal run` command to compile and run the Ballerina program.