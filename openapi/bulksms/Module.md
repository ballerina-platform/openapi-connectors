Connects to BulkSMS.com API from Ballerina. 

## Module Overview

The BulkSMS connector consume the data exposed in [https://api.bulksms.com/v1](https://api.bulksms.com/v1). It is 
currently supporting following operations.
- Create BlockedNumber
- Create Webhook
- Delete Webhook
- Get Message
- Get Profile
- Get SentMessages
- Get WebhookByID
- List BlockedNumbers
- List Webhooks
- Retrieve Messages
- Send Batch Messages
- Send Message
- Update Webhook


## Compatibility

|                       |    Version                  |
|:---------------------:|:---------------------------:|
| Ballerina Language    | Swan-Lake-Alpha5            |
| BulkSMS API           | v1                          |


# Quickstart

## Obtain Tokens for Authentication

* Provide the username and password for the Authentication.

### Client configuration

1.  Add Config.toml file including the username and password as follows,
```
[<Org Name>.authConfig]
username = <userName>
password = <password>

```
2. Import the bulkSMS module and others
```
import ballerinax/bulksms;
import ballerina/log;
```

3. Initialize a client 
```ballerina
    //Client Initialization
    configurable http:CredentialsConfig & readonly authConfig = ?;
    ClientConfig clientConfig = {authConfig : authConfig};
    Client baseClient = check new Client(clientConfig);
```
4. Use the client to call its remote functions as the following code
```
    //Calling getProfile remote function  of the created client
    var profile = baseClient->getProfile();
    if profile is Profile {
        log:printInfo(profile.toString());
    } else {
        log:printError(profile.toString());
    }
```