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

import ballerina/constraint;

public type AssignmentSubmissionArr AssignmentSubmission[];

public type ResourceCollaboratorArr ResourceCollaborator[];

public type ScoreTrackArr ScoreTrack[];

public type ScoreCommentArr ScoreComment[];

public type ScoreRevisionArr ScoreRevision[];

public type CollectionArr Collection[];

public type ScoreDetailsArr ScoreDetails[];

public type UserDetailsAdminArr UserDetailsAdmin[];

public type OrganizationInvitationArr OrganizationInvitation[];

public type LtiCredentialsArr LtiCredentials[];

public type ClassDetailsArr ClassDetails[];

public type AssignmentArr Assignment[];

public type AssignmentSubmissionHistoryArr AssignmentSubmissionHistory[];

public type AssignmentSubmissionCommentArr AssignmentSubmissionComment[];

public type UserPublicArr UserPublic[];

# History item of the submission
public type AssignmentSubmissionHistory record {
    # The date when the submission was changed
    string date?;
    # The user(s) unique identifier(s) who made the change
    string[] users?;
    # State of the submission
    AssignmentSubmissionState state?;
    # The numerator of the grade at this time in the submission grade history
    decimal draftGrade?;
    # The numerator of the grade at this time in the submission grade history
    decimal grade?;
    # The denominator of the grade at this time in the submission grade history
    decimal maxPoints?;
    AssignmentsubmissionhistoryAttachment attachment?;
};

# Options to fork the score
public type ScoreFork record {
    # Unique identifier of a collection where the score will be copied.
    # If no collection identifier is provided, the score will be stored in the `root` directory.
    string collection?;
};

# A computed version of the weekly, monthly and total of number of likes
# for a score
public type ScoreLikesCounts record {
    # The total number of likes of the score
    decimal total?;
    # The number of new likes during the last week
    decimal weekly?;
    # The number of new likes during the last month
    decimal monthly?;
};

# Meta information provided by Canvs LMS
public type ClassdetailsCanvas record {
    # Unique identifier of the course on Canvas
    string id?;
    # Canvas instance domain (e.g. "canvas.instructure.com")
    string domain?;
};

# The collection main privacy mode(private).
public type CollectionPrivacy string;

# Source of the license
public type LicenseSources string;

# The type of an audio track
public type ScoreTrackType string;

# A classroom
public type ClassDetails record {
    # The unique identifier of the class
    string id?;
    # The state of a classroom
    ClassState state?;
    # The name of the class
    string name?;
    # The section of the class
    string section?;
    # An optionnal description for this class
    string description?;
    # The unique identifier of the Organization owning this class
    string organization?;
    # The unique identifier of the User owning this class
    string owner?;
    # The date when the class was create
    string creationDate?;
    # [Teachers only] The enrollment code that can be used by the students to join the class
    string enrollmentCode?;
    # The theme identifier using in Flat User Interface
    string theme?;
    # The number of assignments created in the class
    decimal assignmentsCount?;
    # The details of a group
    GroupDetails studentsGroup?;
    # The details of a group
    GroupDetails teachersGroup?;
    # Detected issues for this class
    ClassdetailsIssues issues?;
    # Google Classroom course-related information
    ClassdetailsGoogleclassroom googleClassroom?;
    # Google Drive course-related information provided by Google Classroom
    ClassdetailsGoogledrive googleDrive?;
    ClassdetailsMicrosoftgraph microsoftGraph?;
    # Meta information provided by the LTI consumer
    ClassdetailsLti lti?;
    # Meta information provided by Canvs LMS
    ClassdetailsCanvas canvas?;
    # Meta information provided by Canvs LMS
    ClassdetailsMfc mfc?;
    # Clever.com section-related information
    ClassdetailsClever clever?;
};

# User's Class Role (for Edu users only)
public type ClassRoles string?;

# Assignment details
public type Assignment record {
    # State of the assignment
    string state?;
    # Type of the assignment
    AssignmentType 'type?;
    # Title of the assignment
    string title?;
    # The unique identifier of the class where this assignment was posted
    string classroom?;
    # Description and content of the assignment
    string description?;
    # The URL of the cover to display
    string cover?;
    # The id of the cover to display
    string coverFile?;
    MediaAttachment[] attachments?;
    AssignmentSubmission[] submissions?;
    # The User unique identifier of the creator of this assignment
    string creator?;
    # The creation date of this assignment
    string creationDate?;
    # The publication (scheduled) date of the assignment.
    # If this one is specified, the assignment will only be listed to the teachers of the class.
    string scheduledDate?;
    # The due date of this assignment, late submissions will be marked as
    # paste due.
    string dueDate?;
    # If set, the grading will be enabled for the assignement
    decimal maxPoints?;
    # A coursework on Google Classroom
    GoogleClassroomCoursework googleClassroom?;
    # A Microsoft Teams asignment
    MicrosoftGraphAssignment microsoftGraph?;
    # A MusicFirst Classroom assignment
    AssignmentMfc mfc?;
    # A Canvas LMS assignment
    AssignmentCanvas canvas?;
    # An LTI assignment
    AssignmentLti lti?;
};

