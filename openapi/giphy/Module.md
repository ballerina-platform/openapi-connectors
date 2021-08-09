## Overview
This is a generated connector for [Giphy API v1](https://developers.giphy.com/docs/api/) OpenAPI Specification.

Giphy API provides the capability to access GIFs and stickers.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
- Create a [Giphy account](https://giphy.com/login)
- Obtain tokens - Follow [this guide](https://support.giphy.com/hc/en-us/articles/360020283431-Request-A-GIPHY-API-Key)
 
## Quickstart
To use the Giphy connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import connector
First, import the ballerinax/giphy module into the Ballerina project.
```ballerina
import ballerinax/giphy;
```

### Step 2: Create a new connector instance
Create a `giphy:ApiKeysConfig` with the tokens obtained, and initialize the connector with it.

```ballerina
giphy:ApiKeysConfig configuration = <API_KEY_PAIR>

giphy:Client giphyClient = check new(configuration);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.  
Following is an example on how to get a random GIF using the connector.

    ```ballerina
    public function main() returns error? {
        giphy:Response entity = check giphyClient->randomGif();
    }
    ```
2. Use `bal run` command to compile and run the Ballerina program.
