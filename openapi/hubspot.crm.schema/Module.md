## Overview
The HubSpot connector(https://www.hubspot.com/) OpenAPI specification. 

The CRM uses schemas to define how custom objects should store and represent information in the HubSpot CRM. Schemas define details about an object''s type, properties, and associations. The schema can be uniquely identified by its **object type ID**.
 
### Key Features

- Programmatic access to create and manage resources via REST API
- Manage user accounts and profiles
- Secure authentication with API key or OAuth support

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create a [HubSpot developer](https://developers.hubspot.com/) account
* Obtain tokens
    - Use [this](https://developers.hubspot.com/docs/api/working-with-oauth4) guide to obtain the credentials which are needed to create the <CLIENT_ID> and <CLIENT_SECRET>
    