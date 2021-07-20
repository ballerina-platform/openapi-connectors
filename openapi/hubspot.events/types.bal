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

public type ErrorDetail record {
    # A human readable message describing the error along with remediation steps where appropriate
    string message;
    # The name of the field or parameter in which the error was found.
    string 'in?;
    # The status code associated with the error detail
    string code?;
    # A specific category that contains more specific detail about the error
    string subCategory?;
    # Context about the error condition
    record {} context?;
};

# A collection of Events
public type CollectionResponseExternalUnifiedEvent record {
    # Array of results
    ExternalUnifiedEvent[] results;
    # Page info
    Paging paging?;
};

# Used to represent any event. With this format, the `objectType` and `eventType` values are stringified CRM types. Example object:
public type ExternalUnifiedEvent record {
    # The objectType for the object which did the event.
    string objectType;
    # The objectId of the object which did the event.
    string objectId;
    # The format of the `eventType` string is `ae{appId}_{eventTypeLabel}`, `pe{portalId}_{eventTypeLabel}`, or just `e_{eventTypeLabel}` for HubSpot events.
    string eventType;
    # An ISO 8601 timestamp when the event occurred.
    string occurredAt;
    # A unique identifier for the event.
    string id;
    # Other event properties
    record {} properties;
};

# Page info
public type Paging record {
    # NextPage info
    NextPage next?;
};

public type Error record {
    # A human readable message describing the error along with remediation steps where appropriate
    string message;
    # A unique identifier for the request. Include this value with any error reports or support tickets
    string correlationId;
    # The error category
    string category;
    # A specific category that contains more specific detail about the error
    string subCategory?;
    # further information about the error
    ErrorDetail[] errors?;
    # Context about the error condition
    record {} context?;
    # A map of link names to associated URIs containing documentation about the error or recommended remediation steps
    record {} links?;
};

# NextPage info
public type NextPage record {
    string after;
    string link?;
};
