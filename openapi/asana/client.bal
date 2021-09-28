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
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig auth;
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

# This is a generated connector for [Asana API v1.0](https://developers.asana.com/docs) OpenAPI specification.
# This API enables you to help teams organize, track and manage their work.
# For additional help getting started with the API, visit [Asana API](https://developers.asana.com).
@display {label: "Asana", iconPath: "resources/asana.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Asana API Account](https://asana.com/create-account) and obtain tokens following [this guide](https://developers.asana.com/docs/authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://app.asana.com/api/1.0") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Get an attachment
    #
    # + attachmentGid - Globally unique identifier for the attachment.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved the record for a single attachment.
    remote isolated function getAttachment(string attachmentGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse200|error {
        string  path = string `/attachments/${attachmentGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp-> get(path, targetType = InlineResponse200);
        return response;
    }
    # Delete an attachment
    #
    # + attachmentGid - Globally unique identifier for the attachment.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully deleted the specified attachment.
    remote isolated function deleteAttachment(string attachmentGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/attachments/${attachmentGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2001 response = check self.clientEp-> delete(path, request, targetType = InlineResponse2001);
        return response;
    }
    # Submit parallel requests
    #
    # + payload - The requests to batch together via the Batch API.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully completed the requested batch API operations.
    remote isolated function createBatchRequest(Body payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2002|error {
        string  path = string `/batch`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2002 response = check self.clientEp->post(path, request, targetType=InlineResponse2002);
        return response;
    }
    # Create a custom field
    #
    # + payload - The custom field object to create.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Custom field successfully created.
    remote isolated function createCustomField(Body1 payload, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse201|error {
        string  path = string `/custom_fields`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse201 response = check self.clientEp->post(path, request, targetType=InlineResponse201);
        return response;
    }
    # Get a custom field
    #
    # + customFieldGid - Globally unique identifier for the custom field.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved the complete definition of a custom field’s metadata.
    remote isolated function getCustomField(string customFieldGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse201|error {
        string  path = string `/custom_fields/${customFieldGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse201 response = check self.clientEp-> get(path, targetType = InlineResponse201);
        return response;
    }
    # Update a custom field
    #
    # + customFieldGid - Globally unique identifier for the custom field.
    # + payload - The custom field object with all updated properties.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - The custom field was successfully updated.
    remote isolated function updateCustomField(string customFieldGid, Body2 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse201|error {
        string  path = string `/custom_fields/${customFieldGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse201 response = check self.clientEp->put(path, request, targetType=InlineResponse201);
        return response;
    }
    # Delete a custom field
    #
    # + customFieldGid - Globally unique identifier for the custom field.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - The custom field was successfully deleted.
    remote isolated function deleteCustomField(string customFieldGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/custom_fields/${customFieldGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2001 response = check self.clientEp-> delete(path, request, targetType = InlineResponse2001);
        return response;
    }
    # Create an enum option
    #
    # + customFieldGid - Globally unique identifier for the custom field.
    # + payload - The enum option object to create.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Custom field enum option successfully created.
    remote isolated function createEnumOptionForCustomField(string customFieldGid, Body3 payload, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2011|error {
        string  path = string `/custom_fields/${customFieldGid}/enum_options`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2011 response = check self.clientEp->post(path, request, targetType=InlineResponse2011);
        return response;
    }
    # Reorder a custom field's enum
    #
    # + customFieldGid - Globally unique identifier for the custom field.
    # + payload - The enum option object to create.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Custom field enum option successfully reordered.
    remote isolated function insertEnumOptionForCustomField(string customFieldGid, Body4 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2011|error {
        string  path = string `/custom_fields/${customFieldGid}/enum_options/insert`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2011 response = check self.clientEp->post(path, request, targetType=InlineResponse2011);
        return response;
    }
    # Update an enum option
    #
    # + enumOptionGid - Globally unique identifier for the enum option.
    # + payload - The enum option object to update
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully updated the specified custom field enum.
    remote isolated function updateEnumOption(string enumOptionGid, Body5 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2011|error {
        string  path = string `/enum_options/${enumOptionGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2011 response = check self.clientEp->put(path, request, targetType=InlineResponse2011);
        return response;
    }
    # Get events on a resource
    #
    # + 'resource - A resource ID to subscribe to. The resource can be a task or project.
    # + sync - A sync token received from the last request, or none on first sync. Events will be returned from the point in time that the sync token was generated.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved events.
    remote isolated function getEvents(string 'resource, string? sync = (), boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2003|error {
        string  path = string `/events`;
        map<anydata> queryParam = {"resource": 'resource, "sync": sync, "opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2003 response = check self.clientEp-> get(path, targetType = InlineResponse2003);
        return response;
    }
    # Get a job by id
    #
    # + jobGid - Globally unique identifier for the job.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved Job.
    remote isolated function getJob(string jobGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2004|error {
        string  path = string `/jobs/${jobGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2004 response = check self.clientEp-> get(path, targetType = InlineResponse2004);
        return response;
    }
    # Create an organization export request
    #
    # + payload - The organization to export.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully created organization export request.
    remote isolated function createOrganizationExport(Body6 payload, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2012|error {
        string  path = string `/organization_exports`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2012 response = check self.clientEp->post(path, request, targetType=InlineResponse2012);
        return response;
    }
    # Get details on an org export request
    #
    # + organizationExportGid - Globally unique identifier for the organization export.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved organization export object.
    remote isolated function getOrganizationExport(string organizationExportGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2012|error {
        string  path = string `/organization_exports/${organizationExportGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2012 response = check self.clientEp-> get(path, targetType = InlineResponse2012);
        return response;
    }
    # Get teams in an organization
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Returns the team records for all teams in the organization or workspace accessible to the authenticated user.
    remote isolated function getTeamsForOrganization(string workspaceGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2005|error {
        string  path = string `/organizations/${workspaceGid}/teams`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2005 response = check self.clientEp-> get(path, targetType = InlineResponse2005);
        return response;
    }
    # Get multiple portfolio memberships
    #
    # + portfolio - The portfolio to filter results on.
    # + workspace - The workspace to filter results on.
    # + user - A string identifying a user. This can either be the string "me", an email, or the gid of a user.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved portfolio memberships.
    remote isolated function getPortfolioMemberships(string? portfolio = (), string? workspace = (), string? user = (), boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2006|error {
        string  path = string `/portfolio_memberships`;
        map<anydata> queryParam = {"portfolio": portfolio, "workspace": workspace, "user": user, "opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2006 response = check self.clientEp-> get(path, targetType = InlineResponse2006);
        return response;
    }
    # Get a portfolio membership
    #
    # + portfolioMembershipGid - Globally unique identifier for the portfolio membership
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved the requested portfolio membership.
    remote isolated function getPortfolioMembership(string portfolioMembershipGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2007|error {
        string  path = string `/portfolio_memberships/${portfolioMembershipGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2007 response = check self.clientEp-> get(path, targetType = InlineResponse2007);
        return response;
    }
    # Get multiple portfolios
    #
    # + workspace - The workspace or organization to filter portfolios on.
    # + owner - The user who owns the portfolio. Currently, API users can only get a list of portfolios that they themselves own.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved portfolios.
    remote isolated function getPortfolios(string workspace, string owner, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2008|error {
        string  path = string `/portfolios`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset, "workspace": workspace, "owner": owner};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2008 response = check self.clientEp-> get(path, targetType = InlineResponse2008);
        return response;
    }
    # Create a portfolio
    #
    # + payload - The portfolio to create.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully created portfolio.
    remote isolated function createPortfolio(Body7 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2013|error {
        string  path = string `/portfolios`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2013 response = check self.clientEp->post(path, request, targetType=InlineResponse2013);
        return response;
    }
    # Get a portfolio
    #
    # + portfolioGid - Globally unique identifier for the portfolio.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved the requested portfolio.
    remote isolated function getPortfolio(string portfolioGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2013|error {
        string  path = string `/portfolios/${portfolioGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2013 response = check self.clientEp-> get(path, targetType = InlineResponse2013);
        return response;
    }
    # Update a portfolio
    #
    # + portfolioGid - Globally unique identifier for the portfolio.
    # + payload - The updated fields for the portfolio.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully updated the portfolio.
    remote isolated function updatePortfolio(string portfolioGid, Body8 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2013|error {
        string  path = string `/portfolios/${portfolioGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2013 response = check self.clientEp->put(path, request, targetType=InlineResponse2013);
        return response;
    }
    # Delete a portfolio
    #
    # + portfolioGid - Globally unique identifier for the portfolio.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully deleted the specified portfolio.
    remote isolated function deletePortfolio(string portfolioGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/portfolios/${portfolioGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2001 response = check self.clientEp-> delete(path, request, targetType = InlineResponse2001);
        return response;
    }
    # Add a custom field to a portfolio
    #
    # + portfolioGid - Globally unique identifier for the portfolio.
    # + payload - Information about the custom field setting.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + return - Successfully added the custom field to the portfolio.
    remote isolated function addCustomFieldSettingForPortfolio(string portfolioGid, Body9 payload, boolean? optPretty = ()) returns InlineResponse2001|error {
        string  path = string `/portfolios/${portfolioGid}/addCustomFieldSetting`;
        map<anydata> queryParam = {"opt_pretty": optPretty};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Add a portfolio item
    #
    # + portfolioGid - Globally unique identifier for the portfolio.
    # + payload - Information about the item being inserted.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully added the item to the portfolio.
    remote isolated function addItemForPortfolio(string portfolioGid, Body10 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/portfolios/${portfolioGid}/addItem`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Add users to a portfolio
    #
    # + portfolioGid - Globally unique identifier for the portfolio.
    # + payload - Information about the members being added.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully added members to the portfolio.
    remote isolated function addMembersForPortfolio(string portfolioGid, Body11 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/portfolios/${portfolioGid}/addMembers`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Get a portfolio's custom fields
    #
    # + portfolioGid - Globally unique identifier for the portfolio.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved custom field settings objects for a portfolio.
    remote isolated function getCustomFieldSettingsForPortfolio(string portfolioGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2009|error {
        string  path = string `/portfolios/${portfolioGid}/custom_field_settings`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2009 response = check self.clientEp-> get(path, targetType = InlineResponse2009);
        return response;
    }
    # Get portfolio items
    #
    # + portfolioGid - Globally unique identifier for the portfolio.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the requested portfolio's items.
    remote isolated function getItemsForPortfolio(string portfolioGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20010|error {
        string  path = string `/portfolios/${portfolioGid}/items`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20010 response = check self.clientEp-> get(path, targetType = InlineResponse20010);
        return response;
    }
    # Get memberships from a portfolio
    #
    # + portfolioGid - Globally unique identifier for the portfolio.
    # + user - A string identifying a user. This can either be the string "me", an email, or the gid of a user.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the requested portfolio's memberships.
    remote isolated function getPortfolioMembershipsForPortfolio(string portfolioGid, string? user = (), boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2006|error {
        string  path = string `/portfolios/${portfolioGid}/portfolio_memberships`;
        map<anydata> queryParam = {"user": user, "opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2006 response = check self.clientEp-> get(path, targetType = InlineResponse2006);
        return response;
    }
    # Remove a custom field from a portfolio
    #
    # + portfolioGid - Globally unique identifier for the portfolio.
    # + payload - Information about the custom field setting being removed.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + return - Successfully removed the custom field from the portfolio.
    remote isolated function removeCustomFieldSettingForPortfolio(string portfolioGid, Body12 payload, boolean? optPretty = ()) returns InlineResponse2001|error {
        string  path = string `/portfolios/${portfolioGid}/removeCustomFieldSetting`;
        map<anydata> queryParam = {"opt_pretty": optPretty};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Remove a portfolio item
    #
    # + portfolioGid - Globally unique identifier for the portfolio.
    # + payload - Information about the item being removed.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully removed the item from the portfolio.
    remote isolated function removeItemForPortfolio(string portfolioGid, Body13 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/portfolios/${portfolioGid}/removeItem`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Remove users from a portfolio
    #
    # + portfolioGid - Globally unique identifier for the portfolio.
    # + payload - Information about the members being removed.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully removed the members from the portfolio.
    remote isolated function removeMembersForPortfolio(string portfolioGid, Body14 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/portfolios/${portfolioGid}/removeMembers`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Get a project membership
    #
    # + projectMembershipGid - Globally unique identifier for the project membership.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved the requested project membership.
    remote isolated function getProjectMembership(string projectMembershipGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20011|error {
        string  path = string `/project_memberships/${projectMembershipGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20011 response = check self.clientEp-> get(path, targetType = InlineResponse20011);
        return response;
    }
    # Get a project status
    #
    # + projectStatusGid - The project status update to get.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved the specified project's status updates.
    remote isolated function getProjectStatus(string projectStatusGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20012|error {
        string  path = string `/project_statuses/${projectStatusGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20012 response = check self.clientEp-> get(path, targetType = InlineResponse20012);
        return response;
    }
    # Delete a project status
    #
    # + projectStatusGid - The project status update to get.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully deleted the specified project status.
    remote isolated function deleteProjectStatus(string projectStatusGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/project_statuses/${projectStatusGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2001 response = check self.clientEp-> delete(path, request, targetType = InlineResponse2001);
        return response;
    }
    # Get multiple projects
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + workspace - The workspace or organization to filter projects on.
    # + team - The team to filter projects on.
    # + archived - Only return projects whose `archived` field takes on the value of this parameter.
    # + return - Successfully retrieved projects.
    remote isolated function getProjects(boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = (), string? workspace = (), string? team = (), boolean? archived = ()) returns InlineResponse20010|error {
        string  path = string `/projects`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset, "workspace": workspace, "team": team, "archived": archived};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20010 response = check self.clientEp-> get(path, targetType = InlineResponse20010);
        return response;
    }
    # Create a project
    #
    # + payload - The project to create.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved projects.
    remote isolated function createProject(Body15 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2014|error {
        string  path = string `/projects`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2014 response = check self.clientEp->post(path, request, targetType=InlineResponse2014);
        return response;
    }
    # Get a project
    #
    # + projectGid - Globally unique identifier for the project.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved the requested project.
    remote isolated function getProject(string projectGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2014|error {
        string  path = string `/projects/${projectGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2014 response = check self.clientEp-> get(path, targetType = InlineResponse2014);
        return response;
    }
    # Update a project
    #
    # + projectGid - Globally unique identifier for the project.
    # + payload - The updated fields for the project.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully updated the project.
    remote isolated function updateProject(string projectGid, Body16 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2014|error {
        string  path = string `/projects/${projectGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2014 response = check self.clientEp->put(path, request, targetType=InlineResponse2014);
        return response;
    }
    # Delete a project
    #
    # + projectGid - Globally unique identifier for the project.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully deleted the specified project.
    remote isolated function deleteProject(string projectGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/projects/${projectGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2001 response = check self.clientEp-> delete(path, request, targetType = InlineResponse2001);
        return response;
    }
    # Add a custom field to a project
    #
    # + projectGid - Globally unique identifier for the project.
    # + payload - Information about the custom field setting.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + return - Successfully added the custom field to the project.
    remote isolated function addCustomFieldSettingForProject(string projectGid, Body17 payload, boolean? optPretty = ()) returns InlineResponse20013|error {
        string  path = string `/projects/${projectGid}/addCustomFieldSetting`;
        map<anydata> queryParam = {"opt_pretty": optPretty};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20013 response = check self.clientEp->post(path, request, targetType=InlineResponse20013);
        return response;
    }
    # Add followers to a project
    #
    # + projectGid - Globally unique identifier for the project.
    # + payload - Information about the followers being added.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully added followers to the project.
    remote isolated function addFollowersForProject(string projectGid, Body18 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/projects/${projectGid}/addFollowers`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Add users to a project
    #
    # + projectGid - Globally unique identifier for the project.
    # + payload - Information about the members being added.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully added members to the project.
    remote isolated function addMembersForProject(string projectGid, Body19 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/projects/${projectGid}/addMembers`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Get a project's custom fields
    #
    # + projectGid - Globally unique identifier for the project.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved custom field settings objects for a project.
    remote isolated function getCustomFieldSettingsForProject(string projectGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2009|error {
        string  path = string `/projects/${projectGid}/custom_field_settings`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2009 response = check self.clientEp-> get(path, targetType = InlineResponse2009);
        return response;
    }
    # Duplicate a project
    #
    # + projectGid - Globally unique identifier for the project.
    # + payload - Describes the duplicate's name and the elements that will be duplicated.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully created the job to handle duplication.
    remote isolated function duplicateProject(string projectGid, Body20 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2004|error {
        string  path = string `/projects/${projectGid}/duplicate`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2004 response = check self.clientEp->post(path, request, targetType=InlineResponse2004);
        return response;
    }
    # Get memberships from a project
    #
    # + projectGid - Globally unique identifier for the project.
    # + user - A string identifying a user. This can either be the string "me", an email, or the gid of a user.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the requested project's memberships.
    remote isolated function getProjectMembershipsForProject(string projectGid, string? user = (), boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20014|error {
        string  path = string `/projects/${projectGid}/project_memberships`;
        map<anydata> queryParam = {"user": user, "opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20014 response = check self.clientEp-> get(path, targetType = InlineResponse20014);
        return response;
    }
    # Get statuses from a project
    #
    # + projectGid - Globally unique identifier for the project.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the specified project's status updates.
    remote isolated function getProjectStatusesForProject(string projectGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20015|error {
        string  path = string `/projects/${projectGid}/project_statuses`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20015 response = check self.clientEp-> get(path, targetType = InlineResponse20015);
        return response;
    }
    # Create a project status
    #
    # + projectGid - Globally unique identifier for the project.
    # + payload - The project status to create.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully created a new story.
    remote isolated function createProjectStatusForProject(string projectGid, Body21 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20012|error {
        string  path = string `/projects/${projectGid}/project_statuses`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20012 response = check self.clientEp->post(path, request, targetType=InlineResponse20012);
        return response;
    }
    # Remove a custom field from a project
    #
    # + projectGid - Globally unique identifier for the project.
    # + payload - Information about the custom field setting being removed.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + return - Successfully removed the custom field from the project.
    remote isolated function removeCustomFieldSettingForProject(string projectGid, Body22 payload, boolean? optPretty = ()) returns InlineResponse2001|error {
        string  path = string `/projects/${projectGid}/removeCustomFieldSetting`;
        map<anydata> queryParam = {"opt_pretty": optPretty};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Remove followers from a project
    #
    # + projectGid - Globally unique identifier for the project.
    # + payload - Information about the followers being removed.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully removed followers from the project.
    remote isolated function removeFollowersForProject(string projectGid, Body23 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/projects/${projectGid}/removeFollowers`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Remove users from a project
    #
    # + projectGid - Globally unique identifier for the project.
    # + payload - Information about the members being removed.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully removed the members from the project.
    remote isolated function removeMembersForProject(string projectGid, Body24 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/projects/${projectGid}/removeMembers`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Get sections in a project
    #
    # + projectGid - Globally unique identifier for the project.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved sections in project.
    remote isolated function getSectionsForProject(string projectGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20016|error {
        string  path = string `/projects/${projectGid}/sections`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20016 response = check self.clientEp-> get(path, targetType = InlineResponse20016);
        return response;
    }
    # Create a section in a project
    #
    # + projectGid - Globally unique identifier for the project.
    # + payload - The section to create.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully created the specified section.
    remote isolated function createSectionForProject(string projectGid, Body25 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2015|error {
        string  path = string `/projects/${projectGid}/sections`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2015 response = check self.clientEp->post(path, request, targetType=InlineResponse2015);
        return response;
    }
    # Move or Insert sections
    #
    # + projectGid - Globally unique identifier for the project.
    # + payload - The section's move action.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully moved the specified section.
    remote isolated function insertSectionForProject(string projectGid, Body26 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/projects/${projectGid}/sections/insert`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Get task count of a project
    #
    # + projectGid - Globally unique identifier for the project.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the requested project's task counts.
    remote isolated function getTaskCountsForProject(string projectGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20017|error {
        string  path = string `/projects/${projectGid}/task_counts`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20017 response = check self.clientEp-> get(path, targetType = InlineResponse20017);
        return response;
    }
    # Get tasks from a project
    #
    # + projectGid - Globally unique identifier for the project.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the requested project's tasks.
    remote isolated function getTasksForProject(string projectGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20018|error {
        string  path = string `/projects/${projectGid}/tasks`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20018 response = check self.clientEp-> get(path, targetType = InlineResponse20018);
        return response;
    }
    # Get a section
    #
    # + sectionGid - The globally unique identifier for the section.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved section.
    remote isolated function getSection(string sectionGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2015|error {
        string  path = string `/sections/${sectionGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2015 response = check self.clientEp-> get(path, targetType = InlineResponse2015);
        return response;
    }
    # Update a section
    #
    # + sectionGid - The globally unique identifier for the section.
    # + payload - The section to create.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully updated the specified section.
    remote isolated function updateSection(string sectionGid, Body27 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2015|error {
        string  path = string `/sections/${sectionGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2015 response = check self.clientEp->put(path, request, targetType=InlineResponse2015);
        return response;
    }
    # Delete a section
    #
    # + sectionGid - The globally unique identifier for the section.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully deleted the specified section.
    remote isolated function deleteSection(string sectionGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/sections/${sectionGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2001 response = check self.clientEp-> delete(path, request, targetType = InlineResponse2001);
        return response;
    }
    # Add task to section
    #
    # + sectionGid - The globally unique identifier for the section.
    # + payload - The task and optionally the insert location.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully added the task.
    remote isolated function addTaskForSection(string sectionGid, Body28 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/sections/${sectionGid}/addTask`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Get tasks from a section
    #
    # + sectionGid - The globally unique identifier for the section.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the section's tasks.
    remote isolated function getTasksForSection(string sectionGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20018|error {
        string  path = string `/sections/${sectionGid}/tasks`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20018 response = check self.clientEp-> get(path, targetType = InlineResponse20018);
        return response;
    }
    # Get a story
    #
    # + storyGid - Globally unique identifier for the story.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the specified story.
    remote isolated function getStory(string storyGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20019|error {
        string  path = string `/stories/${storyGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20019 response = check self.clientEp-> get(path, targetType = InlineResponse20019);
        return response;
    }
    # Update a story
    #
    # + storyGid - Globally unique identifier for the story.
    # + payload - The comment story to update.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved the specified story.
    remote isolated function updateStory(string storyGid, Body29 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20019|error {
        string  path = string `/stories/${storyGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20019 response = check self.clientEp->put(path, request, targetType=InlineResponse20019);
        return response;
    }
    # Delete a story
    #
    # + storyGid - Globally unique identifier for the story.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully deleted the specified story.
    remote isolated function deleteStory(string storyGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/stories/${storyGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2001 response = check self.clientEp-> delete(path, request, targetType = InlineResponse2001);
        return response;
    }
    # Get multiple tags
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + workspace - The workspace to filter tags on.
    # + return - Successfully retrieved the specified set of tags.
    remote isolated function getTags(boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = (), string? workspace = ()) returns InlineResponse20020|error {
        string  path = string `/tags`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset, "workspace": workspace};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20020 response = check self.clientEp-> get(path, targetType = InlineResponse20020);
        return response;
    }
    # Create a tag
    #
    # + payload - The tag to create.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully created the newly specified tag.
    remote isolated function createTag(Body30 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2016|error {
        string  path = string `/tags`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2016 response = check self.clientEp->post(path, request, targetType=InlineResponse2016);
        return response;
    }
    # Get a tag
    #
    # + tagGid - Globally unique identifier for the tag.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the specified tag.
    remote isolated function getTag(string tagGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2016|error {
        string  path = string `/tags/${tagGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2016 response = check self.clientEp-> get(path, targetType = InlineResponse2016);
        return response;
    }
    # Update a tag
    #
    # + tagGid - Globally unique identifier for the tag.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully updated the specified tag.
    remote isolated function updateTag(string tagGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2016|error {
        string  path = string `/tags/${tagGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2016 response = check self.clientEp-> put(path, request, targetType = InlineResponse2016);
        return response;
    }
    # Delete a tag
    #
    # + tagGid - Globally unique identifier for the tag.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully deleted the specified tag.
    remote isolated function deleteTag(string tagGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2001|error {
        string  path = string `/tags/${tagGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2001 response = check self.clientEp-> delete(path, request, targetType = InlineResponse2001);
        return response;
    }
    # Get tasks from a tag
    #
    # + tagGid - Globally unique identifier for the tag.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the tasks associated with the specified tag.
    remote isolated function getTasksForTag(string tagGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20018|error {
        string  path = string `/tags/${tagGid}/tasks`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20018 response = check self.clientEp-> get(path, targetType = InlineResponse20018);
        return response;
    }
    # Get multiple tasks
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + assignee - The assignee to filter tasks on.
    # + project - The project to filter tasks on.
    # + section - The section to filter tasks on.
    # + workspace - The workspace to filter tasks on.
    # + completedSince - Only return tasks that are either incomplete or that have been completed since this time.
    # + modifiedSince - Only return tasks that have been modified since the given time.
    # + return - Successfully retrieved requested tasks.
    remote isolated function getTasks(boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = (), string? assignee = (), string? project = (), string? section = (), string? workspace = (), string? completedSince = (), string? modifiedSince = ()) returns InlineResponse20018|error {
        string  path = string `/tasks`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset, "assignee": assignee, "project": project, "section": section, "workspace": workspace, "completed_since": completedSince, "modified_since": modifiedSince};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20018 response = check self.clientEp-> get(path, targetType = InlineResponse20018);
        return response;
    }
    # Create a task
    #
    # + payload - Create Task Request
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully created a new task.
    remote isolated function createTask(Body31 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2017|error {
        string  path = string `/tasks`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2017 response = check self.clientEp->post(path, request, targetType=InlineResponse2017);
        return response;
    }
    # Get a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved the specified task.
    remote isolated function getTask(string taskGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2017|error {
        string  path = string `/tasks/${taskGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2017 response = check self.clientEp-> get(path, targetType = InlineResponse2017);
        return response;
    }
    # Update a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + payload - The task to update.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully updated the specified task.
    remote isolated function updateTask(string taskGid, Body32 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2017|error {
        string  path = string `/tasks/${taskGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2017 response = check self.clientEp->put(path, request, targetType=InlineResponse2017);
        return response;
    }
    # Delete a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully deleted the specified task.
    remote isolated function deleteTask(string taskGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/tasks/${taskGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2001 response = check self.clientEp-> delete(path, request, targetType = InlineResponse2001);
        return response;
    }
    # Set dependencies for a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + payload - The list of tasks to set as dependencies.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully set the specified dependencies on the task.
    remote isolated function addDependenciesForTask(string taskGid, Body33 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/tasks/${taskGid}/addDependencies`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Set dependents for a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + payload - The list of tasks to add as dependents.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully set the specified dependents on the given task.
    remote isolated function addDependentsForTask(string taskGid, Body34 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20018|error {
        string  path = string `/tasks/${taskGid}/addDependents`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20018 response = check self.clientEp->post(path, request, targetType=InlineResponse20018);
        return response;
    }
    # Add followers to a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + payload - The followers to add to the task.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully added the specified followers to the task.
    remote isolated function addFollowersForTask(string taskGid, Body35 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/tasks/${taskGid}/addFollowers`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Add a project to a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + payload - The project to add the task to.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully added the specified project to the task.
    remote isolated function addProjectForTask(string taskGid, Body36 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/tasks/${taskGid}/addProject`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Add a tag to a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + payload - The tag to add to the task.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully added the specified tag to the task.
    remote isolated function addTagForTask(string taskGid, Body37 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/tasks/${taskGid}/addTag`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Get attachments for a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the compact records for all attachments on the task.
    remote isolated function getAttachmentsForTask(string taskGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20021|error {
        string  path = string `/tasks/${taskGid}/attachments`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20021 response = check self.clientEp-> get(path, targetType = InlineResponse20021);
        return response;
    }
    # Upload an attachment
    #
    # + taskGid - Globally unique identifier for the task.
    # + payload - The file you want to upload.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully uploaded the attachment to the task.
    remote isolated function createAttachmentForTask(string taskGid, AttachmentRequest payload, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse200|error {
        string  path = string `/tasks/${taskGid}/attachments`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        InlineResponse200 response = check self.clientEp->post(path, request, targetType=InlineResponse200);
        return response;
    }
    # Get dependencies from a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the specified task's dependencies.
    remote isolated function getDependenciesForTask(string taskGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20018|error {
        string  path = string `/tasks/${taskGid}/dependencies`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20018 response = check self.clientEp-> get(path, targetType = InlineResponse20018);
        return response;
    }
    # Get dependents from a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the specified dependents of the task.
    remote isolated function getDependentsForTask(string taskGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20018|error {
        string  path = string `/tasks/${taskGid}/dependents`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20018 response = check self.clientEp-> get(path, targetType = InlineResponse20018);
        return response;
    }
    # Duplicate a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + payload - Describes the duplicate's name and the fields that will be duplicated.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully created the job to handle duplication.
    remote isolated function duplicateTask(string taskGid, Body38 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2004|error {
        string  path = string `/tasks/${taskGid}/duplicate`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2004 response = check self.clientEp->post(path, request, targetType=InlineResponse2004);
        return response;
    }
    # Get projects a task is in
    #
    # + taskGid - Globally unique identifier for the task.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the projects for the given task.
    remote isolated function getProjectsForTask(string taskGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20010|error {
        string  path = string `/tasks/${taskGid}/projects`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20010 response = check self.clientEp-> get(path, targetType = InlineResponse20010);
        return response;
    }
    # Unlink dependencies from a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + payload - The list of tasks to unlink as dependencies.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully unlinked the dependencies from the specified task.
    remote isolated function removeDependenciesForTask(string taskGid, Body39 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20022|error {
        string  path = string `/tasks/${taskGid}/removeDependencies`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20022 response = check self.clientEp->post(path, request, targetType=InlineResponse20022);
        return response;
    }
    # Unlink dependents from a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + payload - The list of tasks to remove as dependents.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully unlinked the specified tasks as dependents.
    remote isolated function removeDependentsForTask(string taskGid, Body40 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20022|error {
        string  path = string `/tasks/${taskGid}/removeDependents`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20022 response = check self.clientEp->post(path, request, targetType=InlineResponse20022);
        return response;
    }
    # Remove followers from a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + payload - The followers to remove from the task.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully removed the specified followers from the task.
    remote isolated function removeFollowerForTask(string taskGid, Body41 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/tasks/${taskGid}/removeFollowers`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Remove a project from a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + payload - The project to remove the task from.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully removed the specified project from the task.
    remote isolated function removeProjectForTask(string taskGid, Body42 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/tasks/${taskGid}/removeProject`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Remove a tag from a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + payload - The tag to remove from the task.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully removed the specified tag from the task.
    remote isolated function removeTagForTask(string taskGid, Body43 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/tasks/${taskGid}/removeTag`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Set the parent of a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + payload - The new parent of the subtask.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully changed the parent of the specified subtask.
    remote isolated function setParentForTask(string taskGid, Body44 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2017|error {
        string  path = string `/tasks/${taskGid}/setParent`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2017 response = check self.clientEp->post(path, request, targetType=InlineResponse2017);
        return response;
    }
    # Get stories from a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the specified task's stories.
    remote isolated function getStoriesForTask(string taskGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20023|error {
        string  path = string `/tasks/${taskGid}/stories`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20023 response = check self.clientEp-> get(path, targetType = InlineResponse20023);
        return response;
    }
    # Create a story on a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + payload - The story to create.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully created a new story.
    remote isolated function createStoryForTask(string taskGid, Body45 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20019|error {
        string  path = string `/tasks/${taskGid}/stories`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20019 response = check self.clientEp->post(path, request, targetType=InlineResponse20019);
        return response;
    }
    # Get subtasks from a task
    #
    # + taskGid - Globally unique identifier for the task.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the specified task's subtasks.
    remote isolated function getSubtasksForTask(string taskGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20018|error {
        string  path = string `/tasks/${taskGid}/subtasks`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20018 response = check self.clientEp-> get(path, targetType = InlineResponse20018);
        return response;
    }
    # Create a subtask
    #
    # + taskGid - Globally unique identifier for the task.
    # + payload - The new subtask to create.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully created the specified subtask.
    remote isolated function createSubtaskForTask(string taskGid, Body46 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2017|error {
        string  path = string `/tasks/${taskGid}/subtasks`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2017 response = check self.clientEp->post(path, request, targetType=InlineResponse2017);
        return response;
    }
    # Get a task's tags
    #
    # + taskGid - Globally unique identifier for the task.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the tags for the given task.
    remote isolated function getTagsForTask(string taskGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20020|error {
        string  path = string `/tasks/${taskGid}/tags`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20020 response = check self.clientEp-> get(path, targetType = InlineResponse20020);
        return response;
    }
    # Get team memberships
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + team - Globally unique identifier for the team.
    # + user - A string identifying a user. This can either be the string "me", an email, or the gid of a user. This parameter must be used with the workspace parameter.
    # + workspace - Globally unique identifier for the workspace. This parameter must be used with the user parameter.
    # + return - Successfully retrieved the requested team memberships.
    remote isolated function getTeamMemberships(boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = (), string? team = (), string? user = (), string? workspace = ()) returns InlineResponse20024|error {
        string  path = string `/team_memberships`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset, "team": team, "user": user, "workspace": workspace};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20024 response = check self.clientEp-> get(path, targetType = InlineResponse20024);
        return response;
    }
    # Get a team membership
    #
    # + teamMembershipGid - Globally unique identifier for the team membership.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved the requested team membership.
    remote isolated function getTeamMembership(string teamMembershipGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20025|error {
        string  path = string `/team_memberships/${teamMembershipGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20025 response = check self.clientEp-> get(path, targetType = InlineResponse20025);
        return response;
    }
    # Create a team
    #
    # + payload - The team to create.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully created a new team.
    remote isolated function createTeam(Body47 payload, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2018|error {
        string  path = string `/teams`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2018 response = check self.clientEp->post(path, request, targetType=InlineResponse2018);
        return response;
    }
    # Get a team
    #
    # + teamGid - Globally unique identifier for the team.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successsfully retrieved the record for a single team.
    remote isolated function getTeam(string teamGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2018|error {
        string  path = string `/teams/${teamGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2018 response = check self.clientEp-> get(path, targetType = InlineResponse2018);
        return response;
    }
    # Add a user to a team
    #
    # + teamGid - Globally unique identifier for the team.
    # + payload - The user to add to the team.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Returns the full user record for the added user.
    remote isolated function addUserForTeam(string teamGid, Body48 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20026|error {
        string  path = string `/teams/${teamGid}/addUser`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20026 response = check self.clientEp->post(path, request, targetType=InlineResponse20026);
        return response;
    }
    # Get a team's projects
    #
    # + teamGid - Globally unique identifier for the team.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + archived - Only return projects whose `archived` field takes on the value of this parameter.
    # + return - Successfully retrieved the requested team's projects.
    remote isolated function getProjectsForTeam(string teamGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = (), boolean? archived = ()) returns InlineResponse20010|error {
        string  path = string `/teams/${teamGid}/projects`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset, "archived": archived};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20010 response = check self.clientEp-> get(path, targetType = InlineResponse20010);
        return response;
    }
    # Create a project in a team
    #
    # + teamGid - Globally unique identifier for the team.
    # + payload - The new project to create.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully created the specified project.
    remote isolated function createProjectForTeam(string teamGid, Body49 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2014|error {
        string  path = string `/teams/${teamGid}/projects`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2014 response = check self.clientEp->post(path, request, targetType=InlineResponse2014);
        return response;
    }
    # Remove a user from a team
    #
    # + teamGid - Globally unique identifier for the team.
    # + payload - The user to remove from the team.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Returns an empty data record
    remote isolated function removeUserForTeam(string teamGid, Body50 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/teams/${teamGid}/removeUser`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Get memberships from a team
    #
    # + teamGid - Globally unique identifier for the team.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the requested team's memberships.
    remote isolated function getTeamMembershipsForTeam(string teamGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20024|error {
        string  path = string `/teams/${teamGid}/team_memberships`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20024 response = check self.clientEp-> get(path, targetType = InlineResponse20024);
        return response;
    }
    # Get users in a team
    #
    # + teamGid - Globally unique identifier for the team.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + offset - Offset token.
    # + return - Returns the user records for all the members of the team, including guests and limited access users
    remote isolated function getUsersForTeam(string teamGid, boolean? optPretty = (), string[]? optFields = (), string? offset = ()) returns InlineResponse20027|error {
        string  path = string `/teams/${teamGid}/users`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20027 response = check self.clientEp-> get(path, targetType = InlineResponse20027);
        return response;
    }
    # Get a user task list
    #
    # + userTaskListGid - Globally unique identifier for the user task list.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved the user task list.
    remote isolated function getUserTaskList(string userTaskListGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20028|error {
        string  path = string `/user_task_lists/${userTaskListGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20028 response = check self.clientEp-> get(path, targetType = InlineResponse20028);
        return response;
    }
    # Get tasks from a user task list
    #
    # + userTaskListGid - Globally unique identifier for the user task list.
    # + completedSince - Only return tasks that are either incomplete or that have been completed since this time. Accepts a date-time string or the keyword *now*.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the user task list's tasks.
    remote isolated function getTasksForUserTaskList(string userTaskListGid, string? completedSince = (), boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20018|error {
        string  path = string `/user_task_lists/${userTaskListGid}/tasks`;
        map<anydata> queryParam = {"completed_since": completedSince, "opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20018 response = check self.clientEp-> get(path, targetType = InlineResponse20018);
        return response;
    }
    # Get multiple users
    #
    # + workspace - The workspace or organization ID to filter users on.
    # + team - The team ID to filter users on.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the requested user records.
    remote isolated function getUsers(string? workspace = (), string? team = (), boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20027|error {
        string  path = string `/users`;
        map<anydata> queryParam = {"workspace": workspace, "team": team, "opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20027 response = check self.clientEp-> get(path, targetType = InlineResponse20027);
        return response;
    }
    # Get a user
    #
    # + userGid - A string identifying a user. This can either be the string "me", an email, or the gid of a user.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Returns the user specified.
    remote isolated function getUser(string userGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20026|error {
        string  path = string `/users/${userGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20026 response = check self.clientEp-> get(path, targetType = InlineResponse20026);
        return response;
    }
    # Get a user's favorites
    #
    # + userGid - A string identifying a user. This can either be the string "me", an email, or the gid of a user.
    # + resourceType - The resource type of favorites to be returned.
    # + workspace - The workspace in which to get favorites.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Returns the specified user's favorites.
    remote isolated function getFavoritesForUser(string userGid, string resourceType, string workspace, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20029|error {
        string  path = string `/users/${userGid}/favorites`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "resource_type": resourceType, "workspace": workspace};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20029 response = check self.clientEp-> get(path, targetType = InlineResponse20029);
        return response;
    }
    # Get memberships from a user
    #
    # + userGid - A string identifying a user. This can either be the string "me", an email, or the gid of a user.
    # + workspace - Globally unique identifier for the workspace.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the requested users's memberships.
    remote isolated function getTeamMembershipsForUser(string userGid, string workspace, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20024|error {
        string  path = string `/users/${userGid}/team_memberships`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset, "workspace": workspace};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20024 response = check self.clientEp-> get(path, targetType = InlineResponse20024);
        return response;
    }
    # Get teams for a user
    #
    # + userGid - A string identifying a user. This can either be the string "me", an email, or the gid of a user.
    # + organization - The workspace or organization to filter teams on.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Returns the team records for all teams in the organization or workspace to which the given user is assigned.
    remote isolated function getTeamsForUser(string userGid, string organization, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse2005|error {
        string  path = string `/users/${userGid}/teams`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset, "organization": organization};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2005 response = check self.clientEp-> get(path, targetType = InlineResponse2005);
        return response;
    }
    # Get a user's task list
    #
    # + userGid - A string identifying a user. This can either be the string "me", an email, or the gid of a user.
    # + workspace - The workspace in which to get the user task list.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved the user's task list.
    remote isolated function getUserTaskListForUser(string userGid, string workspace, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20028|error {
        string  path = string `/users/${userGid}/user_task_list`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "workspace": workspace};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20028 response = check self.clientEp-> get(path, targetType = InlineResponse20028);
        return response;
    }
    # Get workspace memberships for a user
    #
    # + userGid - A string identifying a user. This can either be the string "me", an email, or the gid of a user.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the requested user's workspace memberships.
    remote isolated function getWorkspaceMembershipsForUser(string userGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20030|error {
        string  path = string `/users/${userGid}/workspace_memberships`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20030 response = check self.clientEp-> get(path, targetType = InlineResponse20030);
        return response;
    }
    # Get multiple webhooks
    #
    # + workspace - The workspace to query for webhooks in.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + 'resource - Only return webhooks for the given resource.
    # + return - Successfully retrieved the requested webhooks.
    remote isolated function getWebhooks(string workspace, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = (), string? 'resource = ()) returns InlineResponse20031|error {
        string  path = string `/webhooks`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset, "workspace": workspace, "resource": 'resource};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20031 response = check self.clientEp-> get(path, targetType = InlineResponse20031);
        return response;
    }
    # Establish a webhook
    #
    # + payload - The webhook workspace and target.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully created the requested webhook.
    remote isolated function createWebhook(Body51 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2019|error {
        string  path = string `/webhooks`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2019 response = check self.clientEp->post(path, request, targetType=InlineResponse2019);
        return response;
    }
    # Get a webhook
    #
    # + webhookGid - Globally unique identifier for the webhook.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved the requested webhook.
    remote isolated function getWebhook(string webhookGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2019|error {
        string  path = string `/webhooks/${webhookGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2019 response = check self.clientEp-> get(path, targetType = InlineResponse2019);
        return response;
    }
    # Delete a webhook
    #
    # + webhookGid - Globally unique identifier for the webhook.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved the requested webhook.
    remote isolated function deleteWebhook(string webhookGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/webhooks/${webhookGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2001 response = check self.clientEp-> delete(path, request, targetType = InlineResponse2001);
        return response;
    }
    # Get a workspace membership
    #
    # + workspaceMembershipGid - Globally unique identifier for the workspace membership
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved the requested workspace membership.
    remote isolated function getWorkspaceMembership(string workspaceMembershipGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20032|error {
        string  path = string `/workspace_memberships/${workspaceMembershipGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20032 response = check self.clientEp-> get(path, targetType = InlineResponse20032);
        return response;
    }
    # Get multiple workspaces
    #
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Return all workspaces visible to the authorized user.
    remote isolated function getWorkspaces(boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20033|error {
        string  path = string `/workspaces`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20033 response = check self.clientEp-> get(path, targetType = InlineResponse20033);
        return response;
    }
    # Get a workspace
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Return the full workspace record.
    remote isolated function getWorkspace(string workspaceGid, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20034|error {
        string  path = string `/workspaces/${workspaceGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20034 response = check self.clientEp-> get(path, targetType = InlineResponse20034);
        return response;
    }
    # Update a workspace
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization.
    # + payload - The workspace object with all updated properties.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Update for the workspace was successful.
    remote isolated function updateWorkspace(string workspaceGid, Body52 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20034|error {
        string  path = string `/workspaces/${workspaceGid}`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20034 response = check self.clientEp->put(path, request, targetType=InlineResponse20034);
        return response;
    }
    # Add a user to a workspace or organization
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization.
    # + payload - The user to add to the workspace.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - The user was added successfully to the workspace or organization.
    remote isolated function addUserForWorkspace(string workspaceGid, Body53 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20026|error {
        string  path = string `/workspaces/${workspaceGid}/addUser`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20026 response = check self.clientEp->post(path, request, targetType=InlineResponse20026);
        return response;
    }
    # Get a workspace's custom fields
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved all custom fields for the given workspace.
    remote isolated function getCustomFieldsForWorkspace(string workspaceGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20035|error {
        string  path = string `/workspaces/${workspaceGid}/custom_fields`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20035 response = check self.clientEp-> get(path, targetType = InlineResponse20035);
        return response;
    }
    # Get all projects in a workspace
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + archived - Only return projects whose `archived` field takes on the value of this parameter.
    # + return - Successfully retrieved the requested workspace's projects.
    remote isolated function getProjectsForWorkspace(string workspaceGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = (), boolean? archived = ()) returns InlineResponse20010|error {
        string  path = string `/workspaces/${workspaceGid}/projects`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset, "archived": archived};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20010 response = check self.clientEp-> get(path, targetType = InlineResponse20010);
        return response;
    }
    # Create a project in a workspace
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization.
    # + payload - The new project to create.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully created a new project in the specified workspace.
    remote isolated function createProjectForWorkspace(string workspaceGid, Body54 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2014|error {
        string  path = string `/workspaces/${workspaceGid}/projects`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2014 response = check self.clientEp->post(path, request, targetType=InlineResponse2014);
        return response;
    }
    # Remove a user from a workspace or organization
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization.
    # + payload - The user to remove from the workspace.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - The user was removed successfully to the workspace or organization.
    remote isolated function removeUserForWorkspace(string workspaceGid, Body55 payload, boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse2001|error {
        string  path = string `/workspaces/${workspaceGid}/removeUser`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2001 response = check self.clientEp->post(path, request, targetType=InlineResponse2001);
        return response;
    }
    # Get tags in a workspace
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the specified set of tags.
    remote isolated function getTagsForWorkspace(string workspaceGid, boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20020|error {
        string  path = string `/workspaces/${workspaceGid}/tags`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20020 response = check self.clientEp-> get(path, targetType = InlineResponse20020);
        return response;
    }
    # Create a tag in a workspace
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization.
    # + payload - The tag to create.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully created the newly specified tag.
    remote isolated function createTagForWorkspace(string workspaceGid, Body56 payload, boolean? optPretty = (), string[]? optFields = ()) returns Body56|error {
        string  path = string `/workspaces/${workspaceGid}/tags`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Body56 response = check self.clientEp->post(path, request, targetType=Body56);
        return response;
    }
    # Search tasks in a workspace
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + text - Performs full-text search on both task name and description
    # + resourceSubtype - Filters results by the task's resource_subtype
    # + assigneeAny - Comma-separated list of user identifiers
    # + assigneeNot - Comma-separated list of user identifiers
    # + portfoliosAny - Comma-separated list of portfolio IDs
    # + projectsAny - Comma-separated list of project IDs
    # + projectsNot - Comma-separated list of project IDs
    # + projectsAll - Comma-separated list of project IDs
    # + sectionsAny - Comma-separated list of section or column IDs
    # + sectionsNot - Comma-separated list of section or column IDs
    # + sectionsAll - Comma-separated list of section or column IDs
    # + tagsAny - Comma-separated list of tag IDs
    # + tagsNot - Comma-separated list of tag IDs
    # + tagsAll - Comma-separated list of tag IDs
    # + teamsAny - Comma-separated list of team IDs
    # + followersAny - Comma-separated list of user identifiers
    # + followersNot - Comma-separated list of user identifiers
    # + createdByAny - Comma-separated list of user identifiers
    # + createdByNot - Comma-separated list of user identifiers
    # + assignedByAny - Comma-separated list of user identifiers
    # + assignedByNot - Comma-separated list of user identifiers
    # + likedByAny - Comma-separated list of user identifiers
    # + likedByNot - Comma-separated list of user identifiers
    # + commentedOnByAny - Comma-separated list of user identifiers
    # + commentedOnByNot - Comma-separated list of user identifiers
    # + dueOnBefore - ISO 8601 date string
    # + dueOnAfter - ISO 8601 date string
    # + dueOn - ISO 8601 date string or `null`
    # + dueAtBefore - ISO 8601 datetime string
    # + dueAtAfter - ISO 8601 datetime string
    # + startOnBefore - ISO 8601 date string
    # + startOnAfter - ISO 8601 date string
    # + startOn - ISO 8601 date string or `null`
    # + createdOnBefore - ISO 8601 date string
    # + createdOnAfter - ISO 8601 date string
    # + createdOn - ISO 8601 date string or `null`
    # + createdAtBefore - ISO 8601 datetime string
    # + createdAtAfter - ISO 8601 datetime string
    # + completedOnBefore - ISO 8601 date string
    # + completedOnAfter - ISO 8601 date string
    # + completedOn - ISO 8601 date string or `null`
    # + completedAtBefore - ISO 8601 datetime string
    # + completedAtAfter - ISO 8601 datetime string
    # + modifiedOnBefore - ISO 8601 date string
    # + modifiedOnAfter - ISO 8601 date string
    # + modifiedOn - ISO 8601 date string or `null`
    # + modifiedAtBefore - ISO 8601 datetime string
    # + modifiedAtAfter - ISO 8601 datetime string
    # + isBlocking - Filter to incomplete tasks with dependents
    # + isBlocked - Filter to tasks with incomplete dependencies
    # + hasAttachment - Filter to tasks with attachments
    # + completed - Filter to completed tasks
    # + isSubtask - Filter to subtasks
    # + sortBy - One of `due_date`, `created_at`, `completed_at`, `likes`, or `modified_at`, defaults to `modified_at`
    # + sortAscending - Default `false`
    # + return - Successfully retrieved the section's tasks.
    remote isolated function searchTasksForWorkspace(string workspaceGid, boolean? optPretty = (), string[]? optFields = (), string? text = (), string resourceSubtype = "milestone", string? assigneeAny = (), string? assigneeNot = (), string? portfoliosAny = (), string? projectsAny = (), string? projectsNot = (), string? projectsAll = (), string? sectionsAny = (), string? sectionsNot = (), string? sectionsAll = (), string? tagsAny = (), string? tagsNot = (), string? tagsAll = (), string? teamsAny = (), string? followersAny = (), string? followersNot = (), string? createdByAny = (), string? createdByNot = (), string? assignedByAny = (), string? assignedByNot = (), string? likedByAny = (), string? likedByNot = (), string? commentedOnByAny = (), string? commentedOnByNot = (), string? dueOnBefore = (), string? dueOnAfter = (), string? dueOn = (), string? dueAtBefore = (), string? dueAtAfter = (), string? startOnBefore = (), string? startOnAfter = (), string? startOn = (), string? createdOnBefore = (), string? createdOnAfter = (), string? createdOn = (), string? createdAtBefore = (), string? createdAtAfter = (), string? completedOnBefore = (), string? completedOnAfter = (), string? completedOn = (), string? completedAtBefore = (), string? completedAtAfter = (), string? modifiedOnBefore = (), string? modifiedOnAfter = (), string? modifiedOn = (), string? modifiedAtBefore = (), string? modifiedAtAfter = (), boolean? isBlocking = (), boolean? isBlocked = (), boolean? hasAttachment = (), boolean? completed = (), boolean? isSubtask = (), string sortBy = "modified_at", boolean sortAscending = false) returns InlineResponse20018|error {
        string  path = string `/workspaces/${workspaceGid}/tasks/search`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "text": text, "resource_subtype": resourceSubtype, "assignee.any": assigneeAny, "assignee.not": assigneeNot, "portfolios.any": portfoliosAny, "projects.any": projectsAny, "projects.not": projectsNot, "projects.all": projectsAll, "sections.any": sectionsAny, "sections.not": sectionsNot, "sections.all": sectionsAll, "tags.any": tagsAny, "tags.not": tagsNot, "tags.all": tagsAll, "teams.any": teamsAny, "followers.any": followersAny, "followers.not": followersNot, "created_by.any": createdByAny, "created_by.not": createdByNot, "assigned_by.any": assignedByAny, "assigned_by.not": assignedByNot, "liked_by.any": likedByAny, "liked_by.not": likedByNot, "commented_on_by.any": commentedOnByAny, "commented_on_by.not": commentedOnByNot, "due_on.before": dueOnBefore, "due_on.after": dueOnAfter, "due_on": dueOn, "due_at.before": dueAtBefore, "due_at.after": dueAtAfter, "start_on.before": startOnBefore, "start_on.after": startOnAfter, "start_on": startOn, "created_on.before": createdOnBefore, "created_on.after": createdOnAfter, "created_on": createdOn, "created_at.before": createdAtBefore, "created_at.after": createdAtAfter, "completed_on.before": completedOnBefore, "completed_on.after": completedOnAfter, "completed_on": completedOn, "completed_at.before": completedAtBefore, "completed_at.after": completedAtAfter, "modified_on.before": modifiedOnBefore, "modified_on.after": modifiedOnAfter, "modified_on": modifiedOn, "modified_at.before": modifiedAtBefore, "modified_at.after": modifiedAtAfter, "is_blocking": isBlocking, "is_blocked": isBlocked, "has_attachment": hasAttachment, "completed": completed, "is_subtask": isSubtask, "sort_by": sortBy, "sort_ascending": sortAscending};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20018 response = check self.clientEp-> get(path, targetType = InlineResponse20018);
        return response;
    }
    # Get objects via typeahead
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization.
    # + resourceType - The type of values the typeahead should return. You can choose from one of the following: `custom_field`, `project`, `portfolio`, `tag`, `task`, and `user`. Note that unlike in the names of endpoints, the types listed here are in singular form (e.g. `task`). Using multiple types is not yet supported.
    # + 'type - *Deprecated: new integrations should prefer the resource_type field.*
    # + query - The string that will be used to search for relevant objects. If an empty string is passed in, the API will currently return an empty result set.
    # + count - The number of results to return. The default is 20 if this parameter is omitted, with a minimum of 1 and a maximum of 100. If there are fewer results found than requested, all will be returned.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + return - Successfully retrieved objects via a typeahead search algorithm.
    remote isolated function typeaheadForWorkspace(string workspaceGid, string resourceType, string 'type = "user", string? query = (), int? count = (), boolean? optPretty = (), string[]? optFields = ()) returns InlineResponse20036|error {
        string  path = string `/workspaces/${workspaceGid}/typeahead`;
        map<anydata> queryParam = {"resource_type": resourceType, "type": 'type, "query": query, "count": count, "opt_pretty": optPretty, "opt_fields": optFields};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20036 response = check self.clientEp-> get(path, targetType = InlineResponse20036);
        return response;
    }
    # Get users in a workspace or organization
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + offset - Offset token.
    # + return - Return the users in the specified workspace or org.
    remote isolated function getUsersForWorkspace(string workspaceGid, boolean? optPretty = (), string[]? optFields = (), string? offset = ()) returns InlineResponse20027|error {
        string  path = string `/workspaces/${workspaceGid}/users`;
        map<anydata> queryParam = {"opt_pretty": optPretty, "opt_fields": optFields, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20027 response = check self.clientEp-> get(path, targetType = InlineResponse20027);
        return response;
    }
    # Get the workspace memberships for a workspace
    #
    # + workspaceGid - Globally unique identifier for the workspace or organization.
    # + user - A string identifying a user. This can either be the string "me", an email, or the gid of a user.
    # + optPretty - Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
    # + optFields - Defines fields to return.
    # + 'limit - Results per page.
    # + offset - Offset token.
    # + return - Successfully retrieved the requested workspace's memberships.
    remote isolated function getWorkspaceMembershipsForWorkspace(string workspaceGid, string? user = (), boolean? optPretty = (), string[]? optFields = (), int? 'limit = (), string? offset = ()) returns InlineResponse20030|error {
        string  path = string `/workspaces/${workspaceGid}/workspace_memberships`;
        map<anydata> queryParam = {"user": user, "opt_pretty": optPretty, "opt_fields": optFields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse20030 response = check self.clientEp-> get(path, targetType = InlineResponse20030);
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
