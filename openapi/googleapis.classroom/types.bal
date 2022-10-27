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
    string refreshUrl = "https://accounts.google.com/o/oauth2/token";
|};

# Response when listing invitations.
public type ListInvitationsResponse record {
    # Invitations that match the list request.
    Invitation[] invitations?;
    # Token identifying the next page of results to return. If empty, no further results are available.
    string nextPageToken?;
};

# Student submission for course work. StudentSubmission items are generated when a CourseWork item is created. StudentSubmissions that have never been accessed (i.e. with `state` = NEW) may not have a creation time or update time.
public type StudentSubmission record {
    # Absolute link to the submission in the Classroom web UI. Read-only.
    string alternateLink?;
    # Optional grade. If unset, no grade was set. This value must be non-negative. Decimal (that is, non-integer) values are allowed, but are rounded to two decimal places. This may be modified only by course teachers.
    decimal assignedGrade?;
    # Student work for an assignment.
    AssignmentSubmission assignmentSubmission?;
    # Whether this student submission is associated with the Developer Console project making the request. See CreateCourseWork for more details. Read-only.
    boolean associatedWithDeveloper?;
    # Identifier of the course. Read-only.
    string courseId?;
    # Identifier for the course work this corresponds to. Read-only.
    string courseWorkId?;
    # Type of course work this submission is for. Read-only.
    string courseWorkType?;
    # Creation time of this submission. This may be unset if the student has not accessed this item. Read-only.
    string creationTime?;
    # Optional pending grade. If unset, no grade was set. This value must be non-negative. Decimal (that is, non-integer) values are allowed, but are rounded to two decimal places. This is only visible to and modifiable by course teachers.
    decimal draftGrade?;
    # Classroom-assigned Identifier for the student submission. This is unique among submissions for the relevant course work. Read-only.
    string id?;
    # Whether this submission is late. Read-only.
    boolean late?;
    # Student work for a multiple-choice question.
    MultipleChoiceSubmission multipleChoiceSubmission?;
    # Student work for a short answer question.
    ShortAnswerSubmission shortAnswerSubmission?;
    # State of this submission. Read-only.
    string state?;
    # The history of the submission (includes state and grade histories). Read-only.
    SubmissionHistory[] submissionHistory?;
    # Last update time of this submission. This may be unset if the student has not accessed this item. Read-only.
    string updateTime?;
    # Identifier for the student that owns this submission. Read-only.
    string userId?;
};

# Information about a `Feed` with a `feed_type` of `COURSE_WORK_CHANGES`.
public type CourseWorkChangesInfo record {
    # The `course_id` of the course to subscribe to work changes for.
    string courseId?;
};

# Attachment added to student assignment work. When creating attachments, setting the `form` field is not supported.
public type Attachment record {
    # Representation of a Google Drive file.
    DriveFile driveFile?;
    # Google Forms item.
    Form form?;
    # URL item.
    Link link?;
    # YouTube video item.
    YouTubeVideo youTubeVideo?;
};

# A material attached to a course as part of a material set.
public type CourseMaterial record {
    # Representation of a Google Drive file.
    DriveFile driveFile?;
    # Google Forms item.
    Form form?;
    # URL item.
    Link link?;
    # YouTube video item.
    YouTubeVideo youTubeVideo?;
};

# Details of the user's name.
public type Name record {
    # The user's last name. Read-only.
    string familyName?;
    # The user's full name formed by concatenating the first and last name values. Read-only.
    string fullName?;
    # The user's first name. Read-only.
    string givenName?;
};

# Additional details for assignments.
public type Assignment record {
    # Representation of a Google Drive folder.
    DriveFolder studentWorkFolder?;
};

# An instruction to Classroom to send notifications from the `feed` to the provided destination.
public type Registration record {
    # A reference to a Cloud Pub/Sub topic. To register for notifications, the owner of the topic must grant `classroom-notifications@system.gserviceaccount.com` the `projects.topics.publish` permission.
    CloudPubsubTopic cloudPubsubTopic?;
    # The time until which the `Registration` is effective. This is a read-only field assigned by the server.
    string expiryTime?;
    # A class of notifications that an application can register to receive. For example: "all roster changes for a domain".
    Feed feed?;
    # A server-generated unique identifier for this `Registration`. Read-only.
    string registrationId?;
};

