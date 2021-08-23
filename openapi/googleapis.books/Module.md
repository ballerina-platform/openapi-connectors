## Overview
This is a generated connector for [Google Books API v1](https://developers.google.com/books) OpenAPI specification.
The Google Books API allows clients to access the Google Books repository.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Google account](https://accounts.google.com/signup)
* Obtain tokens - Follow [this link](https://developers.google.com/identity/protocols/oauth2)
 
## Quickstart

To use the Google Books connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the ballerinax/googleapis.books module into the Ballerina project.
```ballerina
import ballerinax/googleapis.books as books;
```
### Step 2: Create a new connector instance

You can now enter the credentials in the Google Books client configuration and create Google Books client by passing the configuration:

```ballerina
books:ClientConfig clientConfig = {
    auth: {
        clientId: <CLIENT_ID>,
        clientSecret: <CLIENT_SECRET>,
        refreshUrl: <REFRESH_URL>,
        refreshToken: <REFRESH_TOKEN>
    }
};

books:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation

1. You can perform a book search as follows with `listVolumes` method by passing a search query string as a parameter.

    ```ballerina
    books:Volumes booksVolumesSearch = check baseClient->listVolumes("SriLanka");
    ```
2. Use `bal run` command to compile and run the Ballerina program. 
