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
public type CardsAttachments record {
    # A file
    string file?;
    # A string with a length from 0 to 256
    string mimeType?;
    # A string with a length from 0 to 256
    string name?;
    # A URL starting with http:// or https:// or null
    string url?;
};

public type BoardsName record {
    # A string with a length from 1 to 16384
    string value?;
};

public type MyprefsShowlistguide record {
    # True or false
    string value?;
};

public type OrganizationsDisplayname record {
    # A string with a length of at least 1.  Cannot begin or end with a space.
    string value?;
};

public type BoardsDesc record {
    # A string with a length from 0 to 16384
    string value?;
};

public type MembersInitials record {
    # A string with a length from 1 to 4.  Cannot begin or end with a space
    string value?;
};

public type MembersUsername record {
    # A string with a length of at least 3.  Only lowercase letters, underscores, and numbers are allowed.  Must be unique.
    string value?;
};

public type Lists record {
    # True or false
    string closed?;
    # ID of the board that the list should be added to
    string idBoard?;
    # The ID of the list to copy into a new list.
    string idListSource?;
    # A string with a length from 1 to 16384
    string name?;
    # A position. top , bottom , or a positive number.
    string pos?;
    # True or false
    string subscribed?;
};

public type BoardsLabels record {
    # A valid label color or null
    string color?;
    # A string with a length from 0 to 16384
    string name?;
};

public type BoardsClosed record {
    # True or false
    string value?;
};

public type WebhooksCallbackurl record {
    # A valid URL that is reachable with a HEAD request
    string value?;
};

public type LabelnamesGreen record {
    # A string with a length from 0 to 16384
    string value?;
};

public type PrefsSelfjoin record {
    # True or false
    string value?;
};

public type CardsChecklistCheckitemPos record {
    # A position. top , bottom , or a positive number.
    string value?;
};

public type CardsChecklistCheckitemState record {
    # One of: complete, false, incomplete or true
    string value?;
};

public type ListsName record {
    # A string with a length from 1 to 16384
    string value?;
};

public type OrganizationsMembers record {
    # An email address
    string email?;
    # A string with a length of at least 1.  Cannot begin or end with a space.
    string fullName?;
    # One of: admin, normal or observer
    string 'type?;
};

public type Actions record {
    # A string with a length from 1 to 16384
    string text?;
};

public type OrganizationsName record {
    # A string with a length of at least 3.  Only lowercase letters, underscores, and numbers are allowed.  Must be unique.
    string value?;
};

public type Sessions record {
    # The ID of the board you&#39;re viewing.  Boards with no viewers will not get updates about members&#39; statuses.
    string idBoard?;
    # One of: active, disconnected or idle
    string status?;
};

public type MyprefsShowsidebarboardactions record {
    # True or false
    string value?;
};

public type Labels record {
    # A valid label color or null
    string color?;
    # An ID
    string idBoard?;
    # A string with a length from 0 to 16384
    string name?;
};

public type PrefsBackground record {
    # A standard background name, or the ID of a custom background
    string value?;
};

public type LabelnamesBlue record {
    # A string with a length from 0 to 16384
    string value?;
};

public type MembersBoardstars record {
    # The ID of the board to star
    string idBoard?;
    # A position. top , bottom , or a positive number.
    string pos?;
};

public type Checklists record {
    # ID of the board that the checklist should be added to
    string idBoard?;
    # ID of the card that the checklist should be added to
    string idCard?;
    # The ID of the source checklist to copy into a new checklist.
    string idChecklistSource?;
    # A string with a length from 0 to 16384
    string name?;
    # A position. top , bottom , or a positive number.
    string pos?;
};

public type OrganizationsWebsite record {
    # A URL starting with http:// or https:// or null
    string value?;
};

public type OrganizationsDesc record {
    # A string with a length from 0 to 16384
    string value?;
};

public type BoardsMembers record {
    # An email address
    string email?;
    # A string with a length of at least 1.  Cannot begin or end with a space.
    string fullName?;
    # One of: admin, normal or observer
    string 'type?;
};

public type BoardsChecklists record {
    # A string with a length from 1 to 16384
    string name?;
};