# User details
public type UserDetails record {
    *UserPublic;
    # Identifier of the user
    string id?;
    # The type of account
    string 'type?;
    # Tell either this user profile is private or not (individual accounts only)
    boolean privateProfile?;
    # The user language
    FlatLocales locale?;
    # The ID of the user profile picture
    string? pictureFile?;
    # The ID of the user profile cover picture
    string? coverPictureFile?;
};

# Public User details
public type UserPublic record {
    *UserPublicSummary;
    # User's biography
    string bio?;
    # Date the user signed up
    string registrationDate?;
    # Number of the scores liked by the user
    int likedScoresCount?;
    # Number of followers the user have
    int followersCount?;
    # Number of people the user follow
    int followingCount?;
    # Number of public scores the user have
    int ownedPublicScoresCount?;
    # Cover picture (backgroud) for the profile
    string coverPicture?;
    # Theme (background) for the profile
    string profileTheme?;
    # An array of the instrument identifiers.
    # The format of the strings is `{instrument-group}.{instrument-id}`.
    string[] instruments?;
};

# An API Error response
public type FlatErrorResponse record {
    # A corresponding code for this error
    string code?;
    # A printable message for this message
    string message?;
    # An unique error identifier generated for the request
    string id?;
    # The related parameter that caused the error
    string param?;
};

# A new created score
public type ScoreCreation record {
    # The title of the new score. If the title is too long, the API may trim this one.
    # 
    # If this title is not specified, the API will try to (in this order):
    #   - Use the title contained in the file (e.g. [`movement-title`](https://usermanuals.musicxml.com/MusicXML/Content/EL-MusicXML-movement-title.htm) or [`credit-words`](https://usermanuals.musicxml.com/MusicXML/Content/EL-MusicXML-credit-words.htm) for [MusicXML](http://www.musicxml.com/) files).
    #   - Use the name of the file for files from a specified `source` (e.g. Google Drive) or the one in the `filename` property
    #   - Set a default title (e.g. "New Music Score")
    string title?;
    # If this is an imported file, its filename
    string filename?;
    # The score main privacy mode(public, private, privateLink and organizationPublic).
    ScorePrivacy privacy;
    # The data of the score file. It must be a MusicXML 3 file (`vnd.recordare.musicxml` or `vnd.recordare.musicxml+xml`), a MIDI file (`audio/midi`) or a Flat.json (aka Adagio.json) file.
    # Binary payloads (`vnd.recordare.musicxml` and `audio/midi`) can be encoded in Base64, in this case the `dataEncoding` property must match the encoding used for the API request.
    string data?;
    # The optional encoding of the score data. This property must match the encoding used for the `data` property.
    string dataEncoding?;
    ScoreSource 'source?;
    # Unique identifier of a collection where the score will be created.
    # If no collection identifier is provided, the score will be stored in the `root` directory.
    string collection?;
    # If the user uses Google Drive and this properties is specified, the file will be created in this directory. The currently user creating the file must be granted to write in this directory.
    string googleDriveFolder?;
};

# Feedback comment added to an assignment submission
public type AssignmentSubmissionComment record {
    # The comment unique identifier
    string id?;
    # The author unique identifier
    string user?;
    # The submission unique identifier
    string submission?;
    # The date when the comment was posted
    string date?;
    # The date of the last comment modification
    string modificationDate?;
    # The comment text
    string comment?;
    # True if the comment is unread by the current user
    boolean unread?;
};

# Google Classroom course-related information
public type ClassdetailsGoogleclassroom record {
    # The course identifier on Google Classroom
    string id?;
    # Absolute link to this course in the Classroom web UI
    string alternateLink?;
};

public type AssignmentsubmissionhistoryAttachment record {
    # The score identifier that changed
    string score?;
    # The revision identifier that changed
    string revision?;
};

# The score main privacy mode(public, private, privateLink and organizationPublic).
public type ScorePrivacy string;

# Comment added on a sheet music
public type ScoreComment record {
    # The comment unique identifier
    string id?;
    # The type of the comment
    string 'type?;
    # The author unique identifier
    string user?;
    # The unique identifier of the score where the comment was posted
    string score?;
    # The unique identifier of revision the comment was posted
    string revision?;
    # When the comment is a reply to another comment, the unique identifier of the parent comment
    string replyTo?;
    # The date when the comment was posted
    string date?;
    # The date of the last comment modification
    string modificationDate?;
    # The comment text that can includes mentions using the following
    # format: `@[id:username]`.
    string comment?;
    # A raw version of the comment, that can be displayed without parsing
    # the mentions.
    string rawComment?;
    # The context of the comment (for inline/contextualized comments). A context will include all the information related to the location of the comment (i.e. score parts, range of measure, time position).
    ScoreCommentContext context?;
    # The list of user identifier mentioned on the score
    string[] mentions?;
    # For inline comments, the comment can be marked as resolved and will be hidden in the future responses
    boolean resolved?;
    # If the user is marked as resolved, this will contain the unique identifier of the User who marked this comment as resolved
    string resolvedBy?;
    # `true  if the message has been detected as spam and hidden from other users
    boolean spam?;
};

# The type of creation (an orginal, an arrangement)
public type ScoreCreationType string;

# State of the submission
public type AssignmentSubmissionState string;

