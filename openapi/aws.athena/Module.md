## Overview
This is a generated connector for [Amazon Athena API](https://docs.aws.amazon.com/athena/latest/APIReference/Welcome.html) OpenAPI specification. 

<p>Amazon Athena is an interactive query service that lets you use standard SQL to analyze data directly in Amazon S3. You can point Athena at your data in Amazon S3 and run ad-hoc queries and get results in seconds. Athena is serverless, so there is no infrastructure to set up or manage. You pay only for the queries you run. Athena scales automatically—executing queries in parallel—so results are fast, even with large datasets and complex queries. For more information, see <a href="http://docs.aws.amazon.com/athena/latest/ug/what-is.html">What is Amazon Athena</a> in the <i>Amazon Athena User Guide</i>.</p> <p>If you connect to Athena using the JDBC driver, use version 1.1.0 of the driver or later with the Amazon Athena API. Earlier version drivers do not support the API. For more information and to download the driver, see <a href="https://docs.aws.amazon.com/athena/latest/ug/connect-with-jdbc.html">Accessing Amazon Athena with JDBC</a>.</p> <p>For code samples using the Amazon Web Services SDK for Java, see <a href="https://docs.aws.amazon.com/athena/latest/ug/code-samples.html">Examples and Code Samples</a> in the <i>Amazon Athena User Guide</i>.</p>

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [AWS account](https://aws.amazon.com/?nc2=h_lg).
* Obtain tokens by following [this guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/RESTAuthentication.html).

## Quickstart

To use the Amazon Athena connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/aws.athena` module into the Ballerina project.
```ballerina
import ballerinax/aws.athena;
```

### Step 2 - Create a new connector instance
You can now make the connection configuration using the <ACCESS_TOKEN>.
```ballerina
athena:ApiKeysConfig clientConfig = {
    authorization : `<ACCESS_TOKEN>`
};

athena:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to list all clickwraps using the connector. 

    ```ballerina
    public function main() {
        click:ClickwrapVersionsResponse|error result = baseClient->getClickwraps();
        if (result is click:ClickwrapVersionsResponse) {
            log:printInfo(result.toString());
        } else {
            log:printInfo(result.toString());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
