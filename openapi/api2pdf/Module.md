## Overview
Ballerina connector for Api2Pdf is connecting Api2Pdf API via Ballerina language easily. With this module you can convert HTML and URLs to PDF format, Convert images and Microsoft office documents to PDF format, Combine multiple PDF files into a single PDF. More about the Api2Pdf API can be find at [Api2Pdf](https://www.api2pdf.com/)
 
This module supports 1.0.0 version.

## Configuring Connector
### Prerequisites
* If you don't have a Api2Pdf account already, you’ll need to [create one](https://portal.api2pdf.com/register) in order to use the API.
### Obtaining tokens
1. Navigate to the [Api2Pdf Portal](https://portal.api2pdf.com/) 
2. If you already have an API key listed and you’d like to use it for your application, simply copy it. Otherwise, click `Create application` and follow the instructions, that will provide you a new API key.
 
## Quickstart

### Creating the Client

To use the connector, first you must create a `api2pdf:Client` object. The samples for creating a Mailchimp client can be found below.

```ballerina
api2pdf:ApiKeysConfig apiKeyConfig = {
    apiKeys: {
        "apikey": "<API_KEY>"
    }
};

api2pdf:Client api2pdfClient = check new (apiKeyConfig);
```

### Generate a PDF from a webpage URL

```ballerina
api2pdf:ApiResponseSuccess response = check api2pdfClient->chromeFromUrlGET("https://en.wikipedia.org/wiki/Animal");
```