# Response when listing courses.
public type ListCoursesResponse record {
    # Courses that match the list request.
    Course[] courses?;
    # Token identifying the next page of results to return. If empty, no further results are available.
    string nextPageToken?;
};

# Alternative identifier for a course. An alias uniquely identifies a course. It must be unique within one of the following scopes: * domain: A domain-scoped alias is visible to all users within the alias creator's domain and can be created only by a domain admin. A domain-scoped alias is often used when a course has an identifier external to Classroom. * project: A project-scoped alias is visible to any request from an application using the Developer Console project ID that created the alias and can be created by any project. A project-scoped alias is often used when an application has alternative identifiers. A random value can also be used to avoid duplicate courses in the event of transmission failures, as retrying a request will return `ALREADY_EXISTS` if a previous one has succeeded.
public type CourseAlias record {
    # Alias string. The format of the string indicates the desired alias scoping. * `d:` indicates a domain-scoped alias. Example: `d:math_101` * `p:` indicates a project-scoped alias. Example: `p:abc123` This field has a maximum length of 256 characters.
    string alias?;
};

# Association between a student and a guardian of that student. The guardian may receive information about the student's course work.
public type Guardian record {
    # Identifier for the guardian.
    string guardianId?;
    # Global information for a user.
    UserProfile guardianProfile?;
    # The email address to which the initial guardian invitation was sent. This field is only visible to domain administrators.
    string invitedEmailAddress?;
    # Identifier for the student to whom the guardian relationship applies.
    string studentId?;
};

# Student work for a multiple-choice question.
public type MultipleChoiceSubmission record {
    # Student's select choice.
    string answer?;
};

# A Course in Classroom.
public type Course record {
    # Absolute link to this course in the Classroom web UI. Read-only.
    string alternateLink?;
    # The Calendar ID for a calendar that all course members can see, to which Classroom adds events for course work and announcements in the course. Read-only.
    string calendarId?;
    # The email address of a Google group containing all members of the course. This group does not accept email and can only be used for permissions. Read-only.
    string courseGroupEmail?;
    # Sets of materials that appear on the "about" page of this course. Read-only.
    CourseMaterialSet[] courseMaterialSets?;
    # State of the course. If unspecified, the default state is `PROVISIONED`.
    string courseState?;
    # Creation time of the course. Specifying this field in a course update mask results in an error. Read-only.
    string creationTime?;
    # Optional description. For example, "We'll be learning about the structure of living creatures from a combination of textbooks, guest lectures, and lab work. Expect to be excited!" If set, this field must be a valid UTF-8 string and no longer than 30,000 characters.
    string description?;
    # Optional heading for the description. For example, "Welcome to 10th Grade Biology." If set, this field must be a valid UTF-8 string and no longer than 3600 characters.
    string descriptionHeading?;
    # Enrollment code to use when joining this course. Specifying this field in a course update mask results in an error. Read-only.
    string enrollmentCode?;
    # Whether or not guardian notifications are enabled for this course. Read-only.
    boolean guardiansEnabled?;
    # Identifier for this course assigned by Classroom. When creating a course, you may optionally set this identifier to an alias string in the request to create a corresponding alias. The `id` is still assigned by Classroom and cannot be updated after the course is created. Specifying this field in a course update mask results in an error.
    string id?;
    # Name of the course. For example, "10th Grade Biology". The name is required. It must be between 1 and 750 characters and a valid UTF-8 string.
    string name?;
    # The identifier of the owner of a course. When specified as a parameter of a create course request, this field is required. The identifier can be one of the following: * the numeric identifier for the user * the email address of the user * the string literal `"me"`, indicating the requesting user This must be set in a create request. Admins can also specify this field in a patch course request to transfer ownership. In other contexts, it is read-only.
    string ownerId?;
    # Optional room location. For example, "301". If set, this field must be a valid UTF-8 string and no longer than 650 characters.
    string room?;
    # Section of the course. For example, "Period 2". If set, this field must be a valid UTF-8 string and no longer than 2800 characters.
    string section?;
    # Representation of a Google Drive folder.
    DriveFolder teacherFolder?;
    # The email address of a Google group containing all teachers of the course. This group does not accept email and can only be used for permissions. Read-only.
    string teacherGroupEmail?;
    # Time of the most recent update to this course. Specifying this field in a course update mask results in an error. Read-only.
    string updateTime?;
};

