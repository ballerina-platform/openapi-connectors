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

public type IdeaArr Idea[];

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

public type ProductRoadmaps record {
    # ID of the product roadmap.
    string id?;
};

public type PersonaNamePostLink record {
    # Name of the persona to link to an object when creating. It must match exactly.
    string name;
};

# The list of products that match the query and filters.
public type SearchresultsProducts record {
    # Count of products that match the query and filters.
    int count?;
    # Searched product result.
    SearchProduct[] results?;
};

public type ContactIdPostLink record {
    # ID of the contact
    string id?;
};

public type RoadmapList record {
    # Number of roadmaps.
    int roadmap_count?;
    ProductlineLink[] productline_roadmaps?;
    RoadmapLink[] roadmaps?;
};

public type SearchFeedback record {
    # ID of the feedback.
    int id?;
    # The feedback. This field can contain HTML markup and UTF-8 character codes.
    string feedback?;
    SearchfeedbackCustomer customer?;
};

# List of feedback.
public type FeedbackList (ContactLinkWithFeedback|FeedbackListing)[];

public type Product record {
    # ID of product.
    int id?;
    # Name of product.
    string name?;
    # Description of the product. This field can contain HTML markup and UTF-8 character codes.
    string description?;
    # Vision for the product. This field can contain HTML markup and UTF-8 character codes.
    string vision?;
    # KPIs for the product. This field can contain HTML markup and UTF-8 character codes.
    string kpis?;
    # Value of the product to end users and the business. This field can contain HTML markup and UTF-8 character codes.
    string value?;
    # Documentation related to the product. This field can contain HTML markup and UTF-8 character codes.
    string documentation?;
    ProductImage? image?;
    ProductRoadmaps roadmaps?;
    # When the product was created.
    string created_at?;
    # When the product details were last updatd.
    string updated_at?;
};

# Fields to create a feedback. Note either the contact ID or contact name is required. Otherwise a 400 error will be returned. If a name and email field are used, the value in the email field will be used to see if the contact already exists and if it does the feedback will be automatically added to the existing contact.
public type FeedbackPost record {
    # ID of the contact providing the feedback. Either Contact ID or Contact name is required.
    string contact_id?;
    # Name of the contact providing the feedback. Either Contact ID or Contact name is required.
    string name?;
    # UUID of the company to link the contact to. The UUID can be determined using /GET companies endpoint.
    string company_id?;
    # The feedback. This field accepts HTML and is stored as UTF-8.
    string feedback;
    # The email of the contact. This is used to avoid duplication of contacts. This can be any unique ID for each contact.
    string email?;
    # Text field about the contact. This will overright the existing about if the contact already exists. This field accepts HTML and is stored as UTF-8.
    string about?;
    # Ihe one or more ideas  associated to the feedback.
    IdeaPostLink[] ideas?;
    # The tags associated to the feedback. Mulitple tags can be specified and acts as an OR. Use the tag ID or UUID.
    (TagIdPostLink|TagNamePostLink)[] tags?;
    # The persona associated to feedback. Can either be the persona UUID or persona ID.
    (PersonaIdPostLink|PersonaNamePostLink)[] personas?;
    # The product associated to feedback. Can either be the product UUID or product ID.
    (ProductIdPostLink|ProductNamePostLink)[] products?;
    # The source from where the feedback was gathered. If none is supplied the default is API.
    string 'source?;
    # The external url associated with the feedback. An example of an external url is that of a record in a CRM or a ticket in a customer support application
    ExternalUrlPost[] external_links?;
};

# A design or mockup.
public type Design record {
    # ID of the design.
    int id?;
    # Name of the design.
    string name?;
    # List of previous versions of the design.
    DesignVersion[] previous_versions?;
};

public type RoadmapcardpostObjectives record {
    # UUID of the objective to link to the roadmap card.
    string id?;
};

public type ProductLink record {
    # ID of the product.
    int id?;
    # Name of the product.
    string product?;
    # When the product was linked to the other object
    string added?;
};

public type UserStoryList UserStoryWithIdea[];

public type ContactPost record {
    # Name of the contact.
    string name?;
    # Can be email or other unique identifier. This is used to de-duplicate contacts.
    string email?;
    # Details on the contact. This field accepts HTML and is stored as UTF-8.
    string about?;
    # Phone number of the contact.
    string phone?;
    # Twitter handle of the contact.
    string twitter_url?;
    (TagIdPostLink|TagNamePostLink)[] tags?;
    ExternalUrlPost[] external_links?;
    (PersonaIdPostLink|PersonaNamePostLink)[] personas?;
    # UUID of the company to link the contact to. The UUID can be determined using /GET companies endpoint. Only used in the creation of a new contact.
    string company?;
    # The UUID of the job role. The UUID can be /GET job_roles endpoint
    string job_role?;
};