# The rights of the current user on a score or collection
public type ResourceRights record {
    # `True` if the current user can read the current document
    boolean aclRead?;
    # `True` if the current user can modify the current document.
    # 
    # If this is a right of a Collection, the capabilities of the associated user can be lower than this permission, check out the `capabilities` property as the end-user to have the complete possibilities with the collection.
    boolean aclWrite?;
    # `True` if the current user can manage the current document (i.e. share, delete)
    # 
    # If this is a right of a Collection, the capabilities of the associated user can be lower than this permission, check out the `capabilities` property as the end-user to have the complete possibilities with the collection.
    boolean aclAdmin?;
    # `True` if the current user is a collaborator of the current document (direct or via group).
    boolean isCollaborator?;
};

# Assignment copy operation
public type AssignmentCopy record {
    # The destination classroom where the assignment will be copied
    string classroom?;
    # An optional destination assignment where the original assignement will be copied. Must be a draft.
    string assignment?;
    # The publication (scheduled) date of the assignment.
    # If this one is specified, the assignment will only be listed to the teachers of the class.
    # Alternatively the existing `scheduledDate` from the copied assignment will be used.
    string scheduledDate?;
};

# Creation of a classroom
public type ClassCreation record {
    # The name of the new class
    @constraint:String {maxLength: 255}
    string name;
    # The section of the new class
    @constraint:String {maxLength: 255}
    string section?;
};

# Microsoft Graph options for this assignment
public type AssignmentcreationMicrosoftgraph record {
    # List of categories this assignment belongs to
    string[]? categories?;
};

# The score and all its details
public type ScoreDetails record {
    *ScoreSummary;
    # Subtitle of the score
    string subtitle?;
    # Lyricist of the score
    string lyricist?;
    # Arranger of the score
    string arranger?;
    # Composer of the score
    string composer?;
    # Description of the creation
    string description?;
    # Tags describing the score
    string[] tags?;
    # The type of creation (an orginal, an arrangement)
    ScoreCreationType creationType?;
    # License of the creation. Read more about the Creative Commons licenses on https://creativecommons.org/licenses/
    ScoreLicense license?;
    # Additional license text written on the exported/printed score
    string licenseText?;
    # In seconds, an approximative duration of the score
    decimal durationTime?;
    # The number of measures in the score
    int numberMeasures?;
    # The main tempo of the score (in QPM)
    decimal mainTempoQpm?;
    # The rights of the current user on a score or collection
    ResourceRights rights?;
    # The list of the collaborators of the score
    ResourceCollaborator[] collaborators?;
    # The date when the score was created
    string creationDate?;
    # The date of the last revision of the score
    string modificationDate?;
    # The date when the score was published on Flat
    string publicationDate?;
    # If the score has been created in an organization, the identifier of this organization. This property is especially used with the score privacy `organizationPublic`.
    string organization?;
    # If the score has been forked, the unique identifier of the parent score.
    string parentScore?;
    # An array of the instrument identifiers used in the last version of the score. This is mainly used to display a list of the instruments in the Flat's UI or instruments icons. The format of the strings is `{instrument-group}.{instrument-id}`.
    string[] instruments?;
    # An array of the audio samples identifiers used the different score parts.
    # The format of the strings is `{instrument-group}.{sample-id}`.
    string[] samples?;
    # If the user uses Google Drive and the score exists on Google Drive, this field will contain the unique identifier of the Flat score on Google Drive. You can access the document using the url: `https://drive.google.com/open?id={googleDriveFileId}`
    string googleDriveFileId?;
    # A computed version of the weekly, monthly and total of number of likes
    # for a score
    ScoreLikesCounts likes?;
    # A computed version of the total, unique, weekly and monthly number of
    # comments added on the documents (this doesn't include inline comments).
    ScoreCommentsCounts comments?;
    # A computed version of the total, weekly, and monthly number of views of
    # the score
    ScoreViewsCounts views?;
    # A computed version of the total, weekly, and monthly number of plays of
    # the score
    ScorePlaysCounts plays?;
    # The List of parent collections, which includes all the collections this score is included. Please note that you might not have access to all of them.
    string[] collections?;
};

# A computed version of the total, weekly, and monthly number of plays of
# the score
public type ScorePlaysCounts record {
    # The total number of plays of the score
    decimal total?;
    # The weekly number of plays of the score
    decimal weekly?;
    # The monthly number of plays of the score
    decimal monthly?;
};

# The details of a group
public type GroupDetails record {
    # The unique identifier of the group
    string id?;
    # The displayable name of the group
    string name?;
    # The type of the group
    GroupType 'type?;
    # The unique identifier of the Organization owning the group
    string organization?;
    # The date when the group was create
    string creationDate?;
    # The number of students in this group
    decimal usersCount?;
    # `true` if the properties and members of this group are in in read-only
    boolean readOnly?;
};

# License of the creation. Read more about the Creative Commons licenses on https://creativecommons.org/licenses/
public type ScoreLicense string;

# The type of the group
public type GroupType string;

# The parameters to create an organization invitation
public type OrganizationInvitationCreation record {
    # The email address you want to send the invitation to
    string email?;
    # User's Organization Role (for Edu users only)
    OrganizationRoles? organizationRole?;
};

