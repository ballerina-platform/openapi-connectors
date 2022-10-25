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
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
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

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://api.figshare.com/v2/token";
|};

public type ArticleArr Article[];

public type AccountReportArr AccountReport[];

public type AuthorArr Author[];

public type CategoryArr Category[];

public type PrivateFileArr PrivateFile[];

public type PrivateLinkArr PrivateLink[];

public type CollectionArr Collection[];

public type FundingInformationArr FundingInformation[];

public type ShortAccountArr ShortAccount[];

public type GroupEmbargoOptionsArr GroupEmbargoOptions[];

public type GroupArr Group[];

public type RoleArr Role[];

public type LicenseArr License[];

public type ProjectPrivateArr ProjectPrivate[];

public type ProjectCollaboratorArr ProjectCollaborator[];

public type ProjectNoteArr ProjectNote[];

public type PublicFileArr PublicFile[];

public type ArticleVersionsArr ArticleVersions[];

public type CollectionVersionsArr CollectionVersions[];

public type ProjectArr Project[];

public type Account record {
    # Account activity status
    int active?;
    # Date when account was created
    string created_date?;
    # User email
    string email?;
    # First Name
    string first_name?;
    # Account group id
    int group_id?;
    # Account id
    int id?;
    # Account institution
    int institution_id?;
    # Account institution user id
    string institution_user_id?;
    # Last Name
    string last_name?;
    # Maximum upload size for account
    int maximum_file_size?;
    # Date of last account modification
    string modified_date?;
    # True if a quota request is pending
    boolean pending_quota_request?;
    # Account quota
    int quota?;
    # Account total used quota
    int used_quota?;
    # Account used private quota
    int used_quota_private?;
    # Account public used quota
    int used_quota_public?;
};

public type FundingCreate record {
    # A funding ID as returned by the Funding Search endpoint
    int id?;
    # The title of the new user created funding
    string title?;
};

public type CollectionPrivateLinkCreator record {
    # Date when this private link should expire - optional. By default private links expire in 365 days.
    string expires_date?;
    # Optional, default true. Set to false to give private link users editing rights for this collection.
    boolean read_only?;
};

public type ProjectCreate record {
    # Project description
    @constraint:String {maxLength: 10000}
    string description?;
    # Grant number or organization(s) that funded this project. Up to 2000 characters permitted.
    string funding?;
    # Funding creation / update items
    FundingCreate[] funding_list?;
    # Only if project type is group.
    int group_id?;
    # The title for this project - mandatory. 3 - 1000 characters.
    @constraint:String {maxLength: 1000, minLength: 3}
    string title;
};

public type License record {
    # License name
    string name?;
    # License url
    string url?;
    # License value
    int value?;
};

public type ProjectCompletePrivate ProjectPrivate;

public type PrivateArticleSearch ArticleSearch;

public type CollectionDOI record {
    # Reserved DOI
    string doi?;
};

public type Institution record {
    # Institution domain
    string? domain?;
    # Institution id
    int id?;
    # Institution name
    string name?;
};

public type AuthorComplete Author;

public type AccountCreate record {
    # Email of account
    @constraint:String {maxLength: 150, minLength: 3}
    string email;
    # First Name
    @constraint:String {maxLength: 30}
    string first_name = "";
    # Not applicable to regular users. This field is reserved to institutions/publishers with access to assign to specific groups
    int group_id?;
    # Institution user id
    @constraint:String {maxLength: 50}
    string institution_user_id = "";
    # Is account active
    boolean is_active?;
    # Last Name
    @constraint:String {maxLength: 30}
    string last_name;
    # Account quota
    int quota?;
    # Symplectic user id
    @constraint:String {maxLength: 50}
    string symplectic_user_id = "";
};

public type FileCreator record {
    # Url for an existing file that will not be uploaded to Figshare
    string link?;
    # MD5 sum pre-computed on client side.
    string md5?;
    # File name including the extension; can be omitted only for linked files.
    string name?;
    # File size in bytes; can be omitted only for linked files.
    int size?;
};

public type PrivateLink record {
    # Date when link will expire
    string expires_date?;
    # Private link id
    string id?;
    # True if private link is active
    boolean is_active?;
};

