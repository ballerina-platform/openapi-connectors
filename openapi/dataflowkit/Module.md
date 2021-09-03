## Overview
This is a generated connector for [Dataflow Kit API v1.3](https://dataflowkit.com/doc-api) OpenAPI specification.  
The Dataflow Kit API provides the capability to automate web scraping tasks, extract, process, and transform data from multiple pages at any scale.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
1. Create a [Dataflow Kit account](https://account.dataflowkit.com/signup).
2. Obtain tokens - Follow [this guide](https://dataflowkit.com/doc-api#section/Authentication).

## Quickstart
To use the Dataflow Kit connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the ballerinax/dataflowkit module into the Ballerina project.
```ballerina
import ballerinax/dataflowkit;
```

### Step 2: Create a new connector instance
You can now make the connection configuration using the Dataflow Kit API keys config.

```ballerina
dataflowkit:ApiKeysConfig & readonly apiKeyConfig = ?;
dataflowkit:Client baseClient = check new Client(apiKeyConfig);
```

### Step 3: Invoke connector operation
Following is code demonstrates how to convert an URL to a pdf using `ballerinax/dataflowkit` connector. 

```ballerina
public function main() returns error? {
    string entity = check baseClient->urlToPdf({url: "https://dataflowkit.com/doc-api#section/Authentication"});
}
```