# A score revision metadata
public type ScoreRevision record {
    # The unique identifier of the revision.
    string id?;
    # The user identifier who created the revision
    string user?;
    string[] collaborators?;
    # The date when this revision was created
    string creationDate?;
    # The last event (action id) of the revision
    string event?;
    # A description associated to the revision
    string description?;
    # True if this revision was automatically generated by Flat and not on
    # purpose by the user.
    boolean autosave?;
    # The statistics related to the score revision (additions and deletions)
    ScoreRevisionStatistics statistics?;
};

# Collection of scores
public type Collection record {
    # Unique identifier of the collection
    string id?;
    # The title of the collection
    string title?;
    # The url where the collection can be viewed in a web browser
    string htmlUrl?;
    # Type of the collection that influence the capabilitied available on the collections and how this collection is/can be populated.
    CollectionType 'type?;
    # The collection main privacy mode(private).
    CollectionPrivacy privacy?;
    # The private sharing key of the collection (available when the `privacy` mode is set to `privateLink`)
    string sharingKey?;
    # If this directory is dedicated to an app, the unique idenfier of this app
    string app?;
    # The date when the collection was created
    string creationDate?;
    # Public User details summary
    UserPublicSummary user?;
    # The rights of the current user on a score or collection
    ResourceRights rights?;
    # The list of the collaborators of the collection
    ResourceCollaborator[] collaborators?;
    # Capabilities the current user has on this collection. Each capability corresponds to a fine-grained action that a user may take.
    CollectionCapabilities capabilities?;
    # The List of parent collections, which includes all the collections this score is included. Please note that you might not have access to all of them.
    string[] collections?;
};

# A track synchronization point
public type ScoreTrackPoint record {
    # The type of the synchronization point. If the type is `measure`, the measure uuid must be present in `measureUuid`
    string 'type;
    # The measure unique identifier
    string measureUuid?;
    # The corresponding time in seconds
    decimal time;
};

# A coursework submission on Google Classroom
public type GoogleClassroomSubmission record {
    # Identifier of the coursework submission assigned by Classroom
    string id?;
    # State of the submission on Google Classroom
    string state?;
    # Absolute link to this coursework in the Classroom web UI
    string alternateLink?;
};

# Attachment creation for an assignment or stream post.
# This attachment must contain a `score` or an `url`, all the details of this one will be resolved and returned as `ClassAttachment` once the assignment or stream post is created.
public type ClassAttachmentCreation record {
    # The type of the attachment posted
    string 'type?;
    # A unique Flat score identifier. The user creating the assignment must at least have read access to the document. If the user has admin rights, new group permissions will be automatically added for the
    # teachers and students of the class.
    string score?;
    # An unique worksheet identifier
    string worksheet?;
    # The sharing mode of the score for classes post and assignments
    MediaScoreSharingMode sharingMode?;
    # To be used with a score attached in `sharingMode` `copy` (score used as template). If true, students won't be able to change the original notes of the template.
    boolean lockScoreTemplate?;
    # The URL of the attachment.
    string url?;
    # The ID of the Google Drive File
    string googleDriveFileId?;
};

# Google Drive course-related information provided by Google Classroom
public type ClassdetailsGoogledrive record {
    # [Teachers only] The Drive directory identifier of the teachers' folder
    string teacherFolderId?;
    # [Teachers only] The Drive URL of the teachers' folder
    string teacherFolderAlternateLink?;
};

# Update an existing track.
public type ScoreTrackUpdate record {
    # Title of the track
    string title?;
    # True if the track should be used as default audio source
    boolean default?;
    # State of the track
    ScoreTrackState state?;
    ScoreTrackPoint[] synchronizationPoints?;
};

# Creation of a couple of LTI 1.x OAuth credentials
public type LtiCredentialsCreation record {
    # Name of the couple of credentials
    @constraint:String {maxLength: 300}
    string name;
    # LMS name
    LmsName lms;
};

# A collaborator of a score. The `userEmail` and `group` are only available if the requesting user is a collaborator of the related score (in this case these permissions will eventualy not be listed and exposed publicly).
public type ResourceCollaborator record {
    *ResourceRights;
    # The unique identifier of the permission
    string id?;
    # If this object is a permission of a score, this property will contain the unique identifier of the score
    string score?;
    # If this object is a permission of a collection, this property will contain the unique identifier of the collection
    string collection?;
    # Public User details
    UserPublic user?;
    # A group of users
    Group group?;
    # If the collaborator is not a user of Flat yet, this field will contain his email.
    string userEmail?;
    # If this property is `true`, this is still a pending invitation
    boolean invited?;
};

public type CollectionCreation record {
    # The title of the collection
    @constraint:String {maxLength: 300, minLength: 1}
    string title;
    # The collection main privacy mode(private).
    CollectionPrivacy privacy;
};

# Edit the collection metadata
public type CollectionModification record {
    # The title of the collection
    @constraint:String {maxLength: 300, minLength: 1}
    string title?;
    # The collection main privacy mode(private).
    CollectionPrivacy privacy?;
};

