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

# A paginated list of issue comments.
public type PaginatedIssueComments record {
    # Total number of objects in the response. This is an optional element that is not provided in all responses, as it can be expensive to compute.
    int size?;
    # Page number of the current results. This is an optional element that is not provided in all responses.
    int page?;
    # Current number of objects on the existing page. The default value is 10 with 100 being the maximum allowed value. Individual APIs may enforce different values.
    int pagelen?;
    # Link to the next page if it exists. The last page of a collection does not have this value. Use this link to navigate the result set and refrain from constructing your own URLs.
    string next?;
    # Link to previous page if it exists. A collections first page does not have this value. This is an optional element that is not provided in all responses. Some result sets strictly support forward navigation and never provide previous links. Clients must anticipate that backwards navigation is not always available. Use this link to navigate the result set and refrain from constructing your own URLs.
    string previous?;
    # An array of issue comment objects returned by the operation
    IssueComment[] values?;
};

# The base type for all comments. This type should be considered abstract. Each of the "commentable" resources defines its own subtypes (e.g. `issue_comment`).
public type Comment record {
    *Object;
    # The ID of the comment
    int id?;
    # The created date of the comment
    string created_on?;
    # The updated date of the comment
    string? updated_on?;
    # The comment content
    record  { # The text as it was typed by a user.
        string raw?; # The type of markup language the raw content is to be interpreted in.
        string markup?; # The user's content rendered as HTML.
        string html?;}  content?;
    # The user of the comment
    User user?;
    # Indicates whether the comment is deleted
    boolean deleted?;
    # The parent comment
    Comment parent?;
    # The comment's anchor line detail
    record  { # The comment's anchor line in the new version of the file. If the 'from' line is also provided, this value will be removed.
        int to?; # The comment's anchor line in the old version of the file.
        int 'from?; # The path of the file this comment is anchored to.
        string path;}  inline?;
    # links to a resource related to comment object.
    record  { # A link to a resource related to this object.
        record  { string href?; string name?;}  self?; # A link to a resource related to this object.
        record  { string href?; string name?;}  html?; # A link to a resource related to this object.
        record  { string href?; string name?;}  code?;}  links?;
};

# An account object.
public type Account record {
    *Object;
    # Links to a resource related to this account object
    record  { # A link to a resource related to this object.
        record  { string href?; string name?;}  self?; # A link to a resource related to this object.
        record  { string href?; string name?;}  html?; # A link to a resource related to this object.
        record  { string href?; string name?;}  avatar?; # A link to a resource related to this object.
        record  { string href?; string name?;}  followers?; # A link to a resource related to this object.
        record  { string href?; string name?;}  following?; # A link to a resource related to this object.
        record  { string href?; string name?;}  repositories?;}  links?;
    # Username of the account
    string username?;
    # Account name defined by the owner. Should be used instead of the "username" field. Note that "nickname" cannot be used in place of "username" in URLs and queries, as "nickname" is not guaranteed to be unique.
    string nickname?;
    # The status of the account. Currently the only possible value is "active", but more values may be added in the future.
    string account_status?;
    # Display name of the account
    string display_name?;
    # Website of the account
    string website?;
    # The created date of the account
    string created_on?;
    # The UUID of the account
    string uuid?;
    # Indicates whether two factor authentication is on
    boolean has_2fa_enabled?;
};

# A user object.
public type User record {
    *Account;
    # Indicates whether the user represents staff
    boolean is_staff?;
    # The user's Atlassian account ID.
    string account_id?;
};

