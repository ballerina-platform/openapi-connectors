Connects to Bitbucket from Ballerina.

## Module Overview

The BitBucket connector consume the data exposed in https://developer.atlassian.com/bitbucket/api/2/reference/resource/. It is currently supporting the following operations.

- Post Issues
- Get Issue ByID
- Create New Issue Comment
- List Issues Comments
- Get Comment By ID
- Update Comment
- Delete Comment
- Delete Issue By ID
- Create New Repository
- Delete Repository
- Create Or Update Project
- Delete Project
- Get Issues
- Get Pull Request By ID
- Get Repository Detail
- Get WorkSpace By ID


## Compatibility

| Ballerina Language Versions  | Bitbucket API     |
|:----------------------------:|:-----------------:|
|  Swan Lake Alpha 5           |   2.0             |

## Configuration

1. Go to the Bitbucket account and navigate to your workspace.
2. Then, Go to settings in the workspace.
3. Select OAuth consumers from Apps and Features list.
4. Create a new consumers and copy your key and secret.
5. Use the following code to generate the refresh token. The full-blown 3-LO flow. Request authorization from the end user by sending their browser to:
    https://bitbucket.org/site/oauth2/authorize?client_id={client_id}&response_type=code

    The callback includes the ?code={} query parameter that you can swap for an access token:
    ```
    $ curl -X POST -u "client_id:secret" https://bitbucket.org/site/oauth2/access_token -d grant_type=authorization_code -d code={code}
    ```

6. Use the following link as the refresh URL
    `https://bitbucket.org/site/oauth2/access_token`

7. For more information, Please refer this [link](https://developer.atlassian.com/bitbucket/api/2/reference/?utm_source=%2Fbitbucket%2Fapi%2F2%2Freference&utm_medium=302)