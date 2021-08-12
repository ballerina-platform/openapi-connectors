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

# The primary key of a newly created abuse ticket
public type AbuseTicketId record {
    # Abuse ticket ID
    string u_number?;
};

public type AbuseTicketList record {
    Pagination pagination?;
    # A list of abuse ticket ids originated by this reporter.
    string[] ticketIds;
};

public type ErrorField record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # Human-readable, English description of the problem with the contents of the field
    string message?;
    # 1) JSONPath referring to the field within the data containing an error<br/>or<br/>2) JSONPath referring to an object containing an error
    string path;
    # JSONPath referring to the field on the object referenced by `path` containing an error
    string pathRelated?;
};

public type AbuseTicketCreate record {
    # Additional information that may assist the abuse investigator. ie: server logs or email headers/body for SPAM
    string info?;
    # Reporter URL if housing additional information that may assist the abuse investigator
    string infoUrl?;
    # Do you believe this is intentional abuse by the domain holder?
    boolean intentional?;
    # The Proxy information required to view the abuse being reported. ie: Specific IP used, or country of IP viewing from
    string proxy?;
    # The URL or IP where live abuse content is located at. ie: https://www.example.com/bad_stuff/bad.php
    string 'source?;
    # The brand/company the abuse is targeting. ie: brand name/bank name
    string target?;
    # The type of abuse being reported.
    string 'type?;
};

public type Pagination record {
    # Optional link to first list of results
    string first?;
    # Optional link to last list of results
    string last?;
    # Optional link to next list of results
    string next?;
    # Optional link to previous list of results
    string previous?;
    # Number of records available
    int total?;
};

public type Error record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # List of the specific fields, and the errors found with their contents
    ErrorField[] fields?;
    # Human-readable, English description of the error
    string message?;
    string[] stack?;
};

# The associated fields returned, given a unique abuse ticket id
public type AbuseTicket record {
    # Is this abuse ticket closed?
    boolean closed;
    # The date the abuse ticket was closed
    string closedAt;
    # The date the abuse ticket was created
    string createdAt;
    # The domain or IP the suspected abuse was reported against
    string domainIp;
    # The shopper id of the person who reported the suspected abuse
    string reporter;
    # The single URL or IP the suspected abuse was reported against
    string 'source;
    # The company the suspected abuse is targeting
    string target;
    # Abuse ticket ID
    string ticketId;
    # The type of abuse being reported
    string 'type;
};
