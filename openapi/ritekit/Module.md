## Overview
This is a generated connector for [RiteKit API v1.0](https://documenter.getpostman.com/view/2010712/SzS7Qku5?version=latest) OpenAPI specification.  
The RiteKit API provides the capability to perform social media marketing through hashtag suggestions, auto hashtagging, emoji suggestions, etc.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
1. Create a [RiteKit account](https://ritekit.com/).
2. Obtain tokens - Follow [this guide](https://documenter.getpostman.com/view/2010712/SzS7Qku5?version=latest#intro).

## Quickstart
To use the RiteKit connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the ballerinax/ritekit module into the Ballerina project.
```ballerina
import ballerinax/ritekit;
```

### Step 2: Create a new connector instance
You can now make the connection configuration using the RiteKit API keys config.

```ballerina
ritekit:ApiKeysConfig & readonly apiKeyConfig = ?;
ritekit:Client ritekitClient = check new (clientConfig);
```

### Step 3: Invoke connector operation
Following is code demonstrates how to get a project using `ballerinax/ritekit` connector. 

```ballerina
public function main() returns error? {
    json response = check ritekitClient->trendingHashtags();
}
```