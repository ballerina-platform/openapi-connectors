import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

public type ClientConfig record {
    http:BearerTokenConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# Please see the complete Orbit API documentation at [https://docs.orbit.love/reference](https://docs.orbit.love/reference).
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    # Client initialization.
    #
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Returns error at failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://app.orbit.love/api/v1") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Get all activity types
    #
    # + return - success
    remote isolated function  activity_types() returns json|error {
        string  path = string `/activity_types`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Get info about the current user
    #
    # + return - success
    remote isolated function  user() returns json|error {
        string  path = string `/user`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Get all workspaces for the current user
    #
    # + return - success
    remote isolated function  workspaces() returns json|error {
        string  path = string `/workspaces`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Get a workspace
    #
    # + workspace_id - Workspace ID
    # + return - success
    remote isolated function  workspacesByworkspace_id(string workspace_id) returns json|error {
        string  path = string `/workspaces/${workspace_id}`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # List activities for a workspace
    #
    # + workspace_id - Workspace ID
    # + activityTags - Activity tags allow to group activities
    # + affiliation - Association with either 'member' or 'teammate'
    # + memberTags - Member tags allow to group members
    # + orbitLevel - Orbit level
    # + activityType - Activity type related to activities
    # + weight - Weighted score of activity
    # + identity - Activity identity of platforms
    # + location - Identifier for the location
    # + company - Identifier for the company
    # + startDate - Activity start date
    # + endDate - Activity end date
    # + page - Page of the activities
    # + direction - Sort activities 'ASC' if Ascending and 'DESC' if Descending
    # + items - Number of activities
    # + sort - Sort activities by properties of activity
    # + 'type - Type related to activities
    # + return - success
    remote isolated function  activities(string workspace_id, string? activityTags = (), string? affiliation = (), string? memberTags = (), string? orbitLevel = (), string? activityType = (), string? weight = (), string? identity = (), string? location = (), string? company = (), string? startDate = (), string? endDate = (), string? page = (), string? direction = (), string? items = (), string? sort = (), string? 'type = ()) returns json|error {
        string  path = string `/${workspace_id}/activities`;
        map<anydata> queryParam = {"activity_tags": activityTags, "affiliation": affiliation, "member_tags": memberTags, "orbit_level": orbitLevel, "activity_type": activityType, "weight": weight, "identity": identity, "location": location, "company": company, "start_date": startDate, "end_date": endDate, "page": page, "direction": direction, "items": items, "sort": sort, "type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Create a Custom or a Content activity for a new or existing member
    #
    # + workspace_id - Workspace ID
    # + payload - Create activity
    # + return - success
    remote isolated function postActivitiesById(string workspace_id, ActivityAndIdentity payload) returns json|error {
        string  path = string `/${workspace_id}/activities`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, targetType=json);
        return response;
    }
    # Get an activity in the workspace
    #
    # + workspace_id - Workspace ID
    # + id - Activity ID
    # + return - success
    remote isolated function getActivitiesById(string workspace_id, string id) returns json|error {
        string  path = string `/${workspace_id}/activities/${id}`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # List members in a workspace
    #
    # + workspace_id - Workspace ID
    # + activityTags - Activity tags allow to group activities
    # + affiliation - Association with either 'member' or 'teammate'
    # + memberTags - Member tags allow to group members
    # + orbitLevel - Orbit level
    # + activityType - Activity type related to activities
    # + weight - Weighted score of activity
    # + identity - Activity identity of platforms
    # + location - Identifier for the location
    # + company - Identifier for the company
    # + startDate - Activity start date
    # + endDate - Activity end date
    # + query - Activity query
    # + page - Page of the members
    # + direction - Organise activities 'ASC' if Ascending and 'DESC' if Descending
    # + items - Number of members
    # + activitiesCountMin - Minumum count of activities
    # + activitiesCountMax - Maximum count of activities
    # + sort - Sort activities by properties of activity
    # + 'type - Type related to activities
    # + return - success
    remote isolated function getmembers(string workspace_id, string? activityTags = (), string? affiliation = (), string? memberTags = (), string? orbitLevel = (), string? activityType = (), string? weight = (), string? identity = (), string? location = (), string? company = (), string? startDate = (), string? endDate = (), string? query = (), string? page = (), string? direction = (), string? items = (), string? activitiesCountMin = (), string? activitiesCountMax = (), string? sort = (), string? 'type = ()) returns json|error {
        string  path = string `/${workspace_id}/members`;
        map<anydata> queryParam = {"activity_tags": activityTags, "affiliation": affiliation, "member_tags": memberTags, "orbit_level": orbitLevel, "activity_type": activityType, "weight": weight, "identity": identity, "location": location, "company": company, "start_date": startDate, "end_date": endDate, "query": query, "page": page, "direction": direction, "items": items, "activities_count_min": activitiesCountMin, "activities_count_max": activitiesCountMax, "sort": sort, "type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Create or update a member
    #
    # + workspace_id - Workspace ID
    # + payload - Create member
    # + return - success
    remote isolated function postmembers(string workspace_id, MemberAndIdentity payload) returns json|error {
        string  path = string `/${workspace_id}/members`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, targetType=json);
        return response;
    }
    # Find a member by an identity
    #
    # + workspace_id - Workspace ID
    # + 'source - Source of member in a workspace
    # + sourceHost - Source host of member in a workspace
    # + uid - Unique identifier of member in a workspace
    # + username - Username of member in a workspace
    # + email - Email of member in a workspace
    # + github - Deprecated, please use source=github and username=<username> instead
    # + return - success
    remote isolated function  find(string workspace_id, string? 'source = (), string? sourceHost = (), string? uid = (), string? username = (), string? email = (), string? github = ()) returns json|error {
        string  path = string `/${workspace_id}/members/find`;
        map<anydata> queryParam = {"source": 'source, "source_host": sourceHost, "uid": uid, "username": username, "email": email, "github": github};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Get a member
    #
    # + workspace_id - Workspace ID
    # + id - Member ID
    # + return - success
    remote isolated function getmembersByid(string workspace_id, string id) returns json|error {
        string  path = string `/${workspace_id}/members/${id}`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Update a member
    #
    # + workspace_id - Workspace ID
    # + id - Member ID
    # + payload - Update member
    # + return - member updated
    remote isolated function putmembersByid(string workspace_id, string id, Member payload) returns http:Response|error {
        string  path = string `/${workspace_id}/members/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Delete a member
    #
    # + workspace_id - Workspace ID
    # + id - Member ID
    # + return - member deleted
    remote isolated function deletemembersByid(string workspace_id, string id) returns http:Response|error {
        string  path = string `/${workspace_id}/members/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List activities for a member
    #
    # + workspace_id - Workspace ID
    # + member_id - Member ID
    # + page - Page of the activities
    # + direction - Sort activities 'ASC' if Ascending and 'DESC' if Descending
    # + items - Number of activities
    # + sort - Sort activities by properties of activity
    # + activityType - Activity type related to activities
    # + 'type - Type related to activities
    # + return - success
    remote isolated function getactivities(string workspace_id, string member_id, string? page = (), string? direction = (), string? items = (), string? sort = (), string? activityType = (), string? 'type = ()) returns json|error {
        string  path = string `/${workspace_id}/members/${member_id}/activities`;
        map<anydata> queryParam = {"page": page, "direction": direction, "items": items, "sort": sort, "activity_type": activityType, "type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Create a Custom or a Content activity for a member
    #
    # + workspace_id - Workspace ID
    # + member_id - Member ID
    # + payload - Create member activity
    # + return - success
    remote isolated function postactivities(string workspace_id, string member_id, Activity payload) returns json|error {
        string  path = string `/${workspace_id}/members/${member_id}/activities`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, targetType=json);
        return response;
    }
    # Update a custom activity for a member
    #
    # + workspace_id - Workspace ID
    # + member_id - Member ID
    # + id - Activity ID
    # + payload - Update member activity
    # + return - activity updated
    remote isolated function putactivitiesByid(string workspace_id, string member_id, string id, Activity payload) returns http:Response|error {
        string  path = string `/${workspace_id}/members/${member_id}/activities/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Delete a post activity
    #
    # + workspace_id - Workspace ID
    # + member_id - Member ID
    # + id - Activity ID
    # + return - activity deleted
    remote isolated function deleteactivitiesByid(string workspace_id, string member_id, string id) returns http:Response|error {
        string  path = string `/${workspace_id}/members/${member_id}/activities/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Add identity to a member
    #
    # + workspace_id - Workspace ID
    # + member_id - Member ID
    # + payload - Add member identity
    # + return - success
    remote isolated function postidentities(string workspace_id, string member_id, Identity payload) returns json|error {
        string  path = string `/${workspace_id}/members/${member_id}/identities`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, targetType=json);
        return response;
    }
    # Remove identity from a member
    #
    # + workspace_id - Workspace ID
    # + member_id - Member ID
    # + payload - Remove member identity
    # + return - success; no content
    remote isolated function deleteidentities(string workspace_id, string member_id, Identity payload) returns http:Response|error {
        string  path = string `/${workspace_id}/members/${member_id}/identities`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->delete(path, request, targetType=http:Response);
        return response;
    }
    # Get the member's notes
    #
    # + workspace_id - Workspace ID
    # + member_id - Member ID
    # + page - Page of the notes
    # + return - success
    remote isolated function getnotes(string workspace_id, string member_id, string? page = ()) returns json|error {
        string  path = string `/${workspace_id}/members/${member_id}/notes`;
        map<anydata> queryParam = {"page": page};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Create a note
    #
    # + workspace_id - Workspace ID
    # + member_id - Member ID
    # + payload - Create note
    # + return - note created
    remote isolated function postnotes(string workspace_id, string member_id, Note payload) returns json|error {
        string  path = string `/${workspace_id}/members/${member_id}/notes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, targetType=json);
        return response;
    }
    # Update a note
    #
    # + workspace_id - Workspace ID
    # + member_id - Member ID
    # + id - Note ID
    # + payload - Update note
    # + return - note updated
    remote isolated function  notesByid(string workspace_id, string member_id, string id, Note payload) returns http:Response|error {
        string  path = string `/${workspace_id}/members/${member_id}/notes/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Get a workspace stats
    #
    # + workspace_id - Workspace ID
    # + startDate - Report start date
    # + endDate - Report end date
    # + 'group - Group in report generation
    # + activityType - Activity type related to activities
    # + 'type - Report type to generate
    # + return - success
    remote isolated function  reports(string workspace_id, string? startDate = (), string? endDate = (), string? 'group = (), string? activityType = (), string? 'type = ()) returns json|error {
        string  path = string `/${workspace_id}/reports`;
        map<anydata> queryParam = {"start_date": startDate, "end_date": endDate, "group": 'group, "activity_type": activityType, "type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
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
