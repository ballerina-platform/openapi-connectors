## Overview
Ballerina connector for New York Times TimesTags is connecting the [New York Times TimesTags API](https://developer.nytimes.com/docs/timestags-product/1/overview) via Ballerina language easily. With the New York Times TimesTags API you can get NYTimes controlled vocabulary. With the TimesTags API, you can mine the riches of the New York Times tag set. The TimesTags service matches your query to the controlled vocabularies that fuel NYTimes.com metadata. You supply a string of characters, and the service returns a ranked list of suggested terms. The TimesTags service can help you build a tag set, standardize names of people and organizations, or identify subjects that are currently making news. Information architects and librarians may also wish to compare Times tags to Library of Congress subject headings and other classification systems.

This module supports [New York Times TimesTags API](https://developer.nytimes.com/docs/timestags-product/1/overview).

## Configuring Connector

### Prerequisites
- An [NYTimes](https://developer.nytimes.com/accounts/login) Developer Account

### Obtaining tokens
1. Log into NYTimes Developer Portal by visiting https://developer.nytimes.com/accounts/login
2. Register an app in order to obtain the API Key.
    - Select `My Apps` from the user drop-down.
    - Click `+ New App` to create a new app.
    - Enter a name and description for the app in the New App dialog.
    - Click `Create`.
    - Click the `APIs` tab.
    - Click the access toggle to enable or disable access to an API product from the app.
3. Access the API Key.
    - Select `My Apps` from th user drop-down.
    - Click the app in the list.
    - View the API key on the `App Details` tab.
    - Confirm that the status of the API key is Approved.
4. The whole process is summarized [here](https://developer.nytimes.com/get-started).
 
## Quickstart

### Get Tags Based on a Few Characters

#### Step 1: Import New York Times Newswire module
First, import the ballerinax/nytimes.timestags module into the Ballerina project.
```ballerina
import ballerinax/nytimes.timestags as nt;
```
#### Step 2: Initialize the client.
You can initialize the client as follows. You can now provide the API key obtained from the [NYTimes Developer Portal](https://developer.nytimes.com/accounts/login) in the configuration.
```ballerina
nt:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>"
    }
}
nt:Client baseClient = check new Client(config);
```
#### Step 3: Get tags based on a few characters.
You can now get tags based on a few characters, searching all dictionaries. Here we have searched for tags with characters "cel".

```ballerina
public function main() {
    nt:TimesTags|error response = baseClient->timestags("cel");
    if (response is nt:TimesTags) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.message());
    }
}
``` 

### Get Names of People and Organizations

#### Step 1: Import New York Times Newswire module
First, import the ballerinax/nytimes.timestags module into the Ballerina project.
```ballerina
import ballerinax/nytimes.timestags as nt;
```
#### Step 2: Initialize the client.
You can initialize the client as follows. You can now provide the API key obtained from the [NYTimes Developer Portal](https://developer.nytimes.com/accounts/login) in the configuration.
```ballerina
nt:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>"
    }
}
nt:Client baseClient = check new Client(config);
```
#### Step 3: Get names of people and organizations.
You can now get names of people and organizations. Here we have searched for people and organizations with characters "edwards".

```ballerina
public function main() {
    nt:TimesTags|error response = baseClient->timestags("edwards", "(Per),(Org)");
    if (response is nt:TimesTags) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.message());
    }
}
``` 