public type BoardsPowerups record {
    # One of: calendar, cardAging, recap or voting
    string value?;
};

public type Members record {
    # One of: gravatar, none or upload
    string avatarSource?;
    # A string with a length from 0 to 16384
    string bio?;
    # A string with a length of at least 1.  Cannot begin or end with a space.
    string fullName?;
    # A string with a length from 1 to 4.  Cannot begin or end with a space
    string initials?;
    # A string with a length of at least 3.  Only lowercase letters, underscores, and numbers are allowed.  Must be unique.
    string username?;
};

public type CardsStickers record {
    # A string with a length from 0 to 16384
    string image?;
    # Undefined
    string left?;
    # Undefined
    string rotate?;
    # Undefined
    string top?;
    # Valid Z values for stickers, must be an integer
    string zIndex?;
};

public type OrganizationsLogo record {
    # A file
    string file?;
};

public type SessionsStatus record {
    # One of: active, disconnected or idle
    string value?;
};

public type OrganizationsMemberships record {
    # All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    string member_fields?;
    # One of: admin, normal or observer
    string 'type?;
};

public type PrefsLocale record {
    # A string with a length from 0 to 255
    string value?;
};

public type MembersSavedsearchesQuery record {
    # A string with a length from 1 to 16384
    string value?;
};

public type MembersBoardstarsIdboard record {
    # An ID
    string value?;
};

public type CardsIdboard record {
    # ID of the list that the card should be moved to on the new board
    string idList?;
    # ID of the board the card should be moved to
    string value?;
};

public type ChecklistsName record {
    # A string with a length from 1 to 16384
    string value?;
};

public type MembersBoardbackgrounds record {
    # One of: dark, light or unknown
    string brightness?;
    # A file
    string file?;
    # True or false
    string tile?;
};

public type CardsIdattachmentcover record {
    # ID of the image attachment of this card to use as its cover, or null for no cover
    string value?;
};

public type TokensWebhooks record {
    # A valid URL that is reachable with a HEAD request
    string callbackURL?;
    # A string with a length from 0 to 16384
    string description?;
    # ID of the model to be monitored
    string idModel?;
};

public type BoardsIdorganization record {
    # A string with a length from 0 to 16384
    string value?;
};

public type BoardsMemberships record {
    # All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    string member_fields?;
    # One of: admin, normal or observer
    string 'type?;
};

public type PrefsAssociateddomain record {
    # The google apps domain to link this org to.
    string value?;
};

public type WebhooksDescription record {
    # A string with a length from 0 to 16384
    string value?;
};

public type PrefsBoardvisibilityrestrict record {
    # One of: admin, none or org
    string value?;
};

public type CardsChecklistCheckitemName record {
    # A string with a length from 1 to 16384
    string value?;
};

public type PrefsMinutesbetweensummaries record {
    # -1 (disabled), 1 or 60
    string value?;
};

public type MyprefsShowsidebar record {
    # True or false
    string value?;
};

public type ActionsText record {
    # A string with a length from 1 to 16384
    string value?;
};

public type ChecklistsIdcard record {
    # The ID of the card that the checklist is on
    string value?;
};

public type LabelnamesPurple record {
    # A string with a length from 0 to 16384
    string value?;
};

public type PrefsCardcovers record {
    # True or false
    string value?;
};

public type Organizations record {
    # A string with a length from 0 to 16384
    string desc?;
    # A string with a length of at least 1.  Cannot begin or end with a space.
    string displayName?;
    # A string with a length from 0 to 16384
    string name?;
    # A URL starting with http:// or https:// or null
    string website?;
};

public type CardsMembersvoted record {
    # The ID of the member to vote &#39;yes&#39; on the card
    string value?;
};

public type Webhooks record {
    # True or false
    string active?;
    # A valid URL that is reachable with a HEAD request
    string callbackURL?;
    # A string with a length from 0 to 16384
    string description?;
    # ID of the model that should be hooked
    string idModel?;
};

public type CardsPos record {
    # A position. top , bottom , or a positive number.
    string value?;
};

public type CardsChecklistIdchecklistcurrentCheckitem record {
    # An ID, or null
    string idChecklist?;
    # A string with a length from 1 to 16384
    string name?;
    # A position. top , bottom , or a positive number.
    string pos?;
    # One of: complete, false, incomplete or true
    string state?;
};

