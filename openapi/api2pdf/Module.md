## Overview
This is a generated connector from [Api2Pdf API v1.0.0](https://www.api2pdf.com/) OpenAPI Specification. 

Api2Pdf is a powerful PDF generation API with no rate limits or file size constraints. Api2Pdf runs on AWS Lambda, a serverless architecture powered by Amazon to scale to millions of requests while being up to 90% cheaper than alternatives. **Supports wkhtmltopdf, Headless Chrome, LibreOffice, and PDF Merge.** You can also generate barcodes with ZXING (Zebra Crossing). More about the Api2Pdf API can be find at [Api2Pdf](https://www.api2pdf.com/)
 
This module supports Api2Pdf API version 1.0.0.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
- Create [Api2Pdf account](https://portal.api2pdf.com/register)
- Obtain tokens - Navigate to the [Api2Pdf Portal](https://portal.api2pdf.com/), If you already have an API key listed and you’d like to use it for your application, simply copy it. Otherwise, click `Create application` and follow the instructions, that will provide you a new API key.
 
## Quickstart
To use the Api2Pdf connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import connector
First, import the ballerinax/api2pdf module into the Ballerina project.
```ballerina
import ballerinax/api2pdf;
```
### Step 2: Create a new connector instance
You can now make the connection configuration using the obtained credentials.

```ballerina
api2pdf:ApiKeysConfig apiKeyConfig = {
    apiKeys: {
        "apikey": "<API_KEY>"
    }
};

api2pdf:Client api2pdfClient = check new (apiKeyConfig);
```

### Step 3: Invoke an operation
1. Now you can use the operations available within the connector. Following code demonstrate how to generate a pdf from a webpage URL.
```ballerina
api2pdf:ApiResponseSuccess response = check api2pdfClient->convertWebUrlToPdfGet("https://en.wikipedia.org/wiki/Animal");
```
2. Use `bal run` command to compile and run the Ballerina program.