public type SearchfeedbackCustomer record {
    # The contact ID.
    int id?;
    # The contact Name.
    string name?;
};

public type Status record {
    # ID of the status.
    int id?;
    # The status name.
    string status?;
    # Whether the status is active or archived.
    string state?;
    # When the status was added.
    string created_at?;
    # When the status was updated.
    string updated_at?;
};

# List of all thoughts made in an account.
public type ThoughtList record {
    # Total number of votes.
    string total_votes?;
    # All the users who indicated yea on the idea.
    ThoughtWithIdea[] yea?;
    # All the users who indicated nay on the idea.
    ThoughtWithIdea[] nay?;
    # All the users who indicated maybe on the idea.
    ThoughtWithIdea[] maybe?;
};

public type ThoughtPost record {
    # The thought type.
    string vote?;
    # Numeric ID of the idea to associate the vote too. This can be retrieved from GET /ideas
    int idea_id?;
    # Numeric ID of the user with a role in the account who is making the thought.
    int user_id?;
    # Comment made when adding the thought. This field accepts HTML and is stored as UTF-8.
    string comment?;
};

public type PersonaListing record {
    # ID of the persona.
    string id?;
    # UUID of the persona.
    string persona_id?;
    # Persona name.
    string name?;
    # Description of the persona. This field can contain HTML markup and UTF-8 character codes.
    string description?;
    PersonalistingImage? image?;
    # When the persona was created.
    string created_at?;
    # When the persona details were last updated.
    string updated_at?;
};

public type CompanyContact record {
    # ID of the contact.
    string id?;
    # Name of the contact.
    string name?;
    # Email of the contact.
    string email?;
    # Details about the contact. This field can contain HTML markup and UTF-8 character codes.
    string about?;
    # Contact's phone number.
    string phone?;
    # Contact's twitter handle
    string twitter_url?;
    # Photo or image of contact.
    CompanycontactImage image?;
    # When the contact was added to the account.
    string created_at?;
    # When the contact was last updated.
    string updated_at?;
};

public type ObjectivepostProduct record {
    # Numeric poduct ID to link the objective too.
    int id?;
};

public type IdeaPostLink record {
    # Numeric id of the idea to link to an object when creating.
    string id;
};

public type IdeaexpandedBusinessCase record {
    # What problem is this idea solving. This field can contain HTML markup and UTF-8 character codes.
    string problem?;
    # What is the value of solving this problem. This field can contain HTML markup and UTF-8 character codes.
    string value?;
};

# Previous version of a design.
public type DesignVersion record {
    # ID of the design version.
    int id?;
    # Name of the design version.
    string name?;
    # Version of the design.
    string 'version?;
};

public type JobRole record {
    # UUID of the job role.
    string id?;
    # Name of the job role.
    string name?;
    # When the job role was added.
    string created_at?;
    # When the job role was last updated.
    string updated_at?;
};

public type ExternalUrlIdeaPost record {
    # Name/title of the URL.
    string title;
    # The URL of the external link.
    string url;
};

public type CompanylistInclude record {
    # Whether the feedback associated to the company via the contacts associated to the company are included in the results.
    boolean feedbacks?;
    # Whether the company contacts are included in the results.
    boolean contacts?;
};

public type Idea record {
    # Data store ID of the idea.
    string id?;
    # The displayed ID for the idea in the UI.
    string project_id?;
    AccountLink account?;
    # The URL to the idea in the ProdPad UI. Useful for providing a link to the original source in other applications.
    string web_url?;
    # The raw impact value.
    string impact?;
    # The impact value in the scale.
    string? impact_scaled?;
    # the raw effort value.
    string effort?;
    # The effort value in the scale.
    string? effort_scaled?;
    # The raw popularity value.
    @constraint:Int {maxValue: 11}
    int popularity?;
    # The raw engagement value.
    @constraint:Int {maxValue: 11}
    int engagement?;
    # When the idea was added to the account.
    string created_at?;
    # When the idea was last updated.
    string updated_at?;
    # Title for the idea.
    string title?;
    # The details of the idea. This field can contain HTML markup and UTF-8 character codes.
    string description?;
    # State of the idea.
    string state?;
    # User link information.
    UserLink? creator?;
};

public type TagNamePostLink record {
    # Name of the tag to link to an object when creating.
    string name;
};

public type ObjectivePost record {
    # Name of the objective
    string name?;
    # The state of the objective
    string state?;
    ObjectivepostProduct product?;
};