# An issue.
public type Issue record {
    *Object;
    # Links related to this issue
    record  { # A link to a resource related to this object.
        record  { string href?; string name?;}  self?; # A link to a resource related to this object.
        record  { string href?; string name?;}  html?; # A link to a resource related to this object.
        record  { string href?; string name?;}  comments?; # A link to a resource related to this object.
        record  { string href?; string name?;}  attachments?; # A link to a resource related to this object.
        record  { string href?; string name?;}  watch?; # A link to a resource related to this object.
        record  { string href?; string name?;}  vote?;}  links?;
    # The ID of the issue
    int id?;
    # The repository of the issue
    Repository repository?;
    # The title of the issue
    string title?;
    # The reporter of the issue
    User reporter?;
    # To whom this issue was assigned
    User? assignee?;
    # The created date/time of the issue
    string created_on?;
    # The last updated date/time of the issue
    string? updated_on?;
    # The last edited date/time of the issue
    string? edited_on?;
    # The state of the issue
    string state?;
    # The kind of the issue
    string kind?;
    # The priority level of the issue
    string priority?;
    # The milestone of the issue
    Milestone? milestone?;
    # The version of the issue
    Version? 'version?;
    # The component of the issue
    Component? component?;
    # The number of votes
    int votes?;
    # The content of the issue
    record  { # The text as it was typed by a user.
        string raw?; # The type of markup language the raw content is to be interpreted in.
        string markup?; # The user's content rendered as HTML.
        string html?;}  content?;
};

# A milestone as defined in a repository's issue tracker.
public type Milestone record {
    *Object;
    # Links related to the milestone object
    record  { # A link to a resource related to this object.
        record  { string href?; string name?;}  self?;}  links?;
    # The name of the milestone
    string name?;
    # The ID of the milestone
    int id?;
};

public type PullrequestEndpoint record {
    Repository repository?;
    record  { string name?; # Available merge strategies, when this endpoint is the destination of the pull request.
        string[] merge_strategies?; # The default merge strategy, when this endpoint is the destination of the pull request.
        string default_merge_strategy?;}  branch?;
    record  { string hash?;}  'commit?;
};

# Base type for most resource objects. It defines the common `type` element that identifies an object's type. It also identifies the element as Swagger's `discriminator`.
public type Error record {
    # The type of the error
    string 'type;
    # The error detail
    record  { string message; string detail?; # Optional structured data that is endpoint-specific.
        record  { }  data?;}  _error?;
};

# A paginated list of issues.
public type PaginatedIssues record {
    # Total number of objects in the response. This is an optional element that is not provided in all responses, as it can be expensive to compute.
    int size?;
    # Page number of the current results. This is an optional element that is not provided in all responses.
    int page?;
    # Current number of objects on the existing page. The default value is 10 with 100 being the maximum allowed value. Individual APIs may enforce different values.
    int pagelen?;
    # Link to the next page if it exists. The last page of a collection does not have this value. Use this link to navigate the result set and refrain from constructing your own URLs.
    string next?;
    # Link to previous page if it exists. A collections first page does not have this value. This is an optional element that is not provided in all responses. Some result sets strictly support forward navigation and never provide previous links. Clients must anticipate that backwards navigation is not always available. Use this link to navigate the result set and refrain from constructing your own URLs.
    string previous?;
    # An array of issues
    Issue[] values?;
};

# A Bitbucket project.
public type Project record {
    *Object;
    # Links related to this project
    record  { # A link to a resource related to this object.
        record  { string href?; string name?;}  html?; # A link to a resource related to this object.
        record  { string href?; string name?;}  avatar?;}  links?;
    # The project's immutable id.
    string uuid?;
    # The project's key.
    string 'key?;
    # The owner of the project
    Team owner?;
    # The name of the project.
    string name?;
    # The project description
    string description?;
    # 
    boolean is_private?;
    # The created date/time of the project
    string created_on?;
    # The last updated date/time of the project
    string updated_on?;
};

# A ref object, representing a branch or tag in a repository.
public type Ref record {
    # The type of the ref object
    string 'type;
    # Links releated to the ref object
    record  { # A link to a resource related to this object.
        record  { string href?; string name?;}  self?; # A link to a resource related to this object.
        record  { string href?; string name?;}  commits?; # A link to a resource related to this object.
        record  { string href?; string name?;}  html?;}  links?;
    # The name of the ref.
    string name?;
    # The target commit
    Commit target?;
};

