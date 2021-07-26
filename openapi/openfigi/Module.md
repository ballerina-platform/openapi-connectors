## Overview
OpenFIGI is an entry point to multiple tools for identifying, mapping and requesting a free and open symbology dataset. This connector provides the facility to map from third-party identifiers to FIGI and  Get the current list of values for the enum-like properties on Mapping Job.
 
This module supports v3 version.
 
## Configuring connector
### Prerequisites
* OpenFIGI account
### Obtaining tokens
* Follow [this link](https://www.openfigi.com/api) to obtain an API key
 
## Quickstart
* Mapping third party identifiers to FIGIs
1. Import the module
```ballerina
import ballerinax/openfigi;
```
2. Add the API key to your Config.toml
```ballerina
   [apiKeyConfig.apiKeys]
    X-OPENFIGI-APIKEY = "<API key>"
```
3. Initialize a client
```ballerina
openfigi:Client baseClient = check new Client(apiKeyConfig);
```
4. Map the third party identifiers to FIGIs
```ballerina
    openfigi:MappingJob mapDetail = {
        idType: "<ID Type>",
        idValue: <ID value>
    };
    openfigi:BulkMappingJob bulkJob = [mapDetail];
    openfigi:BulkMappingJobResult result = check baseClient->mapping(bulkJob);
```