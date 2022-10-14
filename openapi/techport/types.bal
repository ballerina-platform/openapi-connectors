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

# Represents a destination towards which the technology on this project helps advance the Agency goals.
public type Destination string;

# Lookup code representing more data about an object usually stored in our database.
public type LkuCode record {
    # Unique ID for this LKU Code
    int lkuCodeId?;
    # Unique text code that represents this LKU Code
    string code?;
    # Description of the LKU Code
    string description?;
    # Unique ID for the LKU Code Type
    int lkuCodeTypeId?;
    # Lookup code type further showing how the lookup codes within this type will be used.
    LkuCodeType lkuCodeType?;
    # Display order
    int displayOrder?;
};

# A NASA center/facility associated with an project
public type Organization record {
    # Unique ID for this organization
    int organizationId?;
    # The acronym of the organization
    string acronym?;
    # Fax number of the organization
    string fax?;
    # True if the organization is an active organization
    boolean isActive?;
    # Represents a physical location.
    Location location?;
    # Unique ID representing the organizations location
    int locationId?;
    # The name of the organization
    string organizationName?;
    # Lookup code representing more data about an object usually stored in our database.
    LkuCode organizationType?;
    # Unique ID for the lookup code representing the organization type
    int organizationTypeId?;
    # Unique ID for the parent organization
    int parentOrganizationId?;
    # The phone number for the organization
    string phone?;
    # Unique ID for the replacement organization
    int replacementOrganizationId?;
    # The URL for the organization
    string url?;
    # True if the organization is in North America
    boolean NAOrganization?;
    # True if the organization is external to NASA
    boolean 'external?;
    # Amount of links this organization has
    int linkCount?;
};

# Represents a specific library item.
public type LibraryItem record {
    # Unique identifier for the library item.
    int id?;
    # Title of the library item
    string title?;
    # Lookup code representing more data about an object usually stored in our database.
    LkuCode contentType?;
    # List of files associated with the library item.
    File[] files?;
    # Description of the library item.
    string description?;
    # External URL for the library item.
    string url?;
    # Date the library item was published.
    string publishedDateString?;
    # Publisher of the library item.
    string publishedBy?;
};

# Represents data associated with a single taxonomy root entity.
public type Taxonomy record {
    # Unique ID for this taxonomy
    int taxonomyRootId?;
    # ID for this taxonomy roots release status
    int releaseStatusId?;
    # Title for this taxonomy
    string title?;
    # Definition for this taxonomy
    string definition?;
    # The last user to modify this taxonomy
    string modifiedBy?;
    # The date this taxonomy was last modified
    string modifiedDate?;
    TreeNode[] children?;
    # The release status of this taxonomy
    string releaseStatus?;
};

# A state/territory where work on this project is performed.
public type WorkLocation string;

public type ProjectIdResponse record {
    ProjectId[] projects?;
    int totalCount?;
};

# Represents a taxonomy node in a tree.
public type TreeNode record {
    # Represents data associated with a single taxonomy node entity.
    TaxonomyNode content?;
    TreeNode[] children?;
};

public type ProjectSearchResult record {
    # Project Id.
    int id?;
    # Project title.
    string title?;
    # Details about the project.
    string description?;
};

# The name of the Principal Investigator who is a lead scientist or engineer for an project.
public type PrincipalInvestigator string;

# The name of a Program Manager responsible for management of an project.
public type ProgramManager string;

# The name of a Program Director responsible for management of an project.
public type ProgramDirector string;

# Lookup code type further showing how the lookup codes within this type will be used.
public type LkuCodeType record {
    # Unique ID for this LKU Code Type
    int lkuCodeTypeId?;
    # Unique text code type that represents this LKU Code
    string codeType?;
    # Description of the LKU Code Type
    string description?;
};

# Represents a NASA program.
public type Program record {
    # Unique ID for this program
    int programId?;
    # Acronym for this program
    string acronym?;
    # True if the program is still active
    boolean active?;
    # Description for the program
    string description?;
    # Represents a NASA program.
    Program parentProgram?;
    # Unique ID for the parent program
    int parentProgramId?;
    # A NASA center/facility associated with an project
    Organization responsibleMd?;
    # Unique ID for the parent responsible mission directorate
    int responsibleMdId?;
    # Title for the program
    string title?;
};

public type ProjectSearchResponse record {
    ProjectSearchResult[] projects?;
};

public type ProjectId record {
    # Project IDs.
    int? projectId?;
    # Date where the project was last updated.
    string? lastUpdated?;
};

# The name of a Project Manager responsible for management of an project.
public type ProjectManager string;

# Represents an individual and their details.
public type Contact record {
    # Unique ID for this contact
    int contactId?;
    # Display order
    int displayOrder?;
    # Fax number for the contact
    string fax?;
    # First name for the contact
    string firstName?;
    # Last name for the contact
    string lastName?;
    # Full name for the contact, first middle initial last
    string fullName?;
    # Full name for the contact but inverted, last first middle initial
    string fullNameInverted?;
    # Represents a physical location.
    Location location?;
    # Unique ID representing the contacts location
    int locationId?;
    # Middle initial for the contact
    string middleInitial?;
    # A NASA center/facility associated with an project
    Organization organization?;
    # Prefix for the contact
    string prefix?;
    # Primary email for the contact
    string primaryEmail?;
    # Secondary email for the contact
    string secondaryEmail?;
    # Suffix for the contact
    string suffix?;
    # Title for the contact
    string title?;
    # Extension for contacts work phone number
    string workPhoneExtension?;
    # Phone number for the contact
    string workPhone?;
    # 1 if the contact is signed up to receive TechPort emails
    int receiveEmail?;
    # True if the contacts email is available to be shown to the public
    boolean isPublicEmail?;
};

