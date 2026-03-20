## Overview
The Medium API v1 connector(https://github.com/Medium/medium-api-docs) OpenAPI Specification.

Medium’s Publishing API provides capability to access the Medium network, create your content on Medium from 
anywhere you write, and expand your audience and your influence.

### Key Features

- Programmatic access to create and manage resources via REST API
- Send and publish data through the API
- Manage user accounts and profiles
- Secure authentication with API key or OAuth support

## Prerequisites
 
Before using this connector in your Ballerina application, complete the following:
 
* Create a Medium account
* Obtain tokens
1. Follow this link to [obtain tokens](https://github.com/Medium/medium-api-docs#2-authentication)
 
## Quickstart
 
To use the Medium connector in your Ballerina application, update the .bal file as follows:
Add steps to create a simple sample
### Step 1 - Import connector
```ballerina
import ballerinax/medium;
```
### Step 2 - Create a new connector instance
```ballerina
configurable http:BearerTokenConfig & readonly auth = ?;
ClientConfig clientConfig = {auth : auth};
Client baseClient = check new Client(clientConfig);
```
### Step 3 - Invoke connector operation 
1. Invoking connector operations using the client.
```ballerina
medium:UserResponse response = check baseClient->getUserDetail();
```
2. Use `bal run` command to compile and run the Ballerina program. 
 