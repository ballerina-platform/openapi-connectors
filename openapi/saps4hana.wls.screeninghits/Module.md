## Overview
The SAP S/4HANA SAP Watch List Screening Hits API v1.7 connector(https://api.sap.com/api/ScreeningHits/resource) OpenAPI specification. 

This microservice manages Screening Hits created by the Screening microservice and enables users to decide whether they are true matches or false positives. The Screening Hits are grouped in Screening Hit Collections. The Screening Hit Collection refers to a Business Context e.g. a Sales Order and contains one or more Screened Addresses.

### Key Features

- Programmatic access to create and manage resources via REST API
- Manage user accounts and profiles
- Secure authentication with API key or OAuth support

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create and configure an OAuth2 client credentials by following [this guide](https://help.sap.com/viewer/b865ed651e414196b39f8922db2122c7/LATEST/en-US/7aefa21a65f94b25b7e639c3931b6f83.html).