# A Bitbucket repository.
public type Repository record {
    *Object;
    # Links related to the repository object
    record  { # A link to a resource related to this object.
        record  { string href?; string name?;}  self?; # A link to a resource related to this object.
        record  { string href?; string name?;}  html?; # A link to a resource related to this object.
        record  { string href?; string name?;}  avatar?; # A link to a resource related to this object.
        record  { string href?; string name?;}  pullrequests?; # A link to a resource related to this object.
        record  { string href?; string name?;}  commits?; # A link to a resource related to this object.
        record  { string href?; string name?;}  forks?; # A link to a resource related to this object.
        record  { string href?; string name?;}  watchers?; # A link to a resource related to this object.
        record  { string href?; string name?;}  downloads?; record  { string href?; string name?;} [] clone?; # A link to a resource related to this object.
        record  { string href?; string name?;}  hooks?;}  links?;
    # The repository's immutable id. This can be used as a substitute for the slug segment in URLs. Doing this guarantees your URLs will survive renaming of the repository by its owner, or even transfer of the repository to a different user.
    string uuid?;
    # The concatenation of the repository owner's username and the slugified name, e.g. "evzijst/interruptingcow". This is the same string used in Bitbucket URLs.
    string full_name?;
    # Indicates whether the repository is private
    boolean is_private?;
    # The parent repository
    Repository parent?;
    # Source control
    string scm?;
    # The owner of the repository
    Account owner?;
    # The name of the repository
    string name?;
    # The description of the repository
    string description?;
    # The created data/time of the repository
    string created_on?;
    # The last updated date/time of the repository
    string updated_on?;
    # The size of the repository
    int size?;
    # The language of the repository
    string language?;
    # Indicates whether repository includes issues
    boolean has_issues?;
    # Indicates whether repository has a wiki
    boolean has_wiki?;
    # 
    string fork_policy?;
    # The related project
    Project project?;
    # The main branch
    Branch? mainbranch?;
};

# A repository commit object.
public type Commit record {
    *BaseCommit;
    #The Repository of the commit
    Repository repository?;
    # The participants of the commit
    Participant[] participants?;
};

# Object describing a user's role on resources like commits or pull requests.
public type Participant record {
    *Object;
    # The user detail
    User user?;
    # The type of the participant
    string role?;
    # Indicates whether participant is approved
    boolean approved?;
    # The state of the participant
    string state?;
    # The ISO8601 timestamp of the participant's action. For approvers, this is the time of their approval. For commenters and pull request reviewers who are not approvers, this is the time they last commented, or null if they have not commented.
    string participated_on?;
};

# A version as defined in a repository's issue tracker.
public type Version record {
    *Object;
    # The Links related to the version object
    record  { # A link to a resource related to this object.
        record  { string href?; string name?;}  self?;}  links?;
    # The name of the version
    string name?;
    # The ID of the version
    int id?;
};

# The common base type for both repository and snippet commits.
public type BaseCommit record {
    *Object;
    # The hash value of the base commit
    string hash?;
    # The date of the base commit
    string date?;
    # The author of the base commit
    Author author?;
    # The message of the base commit
    string message?;
    # The summary of the base commit
    record  { # The text as it was typed by a user.
        string raw?; # The type of markup language the raw content is to be interpreted in.
        string markup?; # The user's content rendered as HTML.
        string html?;}  summary?;
    # The parent base commit
    BaseCommit[] parents?;
};

# A branch object, representing a branch in a repository.
public type Branch record {
    *Ref;
    # Available merge strategies for pull requests targeting this branch.
    string[] merge_strategies?;
    # The default merge strategy for pull requests targeting this branch.
    string default_merge_strategy?;
};

# A issue comment.
public type IssueComment record {
    *Comment;
    # The related issue
    Issue issue?;
};

# The author of a change in a repository
public type Author record {
    *Object;
    # The raw author value from the repository. This may be the only value available if the author does not match a user in Bitbucket.
    string raw?;
    # The user details
    Account user?;
};

public type Team record {
    *Account;
};

# Base type for most resource objects. It defines the common `type` element that identifies an object's type. It also identifies the element as Swagger's `discriminator`.
public type Object record {
    # It defines the common `type` element that identifies an object's type and the element as Swagger's `discriminator`
    string 'type?;
};

# A component as defined in a repository's issue tracker.
public type Component record {
    *Object;
    # Links to a resource related to this object
    record  { # A link to a resource related to this object.
        record  { string href?; string name?;}  self?;}  links?;
    # The name of the component
    string name?;
    # The ID of the component
    int id?;
};

