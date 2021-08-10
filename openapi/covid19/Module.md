## Overview

This is a generated connector from [Novel COVID-19 API v3.0.0](https://disease.sh/docs/) OpenAPI Specification.

Ballerina connector for COVID-19 provides easy access to latest COVID-19 related data across the world. Please refer to [API documentation](https://disease.sh) for more detail.
  
## Quickstart

To use the COVID-19 connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector

```ballerina
import ballerinax/covid19
```
### Step 2: Create a new connector instance

```ballerina
covid19:Client covid19Client = check new ();
```

### Step 3: Invoke  connector operation

1. Get COVID-19 status by country 

```ballerina
public function main() {
    covid19:CovidCountry statusByCountry = check covid19Client->getStatusByCountry("sri lanka");
}
```
2. Use `bal run` command to compile and run the Ballerina program.
