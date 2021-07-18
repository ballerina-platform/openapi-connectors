## Overview
Ballerina connector for BitBucket is connecting the BitBucket [REST API](https://developer.atlassian.com/bitbucket/api/2/reference/) via Ballerina language easily. BitBucket Connector provides an easy to way manage the git code. It provides operations that 
makes easy to manage issues, project, repositories, comments etc.

This module supports REST API version 2.0 for BitBucket.
 
## Configuring Connector

### Prerequisites
- A bitbucket account

### Obtaining tokens
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
 
## Quickstart

* Get Issue by ID

Step 1: Import BitBucket module
First, import the `ballerinax/bitbucket` module into the Ballerina project.
```ballerina
import ballerinax/bitbucket;
```
Step 2: Configure the connection credentials.
Please follow the above mentioned configuration steps to obtain the tokens.
```ballerina
BitBucket:ClientConfig configuration = {
    authConfig: {
        clientId: "<Client Id>",
        clientSecret: "<Client Secret>",
        refreshUrl: "<Refresh Url>",
        refreshToken: "<Refresh Token>"
    }
};

bitbucket:Client bitBucketClient = check new (clientConfig);

```
Step 3: Get Issue By Id

```ballerina
public function main() {
    Issue|error response = bitBucketClient->getIssueByID(issueId, repoWithIssueTracker, workspace);
}
``` 

## Snippets

* Create an issue
```ballerina
    Issue newIssue = {
        title: "Test issue 2",
        state: "open"
    };
    Issue|error response = bitBucketClient->createIssue("<repoWithIssueTrackerId>", "<workspaceId>", newIssue);
```

* Get comment by ID

```ballerina
Comment|error response = bitBucketClient->getCommentByID("<commentId>", "<issueId">, "<repoWithIssueTrackerId>", "<workspaceId>");
```
