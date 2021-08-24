## Overview

This is a generated connector from [Spotify API v1](https://developer.spotify.com/documentation/web-api/) OpenAPI Specification. 

Through the Spotify Web API, external applications retrieve Spotify content such as album data and playlists.

## Configuring connector

### Prerequisites

* Create Spotify user account by simply signing up at www.spotify.com.
* Obtain tokens
    - Visit the [Dashboard](https://developer.spotify.com/dashboard/login) page at the Spotify Developer website and, if necessary, log in. Accept the latest Developer [Terms of Service](https://developer.spotify.com/terms/) to complete your account set up.
    - Follow the steps that are given in [here](Web API authentication visit [here](https://developer.spotify.com/documentation/general/guides/authorization-guide/)) to obtain tokens. 
 
## Quickstart

To use the Spotify connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector

```ballerina
import ballerinax/spotify;
```

### Step 2: Create a new connector instance

Configure the connection using OAuth2 refresh token grant config.

```ballerina
spotify:Configuration configuration = {
    auth: {
        refreshUrl: "https://accounts.spotify.com/api/token",
        refreshToken : "<REFRESH_TOKEN>",
        clientId : "<CLIENT_ID>",
        clientSecret : "<CLIENT_SECRET>"
    }
};

spotify:Client spotifyClient = check new (configuration);
```

### Step 3: Invoke  connector operation

1. Get list newly released albums in spotify. 

```ballerina
public function main() returns error? {
    spotify:NewReleasesObject newReleases = check spotifyClient->getNewReleses();
}
```
2. Use `bal run` command to compile and run the Ballerina program. 
