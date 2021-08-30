## Overview
This is a generated connector for [Readme API v2.0](https://docs.readme.com/reference) OpenAPI specification.  
The Readme API provides the capability to create product and API documentation programmatically.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
1. Create a [Readme account](https://dash.readme.com/signup).
2. Obtain tokens - Follow [this guide](https://docs.readme.com/reference/authentication).

## Quickstart
To use the Readme connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the ballerinax/readme module into the Ballerina project.
```ballerina
import ballerinax/readme;
```

### Step 2: Create a new connector instance
You can now make the connection configuration using the Readme API keys config.

```ballerina
http:CredentialsConfig & readonly authConfig = ?;
readme:ClientConfig clientConfig = {auth : authConfig};
readme:Client readmeClient = check new (clientConfig);
```

### Step 3: Invoke connector operation
Following is code demonstrates how to get a project using `ballerinax/readme` connector. 

```ballerina
public function main() returns error? {
    http:Response entity = check readmeClient->getProject();
}
```