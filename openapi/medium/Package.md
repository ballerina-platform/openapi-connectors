Connects to Medium from Ballerina.

## Module Overview

The Medium connector consume the data exposed in https://developers.medium.com/. It is currently supporting the following operations.

- getUserDetail
- createUserPost
- getPublicationList
- getContributorList


## Compatibility

| Ballerina Language Versions  | Medium API     |
|:----------------------------:|:-----------------:|
|  Swan Lake Alpha 5           |   V1              |

## Configuration

In order to publish on behalf of a Medium account, you will need an access token. An access token grants limited access to a user’s account. We offer two ways to acquire an access token: browser-based OAuth authentication, and self-issued access token.

Please follow this [link](https://github.com/Medium/medium-api-docs#2-authentication) to obtain the tokens.