# Edit the score metadata
public type ScoreModification record {
    # The title of the score
    string title?;
    # The subtitle of the score
    string subtitle?;
    # The composer of the score
    string composer?;
    # The lyricist of the score
    string lyricist?;
    # The arranger of the score
    string arranger?;
    # The score main privacy mode(public, private, privateLink and organizationPublic).
    ScorePrivacy privacy?;
    # When using the `privacy` mode `privateLink`, this property can be used to set a custom sharing key, otherwise a new key will be generated.
    string sharingKey?;
    # Description of the creation
    @constraint:String {maxLength: 2000}
    string description?;
    # Tags describing the score
    string[] tags?;
    # The type of creation (an orginal, an arrangement)
    ScoreCreationType creationType?;
    # License of the creation. Read more about the Creative Commons licenses on https://creativecommons.org/licenses/
    ScoreLicense license?;
    # The rights info written on the score
    string licenseText?;
};

# A group of users
public type Group record {
    # The unique identifier of the group
    string id?;
    # The display name of the group
    string name?;
    # The type of the group:
    # * `generic`: A group created by a Flat user
    # * `classTeachers`: A group created automaticaly by Flat that contains
    #   the teachers of a class
    # * `classStudents`: A group created automaticaly by Flat that contains
    #   the studnets of a class
    string 'type?;
    # The number of users in this group
    decimal usersCount?;
    # `True` if the group is set in read-only
    boolean readOnly?;
    # If the group is related to an organization, this field will contain
    # the unique identifier of the organization
    string organization?;
    # The creation date of the group
    string creationDate?;
};

# State of the track
public type ScoreTrackState string;

# The state of a classroom
public type ClassState string;

# Public User details summary
public type UserPublicSummary record {
    *UserBasics;
    # Organization ID (for Edu users only)
    string organization?;
    # User's Organization Role (for Edu users only)
    OrganizationRoles? organizationRole?;
    # User's Class Role (for Edu users only)
    ClassRoles? classRole?;
    # Link to user profile (for Indiv. users only)
    string htmlUrl?;
};

# A Microsoft Teams submission
public type MicrosoftGraphSubmission record {
    # Identifier of the submission assigned by Microsoft Teams
    string id?;
    # State of the submission
    string state?;
    # Absolute link to this submission in the Microsoft Teams web UI
    string alternateLink?;
};

# Creation of a assignment submission comment
public type AssignmentSubmissionCommentCreation record {
    # The comment text
    string comment;
};

# Current active license of the user
public type UserdetailsadminLicense record {
    # ID of the current license
    string id?;
    # Date when the license expires
    string expirationDate?;
    # Source of the license
    LicenseSources 'source?;
    # Mode of the license
    LicenseMode mode?;
    # ID of the current license
    boolean active?;
};

# A Microsoft Teams asignment
public type MicrosoftGraphAssignment record {
    # Identifier of the assignement assigned by Microsoft Teams
    string id?;
    # State of the assignment
    string state?;
    # Absolute link to this assignement in the Microsoft Teams web UI
    string alternateLink?;
    # List of categories where this assignment is published under
    string[] categories?;
};

# Google Classroom options for this assignment
public type AssignmentcreationGoogleclassroom record {
    # Identifier of the topic where the assignment is created
    string? topicId?;
};

# The statistics related to the score revision (additions and deletions)
public type ScoreRevisionStatistics record {
    # The number of additions operations in the last revision
    decimal additions?;
    # The number of deletions operations in the last revision
    decimal deletions?;
};

# User details (view for organization teacher / admin)
public type UserDetailsAdmin record {
    *UserPublicSummary;
    # Email of the user
    string email?;
    # Date of the last user activity
    string lastActivityDate?;
    # Current active license of the user
    UserdetailsadminLicense license?;
};

# A couple of LTI 1.x OAuth credentials
public type LtiCredentials record {
    # The unique identifier of this couple of credentials
    string id?;
    # Name of the couple of credentials
    string name?;
    # LMS name
    LmsName lms?;
    # The unique identifier of the Organization associated to these credentials
    string organization?;
    # Unique identifier of the user who created these credentials
    string creator?;
    # The creation date of thse credentials
    string creationDate?;
    # The last time these credentials were used
    string lastUsage?;
    # OAuth 1 Consumer Key
    string consumerKey?;
    # OAuth 1 Consumer Secret
    string consumerSecret?;
};

# LMS name
public type LmsName string;

# Mode of the license
public type LicenseMode string;

# Meta information provided by Canvs LMS
public type ClassdetailsMfc record {
    # Unique identifier of the course on MusicFirst Classroom
    string id?;
    # Link to MusicFirst Classroom class
    string alternateLink?;
};

# A Canvas LMS assignment
public type AssignmentCanvas record {
    # Unique identifier of the course on Canvas assignment
    string id?;
    # Link to Canvas assignment
    string alternateLink?;
};

# User update as an organization admin
public type UserAdminUpdate record {
    # Password of the account
    string password?;
    # User's Organization Role (for Edu users only)
    OrganizationRoles? organizationRole?;
    # Username of the account
    @constraint:String {maxLength: 30, minLength: 1}
    string username?;
    # First name of the user
    @constraint:String {maxLength: 60}
    string firstname?;
    # Last name of the user
    @constraint:String {maxLength: 60}
    string lastname?;
    # Email of the account
    string email?;
};