# Representation of a Google Drive folder.
public type DriveFolder record {
    # URL that can be used to access the Drive folder. Read-only.
    string alternateLink?;
    # Drive API resource ID.
    string id?;
    # Title of the Drive folder. Read-only.
    string title?;
};

# A class of notifications that an application can register to receive. For example: "all roster changes for a domain".
public type Feed record {
    # Information about a `Feed` with a `feed_type` of `COURSE_ROSTER_CHANGES`.
    CourseRosterChangesInfo courseRosterChangesInfo?;
    # Information about a `Feed` with a `feed_type` of `COURSE_WORK_CHANGES`.
    CourseWorkChangesInfo courseWorkChangesInfo?;
    # The type of feed.
    string feedType?;
};

# Assignee details about a coursework/announcement. This field is set if and only if `assigneeMode` is `INDIVIDUAL_STUDENTS`.
public type IndividualStudentsOptions record {
    # Identifiers for the students that have access to the coursework/announcement.
    string[] studentIds?;
};

# Course work created by a teacher for students of the course.
public type CourseWork record {
    # Absolute link to this course work in the Classroom web UI. This is only populated if `state` is `PUBLISHED`. Read-only.
    string alternateLink?;
    # Assignee mode of the coursework. If unspecified, the default value is `ALL_STUDENTS`.
    string assigneeMode?;
    # Additional details for assignments.
    Assignment assignment?;
    # Whether this course work item is associated with the Developer Console project making the request. See CreateCourseWork for more details. Read-only.
    boolean associatedWithDeveloper?;
    # Identifier of the course. Read-only.
    string courseId?;
    # Timestamp when this course work was created. Read-only.
    string creationTime?;
    # Identifier for the user that created the coursework. Read-only.
    string creatorUserId?;
    # Optional description of this course work. If set, the description must be a valid UTF-8 string containing no more than 30,000 characters.
    string description?;
    # Represents a whole or partial calendar date, such as a birthday. The time of day and time zone are either specified elsewhere or are insignificant. The date is relative to the Gregorian Calendar. This can represent one of the following: * A full date, with non-zero year, month, and day values * A month and day value, with a zero year, such as an anniversary * A year on its own, with zero month and day values * A year and month value, with a zero day, such as a credit card expiration date Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
    Date dueDate?;
    # Represents a time of day. The date and time zone are either not significant or are specified elsewhere. An API may choose to allow leap seconds. Related types are google.type.Date and `google.protobuf.Timestamp`.
    TimeOfDay dueTime?;
    # Classroom-assigned identifier of this course work, unique per course. Read-only.
    string id?;
    # Assignee details about a coursework/announcement. This field is set if and only if `assigneeMode` is `INDIVIDUAL_STUDENTS`.
    IndividualStudentsOptions individualStudentsOptions?;
    # Additional materials. CourseWork must have no more than 20 material items.
    Material[] materials?;
    # Maximum grade for this course work. If zero or unspecified, this assignment is considered ungraded. This must be a non-negative integer value.
    decimal maxPoints?;
    # Additional details for multiple-choice questions.
    MultipleChoiceQuestion multipleChoiceQuestion?;
    # Optional timestamp when this course work is scheduled to be published.
    string scheduledTime?;
    # Status of this course work. If unspecified, the default state is `DRAFT`.
    string state?;
    # Setting to determine when students are allowed to modify submissions. If unspecified, the default value is `MODIFIABLE_UNTIL_TURNED_IN`.
    string submissionModificationMode?;
    # Title of this course work. The title must be a valid UTF-8 string containing between 1 and 3000 characters.
    string title?;
    # Identifier for the topic that this coursework is associated with. Must match an existing topic in the course.
    string topicId?;
    # Timestamp of the most recent change to this course work. Read-only.
    string updateTime?;
    # Type of this course work. The type is set when the course work is created and cannot be changed.
    string workType?;
};

