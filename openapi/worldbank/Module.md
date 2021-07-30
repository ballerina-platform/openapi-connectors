## Overview

The WorldBank connector consumes the data exposed in http://api.worldbank.org/v2/. This package provides the capability to easily access World Bank knowledge base. 

This module supports World Bank API version 1.0.0. 

## Quickstart

To use the WorldBank connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector

```ballerina
import ballerinax/worldbank
```
### Step 2: Create a new connector instance

```ballerina
worldbank:Client worldbankClient = check new ();
```

### Step 3: Invoke  connector operation

1. Get current population data by country.

```ballerina
public function main() {
    worldbank:CountryPopulation[] populationDetails = check worldbankClient->getPopulationByCountry(country_code="LKA" ,date="2000");
    int population = <int>populationDetails[0]?.value;
}
```

2. Use `bal run` command to compile and run the Ballerina program.