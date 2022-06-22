## Overview
This is a generated connector for [Shopify Admin API v2021-10](https://shopify.dev/api/admin-rest) OpenAPI specification.
The Admin API lets you build apps and integrations that extend and enhance the Shopify admin.
As the primary way that apps and services interact with Shopify, the Admin API allows you to add your own features to the Shopify user experience. 
Read and write Shopify store information, including products, inventory, orders, shipping, and more.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Shopify](https://www.shopify.com) account
* Obtain tokens by following [this guide](https://shopify.dev/apps/auth/oauth)
 
## Quickstart

To use the Shopify Admin connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/shopify.admin` module into the Ballerina project.
```ballerina
import ballerinax/shopify.admin;
```

### Step 2: Create a new connector instance
Create a `admin:ApiKeysConfig` with the Shopify access token obtained, and initialize the connector with it.
```ballerina
admin:ApiKeysConfig config = {
    xShopifyAccessToken: "<ACCESS_TOKEN>"
}
admin:Client baseClient = check new (config, "https://<shopify_store_name>.myshopify.com");
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to retrieve a list of categories using the connector.

    List Categories

    ```ballerina
    public function main() returns error? {
        admin:CustomerList response = check baseClient->getCustomers();
        log:printInfo(response.toJsonString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
