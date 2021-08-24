## Overview
This is a generated connector for [Google Blogger API v3.0](https://developers.google.com/blogger/docs/3.0/getting_started) OpenAPI specification.
The Blogger API provides access to posts, comments and pages of a Blogger blog.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Google account](https://accounts.google.com/signup)
* Obtain tokens - Follow [this link](https://developers.google.com/identity/protocols/oauth2)
 
## Quickstart

To use the Google Blogger connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/googleapis.blogger` module into the Ballerina project.
```ballerina
import ballerinax/googleapis.blogger;
```

### Step 2: Create a new connector instance
Create a `blogger:ClientConfig` with the OAuth2 tokens obtained, and initialize the connector with it. 
```ballerina
blogger:ClientConfig clientConfig = {
    auth: {
        clientId: <CLIENT_ID>,
        clientSecret: <CLIENT_SECRET>,
        refreshUrl: <REFRESH_URL>,
        refreshToken: <REFRESH_TOKEN>
    }
};

blogger:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to retrieve a blog by URL using the connector. 

    Retrieve a blog by URL

    ```ballerina
    public function main() {
        blogger:Blog|error response = baseClient->getbyurlBloggerBlogs("<BLOG_URL>");
        if (response is blogger:Blog) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
