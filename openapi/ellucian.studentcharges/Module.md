This is a generated connector for [Ellucian Student Charges v16.0.0](https://ellucian.force.com/) OpenAPI specification. 
Ellucian is a higher education platform connecting people, processes and applications across the institution to power coordinated programs designed for student success. Ellucian Student charges API provides capability to retrieve details about student charges recorded in Colleague.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Ellucian Account](https://xedocs.ellucian.com/).
* Obtain tokens by following [this guide](https://xedocs.ellucian.com/xe-colleague-api/rest-api/index.html).

## Quickstart

To use the Ellucian Student Charges connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/ellucian.studentcharges` module into the Ballerina project.
```ballerina
import ballerinax/ellucian.studentcharges;
```

### Step 2: Create a new connector instance
Create a `studentcharges:ClientConfig` with the `token` obtained, and initialize the connector with it.
```ballerina
studentcharges:ClientConfig clientConfig = {auth:{token: "XXXXXXX"}};
studentcharges:Client baseClient = check new (clientConfig);
```
You can also specify and override the default service URL as below.
```ballerina
studentcharges:Client baseClient = check new (clientConfig, "<SERVICE_URL>");
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on getting all student charges.

    Get Student Charges

    ```ballerina
    public function main() returns error? {
        studentcharges:StudentCharges response = check baseClient->getStudentCharges();
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