public type CommentwithdesignMockup record {
    # ID of the mockup.
    int id?;
    # Name of the mockup.
    string name?;
};

public type Persona record {
    # ID of the persona.
    string id?;
    # UUID of the persona.
    string persona_id?;
    # Persona name.
    string name?;
    # Description of the persona. This field can contain HTML markup and UTF-8 character codes.
    string description?;
    PersonaImage? image?;
    # When the persona was created.
    string created_at?;
    # When the persona details were last updated.
    string updated_at?;
    # Key behaviours of the persona. This field can contain HTML markup and UTF-8 character codes.
    string behaviours?;
    # Key goals of the persona. This field can contain HTML markup and UTF-8 character codes.
    string goals?;
    # Key constraints of the persona. This field can contain HTML markup and UTF-8 character codes.
    string constraints?;
};

public type UserImage record {
    # URL to user image.
    string original?;
};

public type StatusList StatusListing[];

public type RoadmapcardcolumnPipeline record {
    IdeaLinkPipeline[] ideas?;
    SpecLinkPipeline[] specs?;
};

public type IdeaLink record {
    # ID of the idea.
    int id?;
};

public type ThoughtWithIdea record {
    *Thought;
    IdeaLink ideas;
};

public type ObjectiveList Objective[];

public type IdeaStatusChangePost record {
    # Numeric ID of the idea to change the status on.
    int idea_id?;
    # Numeric ID of the user changing the workflow status of an idea.
    int user_id?;
    # Numeric ID of the status to change the idea to. Can be found using GET /statuses.
    int status_id?;
};

public type PersonaImage record {
    # URL to persona image.
    string original?;
};

public type JobRoleLink record {
    # UUID of the job role.
    string id?;
    # Name of job role.
    string name?;
};

public type RoadmapCardColumn record {
    # ID of roadmap card.
    string id?;
    # ID of product.
    string numeric_product_id?;
    # Title of roadmap card.
    string title?;
    # Description of roadmap card. This field can contain HTML markup and UTF-8 character codes.
    string description?;
    # Whether the roadmap card is visible on embedded roadmaps.
    string 'public?;
    # Position in the roadmap colum. 0 is top.
    string position?;
    # Raw effort score.
    @constraint:Int {maxValue: 11}
    int effort?;
    # Effort value on the scale.
    string? effort_scaled?;
    # Raw impact score.
    @constraint:Int {maxValue: 11}
    int impact?;
    # Impact value on the scale.
    string? impact_scaled?;
    # Current status.
    string status?;
    # Raw status value.
    int status_raw?;
    # Current state of roadmap card.
    string state?;
    # Raw state value.
    int state_raw?;
    # When the card was created.
    string created_at?;
    # When the card was last updated.
    string updated_at?;
    TagLink[] tags?;
    ObjectiveLink[] objectives?;
    UserLink[] owners?;
    RoadmapcardcolumnPipeline pipeline?;
};

public type Error4xx record {
    boolean success?;
    # Error message for developers.
    string developer_message?;
    # Error message that can be displayed to users.
    string user_message?;
};

public type CommentWithDesign record {
    *Comment;
    CommentwithdesignMockup mockup?;
};

public type PersonaList PersonaListing[];

public type FeedbackAttachment record {
    # Numeric id of the file attachment.
    int id?;
    # UUID of the file attachment.
    string file_id?;
    # URL to the file.
    string url?;
    # Name of the file attachment.
    string filename?;
    # The file attachment extension.
    string extension?;
    # When the attachment was created.
    string created_at?;
    # When the attachment was last updated.
    string updated_at?;
};

public type RoadmapcardColumn record {
    # ID of the column.
    int id?;
    # Title of the roadmap column.
    string title?;
    # Number of the column on the roadmap.
    string column_number?;
};

public type CommentwiththoughtVote record {
    # ID of the thought.
    string id?;
    # The thought associated to the comment.
    string vote?;
    # When the vote was added.
    string added_at?;
};

public type SearchPersona record {
    # ID of the persona.
    int id?;
    # Name of the persona.
    string name?;
};

# The list of personas of that match the query and filters.
public type SearchresultsPersonas record {
    # The count of personas that match the query and filters.
    int count?;
    # Search persona result.
    SearchPersona[] results?;
};

# The list of ideas that match the query and filters.
public type SearchresultsIdeas record {
    # Count of ideas that match the query and filters.
    int count?;
    # An array of search ideas.
    SearchIdea[] results?;
};

