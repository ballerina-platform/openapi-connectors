## Overview
This is a generated connector for [MFT Gateway (by Aayu Technologies) REST API v1.0 ](https://aayutechnologies.com/docs/product/mft-gateway/) OpenAPI specification. 
The [MFT Gateway REST API](https://aayutechnologies.com/docs/product/mft-gateway/) provides a secure AS2 secured channel for B2B communications, multiple ways to upload/download files and automate the exchange through integration mechanisms.
 
## Prerequisites
Before using this connector in your Ballerina application, complete the following:

* Create a account on [MFT Gateway (by Aayu technologies)](https://console.mftgateway.com/auth/register)
* Create a [Station](https://aayutechnologies.com/docs/product/mft-gateway/creating-as2-station/) in the MFT Gateway account.
 
## Quickstart
To use the MFT gateway connector in your Ballerina application, update the .bal file as follows

### Step 1: Import connector
First, import the `ballerinax/aayu.mftg.as2` module into the Ballerina project.
```ballerina
    import ballerinax/aayu.mftg.as2 as mftg;
```

### Step 2: Create a new connector instance
Create a `mftg:Client` instance using username, password (used to sign in MFTgateway) and Station identifier.

```ballerina
    mftg:Client mftgClient = check new (username, password, stationIdentifier);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on sending an AS2 message.

    Send AS2 Message

    ```ballerina
    public function main() returns  error? {
        byte[] filePayload = check io:fileReadBytes(filePath);
        mftg:SuccessfulMessageSubmitResponse successfulMessageSubmitResponse = check mftgClient->sendAS2Message("<PARTNER_AS2_ID>", "<CONTENT_TYPE>", filePayload);
        io:println(successfulMessageSubmitResponse);
    }
    ```

    Following is an example on sending an AS2 message with attachements larger than 3MB.

    Send AS2 Message

    ```ballerina
    public function main() returns  error? {
        stream<io:Block, io:Error?> fileReadBlocksAsStream = check io:fileReadBlocksAsStream(<FILE_PATH>);
        check mftgClient->sendLargeAS2Message(<PARTNER_AS2_ID>, fileReadBlocksAsStream, <ACCESS_KEY_ID>, <SECRET_ACCESS_KEY>, <MFTG_BUCKET>, <ATTACHMENT_NAME>);
    }
    ```

    Following is an example on listing received messages.

    List Received Messages

    ```ballerina
    public function main() {
        mftg:SuccessfulMessageListRetrievalResponse messageResponse = check mftgClient->listReceivedMessages();
        if messageResponse.messages == [] {
            io:println("No messages received!!");
            return;
        }
        foreach var messageId in messageResponse.messages {
            io:println("MESSAGE ID : " + messageId);
        }
    }
    ``` 

    Following is an example on single message retrieval.

    Retrieve an Inbox (Received) Message

    ```ballerina
    public function main() {
        mftg:AS2Message messageResponse = check mftgClient->retrieveInboxMessage(messageResponse1.messages[0]);
        io:println(messageResponse);
    }
    ```

    Following is an example on listing certificates available.

    List Certificates

     ```ballerina
    public function main() {
        mftg:SuccessfulCertListRetrievalResponse listCertificates = check mftgClient->listCertificates();
        io:println(listCertificates);
    }
    ```

2. Use `bal run` command to compile and run the Ballerina program.