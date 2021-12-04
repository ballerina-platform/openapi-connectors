// Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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
import ballerina/url;
import ballerina/lang.'string;

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
    }
    # Get data
    #
    # + flow - The **statistical domain** (aka dataflow) of the data to be returned.
    # + 'key - The (possibly partial) **key identifying the data to be returned**. 
    # + startPeriod - The start of the period for which results should be supplied (inclusive).
    # + endPeriod - The end of the period for which results should be supplied (inclusive).
    # + firstNObservations - The maximum number of observations to be returned starting from the oldest one
    # + lastNObservations - The maximum number of observations to be returned starting from the most recent one
    # + detail - The **amount of information** to be returned. 
    # + acceptEncoding - Specifies whether the response should be compressed and how. 
    # + return - OK
    remote isolated function getData(string flow, string 'key, string? startPeriod = (), string? endPeriod = (), int? firstNObservations = (), int? lastNObservations = (), string detail = "full", string acceptEncoding = "identity") returns string|error {
        string  path = string `/data/${flow}/${'key}/all`;
        map<anydata> queryParam = {"startPeriod": startPeriod, "endPeriod": endPeriod, "firstNObservations": firstNObservations, "lastNObservations": lastNObservations, "detail": detail};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Get information about data availability
    #
    # + flow - The **statistical domain** (aka dataflow) of the data to be returned.
    # + 'key - The (possibly partial) **key identifying the data to be returned**. 
    # + componentID - The id of the Dimension for which to obtain availability information about. Use all to indicate that data availability should be provided for all dimensions.
    # + mode - Instructs the web service to return a ContentConstraint which defines a Cube Region containing values which will be returned by executing the query (mode="exact") vs a Cube Region showing what values remain valid selections that could be added to the data query (mode="available"). A valid selection is one which results in one or more series existing for the selected value, based on the current data query selection state defined by the current path parameters.
    # + references - Instructs the web service to return (or not) the artefacts referenced by the ContentConstraint to be returned.
    # + startPeriod - The start of the period for which results should be supplied (inclusive).
    # + endPeriod - The end of the period for which results should be supplied (inclusive).
    # + acceptEncoding - Specifies whether the response should be compressed and how. 
    # + return - OK
    remote isolated function getDataAvailabilityInformation(string flow, string 'key, string componentID, string mode = "exact", string references = "none", string? startPeriod = (), string? endPeriod = (), string acceptEncoding = "identity") returns string|error {
        string  path = string `/availableconstraint/${flow}/${'key}/all/${componentID}`;
        map<anydata> queryParam = {"mode": mode, "references": references, "startPeriod": startPeriod, "endPeriod": endPeriod};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Get data structures
    #
    # + agencyID - The agency maintaining the artefact to be returned. 
    # + resourceID - The id of the artefact to be returned.
    # + 'version - The version of the artefact to be returned. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned.
    # + detail - The amount of information to be returned. 
    # + acceptEncoding - Specifies whether the response should be compressed and how. 
    # + return - OK
    remote isolated function getDataStructures(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string  path = string `/datastructure/${agencyID}/${resourceID}/${'version}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Get dataflows
    #
    # + agencyID - The agency maintaining the artefact to be returned. 
    # + resourceID - The id of the artefact to be returned.
    # + 'version - The version of the artefact to be returned. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned.
    # + detail - The amount of information to be returned. 
    # + acceptEncoding - Specifies whether the response should be compressed and how. 
    # + return - OK
    remote isolated function getDataFlows(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string  path = string `/dataflow/${agencyID}/${resourceID}/${'version}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Get categorisations
    #
    # + agencyID - The agency maintaining the artefact to be returned. 
    # + resourceID - The id of the artefact to be returned.
    # + 'version - The version of the artefact to be returned. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned.
    # + detail - The amount of information to be returned. 
    # + acceptEncoding - Specifies whether the response should be compressed and how. 
    # + return - OK
    remote isolated function getCategorisations(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string  path = string `/categorisation/${agencyID}/${resourceID}/${'version}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Get content constraints
    #
    # + agencyID - The agency maintaining the artefact to be returned. 
    # + resourceID - The id of the artefact to be returned.
    # + 'version - The version of the artefact to be returned. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned.
    # + detail - The amount of information to be returned. 
    # + acceptEncoding - Specifies whether the response should be compressed and how. 
    # + return - OK
    remote isolated function getContentConstraints(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string  path = string `/contentconstraint/${agencyID}/${resourceID}/${'version}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Get actual constraints
    #
    # + agencyID - The agency maintaining the artefact to be returned. 
    # + resourceID - The id of the artefact to be returned.
    # + 'version - The version of the artefact to be returned. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned.
    # + detail - The amount of information to be returned. 
    # + acceptEncoding - Specifies whether the response should be compressed and how. 
    # + return - OK
    remote isolated function getActualConstraints(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string  path = string `/actualconstraint/${agencyID}/${resourceID}/${'version}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Get allowed constraints
    #
    # + agencyID - The agency maintaining the artefact to be returned. 
    # + resourceID - The id of the artefact to be returned.
    # + 'version - The version of the artefact to be returned. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned.
    # + detail - The amount of information to be returned. 
    # + acceptEncoding - Specifies whether the response should be compressed and how. 
    # + return - OK
    remote isolated function getAllowedConstraints(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string  path = string `/allowedconstraint/${agencyID}/${resourceID}/${'version}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Get structures
    #
    # + agencyID - The agency maintaining the artefact to be returned. 
    # + resourceID - The id of the artefact to be returned.
    # + 'version - The version of the artefact to be returned. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned.
    # + detail - The amount of information to be returned. 
    # + acceptEncoding - Specifies whether the response should be compressed and how. 
    # + return - OK
    remote isolated function getStructures(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string  path = string `/structure/${agencyID}/${resourceID}/${'version}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Get concept schemes
    #
    # + agencyID - The agency maintaining the artefact to be returned. 
    # + resourceID - The id of the artefact to be returned.
    # + 'version - The version of the artefact to be returned. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned.
    # + detail - The amount of information to be returned. 
    # + acceptEncoding - Specifies whether the response should be compressed and how. 
    # + return - OK
    remote isolated function getConceptSchemes(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string  path = string `/conceptscheme/${agencyID}/${resourceID}/${'version}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Get codelists
    #
    # + agencyID - The agency maintaining the artefact to be returned. 
    # + resourceID - The id of the artefact to be returned.
    # + 'version - The version of the artefact to be returned. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned.
    # + detail - The amount of information to be returned. 
    # + acceptEncoding - Specifies whether the response should be compressed and how. 
    # + return - OK
    remote isolated function getCodelists(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string  path = string `/codelist/${agencyID}/${resourceID}/${'version}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Get category schemes
    #
    # + agencyID - The agency maintaining the artefact to be returned. 
    # + resourceID - The id of the artefact to be returned.
    # + 'version - The version of the artefact to be returned. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned.
    # + detail - The amount of information to be returned. 
    # + acceptEncoding - Specifies whether the response should be compressed and how. 
    # + return - OK
    remote isolated function getCategorySchemes(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string  path = string `/categoryscheme/${agencyID}/${resourceID}/${'version}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Get hierarchical codelists
    #
    # + agencyID - The agency maintaining the artefact to be returned. 
    # + resourceID - The id of the artefact to be returned.
    # + 'version - The version of the artefact to be returned. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned.
    # + detail - The amount of information to be returned. 
    # + acceptEncoding - Specifies whether the response should be compressed and how. 
    # + return - OK
    remote isolated function getHierarchicalCodelists(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string  path = string `/hierarchicalcodelist/${agencyID}/${resourceID}/${'version}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Get agency schemes
    #
    # + agencyID - The agency maintaining the artefact to be returned. 
    # + resourceID - The id of the artefact to be returned.
    # + 'version - The version of the artefact to be returned. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned.
    # + detail - The amount of information to be returned. 
    # + acceptEncoding - Specifies whether the response should be compressed and how. 
    # + return - OK
    remote isolated function getAgencySchemes(string agencyID, string resourceID, string 'version, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string  path = string `/agencyscheme/${agencyID}/${resourceID}/${'version}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Get concepts
    #
    # + agencyID - The agency maintaining the artefact to be returned. 
    # + resourceID - The id of the artefact to be returned.
    # + 'version - The version of the artefact to be returned. 
    # + itemID - The id of the item to be returned. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned.
    # + detail - The amount of information to be returned. 
    # + acceptEncoding - Specifies whether the response should be compressed and how. 
    # + return - OK
    remote isolated function getConcepts(string agencyID, string resourceID, string 'version, string itemID, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string  path = string `/conceptscheme/${agencyID}/${resourceID}/${'version}/${itemID}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Get codes
    #
    # + agencyID - The agency maintaining the artefact to be returned. 
    # + resourceID - The id of the artefact to be returned.
    # + 'version - The version of the artefact to be returned. 
    # + itemID - The id of the item to be returned. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned.
    # + detail - The amount of information to be returned. 
    # + acceptEncoding - Specifies whether the response should be compressed and how. 
    # + return - OK
    remote isolated function getCodes(string agencyID, string resourceID, string 'version, string itemID, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string  path = string `/codelist/${agencyID}/${resourceID}/${'version}/${itemID}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Get categories
    #
    # + agencyID - The agency maintaining the artefact to be returned. 
    # + resourceID - The id of the artefact to be returned.
    # + 'version - The version of the artefact to be returned. 
    # + itemID - The id of the item to be returned. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned.
    # + detail - The amount of information to be returned. 
    # + acceptEncoding - Specifies whether the response should be compressed and how. 
    # + return - OK
    remote isolated function getCategories(string agencyID, string resourceID, string 'version, string itemID, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string  path = string `/categoryscheme/${agencyID}/${resourceID}/${'version}/${itemID}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Get hierarchies
    #
    # + agencyID - The agency maintaining the artefact to be returned. 
    # + resourceID - The id of the artefact to be returned.
    # + 'version - The version of the artefact to be returned. 
    # + itemID - The id of the item to be returned. 
    # + references - Instructs the web service to return (or not) the artefacts referenced by the artefact to be returned.
    # + detail - The amount of information to be returned. 
    # + acceptEncoding - Specifies whether the response should be compressed and how. 
    # + return - OK
    remote isolated function getHierarchies(string agencyID, string resourceID, string 'version, string itemID, string references = "none", string detail = "full", string acceptEncoding = "identity") returns string|error {
        string  path = string `/hierarchicalcodelist/${agencyID}/${resourceID}/${'version}/${itemID}`;
        map<anydata> queryParam = {"references": references, "detail": detail};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept-Encoding": acceptEncoding};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}

# Generate header map for given header values.
#
# + headerParam - Headers  map
# + return - Returns generated map or error at failure of client initialization
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
