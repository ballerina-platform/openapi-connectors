## Overview
This is a generated connector for [Azure DataLake Storage (Gen2) API version 2019-10-31](https://azure.microsoft.com/en-us/solutions/data-lake/) OpenAPI specification.

Azure Data Lake Storage provides storage for Hadoop and other big data workloads.
 
## Prerequisites
- Create an [Azure](https://azure.microsoft.com/en-us/features/azure-portal/) account
- Create an [Azure Data Lake Storage(Gen2)](https://azure.microsoft.com/en-us/solutions/data-lake/) account
- Obtain tokens
    - Use [this](https://docs.microsoft.com/en-us/azure/active-directory/develop/quickstart-register-app) guide to obtain the credentials which are needed to create the <CLIENT_ID> and <CLIENT_SECRET>

## Quickstart
To use the Azure Data Lake Storage connector in your Ballerina application, update the .bal file as follows:
### Step 1 - Import connector
First, import the ballerinax/azure.datalake module into the Ballerina project.
```ballerina
import ballerinax/azure.datalake;
```
### Step 2 - Create a new connector instance
You can now make the connection configuration using the access token.
```ballerina
datalake:ClientConfig clientConfig = {
    auth : {
        token: token
    }
};

datalake:Client baseClient = check new Client(clientConfig, serviceUrl = "https://{accountName}.{dnsSuffix}");
```
### Step 3 - Invoke connector operation

1. List file systems

```ballerina
public function main() {
    datalake:FilesystemList|error fileSystemList = baseClient->filesystemList("account");
    if (fileSystemList is datalake:FilesystemList) {
        log:printInfo("Filesyatem List " + fileSystemList.toString());
    } else {
        log:printInfo("Error Occured");
    }
}
``` 
2. Use `bal run` command to compile and run the Ballerina program
