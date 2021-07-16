## Overview

The Ballerina Spotify connector consumes the data exposed in [https://api.spotify.com](https://api.spotify.com/v1).

This module supports Spotify API version 1. 

## Configuring connector

### Prerequisites

* Spotify Account 

### Obtaining tokens

Follow the steps below to obtain the configurations.

1. If you do not own a Spotify account create a Spotify user account by simply signing up at www.spotify.com. 
2. When you have a user account, go to the [Dashboard](https://developer.spotify.com/dashboard/login) page at the Spotify Developer website and, if necessary, log in. Accept the latest Developer [Terms of Service](https://developer.spotify.com/terms/) to complete your account set up.
3. Create an register an application
4. Copy your client id and client secret from the registered application and follow Authorization Code Flow to generate access token and refresh token
    - Send a `Get` request to the `/authorize` endpoint of the account service `GET https://accounts.spotify.com/authorize` adding following query parameters. 
        1. client_id        : Required. When you register your application, Spotify provides you a Client ID.
        2. response_type    : Required. Set to code.
        3. redirect_uri     : Required. The URI to redirect to after the user grants or denies permission. This URI needs to have been entered in the Redirect URI whitelist that you specified when you registered your application.
        4. state            : Optional. This provides protection against attacks such as cross-site request forgery.
        5. scope            : Optional. A space-separated list of scopes.If no scopes are specified, authorization will be granted only to access publicly available information
        6. show_dialog      : Optional. Whether or not to force the user to approve the app again if they’ve already done so.
    - Copy the `Authorization Code` received from the above request and send a `POST` request to obtain access token and refresh token to `/api/token` endpoint. `https://accounts.spotify.com/api/token` providing following request body parameters.
        1. grant_type   : Required. Set to `authorization_code`
        2. code         : Required. Authorization code received from above step.
        3. redirect_uri : Required. The value of this parameter must exactly match the value of redirect_uri supplied when requesting the authorization code.
    - You will receive a payload like below after sending above `POST` request.
        ```
            {
                "access_token": "NgCXRK...MzYjw",
                "token_type": "Bearer",
                "scope": "user-read-private user-read-email",
                "expires_in": 3600,
                "refresh_token": "NgAagA...Um_SHo"
            }
        ```
5. Once you obtained all configurations, use the `Client Id`, `Client Secret`, `Refresh Token` obtained from above steps to configure ballerinax/spotify connector.
- For more information about Spotify Web API authentication visit [here](https://developer.spotify.com/documentation/general/guides/authorization-guide/)
 
## Quickstart

### Step 1: Import Spotify module
First, import the ballerinax/spotify module into the Ballerina project.

```ballerina
import ballerinax/spotify;
```

### Step 2: Configure the connection credentials.
You can now make the connection configuration using the OAuth2 refresh token grant config.

```ballerina
spotify:Configuration configuration = {
    authConfig: {
        refreshUrl: "https://accounts.spotify.com/api/token",
        refreshToken : "<REFRESH_TOKEN>",
        clientId : "<CLIENT_ID>",
        clientSecret : "<CLIENT_SECRET>"
    }
};

spotify:Client spotifyClient = check new (configuration);
```

### Step 3: Get list of Spotify new releases

Get list newly released albums in spotify. 

```ballerina
public function main() returns error? {
    spotify:NewReleasesObject newReleases = check spotifyClient->getNewReleses();
}
```

## Snippets

* Get your playlists

    ```ballerina
    spotify:CurrentPlaylistDetails myPlaylists = check spotifyClient->getMyPlaylists();
    ```
* Get featured playlists

    ```ballerina
    spotify:FeaturedPlaylistObject featuredPlaylists = check spotifyClient->getFeaturedPlaylists();
    ```

Visit `ballerinax/spotify` connector [API Documentation](https://docs.central.ballerina.io/ballerinax/spotify/latest) to identify all the operations available. 
