## Overview
This is a generated connector for [GitLab GitLab REST API v4](https://about.gitlab.com/) OpenAPI specification.

Client endpoint for GitLab API currently supports operations related to access requests and access tokens in GitLab.
## Prerequisites
- Create a [GitLab](https://about.gitlab.com/) account
- Obtain tokens
    - Use [this](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html) guide to obtain the PAT tokens related to your account

## Quickstart

To use the GitLab connector in your Ballerina application, update the .bal file as follows:
### Step 1 - Import connector
First, import the ballerinax/gitlab module into the Ballerina project.

```ballerina
import ballerinax/gitlab;
```
### Step 2 - Create a new connector instance
You can now make the connection configuration using the PAT token

```ballerina
gitlab:ApiKeysConfig apiKeyConfig = {
    "privateToken": <GITLAB_PAT_TOKEN>
};

gitlab:Client baseClient = check new Client(apiKeyConfig);
```
### Step 3 - Invoke connector operation
1. Get Version Information

```ballerina
public function main() {
    gitlab:VersionResponse|error gitVersion = baseClient->getVersion();
    if (gitVersion is gitlab:VersionResponse) {
        log:printInfo("Git version " + gitVersion?.'version.toString());
    }
}
``` 

2. Use `bal run` command to compile and run the Ballerina program