public type PrivateFile PublicFile;

public type ProjectPrivate Project;

public type AccountGroupRoles record {
};

public type PrivateAuthorsSearch record {
    # Return only authors in this group or subgroups of the group
    int group_id?;
    # Return only authors associated to this institution
    int institution_id?;
    # Return only active authors if True
    boolean is_active?;
    # Return only authors that have published items if True
    boolean is_public?;
    # Number of results included on a page. Used for pagination with query
    @constraint:Int {minValue: 1, maxValue: 1000}
    int 'limit?;
    # Where to start the listing(the offset of the first result). Used for pagination with limit
    @constraint:Int {maxValue: 5000}
    int offset?;
    # Orcid of author
    string orcid?;
    # The field by which to order. Default varies by endpoint/resource.
    string 'order?;
    # Sorting order (desc or asc)
    string order_direction?;
    # Page number. Used for pagination with page_size
    @constraint:Int {minValue: 1, maxValue: 5000}
    int page?;
    # The number of results included on a page. Used for pagination with page
    @constraint:Int {minValue: 1, maxValue: 1000}
    int page_size?;
    # Search term
    string search_for?;
};

public type ArticleCompletePrivate ArticleComplete;

public type ProjectNotePrivate ProjectNote;

public type UploadInfo record {
    # md5 provided on upload initialization
    string md5?;
    # name of file on upload server
    string name?;
    # Uploads parts
    UploadFilePart[] parts?;
    # size of file in bytes
    int size?;
    # Upload status
    string status?;
    # token received after initializing a file upload
    string token?;
};

public type ProjectComplete Project;

public type ConfidentialityCreator record {
    # Reason for confidentiality
    string reason?;
};

public type FundingSearch record {
    # Search term
    string search_for?;
};

public type GroupEmbargoOptions record {
    # Embargo option id
    int id?;
    # IP range name; value appears if type is ip_range
    string ip_name?;
    # Embargo permission type
    string 'type?;
};

public type ProjectCollaboratorInvite record {
    # Text sent when inviting the user to the project
    string comment?;
    # Collaborator email
    string email?;
    # Role of the the collaborator inside the project
    string role_name;
    # User id of the collaborator
    int user_id?;
};

public type ResponseMessage record {
    # Response message text
    string message?;
};

public type ArticleConfidentiality record {
    # True if article is confidential
    boolean is_confidential?;
    # Reason for confidentiality
    string reason?;
};

public type PrivateLinkCreator record {
    # Date when this private link should expire - optional. By default private links expire in 365 days.
    string expires_date?;
};

public type ArticleDOI record {
    # Reserved DOI
    string doi?;
};

public type HrfeedUploadBody record {
    # You can find an example in the Hr Feed section
    string hrfeed?;
};

public type Role record {
    # Role category
    string category?;
    # Role description
    string description?;
    # Role id
    int id?;
    # Role name
    string name?;
};

public type Project record {
    # Project id
    int id?;
    # Date when project was published
    string? published_date?;
    # Project title
    string title?;
    # Api endpoint
    string url?;
};

public type CurationComment record {
    # The ID of the account which generated this comment.
    int account_id?;
    # The ID of the comment.
    int id?;
    # The value/content of the comment.
    string text?;
    # The ID of the account which generated this comment.
    string 'type?;
};

public type AccountUpdate record {
    # Not applicable to regular users. This field is reserved to institutions/publishers with access to assign to specific groups
    int group_id?;
    # Is account active
    boolean is_active?;
};

