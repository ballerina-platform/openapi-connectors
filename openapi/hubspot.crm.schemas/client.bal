import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;


# Configuration for HubSpot CRM connector
#
# + authConfig - Basic authentication or CredentialsConfig Configuration Tokens
# + secureSocketConfig - Secure Socket Configuration 
public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# The CRM uses schemas to define how custom objects should store and represent information in the HubSpot CRM. Schemas define details about an object's type, properties, and associations. The schema can be uniquely identified by its **object type ID**.
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    # Client initialization.
    #
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Error at failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.hubapi.com") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Get all schemas
    #
    # + archived - Whether to return only results that have been archived.
    # + return - successful operation
    remote isolated function getAll(boolean archived = false) returns CollectionResponseObjectSchemaNoPaging|error {
        string  path = string `/crm/v3/schemas`;
        map<anydata> queryParam = {"archived": archived};
        path = path + check getPathForQueryParam(queryParam);
        CollectionResponseObjectSchemaNoPaging response = check self.clientEp-> get(path, targetType = CollectionResponseObjectSchemaNoPaging);
        return response;
    }
    # Create a new schema
    #
    # + payload - Object schema definition, including properties and associations.
    # + return - successful operation
    remote isolated function create(ObjectSchemaEgg payload) returns ObjectSchema|error {
        string  path = string `/crm/v3/schemas`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ObjectSchema response = check self.clientEp->post(path, request, targetType=ObjectSchema);
        return response;
    }
    # Get an existing schema
    #
    # + objectType - Fully qualified name or object type ID of your schema.
    # + return - successful operation
    remote isolated function getById(string objectType) returns ObjectSchema|error {
        string  path = string `/crm/v3/schemas/${objectType}`;
        ObjectSchema response = check self.clientEp-> get(path, targetType = ObjectSchema);
        return response;
    }
    # Delete a schema
    #
    # + objectType - Fully qualified name or object type ID of your schema.
    # + archived - Whether to return only results that have been archived.
    # + return - No content
    remote isolated function archive(string objectType, boolean archived = false) returns http:Response|error {
        string  path = string `/crm/v3/schemas/${objectType}`;
        map<anydata> queryParam = {"archived": archived};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update a schema
    #
    # + objectType - Fully qualified name or object type ID of your schema.
    # + payload - Attributes to update in your schema.
    # + return - successful operation
    remote isolated function update(string objectType, ObjectTypeDefinitionPatch payload) returns ObjectTypeDefinition|error {
        string  path = string `/crm/v3/schemas/${objectType}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ObjectTypeDefinition response = check self.clientEp->patch(path, request, targetType=ObjectTypeDefinition);
        return response;
    }
    # Create an association
    #
    # + objectType - Fully qualified name or object type ID of your schema.
    # + payload - Attributes that define the association.
    # + return - successful operation
    remote isolated function associationsCreateassociation(string objectType, AssociationDefinitionEgg payload) returns AssociationDefinition|error {
        string  path = string `/crm/v3/schemas/${objectType}/associations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AssociationDefinition response = check self.clientEp->post(path, request, targetType=AssociationDefinition);
        return response;
    }
    # Remove an association
    #
    # + objectType - Fully qualified name or object type ID of your schema.
    # + associationIdentifier - Unique ID of the association to remove.
    # + return - No content
    remote isolated function associationsArchiveassociation(string objectType, string associationIdentifier) returns http:Response|error {
        string  path = string `/crm/v3/schemas/${objectType}/associations/${associationIdentifier}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Purge schemas
    #
    # + objectType - Fully qualified name or object type ID of your schema.
    # + return - No content
    remote isolated function purge(string objectType) returns http:Response|error {
        string  path = string `/crm/v3/schemas/${objectType}/purge`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
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
