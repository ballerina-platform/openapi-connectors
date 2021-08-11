##  Overview

This is a generated connector for [BulkSMS API v1](https://www.bulksms.com/developer/) OpenAPI Specification.

BulkSMS API provides capability to access you to submit and receive [BulkSMS](https://www.bulksms.com/) messages. You can also get 
access to past messages and see your account profile. Dates are formatted according to ISO-8601, such as `1970-01-01T10:00:00+01:00` for 1st January 1970, 10AM UTC+1. It currently supports operations on messages, numbers, user profile, webhooks, and batch messages.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:
* Create [bulkSMS account](https://www.bulksms.com/)
* Obtaining tokens
1. Provide the username and password for the Authentication. Follow [this link](https://www.bulksms.com/developer/json/v1/#section/Authentication) for more detail

## Quickstart

To use the bulkSMS connector in your Ballerina application, update the .bal file as follows:

### Step 1 - Import connector
```ballerina
import ballerinax/bulksms;
```

 ### Step 2 - Create a new connector instance
```ballerina
configurable http:CredentialsConfig & readonly authConfig = ?;
bulksms:ClientConfig clientConfig = {authConfig : authConfig};
bulksms:Client baseClient = check new Client(clientConfig);
```
### Step 3 - Invoke  connector operation
1. Invoking connector operations using the client
```ballerina
    bulksms:Profile profile = check baseClient->getProfile();

```
2. Use `bal run` command to compile and run the Ballerina program.