public type MembersSavedsearchesPos record {
    # A position. top , bottom , or a positive number.
    string value?;
};

public type LabelsColor record {
    # A valid label color or null
    string value?;
};

public type MembersFullname record {
    # A string with a length of at least 1.  Cannot begin or end with a space.
    string value?;
};

public type ListsPos record {
    # A position. top , bottom , or a positive number.
    string value?;
};

public type MyprefsShowsidebaractivity record {
    # True or false
    string value?;
};

public type Boards record {
    # True or false
    string closed?;
    # A string with a length from 0 to 16384
    string desc?;
    # The ID of the board to copy into the new board
    string idBoardSource?;
    # The ID or name of the organization to add the board to.
    string idOrganization?;
    # Components of the source board to copy.
    string keepFromSource?;
    # A string with a length from 1 to 16384
    string name?;
    # All or a comma-separated list of: calendar, cardAging, recap or voting
    string powerUps?;
    # A string with a length from 0 to 16384
    string prefs_background?;
    # One of: pirate or regular
    string prefs_cardAging?;
    # True or false
    string prefs_cardCovers?;
    # One of: disabled, members, observers, org or public
    string prefs_comments?;
    # One of: admins or members
    string prefs_invitations?;
    # One of: org, private or public
    string prefs_permissionLevel?;
    # True or false
    string prefs_selfJoin?;
    # One of: disabled, members, observers, org or public
    string prefs_voting?;
    # True or false
    string subscribed?;
};

public type PrefsGoogleappsversion record {
    # A number from 1 to 2
    string value?;
};

public type CardsClosed record {
    # True or false
    string value?;
};

public type CardsChecklistCheckitem record {
    # A string with a length from 1 to 16384
    string name?;
    # A position. top , bottom , or a positive number.
    string pos?;
};

public type CardsIdlist record {
    # ID of the list the card should be moved to
    string value?;
};

public type ChecklistsPos record {
    # A position. top , bottom , or a positive number.
    string value?;
};

public type LabelnamesYellow record {
    # A string with a length from 0 to 16384
    string value?;
};

public type ListsCards record {
    # A string with a length from 0 to 16384
    string desc?;
    # A date, or null
    string due?;
    # A comma-separated list of objectIds, 24-character hex strings
    string idMembers?;
    # All or a comma-separated list of: blue, green, orange, purple, red or yellow
    string labels?;
    # A string with a length from 1 to 16384
    string name?;
};

public type CardsLabels record {
    # A valid label color or null
    string color?;
    # A string with a length from 0 to 16384
    string name?;
    # All or a comma-separated list of: blue, green, orange, purple, red or yellow
    string value?;
};

public type Cards record {
    # True or false
    string closed?;
    # A string with a length from 0 to 16384
    string desc?;
    # A date, or null
    string due?;
    # A file
    string fileSource?;
    # ID of the image attachment of this card to use as its cover, or null for no cover
    string idAttachmentCover?;
    # ID of the board the card should be moved to
    string idBoard?;
    # The ID of the card to copy into a new card.
    string idCardSource?;
    # A comma-separated list of objectIds, 24-character hex strings
    string idLabels?;
    # ID of the list that the card should be added to
    string idList?;
    # A comma-separated list of objectIds, 24-character hex strings
    string idMembers?;
    # Properties of the card to copy over from the source.
    string keepFromSource?;
    # All or a comma-separated list of: blue, green, orange, purple, red or yellow
    string labels?;
    # The name of the new card.  It isn&#39;t required if the name is being copied from provided by a URL, file or card that is being copied.
    string name?;
    # A position. top , bottom , or a positive number.
    string pos?;
    # True or false
    string subscribed?;
    # A URL starting with http:// or https:// or null
    string urlSource?;
};

public type PrefsComments record {
    # One of: disabled, members, observers, org or public
    string value?;
};

public type LabelnamesRed record {
    # A string with a length from 0 to 16384
    string value?;
};

public type MembersAvatarsource record {
    # One of: gravatar, none or upload
    string value?;
};

