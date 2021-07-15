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

# page items
public type PageupdaterequestbodyChildren record {
    # Page heading
    PageupdaterequestbodyHeading2 heading_2?;
    # The page object "block"
    string 'object?;
    # The type of the object
    string 'type?;
};

# Database response content
public type DatabaseResponse record {
    # Indicates whether has more objects
    boolean has_more?;
    # The next position of the result
    anydata? next_cursor?;
    # Object Type "list"
    string 'object?;
    # Database results
    DatabaseresponseResults[] results?;
};

# User detail
public type User record {
    # avatar URL
    anydata? avatar_url?;
    # User ID
    string id?;
    # Name of the User
    string name?;
    # The object type User
    string 'object?;
    # The contact detail
    UserPerson person?;
    # The object type
    string 'type?;
};

# The page content after update
public type PageUpdatedProperties record {
    # Indicates whether it is archived or not
    boolean archived?;
    # The created date/time
    string created_time?;
    # The ID of the Page
    string id?;
    # The last edited date/time
    string last_edited_time?;
    # The object type "page"
    string 'object?;
    # The parent page
    PageupdatedpropertiesParent parent?;
    # Object Properties
    ObjectProperties properties?;
};

# Page properties
public type PagecontentProperties record {
    # Status properties
    PagecontentPropertiesStatus Status?;
};

# Publisher Detail
public type ObjectpropertiesPublisher record {
    # Publisher ID
    string id?;
    # Select details of publisher
    ObjectpropertiesPublisherSelect 'select?;
    # The type of the object
    string 'type?;
};

# The request body for page update
public type PageUpdateRequestBody record {
    # Children pages
    PageupdaterequestbodyChildren[] children?;
};

# Publishing/Releasing Date
public type ObjectpropertiesPublishingreleaseDate record {
    # The date of publishing/release
    record  { }  date?;
    # ID of date
    string id?;
    # Type of the object
    string 'type?;
};

# The database type details
public type ObjectpropertiesType record {
    # The type ID
    string id?;
    # Select details of publisher
    ObjectpropertiesPublisherSelect 'select?;
    # The object type
    string 'type?;
};

# Sort items
public type DatabasecontentSorts record {
    # The sort direction
    string direction?;
    # The sort property
    string property?;
};

# Object Properties
public type ObjectProperties record {
    # Author of the database
    ObjectpropertiesAuthor Author?;
    # Related links
    ObjectpropertiesLink Link?;
    # The name of the object
    ObjectpropertiesName Name?;
    # Publisher Detail
    ObjectpropertiesPublisher Publisher?;
    # Publishing/Releasing Date
    ObjectpropertiesPublishingreleaseDate 'Publishing\/Release\ Date?;
    # Read details
    ObjectpropertiesRead Read?;
    # The status ID
    ObjectpropertiesStatus Status?;
    # The summary of the database
    ObjectpropertiesSummary Summary?;
    # The database type details
    ObjectpropertiesType Type?;
};

# The set of items in options
public type ObjectpropertiesPublisherSelectOptions record {
    # The color
    string color?;
    # The ID of the option
    string id?;
    # The name of the option
    string name?;
};

# Page content
public type PageContent record {
    # Page properties
    PagecontentProperties properties?;
};

# Result Details
public type ResultDetails record {
    # The created date/time
    string created_time?;
    # Indicates whether it has child object or not
    boolean has_children?;
    # Object ID
    string id?;
    # The last date/time
    string last_edited_time?;
    # Object Category
    string 'object?;
    # object type
    string 'type?;
    # Unsupported
    record  { }  unsupported?;
};

# Child block details
public type ChildBlockContent record {
    # Child page
    ChildblockcontentChildPage child_page?;
    # The created date/time
    string created_time?;
    # Indicates whether it has children blocks
    boolean has_children?;
    # ID of the block
    string id?;
    # The last edited date/time
    string last_edited_time?;
    # Always "block" for block types
    string 'object?;
    # Type of the block. Possible values include "paragraph", "heading_1", "heading_2", "heading_3", "bulleted_list_item" etc.
    string 'type?;
};

# The response for block children
public type BlockChildrenResponse record {
    # Indicates whether it has more objects or not
    boolean has_more?;
    # Incidates the position of the response list
    anydata? next_cursor?;
    # The response object
    string 'object?;
    # The array of result details
    ResultDetails[] results?;
};

# The item sets
public type DatabaseTitle record {
    # The annotation
    DatabaseAnnotations annotations?;
    # HyperLink
    anydata? href?;
    # Plain text
    string plain_text?;
    # The text detail
    DatabaseText text?;
    # The type of the object
    string 'type?;
};

# Text value
public type PageupdaterequestbodyHeading2Text record {
    # Text content
    string content?;
};

# Page text items
public type PageupdaterequestbodyHeading2Text1 record {
    # Text value
    PageupdaterequestbodyHeading2Text text?;
    # The type of the object
    string 'type?;
};

