## Overview

Ballerina connector for Covid-19 consumes the data exposed in https://disease.sh. It provides easy access to latest Covid-19 related data across the world
 
This module supports Novel Covid-19 API version 3.0.0. 
 
## Quickstart

### Step 1: Import covid19 module

```ballerina
import ballerinax/covid19
```
### Step 2: Initialize the client

```ballerina
covid19:Client covid19Client = check new ();
```

### Step 3: Get Covid-19 status by country

```ballerina
public function main() {
    covid19:CovidCountry statusByCountry = check covid19Client->getStatusByCountry("sri lanka");
}
```
 
## Snippets

Snippets of some operations

* Get global Covid-19 status
    ```ballerina
        covid19:CovidAll globalStatus = check covid19Client->getGlobalStatus();
    ```

* Get Covid-19 status by continent
    ```ballerina
        covid19:CovidContinent statusByContinent = check covid19Client->getStatusByContinent("Asia");
    ```

* Get COVID-19 totals for specific US State(s)
    ```ballerina
        covid19:CovidState usaStatusByState = check covid19Client->getUSAStatusByState("New York");
    ```