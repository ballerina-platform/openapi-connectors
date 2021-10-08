## Overview
This is a generated connector for [WordPress API v1.0](https://developer.wordpress.org/rest-api/) OpenAPI specification. 

The WordPress REST API provides an interface for applications to interact with your WordPress site. WordPress API provides a rich set of tools and interfaces for building sites, and you should not feel pressured to use the REST API if your site is already working the way you expect. You do not need to use the REST API to build a WordPress theme or plugin.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [WordPress account](https://login.wordpress.org/register) account
* Obtain tokens by following [this guide](https://developer.wordpress.org/rest-api/using-the-rest-api/authentication/).

## Quickstart

To use the WordPress connector in your Ballerina application, update the .bal file as follows

### Step 1: Import connector
First, import the `ballerinax/wordpress` module into the Ballerina project.
```ballerina
import ballerinax/wordpress;
```

### Step 2: Create a new connector instance
Create a `wordpress:ClientConfig` with the auth key and initialize the connector with it.
```ballerina
wordpress:ClientConfig configuration = {auth : {
        token = "<Enter your token here>"
    }
};
wordpress:Client wpClient = check new(configuration, serviceUrl);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get all posts.

    Get all posts

    ```ballerina
    public function main() {
        wordpress:Post[]|error posts = check wpClient->getPosts();
        if (posts is wordpress:Post[]) {
            foreach var post in posts {
                log:printInfo(post.toString());
            }
        } else {
            log:printError(posts.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