# The history of each grade on this submission.
public type GradeHistory record {
    # The teacher who made the grade change.
    string actorUserId?;
    # The type of grade change at this time in the submission grade history.
    string gradeChangeType?;
    # When the grade of the submission was changed.
    string gradeTimestamp?;
    # The denominator of the grade at this time in the submission grade history.
    decimal maxPoints?;
    # The numerator of the grade at this time in the submission grade history.
    decimal pointsEarned?;
};

# An invitation to join a course.
public type Invitation record {
    # Identifier of the course to invite the user to.
    string courseId?;
    # Identifier assigned by Classroom. Read-only.
    string id?;
    # Role to invite the user to have. Must not be `COURSE_ROLE_UNSPECIFIED`.
    string role?;
    # Identifier of the invited user. When specified as a parameter of a request, this identifier can be set to one of the following: * the numeric identifier for the user * the email address of the user * the string literal `"me"`, indicating the requesting user
    string userId?;
};

# Request to reclaim a student submission.
public type ReclaimStudentSubmissionRequest record {
};

# Teacher of a course.
public type Teacher record {
    # Identifier of the course. Read-only.
    string courseId?;
    # Global information for a user.
    UserProfile profile?;
    # Identifier of the user. When specified as a parameter of a request, this identifier can be one of the following: * the numeric identifier for the user * the email address of the user * the string literal `"me"`, indicating the requesting user
    string userId?;
};

# Student in a course.
public type Student record {
    # Identifier of the course. Read-only.
    string courseId?;
    # Global information for a user.
    UserProfile profile?;
    # Representation of a Google Drive folder.
    DriveFolder studentWorkFolder?;
    # Identifier of the user. When specified as a parameter of a request, this identifier can be one of the following: * the numeric identifier for the user * the email address of the user * the string literal `"me"`, indicating the requesting user
    string userId?;
};

# A reference to a Cloud Pub/Sub topic. To register for notifications, the owner of the topic must grant `classroom-notifications@system.gserviceaccount.com` the `projects.topics.publish` permission.
public type CloudPubsubTopic record {
    # The `name` field of a Cloud Pub/Sub [Topic](https://cloud.google.com/pubsub/docs/reference/rest/v1/projects.topics#Topic).
    string topicName?;
};

# Request to return a student submission.
public type ReturnStudentSubmissionRequest record {
};

# An invitation to become the guardian of a specified user, sent to a specified email address.
public type GuardianInvitation record {
    # The time that this invitation was created. Read-only.
    string creationTime?;
    # Unique identifier for this invitation. Read-only.
    string invitationId?;
    # Email address that the invitation was sent to. This field is only visible to domain administrators.
    string invitedEmailAddress?;
    # The state that this invitation is in.
    string state?;
    # ID of the student (in standard format)
    string studentId?;
};

# Request to turn in a student submission.
public type TurnInStudentSubmissionRequest record {
};

# Request to modify assignee mode and options of an announcement.
public type ModifyAnnouncementAssigneesRequest record {
    # Mode of the announcement describing whether it is accessible by all students or specified individual students.
    string assigneeMode?;
    # Contains fields to add or remove students from a course work or announcement where the `assigneeMode` is set to `INDIVIDUAL_STUDENTS`.
    ModifyIndividualStudentsOptions modifyIndividualStudentsOptions?;
};

# Response when listing course work material.
public type ListCourseWorkMaterialResponse record {
    # Course work material items that match the request.
    CourseWorkMaterial[] courseWorkMaterial?;
    # Token identifying the next page of results to return. If empty, no further results are available.
    string nextPageToken?;
};

# The history of each state this submission has been in.
public type StateHistory record {
    # The teacher or student who made the change.
    string actorUserId?;
    # The workflow pipeline stage.
    string state?;
    # When the submission entered this state.
    string stateTimestamp?;
};

