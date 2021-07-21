## Overview
Ballerina connector for Storecove is connecting the [Storcove API](https://app.storecove.com/docs) via Ballerina language. It provides e-invoice management service.

This module supports Storecove API version 2.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
- Create [Storecove account](https://www.storecove.com/us/en/companies)
- Obtain tokens - Follow [this link](https://app.storecove.com/docs#_getting_started)
 
## Quickstart
To use the Storecove connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import Storecove module
First, import the ballerinax/storecove module into the Ballerina project.
```ballerina
import ballerinax/storecove;
```

### Step 2: Initialize Storecove client
Create client using connection configuration.

```ballerina
storecove:ClientConfig configuration = {
    authConfig: {
        token : "<API_KEY>"
    }
};

storecove:Client storecoveClient = check new (configuration);
```

### Step 3: Create Get legal entity operation
Following is code demonstrates how to get legal entity using `ballerinax/storecove` connector.

```ballerina
public function main() returns error? {
    storecove:LegalEntity entity = check storecoveClient->getLegalEntity(123);
}
```
