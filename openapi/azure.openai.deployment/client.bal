import ballerina/http;

# APIs for managing deployments of OpenAI models.
@display {label: "Azure OpenAI Deployment", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. Create an [Azure](https://azure.microsoft.com/en-us/features/azure-portal/) account, an [Azure OpenAI resource](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/how-to/create-resource) and refer [this guide](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/reference#authentication) to learn how to generate and use tokens
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, ConnectionConfig config =  {}) returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Gets the list of deployments owned by the Azure OpenAI resource.
    #
    # + apiVersion - The requested API version. 
    # + return - Success 
    @display {label: "Get All Deployments"}
    resource isolated function get deployments(string apiVersion) returns DeploymentList|error {
        string resourcePath = string `/deployments`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DeploymentList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Creates a new deployment for the Azure OpenAI resource according to the given specification.
    #
    # + apiVersion - The requested API version. 
    # + payload - The specification of the deployment including the model to deploy and the scale settings. 
    # + return - The deployment has been successfully created. 
    @display {label: "Create Deployment"}
    resource isolated function post deployments(string apiVersion, Deployment payload) returns Deployment|error {
        string resourcePath = string `/deployments`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Deployment response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Gets details for a single deployment specified by the given deployment-id.
    #
    # + deploymentId - The identifier of the deployment. 
    # + apiVersion - The requested API version. 
    # + return - Success 
    @display {label: "Get Deployment"}
    resource isolated function get deployments/[string deploymentId](string apiVersion) returns Deployment|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Deployment response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Deletes the deployment specified by the given deployment-id.
    #
    # + deploymentId - The identifier of the deployment. 
    # + apiVersion - The requested API version. 
    # + return - The deployment was successfully deleted. 
    @display {label: "Delete Deployment"}
    resource isolated function delete deployments/[string deploymentId](string apiVersion) returns http:Response|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Updates the mutable details of the deployment with the given deployment-id.
    #
    # + deploymentId - The identifier of the deployment. 
    # + apiVersion - The requested API version. 
    # + payload - The updated values for the deployment. 
    # + return - The update process was successfully started. 
    @display {label: "Update Deployment"}
    resource isolated function patch deployments/[string deploymentId](string apiVersion, DeploymentUpdate payload) returns Deployment|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/merge-patch+json");
        Deployment response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
}
