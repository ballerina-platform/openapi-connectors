## Overview
This is a generated connector for [Google My Business API v4.9](https://developers.google.com/my-business/) OpenAPI specification.
The Google My Business API provides an interface for managing business location information on Google.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Google account](https://accounts.google.com/signup)
* Obtain tokens - Follow [this link](https://developers.google.com/identity/protocols/oauth2)
 
## Quickstart

To use the Google My Business connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/googleapis.mybusiness` module into the Ballerina project.
```ballerina
import ballerinax/googleapis.mybusiness;
```

### Step 2: Create a new connector instance
Create a `mybusiness:ClientConfig` with the OAuth2 tokens obtained, and initialize the connector with it. 
```ballerina
mybusiness:ClientConfig clientConfig = {
    authConfig: {
        clientId: <CLIENT_ID>,
        clientSecret: <CLIENT_SECRET>,
        refreshUrl: <REFRESH_URL>,
        refreshToken: <REFRESH_TOKEN>
    }
};

mybusiness:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to return the paginated list of reviews for the specified location using the connector. This operation is only valid if the specified location is verified.

    Returns the paginated list of reviews for the specified location. 

    ```ballerina
    public function main() {
        mybusiness:ListReviewsResponse|error response = baseClient->listAccountsLocationsReviews("<The name of the location to fetch reviews for>");
        if (response is mybusiness:ListReviewsResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