public type ThoughtpostresponseComments record {
    # ID of the comment associated to the thought.
    int id?;
    IdeaLink ideas?;
    # The comment with the though. May include HTML and UTF-8 characters.
    string comment?;
    # When the comment was created.
    string created_at?;
};

public type ContactList record {
    # Whether the fetch worked.
    boolean success?;
    # Number of contacts found.
    string contact_count?;
    # Which page of results.
    int page?;
    # Number of results on each page.
    int size?;
    ContactlistFilters filters?;
    ContactlistIncludes includes?;
    (Contact|ContactWithFeedback)[] contacts?;
};

public type ContactWithFeedback record {
    *Contact;
    FeedbackLink[] feedbacks;
};

public type ProductList ProductListing[];

public type IdeaPut record {
    # The title of the idea.
    string title?;
    # The description of the idea. This field accepts HTML and is stored as UTF-8.
    string description?;
    IdeaputBusinessCase business_case?;
    # Functional specs for the idea. This field accepts HTML and is stored as UTF-8.
    string functional?;
    # General notes on the idea. This field accepts HTML and is stored as UTF-8.
    string notes?;
    # The state of the idea.
    string state?;
};

# User link information.
public type UserLink record {
    # Numeric ID of the user.
    int id?;
    # User name of the user.
    string username?;
    # Name of the user that can be shown in an UI.
    string display_name?;
};

public type TagLink record {
    # ID of the tag.
    string id?;
    # Tag name.
    string tag?;
    # Date time when the tag was added to the object.
    string added?;
};

public type InlineResponse2001 Idea|IdeaExpanded;

public type RoadmaplinkProducts record {
    # ID of the associated product.
    int id?;
};

public type IdeastatuschangeresponseStatuses record {
    # Numeric ID of the status.
    int id?;
    # When the idea was switched to the workflow status.
    string added?;
};

public type StatusListing record {
    # ID of the status.
    int id?;
    # The status name.
    string status?;
    # When the status was added.
    string created_at?;
    # When the status was updated.
    string updated_at?;
};

public type InlineResponse2003 ProductList|ProductListGroup;

public type Tag record {
    # ID of the tag.
    string id?;
    # Tag name.
    string tag?;
    # When the tag was created.
    string created_at?;
    # When the tag was last updated.
    string updated_at?;
};

public type InlineResponse2002 Comment|CommentWithDesign|CommentWithThought;

public type Company record {
    # UUID of the company.
    string id?;
    # Name of the company.
    string name?;
    # The city of the company.
    string? city?;
    # ISO Alpha-2 two letter country code.
    string? country?;
    # The number of employees.
    string? size?;
    # The value of the company.
    string? value?;
    # The URL to the logo/image that represents the company in the UI.
    string? image?;
    TagLink[] tags?;
    ExternalLink[] external_links?;
    # When the company was created.
    string created_at?;
    # When the company details were last updated.
    string updated_at?;
};

public type FeedbackListing record {
    *Feedback;
    # State of the feedback
    string state?;
    ContactLink customer?;
    # User link information.
    UserLink? added_by?;
};

public type CompanyList record {
    # Whether the API call worked.
    string success?;
    # Number of companies that match the filters.
    int company_count?;
    # Page number of results.
    int page?;
    # Number of items per page. Default is 100
    int size?;
    CompanylistFilters filters?;
    CompanylistInclude include?;
    (Company|CompanyWithContacts|CompanyWithContactsFeedback)[] companies?;
};

# Photo or image of contact
public type ContactImage record {
    # URL to the original image of contact.
    string original?;
    # Resized image of the contact.
    string large?;
};

public type CompanyPost record {
    # Name of the company.
    string name?;
    # City the company is located in or you want to tag with.
    string city?;
    # ISO Alpha-2 two letter country code.
    string country?;
    # The size of the company by employees
    string size?;
    # The value of the company.
    string value?;
    (TagIdPostLink|TagNamePostLink)[] tags?;
    ExternalUrlPost[] external_links?;
    ContactIdPostLink[] contacts?;
};

public type IdeaputBusinessCase record {
    # The problem or hypothesis this idea focuses on. This field accepts HTML and is stored as UTF-8.
    string problem?;
    # The value to user and company to address the problem. This field accepts HTML and is stored as UTF-8.
    string value?;
};

public type Attachment record {
    # ID of the file attachment.
    int id?;
    # Name of the file attachment.
    string name?;
    # Url to the file attachment.
    string url?;
    # When the attachment was added to another object.
    string added?;
};

