## Overview

The WorldBank connector consumes the data exposed in http://api.worldbank.org/v2/. This package provides the capability to easily access World Bank knowledge base. 

This module supports World Bank API version 1.0.0. 

## Quickstart

### Step 1: Import worldbank module

```ballerina
import ballerinax/worldbank
```
### Step 2: Initialize the client

```ballerina
worldbank:Client worldbankClient = check new ();
```

### Step 3: Get population by country

Obtain current population data by country using `ballerinax/worldbank` connector 

```ballerina
public function main() {
    worldbank:CountryPopulation[] populationDetails = check worldbankClient->getPopulationByCountry(country_code="LKA" ,date="2000");
    int population = <int>populationDetails[0]?.value;
}
```

## Snippets

Snippets of some operations

* Get population of each country in the year 2019
    ```ballerina
        worldbank:CountryPopulation[] populationResult = check worldbankClient->getPopulation("2019");
    ```

* Get Get GDP of each country in the year 2019
    ```ballerina
        worldbank:GrossDomesticProduct[] gDP = check worldbankClient->getGDP("2019");
    ```

Visit `ballerinax/worldbank` connector [API Documentation](https://docs.central.ballerina.io/ballerinax/worldbank/latest) to identify all the operations available. 