public type ArticleProjectCreate record {
    # List of authors to be associated with the article. The list can contain the following fields: id, name, first_name, last_name, email, orcid_id. If an id is supplied, it will take priority and everything else will be ignored. No more than 10 authors. For adding more authors use the specific authors endpoint.
    record {}[] authors = [];
    # List of category ids to be associated with the article(e.g [1, 23, 33, 66])
    int[] categories = [];
    # List of key, values pairs to be associated with the article
    record {} custom_fields?;
    # <b>One of:</b> <code>figure</code> <code>online resource</code> <code>preprint</code> <code>book</code> <code>conference contribution</code> <code>media</code> <code>dataset</code> <code>poster</code> <code>journal contribution</code> <code>presentation</code> <code>thesis</code> <code>software</code>
    string defined_type?;
    # The article description. In a publisher case, usually this is the remote article description
    @constraint:String {maxLength: 10000}
    string description = "";
    # Not applicable for regular users. In an institutional case, make sure your group supports setting DOIs. This setting is applied by figshare via opening a ticket through our support/helpdesk system.
    string doi = "";
    # Grant number or funding authority
    string funding = "";
    # Funding creation / update items
    FundingCreate[] funding_list?;
    # Not applicable for regular users. In an institutional case, make sure your group supports setting Handles. This setting is applied by figshare via opening a ticket through our support/helpdesk system.
    string 'handle = "";
    # List of tags to be associated with the article. Tags can be used instead
    string[] keywords = [];
    # License id for this article.
    int license = 0;
    # List of links to be associated with the article (e.g ["http://link1", "http://link2", "http://link3"])
    string[] references = [];
    # Not applicable to regular users. In a publisher case, this is the publisher article DOI.
    string resource_doi = "";
    # Not applicable to regular users. In a publisher case, this is the publisher article title.
    string resource_title = "";
    # List of tags to be associated with the article. Keywords can be used instead
    string[] tags = [];
    TimelineUpdate timeline?;
    # Title of article
    @constraint:String {maxLength: 1000, minLength: 3}
    string title;
};

public type CollectionCreate record {
    # List of articles to be associated with the collection
    int[] articles?;
    # List of authors to be associated with the article. The list can contain the following fields: id, name, first_name, last_name, email, orcid_id. If an id is supplied, it will take priority and everything else will be ignored. No more than 10 authors. For adding more authors use the specific authors endpoint.
    record {}[] authors = [];
    # List of category ids to be associated with the article(e.g [1, 23, 33, 66])
    int[] categories = [];
    # List of key, values pairs to be associated with the article
    record {} custom_fields?;
    # The article description. In a publisher case, usually this is the remote article description
    @constraint:String {maxLength: 10000}
    string description = "";
    # Not applicable for regular users. In an institutional case, make sure your group supports setting DOIs. This setting is applied by figshare via opening a ticket through our support/helpdesk system.
    string doi = "";
    # Grant number or funding authority
    string funding = "";
    # Funding creation / update items
    FundingCreate[] funding_list?;
    # Not applicable to regular users. This field is reserved to institutions/publishers with access to assign to specific groups
    int group_id?;
    # Not applicable for regular users. In an institutional case, make sure your group supports setting Handles. This setting is applied by figshare via opening a ticket through our support/helpdesk system.
    string 'handle = "";
    # List of tags to be associated with the article. Tags can be used instead
    string[] keywords = [];
    # List of links to be associated with the article (e.g ["http://link1", "http://link2", "http://link3"])
    string[] references = [];
    # Not applicable to regular users. In a publisher case, this is the publisher article DOI.
    string resource_doi = "";
    # Not applicable to regular users. In a publisher case, this is the publisher article id
    string resource_id?;
    # Not applicable to regular users. In a publisher case, this is the publisher article link
    string resource_link?;
    # Not applicable to regular users. In a publisher case, this is the publisher article title.
    string resource_title = "";
    # Not applicable to regular users. In a publisher case, this is the publisher article version
    int resource_version?;
    # List of tags to be associated with the article. Keywords can be used instead
    string[] tags = [];
    TimelineUpdate timeline?;
    # Title of article
    @constraint:String {maxLength: 1000, minLength: 3}
    string title;
};

public type Author record {
    # Author full name
    string full_name?;
    # Author id
    int id?;
    # True if author has published items
    boolean is_active?;
    # Author Orcid
    string orcid_id?;
    # Author url name
    string url_name?;
};

public type Collection record {
    # Collection DOI
    string doi?;
    # Collection Handle
    string 'handle?;
    # Collection id
    int id?;
    # Date when collection was published 
    string? published_date?;
    Timeline timeline?;
    # Collection title
    string title?;
    # Api endpoint
    string url?;
};

