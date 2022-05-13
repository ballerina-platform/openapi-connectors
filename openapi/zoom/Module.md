## Overview

This is a generated connector for [Zoom API v2.0.0](https://marketplace.zoom.us/docs/api-reference/zoom-api) OpenAPI Specification. 

The Zoom API allows developers to access information from Zoom. You can use this API to build private services or public applications on the [Zoom App Marketplace](http://marketplace.zoom.us). To learn how to get your credentials and create private/public applications, read our [Authorization Guide](https://marketplace.zoom.us/docs/guides/authorization/credentials). All endpoints are available via `https` and are located at `api.zoom.us/v2/`. For instance you can list all users on an account via `https://api.zoom.us/v2/users/`.

## Configuring connector

### Prerequisites

* Create a Zoom account by clicking the `Sign Up` link here: https://marketplace.zoom.us/. Once you activate your account, you’ll be ready to join as a developer.
* Obtain tokens
    - Create an OAuth2.0 app by visiting [Zoom App Marketplace](https://marketplace.zoom.us/develop/create). Then provide app related information and get client credentials. Please follow the steps in [here](https://marketplace.zoom.us/docs/guides/build/oauth-app) to create and publish a zoom app successfully. 
    - Generate tokens for your Zoom app following the authorization code flow. Follow the detailed steps given [here](https://marketplace.zoom.us/docs/guides/auth/oauth)
* Please note that to set live stream details meeting host need to have a Pro license. 

## Quickstart

To use the Zoom connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector

```ballerina
import ballerinax/zoom;
```

### Step 2: Create a new connector instance
Configure the connection using http:OAuth2RefreshTokenGrantConfig, http:BearerTokenConfig or http:JwtIssuerConfig

```ballerina
zoom:Configuration configuration = {
    auth: {
        refreshUrl: "https://zoom.us/oauth/token",
        refreshToken : "<REFRESH_TOKEN>",
        clientId : "<CLIENT_ID>",
        clientSecret : "<CLIENT_SECRET>"
    }
};

zoom:Client zoomClient = check new (configuration);
```

### Step 3: Invoke  connector operation
1. Create Zoom meeting 

```ballerina
public function main() returns error? {
    zoom:MeetingDetails meetingDetails = {
        topic: "My Test Meeting",
        start_time: "2021-07-15T13:00:00",
        duration: 60,
        timezone: "Asia/Calcutta"
    };
    zoom:CompoundCreateMeetingResponse meeting = check zoomClient->createMeeting("me", meetingDetails);
}
```
2. Use `bal run` command to compile and run the Ballerina program. 
