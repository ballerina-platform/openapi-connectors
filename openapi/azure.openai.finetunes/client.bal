import ballerina/http;
import ballerina/mime;

# APIs for fine-tuning and managing deployments of OpenAI models.
@display {label: "Azure OpenAI Finetunes", iconPath: "icon.png"}
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
    # Gets a list of all files owned by the Azure OpenAI resource.
    # These include user uploaded content like files with purpose "fine-tune" for training or validation of fine-tunes models
    # as well as files that are generated by the service such as "fine-tune-results" which contains various metrics for the corresponding fine-tune job.
    #
    # + apiVersion - The requested API version. 
    # + return - Success 
    @display {label: "Get All Files"}
    resource isolated function get files(string apiVersion) returns FileList|error {
        string resourcePath = string `/files`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FileList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Creates a new file entity by uploading data from a local machine. Uploaded files can, for example, be used for training or evaluating fine-tuned models.
    #
    # + apiVersion - The requested API version. 
    # + return - The file has been successfully created. 
    @display {label: "Upload File"}
    resource isolated function post files(string apiVersion, Files_body payload) returns File|error {
        string resourcePath = string `/files`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        File response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Gets details for a single file specified by the given file-id including status, size, purpose, etc.
    #
    # + fileId - The identifier of the file. 
    # + apiVersion - The requested API version. 
    # + return - Success 
    @display {label: "Get File"}
    resource isolated function get files/[string fileId](string apiVersion) returns File|error {
        string resourcePath = string `/files/${getEncodedUri(fileId)}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        File response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Deletes the file with the given file-id.
    # Deletion is also allowed if a file was used, e.g., as training file in a fine-tune job.
    #
    # + fileId - The identifier of the file. 
    # + apiVersion - The requested API version. 
    # + return - The file was successfully deleted. 
    @display {label: "Delete File"}
    resource isolated function delete files/[string fileId](string apiVersion) returns http:Response|error {
        string resourcePath = string `/files/${getEncodedUri(fileId)}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Gets the content of the file specified by the given file-id.
    # Files can be user uploaded content or generated by the service like result metrics of a fine-tune job.
    #
    # + fileId - The identifier of the file. 
    # + apiVersion - The requested API version. 
    # + return - Success 
    @display {label: "Get File Content"}
    resource isolated function get files/[string fileId]/content(string apiVersion) returns byte[]|error {
        string resourcePath = string `/files/${getEncodedUri(fileId)}/content`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        byte[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Creates a new file entity by importing data from a provided url. Uploaded files can, for example, be used for training or evaluating fine-tuned models.
    #
    # + apiVersion - The requested API version. 
    # + payload - The definition of the file to create including its purpose, the file name and the url of the file location. 
    # + return - The file has been successfully created. 
    @display {label: "Import File"}
    resource isolated function post files/'import(string apiVersion, FileImport payload) returns File|error {
        string resourcePath = string `/files/import`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        File response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Gets a list of all fine-tune jobs owned by the Azure OpenAI resource.
    # The details that are returned for each fine-tune job contain besides its identifier
    # the base model, training and validation files, hyper parameters, time stamps, status and events.
    # Events are created when the job status changes, e.g. running or complete, and when results are uploaded.
    #
    # + apiVersion - The requested API version. 
    # + return - Success 
    @display {label: "Get Fine-tunes"}
    resource isolated function get 'fine\-tunes(string apiVersion) returns FineTuneList|error {
        string resourcePath = string `/fine-tunes`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FineTuneList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Creates a job that fine-tunes a specified model from a given training file.
    # Response includes details of the enqueued job including job status and hyper parameters.
    # The name of the fine-tuned model is added to the response once complete.
    #
    # + apiVersion - The requested API version. 
    # + payload - The specification of the fine-tuned model to create. 
    # + return - The fine tune has been successfully created. 
    @display {label: "Create Fine-tune"}
    resource isolated function post 'fine\-tunes(string apiVersion, FineTuneCreation payload) returns FineTune|error {
        string resourcePath = string `/fine-tunes`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        FineTune response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Gets details for a single fine-tune job specified by the given fine-tune-id.
    # The details contain the base model, training and validation files, hyper parameters, time stamps, status and events.
    # Events are created when the job status changes, e.g. running or complete, and when results are uploaded.
    #
    # + fineTuneId - The identifier of the fine-tune job. 
    # + apiVersion - The requested API version. 
    # + return - Success 
    @display {label: "Get Fine-tune"}
    resource isolated function get 'fine\-tunes/[string fineTuneId](string apiVersion) returns FineTune|error {
        string resourcePath = string `/fine-tunes/${getEncodedUri(fineTuneId)}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FineTune response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Deletes the fine-tune job specified by the given fine-tune-id.
    #
    # + fineTuneId - The identifier of the fine-tune job. 
    # + apiVersion - The requested API version. 
    # + return - The fine tune was successfully deleted. 
    @display {label: "Delete Fine-tune"}
    resource isolated function delete 'fine\-tunes/[string fineTuneId](string apiVersion) returns http:Response|error {
        string resourcePath = string `/fine-tunes/${getEncodedUri(fineTuneId)}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Gets the events for the fine-tune job specified by the given fine-tune-id.
    # Events are created when the job status changes, e.g. running or complete, and when results are uploaded.
    #
    # + fineTuneId - The identifier of the fine-tune job. 
    # + 'stream - A flag indicating whether to stream events for the fine-tune job. If set to true, events will be sent as data-only server-sent events as they become available. The stream will terminate with    a data: [DONE] message when the job is finished (succeeded, cancelled, or failed).  If set to false, only events generated so far will be returned.. 
    # + apiVersion - The requested API version. 
    # + return - Success 
    @display {label: "Get Fine-tune Events"}
    resource isolated function get 'fine\-tunes/[string fineTuneId]/events(string apiVersion, boolean? 'stream = ()) returns EventList|error {
        string resourcePath = string `/fine-tunes/${getEncodedUri(fineTuneId)}/events`;
        map<anydata> queryParam = {"stream": 'stream, "api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EventList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Cancels the processing of the fine-tune job specified by the given fine-tune-id.
    #
    # + fineTuneId - The identifier of the fine-tune job. 
    # + apiVersion - The requested API version. 
    # + return - The fine tune has been successfully canceled 
    @display {label: "Cancel Fine-tune"}
    resource isolated function post 'fine\-tunes/[string fineTuneId]/cancel(string apiVersion) returns FineTune|error {
        string resourcePath = string `/fine-tunes/${getEncodedUri(fineTuneId)}/cancel`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        FineTune response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Gets a list of all models that are accessible by the Azure OpenAI resource.
    # These include base models as well as all successfully completed fine-tuned models owned by the Azure OpenAI resource.
    #
    # + apiVersion - The requested API version. 
    # + return - Success 
    @display {label: "Get Models"}
    resource isolated function get models(string apiVersion) returns ModelList|error {
        string resourcePath = string `/models`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ModelList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets details for the model specified by the given modelId.
    #
    # + modelId - The identifier of the model. 
    # + apiVersion - The requested API version. 
    # + return - Success 
    @display {label: "Get Model"}
    resource isolated function get models/[string modelId](string apiVersion) returns Model|error {
        string resourcePath = string `/models/${getEncodedUri(modelId)}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Model response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
