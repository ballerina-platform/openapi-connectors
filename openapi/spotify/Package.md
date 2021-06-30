Conncets to Spotify Playlist API from Ballerina. 

## Module Overview

The Spotify Playlist connector consume the data exposed in [https://api.spotify.com](https://api.spotify.com/v1). It is currently supporting following operations.

- getMyPlaylists
- getPlaylistById
- createPlaylist
- updatePlaylist
- getPlaylistTracks
- reorderOrReplacePlaylistTracks
- getPlayslistsByUserID
- getNewReleses
- getFeaturedPlaylists


## Compatibility

|                       |    Version                  |
|:---------------------:|:---------------------------:|
| Ballerina Language    | Swan-Lake-Alpha5            |
| Spotify Playlist API  | v1                          |


# Quickstart

## Obtain Tokens for Authentication

Spotify Web API follows OAuth 2.0 mechanism for authentication. Please follow below steps to get tokens to access the API

1. Create a Spotify account
2. Register your application inSpotify developer portal
2. Use Client Id and Client Secret to get access token or refresh token.

Please see [here](https://developer.spotify.com/documentation/web-api/quick-start/) for more details. 

Then provide the tokens to configure the client. 

### Client configuration

```ballerina
    import ballerinax/spotify;

    spotify:ClientConfig clientConfig = {
        authConfig : {
            refreshUrl = "<Refresh URL>"
            refreshToken = "<Refresh Token>"
            clientId = "<Client Id>"
            clientSecret = "<Client Secret>"
        }
    };

    spotify:Client spotifyClient = new spotify:Client(clientConfig);
```
    