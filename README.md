# Ballerinax Open API Connectors

# Introduction
Ballerina OpenAPI tool based automated code generation, build and publish to Ballerina Central

# Prerequisites
    
* Ballerina Swan Lake Beta 1
* Set the `BALLERINA_HOME` environment variable to the ballerina distribution directory. eg. `/usr/lib/ballerina`

# Steps to follow for addition of a new connector

1. Fork and Clone the repository
2. Run `bal new <connector_name> -t lib`
3. Copy the Open API yaml/json specification of the connector to the `<connector_name>` directory.
3. Run the `./gradlew build`. Connector code will be generated and pushed to the local repository.
4. Push the changes and create a Pull Request to the `master` branch of the `ballerinax-openapi-connector` repository.