public type SearchResults record {
    # The query that was searched on.
    string query?;
    # The filters applied.
    record {} filter?;
    # The page number of results.
    int page?;
    # The number of results per page.
    int size?;
    # The list of ideas that match the query and filters.
    SearchresultsIdeas ideas?;
    # The list of products that match the query and filters.
    SearchresultsProducts products?;
    # The list of personas of that match the query and filters.
    SearchresultsPersonas personas?;
    # The feedback that matches the query and filters.
    SearchresultsFeedback feedback?;
};

public type ProductIdPostLink record {
    # Numeric ID of the product to link to an object when creating.
    int id;
};

public type ProductlineLink record {
    # ID of productline.
    int id?;
    # Name of productline.
    string name?;
    RoadmapLink[] roadmaps?;
    # When the product line was created.
    string created_at?;
};

public type ProductListing record {
    # Numeric product ID.
    int id?;
    # UUID of the product.
    string product_id?;
    # Name of the product.
    string name?;
    # Description of the product. This field can contain HTML markup and UTF-8 character codes.
    string description?;
    ProductImage? image?;
    ProductlistingRoadmaps roadmaps?;
    ProductlistingProductlines productlines?;
    # Order of product in portfolio .
    string 'order?;
    # When the product was created.
    string created_at?;
    # When the product details were last updated.
    string updated_at?;
};

public type ProductNamePostLink record {
    # Name of the product to link to an object when creating. It must match exactly.
    string name;
};

public type CompanyWithContacts record {
    *Company;
    CompanyContact[] contacts;
};

public type RoadmapCard record {
    # ID of the Roamdap card.
    int id?;
    # Title of the roadmap card.
    string title?;
    # Roadmap card description. This field can contain HTML markup and UTF-8 character codes.
    string description?;
    RoadmapcardColumn column?;
    RoadmapcardRoadmap roadmap?;
};

public type ContactLinkWithFeedback record {
    *ContactLink;
    Feedback[] feedbacks?;
};

public type AccountLink record {
    # ID of the account.
    int id?;
    # Slug for the account (not used).
    string slug?;
    # The name of the account.
    string name?;
};

public type ProductlistingRoadmaps record {
    # ID of the product roadmap.
    int id?;
};

public type SearchProduct record {
    # ID of the product.
    int id?;
    # Name of the product.
    string name?;
};

public type IdeaLinkPipeline record {
    # ID of idea.
    string id?;
    # Title of the idea.
    string title?;
    # Description of the idea. This field can contain HTML markup and UTF-8 character codes.
    string description?;
    # State of the idea.
    string state?;
    StatusLink status?;
    # When the idea was added to roadmap card.
    string added?;
    # Order of idea on the card.
    int 'order?;
};

public type ObjectiveLink record {
    # UUID of objective.
    string id?;
    # Name of objective.
    string name?;
    # State of objective (active or archived).
    string state?;
    # When the objective was linked.
    string added?;
};

public type IdeaList record {
    # Whether the call worked or not.
    boolean success?;
    # The number of ideas that match the filters.
    int idea_count?;
    # Page number of the results.
    int page?;
    # The number of results per page.
    int size?;
    Idea[] ideas?;
};

# Search idea
public type SearchIdea record {
    # ID of the idea.
    int id?;
    # The displayed ID of the idea.
    int project_id?;
    # Title of the idea.
    string title?;
    # The description of the idea. This field can contain HTML markup and UTF-8 character codes.
    string summary?;
};

public type IdeaPost record {
    # The title of the idea. Either the title or description is required.
    string title?;
    # The description of the idea. This field accepts HTML and is stored as UTF-8.
    string description?;
    # Numeric ID of a user that has a role in the account.
    int creator?;
    IdeapostBusinessCase business_case?;
    # The functional specs of how this idea could be implemented. This field accepts HTML and is stored as UTF-8.
    string functional?;
    # Free text field for notes on the idea. This field accepts HTML and is stored as UTF-8.
    string notes?;
    IdeaStoryPost[] user_stories?;
    IdeaCommentPost[] comments?;
    FeedbackPostLink[] Feedbacks?;
    (ProductIdPostLink|ProductNamePostLink)[] products?;
    (PersonaIdPostLink|PersonaNamePostLink)[] personas?;
    (TagIdPostLink|TagNamePostLink)[] tags?;
    ExternalUrlIdeaPost[] external_links?;
    IdeapostStatus status?;
    # Set the state of the idea to active, archived or unsorted.
    string state?;
};

public type IdeapostStatus record {
    # ID of the workflow status. This can be retrieved from GET /statuses.
    int id?;
};

public type ExternalLink record {
    # ID of the external link.
    int id?;
    # Name of the external link.
    string name?;
    # The URL of the external link.
    string url?;
    # An ID from another 3rd party application
    string external_id?;
    # When the external link was added to another object.
    string added?;
};

