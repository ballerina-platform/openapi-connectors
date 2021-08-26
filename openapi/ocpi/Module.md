## Overview
This is a generated connector for [Open Charge Point Interface(OCPI) v2.2](http://fungenerators.com/api/barcode/) OpenAPI specification.

The Open Charge Point Interface (OCPI) enables a scalable, automated EV roaming setup between Charge Point Operators 
and e-Mobility Service Providers. It supports authorization, charge point information exchange (including live status
updates and transaction events), charge detail record exchange, remote charge point commands and the exchange of 
smart-charging related information between parties.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:

* Obtain your Open Charge Network(OCN) service URL that based on OCPI v2.2 specification
* Obtain tokens
    1. Follow [this link](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#transport_and_format_pagination) to 
    get OCPI specification detail for authorization and obtain tokens according to your OCN.

## Quickstart
Refer [this link](https://bitbucket.org/shareandcharge/ocn-node/src/master/README.md) to learn how to test local OCN.
To use the OCPI connector in your Ballerina application, update the .bal file as follows:
Add steps to create a simple sample
   ### Step 1 - Import connector
```ballerina
        import ballerinax/ocpi; 
```
   ### Step 2 - Create a new connector instance
```ballerina
ocpi:Client baseClient = check new ocpi:Client(serviceUrl = "http://localhost:8080");

```
   ### Step 3 - Invoke  connector operation 
1. Get health status of the OCN
```ballerina
   string response = check baseClient->getHealth();
```
2. Get the ID of the node, Follow [this link](https://bitbucket.org/shareandcharge/ocn-demo/src/c82376dcff53c3d27a644babbd3b06d20761df84/tutorial-steps/1-using-node-api/) for more detail.
```ballerina
   json response = check baseClient->getMyNodeInfo();
```
**Note: To Add a party to the OCN registry, Use below command if you test the connector using your locally configured OCN**
 Follow [this link](https://bitbucket.org/shareandcharge/ocn-demo/src/c82376dcff53c3d27a644babbd3b06d20761df84/tutorial-steps/2-using-the-registry/) for more information
```
    //This should be done using the command line interface 
    // Adding the party to the OCN registry
    // Execute the following in the command line
    //
    // ocn-registry set-party --credentials DE MSP \
    // --roles EMSP \
    // --operator <Operator ID> \
    // --signer <Signer token>
```
3. [Request a token A](https://bitbucket.org/shareandcharge/ocn-demo/src/c82376dcff53c3d27a644babbd3b06d20761df84/tutorial-steps/3-requesting-token-a/)
```ballerina
    ocpi:BasicRole[] payload = [
        {
            country_code: "<Country code>",
            party_id: "<Party ID>"
        }
    ];
    json response = check baseClient->generateRegistrationToken(payload);
```
4. [Request versions](https://bitbucket.org/shareandcharge/ocn-demo/src/c82376dcff53c3d27a644babbd3b06d20761df84/tutorial-steps/4-requesting-ocpi-versions/)
```ballerina
   ocpi:OcpiResponseListVersion response = check baseClient->getVersions();
```
5. [Request version details](https://bitbucket.org/shareandcharge/ocn-demo/src/c82376dcff53c3d27a644babbd3b06d20761df84/tutorial-steps/4-requesting-ocpi-versions/)
```ballerina
ocpi:OcpiResponseVersionDetail response = check baseClient->getVersionsDetail();
```
6. [The credentials handshake](https://bitbucket.org/shareandcharge/ocn-demo/src/c82376dcff53c3d27a644babbd3b06d20761df84/tutorial-steps/5-credentials-handshake/)
```ballerina
ocpi:Credentials credentials = {
        token: "<Token>",
        url: "<URL>",
        roles: [
            {
                country_code: "<Country Code>",
                party_id: "<Party ID>",
                role: "<Role>",
                business_details: {
                    name: "<Name>"
                }
            }
        ]
    };
    ocpi:OcpiResponseCredentials response = check baseClient->postCredentials(credentials);
```
**This Completes the registration to the OCN Node, Now you are ready to send requests to other parties on the network**

7. [Fetch a list of one of the CPO's locations](https://bitbucket.org/shareandcharge/ocn-demo/src/c82376dcff53c3d27a644babbd3b06d20761df84/tutorial-steps/6-requesting-location-data/)
```ballerina
    string xRequestId = "1";
    string xCorrelationId = "1";
    string ocpiFromCountryCode = "<From Country Code>";
    string ocpiFromPartyId = "<From Party ID>";
    string ocpiToCountryCode = "<To Country Code>";
    string ocpiToPartyId = "<To Party ID>";
    ocpi:OcpiResponseLocationList response = check baseClient->getLocationListFromDataOwner(
        xRequestId, xCorrelationId, ocpiFromCountryCode, ocpiFromPartyId, ocpiToCountryCode, ocpiToPartyId);
```
8. [Get an array of tariffs provided by the CPO](https://bitbucket.org/shareandcharge/ocn-demo/src/c82376dcff53c3d27a644babbd3b06d20761df84/tutorial-steps/8-module-dependencies/), with IDs matching those found on the Connector object.
```ballerina
    string xRequestId = "1";
    string xCorrelationId = "1";
    string ocpiFromCountryCode = "<From Country Code>";
    string ocpiFromPartyId = "<From Party ID>";
    string ocpiToCountryCode = "<To Country Code>";
    string ocpiToPartyId = "<To Party ID>";
    ocpi:OcpiResponseTariffList response = check baseClient->getTariffsFromDataOwner(xRequestId, xCorrelationId, ocpiFromCountryCode, ocpiFromPartyId, ocpiToCountryCode, ocpiToPartyId);
```
9. Tell the CPO a driver on the eMSP system wishes to start a session remotely.
```ballerina
    string xRequestId = "1";
    string xCorrelationId = "1";
    string ocpiFromCountryCode = "<From Country Code>";
    string ocpiFromPartyId = "<From Party ID>";
    string ocpiToCountryCode = "<To Country Code>";
    string ocpiToPartyId = "<To Party ID>";
    ocpi:StartSession startSession = {
        response_url: "<Response URL>",
        token: {
            country_code: "<Country Code>",
            party_id: "<Party ID>",
            uid: "<UID>",
            'type: "APP_USER",
            contract_id: "<Contract ID>",
            issuer: "<Issuer>",
            valid: true,
            whitelist: "ALWAYS",
            last_updated: "<Last Update date/time>"
        },
        location_id: "<Location ID>"
    };
    ocpi:OcpiResponseCommandResponse|error response = baseClient->postStartSession(xRequestId, xCorrelationId, ocpiFromCountryCode, ocpiFromPartyId, ocpiToCountryCode, ocpiToPartyId, startSession)
```
10. Tell the CPO a driver on the eMSP system wishes to stop a session remotely. For more information, Follow [this link](https://bitbucket.org/shareandcharge/ocn-demo/src/c82376dcff53c3d27a644babbd3b06d20761df84/tutorial-steps/9-async-requests/)
```ballerina
    string xRequestId = "1";
    string xCorrelationId = "1";
    string ocpiFromCountryCode = "<From Country Code>";
    string ocpiFromPartyId = "<From Party ID>";
    string ocpiToCountryCode = "<To Country Code>";
    string ocpiToPartyId = "<To Party ID>";
    ocpi:StopSession stopSession = {
        "response_url": "<Response URL>",
        "session_id": "<Session ID>"
    };
    ocpi:OcpiResponseCommandResponse response = check baseClient->postStopSession(xRequestId, xCorrelationId, ocpiFromCountryCode, ocpiFromPartyId, ocpiToCountryCode, ocpiToPartyId, stopSession);
```

Use `bal run` command to compile and run the Ballerina program. 