# Type of the collection that influence the capabilitied available on the collections and how this collection is/can be populated.
public type CollectionType string;

# Update of a comment
public type ScoreCommentUpdate record {
    # The unique indentifier of the revision of the score where the comment was added. If this property is unspecified or contains "last", the API will automatically take the last revision created.
    string revision?;
    # The comment text that can includes mentions using the following format: `@[id:username]`.
    @constraint:String {maxLength: 10000, minLength: 1}
    string comment?;
    # A raw version of the comment, that can be displayed without the mentions. If you use mentions, this property must be set.
    @constraint:String {maxLength: 10000, minLength: 1}
    string rawComment?;
    # The context of the comment (for inline/contextualized comments). A context will include all the information related to the location of the comment (i.e. score parts, range of measure, time position).
    ScoreCommentContext context?;
};

# A computed version of the total, unique, weekly and monthly number of
# comments added on the documents (this doesn't include inline comments).
public type ScoreCommentsCounts record {
    # The total number of comments added to the score
    decimal total?;
    # The unique (1/user) number of comments added to the score
    decimal unique?;
    # The weekly unique number of comments added to the score
    decimal weekly?;
    # The monthly unique number of comments added to the score
    decimal monthly?;
};

# Assignment creation details
public type AssignmentCreation record {
    # Type of the assignment
    AssignmentType 'type?;
    # State of the assignment
    string state?;
    # Title of the assignment
    string title?;
    # Description and content of the assignment
    string description?;
    ClassAttachmentCreation[] attachments?;
    # The due date of this assignment, late submissions will be marked as paste due. If not set, the assignment won't have a due date.
    string? dueDate?;
    # The publication (scheduled) date of the assignment.
    # If this one is specified, the assignment will only be listed to the teachers of the class.
    string? scheduledDate?;
    # The number of playback authorized on the scores of the assignment.
    decimal? nbPlaybackAuthorized?;
    # The id of the associated toolset
    string? toolset?;
    # The id of the cover to display
    string? coverFile?;
    # The URL of the cover to display
    string? cover?;
    # If set, the grading will be enabled for the assignement with this value as the maximum of points
    decimal? maxPoints?;
    # Google Classroom options for this assignment
    AssignmentcreationGoogleclassroom googleClassroom?;
    # Microsoft Graph options for this assignment
    AssignmentcreationMicrosoftgraph microsoftGraph?;
    # Possible modes of assigning assignments
    string assigneeMode?;
    # Identifiers for the students that have access to the assignment
    string[] assignedStudents?;
};

# Assignment Submission creation
public type AssignmentSubmissionUpdate record {
    ClassAttachmentCreation[] attachments?;
    # If `true`, the submission will be marked as done
    boolean submit?;
    # Optional grade. If unset, no grade was set. This value is only visible by the teacher, and we will be set to `grade` once the teacher returns the submission
    decimal? draftGrade?;
    # Optional grade. If unset, no grade was set.
    decimal? grade?;
    # If `true`, the submission will be marked as done
    boolean 'return?;
    AssignmentsubmissionupdateComments comments?;
};

# The user language
public type FlatLocales string;

# User's Organization Role (for Edu users only)
public type OrganizationRoles string?;

# Add a collaborator to a resource.
public type ResourceCollaboratorCreation record {
    # The unique identifier of a Flat user
    string user?;
    # The unique identifier of a Flat group
    string group?;
    # Fill this field to invite an individual user by email.
    string userEmail?;
    # Token received in an invitation to join the score.
    string userToken?;
    # `True` if the related user can read the score. (probably true if the user has a permission on the document).
    boolean aclRead?;
    # `True` if the related user can modify the score.
    boolean aclWrite?;
    # `True` if the related user can can manage the current document, i.e. changing the document permissions and deleting the document
    boolean aclAdmin?;
};

# A MusicFirst Classroom assignment
public type AssignmentMfc record {
    # Unique identifier of the course on MusicFirst Task
    string id?;
    # Link to MusicFirst Classroom task
    string alternateLink?;
};

# Meta information provided by the LTI consumer
public type ClassdetailsLti record {
    # Unique context identifier provided
    string contextId?;
    # Context title
    string contextTitle?;
    # Context label
    string contextLabel?;
};

# An audio track for a score
public type ScoreTrack record {
    # The unique identifier of the score track
    string id?;
    # Title of the track
    string title?;
    # The unique identifier of the score
    string score?;
    # The unique identifier of the track creator
    string creator?;
    # The creation date of the track
    string creationDate?;
    # The modification date of the track
    string modificationDate?;
    # True if the track should be used as default audio source
    boolean default?;
    # State of the track
    ScoreTrackState state?;
    # The type of an audio track
    ScoreTrackType 'type?;
    # The URL of the track
    string url?;
    # The unique identifier of the track when hosted on an external service.
    # For example, if the url is `https://www.youtube.com/watch?v=dQw4w9WgXcQ`, `mediaId` will be `dQw4w9WgXcQ`
    string mediaId?;
    ScoreTrackPoint[] synchronizationPoints?;
};

public type ScoreSource record {
    # If the score is a file on Google Drive, this field property must contain its identifier. To use this method, the Drive file must be public or the Flat Drive App must have access to the file.
    string googleDrive?;
};