# Course work material created by a teacher for students of the course
public type CourseWorkMaterial record {
    # Absolute link to this course work material in the Classroom web UI. This is only populated if `state` is `PUBLISHED`. Read-only.
    string alternateLink?;
    # Assignee mode of the course work material. If unspecified, the default value is `ALL_STUDENTS`.
    string assigneeMode?;
    # Identifier of the course. Read-only.
    string courseId?;
    # Timestamp when this course work material was created. Read-only.
    string creationTime?;
    # Identifier for the user that created the course work material. Read-only.
    string creatorUserId?;
    # Optional description of this course work material. The text must be a valid UTF-8 string containing no more than 30,000 characters.
    string description?;
    # Classroom-assigned identifier of this course work material, unique per course. Read-only.
    string id?;
    # Assignee details about a coursework/announcement. This field is set if and only if `assigneeMode` is `INDIVIDUAL_STUDENTS`.
    IndividualStudentsOptions individualStudentsOptions?;
    # Additional materials. A course work material must have no more than 20 material items.
    Material[] materials?;
    # Optional timestamp when this course work material is scheduled to be published.
    string scheduledTime?;
    # Status of this course work material. If unspecified, the default state is `DRAFT`.
    string state?;
    # Title of this course work material. The title must be a valid UTF-8 string containing between 1 and 3000 characters.
    string title?;
    # Identifier for the topic that this course work material is associated with. Must match an existing topic in the course.
    string topicId?;
    # Timestamp of the most recent change to this course work material. Read-only.
    string updateTime?;
};

# URL item.
public type Link record {
    # URL of a thumbnail image of the target URL. Read-only.
    string thumbnailUrl?;
    # Title of the target of the URL. Read-only.
    string title?;
    # URL to link to. This must be a valid UTF-8 string containing between 1 and 2024 characters.
    string url?;
};

# Response when listing course aliases.
public type ListCourseAliasesResponse record {
    # The course aliases.
    CourseAlias[] aliases?;
    # Token identifying the next page of results to return. If empty, no further results are available.
    string nextPageToken?;
};

# Response when listing guardian invitations.
public type ListGuardianInvitationsResponse record {
    # Guardian invitations that matched the list request.
    GuardianInvitation[] guardianInvitations?;
    # Token identifying the next page of results to return. If empty, no further results are available.
    string nextPageToken?;
};

# Response when listing course work.
public type ListCourseWorkResponse record {
    # Course work items that match the request.
    CourseWork[] courseWork?;
    # Token identifying the next page of results to return. If empty, no further results are available.
    string nextPageToken?;
};

# Announcement created by a teacher for students of the course
public type Announcement record {
    # Absolute link to this announcement in the Classroom web UI. This is only populated if `state` is `PUBLISHED`. Read-only.
    string alternateLink?;
    # Assignee mode of the announcement. If unspecified, the default value is `ALL_STUDENTS`.
    string assigneeMode?;
    # Identifier of the course. Read-only.
    string courseId?;
    # Timestamp when this announcement was created. Read-only.
    string creationTime?;
    # Identifier for the user that created the announcement. Read-only.
    string creatorUserId?;
    # Classroom-assigned identifier of this announcement, unique per course. Read-only.
    string id?;
    # Assignee details about a coursework/announcement. This field is set if and only if `assigneeMode` is `INDIVIDUAL_STUDENTS`.
    IndividualStudentsOptions individualStudentsOptions?;
    # Additional materials. Announcements must have no more than 20 material items.
    Material[] materials?;
    # Optional timestamp when this announcement is scheduled to be published.
    string scheduledTime?;
    # Status of this announcement. If unspecified, the default state is `DRAFT`.
    string state?;
    # Description of this announcement. The text must be a valid UTF-8 string containing no more than 30,000 characters.
    string text?;
    # Timestamp of the most recent change to this announcement. Read-only.
    string updateTime?;
};

