## Overview
This is a generated connector for [Vimeo API v3.4](https://developer.vimeo.com/) OpenAPI specification.
The Vimeo API provides access to manage Vimeo platform. This includes management of videos, channels, albums, users etc.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create a [Vimeo account](https://vimeo.com/join)
* Obtain tokens - Follow [this link](https://developer.vimeo.com/api/authentication)

## Quickstart
To use the Vimeo connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the ballerinax/vimeo module into the Ballerina project.

```ballerina
import ballerinax/vimeo;
```

### Step 2: Create a new connector instance
You can now make the connection configuration using token.

You can do this step in two ways. You can use any one of this.

- Option 1 :
    Configure token in ballerina file directly. 

    ```ballerina
    vimeo:ClientConfig clientConfig = {
        auth : {
            token : ""
        }
    };
    vimeo:Client baseClient = check new Client(clientConfig);
    ```

- Option 2 :
    Configure token in `Config.toml` file and configure it in ballerina file, using configurables. 

    1. Set up token in `Config.toml` as shown below.
    ```
    [auth]
    token = "<Enter your token here>"
    ```

    2. Configure the client in ballerina file as shown below.
    ```ballerina
    configurable http:BearerTokenConfig & readonly auth = ?;
    vimeo:ClientConfig clientConfig = {auth : auth};
    vimeo:Client baseClient = check new Client(clientConfig);
    ```

### Step 3: Invoke connector operation 
1. You can get a specific channel information as shown below.
    ```ballerina
        vimeo:Channel channel = check baseClient->getChannel(channelID);
    ```
2. Use `bal run` command to compile and run the Ballerina program.