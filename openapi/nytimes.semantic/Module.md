## Overview
Ballerina connector for New York Times Semantic is connecting the [New York Times Semantic API](https://developer.nytimes.com/docs/semantic-api-product/1/overview) via Ballerina language easily. With the New York Times Semantic API you can get sementic terms (people, places, organizations, and locations). The Semantic API complements the Articles API. With the Semantic API, you get access to the long list of people, places, organizations and other locations, entities and descriptors that make up the controlled vocabulary used as metadata by The New York Times (sometimes referred to as Times Tags) and used for Times Topics pages.

This module supports [New York Times Semantic API v2.0.0](https://developer.nytimes.com/docs/semantic-api-product/1/overview).

## Prerequisites
* Create [NYTimes](https://developer.nytimes.com/accounts/login) Developer Account
* Obtain tokens
    1. Log into NYTimes Developer Portal by visiting https://developer.nytimes.com/accounts/login
    2. Register an app and obtain the API Key following the process summarized [here](https://developer.nytimes.com/get-started).
* Configure the connector with obtained tokens 

## Quickstart
 
To use the New York Times Semantic connector in your Ballerina application, update the .bal file as follows: 

### Step 1: Import New York Times Semantic module
First, import the ballerinax/nytimes.semantic module into the Ballerina project.
```ballerina
import ballerinax/nytimes.semantic as ns;
```
### Step 2: Initialize the client.
You can initialize the client as follows. You can now provide the API key obtained from the [NYTimes Developer Portal](https://developer.nytimes.com/accounts/login) in the configuration.
```ballerina
ns:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>"
    }
}
ns:Client baseClient = check new Client(config);
```
### Step 3: Semantic API request by concept type and specific concept
You can now make a Semantic API request by concept type and specific concept. 
concept_type is one of seven types:

    - nytd_geo for a location
    - nytd_per for a person
    - nytd_org for an organization
    - nytd_des for a descriptor
    - nytd_ttl for a creative work title
    - nytd_topic for a topic
    - nytd_porg for a public company

specific_concept_name is a term in The New York Times controlled vocabulary.

```ballerina
public function main() {
    ns:InlineResponse200|error response = baseClient->getConcepts("nytd_des", "Baseball", "Baseball");
    if (response is ns:InlineResponse200) {
        ns:Concept[]? concepts = response?.results;
        if !(concepts is ()) {
            foreach var concept in concepts {
                log:printInfo(concept.toString() + "\n");
            }
        }
    } else {
        log:printInfo(response.toString());
    }
}
``` 
### Step 4: Semantic API search query
Here we have an example, it asks for all of the concepts that contain the substring "Evan" and return the result.
```ballerina
public function main() {
    ns:InlineResponse2001|error response = baseClient->searchConcepts("evan");
    if (response is ns:InlineResponse2001) {
        ns:ConceptRelation[]? conceptsRelation = response?.results;
        if !(conceptsRelation is ()) {
            foreach var conceptRelation in conceptsRelation {
                log:printInfo(conceptRelation.toString() + "\n");
            }
        }
    } else {
        log:printInfo(response.toString());
    }
}
``` 