# Global information for a user.
public type UserProfile record {
    # Email address of the user. Read-only.
    string emailAddress?;
    # Identifier of the user. Read-only.
    string id?;
    # Details of the user's name.
    Name name?;
    # Global permissions of the user. Read-only.
    GlobalPermission[] permissions?;
    # URL of user's profile photo. Read-only.
    string photoUrl?;
    # Represents whether a G Suite for Education user's domain administrator has explicitly verified them as being a teacher. If the user is not a member of a G Suite for Education domain, than this field is always false. Read-only
    boolean verifiedTeacher?;
};

# Google Forms item.
public type Form record {
    # URL of the form.
    string formUrl?;
    # URL of the form responses document. Only set if respsonses have been recorded and only when the requesting user is an editor of the form. Read-only.
    string responseUrl?;
    # URL of a thumbnail image of the Form. Read-only.
    string thumbnailUrl?;
    # Title of the Form. Read-only.
    string title?;
};

# Additional details for multiple-choice questions.
public type MultipleChoiceQuestion record {
    # Possible choices.
    string[] choices?;
};

# Student work for a short answer question.
public type ShortAnswerSubmission record {
    # Student response to a short-answer question.
    string answer?;
};

# A generic empty message that you can re-use to avoid defining duplicated empty messages in your APIs. A typical example is to use it as the request or the response type of an API method. For instance: service Foo { rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty); } The JSON representation for `Empty` is empty JSON object `{}`.
public type Empty record {
};

# Request to modify assignee mode and options of a coursework.
public type ModifyCourseWorkAssigneesRequest record {
    # Mode of the coursework describing whether it will be assigned to all students or specified individual students.
    string assigneeMode?;
    # Contains fields to add or remove students from a course work or announcement where the `assigneeMode` is set to `INDIVIDUAL_STUDENTS`.
    ModifyIndividualStudentsOptions modifyIndividualStudentsOptions?;
};

# Response when listing course work.
public type ListAnnouncementsResponse record {
    # Announcement items that match the request.
    Announcement[] announcements?;
    # Token identifying the next page of results to return. If empty, no further results are available.
    string nextPageToken?;
};

# YouTube video item.
public type YouTubeVideo record {
    # URL that can be used to view the YouTube video. Read-only.
    string alternateLink?;
    # YouTube API resource ID.
    string id?;
    # URL of a thumbnail image of the YouTube video. Read-only.
    string thumbnailUrl?;
    # Title of the YouTube video. Read-only.
    string title?;
};

# Topic created by a teacher for the course
public type Topic record {
    # Identifier of the course. Read-only.
    string courseId?;
    # The name of the topic, generated by the user. Leading and trailing whitespaces, if any, are trimmed. Also, multiple consecutive whitespaces are collapsed into one inside the name. The result must be a non-empty string. Topic names are case sensitive, and must be no longer than 100 characters.
    string name?;
    # Unique identifier for the topic. Read-only.
    string topicId?;
    # The time the topic was last updated by the system. Read-only.
    string updateTime?;
};

# Represents a time of day. The date and time zone are either not significant or are specified elsewhere. An API may choose to allow leap seconds. Related types are google.type.Date and `google.protobuf.Timestamp`.
public type TimeOfDay record {
    # Hours of day in 24 hour format. Should be from 0 to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time.
    int hours?;
    # Minutes of hour of day. Must be from 0 to 59.
    int minutes?;
    # Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999.
    int nanos?;
    # Seconds of minutes of the time. Must normally be from 0 to 59. An API may allow the value 60 if it allows leap-seconds.
    int seconds?;
};

# A set of materials that appears on the "About" page of the course. These materials might include a syllabus, schedule, or other background information relating to the course as a whole.
public type CourseMaterialSet record {
    # Materials attached to this set.
    CourseMaterial[] materials?;
    # Title for this set.
    string title?;
};

# Representation of a Google Drive file.
public type DriveFile record {
    # URL that can be used to access the Drive item. Read-only.
    string alternateLink?;
    # Drive API resource ID.
    string id?;
    # URL of a thumbnail image of the Drive item. Read-only.
    string thumbnailUrl?;
    # Title of the Drive item. Read-only.
    string title?;
};

