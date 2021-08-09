## Overview
This is a generated connector from [New York Times Semantic API v2.0.0](https://developer.nytimes.com/docs/semantic-api-product/1/overview) OpenAPI specification. 
With the New York Times Semantic API you can get sementic terms (people, places, organizations, and locations). 
The Semantic API complements the Articles API. With the Semantic API, you get access to the long list of people, places, organizations and other locations, entities and descriptors that make up the controlled vocabulary used as metadata by The New York Times (sometimes referred to as Times Tags) and used for Times Topics pages.
The Semantic API uses concepts which are, by definition, terms in The New York Times controlled vocabulary. Like the way facets are used in the Articles API, concepts are a good way to uncover articles of interest in The New York Times archive, and at the same time, limit the scope and number of those articles. The Semantic API maps to external semantic data resources, in a fashion consistent with the idea of linked data. The Semantic API also provides combination and relationship information to other, similar concepts in The New York Times controlled vocabulary.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [NYTimes](https://developer.nytimes.com/accounts/login) developer account
* Obtain tokens
    1. Log into NYTimes Developer Portal by visiting https://developer.nytimes.com/accounts/login
    2. Register an app and obtain the API Key following the process summarized [here](https://developer.nytimes.com/get-started).

## Quickstart
 
To use the New York Times Semantic connector in your Ballerina application, update the .bal file as follows: 

### Step 1: Import connector
First, import the `ballerinax/nytimes.semantic` module into the Ballerina project.
```ballerina
import ballerinax/nytimes.semantic as ns;
```

### Step 2: Create a new connector instance
Create a `semantic:ApiKeysConfig` with the API key obtained, and initialize the connector with it. 
```ballerina
ns:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>"
    }
}
ns:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to make a Semantic API request by concept type and specific concept using the connector.

    concept_type is one of seven types:

    - nytd_geo for a location
    - nytd_per for a person
    - nytd_org for an organization
    - nytd_des for a descriptor
    - nytd_ttl for a creative work title
    - nytd_topic for a topic
    - nytd_porg for a public company

    specific_concept_name is a term in The New York Times controlled vocabulary.

    Semantic API request by concept type and specific concept

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
    Following is an example on how to call a Semantic API search query using the connector. Here we have an example, it asks for all of the concepts that contain the substring "Evan" and return the result.

    Semantic API search query

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

2. Use `bal run` command to compile and run the Ballerina program. 