# Quick yay, nay or maybe on an idea.
public type Thought record {
    # ID of the thought.
    int id?;
    # User link information.
    UserLink? voter?;
    # Comment
    ThoughtComments comments?;
    # When the thought was added.
    string created_at?;
};

public type ExternalUrlPost record {
    # Name/title of the URL.
    string name;
    # The URL of the external link.
    string url;
    # The ID for the object in a 3rd party application
    string external_id?;
};

public type ContactlistFilters record {
    # Comma separate list of tags filtered on.
    string? tags?;
    # Comma separated list of personas filtered on.
    string? persona?;
    # ID of the company filtered on.
    string? company?;
    # ID of the job role filtered on.
    string? job_role?;
};

public type Objective record {
    # UUID of objective.
    string id?;
    # Objective name.
    string name?;
    # Whether the objective is active or archived.
    string state?;
    ObjectiveProduct product?;
    # When the objective was added.
    string created_at?;
    # When the objective was last updated.
    string updated_at?;
};

public type Roadmap RoadmapColumn[];

public type ObjectiveProduct record {
    # The ID of the product the objective belongs too.
    int id?;
};

public type PersonaLink record {
    # ID of the persona.
    int id?;
    # name of the persona.
    string persona?;
    # When the presona was linked to the object.
    string added?;
};

public type CompanyWithContactsFeedback record {
    *Company;
    CompanyContactWithFeedback[] contacts;
};

# Photo or image of contact.
public type CompanycontactImage record {
    # URL to the original image of contact.
    string original?;
    # Resized image of the contact.
    string large?;
};

public type RoadmapcardpostresponseProduct record {
    # ID of the product that the roadmap belongs to.
    int id?;
};

public type ContactlistIncludes record {
    # Whether to return the feedbacks for each contact.
    boolean feedbacks?;
    # Depreciated
    boolean numeric_id?;
};

public type StatusLink record {
    # ID of the status.
    int id?;
    # Status name.
    string status?;
};

public type CommentList (Comment|CommentWithThought|CommentWithDesign)[];

public type ObjectiveIdLink record {
    # The UUID of the objective.
    string id?;
};

public type RoadmapcardpostresponseAccount record {
    # Account ID for the roadmap card.
    string id?;
};

public type RoadmapColumn record {
    # ID of the roadmap column.
    int id?;
    # Column title.
    string title?;
    RoadmapCardColumn[] cards?;
    # Column position on the roadmap.
    int column_number?;
    RoadmapcolumnProducts products?;
    # When the column was created.
    string created_at?;
    # When the column details were last updated.
    string updated_at?;
};

# A file.
public type File record {
    # ID of the file.
    int id?;
    # Name of the file.
    string name?;
};

public type FeedbackPostLink record {
    # Numeric id of the feedback to link to an object when creating.
    string id;
};

public type IdeaLinkWithAdded record {
    *IdeaLink;
    # When the idea was associated to the object.
    string added?;
};

public type User record {
    # ID of user.
    int id?;
    # Username of user. (depreciated and not used)
    string username?;
    # Displayable name for the user.
    string display_name?;
    # Email of user.
    string email?;
    # Role ID.
    string role_id?;
    # The role type of the user.
    string role_type?;
    UserImage? image?;
};

public type PersonaIdPostLink record {
    # Numeric ID of the persona to link to an object when creating.
    int id;
};

public type ProductImage record {
    # URL of the product image.
    string original?;
};

public type ProductListGroup record {
    Productline[] productlines?;
    ProductListing[] products?;
    # Count of products.
    string product_count?;
};

public type InlineResponse200 Contact|ContactWithFeedback;

public type ProductlistingProductlines record {
    # ID of productline a product is in.
    int id?;
    # Name of product line.
    string name?;
    # Order of the product in the product line.
    string 'order?;
};

# The feedback that matches the query and filters.
public type SearchresultsFeedback record {
    # The count of pieces of feedback that match the query and filters.
    int count?;
    # Search feedback
    SearchFeedback[] results?;
};

# Any comment added when changing the status.
public type IdeastatuschangeresponseComments record {
    # ID of the comment.
    int id?;
    # The comment. This field may contain HTML and UTF-8 characters.
    string comment?;
    # When the comment was created.
    string created_at?;
};

public type ContactLink record {
    # ID of the contact.
    int id?;
    # Name of the contact.
    string name?;
    # Email of the contact.
    string email?;
    # Details about the contact.
    string about?;
    CompanyLink? company?;
    JobRoleLink? job_role?;
    # When the contact was added to the account.
    string created_at?;
    # When the contact was last updated.
    string updated_at?;
};

