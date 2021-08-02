## Overview

The Zoom connector consumes the data exposed in https://api.zoom.us/v2. 

This module supports Zoom API version 2.0.0. 

## Configuring connector

### Obtaining tokens

Follow the steps below to obtain the configurations.

1. If you don’t have a Zoom account yet, create your new account by clicking the ‘Sign Up’ link here: https://marketplace.zoom.us/. Once you activate your account, you’ll be ready to join as a Developer account.
2. Create an OAuth2.0 app by visiting [Zoom App Marketplace](https://marketplace.zoom.us/develop/create). Then provide app related information and get client credentials. Please follow the steps in [here](https://marketplace.zoom.us/docs/guides/build/oauth-app) to create and publish a zoom app successfully. 
3. Generate access token and refresh token for your Zoom app following the authorization code flow. Follow the detailed steps given [here](https://marketplace.zoom.us/docs/guides/auth/oauth)
    - Please note that to set live stream details meeting host need to have a Pro license. 
4. The above step should result in a response as follows
    ```
    {
        "access_token": "<ACCESS_TOKEN>",
        "token_type": "bearer",
        "refresh_token": "<REFRESH_TOKEN>",
        "expires_in": 3599,
        "scope": "<LIST_OF_SCOPES>"
    }
    ```
    - Please note that once you stop the deployment of the template you need to provide new refresh token for the next run.
5. Use the `Client Id`, `Client Secret`, `Refresh Token` obtained from above steps to configure `ballerinax/zoom` connector. 
 
## Quickstart

### Step 1: Import Zoom module
First, import the ballerinax/zoom module into the Ballerina project.

```ballerina
import ballerinax/zoom;
```

### Step 2: Configure the connection credentials.
You can now make the connection configuration using the OAuth2 refresh token grant config.

```ballerina
zoom:Configuration configuration = {
    authConfig: {
        refreshUrl: "https://zoom.us/oauth/token",
        refreshToken : "<REFRESH_TOKEN>",
        clientId : "<CLIENT_ID>",
        clientSecret : "<CLIENT_SECRET>"
    }
};

zoom:Client zoomClient = check new (configuration);
```

### Step 3: Create Zoom meeting
Following is code demonstrates how to create a zoom meeting using `ballerinax/zoom` connector. 

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

## Snippets

* Get Zoom meeting invitation by meeting Id
    ```ballerina
    int meetingId = 1234;
    zoom:GetMeetingInvitationResponse meetingInvitation = check zoomClient->getMeetingInvitation(meetingId);
    ```
* Get list of Zoom webinar participants. 
    ```ballerina
    string webinarId = "1234";
    zoom:ListWebinarParticipantsResponse listWebinarParticipantsResponse = check zoomClient->listWebinarParticipants(webinarId);
    ```
 
