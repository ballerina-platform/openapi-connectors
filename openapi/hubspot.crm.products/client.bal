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
    # List
    #
    # + 'limit - The maximum number of results to display per page.
    # + after - The paging cursor token of the last successfully read resource will be returned as the `paging.next.after` JSON property of a paged response containing more results.
    # + properties - A comma separated list of the properties to be returned in the response. If any of the specified properties are not present on the requested object(s), they will be ignored.
    # + associations - A comma separated list of object types to retrieve associated IDs for. If any of the specified associations do not exist, they will be ignored.
    # + archived - Whether to return only results that have been archived.
    # + return - successful operation
    remote isolated function getPage(int 'limit = 10, string? after = (), string[]? properties = (), string[]? associations = (), boolean archived = false) returns CollectionResponseSimplePublicObjectWithAssociationsForwardPaging|error {
        string  path = string `/crm/v3/objects/products`;
        map<anydata> queryParam = {"limit": 'limit, "after": after, "properties": properties, "associations": associations, "archived": archived};
        path = path + check getPathForQueryParam(queryParam);
        CollectionResponseSimplePublicObjectWithAssociationsForwardPaging response = check self.clientEp-> get(path, targetType = CollectionResponseSimplePublicObjectWithAssociationsForwardPaging);
        return response;
    }
    # Create
    #
    # + payload - Properties
    # + return - successful operation
    remote isolated function create(SimplePublicObjectInput payload) returns SimplePublicObject|error {
        string  path = string `/crm/v3/objects/products`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SimplePublicObject response = check self.clientEp->post(path, request, targetType=SimplePublicObject);
        return response;
    }
    # Archive a batch of products by ID
    #
    # + payload - Array of object IDs
    # + return - No content
    remote isolated function batchArchiveArchive(BatchInputSimplePublicObjectId payload) returns http:Response|error {
        string  path = string `/crm/v3/objects/products/batch/archive`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Create a batch of products
    #
    # + payload - Array of property records
    # + return - successful operation
    remote isolated function batchCreateCreate(BatchInputSimplePublicObjectInput payload) returns BatchResponseSimplePublicObject|error {
        string  path = string `/crm/v3/objects/products/batch/create`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchResponseSimplePublicObject response = check self.clientEp->post(path, request, targetType=BatchResponseSimplePublicObject);
        return response;
    }
    # Read a batch of products by internal ID, or unique property values
    #
    # + payload - Batch read options
    # + archived - Whether to return only results that have been archived.
    # + return - successful operation
    remote isolated function batchReadRead(BatchReadInputSimplePublicObjectId payload, boolean archived = false) returns BatchResponseSimplePublicObject|error {
        string  path = string `/crm/v3/objects/products/batch/read`;
        map<anydata> queryParam = {"archived": archived};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchResponseSimplePublicObject response = check self.clientEp->post(path, request, targetType=BatchResponseSimplePublicObject);
        return response;
    }
    # Update a batch of products
    #
    # + payload - Array of object properties
    # + return - successful operation
    remote isolated function batchUpdateUpdate(BatchInputSimplePublicObjectBatchInput payload) returns BatchResponseSimplePublicObject|error {
        string  path = string `/crm/v3/objects/products/batch/update`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchResponseSimplePublicObject response = check self.clientEp->post(path, request, targetType=BatchResponseSimplePublicObject);
        return response;
    }
    # Filter, Sort, and Search CRM Objects
    #
    # + payload - Search request
    # + return - successful operation
    remote isolated function doSearch(PublicObjectSearchRequest payload) returns CollectionResponseWithTotalSimplePublicObjectForwardPaging|error {
        string  path = string `/crm/v3/objects/products/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CollectionResponseWithTotalSimplePublicObjectForwardPaging response = check self.clientEp->post(path, request, targetType=CollectionResponseWithTotalSimplePublicObjectForwardPaging);
        return response;
    }
    # Read
    #
    # + productId - Product ID
    # + properties - A comma separated list of the properties to be returned in the response. If any of the specified properties are not present on the requested object(s), they will be ignored.
    # + associations - A comma separated list of object types to retrieve associated IDs for. If any of the specified associations do not exist, they will be ignored.
    # + archived - Whether to return only results that have been archived.
    # + idProperty - The name of a property whose values are unique for this object type
    # + return - successful operation
    remote isolated function getById(string productId, string[]? properties = (), string[]? associations = (), boolean archived = false, string? idProperty = ()) returns SimplePublicObjectWithAssociations|error {
        string  path = string `/crm/v3/objects/products/${productId}`;
        map<anydata> queryParam = {"properties": properties, "associations": associations, "archived": archived, "idProperty": idProperty};
        path = path + check getPathForQueryParam(queryParam);
        SimplePublicObjectWithAssociations response = check self.clientEp-> get(path, targetType = SimplePublicObjectWithAssociations);
        return response;
    }
    # Archive
    #
    # + productId - Product ID
    # + return - No content
    remote isolated function archive(string productId) returns http:Response|error {
        string  path = string `/crm/v3/objects/products/${productId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update
    #
    # + productId - Product ID
    # + payload - Properties
    # + idProperty - The name of a property whose values are unique for this object type
    # + return - successful operation
    remote isolated function update(string productId, SimplePublicObjectInput payload, string? idProperty = ()) returns SimplePublicObject|error {
        string  path = string `/crm/v3/objects/products/${productId}`;
        map<anydata> queryParam = {"idProperty": idProperty};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SimplePublicObject response = check self.clientEp->patch(path, request, targetType=SimplePublicObject);
        return response;
    }
    # List associations of a product by type
    #
    # + productId - Product ID
    # + toObjectType - Object type to associate with
    # + after - The paging cursor token of the last successfully read resource will be returned as the `paging.next.after` JSON property of a paged response containing more results.
    # + 'limit - The maximum number of results to display per page.
    # + return - successful operation
    remote isolated function associationsGetAll(string productId, string toObjectType, string? after = (), int 'limit = 500) returns CollectionResponseAssociatedIdForwardPaging|error {
        string  path = string `/crm/v3/objects/products/${productId}/associations/${toObjectType}`;
        map<anydata> queryParam = {"after": after, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        CollectionResponseAssociatedIdForwardPaging response = check self.clientEp-> get(path, targetType = CollectionResponseAssociatedIdForwardPaging);
        return response;
    }
    # Associate a product with another object
    #
    # + productId - Product ID
    # + toObjectType - Object type to associate with
    # + toObjectId - Object ID to associate
    # + associationType - Type of the association
    # + return - successful operation
    remote isolated function associationsCreate(string productId, string toObjectType, string toObjectId, string associationType) returns SimplePublicObjectWithAssociations|error {
        string  path = string `/crm/v3/objects/products/${productId}/associations/${toObjectType}/${toObjectId}/${associationType}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        SimplePublicObjectWithAssociations response = check self.clientEp-> put(path, request, targetType = SimplePublicObjectWithAssociations);
        return response;
    }
    # Remove an association between two products
    #
    # + productId - Product ID
    # + toObjectType - Object type to associate with
    # + toObjectId - Object ID to associate
    # + associationType - Type of the association
    # + return - No content
    remote isolated function associationsArchive(string productId, string toObjectType, string toObjectId, string associationType) returns http:Response|error {
        string  path = string `/crm/v3/objects/products/${productId}/associations/${toObjectType}/${toObjectId}/${associationType}`;
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
