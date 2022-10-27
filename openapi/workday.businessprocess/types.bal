// Copyright (c) 2022 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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
import ballerina/constraint;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

public type Task record {
    *InstanceModelReference;
};

public type Questionnaire record {
    *InstanceModelReference;
};

public type ContentType record {
    *InstanceModelReference;
};

public type AttachmentCategoryView record {
    # The Reference ID to use for lookups within our Workday Web Services. For ~supervisory organizations~, this is also the 'Organization ID'
    string referenceID?;
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type EventStepsSummary record {
    StepEvent stepEvent?;
    # The date when the event record was created.
    string creationDate?;
    # This CRF returns the step help text that is configured for the Workflow Step of the Event Record.
    string stepHelpText?;
    OverallProcess overallProcess?;
    # The date the delayed step will trigger.
    string delayedDate?;
    # The date when this step was completed
    string completedDate?;
    Task task?;
    # The people this event is currently awaiting for action.
    AwaitingPerson[] awaitingPersons?;
    BusinessProcessStep businessProcessStep?;
    StepType stepType?;
    BusinessProcess businessProcess?;
    # The order that parallel steps display in the Inbox. This will be populated only if this Business Process Type allows configuration of Parallel Step Inbox Order. If there are multiple steps from the business process definition that are associated to this event step, this field returns no value.
    string parallelStepInboxOrder?;
    CompletedByPerson completedByPerson?;
    # Returns the comments for the business process event step
    Comments[] comments?;
    Status status?;
    # Retired. We retire this report field because when there are multiple steps on the business process definition that are associated with this event step, this report field doesn't return the order for each associated step. We recommend that you use the Order report field instead.
    string 'order?;
    # Returns the due date for this step.
    string dueDate?;
    Event event?;
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type Initiator record {
    *InstanceModelReference;
};

public type SubBusinessProcess record {
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type To record {
    *InstanceModelReference;
};

public type ValidationErrorModelReference record {
    *ErrorModelReference;
    # An array of validation errors
    ErrorModelReference[] errors?;
};

public type Status record {
    *InstanceModelReference;
};

public type StepEvent record {
    *InstanceModelReference;
};

public type BusinessProcessStepRef record {
    *BusinessProcessStep2;
};

public type BusinessProcessStepSendBack record {
    # Returns user's comment for Event Record.
    string reason;
    To to;
    StatusReadOnly status?;
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type BusinessProcessStepsApprove record {
    EventStatus eventStatus?;
    # Returns user's comment for Event Record.
    string comment?;
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type For record {
    *InstanceModelReference;
};

public type BusinessProcessStepsDeny record {
    # Returns user's comment for Event Record.
    string comment?;
    StepAction stepAction?;
    EventStatus eventStatus?;
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type FacetsModelReference FacetsModelReferenceInner[];

public type OverallBusinessProcess record {
    *InstanceModelReference;
};

public type UploadedBy record {
    *InstanceModelReference;
};

public type MultipleInstanceModelReference record {
    int total?;
    InstanceModelReference[] data?;
};

public type EventDetails record {
    # Returns other Business Processes (sub-processes) part of this process, including processes multiple levels down.
    SubBusinessProcess[] subBusinessProcesses?;
    # The date the business process needs to be completed.
    string dueDate?;
    For for?;
    OverallBusinessProcess overallBusinessProcess?;
    # The date and time the business process was completed.
    string completedDate?;
    # Date the business process was initiated.
    string creationDate?;
    Status status?;
    Initiator initiator?;
    # The date this business process takes effect.
    string effectiveDate?;
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type StepAction record {
    *InstanceModelReference;
};

public type SecurityGroupView record {
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type AwaitingPerson record {
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type OverallProcess record {
    *InstanceModelReference;
};

public type StatusReadOnly record {
    *InstanceModelReference;
};

public type Person record {
    *InstanceModelReference;
};

public type ErrorModelReference record {
    # A description of the error
    string 'error;
};

# collection something or other
public type InlineResponse2008 record {
    AttachmentCategoryView[] data?;
    int total?;
};

public type Category record {
    *InstanceModelReference;
};

public type CompletedStepsView record {
    # The people this event is currently awaiting for action.
    AwaitingPerson[] awaitingPersons?;
    Event event?;
    # The date when this step was completed
    string completedDate?;
    # The date when the event record was created.
    string creationDate?;
    Status status?;
    CompletedByPerson completedByPerson?;
    # Retired. We retire this report field because when there are multiple steps on the business process definition that are associated with this event step, this report field doesn't return the order for each associated step. We recommend that you use the Order report field instead.
    string 'order?;
    # The order that parallel steps display in the Inbox. This will be populated only if this Business Process Type allows configuration of Parallel Step Inbox Order. If there are multiple steps from the business process definition that are associated to this event step, this field returns no value.
    string parallelStepInboxOrder?;
    # Returns the comments for the business process event step
    Comments[] comments?;
    # Returns the due date for this step.
    string dueDate?;
    # Id of the instance
    string id?;
    # A preview of the instance
    string descriptor?;
};

public type StepsInProgressView record {
    # The date the delayed step will trigger.
    string delayedDate?;
    # Returns the due date for this step.
    string dueDate?;
    # Returns if the event step has been anonymously assigned.
    boolean anonymous?;
    BusinessProcessStepRef businessProcessStep?;
    # Retired. We retire this report field because when there are multiple steps on the business process definition that are associated with this event step, this report field doesn't return the order for each associated step. We recommend that you use the Order report field instead.
    string 'order?;
    # The order that parallel steps display in the Inbox. This will be populated only if this Business Process Type allows configuration of Parallel Step Inbox Order. If there are multiple steps from the business process definition that are associated to this event step, this field returns no value.
    string parallelStepInboxOrder?;
    # The people this event is currently awaiting for action.
    AwaitingPerson[] awaitingPersons?;
    # The date when the event record was created.
    string creationDate?;
    Status status?;
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type StepType record {
    *InstanceModelReference;
};

public type EventStatus record {
    *InstanceModelReference;
};

# collection something or other
public type InlineResponse200 record {
    EventStepsSummary[] data?;
    int total?;
};

public type BusinessProcessStep2 record {
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type CompletedByPerson record {
    *InstanceModelReference;
};

public type EventAttachmentsView record {
    UploadedBy uploadedBy?;
    # Event attachment description
    string description?;
    Category category?;
    ContentType contentType?;
    # File length of the attachment
    int fileLength?;
    # File name of the attachment
    @constraint:String {maxLength: 255}
    string fileName?;
    # Returns Date the Business Process Attachment was updated.
    string uploadDate?;
    # Id of the instance
    string id?;
};

public type InstanceModelReference record {
    # wid / id / reference id
    string id;
    # A description of the instance
    string descriptor?;
    # A link to the instance
    string href?;
};

public type DueDate record {
    *InstanceModelReference;
};

public type RemainingStepView record {
    # Returns true if this step completes the business process.
    boolean completionStep?;
    StepType stepType?;
    # Returns the security groups that can perform the workflow step.
    SecurityGroupView[] groups?;
    # Returns the alternate name of the workflow step for the business process definition.
    string step?;
    DueDate dueDate?;
    # This report field controls ordering of parallel steps in Inbox. It will be populated only if this Business Process Type allows configuration of Parallel Step Inbox Order.
    string parallelStepInboxOrder?;
    # Returns the order of this step within the business process definition it is part of.
    string 'order?;
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type Comments record {
    Person person?;
    # Comment
    string comment?;
    # Gives the moment at which the instance was originally created.
    string commentDate?;
};

public type EventStepsView record {
    # The date the delayed step will trigger.
    string delayedDate?;
    StepEvent stepEvent?;
    BusinessProcessStep businessProcessStep?;
    # The order that parallel steps display in the Inbox. This will be populated only if this Business Process Type allows configuration of Parallel Step Inbox Order. If there are multiple steps from the business process definition that are associated to this event step, this field returns no value.
    string parallelStepInboxOrder?;
    Status status?;
    # Returns the due date for this step.
    string dueDate?;
    StepType stepType?;
    # Retired. We retire this report field because when there are multiple steps on the business process definition that are associated with this event step, this report field doesn't return the order for each associated step. We recommend that you use the Order report field instead.
    string 'order?;
    # This CRF returns the step help text that is configured for the Workflow Step of the Event Record.
    string stepHelpText?;
    BusinessProcess businessProcess?;
    # The date when this step was completed
    string completedDate?;
    Task task?;
    # The people this event is currently awaiting for action.
    AwaitingPerson[] awaitingPersons?;
    OverallProcess overallProcess?;
    # Returns the comments for the business process event step
    Comments[] comments?;
    Event event?;
    CompletedByPerson completedByPerson?;
    Questionnaire questionnaire?;
    # The date when the event record was created.
    string creationDate?;
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

public type BusinessProcessStep record {
    *InstanceModelReference;
};

public type BusinessProcessTypeDetails record {
    # The help text for the initiation step of a business process.
    string helpText?;
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

# collection something or other
public type InlineResponse2001 record {
    EventDetails[] data?;
    int total?;
};

public type Event record {
    *InstanceModelReference;
};

# collection something or other
public type InlineResponse2003 record {
    BusinessProcessTypeView[] data?;
    int total?;
};

# collection something or other
public type InlineResponse2002 record {
    CompletedStepsView[] data?;
    int total?;
};

public type BusinessProcessTypeView record {
    # A preview of the instance
    string descriptor?;
    # Id of the instance
    string id?;
};

# collection something or other
public type InlineResponse2005 record {
    Comments[] data?;
    int total?;
};

# collection something or other
public type InlineResponse2004 record {
    EventAttachmentsView[] data?;
    int total?;
};

# collection something or other
public type InlineResponse2007 record {
    RemainingStepView[] data?;
    int total?;
};

# This object represents the possible facets for this resource
public type FacetsModelReferenceInner record {
    # A description of the facet
    string descriptor?;
    # The alias used to select the facet
    string facetParameter?;
    # the facet values
    record {
        # The number of instances returned by this facet
        int count?;
        # wid / id / reference id
        string id;
        # A description of the facet
        string descriptor?;
        # A link to the instance
        string href?;
    }[] values?;
};

public type BusinessProcess record {
    *InstanceModelReference;
};

# collection something or other
public type InlineResponse2006 record {
    StepsInProgressView[] data?;
    int total?;
};
