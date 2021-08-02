## Overview

This is a generated connector from [World Bank API v2](https://datahelpdesk.worldbank.org/knowledgebase/articles/898599-indicator-api-queries) OpenAPI Specification. 

The World Bank Indicators API provides access to nearly 16,000 time series indicators. Most of these indicators are available online through tools such as `Databank` and the `Open Data` website. The API provides programmatic access to this same data. Many data series date back over 50 years, and can be used to create interesting applications.

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