## Overview
Ballerina connector for Giphy is connecting the [Giphy API](https://developers.giphy.com/docs/api/) via Ballerina language easily. It provides functions to get GIFs and stickers.

This module supports Giphy API version 1.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
- Create [Giphy account](https://giphy.com/login)
- Obtain tokens - Follow [this link](https://support.giphy.com/hc/en-us/articles/360020283431-Request-A-GIPHY-API-Key)
 
## Quickstart
To use the Giphy connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import Giphy module
First, import the ballerinax/giphy module into the Ballerina project.
```ballerina
import ballerinax/giphy;
```

### Step 2: Initialize Giphy client
You can now make the connection configuration using the Giphy API keys config.

```ballerina
giphy:ApiKeysConfig configuration = <API_KEY_PAIR>

giphy:Client giphyClient = check new (configuration);
```

### Step 3: Create get a random GIF operation
Following is code demonstrates how to get a random GIF using `ballerinax/giphy` connector. 

```ballerina
public function main() returns error? {
    giphy:Response entity = check giphyClient->randomGif();
}
```
