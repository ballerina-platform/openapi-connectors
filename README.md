# Ballerinax Open API Connectors
[![Build](https://github.com/ballerina-platform/ballerinax-openapi-connectors/actions/workflows/daily-build.yml/badge.svg)](https://github.com/ballerina-platform/ballerinax-openapi-connectors/actions/workflows/daily-build.yml)
[![Build](https://github.com/ballerina-platform/ballerinax-openapi-connectors/workflows/CI/badge.svg)](https://github.com/ballerina-platform/ballerinax-openapi-connectors/actions?query=workflow%3ACI)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/ballerinax-openapi-connectors.svg)](https://github.com/ballerina-platformballerinax-openapi-connectors/commits/master)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

This repository manages the connectors generated using [Ballerina OpenAPI tool](https://github.com/ballerina-platform/ballerina-openapi) while providing the capability to build and publish generated connectors to [Ballerina Central](https://central.ballerina.io/). 

## Steps to add new connector 

### Set up the prerequisites
    
* Download and install the latest Ballerina version from [here](https://ballerina.io/downloads/). 
* Set the `BALLERINA_HOME` environment variable to the ballerina distribution directory. eg. `/usr/lib/ballerina`
* Fork and Clone the repository

### Generate the connector

1. Navigate to `/openapi` directory and run `bal new <connector_name> -t lib` to create a new Ballerina project
2. Copy the OpenAPI yaml/json definition file of the API you wish to generate the connector to the `<connector_name>` directory.
3. Run `bal openapi -i <openap_file_name> --mode client` to generate the connector. 
4. Run `bal build` to check whether the newly generated connector is compiling successfully. 
5. Run necessary unit tests to verify the functionality of the generated connector.

### Add connector to the repository 

1. Run `./gradlew build`. 
2. Push the changes and create a Pull Request to the `master` branch of the `ballerinax-openapi-connector` repository.

## Contributing to Ballerina
 
As an open source project, Ballerina welcomes contributions from the community.
 
For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).
 
## Code of conduct
 
All contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## License

Ballerina code is distributed under [Apache license 2.0](https://github.com/ballerina-platform/ballerina-lang/blob/master/LICENSE).

## Useful links
 
* Discuss code changes of the Ballerina project in [ballerina-dev@googlegroups.com](mailto:ballerina-dev@googlegroups.com).
* Chat live with us via our [Slack channel](https://ballerina.io/community/slack/).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