# A summary of the score details
public type ScoreSummary record {
    # The unique identifier of the score
    string id?;
    # The private sharing key of the score (available when the `privacy` mode is set to `privateLink`)
    string sharingKey?;
    # The title of the score
    string title?;
    # The score main privacy mode(public, private, privateLink and organizationPublic).
    ScorePrivacy privacy?;
    # Public User details summary
    UserPublicSummary user?;
    # The url where the score can be viewed in a web browser
    string htmlUrl?;
};

# Details of an invitation to join an organization
public type OrganizationInvitation record {
    # The invitation unique identifier
    string id?;
    # The unique identifier of the Organization owning this class
    string organization?;
    # User's Organization Role (for Edu users only)
    OrganizationRoles? organizationRole?;
    # Enrollment code to use when joining this organization
    string customCode?;
    # The email address this invitation was sent to
    string email?;
    # The unique identifier of the User who created this invitation
    string invitedBy?;
    # The unique identifier of the User who used this invitation
    string usedBy?;
};

# A sync issue
public type ClassdetailsIssuesSync record {
    # The account user identifier
    string id?;
    # The email address of the user concerned by this sync issue
    string email?;
    # The reason why the account cannot be synced
    string reason?;
};

# Detected issues for this class
public type ClassdetailsIssues record {
    # Synchronization issues for the class
    ClassdetailsIssuesSync[] sync?;
};

# Creation of a new track. This one must contain the URL of the track or the corresponding file
public type ScoreTrackCreation record {
    # Title of the track
    string title?;
    # True if the track should be used as default audio source
    boolean default?;
    # State of the track
    ScoreTrackState state?;
    # The URL of the track
    string url?;
    ScoreTrackPoint[] synchronizationPoints?;
};

# An LTI assignment
public type AssignmentLti record {
    # Resource ID in the LMS
    string id?;
};

# A coursework on Google Classroom
public type GoogleClassroomCoursework record {
    # Identifier of the coursework assigned by Classroom
    string id?;
    # State of the coursework
    string state?;
    # Absolute link to this coursework in the Classroom web UI
    string alternateLink?;
    # Identifier of the topic where the assignment is created
    string? topicId?;
};

public type AssignmentsubmissionupdateComments record {
    # The total number of comments added to the submission
    decimal total?;
    # The number of unread comments for the current user
    decimal unread?;
};

# User creation
public type UserCreation record {
    # Username of the new account
    @constraint:String {maxLength: 30, minLength: 1}
    string username;
    # First name of the user
    @constraint:String {maxLength: 60}
    string firstname?;
    # Last name of the user
    @constraint:String {maxLength: 60}
    string lastname?;
    # Email of the new account
    string email?;
    # Password of the new account
    string password;
    # The user language
    FlatLocales locale?;
};

# A new created revision
public type ScoreRevisionCreation record {
    # The data of the score file. It must be a MusicXML 3 file (`vnd.recordare.musicxml` or `vnd.recordare.musicxml+xml`), a MIDI file (`audio/midi`) or a Flat.json (aka Adagio.json) file.
    # Binary payloads (`vnd.recordare.musicxml` and `audio/midi`) can be encoded in Base64, in this case the `dataEncoding` property must match the encoding used for the API request.
    string data;
    # The optional encoding of the score data. This property must match the encoding used for the `data` property.
    string dataEncoding?;
    # Must be set to `true` if the revision was created automatically.
    boolean autosave?;
    # A description associated to the revision
    string description?;
};

# Clever.com section-related information
public type ClassdetailsClever record {
    # Clever section unique identifier
    string id?;
    # The creation date of the section on clever
    string creationDate?;
    # The last modification date of the section on clever
    string modificationDate?;
    # Normalized subject of the course
    string subject?;
    # Name of the term when this course happens
    string termName?;
    # Beginning date of the term
    string termStartDate?;
    # End date of the term
    string termEndDate?;
};

# The context of the comment (for inline/contextualized comments). A context will include all the information related to the location of the comment (i.e. score parts, range of measure, time position).
public type ScoreCommentContext record {
    # The unique identifier (UUID) of the score part
    string partUuid;
    # (Deprecated, use `staffUuid`) The identififer of the staff
    decimal staffIdx?;
    # The unique identififer (UUID) of the staff
    string staffUuid?;
    # The list of measure UUIds
    string[] measureUuids;
    decimal startTimePos;
    decimal stopTimePos;
    decimal startDpq;
    decimal stopDpq;
};

# The sharing mode of the score for classes post and assignments
public type MediaScoreSharingMode string;

# A computed version of the total, weekly, and monthly number of views of
# the score
public type ScoreViewsCounts record {
    # The total number of views of the score
    decimal total?;
    # The weekly number of views of the score
    decimal weekly?;
    # The monthly number of views of the score
    decimal monthly?;
};

# Capabilities the current user has on this collection. Each capability corresponds to a fine-grained action that a user may take.
public type CollectionCapabilities record {
    # Whether the current user can modify the metadata for the collection
    boolean canEdit?;
    # Whether the current user can modify the sharing settings for the collection
    boolean canShare?;
    # Whether the current user can delete the collection
    boolean canDelete?;
    # Whether the current user can add scores to the collection
    # 
    # If this collection has the `type` `trash`, this property will be set to `false`. Use `DELETE /v2/scores/{score}` to trash a score.
    boolean canAddScores?;
    # Whether the current user can delete scores from the collection
    # 
    # If this collection has the `type` `trash`, this property will be set to `false`. Use `POST /v2/scores/{score}/untrash` to restore a score.
    boolean canDeleteScores?;
};

