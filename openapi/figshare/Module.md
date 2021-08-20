## Overview
This is a generated connector for [Figshare API v2.0.0](https://docs.figshare.com/) OpenAPI specification. Figshare is a repository where users can make all of their research outputs available in a citable, shareable and discoverable manner.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Figshare account](https://figshare.com/account/register)
* Obtain tokens - Follow [this link](https://figshare.com/account/applications)
 
## Quickstart

To use the Figshare connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the ballerinax/figshare module into the Ballerina project.
```ballerina
import ballerinax/figshare;
```
### Step 2: Create a new connector instance

You can now enter the credentials in the Figshare client configuration and create Figshare client by passing the configuration:

```ballerina
configurable http:BearerTokenConfig & readonly authConfig = ?;
figshare:ClientConfig clientConfig = {auth : authConfig};

figshare:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation

1. You can get public articles as follows with `listPublicArticles` method.
    ```ballerina
    figshare:Article[] articles = check baseClient->listPublicArticles();
    ```
2. Use `bal run` command to compile and run the Ballerina program. 