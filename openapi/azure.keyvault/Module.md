## Overview
This is a generated connector from [Azure Key Vault API v7.0](https://azure.microsoft.com/en-us/services/key-vault/) OpenAPI specification.

The Key Vault client performs cryptographic key operations and vault operations against the Key Vault service.

## Prerequisites
- Create an [Azure](https://azure.microsoft.com/en-us/features/azure-portal/) account
- Create an [Azure Key Vault](https://azure.microsoft.com/en-us/services/key-vault/) account
- Obtain tokens
    - Use [this](https://docs.microsoft.com/en-us/azure/key-vault/general/authentication#the-key-vault-request-operation-flow-with-authentication) guide to obtain the credentials which are needed to create the <ACCESS_TOKEN>

## Quickstart
To use the Azure ey Vault connector in your Ballerina application, update the .bal file as follows:
### Step 1 - Import connector
First, import the ballerinax/azure.keyvault module into the Ballerina project.
```ballerina
import ballerinax/azure.keyvault;
```
### Step 2 - Create a new connector instance
You can now make the connection configuration using the access token.
```ballerina
keyvault:ClientConfig clientConfig = {
    auth : {
        token: token
    }
};

keyvault:Client baseClient = check new Client(clientConfig, serviceUrl = "{vaultBaseUrl}");
```
### Step 3 - Invoke connector operation

1. List certificates

```ballerina
public function main() {
    keyvault:CertificateListResult|error cert = baseClient->getCertificates("7.0");

    if (cert is keyvault:CertificateListResult) {
        log:printInfo(cert.toJsonString());
    } else {
        test:assertFail(msg = cert.message());
    }
}
``` 
2. Use `bal run` command to compile and run the Ballerina program
