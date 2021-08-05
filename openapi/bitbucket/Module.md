## Overview
This is a generated connector for [Bitbucket API v2.0](https://developer.atlassian.com/bitbucket/api/2/reference/) OpenAPI Specification.

Code against the Bitbucket API to automate simple tasks, embed Bitbucket data into your own site, build mobile or desktop apps, 
or even add custom UI add-ons into Bitbucket itself using the Connect framework.
 
## Prerequisites
 
Before using this connector in your Ballerina application, complete the following:
 
* Create  a BitBucket account
* Obtain tokens
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

7. For more information, Refer this [link](https://developer.atlassian.com/bitbucket/api/2/reference/?utm_source=%2Fbitbucket%2Fapi%2F2%2Freference&utm_medium=302)
 
## Quickstart
 
To use the BitBucket connector in your Ballerina application, update the .bal file as follows:
Add steps to create a simple sample
### Step 1 - Import connector
 Import the `ballerinax/bitbucket` module into the Ballerina project.
```ballerina
import ballerinax/bitbucket;
```
### Step 2 - Create a new connector instance
```ballerina
bitbucket:ClientConfig configuration = {
    authConfig: {
        clientId: "<Client Id>",
        clientSecret: "<Client Secret>",
        refreshUrl: "<Refresh Url>",
        refreshToken: "<Refresh Token>"
    }
};

bitbucket:Client bitBucketClient = check new (clientConfig);
```
### Step 3 - Invoke connector operation 
1. Invoke connector operations using the client
```ballerina
public function main() {
    bitbucket;Issue|error response = bitBucketClient->getIssueByID(issueId, repoWithIssueTracker, workspace);
}
``` 
2. Use `bal run` command to compile and run the Ballerina program. 
