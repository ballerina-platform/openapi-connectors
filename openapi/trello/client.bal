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

import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

# Please visit [here](https://trello.com/app-key) and obtain an `Key` and `Token`
#
# + apiKeys - Provide your API Key as `'key` and `token`. Eg: `{'key: trelloKey, token: trelloToken}`
public type ApiKeysConfig record {
    map<string> apiKeys;
};

# Client endpoint for Trello API
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    map<string> apiKeys;
    # Client initialization.
    #
    # + apiKeyConfig - API key configuration details
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return -  Error at failure of client initialization    
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://trello.com/1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys;
    }
    # Get batch
    #
    # + urls - List of API v1 GET routes, not including the version prefix
    # + return - Success
    remote isolated function getBatch(string urls) returns http:Response | error {
        string  path = string `/batch`;
        map<anydata> queryParam = {"urls": urls, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add new board
    #
    # + payload - Attributes of "Boards" to be added.
    # + return - Success
    remote isolated function addBoards(Boards payload) returns http:Response | error {
        string  path = string `/boards`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Get board by ID
    #
    # + idBoard - Board_id
    # + actions - All or a comma-separated list of: addAttachmentToCard, addChecklistToCard, addMemberToBoard, addMemberToCard, addMemberToOrganization, addToOrganizationBoard, commentCard, convertToCardFromCheckItem, copyBoard, copyCard, copyCommentCard, createBoard, createCard, createList, createOrganization, deleteAttachmentFromCard, deleteBoardInvitation, deleteCard, deleteOrganizationInvitation, disablePowerUp, emailCard, enablePowerUp, makeAdminOfBoard, makeNormalMemberOfBoard, makeNormalMemberOfOrganization, makeObserverOfBoard, memberJoinedTrello, moveCardFromBoard, moveCardToBoard, moveListFromBoard, moveListToBoard, removeChecklistFromCard, removeFromOrganizationBoard, removeMemberFromCard, unconfirmedBoardInvitation, unconfirmedOrganizationInvitation, updateBoard, updateCard, updateCard:closed, updateCard:desc, updateCard:idList, updateCard:name, updateCheckItemStateOnCard, updateChecklist, updateList, updateList:closed, updateList:name, updateMember or updateOrganization
    # + actionsEntities - True or false
    # + actionsDisplay - True or false
    # + actionsFormat - One of: count, list or minimal
    # + actionsSince - A date, null or lastView
    # + actionsLimit - A number from 0 to 1000
    # + actionFields - All or a comma-separated list of: data, date, idMemberCreator or type
    # + actionMember - True or false
    # + actionMemberFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + actionMembercreator - True or false
    # + actionMembercreatorFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + cards - One of: all, closed, none, open or visible
    # + cardFields - All or a comma-separated list of: badges, checkItemStates, closed, dateLastActivity, desc, descData, due, email, idAttachmentCover, idBoard, idChecklists, idLabels, idList, idMembers, idMembersVoted, idShort, labels, manualCoverAttachment, name, pos, shortLink, shortUrl, subscribed or url
    # + cardAttachments - A boolean value or &quot;cover&quot; for only card cover attachments
    # + cardAttachmentFields - All or a comma-separated list of: bytes, date, edgeColor, idMember, isUpload, mimeType, name, previews or url
    # + cardChecklists - One of: all or none
    # + cardStickers - True or false
    # + boardStars - One of: mine or none
    # + labels - One of: all or none
    # + labelFields - All or a comma-separated list of: color, idBoard, name or uses
    # + labelsLimit - A number from 0 to 1000
    # + lists - One of: all, closed, none or open
    # + listFields - All or a comma-separated list of: closed, idBoard, name, pos or subscribed
    # + memberships - All or a comma-separated list of: active, admin, deactivated, me or normal
    # + membershipsMember - True or false
    # + membershipsMemberFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + members - One of: admins, all, none, normal or owners
    # + memberFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + membersInvited - One of: admins, all, none, normal or owners
    # + membersinvitedFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + checklists - One of: all or none
    # + checklistFields - All or a comma-separated list of: idBoard, idCard, name or pos
    # + organization - True or false
    # + organizationFields - All or a comma-separated list of: billableMemberCount, desc, descData, displayName, idBoards, invitations, invited, logoHash, memberships, name, powerUps, prefs, premiumFeatures, products, url or website
    # + organizationMemberships - All or a comma-separated list of: active, admin, deactivated, me or normal
    # + myPrefs - True or false
    # + fields - All or a comma-separated list of: closed, dateLastActivity, dateLastView, desc, descData, idOrganization, invitations, invited, labelNames, memberships, name, pinned, powerUps, prefs, shortLink, shortUrl, starred, subscribed or url
    # + return - Success
    remote isolated function getBoardsByIdBoard(string idBoard, string? actions = (), string? actionsEntities = (), string? actionsDisplay = (), string? actionsFormat = "list", string? actionsSince = (), string? actionsLimit = "50", string? actionFields = "all", string? actionMember = (), string? actionMemberFields = "avatarHash, fullName, initials and username", string? actionMembercreator = (), string? actionMembercreatorFields = "avatarHash, fullName, initials and username", string? cards = "none", string? cardFields = "all", string? cardAttachments = (), string? cardAttachmentFields = "all", string? cardChecklists = "none", string? cardStickers = (), string? boardStars = "none", string? labels = "none", string? labelFields = "all", string? labelsLimit = "50", string? lists = "none", string? listFields = "all", string? memberships = "none", string? membershipsMember = (), string? membershipsMemberFields = "fullName and username", string? members = "none", string? memberFields = "avatarHash, initials, fullName, username and confirmed", string? membersInvited = "none", string? membersinvitedFields = "avatarHash, initials, fullName and username", string? checklists = "none", string? checklistFields = "all", string? organization = (), string? organizationFields = "name and displayName", string? organizationMemberships = "none", string? myPrefs = (), string? fields = "name, desc, descData, closed, idOrganization, pinned, url, shortUrl, prefs and labelNames") returns http:Response | error {
        string  path = string `/boards/${idBoard}`;
        map<anydata> queryParam = {"actions": actions, "actions_entities": actionsEntities, "actions_display": actionsDisplay, "actions_format": actionsFormat, "actions_since": actionsSince, "actions_limit": actionsLimit, "action_fields": actionFields, "action_member": actionMember, "action_member_fields": actionMemberFields, "action_memberCreator": actionMembercreator, "action_memberCreator_fields": actionMembercreatorFields, "cards": cards, "card_fields": cardFields, "card_attachments": cardAttachments, "card_attachment_fields": cardAttachmentFields, "card_checklists": cardChecklists, "card_stickers": cardStickers, "boardStars": boardStars, "labels": labels, "label_fields": labelFields, "labels_limit": labelsLimit, "lists": lists, "list_fields": listFields, "memberships": memberships, "memberships_member": membershipsMember, "memberships_member_fields": membershipsMemberFields, "members": members, "member_fields": memberFields, "membersInvited": membersInvited, "membersInvited_fields": membersinvitedFields, "checklists": checklists, "checklist_fields": checklistFields, "organization": organization, "organization_fields": organizationFields, "organization_memberships": organizationMemberships, "myPrefs": myPrefs, "fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update boards by ID
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Boards" to be updated.
    # + return - Success
    remote isolated function updateBoardsByIdBoard(string idBoard, Boards payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Get boards actions by ID board
    #
    # + idBoard - Board_id
    # + entities - True or false
    # + display - True or false
    # + filter - All or a comma-separated list of: addAttachmentToCard, addChecklistToCard, addMemberToBoard, addMemberToCard, addMemberToOrganization, addToOrganizationBoard, commentCard, convertToCardFromCheckItem, copyBoard, copyCard, copyCommentCard, createBoard, createCard, createList, createOrganization, deleteAttachmentFromCard, deleteBoardInvitation, deleteCard, deleteOrganizationInvitation, disablePowerUp, emailCard, enablePowerUp, makeAdminOfBoard, makeNormalMemberOfBoard, makeNormalMemberOfOrganization, makeObserverOfBoard, memberJoinedTrello, moveCardFromBoard, moveCardToBoard, moveListFromBoard, moveListToBoard, removeChecklistFromCard, removeFromOrganizationBoard, removeMemberFromCard, unconfirmedBoardInvitation, unconfirmedOrganizationInvitation, updateBoard, updateCard, updateCard:closed, updateCard:desc, updateCard:idList, updateCard:name, updateCheckItemStateOnCard, updateChecklist, updateList, updateList:closed, updateList:name, updateMember or updateOrganization
    # + fields - All or a comma-separated list of: data, date, idMemberCreator or type
    # + 'limit - A number from 0 to 1000
    # + format - One of: count, list or minimal
    # + since - A date, null or lastView
    # + before - A date, or null
    # + page - Page * limit must be less than 1000
    # + idModels - Only return actions related to these model ids
    # + member - True or false
    # + memberFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + memberCreator - True or false
    # + membercreatorFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + return - Success
    remote isolated function getBoardsActionsByIdBoard(string idBoard, string? entities = (), string? display = (), string? filter = "all", string? fields = "all", string? 'limit = "50", string? format = "list", string? since = (), string? before = (), string? page = "0", string? idModels = (), string? member = (), string? memberFields = "avatarHash, fullName, initials and username", string? memberCreator = (), string? membercreatorFields = "avatarHash, fullName, initials and username") returns http:Response | error {
        string  path = string `/boards/${idBoard}/actions`;
        map<anydata> queryParam = {"entities": entities, "display": display, "filter": filter, "fields": fields, "limit": 'limit, "format": format, "since": since, "before": before, "page": page, "idModels": idModels, "member": member, "member_fields": memberFields, "memberCreator": memberCreator, "memberCreator_fields": membercreatorFields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get boards board stars by ID
    #
    # + idBoard - Board_id
    # + filter - One of: mine or none
    # + return - Success
    remote isolated function getBoardsBoardStarsByIdBoard(string idBoard, string? filter = "mine") returns http:Response | error {
        string  path = string `/boards/${idBoard}/boardStars`;
        map<anydata> queryParam = {"filter": filter, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add boards calendar key generate by ID
    #
    # + idBoard - Board_id
    # + return - Success
    remote isolated function addBoardsCalendarKeyGenerateByIdBoard(string idBoard) returns http:Response | error {
        string  path = string `/boards/${idBoard}/calendarKey/generate`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> post(path, request, targetType = http:Response );
        return response;
    }
    # Get boards cards by ID board
    #
    # + idBoard - Board_id
    # + actions - All or a comma-separated list of: addAttachmentToCard, addChecklistToCard, addMemberToBoard, addMemberToCard, addMemberToOrganization, addToOrganizationBoard, commentCard, convertToCardFromCheckItem, copyBoard, copyCard, copyCommentCard, createBoard, createCard, createList, createOrganization, deleteAttachmentFromCard, deleteBoardInvitation, deleteCard, deleteOrganizationInvitation, disablePowerUp, emailCard, enablePowerUp, makeAdminOfBoard, makeNormalMemberOfBoard, makeNormalMemberOfOrganization, makeObserverOfBoard, memberJoinedTrello, moveCardFromBoard, moveCardToBoard, moveListFromBoard, moveListToBoard, removeChecklistFromCard, removeFromOrganizationBoard, removeMemberFromCard, unconfirmedBoardInvitation, unconfirmedOrganizationInvitation, updateBoard, updateCard, updateCard:closed, updateCard:desc, updateCard:idList, updateCard:name, updateCheckItemStateOnCard, updateChecklist, updateList, updateList:closed, updateList:name, updateMember or updateOrganization
    # + attachments - A boolean value or &quot;cover&quot; for only card cover attachments
    # + attachmentFields - All or a comma-separated list of: bytes, date, edgeColor, idMember, isUpload, mimeType, name, previews or url
    # + stickers - True or false
    # + members - True or false
    # + memberFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + checkItemStates - True or false
    # + checklists - One of: all or none
    # + 'limit - A number from 1 to 1000
    # + since - A date, or null
    # + before - A date, or null
    # + filter - One of: all, closed, none, open or visible
    # + fields - All or a comma-separated list of: badges, checkItemStates, closed, dateLastActivity, desc, descData, due, email, idAttachmentCover, idBoard, idChecklists, idLabels, idList, idMembers, idMembersVoted, idShort, labels, manualCoverAttachment, name, pos, shortLink, shortUrl, subscribed or url
    # + return - Success
    remote isolated function getBoardsCardsByIdBoard(string idBoard, string? actions = (), string? attachments = (), string? attachmentFields = "all", string? stickers = (), string? members = (), string? memberFields = "avatarHash, fullName, initials and username", string? checkItemStates = (), string? checklists = "none", string? 'limit = (), string? since = (), string? before = (), string? filter = "visible", string? fields = "all") returns http:Response | error {
        string  path = string `/boards/${idBoard}/cards`;
        map<anydata> queryParam = {"actions": actions, "attachments": attachments, "attachment_fields": attachmentFields, "stickers": stickers, "members": members, "member_fields": memberFields, "checkItemStates": checkItemStates, "checklists": checklists, "limit": 'limit, "since": since, "before": before, "filter": filter, "fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get boards cards by ID board by filter
    #
    # + idBoard - Board_id
    # + filter - Filter
    # + return - Success
    remote isolated function getBoardsCardsByIdBoardByFilter(string idBoard, string filter) returns http:Response | error {
        string  path = string `/boards/${idBoard}/cards/${filter}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get boards cards by ID board by ID card
    #
    # + idBoard - Board_id
    # + idCard - IdCard
    # + attachments - A boolean value or &quot;cover&quot; for only card cover attachments
    # + attachmentFields - All or a comma-separated list of: bytes, date, edgeColor, idMember, isUpload, mimeType, name, previews or url
    # + actions - All or a comma-separated list of: addAttachmentToCard, addChecklistToCard, addMemberToBoard, addMemberToCard, addMemberToOrganization, addToOrganizationBoard, commentCard, convertToCardFromCheckItem, copyBoard, copyCard, copyCommentCard, createBoard, createCard, createList, createOrganization, deleteAttachmentFromCard, deleteBoardInvitation, deleteCard, deleteOrganizationInvitation, disablePowerUp, emailCard, enablePowerUp, makeAdminOfBoard, makeNormalMemberOfBoard, makeNormalMemberOfOrganization, makeObserverOfBoard, memberJoinedTrello, moveCardFromBoard, moveCardToBoard, moveListFromBoard, moveListToBoard, removeChecklistFromCard, removeFromOrganizationBoard, removeMemberFromCard, unconfirmedBoardInvitation, unconfirmedOrganizationInvitation, updateBoard, updateCard, updateCard:closed, updateCard:desc, updateCard:idList, updateCard:name, updateCheckItemStateOnCard, updateChecklist, updateList, updateList:closed, updateList:name, updateMember or updateOrganization
    # + actionsEntities - True or false
    # + actionsDisplay - True or false
    # + actionsLimit - A number from 0 to 1000
    # + actionFields - All or a comma-separated list of: data, date, idMemberCreator or type
    # + actionMembercreatorFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + members - True or false
    # + memberFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + checkItemStates - True or false
    # + checkitemstateFields - All or a comma-separated list of: idCheckItem or state
    # + labels - True or false
    # + checklists - One of: all or none
    # + checklistFields - All or a comma-separated list of: idBoard, idCard, name or pos
    # + fields - All or a comma-separated list of: badges, checkItemStates, closed, dateLastActivity, desc, descData, due, email, idAttachmentCover, idBoard, idChecklists, idLabels, idList, idMembers, idMembersVoted, idShort, labels, manualCoverAttachment, name, pos, shortLink, shortUrl, subscribed or url
    # + return - Success
    remote isolated function getBoardsCardsByIdBoardByIdCard(string idBoard, string idCard, string? attachments = (), string? attachmentFields = "all", string? actions = (), string? actionsEntities = (), string? actionsDisplay = (), string? actionsLimit = "50", string? actionFields = "all", string? actionMembercreatorFields = "avatarHash, fullName, initials and username", string? members = (), string? memberFields = "avatarHash, initials, fullName and username", string? checkItemStates = (), string? checkitemstateFields = "all", string? labels = (), string? checklists = "none", string? checklistFields = "all", string? fields = "all") returns http:Response | error {
        string  path = string `/boards/${idBoard}/cards/${idCard}`;
        map<anydata> queryParam = {"attachments": attachments, "attachment_fields": attachmentFields, "actions": actions, "actions_entities": actionsEntities, "actions_display": actionsDisplay, "actions_limit": actionsLimit, "action_fields": actionFields, "action_memberCreator_fields": actionMembercreatorFields, "members": members, "member_fields": memberFields, "checkItemStates": checkItemStates, "checkItemState_fields": checkitemstateFields, "labels": labels, "checklists": checklists, "checklist_fields": checklistFields, "fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get boards checklists by ID board
    #
    # + idBoard - Board_id
    # + cards - One of: all, closed, none, open or visible
    # + cardFields - All or a comma-separated list of: badges, checkItemStates, closed, dateLastActivity, desc, descData, due, email, idAttachmentCover, idBoard, idChecklists, idLabels, idList, idMembers, idMembersVoted, idShort, labels, manualCoverAttachment, name, pos, shortLink, shortUrl, subscribed or url
    # + checkItems - One of: all or none
    # + checkitemFields - All or a comma-separated list of: name, nameData, pos, state or type
    # + filter - One of: all or none
    # + fields - All or a comma-separated list of: idBoard, idCard, name or pos
    # + return - Success
    remote isolated function getBoardsChecklistsByIdBoard(string idBoard, string? cards = "none", string? cardFields = "all", string? checkItems = "all", string? checkitemFields = "name, nameData, pos and state", string? filter = "all", string? fields = "all") returns http:Response | error {
        string  path = string `/boards/${idBoard}/checklists`;
        map<anydata> queryParam = {"cards": cards, "card_fields": cardFields, "checkItems": checkItems, "checkItem_fields": checkitemFields, "filter": filter, "fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add boards checklists by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Boards Checklists" to be added.
    # + return - Success
    remote isolated function addBoardsChecklistsByIdBoard(string idBoard, BoardsChecklists payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/checklists`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Update boards closed by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Boards Closed" to be updated.
    # + return - Success
    remote isolated function updateBoardsClosedByIdBoard(string idBoard, BoardsClosed payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/closed`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Get boards deltas by ID board
    #
    # + idBoard - Board_id
    # + tags - A valid tag for subscribing
    # + ixLastUpdate - A number from -1 to Infinity
    # + return - Success
    remote isolated function getBoardsDeltasByIdBoard(string idBoard, string tags, string ixLastUpdate) returns http:Response | error {
        string  path = string `/boards/${idBoard}/deltas`;
        map<anydata> queryParam = {"tags": tags, "ixLastUpdate": ixLastUpdate, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update boards desc by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Boards Desc" to be updated.
    # + return - Success
    remote isolated function updateBoardsDescByIdBoard(string idBoard, BoardsDesc payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/desc`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Add boards email key generate by ID board
    #
    # + idBoard - Board_id
    # + return - Success
    remote isolated function addBoardsEmailKeyGenerateByIdBoard(string idBoard) returns http:Response | error {
        string  path = string `/boards/${idBoard}/emailKey/generate`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> post(path, request, targetType = http:Response );
        return response;
    }
    # Update boards ID organization by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Boards ID Organization" to be updated.
    # + return - Success
    remote isolated function updateBoardsIdOrganizationByIdBoard(string idBoard, BoardsIdorganization payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/idOrganization`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards label names blue by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Label Names Blue" to be updated.
    # + return - Success
    remote isolated function updateBoardsLabelNamesBlueByIdBoard(string idBoard, LabelnamesBlue payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/labelNames/blue`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards label names green by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Label Names Green" to be updated.
    # + return - Success
    remote isolated function updateBoardsLabelNamesGreenByIdBoard(string idBoard, LabelnamesGreen payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/labelNames/green`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards label names orange by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Label Names Orange" to be updated.
    # + return - Success
    remote isolated function updateBoardsLabelNamesOrangeByIdBoard(string idBoard, LabelnamesOrange payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/labelNames/orange`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards label names purple by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Label Names Purple" to be updated.
    # + return - Success
    remote isolated function updateBoardsLabelNamesPurpleByIdBoard(string idBoard, LabelnamesPurple payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/labelNames/purple`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards label names red by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Label Names Red" to be updated.
    # + return - Success
    remote isolated function updateBoardsLabelNamesRedByIdBoard(string idBoard, LabelnamesRed payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/labelNames/red`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards label names yellow by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Label Names Yellow" to be updated.
    # + return - Success
    remote isolated function updateBoardsLabelNamesYellowByIdBoard(string idBoard, LabelnamesYellow payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/labelNames/yellow`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Get boards labels by ID board
    #
    # + idBoard - Board_id
    # + fields - All or a comma-separated list of: color, idBoard, name or uses
    # + 'limit - A number from 0 to 1000
    # + return - Success
    remote isolated function getBoardsLabelsByIdBoard(string idBoard, string? fields = "all", string? 'limit = "50") returns http:Response | error {
        string  path = string `/boards/${idBoard}/labels`;
        map<anydata> queryParam = {"fields": fields, "limit": 'limit, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add boards labels by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Boards Labels" to be added.
    # + return - Success
    remote isolated function addBoardsLabelsByIdBoard(string idBoard, BoardsLabels payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/labels`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Get boards labels by ID board by ID label
    #
    # + idBoard - Board_id
    # + idLabel - IdLabel
    # + fields - All or a comma-separated list of: color, idBoard, name or uses
    # + return - Success
    remote isolated function getBoardsLabelsByIdBoardByIdLabel(string idBoard, string idLabel, string? fields = "all") returns http:Response | error {
        string  path = string `/boards/${idBoard}/labels/${idLabel}`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get boards lists by ID board
    #
    # + idBoard - Board_id
    # + cards - One of: all, closed, none, open or visible
    # + cardFields - All or a comma-separated list of: badges, checkItemStates, closed, dateLastActivity, desc, descData, due, email, idAttachmentCover, idBoard, idChecklists, idLabels, idList, idMembers, idMembersVoted, idShort, labels, manualCoverAttachment, name, pos, shortLink, shortUrl, subscribed or url
    # + filter - One of: all, closed, none or open
    # + fields - All or a comma-separated list of: closed, idBoard, name, pos or subscribed
    # + return - Success
    remote isolated function getBoardsListsByIdBoard(string idBoard, string? cards = "none", string? cardFields = "all", string? filter = "open", string? fields = "all") returns http:Response | error {
        string  path = string `/boards/${idBoard}/lists`;
        map<anydata> queryParam = {"cards": cards, "card_fields": cardFields, "filter": filter, "fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add boards lists by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Boards Lists" to be added.
    # + return - Success
    remote isolated function addBoardsListsByIdBoard(string idBoard, BoardsLists payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/lists`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Get boards lists by ID board by filter
    #
    # + idBoard - Board_id
    # + filter - Filter
    # + return - Success
    remote isolated function getBoardsListsByIdBoardByFilter(string idBoard, string filter) returns http:Response | error {
        string  path = string `/boards/${idBoard}/lists/${filter}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add boards mark as viewed by ID board
    #
    # + idBoard - Board_id
    # + return - Success
    remote isolated function addBoardsMarkAsViewedByIdBoard(string idBoard) returns http:Response | error {
        string  path = string `/boards/${idBoard}/markAsViewed`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> post(path, request, targetType = http:Response );
        return response;
    }
    # Get boards members by ID board
    #
    # + idBoard - Board_id
    # + filter - One of: admins, all, none, normal or owners
    # + fields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + activity - True or false ; works for premium organizations only.
    # + return - Success
    remote isolated function getBoardsMembersByIdBoard(string idBoard, string? filter = "all", string? fields = "fullName and username", string? activity = ()) returns http:Response | error {
        string  path = string `/boards/${idBoard}/members`;
        map<anydata> queryParam = {"filter": filter, "fields": fields, "activity": activity, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update boards members by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Boards Members" to be updated.
    # + return - Success
    remote isolated function updateBoardsMembersByIdBoard(string idBoard, BoardsMembers payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/members`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Get boards members by ID board by filter
    #
    # + idBoard - Board_id
    # + filter - Filter
    # + return - Success
    remote isolated function getBoardsMembersByIdBoardByFilter(string idBoard, string filter) returns http:Response | error {
        string  path = string `/boards/${idBoard}/members/${filter}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update boards members by ID board by ID member
    #
    # + idBoard - Board_id
    # + idMember - IdMember
    # + payload - Attributes of "Boards Members" to be updated.
    # + return - Success
    remote isolated function updateBoardsMembersByIdBoardByIdMember(string idBoard, string idMember, BoardsMembers payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/members/${idMember}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Delete boards members by ID board by ID member
    #
    # + idBoard - Board_id
    # + idMember - IdMember
    # + return - Success
    remote isolated function deleteBoardsMembersByIdBoardByIdMember(string idBoard, string idMember) returns http:Response | error {
        string  path = string `/boards/${idBoard}/members/${idMember}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> delete(path, request, targetType = http:Response );
        return response;
    }
    # Get boards members cards by ID board by ID member
    #
    # + idBoard - Board_id
    # + idMember - IdMember
    # + actions - All or a comma-separated list of: addAttachmentToCard, addChecklistToCard, addMemberToBoard, addMemberToCard, addMemberToOrganization, addToOrganizationBoard, commentCard, convertToCardFromCheckItem, copyBoard, copyCard, copyCommentCard, createBoard, createCard, createList, createOrganization, deleteAttachmentFromCard, deleteBoardInvitation, deleteCard, deleteOrganizationInvitation, disablePowerUp, emailCard, enablePowerUp, makeAdminOfBoard, makeNormalMemberOfBoard, makeNormalMemberOfOrganization, makeObserverOfBoard, memberJoinedTrello, moveCardFromBoard, moveCardToBoard, moveListFromBoard, moveListToBoard, removeChecklistFromCard, removeFromOrganizationBoard, removeMemberFromCard, unconfirmedBoardInvitation, unconfirmedOrganizationInvitation, updateBoard, updateCard, updateCard:closed, updateCard:desc, updateCard:idList, updateCard:name, updateCheckItemStateOnCard, updateChecklist, updateList, updateList:closed, updateList:name, updateMember or updateOrganization
    # + attachments - A boolean value or &quot;cover&quot; for only card cover attachments
    # + attachmentFields - All or a comma-separated list of: bytes, date, edgeColor, idMember, isUpload, mimeType, name, previews or url
    # + members - True or false
    # + memberFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + checkItemStates - True or false
    # + checklists - One of: all or none
    # + board - True or false
    # + boardFields - All or a comma-separated list of: closed, dateLastActivity, dateLastView, desc, descData, idOrganization, invitations, invited, labelNames, memberships, name, pinned, powerUps, prefs, shortLink, shortUrl, starred, subscribed or url
    # + list - True or false
    # + listFields - All or a comma-separated list of: closed, idBoard, name, pos or subscribed
    # + filter - One of: all, closed, none, open or visible
    # + fields - All or a comma-separated list of: badges, checkItemStates, closed, dateLastActivity, desc, descData, due, email, idAttachmentCover, idBoard, idChecklists, idLabels, idList, idMembers, idMembersVoted, idShort, labels, manualCoverAttachment, name, pos, shortLink, shortUrl, subscribed or url
    # + return - Success
    remote isolated function getBoardsMembersCardsByIdBoardByIdMember(string idBoard, string idMember, string? actions = (), string? attachments = (), string? attachmentFields = "all", string? members = (), string? memberFields = "avatarHash, fullName, initials and username", string? checkItemStates = (), string? checklists = "none", string? board = (), string? boardFields = "name, desc, closed, idOrganization, pinned, url and prefs", string? list = (), string? listFields = "all", string? filter = "visible", string? fields = "all") returns http:Response | error {
        string  path = string `/boards/${idBoard}/members/${idMember}/cards`;
        map<anydata> queryParam = {"actions": actions, "attachments": attachments, "attachment_fields": attachmentFields, "members": members, "member_fields": memberFields, "checkItemStates": checkItemStates, "checklists": checklists, "board": board, "board_fields": boardFields, "list": list, "list_fields": listFields, "filter": filter, "fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get boards members invited by ID board
    #
    # + idBoard - Board_id
    # + fields - All or a comma-separated list of: avatarHash, avatarSource, bio, bioData, confirmed, email, fullName, gravatarHash, idBoards, idBoardsPinned, idOrganizations, idPremOrgsAdmin, initials, loginTypes, memberType, oneTimeMessagesDismissed, prefs, premiumFeatures, products, status, status, trophies, uploadedAvatarHash, url or username
    # + return - Success
    remote isolated function getBoardsMembersInvitedByIdBoard(string idBoard, string? fields = "all") returns http:Response | error {
        string  path = string `/boards/${idBoard}/membersInvited`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get boards members invited by ID board by field
    #
    # + idBoard - Board_id
    # + 'field - Field
    # + return - Success
    remote isolated function getBoardsMembersInvitedByIdBoardByField(string idBoard, string 'field) returns http:Response | error {
        string  path = string `/boards/${idBoard}/membersInvited/${'field}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get boards memberships by ID board
    #
    # + idBoard - Board_id
    # + filter - All or a comma-separated list of: active, admin, deactivated, me or normal
    # + member - True or false
    # + memberFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + return - Success
    remote isolated function getBoardsMembershipsByIdBoard(string idBoard, string? filter = "all", string? member = (), string? memberFields = "fullName and username") returns http:Response | error {
        string  path = string `/boards/${idBoard}/memberships`;
        map<anydata> queryParam = {"filter": filter, "member": member, "member_fields": memberFields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get boards memberships by ID board by ID membership
    #
    # + idBoard - Board_id
    # + idMembership - IdMembership
    # + member - True or false
    # + memberFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + return - Success
    remote isolated function getBoardsMembershipsByIdBoardByIdMembership(string idBoard, string idMembership, string? member = (), string? memberFields = "fullName and username") returns http:Response | error {
        string  path = string `/boards/${idBoard}/memberships/${idMembership}`;
        map<anydata> queryParam = {"member": member, "member_fields": memberFields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update boards memberships by ID board by ID membership
    #
    # + idBoard - Board_id
    # + idMembership - IdMembership
    # + payload - Attributes of "Boards Memberships" to be updated.
    # + return - Success
    remote isolated function updateBoardsMembershipsByIdBoardByIdMembership(string idBoard, string idMembership, BoardsMemberships payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/memberships/${idMembership}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Get boards my prefs by ID board
    #
    # + idBoard - Board_id
    # + return - Success
    remote isolated function getBoardsMyPrefsByIdBoard(string idBoard) returns http:Response | error {
        string  path = string `/boards/${idBoard}/myPrefs`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update boards my prefs email position by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "My Prefs Email Position" to be updated.
    # + return - Success
    remote isolated function updateBoardsMyPrefsEmailPositionByIdBoard(string idBoard, MyprefsEmailposition payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/myPrefs/emailPosition`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards my prefs ID email list by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "My Prefs ID Email List" to be updated.
    # + return - Success
    remote isolated function updateBoardsMyPrefsIdEmailListByIdBoard(string idBoard, MyprefsIdemaillist payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/myPrefs/idEmailList`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards my prefs show list guide by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "My Prefs Show List Guide" to be updated.
    # + return - Success
    remote isolated function updateBoardsMyPrefsShowListGuideByIdBoard(string idBoard, MyprefsShowlistguide payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/myPrefs/showListGuide`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards my prefs show sidebar by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "My Prefs Show Sidebar" to be updated.
    # + return - Success
    remote isolated function updateBoardsMyPrefsShowSidebarByIdBoard(string idBoard, MyprefsShowsidebar payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/myPrefs/showSidebar`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards my prefs show sidebar activity by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "My Prefs Show Sidebar Activity" to be updated.
    # + return - Success
    remote isolated function updateBoardsMyPrefsShowSidebarActivityByIdBoard(string idBoard, MyprefsShowsidebaractivity payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/myPrefs/showSidebarActivity`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards my prefs show sidebar board actions by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "My Prefs Show Sidebar Board Actions" to be updated.
    # + return - Success
    remote isolated function updateBoardsMyPrefsShowSidebarBoardActionsByIdBoard(string idBoard, MyprefsShowsidebarboardactions payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/myPrefs/showSidebarBoardActions`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards my prefs show sidebar members by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "My Prefs Show Sidebar Members" to be updated.
    # + return - Success
    remote isolated function updateBoardsMyPrefsShowSidebarMembersByIdBoard(string idBoard, MyprefsShowsidebarmembers payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/myPrefs/showSidebarMembers`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards name by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Boards Name" to be updated.
    # + return - Success
    remote isolated function updateBoardsNameByIdBoard(string idBoard, BoardsName payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/name`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Get boards organization by ID board
    #
    # + idBoard - Board_id
    # + fields - All or a comma-separated list of: billableMemberCount, desc, descData, displayName, idBoards, invitations, invited, logoHash, memberships, name, powerUps, prefs, premiumFeatures, products, url or website
    # + return - Success
    remote isolated function getBoardsOrganizationByIdBoard(string idBoard, string? fields = "all") returns http:Response | error {
        string  path = string `/boards/${idBoard}/organization`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get boards organization by ID board by field
    #
    # + idBoard - Board_id
    # + 'field - Field
    # + return - Success
    remote isolated function getBoardsOrganizationByIdBoardByField(string idBoard, string 'field) returns http:Response | error {
        string  path = string `/boards/${idBoard}/organization/${'field}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add boards power ups by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Boards Power Ups" to be added.
    # + return - Success
    remote isolated function addBoardsPowerUpsByIdBoard(string idBoard, BoardsPowerups payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/powerUps`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Delete boards power ups by ID board by power up
    #
    # + idBoard - Board_id
    # + powerUp - PowerUp
    # + return - Success
    remote isolated function deleteBoardsPowerUpsByIdBoardByPowerUp(string idBoard, string powerUp) returns http:Response | error {
        string  path = string `/boards/${idBoard}/powerUps/${powerUp}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> delete(path, request, targetType = http:Response );
        return response;
    }
    # Update boards prefs background by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Prefs Background" to be updated.
    # + return - Success
    remote isolated function updateBoardsPrefsBackgroundByIdBoard(string idBoard, PrefsBackground payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/prefs/background`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards prefs calendar feed enabled by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Prefs Calendar Feed Enabled" to be updated.
    # + return - Success
    remote isolated function updateBoardsPrefsCalendarFeedEnabledByIdBoard(string idBoard, PrefsCalendarfeedenabled payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/prefs/calendarFeedEnabled`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards prefs card aging by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Prefs Card Aging" to be updated.
    # + return - Success
    remote isolated function updateBoardsPrefsCardAgingByIdBoard(string idBoard, PrefsCardaging payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/prefs/cardAging`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards prefs card covers by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Prefs Card Covers" to be updated.
    # + return - Success
    remote isolated function updateBoardsPrefsCardCoversByIdBoard(string idBoard, PrefsCardcovers payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/prefs/cardCovers`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards prefs comments by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Prefs Comments" to be updated.
    # + return - Success
    remote isolated function updateBoardsPrefsCommentsByIdBoard(string idBoard, PrefsComments payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/prefs/comments`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards prefs invitations by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Prefs Invitations" to be updated.
    # + return - Success
    remote isolated function updateBoardsPrefsInvitationsByIdBoard(string idBoard, PrefsInvitations payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/prefs/invitations`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards prefs permission level by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Prefs Permission Level" to be updated.
    # + return - Success
    remote isolated function updateBoardsPrefsPermissionLevelByIdBoard(string idBoard, PrefsPermissionlevel payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/prefs/permissionLevel`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards prefs self join by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Prefs Self Join" to be updated.
    # + return - Success
    remote isolated function updateBoardsPrefsSelfJoinByIdBoard(string idBoard, PrefsSelfjoin payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/prefs/selfJoin`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards prefs voting by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Prefs Voting" to be updated.
    # + return - Success
    remote isolated function updateBoardsPrefsVotingByIdBoard(string idBoard, PrefsVoting payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/prefs/voting`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update boards subscribed by ID board
    #
    # + idBoard - Board_id
    # + payload - Attributes of "Boards Subscribed" to be updated.
    # + return - Success
    remote isolated function updateBoardsSubscribedByIdBoard(string idBoard, BoardsSubscribed payload) returns http:Response | error {
        string  path = string `/boards/${idBoard}/subscribed`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Get boards by ID board by field
    #
    # + idBoard - Board_id
    # + 'field - Field
    # + return - Success
    remote isolated function getBoardsByIdBoardByField(string idBoard, string 'field) returns http:Response | error {
        string  path = string `/boards/${idBoard}/${'field}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add cards
    #
    # + payload - Attributes of "Cards" to be added.
    # + return - Success
    remote isolated function addCards(Cards payload) returns http:Response | error {
        string  path = string `/cards`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Get cards by ID card
    #
    # + idCard - Card ID or shortlink
    # + actions - All or a comma-separated list of: addAttachmentToCard, addChecklistToCard, addMemberToBoard, addMemberToCard, addMemberToOrganization, addToOrganizationBoard, commentCard, convertToCardFromCheckItem, copyBoard, copyCard, copyCommentCard, createBoard, createCard, createList, createOrganization, deleteAttachmentFromCard, deleteBoardInvitation, deleteCard, deleteOrganizationInvitation, disablePowerUp, emailCard, enablePowerUp, makeAdminOfBoard, makeNormalMemberOfBoard, makeNormalMemberOfOrganization, makeObserverOfBoard, memberJoinedTrello, moveCardFromBoard, moveCardToBoard, moveListFromBoard, moveListToBoard, removeChecklistFromCard, removeFromOrganizationBoard, removeMemberFromCard, unconfirmedBoardInvitation, unconfirmedOrganizationInvitation, updateBoard, updateCard, updateCard:closed, updateCard:desc, updateCard:idList, updateCard:name, updateCheckItemStateOnCard, updateChecklist, updateList, updateList:closed, updateList:name, updateMember or updateOrganization
    # + actionsEntities - True or false
    # + actionsDisplay - True or false
    # + actionsLimit - A number from 0 to 1000
    # + actionFields - All or a comma-separated list of: data, date, idMemberCreator or type
    # + actionMembercreatorFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + attachments - A boolean value or &quot;cover&quot; for only card cover attachments
    # + attachmentFields - All or a comma-separated list of: bytes, date, edgeColor, idMember, isUpload, mimeType, name, previews or url
    # + members - True or false
    # + memberFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + membersVoted - True or false
    # + membervotedFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + checkItemStates - True or false
    # + checkitemstateFields - All or a comma-separated list of: idCheckItem or state
    # + checklists - One of: all or none
    # + checklistFields - All or a comma-separated list of: idBoard, idCard, name or pos
    # + board - True or false
    # + boardFields - All or a comma-separated list of: closed, dateLastActivity, dateLastView, desc, descData, idOrganization, invitations, invited, labelNames, memberships, name, pinned, powerUps, prefs, shortLink, shortUrl, starred, subscribed or url
    # + list - True or false
    # + listFields - All or a comma-separated list of: closed, idBoard, name, pos or subscribed
    # + stickers - True or false
    # + stickerFields - All or a comma-separated list of: image, imageScaled, imageUrl, left, rotate, top or zIndex
    # + fields - All or a comma-separated list of: badges, checkItemStates, closed, dateLastActivity, desc, descData, due, email, idAttachmentCover, idBoard, idChecklists, idLabels, idList, idMembers, idMembersVoted, idShort, labels, manualCoverAttachment, name, pos, shortLink, shortUrl, subscribed or url
    # + return - Success
    remote isolated function getCardsByIdCard(string idCard, string? actions = (), string? actionsEntities = (), string? actionsDisplay = (), string? actionsLimit = "50", string? actionFields = "all", string? actionMembercreatorFields = "avatarHash, fullName, initials and username", string? attachments = (), string? attachmentFields = "all", string? members = (), string? memberFields = "avatarHash, fullName, initials and username", string? membersVoted = (), string? membervotedFields = "avatarHash, fullName, initials and username", string? checkItemStates = (), string? checkitemstateFields = "all", string? checklists = "none", string? checklistFields = "all", string? board = (), string? boardFields = "name, desc, descData, closed, idOrganization, pinned, url and prefs", string? list = (), string? listFields = "all", string? stickers = (), string? stickerFields = "all", string? fields = "badges, checkItemStates, closed, dateLastActivity, desc, descData, due, email, idBoard, idChecklists, idLabels, idList, idMembers, idShort, idAttachmentCover, manualCoverAttachment, labels, name, pos, shortUrl and url") returns http:Response | error {
        string  path = string `/cards/${idCard}`;
        map<anydata> queryParam = {"actions": actions, "actions_entities": actionsEntities, "actions_display": actionsDisplay, "actions_limit": actionsLimit, "action_fields": actionFields, "action_memberCreator_fields": actionMembercreatorFields, "attachments": attachments, "attachment_fields": attachmentFields, "members": members, "member_fields": memberFields, "membersVoted": membersVoted, "memberVoted_fields": membervotedFields, "checkItemStates": checkItemStates, "checkItemState_fields": checkitemstateFields, "checklists": checklists, "checklist_fields": checklistFields, "board": board, "board_fields": boardFields, "list": list, "list_fields": listFields, "stickers": stickers, "sticker_fields": stickerFields, "fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update cards by ID card
    #
    # + idCard - Card ID or shortlink
    # + payload - Attributes of "Cards" to be updated.
    # + return - Success
    remote isolated function updateCardsByIdCard(string idCard, Cards payload) returns http:Response | error {
        string  path = string `/cards/${idCard}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Delete cards by ID card
    #
    # + idCard - Card ID or shortlink
    # + return - Success
    remote isolated function deleteCardsByIdCard(string idCard) returns http:Response | error {
        string  path = string `/cards/${idCard}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> delete(path, request, targetType = http:Response );
        return response;
    }
    # Get cards actions by ID card
    #
    # + idCard - Card ID or shortlink
    # + entities - True or false
    # + display - True or false
    # + filter - All or a comma-separated list of: addAttachmentToCard, addChecklistToCard, addMemberToBoard, addMemberToCard, addMemberToOrganization, addToOrganizationBoard, commentCard, convertToCardFromCheckItem, copyBoard, copyCard, copyCommentCard, createBoard, createCard, createList, createOrganization, deleteAttachmentFromCard, deleteBoardInvitation, deleteCard, deleteOrganizationInvitation, disablePowerUp, emailCard, enablePowerUp, makeAdminOfBoard, makeNormalMemberOfBoard, makeNormalMemberOfOrganization, makeObserverOfBoard, memberJoinedTrello, moveCardFromBoard, moveCardToBoard, moveListFromBoard, moveListToBoard, removeChecklistFromCard, removeFromOrganizationBoard, removeMemberFromCard, unconfirmedBoardInvitation, unconfirmedOrganizationInvitation, updateBoard, updateCard, updateCard:closed, updateCard:desc, updateCard:idList, updateCard:name, updateCheckItemStateOnCard, updateChecklist, updateList, updateList:closed, updateList:name, updateMember or updateOrganization
    # + fields - All or a comma-separated list of: data, date, idMemberCreator or type
    # + 'limit - A number from 0 to 1000
    # + format - One of: count, list or minimal
    # + since - A date, null or lastView
    # + before - A date, or null
    # + page - Page * limit must be less than 1000
    # + idModels - Only return actions related to these model ids
    # + member - True or false
    # + memberFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + memberCreator - True or false
    # + membercreatorFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + return - Success
    remote isolated function getCardsActionsByIdCard(string idCard, string? entities = (), string? display = (), string? filter = "commentCard and updateCard:idList", string? fields = "all", string? 'limit = "50", string? format = "list", string? since = (), string? before = (), string? page = "0", string? idModels = (), string? member = (), string? memberFields = "avatarHash, fullName, initials and username", string? memberCreator = (), string? membercreatorFields = "avatarHash, fullName, initials and username") returns http:Response | error {
        string  path = string `/cards/${idCard}/actions`;
        map<anydata> queryParam = {"entities": entities, "display": display, "filter": filter, "fields": fields, "limit": 'limit, "format": format, "since": since, "before": before, "page": page, "idModels": idModels, "member": member, "member_fields": memberFields, "memberCreator": memberCreator, "memberCreator_fields": membercreatorFields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add cards actions comments by ID card
    #
    # + idCard - Card ID or shortlink
    # + payload - Attributes of "Actions Comments" to be added.
    # + return - Success
    remote isolated function addCardsActionsCommentsByIdCard(string idCard, ActionsComments payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/actions/comments`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Update cards actions comments by ID card by ID action
    #
    # + idCard - Card ID or shortlink
    # + idAction - IdAction
    # + payload - Attributes of "Cards Actions Comments" to be updated.
    # + return - Success
    remote isolated function updateCardsActionsCommentsByIdCardByIdAction(string idCard, string idAction, CardsActionsComments payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/actions/${idAction}/comments`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Delete cards actions comments by ID card by ID action
    #
    # + idCard - Card ID or shortlink
    # + idAction - IdAction
    # + return - Success
    remote isolated function deleteCardsActionsCommentsByIdCardByIdAction(string idCard, string idAction) returns http:Response | error {
        string  path = string `/cards/${idCard}/actions/${idAction}/comments`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> delete(path, request, targetType = http:Response );
        return response;
    }
    # Get cards attachments by ID card
    #
    # + idCard - Card ID or shortlink
    # + fields - All or a comma-separated list of: bytes, date, edgeColor, idMember, isUpload, mimeType, name, previews or url
    # + filter - A boolean value or &quot;cover&quot; for only card cover attachments
    # + return - Success
    remote isolated function getCardsAttachmentsByIdCard(string idCard, string? fields = "all", string? filter = ()) returns http:Response | error {
        string  path = string `/cards/${idCard}/attachments`;
        map<anydata> queryParam = {"fields": fields, "filter": filter, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add cards attachments by ID card
    #
    # + idCard - Card ID or shortlink
    # + payload - Attributes of "Cards Attachments" to be added.
    # + return - Success
    remote isolated function addCardsAttachmentsByIdCard(string idCard, CardsAttachments payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/attachments`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Get cards attachments by ID card by ID attachment
    #
    # + idCard - Card ID or shortlink
    # + idAttachment - IdAttachment
    # + fields - All or a comma-separated list of: bytes, date, edgeColor, idMember, isUpload, mimeType, name, previews or url
    # + return - Success
    remote isolated function getCardsAttachmentsByIdCardByIdAttachment(string idCard, string idAttachment, string? fields = "all") returns http:Response | error {
        string  path = string `/cards/${idCard}/attachments/${idAttachment}`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Delete cards attachments by ID card by ID attachment
    #
    # + idCard - Card ID or shortlink
    # + idAttachment - IdAttachment
    # + return - Success
    remote isolated function deleteCardsAttachmentsByIdCardByIdAttachment(string idCard, string idAttachment) returns http:Response | error {
        string  path = string `/cards/${idCard}/attachments/${idAttachment}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> delete(path, request, targetType = http:Response );
        return response;
    }
    # Get cards board by ID card
    #
    # + idCard - Card ID or shortlink
    # + fields - All or a comma-separated list of: closed, dateLastActivity, dateLastView, desc, descData, idOrganization, invitations, invited, labelNames, memberships, name, pinned, powerUps, prefs, shortLink, shortUrl, starred, subscribed or url
    # + return - Success
    remote isolated function getCardsBoardByIdCard(string idCard, string? fields = "all") returns http:Response | error {
        string  path = string `/cards/${idCard}/board`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get cards board by ID card by field
    #
    # + idCard - Card ID or shortlink
    # + 'field - Field
    # + return - Success
    remote isolated function getCardsBoardByIdCardByField(string idCard, string 'field) returns http:Response | error {
        string  path = string `/cards/${idCard}/board/${'field}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get cards check item states by ID card
    #
    # + idCard - Card ID or shortlink
    # + fields - All or a comma-separated list of: idCheckItem or state
    # + return - Success
    remote isolated function getCardsCheckItemStatesByIdCard(string idCard, string? fields = "all") returns http:Response | error {
        string  path = string `/cards/${idCard}/checkItemStates`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update cards checklist check item by ID card by ID checklist current by ID check item
    #
    # + idCard - Card ID or shortlink
    # + idChecklistCurrent - IdChecklistCurrent
    # + idCheckItem - IdCheckItem
    # + payload - Attributes of "Cards Checklist ID Checklist Current Check Item" to be updated.
    # + return - Success
    remote isolated function updateCardsChecklistCheckItemByIdCardByIdChecklistCurrentByIdCheckItem(string idCard, string idChecklistCurrent, string idCheckItem, CardsChecklistIdchecklistcurrentCheckitem payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/checklist/${idChecklistCurrent}/checkItem/${idCheckItem}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Add cards checklist check item by ID card by ID checklist
    #
    # + idCard - Card ID or shortlink
    # + idChecklist - IdChecklist
    # + payload - Attributes of "Cards Checklist Check Item" to be added.
    # + return - Success
    remote isolated function addCardsChecklistCheckItemByIdCardByIdChecklist(string idCard, string idChecklist, CardsChecklistCheckitem payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/checklist/${idChecklist}/checkItem`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Delete cards checklist check item by ID card by ID checklist by ID check item
    #
    # + idCard - Card ID or shortlink
    # + idChecklist - IdChecklist
    # + idCheckItem - IdCheckItem
    # + return - Success
    remote isolated function deleteCardsChecklistCheckItemByIdCardByIdChecklistByIdCheckItem(string idCard, string idChecklist, string idCheckItem) returns http:Response | error {
        string  path = string `/cards/${idCard}/checklist/${idChecklist}/checkItem/${idCheckItem}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> delete(path, request, targetType = http:Response );
        return response;
    }
    # Add cards checklist check item convert to card by ID card by ID checklist by ID check item
    #
    # + idCard - Card ID or shortlink
    # + idChecklist - IdChecklist
    # + idCheckItem - IdCheckItem
    # + return - Success
    remote isolated function addCardsChecklistCheckItemConvertToCardByIdCardByIdChecklistByIdCheckItem(string idCard, string idChecklist, string idCheckItem) returns http:Response | error {
        string  path = string `/cards/${idCard}/checklist/${idChecklist}/checkItem/${idCheckItem}/convertToCard`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> post(path, request, targetType = http:Response );
        return response;
    }
    # Update cards checklist check item name by ID card by ID checklist by ID check item
    #
    # + idCard - Card ID or shortlink
    # + idChecklist - IdChecklist
    # + idCheckItem - IdCheckItem
    # + payload - Attributes of "Cards Checklist Check Item Name" to be updated.
    # + return - Success
    remote isolated function updateCardsChecklistCheckItemNameByIdCardByIdChecklistByIdCheckItem(string idCard, string idChecklist, string idCheckItem, CardsChecklistCheckitemName payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/checklist/${idChecklist}/checkItem/${idCheckItem}/name`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update cards checklist check item pos by ID card by ID checklist by ID check item
    #
    # + idCard - Card ID or shortlink
    # + idChecklist - IdChecklist
    # + idCheckItem - IdCheckItem
    # + payload - Attributes of "Cards Checklist Check Item Pos" to be updated.
    # + return - Success
    remote isolated function updateCardsChecklistCheckItemPosByIdCardByIdChecklistByIdCheckItem(string idCard, string idChecklist, string idCheckItem, CardsChecklistCheckitemPos payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/checklist/${idChecklist}/checkItem/${idCheckItem}/pos`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update cards checklist check item state by ID card by ID checklist by ID check item
    #
    # + idCard - Card ID or shortlink
    # + idChecklist - IdChecklist
    # + idCheckItem - IdCheckItem
    # + payload - Attributes of "Cards Checklist Check Item State" to be updated.
    # + return - Success
    remote isolated function updateCardsChecklistCheckItemStateByIdCardByIdChecklistByIdCheckItem(string idCard, string idChecklist, string idCheckItem, CardsChecklistCheckitemState payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/checklist/${idChecklist}/checkItem/${idCheckItem}/state`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Get cards checklists by ID card
    #
    # + idCard - Card ID or shortlink
    # + cards - One of: all, closed, none, open or visible
    # + cardFields - All or a comma-separated list of: badges, checkItemStates, closed, dateLastActivity, desc, descData, due, email, idAttachmentCover, idBoard, idChecklists, idLabels, idList, idMembers, idMembersVoted, idShort, labels, manualCoverAttachment, name, pos, shortLink, shortUrl, subscribed or url
    # + checkItems - One of: all or none
    # + checkitemFields - All or a comma-separated list of: name, nameData, pos, state or type
    # + filter - One of: all or none
    # + fields - All or a comma-separated list of: idBoard, idCard, name or pos
    # + return - Success
    remote isolated function getCardsChecklistsByIdCard(string idCard, string? cards = "none", string? cardFields = "all", string? checkItems = "all", string? checkitemFields = "name, nameData, pos and state", string? filter = "all", string? fields = "all") returns http:Response | error {
        string  path = string `/cards/${idCard}/checklists`;
        map<anydata> queryParam = {"cards": cards, "card_fields": cardFields, "checkItems": checkItems, "checkItem_fields": checkitemFields, "filter": filter, "fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add cards checklists by ID card
    #
    # + idCard - Card ID or shortlink
    # + payload - Attributes of "Cards Checklists" to be added.
    # + return - Success
    remote isolated function addCardsChecklistsByIdCard(string idCard, CardsChecklists payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/checklists`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Delete cards checklists by ID card by ID checklist
    #
    # + idCard - Card ID or shortlink
    # + idChecklist - IdChecklist
    # + return - Success
    remote isolated function deleteCardsChecklistsByIdCardByIdChecklist(string idCard, string idChecklist) returns http:Response | error {
        string  path = string `/cards/${idCard}/checklists/${idChecklist}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> delete(path, request, targetType = http:Response );
        return response;
    }
    # Update cards closed by ID card
    #
    # + idCard - Card ID or shortlink
    # + payload - Attributes of "Cards Closed" to be updated.
    # + return - Success
    remote isolated function updateCardsClosedByIdCard(string idCard, CardsClosed payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/closed`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update cards desc by ID card
    #
    # + idCard - Card ID or shortlink
    # + payload - Attributes of "Cards Desc" to be updated.
    # + return - Success
    remote isolated function updateCardsDescByIdCard(string idCard, CardsDesc payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/desc`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update cards due by ID card
    #
    # + idCard - Card ID or shortlink
    # + payload - Attributes of "Cards Due" to be updated.
    # + return - Success
    remote isolated function updateCardsDueByIdCard(string idCard, CardsDue payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/due`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update cards ID attachment cover by ID card
    #
    # + idCard - Card ID or shortlink
    # + payload - Attributes of "Cards ID Attachment Cover" to be updated.
    # + return - Success
    remote isolated function updateCardsIdAttachmentCoverByIdCard(string idCard, CardsIdattachmentcover payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/idAttachmentCover`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update cards ID board by ID card
    #
    # + idCard - Card ID or shortlink
    # + payload - Attributes of "Cards ID Board" to be updated.
    # + return - Success
    remote isolated function updateCardsIdBoardByIdCard(string idCard, CardsIdboard payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/idBoard`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Add cards ID labels by ID card
    #
    # + idCard - Card ID or shortlink
    # + payload - Attributes of "Cards ID Labels" to be added.
    # + return - Success
    remote isolated function addCardsIdLabelsByIdCard(string idCard, CardsIdlabels payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/idLabels`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Delete cards ID labels by ID card by ID label
    #
    # + idCard - Card ID or shortlink
    # + idLabel - IdLabel
    # + return - Success
    remote isolated function deleteCardsIdLabelsByIdCardByIdLabel(string idCard, string idLabel) returns http:Response | error {
        string  path = string `/cards/${idCard}/idLabels/${idLabel}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> delete(path, request, targetType = http:Response );
        return response;
    }
    # Update cards ID list by ID card
    #
    # + idCard - Card ID or shortlink
    # + payload - Attributes of "Cards ID List" to be updated.
    # + return - Success
    remote isolated function updateCardsIdListByIdCard(string idCard, CardsIdlist payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/idList`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update cards ID members by ID card
    #
    # + idCard - Card ID or shortlink
    # + payload - Attributes of "Cards ID Members" to be updated.
    # + return - Success
    remote isolated function updateCardsIdMembersByIdCard(string idCard, CardsIdmembers payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/idMembers`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Add cards ID members by ID card
    #
    # + idCard - Card ID or shortlink
    # + payload - Attributes of "Cards ID Members" to be added.
    # + return - Success
    remote isolated function addCardsIdMembersByIdCard(string idCard, CardsIdmembers payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/idMembers`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Delete cards ID members by ID card by ID member
    #
    # + idCard - Card ID or shortlink
    # + idMember - IdMember
    # + return - Success
    remote isolated function deleteCardsIdMembersByIdCardByIdMember(string idCard, string idMember) returns http:Response | error {
        string  path = string `/cards/${idCard}/idMembers/${idMember}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> delete(path, request, targetType = http:Response );
        return response;
    }
    # Update cards labels by ID card
    #
    # + idCard - Card ID or shortlink
    # + payload - Attributes of "Cards Labels" to be updated.
    # + return - Success
    remote isolated function updateCardsLabelsByIdCard(string idCard, CardsLabels payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/labels`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Add cards labels by ID card
    #
    # + idCard - Card ID or shortlink
    # + payload - Attributes of "Cards Labels" to be added.
    # + return - Success
    remote isolated function addCardsLabelsByIdCard(string idCard, CardsLabels payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/labels`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Delete cards labels by ID card by color
    #
    # + idCard - Card ID or shortlink
    # + color - Color
    # + return - Success
    remote isolated function deleteCardsLabelsByIdCardByColor(string idCard, string color) returns http:Response | error {
        string  path = string `/cards/${idCard}/labels/${color}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> delete(path, request, targetType = http:Response );
        return response;
    }
    # Get cards list by ID card
    #
    # + idCard - Card ID or shortlink
    # + fields - All or a comma-separated list of: closed, idBoard, name, pos or subscribed
    # + return - Success
    remote isolated function getCardsListByIdCard(string idCard, string? fields = "all") returns http:Response | error {
        string  path = string `/cards/${idCard}/list`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get cards list by ID card by field
    #
    # + idCard - Card ID or shortlink
    # + 'field - Field
    # + return - Success
    remote isolated function getCardsListByIdCardByField(string idCard, string 'field) returns http:Response | error {
        string  path = string `/cards/${idCard}/list/${'field}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add cards mark associated notifications read by ID card
    #
    # + idCard - Card ID or shortlink
    # + return - Success
    remote isolated function addCardsMarkAssociatedNotificationsReadByIdCard(string idCard) returns http:Response | error {
        string  path = string `/cards/${idCard}/markAssociatedNotificationsRead`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> post(path, request, targetType = http:Response );
        return response;
    }
    # Get cards members by ID card
    #
    # + idCard - Card ID or shortlink
    # + fields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + return - Success
    remote isolated function getCardsMembersByIdCard(string idCard, string? fields = "avatarHash, fullName, initials and username") returns http:Response | error {
        string  path = string `/cards/${idCard}/members`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get cards members voted by ID card
    #
    # + idCard - Card ID or shortlink
    # + fields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + return - Success
    remote isolated function getCardsMembersVotedByIdCard(string idCard, string? fields = "avatarHash, fullName, initials and username") returns http:Response | error {
        string  path = string `/cards/${idCard}/membersVoted`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add cards members voted by ID card
    #
    # + idCard - Card ID or shortlink
    # + payload - Attributes of "Cards Members Voted" to be added.
    # + return - Success
    remote isolated function addCardsMembersVotedByIdCard(string idCard, CardsMembersvoted payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/membersVoted`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Delete cards members voted by ID card by ID member
    #
    # + idCard - Card ID or shortlink
    # + idMember - IdMember
    # + return - Success
    remote isolated function deleteCardsMembersVotedByIdCardByIdMember(string idCard, string idMember) returns http:Response | error {
        string  path = string `/cards/${idCard}/membersVoted/${idMember}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> delete(path, request, targetType = http:Response );
        return response;
    }
    # Update cards name by ID card
    #
    # + idCard - Card ID or shortlink
    # + payload - Attributes of "Cards Name" to be updated.
    # + return - Success
    remote isolated function updateCardsNameByIdCard(string idCard, CardsName payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/name`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update cards pos by ID card
    #
    # + idCard - Card ID or shortlink
    # + payload - Attributes of "Cards Pos" to be updated.
    # + return - Success
    remote isolated function updateCardsPosByIdCard(string idCard, CardsPos payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/pos`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Get cards stickers by ID card
    #
    # + idCard - Card ID or shortlink
    # + fields - All or a comma-separated list of: image, imageScaled, imageUrl, left, rotate, top or zIndex
    # + return - Success
    remote isolated function getCardsStickersByIdCard(string idCard, string? fields = "all") returns http:Response | error {
        string  path = string `/cards/${idCard}/stickers`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add cards stickers by ID card
    #
    # + idCard - Card ID or shortlink
    # + payload - Attributes of "Cards Stickers" to be added.
    # + return - Success
    remote isolated function addCardsStickersByIdCard(string idCard, CardsStickers payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/stickers`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Get cards stickers by ID card by ID sticker
    #
    # + idCard - Card ID or shortlink
    # + idSticker - IdSticker
    # + fields - All or a comma-separated list of: image, imageScaled, imageUrl, left, rotate, top or zIndex
    # + return - Success
    remote isolated function getCardsStickersByIdCardByIdSticker(string idCard, string idSticker, string? fields = "all") returns http:Response | error {
        string  path = string `/cards/${idCard}/stickers/${idSticker}`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update cards stickers by ID card by ID sticker
    #
    # + idCard - Card ID or shortlink
    # + idSticker - IdSticker
    # + payload - Attributes of "Cards Stickers" to be updated.
    # + return - Success
    remote isolated function updateCardsStickersByIdCardByIdSticker(string idCard, string idSticker, CardsStickers payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/stickers/${idSticker}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Delete cards stickers by ID card by ID sticker
    #
    # + idCard - Card ID or shortlink
    # + idSticker - IdSticker
    # + return - Success
    remote isolated function deleteCardsStickersByIdCardByIdSticker(string idCard, string idSticker) returns http:Response | error {
        string  path = string `/cards/${idCard}/stickers/${idSticker}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> delete(path, request, targetType = http:Response );
        return response;
    }
    # Update cards subscribed by ID card
    #
    # + idCard - Card ID or shortlink
    # + payload - Attributes of "Cards Subscribed" to be updated.
    # + return - Success
    remote isolated function updateCardsSubscribedByIdCard(string idCard, CardsSubscribed payload) returns http:Response | error {
        string  path = string `/cards/${idCard}/subscribed`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Get cards by ID card by field
    #
    # + idCard - Card ID or shortlink
    # + 'field - Field
    # + return - Success
    remote isolated function getCardsByIdCardByField(string idCard, string 'field) returns http:Response | error {
        string  path = string `/cards/${idCard}/${'field}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add checklists
    #
    # + payload - Attributes of "Checklists" to be added.
    # + return - Success
    remote isolated function addChecklists(Checklists payload) returns http:Response | error {
        string  path = string `/checklists`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Get checklists by ID checklist
    #
    # + idChecklist - IdChecklist
    # + cards - One of: all, closed, none, open or visible
    # + cardFields - All or a comma-separated list of: badges, checkItemStates, closed, dateLastActivity, desc, descData, due, email, idAttachmentCover, idBoard, idChecklists, idLabels, idList, idMembers, idMembersVoted, idShort, labels, manualCoverAttachment, name, pos, shortLink, shortUrl, subscribed or url
    # + checkItems - One of: all or none
    # + checkitemFields - All or a comma-separated list of: name, nameData, pos, state or type
    # + fields - All or a comma-separated list of: idBoard, idCard, name or pos
    # + return - Success
    remote isolated function getChecklistsByIdChecklist(string idChecklist, string? cards = "none", string? cardFields = "all", string? checkItems = "all", string? checkitemFields = "name, nameData, pos and state", string? fields = "all") returns http:Response | error {
        string  path = string `/checklists/${idChecklist}`;
        map<anydata> queryParam = {"cards": cards, "card_fields": cardFields, "checkItems": checkItems, "checkItem_fields": checkitemFields, "fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update checklists by ID checklist
    #
    # + idChecklist - IdChecklist
    # + payload - Attributes of "Checklists" to be updated.
    # + return - Success
    remote isolated function updateChecklistsByIdChecklist(string idChecklist, Checklists payload) returns http:Response | error {
        string  path = string `/checklists/${idChecklist}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Delete checklists by ID checklist
    #
    # + idChecklist - IdChecklist
    # + return - Success
    remote isolated function deleteChecklistsByIdChecklist(string idChecklist) returns http:Response | error {
        string  path = string `/checklists/${idChecklist}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> delete(path, request, targetType = http:Response );
        return response;
    }
    # Get checklists board by ID checklist
    #
    # + idChecklist - IdChecklist
    # + fields - All or a comma-separated list of: closed, dateLastActivity, dateLastView, desc, descData, idOrganization, invitations, invited, labelNames, memberships, name, pinned, powerUps, prefs, shortLink, shortUrl, starred, subscribed or url
    # + return - Success
    remote isolated function getChecklistsBoardByIdChecklist(string idChecklist, string? fields = "all") returns http:Response | error {
        string  path = string `/checklists/${idChecklist}/board`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get checklists board by ID checklist by field
    #
    # + idChecklist - IdChecklist
    # + 'field - Field
    # + return - Success
    remote isolated function getChecklistsBoardByIdChecklistByField(string idChecklist, string 'field) returns http:Response | error {
        string  path = string `/checklists/${idChecklist}/board/${'field}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get checklists cards by ID checklist
    #
    # + idChecklist - IdChecklist
    # + actions - All or a comma-separated list of: addAttachmentToCard, addChecklistToCard, addMemberToBoard, addMemberToCard, addMemberToOrganization, addToOrganizationBoard, commentCard, convertToCardFromCheckItem, copyBoard, copyCard, copyCommentCard, createBoard, createCard, createList, createOrganization, deleteAttachmentFromCard, deleteBoardInvitation, deleteCard, deleteOrganizationInvitation, disablePowerUp, emailCard, enablePowerUp, makeAdminOfBoard, makeNormalMemberOfBoard, makeNormalMemberOfOrganization, makeObserverOfBoard, memberJoinedTrello, moveCardFromBoard, moveCardToBoard, moveListFromBoard, moveListToBoard, removeChecklistFromCard, removeFromOrganizationBoard, removeMemberFromCard, unconfirmedBoardInvitation, unconfirmedOrganizationInvitation, updateBoard, updateCard, updateCard:closed, updateCard:desc, updateCard:idList, updateCard:name, updateCheckItemStateOnCard, updateChecklist, updateList, updateList:closed, updateList:name, updateMember or updateOrganization
    # + attachments - A boolean value or &quot;cover&quot; for only card cover attachments
    # + attachmentFields - All or a comma-separated list of: bytes, date, edgeColor, idMember, isUpload, mimeType, name, previews or url
    # + stickers - True or false
    # + members - True or false
    # + memberFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + checkItemStates - True or false
    # + checklists - One of: all or none
    # + 'limit - A number from 1 to 1000
    # + since - A date, or null
    # + before - A date, or null
    # + filter - One of: all, closed, none or open
    # + fields - All or a comma-separated list of: badges, checkItemStates, closed, dateLastActivity, desc, descData, due, email, idAttachmentCover, idBoard, idChecklists, idLabels, idList, idMembers, idMembersVoted, idShort, labels, manualCoverAttachment, name, pos, shortLink, shortUrl, subscribed or url
    # + return - Success
    remote isolated function getChecklistsCardsByIdChecklist(string idChecklist, string? actions = (), string? attachments = (), string? attachmentFields = "all", string? stickers = (), string? members = (), string? memberFields = "avatarHash, fullName, initials and username", string? checkItemStates = (), string? checklists = "none", string? 'limit = (), string? since = (), string? before = (), string? filter = "open", string? fields = "all") returns http:Response | error {
        string  path = string `/checklists/${idChecklist}/cards`;
        map<anydata> queryParam = {"actions": actions, "attachments": attachments, "attachment_fields": attachmentFields, "stickers": stickers, "members": members, "member_fields": memberFields, "checkItemStates": checkItemStates, "checklists": checklists, "limit": 'limit, "since": since, "before": before, "filter": filter, "fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get checklists cards by ID checklist by filter
    #
    # + idChecklist - IdChecklist
    # + filter - Filter
    # + return - Success
    remote isolated function getChecklistsCardsByIdChecklistByFilter(string idChecklist, string filter) returns http:Response | error {
        string  path = string `/checklists/${idChecklist}/cards/${filter}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get checklists check items by ID checklist
    #
    # + idChecklist - IdChecklist
    # + filter - One of: all or none
    # + fields - All or a comma-separated list of: name, nameData, pos, state or type
    # + return - Success
    remote isolated function getChecklistsCheckItemsByIdChecklist(string idChecklist, string? filter = "all", string? fields = "name, nameData, pos and state") returns http:Response | error {
        string  path = string `/checklists/${idChecklist}/checkItems`;
        map<anydata> queryParam = {"filter": filter, "fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add checklists check items by ID checklist
    #
    # + idChecklist - IdChecklist
    # + payload - Attributes of "Checklists Check Items" to be added.
    # + return - Success
    remote isolated function addChecklistsCheckItemsByIdChecklist(string idChecklist, ChecklistsCheckitems payload) returns http:Response | error {
        string  path = string `/checklists/${idChecklist}/checkItems`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Get checklists check items by ID checklist by ID check item
    #
    # + idChecklist - IdChecklist
    # + idCheckItem - IdCheckItem
    # + fields - All or a comma-separated list of: name, nameData, pos, state or type
    # + return - Success
    remote isolated function getChecklistsCheckItemsByIdChecklistByIdCheckItem(string idChecklist, string idCheckItem, string? fields = "name, nameData, pos and state") returns http:Response | error {
        string  path = string `/checklists/${idChecklist}/checkItems/${idCheckItem}`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Delete checklists check items by ID checklist by ID check item
    #
    # + idChecklist - IdChecklist
    # + idCheckItem - IdCheckItem
    # + return - Success
    remote isolated function deleteChecklistsCheckItemsByIdChecklistByIdCheckItem(string idChecklist, string idCheckItem) returns http:Response | error {
        string  path = string `/checklists/${idChecklist}/checkItems/${idCheckItem}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> delete(path, request, targetType = http:Response );
        return response;
    }
    # Update checklists ID card by ID checklist
    #
    # + idChecklist - IdChecklist
    # + payload - Attributes of "Checklists ID Card" to be updated.
    # + return - Success
    remote isolated function updateChecklistsIdCardByIdChecklist(string idChecklist, ChecklistsIdcard payload) returns http:Response | error {
        string  path = string `/checklists/${idChecklist}/idCard`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update checklists name by ID checklist
    #
    # + idChecklist - IdChecklist
    # + payload - Attributes of "Checklists Name" to be updated.
    # + return - Success
    remote isolated function updateChecklistsNameByIdChecklist(string idChecklist, ChecklistsName payload) returns http:Response | error {
        string  path = string `/checklists/${idChecklist}/name`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update checklists pos by ID checklist
    #
    # + idChecklist - IdChecklist
    # + payload - Attributes of "Checklists Pos" to be updated.
    # + return - Success
    remote isolated function updateChecklistsPosByIdChecklist(string idChecklist, ChecklistsPos payload) returns http:Response | error {
        string  path = string `/checklists/${idChecklist}/pos`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Get checklists by ID checklist by field
    #
    # + idChecklist - IdChecklist
    # + 'field - Field
    # + return - Success
    remote isolated function getChecklistsByIdChecklistByField(string idChecklist, string 'field) returns http:Response | error {
        string  path = string `/checklists/${idChecklist}/${'field}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add labels
    #
    # + payload - Attributes of "Labels" to be added.
    # + return - Success
    remote isolated function addLabels(Labels payload) returns http:Response | error {
        string  path = string `/labels`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Get labels by ID label
    #
    # + idLabel - IdLabel
    # + fields - All or a comma-separated list of: color, idBoard, name or uses
    # + return - Success
    remote isolated function getLabelsByIdLabel(string idLabel, string? fields = "all") returns http:Response | error {
        string  path = string `/labels/${idLabel}`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update labels by ID label
    #
    # + idLabel - IdLabel
    # + payload - Attributes of "Labels" to be updated.
    # + return - Success
    remote isolated function updateLabelsByIdLabel(string idLabel, Labels payload) returns http:Response | error {
        string  path = string `/labels/${idLabel}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Delete labels by ID label
    #
    # + idLabel - IdLabel
    # + return - Success
    remote isolated function deleteLabelsByIdLabel(string idLabel) returns http:Response | error {
        string  path = string `/labels/${idLabel}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> delete(path, request, targetType = http:Response );
        return response;
    }
    # Get labels board by ID label
    #
    # + idLabel - IdLabel
    # + fields - All or a comma-separated list of: closed, dateLastActivity, dateLastView, desc, descData, idOrganization, invitations, invited, labelNames, memberships, name, pinned, powerUps, prefs, shortLink, shortUrl, starred, subscribed or url
    # + return - Success
    remote isolated function getLabelsBoardByIdLabel(string idLabel, string? fields = "all") returns http:Response | error {
        string  path = string `/labels/${idLabel}/board`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get labels board by ID label by field
    #
    # + idLabel - IdLabel
    # + 'field - Field
    # + return - Success
    remote isolated function getLabelsBoardByIdLabelByField(string idLabel, string 'field) returns http:Response | error {
        string  path = string `/labels/${idLabel}/board/${'field}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update labels color by ID label
    #
    # + idLabel - IdLabel
    # + payload - Attributes of "Labels Color" to be updated.
    # + return - Success
    remote isolated function updateLabelsColorByIdLabel(string idLabel, LabelsColor payload) returns http:Response | error {
        string  path = string `/labels/${idLabel}/color`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update labels name by ID label
    #
    # + idLabel - IdLabel
    # + payload - Attributes of "Labels Name" to be updated.
    # + return - Success
    remote isolated function updateLabelsNameByIdLabel(string idLabel, LabelsName payload) returns http:Response | error {
        string  path = string `/labels/${idLabel}/name`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Add lists
    #
    # + payload - Attributes of "Lists" to be added.
    # + return - Success
    remote isolated function addLists(Lists payload) returns http:Response | error {
        string  path = string `/lists`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Get lists by ID list
    #
    # + idList - IdList
    # + cards - One of: all, closed, none or open
    # + cardFields - All or a comma-separated list of: badges, checkItemStates, closed, dateLastActivity, desc, descData, due, email, idAttachmentCover, idBoard, idChecklists, idLabels, idList, idMembers, idMembersVoted, idShort, labels, manualCoverAttachment, name, pos, shortLink, shortUrl, subscribed or url
    # + board - True or false
    # + boardFields - All or a comma-separated list of: closed, dateLastActivity, dateLastView, desc, descData, idOrganization, invitations, invited, labelNames, memberships, name, pinned, powerUps, prefs, shortLink, shortUrl, starred, subscribed or url
    # + fields - All or a comma-separated list of: closed, idBoard, name, pos or subscribed
    # + return - Success
    remote isolated function getListsByIdList(string idList, string? cards = "none", string? cardFields = "all", string? board = (), string? boardFields = "name, desc, descData, closed, idOrganization, pinned, url and prefs", string? fields = "name, closed, idBoard and pos") returns http:Response | error {
        string  path = string `/lists/${idList}`;
        map<anydata> queryParam = {"cards": cards, "card_fields": cardFields, "board": board, "board_fields": boardFields, "fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update lists by ID list
    #
    # + idList - IdList
    # + payload - Attributes of "Lists" to be updated.
    # + return - Success
    remote isolated function updateListsByIdList(string idList, Lists payload) returns http:Response | error {
        string  path = string `/lists/${idList}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Get lists actions by ID list
    #
    # + idList - IdList
    # + entities - True or false
    # + display - True or false
    # + filter - All or a comma-separated list of: addAttachmentToCard, addChecklistToCard, addMemberToBoard, addMemberToCard, addMemberToOrganization, addToOrganizationBoard, commentCard, convertToCardFromCheckItem, copyBoard, copyCard, copyCommentCard, createBoard, createCard, createList, createOrganization, deleteAttachmentFromCard, deleteBoardInvitation, deleteCard, deleteOrganizationInvitation, disablePowerUp, emailCard, enablePowerUp, makeAdminOfBoard, makeNormalMemberOfBoard, makeNormalMemberOfOrganization, makeObserverOfBoard, memberJoinedTrello, moveCardFromBoard, moveCardToBoard, moveListFromBoard, moveListToBoard, removeChecklistFromCard, removeFromOrganizationBoard, removeMemberFromCard, unconfirmedBoardInvitation, unconfirmedOrganizationInvitation, updateBoard, updateCard, updateCard:closed, updateCard:desc, updateCard:idList, updateCard:name, updateCheckItemStateOnCard, updateChecklist, updateList, updateList:closed, updateList:name, updateMember or updateOrganization
    # + fields - All or a comma-separated list of: data, date, idMemberCreator or type
    # + 'limit - A number from 0 to 1000
    # + format - One of: count, list or minimal
    # + since - A date, null or lastView
    # + before - A date, or null
    # + page - Page * limit must be less than 1000
    # + idModels - Only return actions related to these model ids
    # + member - True or false
    # + memberFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + memberCreator - True or false
    # + membercreatorFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + return - Success
    remote isolated function getListsActionsByIdList(string idList, string? entities = (), string? display = (), string? filter = "all", string? fields = "all", string? 'limit = "50", string? format = "list", string? since = (), string? before = (), string? page = "0", string? idModels = (), string? member = (), string? memberFields = "avatarHash, fullName, initials and username", string? memberCreator = (), string? membercreatorFields = "avatarHash, fullName, initials and username") returns http:Response | error {
        string  path = string `/lists/${idList}/actions`;
        map<anydata> queryParam = {"entities": entities, "display": display, "filter": filter, "fields": fields, "limit": 'limit, "format": format, "since": since, "before": before, "page": page, "idModels": idModels, "member": member, "member_fields": memberFields, "memberCreator": memberCreator, "memberCreator_fields": membercreatorFields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add lists archive all cards by ID list
    #
    # + idList - IdList
    # + return - Success
    remote isolated function addListsArchiveAllCardsByIdList(string idList) returns http:Response | error {
        string  path = string `/lists/${idList}/archiveAllCards`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> post(path, request, targetType = http:Response );
        return response;
    }
    # Get lists board by ID list
    #
    # + idList - IdList
    # + fields - All or a comma-separated list of: closed, dateLastActivity, dateLastView, desc, descData, idOrganization, invitations, invited, labelNames, memberships, name, pinned, powerUps, prefs, shortLink, shortUrl, starred, subscribed or url
    # + return - Success
    remote isolated function getListsBoardByIdList(string idList, string? fields = "all") returns http:Response | error {
        string  path = string `/lists/${idList}/board`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get lists board by ID list by field
    #
    # + idList - IdList
    # + 'field - Field
    # + return - Success
    remote isolated function getListsBoardByIdListByField(string idList, string 'field) returns http:Response | error {
        string  path = string `/lists/${idList}/board/${'field}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get lists cards by ID list
    #
    # + idList - IdList
    # + actions - All or a comma-separated list of: addAttachmentToCard, addChecklistToCard, addMemberToBoard, addMemberToCard, addMemberToOrganization, addToOrganizationBoard, commentCard, convertToCardFromCheckItem, copyBoard, copyCard, copyCommentCard, createBoard, createCard, createList, createOrganization, deleteAttachmentFromCard, deleteBoardInvitation, deleteCard, deleteOrganizationInvitation, disablePowerUp, emailCard, enablePowerUp, makeAdminOfBoard, makeNormalMemberOfBoard, makeNormalMemberOfOrganization, makeObserverOfBoard, memberJoinedTrello, moveCardFromBoard, moveCardToBoard, moveListFromBoard, moveListToBoard, removeChecklistFromCard, removeFromOrganizationBoard, removeMemberFromCard, unconfirmedBoardInvitation, unconfirmedOrganizationInvitation, updateBoard, updateCard, updateCard:closed, updateCard:desc, updateCard:idList, updateCard:name, updateCheckItemStateOnCard, updateChecklist, updateList, updateList:closed, updateList:name, updateMember or updateOrganization
    # + attachments - A boolean value or &quot;cover&quot; for only card cover attachments
    # + attachmentFields - All or a comma-separated list of: bytes, date, edgeColor, idMember, isUpload, mimeType, name, previews or url
    # + stickers - True or false
    # + members - True or false
    # + memberFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + checkItemStates - True or false
    # + checklists - One of: all or none
    # + 'limit - A number from 1 to 1000
    # + since - A date, or null
    # + before - A date, or null
    # + filter - One of: all, closed, none or open
    # + fields - All or a comma-separated list of: badges, checkItemStates, closed, dateLastActivity, desc, descData, due, email, idAttachmentCover, idBoard, idChecklists, idLabels, idList, idMembers, idMembersVoted, idShort, labels, manualCoverAttachment, name, pos, shortLink, shortUrl, subscribed or url
    # + return - Success
    remote isolated function getListsCardsByIdList(string idList, string? actions = (), string? attachments = (), string? attachmentFields = "all", string? stickers = (), string? members = (), string? memberFields = "avatarHash, fullName, initials and username", string? checkItemStates = (), string? checklists = "none", string? 'limit = (), string? since = (), string? before = (), string? filter = "open", string? fields = "all") returns http:Response | error {
        string  path = string `/lists/${idList}/cards`;
        map<anydata> queryParam = {"actions": actions, "attachments": attachments, "attachment_fields": attachmentFields, "stickers": stickers, "members": members, "member_fields": memberFields, "checkItemStates": checkItemStates, "checklists": checklists, "limit": 'limit, "since": since, "before": before, "filter": filter, "fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add lists cards by ID list
    #
    # + idList - IdList
    # + payload - Attributes of "Lists Cards" to be added.
    # + return - Success
    remote isolated function addListsCardsByIdList(string idList, ListsCards payload) returns http:Response | error {
        string  path = string `/lists/${idList}/cards`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Get lists cards by ID list by filter
    #
    # + idList - IdList
    # + filter - Filter
    # + return - Success
    remote isolated function getListsCardsByIdListByFilter(string idList, string filter) returns http:Response | error {
        string  path = string `/lists/${idList}/cards/${filter}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update lists closed by ID list
    #
    # + idList - IdList
    # + payload - Attributes of "Lists Closed" to be updated.
    # + return - Success
    remote isolated function updateListsClosedByIdList(string idList, ListsClosed payload) returns http:Response | error {
        string  path = string `/lists/${idList}/closed`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update lists ID board by ID list
    #
    # + idList - IdList
    # + payload - Attributes of "Lists ID Board" to be updated.
    # + return - Success
    remote isolated function updateListsIdBoardByIdList(string idList, ListsIdboard payload) returns http:Response | error {
        string  path = string `/lists/${idList}/idBoard`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Add lists move all cards by ID list
    #
    # + idList - IdList
    # + payload - Attributes of "Lists Move All Cards" to be added.
    # + return - Success
    remote isolated function addListsMoveAllCardsByIdList(string idList, ListsMoveallcards payload) returns http:Response | error {
        string  path = string `/lists/${idList}/moveAllCards`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Update lists name by ID list
    #
    # + idList - IdList
    # + payload - Attributes of "Lists Name" to be updated.
    # + return - Success
    remote isolated function updateListsNameByIdList(string idList, ListsName payload) returns http:Response | error {
        string  path = string `/lists/${idList}/name`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update lists pos by ID list
    #
    # + idList - IdList
    # + payload - Attributes of "Lists Pos" to be updated.
    # + return - Success
    remote isolated function updateListsPosByIdList(string idList, ListsPos payload) returns http:Response | error {
        string  path = string `/lists/${idList}/pos`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update lists subscribed by ID list
    #
    # + idList - IdList
    # + payload - Attributes of "Lists Subscribed" to be updated.
    # + return - Success
    remote isolated function updateListsSubscribedByIdList(string idList, ListsSubscribed payload) returns http:Response | error {
        string  path = string `/lists/${idList}/subscribed`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Get lists by ID list by field
    #
    # + idList - IdList
    # + 'field - Field
    # + return - Success
    remote isolated function getListsByIdListByField(string idList, string 'field) returns http:Response | error {
        string  path = string `/lists/${idList}/${'field}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get members by ID member
    #
    # + idMember - IdMember or username
    # + actions - All or a comma-separated list of: addAttachmentToCard, addChecklistToCard, addMemberToBoard, addMemberToCard, addMemberToOrganization, addToOrganizationBoard, commentCard, convertToCardFromCheckItem, copyBoard, copyCard, copyCommentCard, createBoard, createCard, createList, createOrganization, deleteAttachmentFromCard, deleteBoardInvitation, deleteCard, deleteOrganizationInvitation, disablePowerUp, emailCard, enablePowerUp, makeAdminOfBoard, makeNormalMemberOfBoard, makeNormalMemberOfOrganization, makeObserverOfBoard, memberJoinedTrello, moveCardFromBoard, moveCardToBoard, moveListFromBoard, moveListToBoard, removeChecklistFromCard, removeFromOrganizationBoard, removeMemberFromCard, unconfirmedBoardInvitation, unconfirmedOrganizationInvitation, updateBoard, updateCard, updateCard:closed, updateCard:desc, updateCard:idList, updateCard:name, updateCheckItemStateOnCard, updateChecklist, updateList, updateList:closed, updateList:name, updateMember or updateOrganization
    # + actionsEntities - True or false
    # + actionsDisplay - True or false
    # + actionsLimit - A number from 0 to 1000
    # + actionFields - All or a comma-separated list of: data, date, idMemberCreator or type
    # + actionSince - A date, null or lastView
    # + actionBefore - A date, or null
    # + cards - One of: all, closed, none, open or visible
    # + cardFields - All or a comma-separated list of: badges, checkItemStates, closed, dateLastActivity, desc, descData, due, email, idAttachmentCover, idBoard, idChecklists, idLabels, idList, idMembers, idMembersVoted, idShort, labels, manualCoverAttachment, name, pos, shortLink, shortUrl, subscribed or url
    # + cardMembers - True or false
    # + cardMemberFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + cardAttachments - A boolean value or &quot;cover&quot; for only card cover attachments
    # + cardAttachmentFields - All or a comma-separated list of: bytes, date, edgeColor, idMember, isUpload, mimeType, name, previews or url
    # + cardStickers - True or false
    # + boards - All or a comma-separated list of: closed, members, open, organization, pinned, public, starred or unpinned
    # + boardFields - All or a comma-separated list of: closed, dateLastActivity, dateLastView, desc, descData, idOrganization, invitations, invited, labelNames, memberships, name, pinned, powerUps, prefs, shortLink, shortUrl, starred, subscribed or url
    # + boardActions - All or a comma-separated list of: addAttachmentToCard, addChecklistToCard, addMemberToBoard, addMemberToCard, addMemberToOrganization, addToOrganizationBoard, commentCard, convertToCardFromCheckItem, copyBoard, copyCard, copyCommentCard, createBoard, createCard, createList, createOrganization, deleteAttachmentFromCard, deleteBoardInvitation, deleteCard, deleteOrganizationInvitation, disablePowerUp, emailCard, enablePowerUp, makeAdminOfBoard, makeNormalMemberOfBoard, makeNormalMemberOfOrganization, makeObserverOfBoard, memberJoinedTrello, moveCardFromBoard, moveCardToBoard, moveListFromBoard, moveListToBoard, removeChecklistFromCard, removeFromOrganizationBoard, removeMemberFromCard, unconfirmedBoardInvitation, unconfirmedOrganizationInvitation, updateBoard, updateCard, updateCard:closed, updateCard:desc, updateCard:idList, updateCard:name, updateCheckItemStateOnCard, updateChecklist, updateList, updateList:closed, updateList:name, updateMember or updateOrganization
    # + boardActionsEntities - True or false
    # + boardActionsDisplay - True or false
    # + boardActionsFormat - One of: count, list or minimal
    # + boardActionsSince - A date, null or lastView
    # + boardActionsLimit - A number from 0 to 1000
    # + boardActionFields - All or a comma-separated list of: data, date, idMemberCreator or type
    # + boardLists - One of: all, closed, none or open
    # + boardMemberships - All or a comma-separated list of: active, admin, deactivated, me or normal
    # + boardOrganization - True or false
    # + boardOrganizationFields - All or a comma-separated list of: billableMemberCount, desc, descData, displayName, idBoards, invitations, invited, logoHash, memberships, name, powerUps, prefs, premiumFeatures, products, url or website
    # + boardsInvited - All or a comma-separated list of: closed, members, open, organization, pinned, public, starred or unpinned
    # + boardsinvitedFields - All or a comma-separated list of: closed, dateLastActivity, dateLastView, desc, descData, idOrganization, invitations, invited, labelNames, memberships, name, pinned, powerUps, prefs, shortLink, shortUrl, starred, subscribed or url
    # + boardStars - True or false
    # + savedSearches - True or false
    # + organizations - One of: all, members, none or public
    # + organizationFields - All or a comma-separated list of: billableMemberCount, desc, descData, displayName, idBoards, invitations, invited, logoHash, memberships, name, powerUps, prefs, premiumFeatures, products, url or website
    # + organizationPaidAccount - True or false
    # + organizationsInvited - One of: all, members, none or public
    # + organizationsinvitedFields - All or a comma-separated list of: billableMemberCount, desc, descData, displayName, idBoards, invitations, invited, logoHash, memberships, name, powerUps, prefs, premiumFeatures, products, url or website
    # + notifications - All or a comma-separated list of: addAdminToBoard, addAdminToOrganization, addedAttachmentToCard, addedMemberToCard, addedToBoard, addedToCard, addedToOrganization, cardDueSoon, changeCard, closeBoard, commentCard, createdCard, declinedInvitationToBoard, declinedInvitationToOrganization, invitedToBoard, invitedToOrganization, makeAdminOfBoard, makeAdminOfOrganization, memberJoinedTrello, mentionedOnCard, removedFromBoard, removedFromCard, removedFromOrganization, removedMemberFromCard, unconfirmedInvitedToBoard, unconfirmedInvitedToOrganization or updateCheckItemStateOnCard
    # + notificationsEntities - True or false
    # + notificationsDisplay - True or false
    # + notificationsLimit - A number from 1 to 1000
    # + notificationFields - All or a comma-separated list of: data, date, idMemberCreator, type or unread
    # + notificationMembercreator - True or false
    # + notificationMembercreatorFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + notificationBefore - An ID, or null
    # + notificationSince - An ID, or null
    # + tokens - One of: all or none
    # + paidAccount - True or false
    # + boardBackgrounds - One of: all, custom, default, none or premium
    # + customBoardBackgrounds - One of: all or none
    # + customStickers - One of: all or none
    # + customEmoji - One of: all or none
    # + fields - All or a comma-separated list of: avatarHash, avatarSource, bio, bioData, confirmed, email, fullName, gravatarHash, idBoards, idBoardsPinned, idOrganizations, idPremOrgsAdmin, initials, loginTypes, memberType, oneTimeMessagesDismissed, prefs, premiumFeatures, products, status, status, trophies, uploadedAvatarHash, url or username
    # + return - Success
    remote isolated function getMembersByIdMember(string idMember, string? actions = (), string? actionsEntities = (), string? actionsDisplay = (), string? actionsLimit = "50", string? actionFields = "all", string? actionSince = (), string? actionBefore = (), string? cards = "none", string? cardFields = "all", string? cardMembers = (), string? cardMemberFields = "avatarHash, fullName, initials and username", string? cardAttachments = (), string? cardAttachmentFields = "url and previews", string? cardStickers = (), string? boards = (), string? boardFields = "name, closed, idOrganization and pinned", string? boardActions = (), string? boardActionsEntities = (), string? boardActionsDisplay = (), string? boardActionsFormat = "list", string? boardActionsSince = (), string? boardActionsLimit = "50", string? boardActionFields = "all", string? boardLists = "none", string? boardMemberships = "none", string? boardOrganization = (), string? boardOrganizationFields = "name and displayName", string? boardsInvited = (), string? boardsinvitedFields = "name, closed, idOrganization and pinned", string? boardStars = (), string? savedSearches = (), string? organizations = "none", string? organizationFields = "all", string? organizationPaidAccount = (), string? organizationsInvited = "none", string? organizationsinvitedFields = "all", string? notifications = (), string? notificationsEntities = (), string? notificationsDisplay = (), string? notificationsLimit = "50", string? notificationFields = "all", string? notificationMembercreator = (), string? notificationMembercreatorFields = "avatarHash, fullName, initials and username", string? notificationBefore = (), string? notificationSince = (), string? tokens = "none", string? paidAccount = (), string? boardBackgrounds = "none", string? customBoardBackgrounds = "none", string? customStickers = "none", string? customEmoji = "none", string? fields = "all") returns http:Response | error {
        string  path = string `/members/${idMember}`;
        map<anydata> queryParam = {"actions": actions, "actions_entities": actionsEntities, "actions_display": actionsDisplay, "actions_limit": actionsLimit, "action_fields": actionFields, "action_since": actionSince, "action_before": actionBefore, "cards": cards, "card_fields": cardFields, "card_members": cardMembers, "card_member_fields": cardMemberFields, "card_attachments": cardAttachments, "card_attachment_fields": cardAttachmentFields, "card_stickers": cardStickers, "boards": boards, "board_fields": boardFields, "board_actions": boardActions, "board_actions_entities": boardActionsEntities, "board_actions_display": boardActionsDisplay, "board_actions_format": boardActionsFormat, "board_actions_since": boardActionsSince, "board_actions_limit": boardActionsLimit, "board_action_fields": boardActionFields, "board_lists": boardLists, "board_memberships": boardMemberships, "board_organization": boardOrganization, "board_organization_fields": boardOrganizationFields, "boardsInvited": boardsInvited, "boardsInvited_fields": boardsinvitedFields, "boardStars": boardStars, "savedSearches": savedSearches, "organizations": organizations, "organization_fields": organizationFields, "organization_paid_account": organizationPaidAccount, "organizationsInvited": organizationsInvited, "organizationsInvited_fields": organizationsinvitedFields, "notifications": notifications, "notifications_entities": notificationsEntities, "notifications_display": notificationsDisplay, "notifications_limit": notificationsLimit, "notification_fields": notificationFields, "notification_memberCreator": notificationMembercreator, "notification_memberCreator_fields": notificationMembercreatorFields, "notification_before": notificationBefore, "notification_since": notificationSince, "tokens": tokens, "paid_account": paidAccount, "boardBackgrounds": boardBackgrounds, "customBoardBackgrounds": customBoardBackgrounds, "customStickers": customStickers, "customEmoji": customEmoji, "fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update members by ID member
    #
    # + idMember - IdMember or username
    # + payload - Attributes of "Members" to be updated.
    # + return - Success
    remote isolated function updateMembersByIdMember(string idMember, Members payload) returns http:Response | error {
        string  path = string `/members/${idMember}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Get members actions by ID member
    #
    # + idMember - IdMember or username
    # + entities - True or false
    # + display - True or false
    # + filter - All or a comma-separated list of: addAttachmentToCard, addChecklistToCard, addMemberToBoard, addMemberToCard, addMemberToOrganization, addToOrganizationBoard, commentCard, convertToCardFromCheckItem, copyBoard, copyCard, copyCommentCard, createBoard, createCard, createList, createOrganization, deleteAttachmentFromCard, deleteBoardInvitation, deleteCard, deleteOrganizationInvitation, disablePowerUp, emailCard, enablePowerUp, makeAdminOfBoard, makeNormalMemberOfBoard, makeNormalMemberOfOrganization, makeObserverOfBoard, memberJoinedTrello, moveCardFromBoard, moveCardToBoard, moveListFromBoard, moveListToBoard, removeChecklistFromCard, removeFromOrganizationBoard, removeMemberFromCard, unconfirmedBoardInvitation, unconfirmedOrganizationInvitation, updateBoard, updateCard, updateCard:closed, updateCard:desc, updateCard:idList, updateCard:name, updateCheckItemStateOnCard, updateChecklist, updateList, updateList:closed, updateList:name, updateMember or updateOrganization
    # + fields - All or a comma-separated list of: data, date, idMemberCreator or type
    # + 'limit - A number from 0 to 1000
    # + format - One of: count, list or minimal
    # + since - A date, null or lastView
    # + before - A date, or null
    # + page - Page * limit must be less than 1000
    # + idModels - Only return actions related to these model ids
    # + member - True or false
    # + memberFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + memberCreator - True or false
    # + membercreatorFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + return - Success
    remote isolated function getMembersActionsByIdMember(string idMember, string? entities = (), string? display = (), string? filter = "all", string? fields = "all", string? 'limit = "50", string? format = "list", string? since = (), string? before = (), string? page = "0", string? idModels = (), string? member = (), string? memberFields = "avatarHash, fullName, initials and username", string? memberCreator = (), string? membercreatorFields = "avatarHash, fullName, initials and username") returns http:Response | error {
        string  path = string `/members/${idMember}/actions`;
        map<anydata> queryParam = {"entities": entities, "display": display, "filter": filter, "fields": fields, "limit": 'limit, "format": format, "since": since, "before": before, "page": page, "idModels": idModels, "member": member, "member_fields": memberFields, "memberCreator": memberCreator, "memberCreator_fields": membercreatorFields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add members avatar by ID member
    #
    # + idMember - IdMember or username
    # + payload - Attributes of "Members Avatar" to be added.
    # + return - Success
    remote isolated function addMembersAvatarByIdMember(string idMember, MembersAvatar payload) returns http:Response | error {
        string  path = string `/members/${idMember}/avatar`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Update members avatar source by ID member
    #
    # + idMember - IdMember or username
    # + payload - Attributes of "Members Avatar Source" to be updated.
    # + return - Success
    remote isolated function updateMembersAvatarSourceByIdMember(string idMember, MembersAvatarsource payload) returns http:Response | error {
        string  path = string `/members/${idMember}/avatarSource`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update members bio by ID member
    #
    # + idMember - IdMember or username
    # + payload - Attributes of "Members Bio" to be updated.
    # + return - Success
    remote isolated function updateMembersBioByIdMember(string idMember, MembersBio payload) returns http:Response | error {
        string  path = string `/members/${idMember}/bio`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Get members board backgrounds by ID member
    #
    # + idMember - IdMember or username
    # + filter - One of: all, custom, default, none or premium
    # + return - Success
    remote isolated function getMembersBoardBackgroundsByIdMember(string idMember, string? filter = "all") returns http:Response | error {
        string  path = string `/members/${idMember}/boardBackgrounds`;
        map<anydata> queryParam = {"filter": filter, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add members board backgrounds by ID member
    #
    # + idMember - IdMember or username
    # + payload - Attributes of "Members Board Backgrounds" to be added.
    # + return - Success
    remote isolated function addMembersBoardBackgroundsByIdMember(string idMember, MembersBoardbackgrounds payload) returns http:Response | error {
        string  path = string `/members/${idMember}/boardBackgrounds`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Get members board backgrounds by ID member by ID board background
    #
    # + idMember - IdMember or username
    # + idBoardBackground - IdBoardBackground
    # + fields - All or a comma-separated list of: brightness, fullSizeUrl, scaled or tile
    # + return - Success
    remote isolated function getMembersBoardBackgroundsByIdMemberByIdBoardBackground(string idMember, string idBoardBackground, string? fields = "all") returns http:Response | error {
        string  path = string `/members/${idMember}/boardBackgrounds/${idBoardBackground}`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update members board backgrounds by ID member by ID board background
    #
    # + idMember - IdMember or username
    # + idBoardBackground - IdBoardBackground
    # + payload - Attributes of "Members Board Backgrounds" to be updated.
    # + return - Success
    remote isolated function updateMembersBoardBackgroundsByIdMemberByIdBoardBackground(string idMember, string idBoardBackground, MembersBoardbackgrounds payload) returns http:Response | error {
        string  path = string `/members/${idMember}/boardBackgrounds/${idBoardBackground}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Delete members board backgrounds by ID member by ID board background
    #
    # + idMember - IdMember or username
    # + idBoardBackground - IdBoardBackground
    # + return - Success
    remote isolated function deleteMembersBoardBackgroundsByIdMemberByIdBoardBackground(string idMember, string idBoardBackground) returns http:Response | error {
        string  path = string `/members/${idMember}/boardBackgrounds/${idBoardBackground}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> delete(path, request, targetType = http:Response );
        return response;
    }
    # Get members board stars by ID member
    #
    # + idMember - IdMember or username
    # + return - Success
    remote isolated function getMembersBoardStarsByIdMember(string idMember) returns http:Response | error {
        string  path = string `/members/${idMember}/boardStars`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add members board stars by ID member
    #
    # + idMember - IdMember or username
    # + payload - Attributes of "Members Board Stars" to be added.
    # + return - Success
    remote isolated function addMembersBoardStarsByIdMember(string idMember, MembersBoardstars payload) returns http:Response | error {
        string  path = string `/members/${idMember}/boardStars`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Get members board stars by ID member by ID board star
    #
    # + idMember - IdMember or username
    # + idBoardStar - IdBoardStar
    # + return - Success
    remote isolated function getMembersBoardStarsByIdMemberByIdBoardStar(string idMember, string idBoardStar) returns http:Response | error {
        string  path = string `/members/${idMember}/boardStars/${idBoardStar}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update members board stars by ID member by ID board star
    #
    # + idMember - IdMember or username
    # + idBoardStar - IdBoardStar
    # + payload - Attributes of "Members Board Stars" to be updated.
    # + return - Success
    remote isolated function updateMembersBoardStarsByIdMemberByIdBoardStar(string idMember, string idBoardStar, MembersBoardstars payload) returns http:Response | error {
        string  path = string `/members/${idMember}/boardStars/${idBoardStar}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Delete members board stars by ID member by ID board star
    #
    # + idMember - IdMember or username
    # + idBoardStar - IdBoardStar
    # + return - Success
    remote isolated function deleteMembersBoardStarsByIdMemberByIdBoardStar(string idMember, string idBoardStar) returns http:Response | error {
        string  path = string `/members/${idMember}/boardStars/${idBoardStar}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> delete(path, request, targetType = http:Response );
        return response;
    }
    # Update members board stars ID board by ID member by ID board star
    #
    # + idMember - IdMember or username
    # + idBoardStar - IdBoardStar
    # + payload - Attributes of "Members Board Stars ID Board" to be updated.
    # + return - Success
    remote isolated function updateMembersBoardStarsIdBoardByIdMemberByIdBoardStar(string idMember, string idBoardStar, MembersBoardstarsIdboard payload) returns http:Response | error {
        string  path = string `/members/${idMember}/boardStars/${idBoardStar}/idBoard`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update members board stars pos by ID member by ID board star
    #
    # + idMember - IdMember or username
    # + idBoardStar - IdBoardStar
    # + payload - Attributes of "Members Board Stars Pos" to be updated.
    # + return - Success
    remote isolated function updateMembersBoardStarsPosByIdMemberByIdBoardStar(string idMember, string idBoardStar, MembersBoardstarsPos payload) returns http:Response | error {
        string  path = string `/members/${idMember}/boardStars/${idBoardStar}/pos`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Get members boards by ID member
    #
    # + idMember - IdMember or username
    # + filter - All or a comma-separated list of: closed, members, open, organization, pinned, public, starred or unpinned
    # + fields - All or a comma-separated list of: closed, dateLastActivity, dateLastView, desc, descData, idOrganization, invitations, invited, labelNames, memberships, name, pinned, powerUps, prefs, shortLink, shortUrl, starred, subscribed or url
    # + actions - All or a comma-separated list of: addAttachmentToCard, addChecklistToCard, addMemberToBoard, addMemberToCard, addMemberToOrganization, addToOrganizationBoard, commentCard, convertToCardFromCheckItem, copyBoard, copyCard, copyCommentCard, createBoard, createCard, createList, createOrganization, deleteAttachmentFromCard, deleteBoardInvitation, deleteCard, deleteOrganizationInvitation, disablePowerUp, emailCard, enablePowerUp, makeAdminOfBoard, makeNormalMemberOfBoard, makeNormalMemberOfOrganization, makeObserverOfBoard, memberJoinedTrello, moveCardFromBoard, moveCardToBoard, moveListFromBoard, moveListToBoard, removeChecklistFromCard, removeFromOrganizationBoard, removeMemberFromCard, unconfirmedBoardInvitation, unconfirmedOrganizationInvitation, updateBoard, updateCard, updateCard:closed, updateCard:desc, updateCard:idList, updateCard:name, updateCheckItemStateOnCard, updateChecklist, updateList, updateList:closed, updateList:name, updateMember or updateOrganization
    # + actionsEntities - True or false
    # + actionsLimit - A number from 0 to 1000
    # + actionsFormat - One of: count, list or minimal
    # + actionsSince - A date, null or lastView
    # + actionFields - All or a comma-separated list of: data, date, idMemberCreator or type
    # + memberships - All or a comma-separated list of: active, admin, deactivated, me or normal
    # + organization - True or false
    # + organizationFields - All or a comma-separated list of: billableMemberCount, desc, descData, displayName, idBoards, invitations, invited, logoHash, memberships, name, powerUps, prefs, premiumFeatures, products, url or website
    # + lists - One of: all, closed, none or open
    # + return - Success
    remote isolated function getMembersBoardsByIdMember(string idMember, string? filter = "all", string? fields = "all", string? actions = (), string? actionsEntities = (), string? actionsLimit = "50", string? actionsFormat = "list", string? actionsSince = (), string? actionFields = "all", string? memberships = "none", string? organization = (), string? organizationFields = "name and displayName", string? lists = "none") returns http:Response | error {
        string  path = string `/members/${idMember}/boards`;
        map<anydata> queryParam = {"filter": filter, "fields": fields, "actions": actions, "actions_entities": actionsEntities, "actions_limit": actionsLimit, "actions_format": actionsFormat, "actions_since": actionsSince, "action_fields": actionFields, "memberships": memberships, "organization": organization, "organization_fields": organizationFields, "lists": lists, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get members boards by ID member by filter
    #
    # + idMember - IdMember or username
    # + filter - Filter
    # + return - Success
    remote isolated function getMembersBoardsByIdMemberByFilter(string idMember, string filter) returns http:Response | error {
        string  path = string `/members/${idMember}/boards/${filter}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get members boards invited by ID member
    #
    # + idMember - IdMember or username
    # + fields - All or a comma-separated list of: closed, dateLastActivity, dateLastView, desc, descData, idOrganization, invitations, invited, labelNames, memberships, name, pinned, powerUps, prefs, shortLink, shortUrl, starred, subscribed or url
    # + return - Success
    remote isolated function getMembersBoardsInvitedByIdMember(string idMember, string? fields = "all") returns http:Response | error {
        string  path = string `/members/${idMember}/boardsInvited`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get members boards invited by ID member by field
    #
    # + idMember - IdMember or username
    # + 'field - Field
    # + return - Success
    remote isolated function getMembersBoardsInvitedByIdMemberByField(string idMember, string 'field) returns http:Response | error {
        string  path = string `/members/${idMember}/boardsInvited/${'field}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get members cards by ID member
    #
    # + idMember - IdMember or username
    # + actions - All or a comma-separated list of: addAttachmentToCard, addChecklistToCard, addMemberToBoard, addMemberToCard, addMemberToOrganization, addToOrganizationBoard, commentCard, convertToCardFromCheckItem, copyBoard, copyCard, copyCommentCard, createBoard, createCard, createList, createOrganization, deleteAttachmentFromCard, deleteBoardInvitation, deleteCard, deleteOrganizationInvitation, disablePowerUp, emailCard, enablePowerUp, makeAdminOfBoard, makeNormalMemberOfBoard, makeNormalMemberOfOrganization, makeObserverOfBoard, memberJoinedTrello, moveCardFromBoard, moveCardToBoard, moveListFromBoard, moveListToBoard, removeChecklistFromCard, removeFromOrganizationBoard, removeMemberFromCard, unconfirmedBoardInvitation, unconfirmedOrganizationInvitation, updateBoard, updateCard, updateCard:closed, updateCard:desc, updateCard:idList, updateCard:name, updateCheckItemStateOnCard, updateChecklist, updateList, updateList:closed, updateList:name, updateMember or updateOrganization
    # + attachments - A boolean value or &quot;cover&quot; for only card cover attachments
    # + attachmentFields - All or a comma-separated list of: bytes, date, edgeColor, idMember, isUpload, mimeType, name, previews or url
    # + stickers - True or false
    # + members - True or false
    # + memberFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + checkItemStates - True or false
    # + checklists - One of: all or none
    # + 'limit - A number from 1 to 1000
    # + since - A date, or null
    # + before - A date, or null
    # + filter - One of: all, closed, none, open or visible
    # + fields - All or a comma-separated list of: badges, checkItemStates, closed, dateLastActivity, desc, descData, due, email, idAttachmentCover, idBoard, idChecklists, idLabels, idList, idMembers, idMembersVoted, idShort, labels, manualCoverAttachment, name, pos, shortLink, shortUrl, subscribed or url
    # + return - Success
    remote isolated function getMembersCardsByIdMember(string idMember, string? actions = (), string? attachments = (), string? attachmentFields = "all", string? stickers = (), string? members = (), string? memberFields = "avatarHash, fullName, initials and username", string? checkItemStates = (), string? checklists = "none", string? 'limit = (), string? since = (), string? before = (), string? filter = "visible", string? fields = "all") returns http:Response | error {
        string  path = string `/members/${idMember}/cards`;
        map<anydata> queryParam = {"actions": actions, "attachments": attachments, "attachment_fields": attachmentFields, "stickers": stickers, "members": members, "member_fields": memberFields, "checkItemStates": checkItemStates, "checklists": checklists, "limit": 'limit, "since": since, "before": before, "filter": filter, "fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get members cards by ID member by filter
    #
    # + idMember - IdMember or username
    # + filter - Filter
    # + return - Success
    remote isolated function getMembersCardsByIdMemberByFilter(string idMember, string filter) returns http:Response | error {
        string  path = string `/members/${idMember}/cards/${filter}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get members custom board backgrounds by ID member
    #
    # + idMember - IdMember or username
    # + filter - One of: all or none
    # + return - Success
    remote isolated function getMembersCustomBoardBackgroundsByIdMember(string idMember, string? filter = "all") returns http:Response | error {
        string  path = string `/members/${idMember}/customBoardBackgrounds`;
        map<anydata> queryParam = {"filter": filter, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add members custom board backgrounds by ID member
    #
    # + idMember - IdMember or username
    # + payload - Attributes of "Members Custom Board Backgrounds" to be added.
    # + return - Success
    remote isolated function addMembersCustomBoardBackgroundsByIdMember(string idMember, MembersCustomboardbackgrounds payload) returns http:Response | error {
        string  path = string `/members/${idMember}/customBoardBackgrounds`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Get members custom board backgrounds by ID member by ID board background
    #
    # + idMember - IdMember or username
    # + idBoardBackground - IdBoardBackground
    # + fields - All or a comma-separated list of: brightness, fullSizeUrl, scaled or tile
    # + return - Success
    remote isolated function getMembersCustomBoardBackgroundsByIdMemberByIdBoardBackground(string idMember, string idBoardBackground, string? fields = "all") returns http:Response | error {
        string  path = string `/members/${idMember}/customBoardBackgrounds/${idBoardBackground}`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update members custom board backgrounds by ID member by ID board background
    #
    # + idMember - IdMember or username
    # + idBoardBackground - IdBoardBackground
    # + payload - Attributes of "Members Custom Board Backgrounds" to be updated.
    # + return - Success
    remote isolated function updateMembersCustomBoardBackgroundsByIdMemberByIdBoardBackground(string idMember, string idBoardBackground, MembersCustomboardbackgrounds payload) returns http:Response | error {
        string  path = string `/members/${idMember}/customBoardBackgrounds/${idBoardBackground}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Delete members custom board backgrounds by ID member by ID board background
    #
    # + idMember - IdMember or username
    # + idBoardBackground - IdBoardBackground
    # + return - Success
    remote isolated function deleteMembersCustomBoardBackgroundsByIdMemberByIdBoardBackground(string idMember, string idBoardBackground) returns http:Response | error {
        string  path = string `/members/${idMember}/customBoardBackgrounds/${idBoardBackground}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> delete(path, request, targetType = http:Response );
        return response;
    }
    # Get members custom emoji by ID member
    #
    # + idMember - IdMember or username
    # + filter - One of: all or none
    # + return - Success
    remote isolated function getMembersCustomEmojiByIdMember(string idMember, string? filter = "all") returns http:Response | error {
        string  path = string `/members/${idMember}/customEmoji`;
        map<anydata> queryParam = {"filter": filter, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add members custom emoji by ID member
    #
    # + idMember - IdMember or username
    # + payload - Attributes of "Members Custom Emoji" to be added.
    # + return - Success
    remote isolated function addMembersCustomEmojiByIdMember(string idMember, MembersCustomemoji payload) returns http:Response | error {
        string  path = string `/members/${idMember}/customEmoji`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Get members custom emoji by ID member by ID custom emoji
    #
    # + idMember - IdMember or username
    # + idCustomEmoji - IdCustomEmoji
    # + fields - All or a comma-separated list of: name or url
    # + return - Success
    remote isolated function getMembersCustomEmojiByIdMemberByIdCustomEmoji(string idMember, string idCustomEmoji, string? fields = "all") returns http:Response | error {
        string  path = string `/members/${idMember}/customEmoji/${idCustomEmoji}`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get members custom stickers by ID member
    #
    # + idMember - IdMember or username
    # + filter - One of: all or none
    # + return - Success
    remote isolated function getMembersCustomStickersByIdMember(string idMember, string? filter = "all") returns http:Response | error {
        string  path = string `/members/${idMember}/customStickers`;
        map<anydata> queryParam = {"filter": filter, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add members custom stickers by ID member
    #
    # + idMember - IdMember or username
    # + payload - Attributes of "Members Custom Stickers" to be added.
    # + return - Success
    remote isolated function addMembersCustomStickersByIdMember(string idMember, MembersCustomstickers payload) returns http:Response | error {
        string  path = string `/members/${idMember}/customStickers`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Get members custom stickers by ID member by ID custom sticker
    #
    # + idMember - IdMember or username
    # + idCustomSticker - IdCustomSticker
    # + fields - All or a comma-separated list of: scaled or url
    # + return - Success
    remote isolated function getMembersCustomStickersByIdMemberByIdCustomSticker(string idMember, string idCustomSticker, string? fields = "all") returns http:Response | error {
        string  path = string `/members/${idMember}/customStickers/${idCustomSticker}`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Delete members custom stickers by ID member by ID custom sticker
    #
    # + idMember - IdMember or username
    # + idCustomSticker - IdCustomSticker
    # + return - Success
    remote isolated function deleteMembersCustomStickersByIdMemberByIdCustomSticker(string idMember, string idCustomSticker) returns http:Response | error {
        string  path = string `/members/${idMember}/customStickers/${idCustomSticker}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> delete(path, request, targetType = http:Response );
        return response;
    }
    # Get members deltas by ID member
    #
    # + idMember - IdMember or username
    # + tags - A valid tag for subscribing
    # + ixLastUpdate - A number from -1 to Infinity
    # + return - Success
    remote isolated function getMembersDeltasByIdMember(string idMember, string tags, string ixLastUpdate) returns http:Response | error {
        string  path = string `/members/${idMember}/deltas`;
        map<anydata> queryParam = {"tags": tags, "ixLastUpdate": ixLastUpdate, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update members full name by ID member
    #
    # + idMember - IdMember or username
    # + payload - Attributes of "Members Full Name" to be updated.
    # + return - Success
    remote isolated function updateMembersFullNameByIdMember(string idMember, MembersFullname payload) returns http:Response | error {
        string  path = string `/members/${idMember}/fullName`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update members initials by ID member
    #
    # + idMember - IdMember or username
    # + payload - Attributes of "Members Initials" to be updated.
    # + return - Success
    remote isolated function updateMembersInitialsByIdMember(string idMember, MembersInitials payload) returns http:Response | error {
        string  path = string `/members/${idMember}/initials`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Get members notifications by ID member
    #
    # + idMember - IdMember or username
    # + entities - True or false
    # + display - True or false
    # + filter - All or a comma-separated list of: addAdminToBoard, addAdminToOrganization, addedAttachmentToCard, addedMemberToCard, addedToBoard, addedToCard, addedToOrganization, cardDueSoon, changeCard, closeBoard, commentCard, createdCard, declinedInvitationToBoard, declinedInvitationToOrganization, invitedToBoard, invitedToOrganization, makeAdminOfBoard, makeAdminOfOrganization, memberJoinedTrello, mentionedOnCard, removedFromBoard, removedFromCard, removedFromOrganization, removedMemberFromCard, unconfirmedInvitedToBoard, unconfirmedInvitedToOrganization or updateCheckItemStateOnCard
    # + readFilter - One of: all, read or unread
    # + fields - All or a comma-separated list of: data, date, idMemberCreator, type or unread
    # + 'limit - A number from 1 to 1000
    # + page - A number from 0 to 100
    # + before - An ID, or null
    # + since - An ID, or null
    # + memberCreator - True or false
    # + membercreatorFields - All or a comma-separated list of: avatarHash, bio, bioData, confirmed, fullName, idPremOrgsAdmin, initials, memberType, products, status, url or username
    # + return - Success
    remote isolated function getMembersNotificationsByIdMember(string idMember, string? entities = (), string? display = (), string? filter = "all", string? readFilter = "all", string? fields = "all", string? 'limit = "50", string? page = "0", string? before = (), string? since = (), string? memberCreator = (), string? membercreatorFields = "avatarHash, fullName, initials and username") returns http:Response | error {
        string  path = string `/members/${idMember}/notifications`;
        map<anydata> queryParam = {"entities": entities, "display": display, "filter": filter, "read_filter": readFilter, "fields": fields, "limit": 'limit, "page": page, "before": before, "since": since, "memberCreator": memberCreator, "memberCreator_fields": membercreatorFields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get members notifications by ID member by filter
    #
    # + idMember - IdMember or username
    # + filter - Filter
    # + return - Success
    remote isolated function getMembersNotificationsByIdMemberByFilter(string idMember, string filter) returns http:Response | error {
        string  path = string `/members/${idMember}/notifications/${filter}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add members one time messages dismissed by ID member
    #
    # + idMember - IdMember or username
    # + payload - Attributes of "Members One Time Messages Dismissed" to be added.
    # + return - Success
    remote isolated function addMembersOneTimeMessagesDismissedByIdMember(string idMember, MembersOnetimemessagesdismissed payload) returns http:Response | error {
        string  path = string `/members/${idMember}/oneTimeMessagesDismissed`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Get members organizations by ID member
    #
    # + idMember - IdMember or username
    # + filter - One of: all, members, none or public
    # + fields - All or a comma-separated list of: billableMemberCount, desc, descData, displayName, idBoards, invitations, invited, logoHash, memberships, name, powerUps, prefs, premiumFeatures, products, url or website
    # + paidAccount - True or false
    # + return - Success
    remote isolated function getMembersOrganizationsByIdMember(string idMember, string? filter = "all", string? fields = "all", string? paidAccount = ()) returns http:Response | error {
        string  path = string `/members/${idMember}/organizations`;
        map<anydata> queryParam = {"filter": filter, "fields": fields, "paid_account": paidAccount, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get members organizations by ID member by filter
    #
    # + idMember - IdMember or username
    # + filter - Filter
    # + return - Success
    remote isolated function getMembersOrganizationsByIdMemberByFilter(string idMember, string filter) returns http:Response | error {
        string  path = string `/members/${idMember}/organizations/${filter}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get members organizations invited by ID member
    #
    # + idMember - IdMember or username
    # + fields - All or a comma-separated list of: billableMemberCount, desc, descData, displayName, idBoards, invitations, invited, logoHash, memberships, name, powerUps, prefs, premiumFeatures, products, url or website
    # + return - Success
    remote isolated function getMembersOrganizationsInvitedByIdMember(string idMember, string? fields = "all") returns http:Response | error {
        string  path = string `/members/${idMember}/organizationsInvited`;
        map<anydata> queryParam = {"fields": fields, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Get members organizations invited by ID member by field
    #
    # + idMember - IdMember or username
    # + 'field - Field
    # + return - Success
    remote isolated function getMembersOrganizationsInvitedByIdMemberByField(string idMember, string 'field) returns http:Response | error {
        string  path = string `/members/${idMember}/organizationsInvited/${'field}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update members prefs color blind by ID member
    #
    # + idMember - IdMember or username
    # + payload - Attributes of "Prefs Color Blind" to be updated.
    # + return - Success
    remote isolated function updateMembersPrefsColorBlindByIdMember(string idMember, PrefsColorblind payload) returns http:Response | error {
        string  path = string `/members/${idMember}/prefs/colorBlind`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update members prefs locale by ID member
    #
    # + idMember - IdMember or username
    # + payload - Attributes of "Prefs Locale" to be updated.
    # + return - Success
    remote isolated function updateMembersPrefsLocaleByIdMember(string idMember, PrefsLocale payload) returns http:Response | error {
        string  path = string `/members/${idMember}/prefs/locale`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update members prefs minutes between summaries by ID member
    #
    # + idMember - IdMember or username
    # + payload - Attributes of "Prefs Minutes Between Summaries" to be updated.
    # + return - Success
    remote isolated function updateMembersPrefsMinutesBetweenSummariesByIdMember(string idMember, PrefsMinutesbetweensummaries payload) returns http:Response | error {
        string  path = string `/members/${idMember}/prefs/minutesBetweenSummaries`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Get members saved searches by ID member
    #
    # + idMember - IdMember or username
    # + return - Success
    remote isolated function getMembersSavedSearchesByIdMember(string idMember) returns http:Response | error {
        string  path = string `/members/${idMember}/savedSearches`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Add members saved searches by ID member
    #
    # + idMember - IdMember or username
    # + payload - Attributes of "Members Saved Searches" to be added.
    # + return - Success
    remote isolated function addMembersSavedSearchesByIdMember(string idMember, MembersSavedsearches payload) returns http:Response | error {
        string  path = string `/members/${idMember}/savedSearches`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->post(path, request, targetType=http:Response );
        return response;
    }
    # Get members saved searches by ID member by ID saved search
    #
    # + idMember - IdMember or username
    # + idSavedSearch - IdSavedSearch
    # + return - Success
    remote isolated function getMembersSavedSearchesByIdMemberByIdSavedSearch(string idMember, string idSavedSearch) returns http:Response | error {
        string  path = string `/members/${idMember}/savedSearches/${idSavedSearch}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update members saved searches by ID member by ID saved search
    #
    # + idMember - IdMember or username
    # + idSavedSearch - IdSavedSearch
    # + payload - Attributes of "Members Saved Searches" to be updated.
    # + return - Success
    remote isolated function updateMembersSavedSearchesByIdMemberByIdSavedSearch(string idMember, string idSavedSearch, MembersSavedsearches payload) returns http:Response | error {
        string  path = string `/members/${idMember}/savedSearches/${idSavedSearch}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Delete members saved searches by ID member by ID saved search
    #
    # + idMember - IdMember or username
    # + idSavedSearch - IdSavedSearch
    # + return - Success
    remote isolated function deleteMembersSavedSearchesByIdMemberByIdSavedSearch(string idMember, string idSavedSearch) returns http:Response | error {
        string  path = string `/members/${idMember}/savedSearches/${idSavedSearch}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response  response = check self.clientEp-> delete(path, request, targetType = http:Response );
        return response;
    }
    # Update members saved searches name by ID member by ID saved search
    #
    # + idMember - IdMember or username
    # + idSavedSearch - IdSavedSearch
    # + payload - Attributes of "Members Saved Searches Name" to be updated.
    # + return - Success
    remote isolated function updateMembersSavedSearchesNameByIdMemberByIdSavedSearch(string idMember, string idSavedSearch, MembersSavedsearchesName payload) returns http:Response | error {
        string  path = string `/members/${idMember}/savedSearches/${idSavedSearch}/name`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update members saved searches pos by ID member by ID saved search
    #
    # + idMember - IdMember or username
    # + idSavedSearch - IdSavedSearch
    # + payload - Attributes of "Members Saved Searches Pos" to be updated.
    # + return - Success
    remote isolated function updateMembersSavedSearchesPosByIdMemberByIdSavedSearch(string idMember, string idSavedSearch, MembersSavedsearchesPos payload) returns http:Response | error {
        string  path = string `/members/${idMember}/savedSearches/${idSavedSearch}/pos`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Update members saved searches query by ID member by ID saved search
    #
    # + idMember - IdMember or username
    # + idSavedSearch - IdSavedSearch
    # + payload - Attributes of "Members Saved Searches Query" to be updated.
    # + return - Success
    remote isolated function updateMembersSavedSearchesQueryByIdMemberByIdSavedSearch(string idMember, string idSavedSearch, MembersSavedsearchesQuery payload) returns http:Response | error {
        string  path = string `/members/${idMember}/savedSearches/${idSavedSearch}/query`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Get members tokens by ID member
    #
    # + idMember - IdMember or username
    # + filter - One of: all or none
    # + return - Success
    remote isolated function getMembersTokensByIdMember(string idMember, string? filter = "all") returns http:Response | error {
        string  path = string `/members/${idMember}/tokens`;
        map<anydata> queryParam = {"filter": filter, 'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
    # Update members username by ID member
    #
    # + idMember - IdMember or username
    # + payload - Attributes of "Members Username" to be updated.
    # + return - Success
    remote isolated function updateMembersUsernameByIdMember(string idMember, MembersUsername payload) returns http:Response | error {
        string  path = string `/members/${idMember}/username`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response  response = check self.clientEp->put(path, request, targetType=http:Response );
        return response;
    }
    # Get members by ID member by field
    #
    # + idMember - IdMember or username
    # + 'field - Field
    # + return - Success
    remote isolated function getMembersByIdMemberByField(string idMember, string 'field) returns http:Response | error {
        string  path = string `/members/${idMember}/${'field}`;
        map<anydata> queryParam = {'key: self.apiKeys["key"], token: self.apiKeys["token"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response  response = check self.clientEp-> get(path, targetType = http:Response );
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
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
