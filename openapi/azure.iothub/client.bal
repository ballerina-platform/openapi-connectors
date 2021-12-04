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

# This is a generated connector from [Azure IoT Hub API v1.0](https://docs.microsoft.com/en-us/rest/api/iothub/) OpenAPI specification.
# Azure IoT Hub is a service that offers programmatic access to the device, messaging, and job services, as well as the resource provider, in IoT Hub. You can access messaging services from within an IoT service running in Azure, or directly over the Internet from any application that can send an HTTPS request and receive an HTTPS response.
# Use this API to manage the IoT hubs in your Azure subscription.
@display {label: "Azure IoT Hub", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Azure  IoT Hub account](https://azure.microsoft.com/en-us/services/iot-hub/) and obtain OAuth tokens following [this guide](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-security).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://management.azure.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Lists all of the available IoT Hub REST API operations.
    #
    # + apiVersion - The version of the API. 
    # + return - OK. The request has succeeded. 
    remote isolated function operationsList(string apiVersion) returns OperationListResult|error {
        string  path = string `/providers/Microsoft.Devices/operations`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        OperationListResult response = check self.clientEp-> get(path, targetType = OperationListResult);
        return response;
    }
    # Get all the IoT hubs in a subscription
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + return - This is a synchronous operation. The body contains a JSON-serialized array of the metadata from all the IoT hubs in the subscription. 
    remote isolated function iothubresourceListbysubscription(string apiVersion, string subscriptionId) returns IotHubDescriptionListResult|error {
        string  path = string `/subscriptions/${subscriptionId}/providers/Microsoft.Devices/IotHubs`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        IotHubDescriptionListResult response = check self.clientEp-> get(path, targetType = IotHubDescriptionListResult);
        return response;
    }
    # Check if an IoT hub name is available
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + payload - Set the name parameter in the OperationInputs structure to the name of the IoT hub to check. 
    # + return - This is a synchronous operation. The body contains a JSON-serialized response that specifies whether the IoT hub name is available. If the name is not available, the body contains the reason. 
    remote isolated function iothubresourceChecknameavailability(string apiVersion, string subscriptionId, OperationInputs payload) returns IotHubNameAvailabilityInfo|error {
        string  path = string `/subscriptions/${subscriptionId}/providers/Microsoft.Devices/checkNameAvailability`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IotHubNameAvailabilityInfo response = check self.clientEp->post(path, request, targetType=IotHubNameAvailabilityInfo);
        return response;
    }
    # Get the number of iot hubs in the subscription
    #
    # + subscriptionId - The subscription identifier. 
    # + apiVersion - The version of the API. 
    # + return - OK 
    remote isolated function resourceprovidercommonGetsubscriptionquota(string subscriptionId, string apiVersion) returns UserSubscriptionQuotaListResult|error {
        string  path = string `/subscriptions/${subscriptionId}/providers/Microsoft.Devices/usages`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        UserSubscriptionQuotaListResult response = check self.clientEp-> get(path, targetType = UserSubscriptionQuotaListResult);
        return response;
    }
    # Get all the IoT hubs in a resource group
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + return - This is a synchronous operation. The body contains a JSON-serialized array of the metadata from all the IoT hubs in the resource group. 
    remote isolated function iothubresourceListbyresourcegroup(string apiVersion, string subscriptionId, string resourceGroupName) returns IotHubDescriptionListResult|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        IotHubDescriptionListResult response = check self.clientEp-> get(path, targetType = IotHubDescriptionListResult);
        return response;
    }
    # Manually initiate a failover for the IoT Hub to its secondary region
    #
    # + iotHubName - Name of the IoT hub to failover 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - Name of the resource group containing the IoT hub resource 
    # + apiVersion - The version of the API. 
    # + payload - Region to failover to. Must be the Azure paired region. Get the value from the secondary location in the locations property. To learn more, see https://aka.ms/manualfailover/region 
    # + return - Long running manual failover operation for the IoT hub completed 
    remote isolated function iothubManualfailover(string iotHubName, string subscriptionId, string resourceGroupName, string apiVersion, FailoverInput payload) returns http:Response|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${iotHubName}/failover`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Test all routes
    #
    # + iotHubName - IotHub to be tested 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - resource group which Iot Hub belongs to 
    # + apiVersion - The version of the API. 
    # + payload - Input for testing all routes 
    # + return - OK 
    remote isolated function iothubresourceTestallroutes(string iotHubName, string subscriptionId, string resourceGroupName, string apiVersion, TestAllRoutesInput payload) returns TestAllRoutesResult|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${iotHubName}/routing/routes/$testall`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TestAllRoutesResult response = check self.clientEp->post(path, request, targetType=TestAllRoutesResult);
        return response;
    }
    # Test the new route
    #
    # + iotHubName - IotHub to be tested 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - resource group which Iot Hub belongs to 
    # + apiVersion - The version of the API. 
    # + payload - Route that needs to be tested 
    # + return - OK 
    remote isolated function iothubresourceTestroute(string iotHubName, string subscriptionId, string resourceGroupName, string apiVersion, TestRouteInput payload) returns TestRouteResult|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${iotHubName}/routing/routes/$testnew`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TestRouteResult response = check self.clientEp->post(path, request, targetType=TestRouteResult);
        return response;
    }
    # Get the health for routing endpoints
    #
    # + subscriptionId - The subscription identifier. 
    # + apiVersion - The version of the API. 
    # + return - OK 
    remote isolated function iothubresourceGetendpointhealth(string subscriptionId, string resourceGroupName, string iotHubName, string apiVersion) returns EndpointHealthDataListResult|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${iotHubName}/routingEndpointsHealth`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        EndpointHealthDataListResult response = check self.clientEp-> get(path, targetType = EndpointHealthDataListResult);
        return response;
    }
    # Get the non-security related metadata of an IoT hub
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + return - The body contains all the non-security properties of the IoT hub. Security-related properties are set to null. 
    remote isolated function iothubresourceGet(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName) returns IotHubDescription|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        IotHubDescription response = check self.clientEp-> get(path, targetType = IotHubDescription);
        return response;
    }
    # Create or update the metadata of an IoT hub.
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + payload - The IoT hub metadata and security metadata. 
    # + ifMatch - ETag of the IoT Hub. Do not specify for creating a brand new IoT Hub. Required to update an existing IoT Hub. 
    # + return - This is returned as a response to the status polling request for the create or update operation. The body contains the resource representation that indicates a transitional provisioning state. 
    remote isolated function iothubresourceCreateorupdate(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName, IotHubDescription payload, string? ifMatch = ()) returns IotHubDescription|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Match": ifMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IotHubDescription response = check self.clientEp->put(path, request, headers = accHeaders, targetType=IotHubDescription);
        return response;
    }
    # Delete an IoT hub
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + return - This is returned as a response to the status polling request for the delete operation. The body contains the resource representation that indicates a transitional provisioning state. 
    remote isolated function iothubresourceDelete(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName) returns IotHubDescription|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        IotHubDescription response = check self.clientEp-> delete(path, request, targetType = IotHubDescription);
        return response;
    }
    # Update an existing IoT Hubs tags.
    #
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - Resource group identifier. 
    # + resourceName - Name of iot hub to update. 
    # + apiVersion - The version of the API. 
    # + payload - Updated tag information to set into the iot hub instance. 
    # + return - Iot Hub was successfully updated 
    remote isolated function iothubresourceUpdate(string subscriptionId, string resourceGroupName, string resourceName, string apiVersion, TagsResource payload) returns IotHubDescription|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IotHubDescription response = check self.clientEp->patch(path, request, targetType=IotHubDescription);
        return response;
    }
    # Get a shared access policy by name from an IoT hub. For more information, see: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-security
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + keyName - The name of the shared access policy. 
    # + return - This is a synchronous operation. The body contains a JSON-serialized shared access policy, including keys, that you can use to access one or more IoT hub endpoints. 
    remote isolated function iothubresourceGetkeysforkeyname(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName, string keyName) returns SharedAccessSignatureAuthorizationRule|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}/IotHubKeys/${keyName}/listkeys`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        SharedAccessSignatureAuthorizationRule response = check self.clientEp-> post(path, request, targetType = SharedAccessSignatureAuthorizationRule);
        return response;
    }
    # Get the statistics from an IoT hub
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + return - This is a synchronous operation. The body contains JSON-serialized statistics from the identity registry in the IoT hub. 
    remote isolated function iothubresourceGetstats(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName) returns RegistryStatistics|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}/IotHubStats`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        RegistryStatistics response = check self.clientEp-> get(path, targetType = RegistryStatistics);
        return response;
    }
    # Get the certificate list.
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + return - The body contains all the certificate list. 
    remote isolated function certificatesListbyiothub(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName) returns CertificateListDescription|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}/certificates`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        CertificateListDescription response = check self.clientEp-> get(path, targetType = CertificateListDescription);
        return response;
    }
    # Get the certificate.
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + certificateName - The name of the certificate 
    # + return - The body contains the certificate. 
    remote isolated function certificatesGet(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName, string certificateName) returns CertificateDescription|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}/certificates/${certificateName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        CertificateDescription response = check self.clientEp-> get(path, targetType = CertificateDescription);
        return response;
    }
    # Upload the certificate to the IoT hub.
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + certificateName - The name of the certificate 
    # + payload - The certificate body. 
    # + ifMatch - ETag of the Certificate. Do not specify for creating a brand new certificate. Required to update an existing certificate. 
    # + return - If certificate already exist and update was successful, the operation returns HTTP status code of 201 (OK). 
    remote isolated function certificatesCreateorupdate(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName, string certificateName, CertificateBodyDescription payload, string? ifMatch = ()) returns CertificateDescription|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}/certificates/${certificateName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Match": ifMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CertificateDescription response = check self.clientEp->put(path, request, headers = accHeaders, targetType=CertificateDescription);
        return response;
    }
    # Delete an X509 certificate.
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + certificateName - The name of the certificate 
    # + ifMatch - ETag of the Certificate. 
    # + return - Certificate has been deleted. 
    remote isolated function certificatesDelete(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName, string certificateName, string ifMatch) returns http:Response|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}/certificates/${certificateName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Match": ifMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Generate verification code for proof of possession flow.
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + certificateName - The name of the certificate 
    # + ifMatch - ETag of the Certificate. 
    # + return - The body contains the certificate. 
    remote isolated function certificatesGenerateverificationcode(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName, string certificateName, string ifMatch) returns CertificateWithNonceDescription|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}/certificates/${certificateName}/generateVerificationCode`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Match": ifMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        CertificateWithNonceDescription response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = CertificateWithNonceDescription);
        return response;
    }
    # Verify certificate's private key possession.
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + certificateName - The name of the certificate 
    # + ifMatch - ETag of the Certificate. 
    # + payload - The name of the certificate 
    # + return - The body contains the certificate. 
    remote isolated function certificatesVerify(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName, string certificateName, string ifMatch, CertificateVerificationDescription payload) returns CertificateDescription|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}/certificates/${certificateName}/verify`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"If-Match": ifMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CertificateDescription response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CertificateDescription);
        return response;
    }
    # Get a list of the consumer groups in the Event Hub-compatible device-to-cloud endpoint in an IoT hub
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + eventHubEndpointName - The name of the Event Hub-compatible endpoint. 
    # + return - This is a synchronous operation. The body contains a JSON-serialized list of the consumer groups in the Event Hub-compatible endpoint in this IoT hub 
    remote isolated function iothubresourceListeventhubconsumergroups(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName, string eventHubEndpointName) returns EventHubConsumerGroupsListResult|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}/eventHubEndpoints/${eventHubEndpointName}/ConsumerGroups`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        EventHubConsumerGroupsListResult response = check self.clientEp-> get(path, targetType = EventHubConsumerGroupsListResult);
        return response;
    }
    # Get a consumer group from the Event Hub-compatible device-to-cloud endpoint for an IoT hub
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + eventHubEndpointName - The name of the Event Hub-compatible endpoint in the IoT hub. 
    # + name - The name of the consumer group to retrieve. 
    # + return - This is a synchronous operation. The body contains a JSON-serialized consumer group. 
    remote isolated function iothubresourceGeteventhubconsumergroup(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName, string eventHubEndpointName, string name) returns EventHubConsumerGroupInfo|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}/eventHubEndpoints/${eventHubEndpointName}/ConsumerGroups/${name}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        EventHubConsumerGroupInfo response = check self.clientEp-> get(path, targetType = EventHubConsumerGroupInfo);
        return response;
    }
    # Add a consumer group to an Event Hub-compatible endpoint in an IoT hub
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + eventHubEndpointName - The name of the Event Hub-compatible endpoint in the IoT hub. 
    # + name - The name of the consumer group to add. 
    # + return - This is a synchronous operation. 
    remote isolated function iothubresourceCreateeventhubconsumergroup(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName, string eventHubEndpointName, string name) returns EventHubConsumerGroupInfo|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}/eventHubEndpoints/${eventHubEndpointName}/ConsumerGroups/${name}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        EventHubConsumerGroupInfo response = check self.clientEp-> put(path, request, targetType = EventHubConsumerGroupInfo);
        return response;
    }
    # Delete a consumer group from an Event Hub-compatible endpoint in an IoT hub
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + eventHubEndpointName - The name of the Event Hub-compatible endpoint in the IoT hub. 
    # + name - The name of the consumer group to delete. 
    # + return - This is a synchronous operation. 
    remote isolated function iothubresourceDeleteeventhubconsumergroup(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName, string eventHubEndpointName, string name) returns http:Response|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}/eventHubEndpoints/${eventHubEndpointName}/ConsumerGroups/${name}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Exports all the device identities in the IoT hub identity registry to an Azure Storage blob container. For more information, see: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-identity-registry#import-and-export-device-identities
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + payload - The parameters that specify the export devices operation. 
    # + return - OK 
    remote isolated function iothubresourceExportdevices(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName, ExportDevicesRequest payload) returns JobResponse|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}/exportDevices`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        JobResponse response = check self.clientEp->post(path, request, targetType=JobResponse);
        return response;
    }
    # Import, update, or delete device identities in the IoT hub identity registry from a blob. For more information, see: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-identity-registry#import-and-export-device-identities
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + payload - The parameters that specify the import devices operation. 
    # + return - OK 
    remote isolated function iothubresourceImportdevices(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName, ImportDevicesRequest payload) returns JobResponse|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}/importDevices`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        JobResponse response = check self.clientEp->post(path, request, targetType=JobResponse);
        return response;
    }
    # Get a list of all the jobs in an IoT hub. For more information, see: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-identity-registry
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + return - This is a synchronous operation. The response contains a JSON-serialized array of all the jobs in the IoT hub. 
    remote isolated function iothubresourceListjobs(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName) returns JobResponseListResult|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}/jobs`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        JobResponseListResult response = check self.clientEp-> get(path, targetType = JobResponseListResult);
        return response;
    }
    # Get the details of a job from an IoT hub. For more information, see: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-identity-registry
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + jobId - The job identifier. 
    # + return - This is a synchronous operation. The response contains a JSON-serialized description of the job in the IoT hub. 
    remote isolated function iothubresourceGetjob(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName, string jobId) returns JobResponse|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}/jobs/${jobId}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        JobResponse response = check self.clientEp-> get(path, targetType = JobResponse);
        return response;
    }
    # Get the security metadata for an IoT hub. For more information, see: https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-security
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + return - This is a synchronous operation. The body contains a JSON-serialized array of shared access policies, including keys, that you can use to access the IoT hub endpoints. 
    remote isolated function iothubresourceListkeys(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName) returns SharedAccessSignatureAuthorizationRuleListResult|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}/listkeys`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        SharedAccessSignatureAuthorizationRuleListResult response = check self.clientEp-> post(path, request, targetType = SharedAccessSignatureAuthorizationRuleListResult);
        return response;
    }
    # Get the quota metrics for an IoT hub
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + return - This is a synchronous operation. The response contains a JSON-serialized array of the quota metrics for the IoT hub. 
    remote isolated function iothubresourceGetquotametrics(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName) returns IotHubQuotaMetricInfoListResult|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}/quotaMetrics`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        IotHubQuotaMetricInfoListResult response = check self.clientEp-> get(path, targetType = IotHubQuotaMetricInfoListResult);
        return response;
    }
    # Get the list of valid SKUs for an IoT hub
    #
    # + apiVersion - The version of the API. 
    # + subscriptionId - The subscription identifier. 
    # + resourceGroupName - The name of the resource group that contains the IoT hub. 
    # + resourceName - The name of the IoT hub. 
    # + return - This is a synchronous operation. The body contains a JSON-serialized array of the valid SKUs for this IoT hub. 
    remote isolated function iothubresourceGetvalidskus(string apiVersion, string subscriptionId, string resourceGroupName, string resourceName) returns IotHubSkuDescriptionListResult|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Devices/IotHubs/${resourceName}/skus`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        IotHubSkuDescriptionListResult response = check self.clientEp-> get(path, targetType = IotHubSkuDescriptionListResult);
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
