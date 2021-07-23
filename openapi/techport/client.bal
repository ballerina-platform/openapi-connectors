import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

# TechPort RESTful API
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    # Client initialization.
    #
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Returns error at failure of client initialization
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://techport.nasa.gov") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    #
    # + return - Successful response
    remote isolated function  api() returns http:Response|error {
        string  path = string `/api`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    #
    # + updatedSince - ISO 8601 full-date in the format YYYY-MM-DD. Filters the list of available ID values by their lastUpdated parameter.
    # + return - Successful response
    remote isolated function  projects(string updatedSince) returns InlineResponse200|error {
        string  path = string `/api/projects`;
        map<anydata> queryParam = {"updatedSince": updatedSince};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp-> get(path, targetType = InlineResponse200);
        return response;
    }
    #
    # + projectId - The specific ID of the project requested.
    # + searchQuery - The term on which to search. Will check all project fields for the this term.
    # + missionDirectorate - The mission directorate acronym of the projects. Used to filter.
    # + titleSearch - The term on which to search. Will check only project titles for the this term.
    # + return - Successful response
    remote isolated function  search(int? projectId = (), string? searchQuery = (), string? missionDirectorate = (), string? titleSearch = ()) returns InlineResponse2001[]|error {
        string  path = string `/api/projects/search`;
        map<anydata> queryParam = {"projectId": projectId, "searchQuery": searchQuery, "missionDirectorate": missionDirectorate, "titleSearch": titleSearch};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2001[] response = check self.clientEp-> get(path, targetType = InlineResponse2001Arr);
        return response;
    }
    #
    # + projectId - ID of project to fetch
    # + return - Successful response
    remote isolated function  projectsByprojectId(int projectId) returns Project|error {
        string  path = string `/api/projects/${projectId}`;
        Project response = check self.clientEp-> get(path, targetType = Project);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
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
