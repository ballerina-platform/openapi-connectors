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
import ballerina/url;
import ballerina/lang.'string;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
    # The HTTP version understood by the client
    string httpVersion = "1.1";
    # Configurations related to HTTP/1.x protocol
    http:ClientHttp1Settings http1Settings = {};
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings = {};
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with Redirection
    http:FollowRedirects? followRedirects = ();
    # Configurations associated with request pooling
    http:PoolConfiguration? poolConfig = ();
    # HTTP caching related configurations
    http:CacheConfig cache = {};
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig? circuitBreaker = ();
    # Configurations associated with retrying
    http:RetryConfig? retryConfig = ();
    # Configurations associated with cookies
    http:CookieConfig? cookieConfig = ();
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits = {};
    # SSL/TLS-related options
    http:ClientSecureSocket? secureSocket = ();
|};

# This is a generated connector from [Azure IoT Central API v1.0](https://azure.microsoft.com/en-us/services/iot-central/) OpenAPI specification.
# Azure IoT Central is a service that makes it easy to connect, monitor, and manage your IoT devices at scale.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Azure  IoT Central account](https://azure.microsoft.com/en-us/services/iot-central/) and obtain OAuth tokens following [this guide](https://docs.microsoft.com/en-us/rest/api/iotcentral/authentication#aad-bearer-token).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "/api") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Get the list of API tokens in an application. The token value will never be returned for security reasons.
    #
    # + apiVersion - The version of the API being called. 
    # + return - Success 
    remote isolated function apitokensList(string apiVersion) returns ApiTokenCollection|error {
        string  path = string `/apiTokens`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        ApiTokenCollection response = check self.clientEp-> get(path, targetType = ApiTokenCollection);
        return response;
    }
    # Get an API token by ID.
    #
    # + apiVersion - The version of the API being called. 
    # + tokenId - Unique ID for the API token. 
    # + return - Success 
    remote isolated function apitokensGet(string apiVersion, string tokenId) returns ApiToken|error {
        string  path = string `/apiTokens/${tokenId}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        ApiToken response = check self.clientEp-> get(path, targetType = ApiToken);
        return response;
    }
    # Create a new API token in the application to use in the IoT Central public API. The token value will be returned in the response, and won't be returned again in subsequent requests.
    #
    # + apiVersion - The version of the API being called. 
    # + tokenId - Unique ID for the API token. 
    # + payload - API token body. 
    # + return - Success 
    remote isolated function apitokensCreate(string apiVersion, string tokenId, ApiToken payload) returns ApiToken|error {
        string  path = string `/apiTokens/${tokenId}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ApiToken response = check self.clientEp->put(path, request, targetType=ApiToken);
        return response;
    }
    # Delete an API token.
    #
    # + apiVersion - The version of the API being called. 
    # + tokenId - Unique ID for the API token. 
    # + return - Success 
    remote isolated function apitokensRemove(string apiVersion, string tokenId) returns http:Response|error {
        string  path = string `/apiTokens/${tokenId}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get the list of device templates in an application
    #
    # + apiVersion - The version of the API being called. 
    # + return - Success 
    remote isolated function devicetemplatesList(string apiVersion) returns DeviceTemplateCollection|error {
        string  path = string `/deviceTemplates`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeviceTemplateCollection response = check self.clientEp-> get(path, targetType = DeviceTemplateCollection);
        return response;
    }
    # Get a device template by ID
    #
    # + apiVersion - The version of the API being called. 
    # + deviceTemplateId - Digital Twin Model Identifier of the device template, [More Details](https://github.com/Azure/opendigitaltwins-dtdl/blob/master/DTDL/v2/dtdlv2.md#digital-twin-model-identifier) 
    # + return - Success 
    remote isolated function devicetemplatesGet(string apiVersion, string deviceTemplateId) returns DeviceTemplate|error {
        string  path = string `/deviceTemplates/${deviceTemplateId}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeviceTemplate response = check self.clientEp-> get(path, targetType = DeviceTemplate);
        return response;
    }
    # Publish a new device template. Default views will be automatically generated for new device templates created this way.
    #
    # + apiVersion - The version of the API being called. 
    # + deviceTemplateId - Digital Twin Model Identifier of the device template, [More Details](https://github.com/Azure/opendigitaltwins-dtdl/blob/master/DTDL/v2/dtdlv2.md#digital-twin-model-identifier) 
    # + payload - Device template body. 
    # + return - Success 
    remote isolated function devicetemplatesCreate(string apiVersion, string deviceTemplateId, DeviceTemplate payload) returns DeviceTemplate|error {
        string  path = string `/deviceTemplates/${deviceTemplateId}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeviceTemplate response = check self.clientEp->put(path, request, targetType=DeviceTemplate);
        return response;
    }
    # Delete a device template
    #
    # + apiVersion - The version of the API being called. 
    # + deviceTemplateId - Digital Twin Model Identifier of the device template, [More Details](https://github.com/Azure/opendigitaltwins-dtdl/blob/master/DTDL/v2/dtdlv2.md#digital-twin-model-identifier) 
    # + return - Success 
    remote isolated function devicetemplatesRemove(string apiVersion, string deviceTemplateId) returns http:Response|error {
        string  path = string `/deviceTemplates/${deviceTemplateId}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update the cloud properties and overrides of an existing device template via patch.
    #
    # + apiVersion - The version of the API being called. 
    # + deviceTemplateId - Digital Twin Model Identifier of the device template, [More Details](https://github.com/Azure/opendigitaltwins-dtdl/blob/master/DTDL/v2/dtdlv2.md#digital-twin-model-identifier) 
    # + payload - Device template patch body. 
    # + return - Success 
    remote isolated function devicetemplatesUpdate(string apiVersion, string deviceTemplateId, Payload payload) returns DeviceTemplate|error {
        string  path = string `/deviceTemplates/${deviceTemplateId}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeviceTemplate response = check self.clientEp->patch(path, request, targetType=DeviceTemplate);
        return response;
    }
    # Get the list of devices in an application
    #
    # + apiVersion - The version of the API being called. 
    # + return - Success 
    remote isolated function devicesList(string apiVersion) returns DeviceCollection|error {
        string  path = string `/devices`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeviceCollection response = check self.clientEp-> get(path, targetType = DeviceCollection);
        return response;
    }
    # Get a device by ID
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + return - Success 
    remote isolated function devicesGet(string apiVersion, string deviceId) returns Device|error {
        string  path = string `/devices/${deviceId}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        Device response = check self.clientEp-> get(path, targetType = Device);
        return response;
    }
    # Create or update a device
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + payload - Device body. 
    # + return - Success 
    remote isolated function devicesCreate(string apiVersion, string deviceId, Device payload) returns Device|error {
        string  path = string `/devices/${deviceId}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Device response = check self.clientEp->put(path, request, targetType=Device);
        return response;
    }
    # Delete a device
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + return - Success 
    remote isolated function devicesRemove(string apiVersion, string deviceId) returns http:Response|error {
        string  path = string `/devices/${deviceId}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update a device via patch
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + payload - Device patch body. 
    # + return - Success 
    remote isolated function devicesUpdate(string apiVersion, string deviceId, Payload payload) returns Device|error {
        string  path = string `/devices/${deviceId}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Device response = check self.clientEp->patch(path, request, targetType=Device);
        return response;
    }
    # Get device attestation
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + return - Success 
    remote isolated function devicesGetattestation(string apiVersion, string deviceId) returns Attestation|error {
        string  path = string `/devices/${deviceId}/attestation`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        Attestation response = check self.clientEp-> get(path, targetType = Attestation);
        return response;
    }
    # Create an individual device attestation
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + payload - Individual device attestation body. 
    # + return - Success 
    remote isolated function devicesCreateattestation(string apiVersion, string deviceId, Attestation payload) returns Attestation|error {
        string  path = string `/devices/${deviceId}/attestation`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Attestation response = check self.clientEp->put(path, request, targetType=Attestation);
        return response;
    }
    # Remove an individual device attestation
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + return - Success 
    remote isolated function devicesRemoveattestation(string apiVersion, string deviceId) returns http:Response|error {
        string  path = string `/devices/${deviceId}/attestation`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update an individual device attestation via patch
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + payload - Individual device attestation patch body. 
    # + return - Success 
    remote isolated function devicesUpdateattestation(string apiVersion, string deviceId, Payload payload) returns Attestation|error {
        string  path = string `/devices/${deviceId}/attestation`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Attestation response = check self.clientEp->patch(path, request, targetType=Attestation);
        return response;
    }
    # Get device command history
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + commandName - Name of this device command. 
    # + return - Success 
    remote isolated function devicesGetcommandhistory(string apiVersion, string deviceId, string commandName) returns DeviceCommandCollection|error {
        string  path = string `/devices/${deviceId}/commands/${commandName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeviceCommandCollection response = check self.clientEp-> get(path, targetType = DeviceCommandCollection);
        return response;
    }
    # Run a device command
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + commandName - Name of this device command. 
    # + payload - Device command body. 
    # + return - Success 
    remote isolated function devicesRuncommand(string apiVersion, string deviceId, string commandName, DeviceCommand payload) returns DeviceCommand|error {
        string  path = string `/devices/${deviceId}/commands/${commandName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeviceCommand response = check self.clientEp->post(path, request, targetType=DeviceCommand);
        return response;
    }
    # List the components present in a device
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + return - Success 
    remote isolated function devicesListcomponents(string apiVersion, string deviceId) returns Collection|error {
        string  path = string `/devices/${deviceId}/components`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        Collection response = check self.clientEp-> get(path, targetType = Collection);
        return response;
    }
    # Get component command history
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + componentName - Name of the device component. 
    # + commandName - Name of this device command. 
    # + return - Success 
    remote isolated function devicesGetcomponentcommandhistory(string apiVersion, string deviceId, string componentName, string commandName) returns DeviceCommandCollection|error {
        string  path = string `/devices/${deviceId}/components/${componentName}/commands/${commandName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeviceCommandCollection response = check self.clientEp-> get(path, targetType = DeviceCommandCollection);
        return response;
    }
    # Run a component command
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + componentName - Name of the device component. 
    # + commandName - Name of this device command. 
    # + payload - Device command body. 
    # + return - Success 
    remote isolated function devicesRuncomponentcommand(string apiVersion, string deviceId, string componentName, string commandName, DeviceCommand payload) returns DeviceCommand|error {
        string  path = string `/devices/${deviceId}/components/${componentName}/commands/${commandName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeviceCommand response = check self.clientEp->post(path, request, targetType=DeviceCommand);
        return response;
    }
    # Get device properties for a specific component
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + componentName - Name of the device component. 
    # + return - Success 
    remote isolated function devicesGetcomponentproperties(string apiVersion, string deviceId, string componentName) returns DeviceProperties|error {
        string  path = string `/devices/${deviceId}/components/${componentName}/properties`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeviceProperties response = check self.clientEp-> get(path, targetType = DeviceProperties);
        return response;
    }
    # Replace device properties for a specific component
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + componentName - Name of the device component. 
    # + payload - Device properties. 
    # + return - Success 
    remote isolated function devicesReplacecomponentproperties(string apiVersion, string deviceId, string componentName, DeviceProperties payload) returns DeviceProperties|error {
        string  path = string `/devices/${deviceId}/components/${componentName}/properties`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeviceProperties response = check self.clientEp->put(path, request, targetType=DeviceProperties);
        return response;
    }
    # Update device properties for a specific component via patch
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + componentName - Name of the device component. 
    # + payload - Device properties patch. 
    # + return - Success 
    remote isolated function devicesUpdatecomponentproperties(string apiVersion, string deviceId, string componentName, Payload payload) returns DeviceProperties|error {
        string  path = string `/devices/${deviceId}/components/${componentName}/properties`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeviceProperties response = check self.clientEp->patch(path, request, targetType=DeviceProperties);
        return response;
    }
    # Get component telemetry value
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + componentName - Name of the device component. 
    # + telemetryName - Name of this device telemetry. 
    # + return - Success 
    remote isolated function devicesGetcomponenttelemetryvalue(string apiVersion, string deviceId, string componentName, string telemetryName) returns DeviceTelemetry|error {
        string  path = string `/devices/${deviceId}/components/${componentName}/telemetry/${telemetryName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeviceTelemetry response = check self.clientEp-> get(path, targetType = DeviceTelemetry);
        return response;
    }
    # Get device credentials
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + return - Success 
    remote isolated function devicesGetcredentials(string apiVersion, string deviceId) returns DeviceCredentials|error {
        string  path = string `/devices/${deviceId}/credentials`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeviceCredentials response = check self.clientEp-> get(path, targetType = DeviceCredentials);
        return response;
    }
    # List the modules present in a device
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + return - Success 
    remote isolated function devicesListmodules(string apiVersion, string deviceId) returns Collection|error {
        string  path = string `/devices/${deviceId}/modules`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        Collection response = check self.clientEp-> get(path, targetType = Collection);
        return response;
    }
    # Get module command history
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + moduleName - Name of the device module. 
    # + commandName - Name of this device command. 
    # + return - Success 
    remote isolated function devicesGetmodulecommandhistory(string apiVersion, string deviceId, string moduleName, string commandName) returns DeviceCommandCollection|error {
        string  path = string `/devices/${deviceId}/modules/${moduleName}/commands/${commandName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeviceCommandCollection response = check self.clientEp-> get(path, targetType = DeviceCommandCollection);
        return response;
    }
    # Run a module command
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + moduleName - Name of the device module. 
    # + commandName - Name of this device command. 
    # + payload - Device command body. 
    # + return - Success 
    remote isolated function devicesRunmodulecommand(string apiVersion, string deviceId, string moduleName, string commandName, DeviceCommand payload) returns DeviceCommand|error {
        string  path = string `/devices/${deviceId}/modules/${moduleName}/commands/${commandName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeviceCommand response = check self.clientEp->post(path, request, targetType=DeviceCommand);
        return response;
    }
    # List the components present in a module
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + moduleName - Name of the device module. 
    # + return - Success 
    remote isolated function devicesListmodulecomponents(string apiVersion, string deviceId, string moduleName) returns Collection|error {
        string  path = string `/devices/${deviceId}/modules/${moduleName}/components`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        Collection response = check self.clientEp-> get(path, targetType = Collection);
        return response;
    }
    # Get module component command history
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + moduleName - Name of the device module. 
    # + componentName - Name of the device component. 
    # + commandName - Name of this device command. 
    # + return - Success 
    remote isolated function devicesGetmodulecomponentcommandhistory(string apiVersion, string deviceId, string moduleName, string componentName, string commandName) returns DeviceCommandCollection|error {
        string  path = string `/devices/${deviceId}/modules/${moduleName}/components/${componentName}/commands/${commandName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeviceCommandCollection response = check self.clientEp-> get(path, targetType = DeviceCommandCollection);
        return response;
    }
    # Run a module component command
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + moduleName - Name of the device module. 
    # + componentName - Name of the device component. 
    # + commandName - Name of this device command. 
    # + payload - Device command body. 
    # + return - Success 
    remote isolated function devicesRunmodulecomponentcommand(string apiVersion, string deviceId, string moduleName, string componentName, string commandName, DeviceCommand payload) returns DeviceCommand|error {
        string  path = string `/devices/${deviceId}/modules/${moduleName}/components/${componentName}/commands/${commandName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeviceCommand response = check self.clientEp->post(path, request, targetType=DeviceCommand);
        return response;
    }
    # Get module properties for a specific component
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + moduleName - Name of the device module. 
    # + componentName - Name of the device component. 
    # + return - Success 
    remote isolated function devicesGetmodulecomponentproperties(string apiVersion, string deviceId, string moduleName, string componentName) returns DeviceProperties|error {
        string  path = string `/devices/${deviceId}/modules/${moduleName}/components/${componentName}/properties`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeviceProperties response = check self.clientEp-> get(path, targetType = DeviceProperties);
        return response;
    }
    # Replace module properties for a specific component
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + moduleName - Name of the device module. 
    # + componentName - Name of the device component. 
    # + payload - Module properties. 
    # + return - Success 
    remote isolated function devicesReplacemodulecomponentproperties(string apiVersion, string deviceId, string moduleName, string componentName, DeviceProperties payload) returns DeviceProperties|error {
        string  path = string `/devices/${deviceId}/modules/${moduleName}/components/${componentName}/properties`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeviceProperties response = check self.clientEp->put(path, request, targetType=DeviceProperties);
        return response;
    }
    # Update module properties for a specific component via patch
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + moduleName - Name of the device module. 
    # + componentName - Name of the device component. 
    # + payload - Module properties patch. 
    # + return - Success 
    remote isolated function devicesUpdatemodulecomponentproperties(string apiVersion, string deviceId, string moduleName, string componentName, Payload payload) returns DeviceProperties|error {
        string  path = string `/devices/${deviceId}/modules/${moduleName}/components/${componentName}/properties`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeviceProperties response = check self.clientEp->patch(path, request, targetType=DeviceProperties);
        return response;
    }
    # Get module component telemetry value
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + moduleName - Name of the device module. 
    # + componentName - Name of the device component. 
    # + telemetryName - Name of this device telemetry. 
    # + return - Success 
    remote isolated function devicesGetmodulecomponenttelemetryvalue(string apiVersion, string deviceId, string moduleName, string componentName, string telemetryName) returns DeviceTelemetry|error {
        string  path = string `/devices/${deviceId}/modules/${moduleName}/components/${componentName}/telemetry/${telemetryName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeviceTelemetry response = check self.clientEp-> get(path, targetType = DeviceTelemetry);
        return response;
    }
    # Get module properties
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + moduleName - Name of the device module. 
    # + return - Success 
    remote isolated function devicesGetmoduleproperties(string apiVersion, string deviceId, string moduleName) returns DeviceProperties|error {
        string  path = string `/devices/${deviceId}/modules/${moduleName}/properties`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeviceProperties response = check self.clientEp-> get(path, targetType = DeviceProperties);
        return response;
    }
    # Replace module properties
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + moduleName - Name of the device module. 
    # + payload - Module properties. 
    # + return - Success 
    remote isolated function devicesReplacemoduleproperties(string apiVersion, string deviceId, string moduleName, DeviceProperties payload) returns DeviceProperties|error {
        string  path = string `/devices/${deviceId}/modules/${moduleName}/properties`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeviceProperties response = check self.clientEp->put(path, request, targetType=DeviceProperties);
        return response;
    }
    # Update module properties via patch
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + moduleName - Name of the device module. 
    # + payload - Module properties patch. 
    # + return - Success 
    remote isolated function devicesUpdatemoduleproperties(string apiVersion, string deviceId, string moduleName, Payload payload) returns DeviceProperties|error {
        string  path = string `/devices/${deviceId}/modules/${moduleName}/properties`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeviceProperties response = check self.clientEp->patch(path, request, targetType=DeviceProperties);
        return response;
    }
    # Get module telemetry value
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + moduleName - Name of the device module. 
    # + telemetryName - Name of this device telemetry. 
    # + return - Success 
    remote isolated function devicesGetmoduletelemetryvalue(string apiVersion, string deviceId, string moduleName, string telemetryName) returns DeviceTelemetry|error {
        string  path = string `/devices/${deviceId}/modules/${moduleName}/telemetry/${telemetryName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeviceTelemetry response = check self.clientEp-> get(path, targetType = DeviceTelemetry);
        return response;
    }
    # Get device properties
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + return - Success 
    remote isolated function devicesGetproperties(string apiVersion, string deviceId) returns DeviceProperties|error {
        string  path = string `/devices/${deviceId}/properties`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeviceProperties response = check self.clientEp-> get(path, targetType = DeviceProperties);
        return response;
    }
    # Replace device properties
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + payload - Device properties. 
    # + return - Success 
    remote isolated function devicesReplaceproperties(string apiVersion, string deviceId, DeviceProperties payload) returns DeviceProperties|error {
        string  path = string `/devices/${deviceId}/properties`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeviceProperties response = check self.clientEp->put(path, request, targetType=DeviceProperties);
        return response;
    }
    # Update device properties via patch
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + payload - Device properties patch. 
    # + return - Success 
    remote isolated function devicesUpdateproperties(string apiVersion, string deviceId, Payload payload) returns DeviceProperties|error {
        string  path = string `/devices/${deviceId}/properties`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeviceProperties response = check self.clientEp->patch(path, request, targetType=DeviceProperties);
        return response;
    }
    # Get device telemetry value
    #
    # + apiVersion - The version of the API being called. 
    # + deviceId - Unique ID of the device. 
    # + telemetryName - Name of this device telemetry. 
    # + return - Success 
    remote isolated function devicesGettelemetryvalue(string apiVersion, string deviceId, string telemetryName) returns DeviceTelemetry|error {
        string  path = string `/devices/${deviceId}/telemetry/${telemetryName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        DeviceTelemetry response = check self.clientEp-> get(path, targetType = DeviceTelemetry);
        return response;
    }
    # Get the list of roles in an application.
    #
    # + apiVersion - The version of the API being called. 
    # + return - Success 
    remote isolated function rolesList(string apiVersion) returns RoleCollection|error {
        string  path = string `/roles`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        RoleCollection response = check self.clientEp-> get(path, targetType = RoleCollection);
        return response;
    }
    # Get a role by ID.
    #
    # + apiVersion - The version of the API being called. 
    # + roleId - Unique ID for the role. 
    # + return - Success 
    remote isolated function rolesGet(string apiVersion, string roleId) returns Role|error {
        string  path = string `/roles/${roleId}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        Role response = check self.clientEp-> get(path, targetType = Role);
        return response;
    }
    # Get the list of users in an application
    #
    # + apiVersion - The version of the API being called. 
    # + return - Success 
    remote isolated function usersList(string apiVersion) returns UserCollection|error {
        string  path = string `/users`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        UserCollection response = check self.clientEp-> get(path, targetType = UserCollection);
        return response;
    }
    # Get a user by ID
    #
    # + apiVersion - The version of the API being called. 
    # + userId - Unique ID of the user. 
    # + return - Success 
    remote isolated function usersGet(string apiVersion, string userId) returns User|error {
        string  path = string `/users/${userId}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        User response = check self.clientEp-> get(path, targetType = User);
        return response;
    }
    # Create a user in the application
    #
    # + apiVersion - The version of the API being called. 
    # + userId - Unique ID of the user. 
    # + payload - User body. 
    # + return - Success 
    remote isolated function usersCreate(string apiVersion, string userId, User payload) returns User|error {
        string  path = string `/users/${userId}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        User response = check self.clientEp->put(path, request, targetType=User);
        return response;
    }
    # Delete a user
    #
    # + apiVersion - The version of the API being called. 
    # + userId - Unique ID of the user. 
    # + return - Success 
    remote isolated function usersRemove(string apiVersion, string userId) returns http:Response|error {
        string  path = string `/users/${userId}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update a user in the application via patch
    #
    # + apiVersion - The version of the API being called. 
    # + userId - Unique ID of the user. 
    # + payload - User patch body. 
    # + return - Success 
    remote isolated function usersUpdate(string apiVersion, string userId, Payload payload) returns User|error {
        string  path = string `/users/${userId}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        User response = check self.clientEp->patch(path, request, targetType=User);
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