public type ArticleEmbargoUpdater record {
    # Date when the embargo expires and the article gets published, '0' value will set up permanent embargo
    string embargo_date;
    # List of embargo permissions to be associated with the article. The list must contain `id` and can also contain `group_ids`(a field that only applies to 'logged_in' permissions). The new list replaces old options in the database, and an empty list removes all permissions for this article. Administration permission has to be set up alone but logged in and IP range permissions can be set up together.
    record {}[] embargo_options?;
    # Reason for setting embargo
    string embargo_reason?;
    # Title for embargo
    string embargo_title?;
    # Embargo can be enabled at the article or the file level. Possible values: article, file
    string embargo_type;
    # Embargo status
    boolean is_embargoed;
};

public type ArticleVersions record {
    # Api endpoint for the item version
    string url?;
    # Version number
    int 'version?;
};

public type FileId record {
    # File ID
    int file_id?;
};

public type Group record {
    # HR code associated with group, if code exists
    string association_criteria?;
    # Group id
    int id?;
    # Group name
    string name?;
    # Parent group if any
    int parent_id?;
    # Group resource id
    string resource_id?;
};

public type Category record {
    # Category id
    int id?;
    # Parent category
    int parent_id?;
    # Category title
    string title?;
};

public type User record {
    # First Name
    string first_name?;
    # User id
    int id?;
    # Account activity status
    boolean is_active?;
    # Account public status
    boolean is_public?;
    # User Job title
    string job_title?;
    # Last Name
    string last_name?;
    # Full Name
    string name?;
    # Orcid associated to this User
    string orcid_id?;
    # Name that appears in website url
    string url_name?;
};

public type ArticleCreate record {
    # List of authors to be associated with the article. The list can contain the following fields: id, name, first_name, last_name, email, orcid_id. If an id is supplied, it will take priority and everything else will be ignored. No more than 10 authors. For adding more authors use the specific authors endpoint.
    record {}[] authors = [];
    # List of category ids to be associated with the article(e.g [1, 23, 33, 66])
    int[] categories = [];
    # List of key, values pairs to be associated with the article
    record {} custom_fields?;
    # <b>One of:</b> <code>figure</code> <code>online resource</code> <code>preprint</code> <code>book</code> <code>conference contribution</code> <code>media</code> <code>dataset</code> <code>poster</code> <code>journal contribution</code> <code>presentation</code> <code>thesis</code> <code>software</code>
    string defined_type?;
    # The article description. In a publisher case, usually this is the remote article description
    @constraint:String {maxLength: 10000}
    string description = "";
    # Not applicable for regular users. In an institutional case, make sure your group supports setting DOIs. This setting is applied by figshare via opening a ticket through our support/helpdesk system.
    string doi = "";
    # Grant number or funding authority
    string funding = "";
    # Funding creation / update items
    FundingCreate[] funding_list?;
    # Not applicable to regular users. This field is reserved to institutions/publishers with access to assign to specific groups
    int group_id?;
    # Not applicable for regular users. In an institutional case, make sure your group supports setting Handles. This setting is applied by figshare via opening a ticket through our support/helpdesk system.
    string 'handle = "";
    # List of tags to be associated with the article. Tags can be used instead
    string[] keywords = [];
    # License id for this article.
    int license = 0;
    # List of links to be associated with the article (e.g ["http://link1", "http://link2", "http://link3"])
    string[] references = [];
    # Not applicable to regular users. In a publisher case, this is the publisher article DOI.
    string resource_doi = "";
    # Not applicable to regular users. In a publisher case, this is the publisher article title.
    string resource_title = "";
    # List of tags to be associated with the article. Keywords can be used instead
    string[] tags = [];
    TimelineUpdate timeline?;
    # Title of article
    @constraint:String {maxLength: 1000, minLength: 3}
    string title;
};

