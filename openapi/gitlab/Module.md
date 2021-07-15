## Overview
Ballerina connector for GitLab allows easy integration with GitLab REST API via Ballerina language. It Currently support 
operations related to access requests and access tokens in GitLab.
 
This module supports GitLab REST API V4.
 
## Configuring connector
### Prerequisites
- GitLab Account

### Obtaining tokens
1. Sign In to the GitLab Account.
2. In the top-right corner, select your avatar.
3. Select `Edit profile`.
4. In the left sidebar, select Access Tokens.
5. Enter a name and optional expiry date for the token.
6. Select the desired scopes.
7. Select Create personal access token. 

**Note:** FInd more information on obtaining PAT tokens [here](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html)
## Quickstart
### Obtain GitLab Version Information
#### Step 1: Import GitLab module
First, import the ballerinax/gitlab module into the Ballerina project.
```ballerina
import ballerinax/gitlab;
```
#### Step 2: Configure the connection credentials.
You can now make the connection configuration using the API key and token.
```ballerina
gitlab:ApiKeysConfig apiKeyConfig = {
    apiKeys: {
        "Private-Token": <GITLAB_PAT_TOKEN>
    }
};

gitlab:Client baseClient = check new Client(apiKeyConfig);

```
#### Step 3: Get Version Information

```ballerina
public function main() {
    gitlab:VersionResponse|error gitVersion = baseClient->getVersion();
    if (gitVersion is gitlab:VersionResponse) {
        log:printInfo("Git version " + gitVersion?.'version.toString());
    }
}
``` 