# Top-level TechPort object representing a NASA technology project and its associated data.
public type Project record {
    # Unique identifier for the project.
    int projectId?;
    # ISO 8601 full-date in the format YYYY-MM-DD describing the last time this project was updated.
    string lastUpdated?;
    # Title of the project.
    string title?;
    # Abbreviated name of the project.
    string acronym?;
    # Indicates whether the project is currently active, completed, or canceled.
    string statusDescription?;
    # A detailed description of the project.
    string description?;
    # Describes the benefits offered to NASA funded and planned missions, unfunded or planned missions, commercial space industry, and to the nation.
    string benefits?;
    # The month and year the project was authorized to proceed.
    string startDateString?;
    # The month and year the project is expected to complete its work.
    string endDateString?;
    # The technology maturity (technology readiness level) of the project at its beginning.
    int startTrl?;
    # The current technology maturity (technology readiness level) of the project.
    int currentTrl?;
    # The estimated technology maturity (technology readiness level) of the project at its end.
    int endTrl?;
    # List of primary taxonomy nodes (from the NASA Technology Roadmap) associated with the project.
    TaxonomyNode[] primaryTaxonomyNodes?;
    # List of additional and cross-cutting taxonomy nodes associated with the project.
    TaxonomyNode[] additionalTaxonomyNodes?;
    # List of the NASA destinations the technology on this project helps achieve.
    LkuCode[] destinations?;
    # Lookup code representing more data about an object usually stored in our database.
    LkuCode supportedMission?;
    # Represents a NASA program.
    Program program?;
    # Represents a NASA program.
    Program responsibleMd?;
    # A NASA center/facility associated with an project
    Organization leadOrganization?;
    # The supporting organizations for this project that are conducting work on the project.
    Organization[] supportingOrganizations?;
    # Other government agencies, NASA Mission Directoratres, universities, or commercial entities performing contributing resources to this project.
    Organization[] coFundingPartners?;
    # States and territories with people performing work on this project.
    Location[] statesWithWork?;
    # Names of the Program Directors responsible for the management of this project.
    Contact[] programDirectors?;
    # Names of the Program Managers responsible for the management of this project.
    Contact[] programManagers?;
    # Names of the Project Managers responsible for the management of this project.
    Contact[] projectManagers?;
    # Names of the Principal Investigators who are the lead scientists or engineers for this project.
    Contact[] principalInvestigators?;
    # Names of the additional investigators who are scientists or engineers for this project.
    Contact[] coInvestigators?;
    # The URL for the associated website.
    string website?;
    # List of library items in the project library.
    LibraryItem[] libraryItems?;
    # List of STI DAAs in the project library.
    LibraryItem[] stiDaas?;
    # The project closeout summary excerpt.
    string closeoutSummary?;
    # List of document files or links to the project final report closeout documentation.
    LibraryItem[] closeoutDocuments?;
    # Represents a specific library item.
    LibraryItem primaryImage?;
};

# The Technology Area for a given technology that corresponds to the NASA Technology Roadmap.
public type TechnologyArea record {
    # Unique identifier for the Technology Area.
    int id?;
    # The code identifier for the Technology Area.
    string code?;
    # The title of the Technology Area.
    string title?;
};

# The name of an investigator who is a scientist or engineer for an project.
public type CoInvestigator string;

# Represents data associated with a single taxonomy node entity.
public type TaxonomyNode record {
    # Unique identifier for the taxonomy node
    int taxonomyNodeId?;
    # Unique identifier for the root of this taxonomy node
    int taxonomyRootId?;
    # Unique identifier for the taxonomy node/root that is the direct parent of this taxonomy node
    int parentNodeId?;
    # The level of this node on the tree (0 being the root)
    int level?;
    # Code of the taxonomy node
    string code?;
    # Title of the taxonomy node
    string title?;
    # Definition of the taxonomy node
    string definition?;
    # Defines whether this node has children
    boolean hasChildren?;
    # Published URL of the taxonomy node
    string publishedUrl?;
};

# Represents a file associated with a library item.
public type File record {
    # Unique identifier for the file.
    int fileId?;
    # The TechPort URL at which the file is accessible for download.
    string url?;
    # The size of the file in bytes.
    int fileSize?;
    # The file extension for the file.
    string fileExtension?;
    # The file name.
    string fileName?;
};

# Represents a file hyperlink or external hyperlink to a project closeout final report artifact.
public type CloseoutDocument string;

# Represents a physical location.
public type Location record {
    # Unique ID for this location
    int locationId?;
    # First line of address for location
    string addressLine1?;
    # Second line of address for location
    string addressLine2?;
    # City for location
    string city?;
    # Lookup code representing more data about an object usually stored in our database.
    LkuCode locationType?;
    # Unique ID for the lookup code representing the location type
    int locationTypeId?;
    # State for location
    string state?;
    # State Territory name for location
    string stateTerritoryName?;
    # ZIP code for location
    string zip?;
    # Secondary ZIP code for location
    string zip2?;
    # True if this location is located in North America
    string NALocation?;
    # Lookup code representing more data about an object usually stored in our database.
    LkuCode country?;
    # Unique ID for the lookup code representing the location country
    int countryId?;
    # A string representing the full location
    string shortLocationString?;
};