# Global user permission description.
public type GlobalPermission record {
    # Permission value.
    string permission?;
};

# Response when listing guardians.
public type ListGuardiansResponse record {
    # Guardians on this page of results that met the criteria specified in the request.
    Guardian[] guardians?;
    # Token identifying the next page of results to return. If empty, no further results are available.
    string nextPageToken?;
};

# Information about a `Feed` with a `feed_type` of `COURSE_ROSTER_CHANGES`.
public type CourseRosterChangesInfo record {
    # The `course_id` of the course to subscribe to roster changes for.
    string courseId?;
};

# Response when listing teachers.
public type ListTeachersResponse record {
    # Token identifying the next page of results to return. If empty, no further results are available.
    string nextPageToken?;
    # Teachers who match the list request.
    Teacher[] teachers?;
};

# Material attached to course work. When creating attachments, setting the `form` field is not supported.
public type Material record {
    # Drive file that is used as material for course work.
    SharedDriveFile driveFile?;
    # Google Forms item.
    Form form?;
    # URL item.
    Link link?;
    # YouTube video item.
    YouTubeVideo youtubeVideo?;
};

# Request to modify the attachments of a student submission.
public type ModifyAttachmentsRequest record {
    # Attachments to add. A student submission may not have more than 20 attachments. Form attachments are not supported.
    Attachment[] addAttachments?;
};

# Represents a whole or partial calendar date, such as a birthday. The time of day and time zone are either specified elsewhere or are insignificant. The date is relative to the Gregorian Calendar. This can represent one of the following: * A full date, with non-zero year, month, and day values * A month and day value, with a zero year, such as an anniversary * A year on its own, with zero month and day values * A year and month value, with a zero day, such as a credit card expiration date Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
public type Date record {
    # Day of a month. Must be from 1 to 31 and valid for the year and month, or 0 to specify a year by itself or a year and month where the day isn't significant.
    int day?;
    # Month of a year. Must be from 1 to 12, or 0 to specify a year without a month and day.
    int month?;
    # Year of the date. Must be from 1 to 9999, or 0 to specify a date without a year.
    int year?;
};

# Contains fields to add or remove students from a course work or announcement where the `assigneeMode` is set to `INDIVIDUAL_STUDENTS`.
public type ModifyIndividualStudentsOptions record {
    # IDs of students to be added as having access to this coursework/announcement.
    string[] addStudentIds?;
    # IDs of students to be removed from having access to this coursework/announcement.
    string[] removeStudentIds?;
};

# Response when listing students.
public type ListStudentsResponse record {
    # Token identifying the next page of results to return. If empty, no further results are available.
    string nextPageToken?;
    # Students who match the list request.
    Student[] students?;
};

# Student work for an assignment.
public type AssignmentSubmission record {
    # Attachments added by the student. Drive files that correspond to materials with a share mode of STUDENT_COPY may not exist yet if the student has not accessed the assignment in Classroom. Some attachment metadata is only populated if the requesting user has permission to access it. Identifier and alternate_link fields are always available, but others (for example, title) may not be.
    Attachment[] attachments?;
};

# Drive file that is used as material for course work.
public type SharedDriveFile record {
    # Representation of a Google Drive file.
    DriveFile driveFile?;
    # Mechanism by which students access the Drive item.
    string shareMode?;
};

# Response when listing student submissions.
public type ListStudentSubmissionsResponse record {
    # Token identifying the next page of results to return. If empty, no further results are available.
    string nextPageToken?;
    # Student work that matches the request.
    StudentSubmission[] studentSubmissions?;
};

# Response when listing topics.
public type ListTopicResponse record {
    # Token identifying the next page of results to return. If empty, no further results are available.
    string nextPageToken?;
    # Topic items that match the request.
    Topic[] topic?;
};

# The history of the submission. This currently includes state and grade histories.
public type SubmissionHistory record {
    # The history of each grade on this submission.
    GradeHistory gradeHistory?;
    # The history of each state this submission has been in.
    StateHistory stateHistory?;
};
