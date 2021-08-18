## Overview
This is a generated connector for [Wordnik API v4.0](https://developer.wordnik.com/docs) OpenAPI specification. Wordnik is the worlds biggest online English dictionary, by number of words.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Wordnik account](https://developer.wordnik.com/#wordnikUsername)
* Obtain tokens - Follow [this link](https://developer.wordnik.com/gettingstarted)
 
## Quickstart

To use the Wordnik connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the ballerinax/wordnik module into the Ballerina project.
```ballerina
import ballerinax/wordnik;
```
### Step 2: Create a new connector instance

You can now enter the credentials in the Wordnik client configuration and create Wordnik client by passing the configuration:

```ballerina
wordnik:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>"
    }
};

wordnik:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation

1. You can get a random word as follows with `getRandomWord` method.
    ```ballerina
    wordnik:WordObject randomWord = check baseClient->getRandomWord();
    ```
2. Use `bal run` command to compile and run the Ballerina program. 