# The status ID
public type ObjectpropertiesStatus record {
    # The ID of the status
    string id?;
    # Select details of publisher
    ObjectpropertiesPublisherSelect 'select?;
    # The object type
    string 'type?;
};

# The filter item
public type DatabasecontentFilterOr record {
    # The filter property
    string property?;
    # The select details
    DatabasecontentFilterSelect 'select?;
};

# The database object
public type Database record {
    # The created date/time
    string created_time?;
    # Database ID
    string id?;
    # The last edited date/time
    string last_edited_time?;
    # Object type "database"
    string 'object?;
    # Object Properties
    ObjectProperties properties?;
    # Title of the database
    DatabaseTitle[] title?;
};

# The text detail
public type DatabaseText record {
    # The text content
    string content?;
    # The link to the text
    anydata? link?;
};

# The select details
public type DatabasecontentFilterSelect record {
    # The equals values
    string 'equals?;
};

# Status properties
public type PagecontentPropertiesStatus record {
    # Select properties
    PagecontentPropertiesStatusSelect 'select?;
};

# Page Details
public type PageResponse record {
    # Indicates whether it is archived or not
    boolean archived?;
    # The created date/time
    string created_time?;
    # ID of the page
    string id?;
    # The last edited date/time
    string last_edited_time?;
    # The object type "page"
    string 'object?;
    # Parent Page
    PageresponseParent parent?;
    # Object Properties
    ObjectProperties properties?;
};

# The parent page
public type PageupdatedpropertiesParent record {
    # The database ID
    string database_id?;
    # The object type
    string 'type?;
};

# Filter detail
public type DatabasecontentFilter record {
    # The filter set
    DatabasecontentFilterOr[] or?;
};

# The annotation
public type DatabaseAnnotations record {
    # Indicates whether the title is bold or not
    boolean bold?;
    # Indicates whether the title is code or not
    boolean code?;
    # Indicates whether the title is color or not
    string color?;
    # Indicates whether the title is italic or not
    boolean italic?;
    # Indicates whether the title is strikethrough or not
    boolean strikethrough?;
    # Indicates whether the title is underline or not
    boolean underline?;
};

# Select details of publisher
public type ObjectpropertiesPublisherSelect record {
    # The set of options
    ObjectpropertiesPublisherSelectOptions[] options?;
};

# The name of the object
public type ObjectpropertiesName record {
    # Name ID
    string id?;
    # tilte
    record  { }  title?;
    # title Type
    string 'type?;
};

# The summary of the database
public type ObjectpropertiesSummary record {
    # The ID of the summary
    string id?;
    # The summary content
    record  { }  text?;
    # The type of the object
    string 'type?;
};

# The contact detail
public type UserPerson record {
    # Email address
    string email?;
};

# Read details
public type ObjectpropertiesRead record {
    # checkbox details
    record  { }  checkbox?;
    # ID of the checkbox
    string id?;
    # The object type
    string 'type?;
};

# Parent Page
public type PageresponseParent record {
    # Database ID
    string database_id?;
    # The type of the object
    string 'type?;
};

# Child page
public type ChildblockcontentChildPage record {
    # Title of the page
    string title?;
};

# Author of the database
public type ObjectpropertiesAuthor record {
    # Author ID
    string id?;
    # multi_select values
    ObjectpropertiesAuthorMultiSelect multi_select?;
    # The type of the object
    string 'type?;
};

# The parent database
public type DatabaseresponseParent record {
    # Database ID
    string database_id?;
    # The type of object
    string 'type?;
};

# Related links
public type ObjectpropertiesLink record {
    # Link ID
    string id?;
    # Link type
    string 'type?;
    # URL
    record  { }  url?;
};

# The option items
public type ObjectpropertiesAuthorMultiSelectOptions record {
    # Color of the database
    string color?;
    # ID of the database
    string id?;
    # Name of the Database
    string name?;
};

# multi_select values
public type ObjectpropertiesAuthorMultiSelect record {
    # The multi_select option
    ObjectpropertiesAuthorMultiSelectOptions[] options?;
};

# The databases
public type DatabaseresponseResults record {
    # Indicates whether the database is archived or not
    boolean archived?;
    # Indicates whether the database is archived or not
    string created_time?;
    # The ID of the database
    string id?;
    # The last edited time
    string last_edited_time?;
    # The object type "page"
    string 'object?;
    # The parent database
    DatabaseresponseParent parent?;
    # Object Properties
    ObjectProperties properties?;
};

# Select properties
public type PagecontentPropertiesStatusSelect record {
    # page content name
    string name?;
};

# Database content
public type DatabaseContent record {
    # Filter detail
    DatabasecontentFilter filter?;
    # Sorting details
    DatabasecontentSorts[] sorts?;
};

# Page heading
public type PageupdaterequestbodyHeading2 record {
    # Page text
    PageupdaterequestbodyHeading2Text1[] text?;
};
