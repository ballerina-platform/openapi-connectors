import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

# Configuration record for Xero
#
# + authConfig - Basic authentication or CredentialsConfig Configuration Tokens
# + secureSocketConfig - Secure Socket Configuration 
public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# The Assets API exposes fixed asset related functions of the Xero Accounting application and can be used for a variety of purposes such as creating assets, retrieving asset valuations etc.
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    # Client initialization.
    #
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Returns error at failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.xero.com/assets.xro/1.0") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # searches fixed asset types
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + return - search results matching criteria
    remote isolated function getAssetTypes(string xeroTenantId) returns AssetType[]|error {
        string  path = string `/AssetTypes`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AssetType[] response = check self.clientEp-> get(path, accHeaders, targetType = AssetTypeArr);
        return response;
    }
    # adds a fixed asset type
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - Asset type to add
    # + return - results single object -  created fixed type
    remote isolated function createAssetType(string xeroTenantId, AssetType payload) returns AssetType|error {
        string  path = string `/AssetTypes`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AssetType response = check self.clientEp->post(path, request, headers = accHeaders, targetType=AssetType);
        return response;
    }
    # searches fixed asset
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + status - Required when retrieving a collection of assets. See Asset Status Codes
    # + page - Results are paged. This specifies which page of the results to return. The default page is 1.
    # + pageSize - The number of records returned per page. By default the number of records returned is 10.
    # + orderBy - Requests can be ordered by AssetType, AssetName, AssetNumber, PurchaseDate and PurchasePrice. If the asset status is DISPOSED it also allows DisposalDate and DisposalPrice.
    # + sortDirection - ASC or DESC
    # + filterBy - A string that can be used to filter the list to only return assets containing the text. Checks it against the AssetName, AssetNumber, Description and AssetTypeName fields.
    # + return - search results matching criteria
    remote isolated function getAssets(string xeroTenantId, AssetStatusQueryParam status, int? page = (), int? pageSize = (), string? orderBy = (), string? sortDirection = (), string? filterBy = ()) returns Assets|error {
        string  path = string `/Assets`;
        map<anydata> queryParam = {"status": status, "page": page, "pageSize": pageSize, "orderBy": orderBy, "sortDirection": sortDirection, "filterBy": filterBy};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Assets response = check self.clientEp-> get(path, accHeaders, targetType = Assets);
        return response;
    }
    # adds a fixed asset
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + payload - Fixed asset you are creating
    # + return - return single object - create new asset
    remote isolated function createAsset(string xeroTenantId, Asset payload) returns Asset|error {
        string  path = string `/Assets`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Asset response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Asset);
        return response;
    }
    # Retrieves fixed asset by id
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + id - fixed asset id for single object
    # + return - search results matching criteria
    remote isolated function getAssetById(string xeroTenantId, string id) returns Asset|error {
        string  path = string `/Assets/${id}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Asset response = check self.clientEp-> get(path, accHeaders, targetType = Asset);
        return response;
    }
    # searches fixed asset settings
    #
    # + xeroTenantId - Xero identifier for Tenant
    # + return - search results matching criteria
    remote isolated function getAssetSettings(string xeroTenantId) returns Setting|error {
        string  path = string `/Settings`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Setting response = check self.clientEp-> get(path, accHeaders, targetType = Setting);
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

# Generate header map for given header values.
#
# + headerParam - Headers  map
# + return - Returns generated map or error at failure of client initialization
isolated function  getMapForHeaders(map<any>   headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
