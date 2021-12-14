// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

# This is a generated connector for [TechPort RESTful API v3.4.0](https://stats.bis.org/api-doc/v1/) OpenAPI specification.
# All of the integrations communicates with TechPort through this API.<br/><br/>For additional help getting started with the API, visit the following help articles:<br/><ul><li>[Using the REST API](https://data.nasa.gov/developer/external/techport/techport-api.pdf)</li></ul>
@display {label: "TechPort", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization doesn't require setting the API credentials.
    # Please refer to [API documentation](https://data.nasa.gov/developer/external/techport/techport-api.pdf) for more detail.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://techport.nasa.gov") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Returns the swagger specification for the API.
    #
    # + return - Successful response 
    remote isolated function getApiSpecification() returns http:Response|error {
        string resourcePath = string `/api/specification`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of available technology project IDs.
    #
    # + updatedSince - ISO 8601 full-date in the format YYYY-MM-DD. Filters the list of available ID values by their lastUpdated parameter. 
    # + return - List of Project Ids since the given date. 
    remote isolated function getProjectsSince(string updatedSince) returns ProjectIdResponse|error {
        string resourcePath = string `/api/projects`;
        map<anydata> queryParam = {"updatedSince": updatedSince};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ProjectIdResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of projects matching the search term.
    #
    # + projectId - The specific ID of the project requested. 
    # + searchQuery - The term on which to search. Will check all project fields for the this term. 
    # + missionDirectorate - The mission directorate acronym of the projects. Used to filter. 
    # + titleSearch - The term on which to search. Will check only project titles for the this term. 
    # + return - List of ProjectSearchResult records. 
    remote isolated function searchProjects(int? projectId = (), string? searchQuery = (), string? missionDirectorate = (), string? titleSearch = ()) returns ProjectSearchResponse|error {
        string resourcePath = string `/api/projects/search`;
        map<anydata> queryParam = {"projectId": projectId, "searchQuery": searchQuery, "missionDirectorate": missionDirectorate, "titleSearch": titleSearch};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ProjectSearchResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns information about a specific technology project.
    #
    # + projectId - ID of project to fetch 
    # + return - Project with the given project ID. 
    remote isolated function getProject(int projectId) returns Project|error {
        string resourcePath = string `/api/projects/${projectId}`;
        Project response = check self.clientEp->get(resourcePath);
        return response;
    }
}
