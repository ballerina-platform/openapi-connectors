## Overview
This is a generated connector from [IP2Location.io API](https://www.ip2location.io/ip2location-documentation) OpenAPI Specification. 

IP2Location.io REST API allowing users to check IP address location in real time. The REST API supports both IPv4 and IPv6 address lookup. More about the IP2WHOIS API can be find at [IP2Location.io](https://www.ip2location.io/ip2location-documentation)
 
This module supports IP2Location.io API version v2.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
- Create [IP2Location.io account](https://www.ip2location.io/sign-up)
- Obtain tokens - Navigate to the [IP2Location.io Dashboard](https://www.ip2location.io/log-in), your API key will be listed there, simply copy it. 
 
## Quickstart
To use the IP2Location.io connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import connector
First, import the ballerinax/ip2locationio module into the Ballerina project.
```ballerina
import ballerinax/ip2locationio;
```
### Step 2: Create a new connector instance
In your `main` function, intantiate the client as the following

```ballerina
public function main() returns error? {
    ip2locationio:Client ip2locationioClient = check new ip2locationio:Client();
    // Your logic here
}
```

### Step 3: Invoke an operation
1. Now you can use the operations available within the connector. Following code demonstrate how to get geolocation information for the IP `8.8.8.8`.

```ballerina
public function main() returns error? {
    ip2locationio:Client ip2locationioClient = check new ip2locationio:Client();
    json|error response = ip2locationioClient->getGeolocationInfo("<YOUR_API_Key>", "8.8.8.8");
    io:println(response);
    // Your logic here
}
```
2. Use `bal run` command to compile and run the Ballerina program.