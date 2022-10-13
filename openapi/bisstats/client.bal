// Copyright (c) 2022 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

# This is a generated connector for [BIS SDMX RESTful API v1](https://stats.bis.org/api-doc/v1/) OpenAPI specification.
# The BIS SDMX RESTful API is a subset of the official SDMX RESTful API v1.4.0, released in June 2019.
# This service offers programmatic access to the BIS statistical data and metadata published on the [BIS statistics pages](https://www.bis.org/statistics/index.htm) released to the public.
# For additional information about the SDMX RESTful API, check the [official sdmx-rest specification](https://github.com/sdmx-twg/sdmx-rest/tree/master/v2_1/ws/rest/docs) or the [dedicated Wiki](https://github.com/sdmx-twg/sdmx-rest/wiki), including [**useful tips for consumers**](https://github.com/sdmx-twg/sdmx-rest/wiki/Tips-for-consumers).
@display {label: "BIS Stats", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization doesn't require setting the API credentials. 
    # Please refer the [API documentation](https://stats.bis.org/api-doc/v1/) for more information.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://stats.bis.org/api/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get data
    #
    # + flow - The **statistical domain** (aka dataflow) of the data to be returned. Examples: * `BISWEB_EERDATAFLOW`: The ID of the domain * `BIS,BISWEB_EERDATAFLOW`: The BISWEB_EERDATAFLOW domain, maintained by the BIS * `BIS,BISWEB_EERDATAFLOW,1.0`: Version 1.0 of the BISWEB_EERDATAFLOW domain, maintained by the BIS 
    # + 'key - The (possibly partial) **key identifying the data to be returned**.  The keyword `all` can be used to indicate that all data belonging to the specified dataflow and provided by the specified provider must be returned. The examples below are based on the following key: Frequency, Type, Basket, Country.  * `M.N.B.CH`: Full key, matching exactly one series, i.e. the monthly (`M`) nominal rate (`N`) in the broad basket (`B`) for Switzerland (`CH`).  * `M.N+R.B.CH`: Retrieves both nominal and real rates (`N+R`), matching exactly two series.  * `M.N.B.`: The last dimension is wildcarded, and it will therefore match all countries. 
    # + startPeriod - The start of the period for which results should be supplied (inclusive). Can be expressed using 8601 dates or SDMX reporting periods.  Examples: * `2000`: Year (ISO 8601) * `2000-01`: Month (ISO 8601) * `2000-01-01`: Date (ISO 8601) * `2000-Q1`: Quarter (SDMX) * `2000-W01`: Week (SDMX) 
    # + endPeriod - The end of the period for which results should be supplied (inclusive). Can be expressed using 8601 dates or SDMX reporting periods.  Examples: * `2000`: Year (ISO 8601) * `2000-01`: Month (ISO 8601) * `2000-01-01`: Date (ISO 8601) * `2000-S1`: Semester (SDMX) * `2000-D001`: Day (SDMX) 
    # + firstNObservations - The maximum number of observations to be returned starting from the oldest one 
    # + lastNObservations - The maximum number of observations to be returned starting from the most recent one 
    # + detail - The **amount of information** to be returned.  Possible options are:  * `full`: All data and documentation * `dataonly`: Everything except attributes * `serieskeysonly`: The series keys. This is useful to return the series that match a certain query, without returning the actual data (e.g. overview page) * `nodata`: The series, including attributes and annotations, without observations. 
    # + acceptEncoding - Specifies whether the response should be compressed and how.  `identity` (the default) indicates that no compression will be performed. 
    # + return - OK 
    remote isolated function getData(string flow, string 'key, string? startPeriod = (), string? endPeriod = (), int? firstNObservations = (), int? lastNObservations = (), string detail = "full", string acceptEncoding = "identity") returns string|error {
        string resourcePath = string `/data/${getEncodedUri(flow)}/${getEncodedUri('key)}/all`;
        map<anydata> queryParam = {"startPeriod": startPeriod, "endPeriod": endPeriod, "firstNObservations": firstNObservations, "lastNObservations": lastNObservations, "detail": detail};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get information about data availability
    #
    # + flow - The **statistical domain** (aka dataflow) of the data to be returned. Examples: * `BISWEB_EERDATAFLOW`: The ID of the domain * `BIS,BISWEB_EERDATAFLOW`: The BISWEB_EERDATAFLOW domain, maintained by the BIS * `BIS,BISWEB_EERDATAFLOW,1.0`: Version 1.0 of the BISWEB_EERDATAFLOW domain, maintained by the BIS 
    # + 'key - The (possibly partial) **key identifying the data to be returned**.  The keyword `all` can be used to indicate that all data belonging to the specified dataflow and provided by the specified provider must be returned. The examples below are based on the following key: Frequency, Type, Basket, Country.  * `M.N.B.CH`: Full key, matching exactly one series, i.e. the monthly (`M`) nominal rate (`N`) in the broad basket (`B`) for Switzerland (`CH`).  * `M.N+R.B.CH`: Retrieves both nominal and real rates (`N+R`), matching exactly two series.  * `M.N.B.`: The last dimension is wildcarded, and it will therefore match all countries. 
    # + componentID - The id of the Dimension for which to obtain availability information about. Use all to indicate that data availability should be provided for all dimensions. 
    # + mode - Instructs the web service to return a ContentConstraint which defines a Cube Region containing values which will be returned by executing the query (mode="exact") vs a Cube Region showing what values remain valid selections that could be added to the data query (mode="available"). A valid selection is one which results in one or more series existing for the selected value, based on the current data query selection state defined by the current path parameters. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the ContentConstraint to be returned. 
    # + startPeriod - The start of the period for which results should be supplied (inclusive). Can be expressed using 8601 dates or SDMX reporting periods.  Examples: * `2000`: Year (ISO 8601) * `2000-01`: Month (ISO 8601) * `2000-01-01`: Date (ISO 8601) * `2000-Q1`: Quarter (SDMX) * `2000-W01`: Week (SDMX) 
    # + endPeriod - The end of the period for which results should be supplied (inclusive). Can be expressed using 8601 dates or SDMX reporting periods.  Examples: * `2000`: Year (ISO 8601) * `2000-01`: Month (ISO 8601) * `2000-01-01`: Date (ISO 8601) * `2000-S1`: Semester (SDMX) * `2000-D001`: Day (SDMX) 
    # + acceptEncoding - Specifies whether the response should be compressed and how.  `identity` (the default) indicates that no compression will be performed. 
    # + return - OK 
    remote isolated function getDataAvailabilityInformation(string flow, string 'key, string componentID, string mode = "exact", string references = "none", string? startPeriod = (), string? endPeriod = (), string acceptEncoding = "identity") returns string|error {
        string resourcePath = string `/availableconstraint/${getEncodedUri(flow)}/${getEncodedUri('key)}/all/${getEncodedUri(componentID)}`;
        map<anydata> queryParam = {"mode": mode, "references": references, "startPeriod": startPeriod, "endPeriod": endPeriod};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get data structures
    #
    # + agencyID - The agency maintaining the artefact to be returned.  It is possible to set more than one agency, using `+` as separator (e.g. BIS+ECB). The keyword `all` can be used to indicate that artefacts maintained by any maintenance agency should be returned. 
    # + resourceID - The id of the artefact to be returned. It is possible to set more than one id, using `+` as separator (e.g. CL_FREQ+CL_CONF_STATUS). The keyword `all` can be used to indicate that any artefact of the specified resource type, {agencyID} and {version} should be returned.  
    # + 'version - The version of the artefact to be returned.  It is possible to set more than one version, using `+` as separator (e.g. 1.0+2.1). The keyword `all` can be used to return all versions of the matching resource. The keyword `latest` can be used to return the latest production version of the matching resource. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned. Possible values are:  * `none`: No references will be returned * `parents`: Returns the artefacts that use the artefact matching the query * `parentsandsiblings`: Returns the artefacts that use the artefact matching the query, as well as the artefacts referenced by these artefacts * `children`: Returns the artefacts referenced by the artefact to be returned * `descendants`: References of references, up to any level, will be returned * `all`: The combination of parentsandsiblings and descendants * In addition, a concrete type of resource may also be used (for example, references=codelist). 
    # + detail - The amount of information to be returned.  Possible values are:  * `allstubs`: All artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencestubs`: Referenced artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencepartial`: Referenced item schemes should only include items used by the artefact to be returned. For example, a concept scheme would only contain the concepts used in a DSD, and its isPartial flag would be set to `true` * `allcompletestubs`: All artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `referencecompletestubs`: Referenced artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `full`: All available information for all artefacts should be returned 
    # + acceptEncoding - Specifies whether the response should be compressed and how.  `identity` (the default) indicates that no compression will be performed. 
    # + return - OK 
    remote isolated function getDataStructures(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string resourcePath = string `/datastructure/${getEncodedUri(agencyID)}/${getEncodedUri(resourceID)}/${getEncodedUri('version)}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get dataflows
    #
    # + agencyID - The agency maintaining the artefact to be returned.  It is possible to set more than one agency, using `+` as separator (e.g. BIS+ECB). The keyword `all` can be used to indicate that artefacts maintained by any maintenance agency should be returned. 
    # + resourceID - The id of the artefact to be returned. It is possible to set more than one id, using `+` as separator (e.g. CL_FREQ+CL_CONF_STATUS). The keyword `all` can be used to indicate that any artefact of the specified resource type, {agencyID} and {version} should be returned.  
    # + 'version - The version of the artefact to be returned.  It is possible to set more than one version, using `+` as separator (e.g. 1.0+2.1). The keyword `all` can be used to return all versions of the matching resource. The keyword `latest` can be used to return the latest production version of the matching resource. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned. Possible values are:  * `none`: No references will be returned * `parents`: Returns the artefacts that use the artefact matching the query * `parentsandsiblings`: Returns the artefacts that use the artefact matching the query, as well as the artefacts referenced by these artefacts * `children`: Returns the artefacts referenced by the artefact to be returned * `descendants`: References of references, up to any level, will be returned * `all`: The combination of parentsandsiblings and descendants * In addition, a concrete type of resource may also be used (for example, references=codelist). 
    # + detail - The amount of information to be returned.  Possible values are:  * `allstubs`: All artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencestubs`: Referenced artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencepartial`: Referenced item schemes should only include items used by the artefact to be returned. For example, a concept scheme would only contain the concepts used in a DSD, and its isPartial flag would be set to `true` * `allcompletestubs`: All artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `referencecompletestubs`: Referenced artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `full`: All available information for all artefacts should be returned 
    # + acceptEncoding - Specifies whether the response should be compressed and how.  `identity` (the default) indicates that no compression will be performed. 
    # + return - OK 
    remote isolated function getDataFlows(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string resourcePath = string `/dataflow/${getEncodedUri(agencyID)}/${getEncodedUri(resourceID)}/${getEncodedUri('version)}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get categorisations
    #
    # + agencyID - The agency maintaining the artefact to be returned.  It is possible to set more than one agency, using `+` as separator (e.g. BIS+ECB). The keyword `all` can be used to indicate that artefacts maintained by any maintenance agency should be returned. 
    # + resourceID - The id of the artefact to be returned. It is possible to set more than one id, using `+` as separator (e.g. CL_FREQ+CL_CONF_STATUS). The keyword `all` can be used to indicate that any artefact of the specified resource type, {agencyID} and {version} should be returned.  
    # + 'version - The version of the artefact to be returned.  It is possible to set more than one version, using `+` as separator (e.g. 1.0+2.1). The keyword `all` can be used to return all versions of the matching resource. The keyword `latest` can be used to return the latest production version of the matching resource. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned. Possible values are:  * `none`: No references will be returned * `parents`: Returns the artefacts that use the artefact matching the query * `parentsandsiblings`: Returns the artefacts that use the artefact matching the query, as well as the artefacts referenced by these artefacts * `children`: Returns the artefacts referenced by the artefact to be returned * `descendants`: References of references, up to any level, will be returned * `all`: The combination of parentsandsiblings and descendants * In addition, a concrete type of resource may also be used (for example, references=codelist). 
    # + detail - The amount of information to be returned.  Possible values are:  * `allstubs`: All artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencestubs`: Referenced artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencepartial`: Referenced item schemes should only include items used by the artefact to be returned. For example, a concept scheme would only contain the concepts used in a DSD, and its isPartial flag would be set to `true` * `allcompletestubs`: All artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `referencecompletestubs`: Referenced artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `full`: All available information for all artefacts should be returned 
    # + acceptEncoding - Specifies whether the response should be compressed and how.  `identity` (the default) indicates that no compression will be performed. 
    # + return - OK 
    remote isolated function getCategorisations(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string resourcePath = string `/categorisation/${getEncodedUri(agencyID)}/${getEncodedUri(resourceID)}/${getEncodedUri('version)}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get content constraints
    #
    # + agencyID - The agency maintaining the artefact to be returned.  It is possible to set more than one agency, using `+` as separator (e.g. BIS+ECB). The keyword `all` can be used to indicate that artefacts maintained by any maintenance agency should be returned. 
    # + resourceID - The id of the artefact to be returned. It is possible to set more than one id, using `+` as separator (e.g. CL_FREQ+CL_CONF_STATUS). The keyword `all` can be used to indicate that any artefact of the specified resource type, {agencyID} and {version} should be returned.  
    # + 'version - The version of the artefact to be returned.  It is possible to set more than one version, using `+` as separator (e.g. 1.0+2.1). The keyword `all` can be used to return all versions of the matching resource. The keyword `latest` can be used to return the latest production version of the matching resource. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned. Possible values are:  * `none`: No references will be returned * `parents`: Returns the artefacts that use the artefact matching the query * `parentsandsiblings`: Returns the artefacts that use the artefact matching the query, as well as the artefacts referenced by these artefacts * `children`: Returns the artefacts referenced by the artefact to be returned * `descendants`: References of references, up to any level, will be returned * `all`: The combination of parentsandsiblings and descendants * In addition, a concrete type of resource may also be used (for example, references=codelist). 
    # + detail - The amount of information to be returned.  Possible values are:  * `allstubs`: All artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencestubs`: Referenced artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencepartial`: Referenced item schemes should only include items used by the artefact to be returned. For example, a concept scheme would only contain the concepts used in a DSD, and its isPartial flag would be set to `true` * `allcompletestubs`: All artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `referencecompletestubs`: Referenced artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `full`: All available information for all artefacts should be returned 
    # + acceptEncoding - Specifies whether the response should be compressed and how.  `identity` (the default) indicates that no compression will be performed. 
    # + return - OK 
    remote isolated function getContentConstraints(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string resourcePath = string `/contentconstraint/${getEncodedUri(agencyID)}/${getEncodedUri(resourceID)}/${getEncodedUri('version)}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get actual constraints
    #
    # + agencyID - The agency maintaining the artefact to be returned.  It is possible to set more than one agency, using `+` as separator (e.g. BIS+ECB). The keyword `all` can be used to indicate that artefacts maintained by any maintenance agency should be returned. 
    # + resourceID - The id of the artefact to be returned. It is possible to set more than one id, using `+` as separator (e.g. CL_FREQ+CL_CONF_STATUS). The keyword `all` can be used to indicate that any artefact of the specified resource type, {agencyID} and {version} should be returned.  
    # + 'version - The version of the artefact to be returned.  It is possible to set more than one version, using `+` as separator (e.g. 1.0+2.1). The keyword `all` can be used to return all versions of the matching resource. The keyword `latest` can be used to return the latest production version of the matching resource. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned. Possible values are:  * `none`: No references will be returned * `parents`: Returns the artefacts that use the artefact matching the query * `parentsandsiblings`: Returns the artefacts that use the artefact matching the query, as well as the artefacts referenced by these artefacts * `children`: Returns the artefacts referenced by the artefact to be returned * `descendants`: References of references, up to any level, will be returned * `all`: The combination of parentsandsiblings and descendants * In addition, a concrete type of resource may also be used (for example, references=codelist). 
    # + detail - The amount of information to be returned.  Possible values are:  * `allstubs`: All artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencestubs`: Referenced artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencepartial`: Referenced item schemes should only include items used by the artefact to be returned. For example, a concept scheme would only contain the concepts used in a DSD, and its isPartial flag would be set to `true` * `allcompletestubs`: All artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `referencecompletestubs`: Referenced artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `full`: All available information for all artefacts should be returned 
    # + acceptEncoding - Specifies whether the response should be compressed and how.  `identity` (the default) indicates that no compression will be performed. 
    # + return - OK 
    remote isolated function getActualConstraints(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string resourcePath = string `/actualconstraint/${getEncodedUri(agencyID)}/${getEncodedUri(resourceID)}/${getEncodedUri('version)}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get allowed constraints
    #
    # + agencyID - The agency maintaining the artefact to be returned.  It is possible to set more than one agency, using `+` as separator (e.g. BIS+ECB). The keyword `all` can be used to indicate that artefacts maintained by any maintenance agency should be returned. 
    # + resourceID - The id of the artefact to be returned. It is possible to set more than one id, using `+` as separator (e.g. CL_FREQ+CL_CONF_STATUS). The keyword `all` can be used to indicate that any artefact of the specified resource type, {agencyID} and {version} should be returned.  
    # + 'version - The version of the artefact to be returned.  It is possible to set more than one version, using `+` as separator (e.g. 1.0+2.1). The keyword `all` can be used to return all versions of the matching resource. The keyword `latest` can be used to return the latest production version of the matching resource. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned. Possible values are:  * `none`: No references will be returned * `parents`: Returns the artefacts that use the artefact matching the query * `parentsandsiblings`: Returns the artefacts that use the artefact matching the query, as well as the artefacts referenced by these artefacts * `children`: Returns the artefacts referenced by the artefact to be returned * `descendants`: References of references, up to any level, will be returned * `all`: The combination of parentsandsiblings and descendants * In addition, a concrete type of resource may also be used (for example, references=codelist). 
    # + detail - The amount of information to be returned.  Possible values are:  * `allstubs`: All artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencestubs`: Referenced artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencepartial`: Referenced item schemes should only include items used by the artefact to be returned. For example, a concept scheme would only contain the concepts used in a DSD, and its isPartial flag would be set to `true` * `allcompletestubs`: All artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `referencecompletestubs`: Referenced artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `full`: All available information for all artefacts should be returned 
    # + acceptEncoding - Specifies whether the response should be compressed and how.  `identity` (the default) indicates that no compression will be performed. 
    # + return - OK 
    remote isolated function getAllowedConstraints(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string resourcePath = string `/allowedconstraint/${getEncodedUri(agencyID)}/${getEncodedUri(resourceID)}/${getEncodedUri('version)}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get structures
    #
    # + agencyID - The agency maintaining the artefact to be returned.  It is possible to set more than one agency, using `+` as separator (e.g. BIS+ECB). The keyword `all` can be used to indicate that artefacts maintained by any maintenance agency should be returned. 
    # + resourceID - The id of the artefact to be returned. It is possible to set more than one id, using `+` as separator (e.g. CL_FREQ+CL_CONF_STATUS). The keyword `all` can be used to indicate that any artefact of the specified resource type, {agencyID} and {version} should be returned.  
    # + 'version - The version of the artefact to be returned.  It is possible to set more than one version, using `+` as separator (e.g. 1.0+2.1). The keyword `all` can be used to return all versions of the matching resource. The keyword `latest` can be used to return the latest production version of the matching resource. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned. Possible values are:  * `none`: No references will be returned * `parents`: Returns the artefacts that use the artefact matching the query * `parentsandsiblings`: Returns the artefacts that use the artefact matching the query, as well as the artefacts referenced by these artefacts * `children`: Returns the artefacts referenced by the artefact to be returned * `descendants`: References of references, up to any level, will be returned * `all`: The combination of parentsandsiblings and descendants * In addition, a concrete type of resource may also be used (for example, references=codelist). 
    # + detail - The amount of information to be returned.  Possible values are:  * `allstubs`: All artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencestubs`: Referenced artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencepartial`: Referenced item schemes should only include items used by the artefact to be returned. For example, a concept scheme would only contain the concepts used in a DSD, and its isPartial flag would be set to `true` * `allcompletestubs`: All artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `referencecompletestubs`: Referenced artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `full`: All available information for all artefacts should be returned 
    # + acceptEncoding - Specifies whether the response should be compressed and how.  `identity` (the default) indicates that no compression will be performed. 
    # + return - OK 
    remote isolated function getStructures(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string resourcePath = string `/structure/${getEncodedUri(agencyID)}/${getEncodedUri(resourceID)}/${getEncodedUri('version)}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get concept schemes
    #
    # + agencyID - The agency maintaining the artefact to be returned.  It is possible to set more than one agency, using `+` as separator (e.g. BIS+ECB). The keyword `all` can be used to indicate that artefacts maintained by any maintenance agency should be returned. 
    # + resourceID - The id of the artefact to be returned. It is possible to set more than one id, using `+` as separator (e.g. CL_FREQ+CL_CONF_STATUS). The keyword `all` can be used to indicate that any artefact of the specified resource type, {agencyID} and {version} should be returned.  
    # + 'version - The version of the artefact to be returned.  It is possible to set more than one version, using `+` as separator (e.g. 1.0+2.1). The keyword `all` can be used to return all versions of the matching resource. The keyword `latest` can be used to return the latest production version of the matching resource. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned. Possible values are:  * `none`: No references will be returned * `parents`: Returns the artefacts that use the artefact matching the query * `parentsandsiblings`: Returns the artefacts that use the artefact matching the query, as well as the artefacts referenced by these artefacts * `children`: Returns the artefacts referenced by the artefact to be returned * `descendants`: References of references, up to any level, will be returned * `all`: The combination of parentsandsiblings and descendants * In addition, a concrete type of resource may also be used (for example, references=codelist). 
    # + detail - The amount of information to be returned.  Possible values are:  * `allstubs`: All artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencestubs`: Referenced artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencepartial`: Referenced item schemes should only include items used by the artefact to be returned. For example, a concept scheme would only contain the concepts used in a DSD, and its isPartial flag would be set to `true` * `allcompletestubs`: All artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `referencecompletestubs`: Referenced artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `full`: All available information for all artefacts should be returned 
    # + acceptEncoding - Specifies whether the response should be compressed and how.  `identity` (the default) indicates that no compression will be performed. 
    # + return - OK 
    remote isolated function getConceptSchemes(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string resourcePath = string `/conceptscheme/${getEncodedUri(agencyID)}/${getEncodedUri(resourceID)}/${getEncodedUri('version)}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get codelists
    #
    # + agencyID - The agency maintaining the artefact to be returned.  It is possible to set more than one agency, using `+` as separator (e.g. BIS+ECB). The keyword `all` can be used to indicate that artefacts maintained by any maintenance agency should be returned. 
    # + resourceID - The id of the artefact to be returned. It is possible to set more than one id, using `+` as separator (e.g. CL_FREQ+CL_CONF_STATUS). The keyword `all` can be used to indicate that any artefact of the specified resource type, {agencyID} and {version} should be returned.  
    # + 'version - The version of the artefact to be returned.  It is possible to set more than one version, using `+` as separator (e.g. 1.0+2.1). The keyword `all` can be used to return all versions of the matching resource. The keyword `latest` can be used to return the latest production version of the matching resource. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned. Possible values are:  * `none`: No references will be returned * `parents`: Returns the artefacts that use the artefact matching the query * `parentsandsiblings`: Returns the artefacts that use the artefact matching the query, as well as the artefacts referenced by these artefacts * `children`: Returns the artefacts referenced by the artefact to be returned * `descendants`: References of references, up to any level, will be returned * `all`: The combination of parentsandsiblings and descendants * In addition, a concrete type of resource may also be used (for example, references=codelist). 
    # + detail - The amount of information to be returned.  Possible values are:  * `allstubs`: All artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencestubs`: Referenced artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencepartial`: Referenced item schemes should only include items used by the artefact to be returned. For example, a concept scheme would only contain the concepts used in a DSD, and its isPartial flag would be set to `true` * `allcompletestubs`: All artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `referencecompletestubs`: Referenced artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `full`: All available information for all artefacts should be returned 
    # + acceptEncoding - Specifies whether the response should be compressed and how.  `identity` (the default) indicates that no compression will be performed. 
    # + return - OK 
    remote isolated function getCodelists(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string resourcePath = string `/codelist/${getEncodedUri(agencyID)}/${getEncodedUri(resourceID)}/${getEncodedUri('version)}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get category schemes
    #
    # + agencyID - The agency maintaining the artefact to be returned.  It is possible to set more than one agency, using `+` as separator (e.g. BIS+ECB). The keyword `all` can be used to indicate that artefacts maintained by any maintenance agency should be returned. 
    # + resourceID - The id of the artefact to be returned. It is possible to set more than one id, using `+` as separator (e.g. CL_FREQ+CL_CONF_STATUS). The keyword `all` can be used to indicate that any artefact of the specified resource type, {agencyID} and {version} should be returned.  
    # + 'version - The version of the artefact to be returned.  It is possible to set more than one version, using `+` as separator (e.g. 1.0+2.1). The keyword `all` can be used to return all versions of the matching resource. The keyword `latest` can be used to return the latest production version of the matching resource. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned. Possible values are:  * `none`: No references will be returned * `parents`: Returns the artefacts that use the artefact matching the query * `parentsandsiblings`: Returns the artefacts that use the artefact matching the query, as well as the artefacts referenced by these artefacts * `children`: Returns the artefacts referenced by the artefact to be returned * `descendants`: References of references, up to any level, will be returned * `all`: The combination of parentsandsiblings and descendants * In addition, a concrete type of resource may also be used (for example, references=codelist). 
    # + detail - The amount of information to be returned.  Possible values are:  * `allstubs`: All artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencestubs`: Referenced artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencepartial`: Referenced item schemes should only include items used by the artefact to be returned. For example, a concept scheme would only contain the concepts used in a DSD, and its isPartial flag would be set to `true` * `allcompletestubs`: All artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `referencecompletestubs`: Referenced artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `full`: All available information for all artefacts should be returned 
    # + acceptEncoding - Specifies whether the response should be compressed and how.  `identity` (the default) indicates that no compression will be performed. 
    # + return - OK 
    remote isolated function getCategorySchemes(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string resourcePath = string `/categoryscheme/${getEncodedUri(agencyID)}/${getEncodedUri(resourceID)}/${getEncodedUri('version)}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get hierarchical codelists
    #
    # + agencyID - The agency maintaining the artefact to be returned.  It is possible to set more than one agency, using `+` as separator (e.g. BIS+ECB). The keyword `all` can be used to indicate that artefacts maintained by any maintenance agency should be returned. 
    # + resourceID - The id of the artefact to be returned. It is possible to set more than one id, using `+` as separator (e.g. CL_FREQ+CL_CONF_STATUS). The keyword `all` can be used to indicate that any artefact of the specified resource type, {agencyID} and {version} should be returned.  
    # + 'version - The version of the artefact to be returned.  It is possible to set more than one version, using `+` as separator (e.g. 1.0+2.1). The keyword `all` can be used to return all versions of the matching resource. The keyword `latest` can be used to return the latest production version of the matching resource. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned. Possible values are:  * `none`: No references will be returned * `parents`: Returns the artefacts that use the artefact matching the query * `parentsandsiblings`: Returns the artefacts that use the artefact matching the query, as well as the artefacts referenced by these artefacts * `children`: Returns the artefacts referenced by the artefact to be returned * `descendants`: References of references, up to any level, will be returned * `all`: The combination of parentsandsiblings and descendants * In addition, a concrete type of resource may also be used (for example, references=codelist). 
    # + detail - The amount of information to be returned.  Possible values are:  * `allstubs`: All artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencestubs`: Referenced artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencepartial`: Referenced item schemes should only include items used by the artefact to be returned. For example, a concept scheme would only contain the concepts used in a DSD, and its isPartial flag would be set to `true` * `allcompletestubs`: All artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `referencecompletestubs`: Referenced artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `full`: All available information for all artefacts should be returned 
    # + acceptEncoding - Specifies whether the response should be compressed and how.  `identity` (the default) indicates that no compression will be performed. 
    # + return - OK 
    remote isolated function getHierarchicalCodelists(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string resourcePath = string `/hierarchicalcodelist/${getEncodedUri(agencyID)}/${getEncodedUri(resourceID)}/${getEncodedUri('version)}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get agency schemes
    #
    # + agencyID - The agency maintaining the artefact to be returned.  It is possible to set more than one agency, using `+` as separator (e.g. BIS+ECB). The keyword `all` can be used to indicate that artefacts maintained by any maintenance agency should be returned. 
    # + resourceID - The id of the artefact to be returned. It is possible to set more than one id, using `+` as separator (e.g. CL_FREQ+CL_CONF_STATUS). The keyword `all` can be used to indicate that any artefact of the specified resource type, {agencyID} and {version} should be returned.  
    # + 'version - The version of the artefact to be returned.  It is possible to set more than one version, using `+` as separator (e.g. 1.0+2.1). The keyword `all` can be used to return all versions of the matching resource. The keyword `latest` can be used to return the latest production version of the matching resource. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned. Possible values are:  * `none`: No references will be returned * `parents`: Returns the artefacts that use the artefact matching the query * `parentsandsiblings`: Returns the artefacts that use the artefact matching the query, as well as the artefacts referenced by these artefacts * `children`: Returns the artefacts referenced by the artefact to be returned * `descendants`: References of references, up to any level, will be returned * `all`: The combination of parentsandsiblings and descendants * In addition, a concrete type of resource may also be used (for example, references=codelist). 
    # + detail - The amount of information to be returned.  Possible values are:  * `allstubs`: All artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencestubs`: Referenced artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencepartial`: Referenced item schemes should only include items used by the artefact to be returned. For example, a concept scheme would only contain the concepts used in a DSD, and its isPartial flag would be set to `true` * `allcompletestubs`: All artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `referencecompletestubs`: Referenced artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `full`: All available information for all artefacts should be returned 
    # + acceptEncoding - Specifies whether the response should be compressed and how.  `identity` (the default) indicates that no compression will be performed. 
    # + return - OK 
    remote isolated function getAgencySchemes(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string resourcePath = string `/agencyscheme/${getEncodedUri(agencyID)}/${getEncodedUri(resourceID)}/${getEncodedUri('version)}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get concepts
    #
    # + agencyID - The agency maintaining the artefact to be returned.  It is possible to set more than one agency, using `+` as separator (e.g. BIS+ECB). The keyword `all` can be used to indicate that artefacts maintained by any maintenance agency should be returned. 
    # + resourceID - The id of the artefact to be returned. It is possible to set more than one id, using `+` as separator (e.g. CL_FREQ+CL_CONF_STATUS). The keyword `all` can be used to indicate that any artefact of the specified resource type, {agencyID} and {version} should be returned.  
    # + 'version - The version of the artefact to be returned.  It is possible to set more than one version, using `+` as separator (e.g. 1.0+2.1). The keyword `all` can be used to return all versions of the matching resource. The keyword `latest` can be used to return the latest production version of the matching resource. 
    # + itemID - The id of the item to be returned.  It is possible to set more than one id, using `+` as separator (e.g. A+Q+M). The keyword `all` can be used to return all items of the matching resource. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned. Possible values are:  * `none`: No references will be returned * `parents`: Returns the artefacts that use the artefact matching the query * `parentsandsiblings`: Returns the artefacts that use the artefact matching the query, as well as the artefacts referenced by these artefacts * `children`: Returns the artefacts referenced by the artefact to be returned * `descendants`: References of references, up to any level, will be returned * `all`: The combination of parentsandsiblings and descendants * In addition, a concrete type of resource may also be used (for example, references=codelist). 
    # + detail - The amount of information to be returned.  Possible values are:  * `allstubs`: All artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencestubs`: Referenced artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencepartial`: Referenced item schemes should only include items used by the artefact to be returned. For example, a concept scheme would only contain the concepts used in a DSD, and its isPartial flag would be set to `true` * `allcompletestubs`: All artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `referencecompletestubs`: Referenced artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `full`: All available information for all artefacts should be returned 
    # + acceptEncoding - Specifies whether the response should be compressed and how.  `identity` (the default) indicates that no compression will be performed. 
    # + return - OK 
    remote isolated function getConcepts(string agencyID, string resourceID, string 'version, string itemID, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string resourcePath = string `/conceptscheme/${getEncodedUri(agencyID)}/${getEncodedUri(resourceID)}/${getEncodedUri('version)}/${getEncodedUri(itemID)}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get codes
    #
    # + agencyID - The agency maintaining the artefact to be returned.  It is possible to set more than one agency, using `+` as separator (e.g. BIS+ECB). The keyword `all` can be used to indicate that artefacts maintained by any maintenance agency should be returned. 
    # + resourceID - The id of the artefact to be returned. It is possible to set more than one id, using `+` as separator (e.g. CL_FREQ+CL_CONF_STATUS). The keyword `all` can be used to indicate that any artefact of the specified resource type, {agencyID} and {version} should be returned.  
    # + 'version - The version of the artefact to be returned.  It is possible to set more than one version, using `+` as separator (e.g. 1.0+2.1). The keyword `all` can be used to return all versions of the matching resource. The keyword `latest` can be used to return the latest production version of the matching resource. 
    # + itemID - The id of the item to be returned.  It is possible to set more than one id, using `+` as separator (e.g. A+Q+M). The keyword `all` can be used to return all items of the matching resource. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned. Possible values are:  * `none`: No references will be returned * `parents`: Returns the artefacts that use the artefact matching the query * `parentsandsiblings`: Returns the artefacts that use the artefact matching the query, as well as the artefacts referenced by these artefacts * `children`: Returns the artefacts referenced by the artefact to be returned * `descendants`: References of references, up to any level, will be returned * `all`: The combination of parentsandsiblings and descendants * In addition, a concrete type of resource may also be used (for example, references=codelist). 
    # + detail - The amount of information to be returned.  Possible values are:  * `allstubs`: All artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencestubs`: Referenced artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencepartial`: Referenced item schemes should only include items used by the artefact to be returned. For example, a concept scheme would only contain the concepts used in a DSD, and its isPartial flag would be set to `true` * `allcompletestubs`: All artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `referencecompletestubs`: Referenced artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `full`: All available information for all artefacts should be returned 
    # + acceptEncoding - Specifies whether the response should be compressed and how.  `identity` (the default) indicates that no compression will be performed. 
    # + return - OK 
    remote isolated function getCodes(string agencyID, string resourceID, string 'version, string itemID, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string resourcePath = string `/codelist/${getEncodedUri(agencyID)}/${getEncodedUri(resourceID)}/${getEncodedUri('version)}/${getEncodedUri(itemID)}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get categories
    #
    # + agencyID - The agency maintaining the artefact to be returned.  It is possible to set more than one agency, using `+` as separator (e.g. BIS+ECB). The keyword `all` can be used to indicate that artefacts maintained by any maintenance agency should be returned. 
    # + resourceID - The id of the artefact to be returned. It is possible to set more than one id, using `+` as separator (e.g. CL_FREQ+CL_CONF_STATUS). The keyword `all` can be used to indicate that any artefact of the specified resource type, {agencyID} and {version} should be returned.  
    # + 'version - The version of the artefact to be returned.  It is possible to set more than one version, using `+` as separator (e.g. 1.0+2.1). The keyword `all` can be used to return all versions of the matching resource. The keyword `latest` can be used to return the latest production version of the matching resource. 
    # + itemID - The id of the item to be returned.  It is possible to set more than one id, using `+` as separator (e.g. A+Q+M). The keyword `all` can be used to return all items of the matching resource. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned. Possible values are:  * `none`: No references will be returned * `parents`: Returns the artefacts that use the artefact matching the query * `parentsandsiblings`: Returns the artefacts that use the artefact matching the query, as well as the artefacts referenced by these artefacts * `children`: Returns the artefacts referenced by the artefact to be returned * `descendants`: References of references, up to any level, will be returned * `all`: The combination of parentsandsiblings and descendants * In addition, a concrete type of resource may also be used (for example, references=codelist). 
    # + detail - The amount of information to be returned.  Possible values are:  * `allstubs`: All artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencestubs`: Referenced artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencepartial`: Referenced item schemes should only include items used by the artefact to be returned. For example, a concept scheme would only contain the concepts used in a DSD, and its isPartial flag would be set to `true` * `allcompletestubs`: All artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `referencecompletestubs`: Referenced artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `full`: All available information for all artefacts should be returned 
    # + acceptEncoding - Specifies whether the response should be compressed and how.  `identity` (the default) indicates that no compression will be performed. 
    # + return - OK 
    remote isolated function getCategories(string agencyID, string resourceID, string 'version, string itemID, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string resourcePath = string `/categoryscheme/${getEncodedUri(agencyID)}/${getEncodedUri(resourceID)}/${getEncodedUri('version)}/${getEncodedUri(itemID)}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get hierarchies
    #
    # + agencyID - The agency maintaining the artefact to be returned.  It is possible to set more than one agency, using `+` as separator (e.g. BIS+ECB). The keyword `all` can be used to indicate that artefacts maintained by any maintenance agency should be returned. 
    # + resourceID - The id of the artefact to be returned. It is possible to set more than one id, using `+` as separator (e.g. CL_FREQ+CL_CONF_STATUS). The keyword `all` can be used to indicate that any artefact of the specified resource type, {agencyID} and {version} should be returned.  
    # + 'version - The version of the artefact to be returned.  It is possible to set more than one version, using `+` as separator (e.g. 1.0+2.1). The keyword `all` can be used to return all versions of the matching resource. The keyword `latest` can be used to return the latest production version of the matching resource. 
    # + itemID - The id of the item to be returned.  It is possible to set more than one id, using `+` as separator (e.g. A+Q+M). The keyword `all` can be used to return all items of the matching resource. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned. Possible values are:  * `none`: No references will be returned * `parents`: Returns the artefacts that use the artefact matching the query * `parentsandsiblings`: Returns the artefacts that use the artefact matching the query, as well as the artefacts referenced by these artefacts * `children`: Returns the artefacts referenced by the artefact to be returned * `descendants`: References of references, up to any level, will be returned * `all`: The combination of parentsandsiblings and descendants * In addition, a concrete type of resource may also be used (for example, references=codelist). 
    # + detail - The amount of information to be returned.  Possible values are:  * `allstubs`: All artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencestubs`: Referenced artefacts should be returned as stubs, containing only identification information, as well as the artefacts' name * `referencepartial`: Referenced item schemes should only include items used by the artefact to be returned. For example, a concept scheme would only contain the concepts used in a DSD, and its isPartial flag would be set to `true` * `allcompletestubs`: All artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `referencecompletestubs`: Referenced artefacts should be returned as complete stubs, containing identification information, the artefacts' name, description, annotations and isFinal information * `full`: All available information for all artefacts should be returned 
    # + acceptEncoding - Specifies whether the response should be compressed and how.  `identity` (the default) indicates that no compression will be performed. 
    # + return - OK 
    remote isolated function getHierarchies(string agencyID, string resourceID, string 'version, string itemID, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string resourcePath = string `/hierarchicalcodelist/${getEncodedUri(agencyID)}/${getEncodedUri(resourceID)}/${getEncodedUri('version)}/${getEncodedUri(itemID)}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