# Assignment Submission
public type AssignmentSubmission record {
    # Unique identifier of the submission
    string id?;
    # State of the submission
    AssignmentSubmissionState state?;
    # Unique identifier of the classroom where the assignment was posted
    string classroom?;
    # Unique identifier of the assignment
    string assignment?;
    # The User identifier of the student who created the submission
    string creator?;
    # The date when the submission was created
    string creationDate?;
    MediaAttachment[] attachments?;
    # The date when the student submitted his work
    string submissionDate?;
    # The date when the teacher returned the work
    string returnDate?;
    # The User unique identifier of the teacher who returned the submission
    string returnCreator?;
    # Optional grade. If unset, no grade was set.
    decimal? grade?;
    # Optional grade. If unset, no grade was set. This value is only visible by the teacher, and we will be set to `grade` once the teacher returns the submission
    decimal? draftGrade?;
    # Optional max points for the grade. If set, a corresponding `draftGrade` or `grade` will be set.
    decimal maxPoints?;
    # A coursework submission on Google Classroom
    GoogleClassroomSubmission googleClassroom?;
    # A Microsoft Teams submission
    MicrosoftGraphSubmission microsoftGraph?;
};

# Creation of a comment
public type ScoreCommentCreation record {
    # The unique indentifier of the revision of the score where the comment was added. If this property is unspecified or contains "last", the API will automatically take the last revision created.
    string revision?;
    # The comment text that can includes mentions using the following format: `@[id:username]`.
    string comment;
    # A raw version of the comment, that can be displayed without the mentions. If you use mentions, this property must be set.
    string rawComment?;
    # The list of user identifiers mentioned in this comment
    string[] mentions?;
    # When the comment is a reply to another comment, the unique identifier of the parent comment
    string replyTo?;
    # The context of the comment (for inline/contextualized comments). A context will include all the information related to the location of the comment (i.e. score parts, range of measure, time position).
    ScoreCommentContext context?;
};

# Type of the assignment
public type AssignmentType string;

public type ClassdetailsMicrosoftgraph record {
    # The course identifier on Microsoft Graph
    string id?;
};

public type UserBasics record {
    # The user unique identifier
    string id?;
    # The type of user account
    string 'type?;
    # The user name (unique for the organization)
    string username?;
    # The name that can be directly printed (name, firstname & lastname, or username)
    string printableName?;
    # Firstname of the user (for education users)
    string firstname?;
    # Lastname of the user (for education users)
    string lastname?;
    # A displayable name for the user (for consumer users)
    string name?;
    # The URL of the picture to display
    string? picture?;
    # User license status. 'true' if user is an individual Power user
    boolean isPowerUser?;
    # Will be 'true' if user is part of the Flat Team
    boolean isFlatTeam?;
};

# Update of a classroom
public type ClassUpdate record {
    # The name of the class
    @constraint:String {maxLength: 255}
    string name?;
    # The section of the class
    @constraint:String {maxLength: 255}
    string section?;
};

# Media attachment. The API will automatically resolve the details, oEmbed,
# and media available if possible and return them in this object
public type MediaAttachment record {
    # The type of the assignment resolved:
    # * `rich`, `photo`, `video` are attachment types that are automatically resolved from a `link` attachment.
    # * A `flat` attachment is a score document where the unique identifier will be specified in the `score` property. Its sharing mode will be provided in the `sharingMode` property.
    string 'type?;
    # An unique Flat score identifier
    string score?;
    # An unique revision identifier of a score
    string revision?;
    # An unique worksheet identifier
    string worksheet?;
    # A unique track identifier
    string track?;
    # The sharing mode of the score for classes post and assignments
    MediaScoreSharingMode sharingMode?;
    # To be used with a score attached in `sharingMode` `copy` (score used as template). If true, students won't be able to change the original notes of the template.
    boolean lockScoreTemplate?;
    # The resolved title of the attachment
    string title?;
    # The resolved description of the attachment
    string description?;
    # If the attachment type is `rich` or `video`, the HTML code of the
    # media to display
    string html?;
    # If the `html` is available, the width of the widget
    string htmlWidth?;
    # If the `html` is available, the height of the widget
    string htmlHeight?;
    # The url of the attachment
    string url?;
    # If the attachment type is `rich`, `video`, `photo` or `link`, a
    # displayable thumbnail for this attachment
    string thumbnailUrl?;
    # If the `thumbnailUrl` is available, the width of the thumbnail
    int thumbnailWidth?;
    # If the `thumbnailUrl` is available, the width of the thumbnail
    int thumbnailHeight?;
    # The resolved author name of the attachment
    string authorName?;
    # The resolved author url of the attachment
    string authorUrl?;
    # The URL of the icon
    string iconUrl?;
    # The mine type of the file
    string mimeType?;
    # The ID of the Google Drive File
    string googleDriveFileId?;
};