public type Article record {
    # Type of article identificator
    int defined_type?;
    # Name of the article type identificator
    string defined_type_name?;
    # DOI
    string doi?;
    # Group ID
    decimal? group_id?;
    # Handle
    string 'handle?;
    # Unique identifier for article
    int id?;
    # Posted date
    string? published_date?;
    # Thumbnail image
    string thumb?;
    Timeline timeline?;
    # Title of article
    string title?;
    # Api endpoint for article
    string url?;
    # Private Api endpoint for article
    string url_private_api?;
    # Private site endpoint for article
    string url_private_html?;
    # Public Api endpoint for article
    string url_public_api?;
    # Public site endpoint for article
    string url_public_html?;
};

public type ProjectsSearch CommonSearch;

public type CustomArticleField record {
    # True if field completion is mandatory
    boolean? is_mandatory?;
    # Custom  metadata name
    string name?;
    # Custom metadata value
    string value?;
};

public type CollectionVersions record {
    # Version number
    int id?;
    # Api endpoint for the collection version
    string url?;
};

public type ArticleHandle record {
    # Reserved Handle
    string 'handle?;
};

public type ProjectUpdate record {
    # Project description
    @constraint:String {maxLength: 10000}
    string description?;
    # Grant number or organization(s) that funded this project. Up to 2000 characters permitted.
    string funding?;
    # Funding creation / update items
    FundingCreate[] funding_list?;
    # The title for this project - mandatory. 3 - 1000 characters.
    @constraint:String {maxLength: 1000, minLength: 3}
    string title?;
};

public type CollectionComplete Collection;

public type CurationCommentCreate record {
    # The contents/value of the comment
    @constraint:String {maxLength: 2000, minLength: 1}
    string text;
};

public type InstitutionAccountsSearch record {
    # filter by email
    string email?;
    # filter by institution_user_id
    string institution_user_id?;
    # Filter by active status
    @constraint:Int {maxValue: 1}
    int is_active?;
    # Number of results included on a page. Used for pagination with query
    @constraint:Int {minValue: 1, maxValue: 1000}
    int 'limit?;
    # Where to start the listing(the offset of the first result). Used for pagination with limit
    @constraint:Int {maxValue: 5000}
    int offset?;
    # Page number. Used for pagination with page_size
    @constraint:Int {minValue: 1, maxValue: 5000}
    int page?;
    # The number of results included on a page. Used for pagination with page
    @constraint:Int {minValue: 1, maxValue: 1000}
    int page_size?;
    # Search term
    string search_for?;
};

public type ProjectCollaborator record {
    # Collaborator name
    string name?;
    # Collaborator role
    string role_name?;
    # Status of collaborator invitation
    string status?;
    # Collaborator id
    int user_id?;
};

public type ArticleSearch CommonSearch;

public type ShortAccount record {
    # Account activity status
    int active?;
    # User email
    string email?;
    # First Name
    string first_name?;
    # Account id
    int id?;
    # Account institution
    int institution_id?;
    # Account institution user id
    string institution_user_id?;
    # Last Name
    string last_name?;
};

public type ProjectArticle Article;

public type AccountGroupRolesCreate record {
};

public type CategoriesCreator record {
    # List of category ids
    int[] categories;
};

public type CollectionUpdate record {
    # List of articles to be associated with the collection
    int[] articles?;
    # List of authors to be associated with the article. The list can contain the following fields: id, name, first_name, last_name, email, orcid_id. If an id is supplied, it will take priority and everything else will be ignored. No more than 10 authors. For adding more authors use the specific authors endpoint.
    record {}[] authors?;
    # List of category ids to be associated with the article(e.g [1, 23, 33, 66])
    int[] categories?;
    # List of key, values pairs to be associated with the article
    record {} custom_fields?;
    # The article description. In a publisher case, usually this is the remote article description
    @constraint:String {maxLength: 10000}
    string description?;
    # Not applicable for regular users. In an institutional case, make sure your group supports setting DOIs. This setting is applied by figshare via opening a ticket through our support/helpdesk system.
    string doi?;
    # Grant number or funding authority
    string funding?;
    # Funding creation / update items
    FundingCreate[] funding_list?;
    # Not applicable to regular users. This field is reserved to institutions/publishers with access to assign to specific groups
    int group_id?;
    # Not applicable for regular users. In an institutional case, make sure your group supports setting Handles. This setting is applied by figshare via opening a ticket through our support/helpdesk system.
    string 'handle?;
    # List of tags to be associated with the article. Tags can be used instead
    string[] keywords?;
    # List of links to be associated with the article (e.g ["http://link1", "http://link2", "http://link3"])
    string[] references?;
    # Not applicable to regular users. In a publisher case, this is the publisher article DOI.
    string resource_doi?;
    # Not applicable to regular users. In a publisher case, this is the publisher article id
    string resource_id?;
    # Not applicable to regular users. In a publisher case, this is the publisher article link
    string resource_link?;
    # Not applicable to regular users. In a publisher case, this is the publisher article title.
    string resource_title?;
    # Not applicable to regular users. In a publisher case, this is the publisher article version
    int resource_version?;
    # List of tags to be associated with the article. Keywords can be used instead
    string[] tags?;
    TimelineUpdate timeline?;
    # Title of article
    @constraint:String {maxLength: 1000, minLength: 3}
    string title?;
};