public type UserStory record {
    # ID of the user story.
    int id?;
    # Title of the user story.
    string title?;
    # The details of the user story. This field can contain HTML markup and UTF-8 character codes.
    string story?;
    # The acceptance criteria that indicate the user story has been achieved. This field can contain HTML markup and UTF-8 character codes.
    string acceptance_criteria?;
    # When the user story was created.
    string created_at?;
    # When the user story was last updated.
    string updated_at?;
};

public type Productline record {
    # ID of the product line.
    string id?;
    # Name of the product line.
    string name?;
    # When the product line was created.
    string created_at?;
    ProductListing[] products?;
};

public type RelatedIdeas record {
    Idea[] related?;
    Idea[] duplicate?;
};

public type PersonalistingImage record {
    # URL of the persona image.
    string original?;
};

public type FeedbackLink record {
    # Feedback id.
    int id?;
    # The feedback. This field can contain HTML markup and UTF-8 character codes.
    string feedback?;
    # The source or channel that the feedback was received by.
    string 'source?;
    # Whether the feedback is unsorted, active or archived.
    string state?;
    # When the feedback was added to the account.
    string created_at?;
    # When the feedback was last updated.
    string updated_at?;
};

public type Feedback record {
    # Feedback id.
    int id?;
    # The feedback. This field can contain HTML markup and UTF-8 character codes.
    string feedback?;
    # The source or channel that the feedback was received through.
    string 'source?;
    # When the feedback was added to the account.
    string created_at?;
    # When the feedback was last updated.
    string updated_at?;
    # List of associated tags.
    TagLink[] tags?;
    # List of associated ideas.
    IdeaLinkWithAdded[] ideas?;
    # List of associated products.
    ProductLink[] products?;
    # List of associated personas.
    PersonaLink[] personas?;
    # List of attachments.
    Attachment[] attachments?;
    # List of external links.
    ExternalLink[] external_links?;
};

public type TagList Tag[];

public type IdeapostBusinessCase record {
    # The problem or hypothesis this idea is aiming to address. This field accepts HTML and is stored as UTF-8.
    string problem?;
    # The value of solving this problem or hypothesis to the user and the company. This field accepts HTML and is stored as UTF-8.
    string value?;
};

public type IdeaExpanded record {
    *Idea;
    IdeaexpandedBusinessCase business_case?;
    # The functional specs for this idea. It is a free text field. This field can contain HTML markup and UTF-8 character codes.
    string functional_spec?;
    # Notes on the idea. It is a free text field. This field can contain HTML markup and UTF-8 character codes.
    string notes?;
    Status? status?;
    # User link information.
    UserLink? owner?;
    # User link information.
    UserLink? author?;
    # List of associated tags.
    TagLink[] tags?;
    # List of associated products.
    ProductLink[] products?;
    # List of associated personas.
    PersonaLink[] personas?;
    # List of comments made on the idea.
    Comment[] comments?;
    # List of associated user stories.
    UserStory[] userstories?;
    # List of associated external links.
    ExternalLink[] external_links?;
    # List of roadmap cards the idea is associated to.
    RoadmapCard[] roadmap_cards?;
    # List of thoughts on an idea.
    IdeaThoughts votes?;
    # List of all the associated mockups and designs.
    Design[] mockups?;
    # List of files associated to the idea.
    File[] files?;
};

public type UserList User[];

public type RoadmapCardPostResponse record {
    *RoadmapCard;
    RoadmapcardpostresponseAccount account?;
    RoadmapcardpostresponseProduct product?;
    TagLink[] tags?;
    ObjectiveIdLink[] ojectives?;
};

public type UserPost record {
    # The email of the user.
    string email?;
    # Role of the user in the account.
    string role_type?;
    # The name to display for the user in the UI.
    string name?;
    # Timezone of the user using the format like Europe/London.
    string timezone?;
};

public type CommentWithThought record {
    *Comment;
    CommentwiththoughtVote vote?;
};

public type Comment record {
    # ID of the comment.
    int id?;
    # The comment. This field can contain HTML markup and UTF-8 character codes.
    string comment?;
    # User link information.
    UserLink? created_by?;
    # When the comment was created.
    string created_at?;
    # Replies to the original comment.
    Comment[] replies?;
};

public type SpecLinkPipeline record {
    # ID of the user story.
    string id?;
    # The user story. This field can contain HTML markup and UTF-8 character codes.
    string story?;
    # Acceptance criteria for the story. This field can contain HTML markup and UTF-8 character codes.
    string acceptance_critiera?;
    # When the user story was added to the roadmap card.
    string added?;
    # Order of the user story on the card.
    int 'order?;
};

