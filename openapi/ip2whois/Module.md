## Overview
This is a generated connector from [IP2WHOIS API v2](https://www.ip2whois.com/developers-api) OpenAPI Specification. 

IP2WHOIS information lookup REST API helps users to obtain domain information, WHOIS record, by using a domain name. The API returns a comprehensive WHOIS data such as creation date, updated date, expiration date, domain age, the contact information of the registrant, mailing address, phone number, email address, nameservers the domain is using and much more. More about the IP2WHOIS API can be find at [IP2WHOIS](https://www.ip2whois.com/?lang=en_US)
 
This module supports IP2WHOIS API version v2.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
- Create [IP2WHOIS account](https://www.ip2whois.com/register)
- Obtain tokens - Navigate to the [IP2WHOIS Profile](https://www.ip2whois.com/login), your API key will be listed there, simply copy it. 
 
## Quickstart
To use the IP2WHOIS connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import connector
First, import the ballerinax/ip2whois module into the Ballerina project.
```ballerina
import ballerinax/ip2whois;
```
### Step 2: Create a new connector instance
You can now intantiate the client.

```ballerina

ip2whois:Client ip2whoisClient = check new;
```

### Step 3: Invoke an operation
1. Now you can use the operations available within the connector. Following code demonstrate how to get domain information.
```ballerina
string domainInfo = check ip2whoisClient->getDomainInfo("wso2.com", "<API_Key>", "json");
```
2. Use `bal run` command to compile and run the Ballerina program.