public type ProjectNoteCreate record {
    # Text of the note
    @constraint:String {minLength: 3}
    string text;
};

public type ArticlesCreator record {
    # List of article ids
    int[] articles;
};

public type TimelineUpdate record {
    # Online posted date
    string firstOnline?;
    # Date when the item was accepted for publication
    string publisherAcceptance?;
    # Publish date
    string publisherPublication?;
};

public type Curation record {
    # The ID of the account of the owner of the article of this review.
    int account_id?;
    # The ID of the article of this review.
    int article_id?;
    # The ID of the account to which this review is assigned.
    int assigned_to?;
    # The number of comments in the review.
    int comments_count?;
    # The creation date of the review.
    string created_date?;
    # The group in which the article is present.
    int group_id?;
    # The review id
    int id?;
    # The date the review has been modified.
    string modified_date?;
    # The last time a comment has been added to the review.
    string? review_date?;
    # The status of the review.
    string status?;
    # The Version number of the article in review.
    int 'version?;
};

public type FundingInformation record {
    # Funder's name
    string funder_name?;
    # The grant code
    string grant_code?;
    # Funding id
    int id?;
    # Return whether the grant has been introduced manually
    boolean is_user_defined?;
    # The funding name
    string title?;
    # The grant url
    string url?;
};

public type ProjectNote record {
    # Note Abstract - short/truncated content
    string 'abstract?;
    # Date when note was created
    string created_date?;
    # Project note id
    int id?;
    # Date when note was last modified
    string modified_date?;
    # User who wrote the note
    int user_id?;
    # Username of the one who wrote the note
    string user_name?;
};

public type PublicFile record {
    # File computed md5
    string computed_md5?;
    # Url for file download
    string download_url?;
    # File id
    int id?;
    # True if file is hosted somewhere else
    boolean is_link_only?;
    # File name
    string name?;
    # File size
    int size?;
    # File supplied md5
    string supplied_md5?;
};

public type CommonSearch record {
    # only return collections from this group
    int group?;
    # only return collections from this institution
    int institution?;
    # Number of results included on a page. Used for pagination with query
    @constraint:Int {minValue: 1, maxValue: 1000}
    int 'limit?;
    # Filter by article modified date. Will only return articles published after the date. date(ISO 8601) YYYY-MM-DD
    string modified_since?;
    # Where to start the listing(the offset of the first result). Used for pagination with limit
    @constraint:Int {maxValue: 5000}
    int offset?;
    # Sorting order (desc or asc)
    string order_direction?;
    # Page number. Used for pagination with page_size
    @constraint:Int {minValue: 1, maxValue: 5000}
    int page?;
    # The number of results included on a page. Used for pagination with page
    @constraint:Int {minValue: 1, maxValue: 1000}
    int page_size?;
    # Filter by article publishing date. Will only return articles published after the date. date(ISO 8601) YYYY-MM-DD
    string published_since?;
    # Search term
    string search_for?;
};

public type AccountReport record {
    # The ID of the account which generated this report.
    int account_id?;
    # Date when the AccountReport was requested
    string created_date?;
    # The download link for the generated XLSX
    string download_url?;
    # The group ID that was used to filter the report, if any.
    int group_id?;
    # A unique ID for the AccountRecord
    int id?;
    # Status of the report
    string status?;
};