# A Bitbucket workspace.
public type Workspace record {
    *Object;
    # Links related to the workspace object
    record  { # A link to a resource related to this object.
        record  { string href?; string name?;}  avatar?; # A link to a resource related to this object.
        record  { string href?; string name?;}  html?; # A link to a resource related to this object.
        record  { string href?; string name?;}  members?; # A link to a resource related to this object.
        record  { string href?; string name?;}  owners?; # A link to a resource related to this object.
        record  { string href?; string name?;}  projects?; # A link to a resource related to this object.
        record  { string href?; string name?;}  repositories?; # A link to a resource related to this object.
        record  { string href?; string name?;}  snippets?; # A link to a resource related to this object.
        record  { string href?; string name?;}  self?;}  links?;
    # The workspace's immutable id.
    string uuid?;
    # The name of the workspace.
    string name?;
    # The short label that identifies this workspace.
    string slug?;
    # Indicates whether the workspace is publicly accessible, or whether it is
    boolean is_private?;
    # The created date/time of the workspace
    string created_on?;
    # The last updated date/time of the workspace
    string updated_on?;
};

# A pull request object.
public type Pullrequest record {
    *Object;
    # Links related to the pull request object
    record  { # A link to a resource related to this object.
        record  { string href?; string name?;}  self?; # A link to a resource related to this object.
        record  { string href?; string name?;}  html?; # A link to a resource related to this object.
        record  { string href?; string name?;}  commits?; # A link to a resource related to this object.
        record  { string href?; string name?;}  approve?; # A link to a resource related to this object.
        record  { string href?; string name?;}  diff?; # A link to a resource related to this object.
        record  { string href?; string name?;}  diffstat?; # A link to a resource related to this object.
        record  { string href?; string name?;}  comments?; # A link to a resource related to this object.
        record  { string href?; string name?;}  activity?; # A link to a resource related to this object.
        record  { string href?; string name?;}  merge?; # A link to a resource related to this object.
        record  { string href?; string name?;}  decline?;}  links?;
    # The pull request's unique ID. Note that pull request IDs are only unique within their associated repository.
    int id?;
    # Title of the pull request.
    string title?;
    # User provided pull request text, interpreted in a markup language and rendered in HTML
    record  { record  { # The text as it was typed by a user.
            string raw?; # The type of markup language the raw content is to be interpreted in.
            string markup?; # The user's content rendered as HTML.
            string html?;}  title?; record  { # The text as it was typed by a user.
            string raw?; # The type of markup language the raw content is to be interpreted in.
            string markup?; # The user's content rendered as HTML.
            string html?;}  description?; record  { # The text as it was typed by a user.
            string raw?; # The type of markup language the raw content is to be interpreted in.
            string markup?; # The user's content rendered as HTML.
            string html?;}  reason?;}  rendered?;
    # The summary of the pull request
    record  { # The text as it was typed by a user.
        string raw?; # The type of markup language the raw content is to be interpreted in.
        string markup?; # The user's content rendered as HTML.
        string html?;}  summary?;
    # The pull request's current status.
    string state?;
    # The author of the pull request
    Account author?;
    # The pull request source
    PullrequestEndpoint 'source?;
    #The pull request destination
    PullrequestEndpoint destination?;
    # The pull request commit
    record  { string hash?;}?  merge_commit?;
    # The number of comments for a specific pull request.
    int comment_count?;
    # The number of open tasks for a specific pull request.
    int task_count?;
    # A boolean flag indicating if merging the pull request closes the source branch.
    boolean close_source_branch?;
    # By whom the pull request closed
    Account? closed_by?;
    # Explains why a pull request was declined. This field is only applicable to pull requests in rejected state.
    string reason?;
    # The ISO8601 timestamp the request was created.
    string created_on?;
    # The ISO8601 timestamp the request was last updated.
    string updated_on?;
    # The list of users that were added as reviewers on this pull request when it was created. For performance reasons, the API only includes this list on a pull request's `self` URL.
    Account[] reviewers?;
    #         The list of users that are collaborating on this pull request.
    Participant[] participants?;
};