public type ThoughtPostResponse record {
    # Numeric ID of the thought
    int id?;
    # The thought type
    string vote?;
    IdeaLink ideas?;
    ThoughtpostresponseComments comments?;
    # When the thought was created
    string created_at?;
    # When the thought was last updated.
    string updated_at?;
};

public type CompanylistFilters record {
    # Comma separate list of tags filtered on.
    string? tags?;
    # the size of the company filtered on.
    string? size?;
    # the value of the company filtered on.
    string? value?;
    # ISO Alpha-2 two letter country code filtered on.
    string? country?;
    # City filtered on.
    string? city?;
};

public type JobRoleList JobRole[];

# List of thoughts on an idea.
public type IdeaThoughts record {
    # All the users who indicated yea on the idea.
    Thought[] yea?;
    # All the users who indicated nay on the idea.
    Thought[] nay?;
    # All the users who indicated maybe on the idea.
    Thought[] maybe?;
};

# Comment
public type ThoughtComments record {
    # ID of the comment associated to the thought.
    int id?;
    # The comment with the though. This field can contain HTML markup and UTF-8 character codes.
    string comment?;
};

public type IdeaStoryPost record {
    # The main body of a user story. This field accepts HTML and is stored as UTF-8.
    string story?;
    # The acceptance criteria for passing tests. This field accepts HTML and is stored as UTF-8.
    string acceptance_criteria?;
};

public type RoadmapLink record {
    # ID of roadmap.
    string id?;
    # Name of roadmap.
    string name?;
    RoadmaplinkProducts products?;
    # When the roadmap was created.
    string created_at?;
};

public type CompanyLink record {
    # UUID of the company.
    string id?;
    # Name of the company.
    string name?;
    # City the company is in.
    string city?;
    # The ISO Alpha-2 country code.
    string country?;
    # The relative size of the company.
    string size?;
    # The value of the company as a client.
    string value?;
    # URL to the company logo.
    string image?;
    # When when the company was added to the account.
    string created_at?;
    # When when the company details were last updated.
    string updated_at?;
};

public type Contact record {
    # ID of the contact.
    string id?;
    # Name of the contact.
    string name?;
    # Email of the contact.
    string email?;
    # Details about the contact. This field can contain HTML markup and UTF-8 character codes.
    string? about?;
    # Contact's phone number.
    string? phone?;
    # Contact's twitter handle.
    string? twitter_url?;
    # Photo or image of contact
    ContactImage? image?;
    JobRoleLink? job_role?;
    CompanyLink? company?;
    TagLink[] tags?;
    PersonaLink[] personas?;
    ExternalLink[] external_links?;
    # When the contact was added to the account.
    string created_at?;
    # When the contact was last updated
    string updated_at?;
};

public type FeedbackPut record {
    # Update to the actual feedback. This field accepts HTML and is stored as UTF-8.
    string feedback?;
    # The state of the feedback.
    string state?;
    ExternalUrlPost[] external_links?;
};

public type UserStoryWithIdea record {
    *UserStory;
    IdeaLink ideas?;
};

public type UserStories UserStory[];

public type IdeaStatusChangeResponse record {
    # Numeric ID of the idea
    int id?;
    IdeastatuschangeresponseStatuses statuses?;
    # Any comment added when changing the status.
    IdeastatuschangeresponseComments comments?;
};

public type IdeaCommentPost record {
    # The comment someone has made on the idea. This field accepts HTML and is stored as UTF-8.
    string comment?;
    # Numeric ID of the user in ProdPad who is making the comment.
    int user_id?;
};

public type CompanyContactWithFeedback record {
    *CompanyContact;
    FeedbackLink[] feedbacks;
};

public type RoadmapCardPost record {
    # The title of the roadmap card.
    string title?;
    # Numeric roadmap ID.
    int roadmap_id?;
    # Numeric column ID. This can be found using GET /roadmaps/{id}.
    int column_id?;
    # The description of the problem(s) and/or hypothesis this card is about. This field accepts HTML and is stored as UTF-8.
    string description?;
    (TagIdPostLink|TagNamePostLink)[] tags?;
    RoadmapcardpostObjectives[] objectives?;
};

public type RoadmapcolumnProducts record {
    # Product ID.
    int id?;
};

public type TagIdPostLink record {
    # Numeric id of the tag to link to an object when creating.
    string id;
};

public type RoadmapcardRoadmap record {
    # ID of the roadmap.
    string id?;
};