public type ArticleComplete ProjectArticle;

public type ArticleUpdate record {
    # List of authors to be associated with the article. The list can contain the following fields: id, name, first_name, last_name, email, orcid_id. If an id is supplied, it will take priority and everything else will be ignored. No more than 10 authors. For adding more authors use the specific authors endpoint.
    record {}[] authors?;
    # List of category ids to be associated with the article(e.g [1, 23, 33, 66])
    int[] categories?;
    # List of key, values pairs to be associated with the article
    record {} custom_fields?;
    # <b>One of:</b> <code>figure</code> <code>online resource</code> <code>preprint</code> <code>book</code> <code>conference contribution</code> <code>media</code> <code>dataset</code> <code>poster</code> <code>journal contribution</code> <code>presentation</code> <code>thesis</code> <code>software</code>
    string defined_type?;
    # The article description. In a publisher case, usually this is the remote article description
    @constraint:String {maxLength: 10000}
    string description?;
    # Not appliable for regular users. In an institutional case, make sure your group supports setting DOIs. This setting is applied by figshare via opening a ticket through our support/helpdesk system.
    string doi?;
    # Grant number or funding authority
    string funding?;
    # Funding creation / update items
    FundingCreate[] funding_list?;
    # Not applicable to regular users. This field is reserved to institutions/publishers with access to assign to specific groups
    int group_id?;
    # Not appliable for regular users. In an institutional case, make sure your group supports setting Handles. This setting is applied by figshare via opening a ticket through our support/helpdesk system.
    string 'handle?;
    # List of tags to be associated with the article. Tags can be used instead
    string[] keywords?;
    # License id for this article.
    int license?;
    # List of links to be associated with the article (e.g ["http://link1", "http://link2", "http://link3"])
    string[] references?;
    # Not applicable to regular users. In a publisher case, this is the publisher article DOI.
    string resource_doi?;
    # Not applicable to regular users. In a publisher case, this is the publisher article title.
    string resource_title?;
    # List of tags to be associated with the article. Keywords can be used instead
    string[] tags?;
    TimelineUpdate timeline?;
    # Title of article
    @constraint:String {maxLength: 1000, minLength: 3}
    string title?;
};

public type CurationDetail Curation;

public type PrivateCollectionSearch CollectionSearch;

public type ArticleEmbargo record {
    # Date when embargo lifts
    string? embargo_date?;
    # List of embargo permissions that are associated with the article. If the type is logged_in and the group_ids list is empty, then the whole institution can see the article; if there are multiple group_ids, then only users that are under those groups can see the article.
    record {}[] embargo_options?;
    # Reason for embargo
    string embargo_reason?;
    # Title for embargo
    string embargo_title?;
    # Embargo type
    string? embargo_type?;
    # True if embargoed
    boolean is_embargoed?;
};

public type CollectionSearch CommonSearch;

public type Timeline TimelineUpdate;

public type UploadFilePart record {
    # Indexes on byte range. zero-based and inclusive
    int endOffset?;
    # When a part is being uploaded it is being locked, by setting the locked flag to true. No changes/uploads can happen on this part from other requests.
    boolean locked?;
    # File part id
    int partNo?;
    # Indexes on byte range. zero-based and inclusive
    int startOffset?;
    # part status
    string status?;
};

public type Collaborator record {
    # Collaborator name
    string name?;
    # Collaborator role
    string role_name?;
    # Collaborator id
    int user_id?;
};

public type CollectionHandle record {
    # Reserved Handle
    string 'handle?;
};

public type ErrorMessage record {
    # A machine friendly error code, used by the dev team to identify the error.
    int code?;
    # A human friendly message explaining the error.
    string message?;
};

public type AuthorsCreator record {
    # List of authors to be associated with the article. The list can contain the following fields: id, name, first_name, last_name, email, orcid_id. If an id is supplied, it will take priority and everything else will be ignored. No more than 10 authors. For adding more authors use the specific authors endpoint.
    record {}[] authors;
};

public type Location record {
    # Url for item
    string location?;
};