public type MembersBio record {
    # A string with a length from 0 to 16384
    string value?;
};

public type ChecklistsCheckitems record {
    # True or false
    string checked?;
    # A string with a length from 1 to 16384
    string name?;
    # A position. top , bottom , or a positive number.
    string pos?;
};

public type BoardsLists record {
    # A string with a length from 1 to 16384
    string name?;
    # A position. top , bottom , or a positive number.
    string pos?;
};

public type MembersSavedsearches record {
    # A non-empty string with at least one non-space character
    string name?;
    # A position. top , bottom , or a positive number.
    string pos?;
    # A string with a length from 1 to 16384
    string query?;
};

public type PrefsInvitations record {
    # One of: admins or members
    string value?;
};

public type CardsActionsComments record {
    # A string with a length from 1 to 16384
    string text?;
};

public type CardsDesc record {
    # A string with a length from 0 to 16384
    string value?;
};

public type CardsName record {
    # A string with a length from 1 to 16384
    string value?;
};

public type MyprefsShowsidebarmembers record {
    # True or false
    string value?;
};

public type CardsIdmembers record {
    # The ID of the member to add to the card
    string value?;
};

public type PrefsVoting record {
    # One of: disabled, members, observers, org or public
    string value?;
};

public type MyprefsEmailposition record {
    # One of: bottom or top
    string value?;
};

public type ListsMoveallcards record {
    # ID of the board that the cards should be moved to
    string idBoard?;
};

public type MembersSavedsearchesName record {
    # A non-empty string with at least one non-space character
    string value?;
};

public type PrefsPermissionlevel record {
    # One of: private or public
    string value?;
};

public type Notifications record {
    # True or false
    string unread?;
};

public type CardsChecklists record {
    # The ID of the source checklist to copy into a new checklist.
    string idChecklistSource?;
    # A string with a length from 0 to 16384
    string name?;
    # The ID of the checklist to add to the card, or null to create a new one.
    string value?;
};

public type WebhooksActive record {
    # True or false
    string value?;
};

public type LabelsName record {
    # A string with a length from 0 to 16384
    string value?;
};

public type MembersOnetimemessagesdismissed record {
    # Type of message dismissed
    string value?;
};

public type MembersCustomstickers record {
    # A file
    string file?;
};

public type MembersCustomemoji record {
    # A file
    string file?;
    # A string with a length from 2 to 64
    string name?;
};

public type NotificationsUnread record {
    # True or false
    string value?;
};

public type OrganizationsMembersDeactivated record {
    # True or false
    string value?;
};

public type CardsDue record {
    # A date, or null
    string value?;
};

public type ListsIdboard record {
    # Position of the list on the new board
    string pos?;
    # ID of the board the list should be moved to
    string value?;
};

public type PrefsColorblind record {
    # True or false
    string value?;
};

public type CardsIdlabels record {
    # The ID of the label to add
    string value?;
};

public type PrefsExternalmembersdisabled record {
    # True or false
    string value?;
};

public type PrefsCalendarfeedenabled record {
    # True or false
    string value?;
};

public type ActionsComments record {
    # A string with a length from 1 to 16384
    string text?;
};

public type MembersBoardstarsPos record {
    # A position. top , bottom , or a positive number.
    string value?;
};

public type CardsSubscribed record {
    # True or false
    string value?;
};

public type ListsClosed record {
    # True or false
    string value?;
};

public type MyprefsIdemaillist record {
    # An ID
    string value?;
};

public type MembersAvatar record {
    # A file
    string file?;
};

public type PrefsCardaging record {
    # One of: pirate or regular
    string value?;
};

public type WebhooksIdmodel record {
    # ID of the model to be monitored
    string value?;
};

public type BoardsSubscribed record {
    # True or false
    string value?;
};

public type PrefsOrginviterestrict record {
    # An email address with optional expansion tokens
    string value?;
};

public type MembersCustomboardbackgrounds record {
    # One of: dark, light or unknown
    string brightness?;
    # A file
    string file?;
    # True or false
    string tile?;
};

public type LabelnamesOrange record {
    # A string with a length from 0 to 16384
    string value?;
};

public type ListsSubscribed record {
    # True or false
    string value?;
};
