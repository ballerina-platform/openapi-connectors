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

public type CategoryArr Category[];

public type MilestoneArr Milestone[];

public type EntityTemplateArr EntityTemplate[];

public type EpicSlimArr EpicSlim[];

public type ThreadedCommentArr ThreadedComment[];

public type StorySlimArr StorySlim[];

public type UploadedFileArr UploadedFile[];

public type GroupArr Group[];

public type IterationSlimArr IterationSlim[];

public type LabelArr Label[];

public type LinkedFileArr LinkedFile[];

public type MemberArr Member[];

public type ProjectArr Project[];

public type RepositoryArr Repository[];

public type StoryReactionArr StoryReaction[];

public type HistoryArr History[];

public type WorkflowArr Workflow[];

public type GetIterationStories record {
    # A true/false boolean indicating whether to return Stories with their descriptions.
    boolean? includes_description?;
};

# A references to a Story Workflow State.
public type HistoryReferenceWorkflowState record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # Either "unstarted", "started", or "done".
    string? 'type;
    # The name of the entity referenced.
    string? name;
};

# An Epic is a collection of stories that together might make up a release, a milestone, or some other large initiative that your organization is working on.
public type Epic record {
    # The Shortcut application url for the Epic.
    string? app_url;
    # The Epic's description.
    string? description;
    # True/false boolean that indicates whether the Epic is archived or not.
    boolean? archived;
    # A true/false boolean indicating if the Epic has been started.
    boolean? started;
    # A string description of this resource.
    string? entity_type;
    # An array of Labels attached to the Epic.
    LabelSlim[]? labels;
    # Deprecated: use member_mention_ids.
    string[]? mention_ids;
    # An array of Member IDs that have been mentioned in the Epic description.
    string[]? member_mention_ids;
    # The IDs of Projects related to this Epic.
    int[]? project_ids;
    # The number of stories in this epic which are not associated with a project.
    int? stories_without_projects;
    # A manual override for the time/date the Epic was completed.
    string? completed_at_override;
    # The ID of the associated productboard integration.
    string? productboard_plugin_id;
    # The time/date the Epic was started.
    string? started_at;
    # The time/date the Epic was completed.
    string? completed_at;
    # The name of the Epic.
    string? name;
    # A true/false boolean indicating if the Epic has been completed.
    boolean? completed;
    # A nested array of threaded comments.
    ThreadedComment[]? comments;
    # The URL of the associated productboard feature.
    string? productboard_url;
    # The Epic's planned start date.
    string? planned_start_date;
    # `Deprecated` The workflow state that the Epic is in.
    string? state;
    # The ID of the Milestone this Epic is related to.
    int? milestone_id;
    # The ID of the Member that requested the epic.
    string? requested_by_id;
    # The ID of the Epic State.
    int? epic_state_id;
    # An array of Label ids attached to the Epic.
    int[]? label_ids;
    # A manual override for the time/date the Epic was started.
    string? started_at_override;
    # Group ID
    string? group_id;
    # The time/date the Epic was updated.
    string? updated_at;
    # An array of Group IDs that have been mentioned in the Epic description.
    string[]? group_mention_ids;
    # The ID of the associated productboard feature.
    string? productboard_id;
    # An array of UUIDs for any Members you want to add as Followers on this Epic.
    string[]? follower_ids;
    # An array of UUIDs for any members you want to add as Owners on this new Epic.
    string[]? owner_ids;
    # This field can be set to another unique ID. In the case that the Epic has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id;
    # The unique ID of the Epic.
    int? id;
    # The Epic's relative position in the Epic workflow state.
    int? position;
    # The name of the associated productboard feature.
    string? productboard_name;
    # The Epic's deadline.
    string? deadline;
    # A group of calculated values for this Epic.
    EpicStats? stats;
    # The time/date the Epic was created.
    string? created_at;
};

# A group of calculated values for this Project.
public type ProjectStats record {
    # The total number of stories in this Project.
    int? num_stories;
    # The total number of points in this Project.
    int? num_points;
    # The total number of documents related to this Project
    int? num_related_documents;
};

public type GetProjectStories record {
    # A true/false boolean indicating whether to return Stories with their descriptions.
    boolean? includes_description?;
};

# Corresponds to a VCS Pull Request attached to a Shortcut story.
public type PullRequest record {
    # A string description of this resource.
    string? entity_type;
    # True/False boolean indicating whether the VCS pull request has been closed.
    boolean? closed;
    # True/False boolean indicating whether the VCS pull request has been merged.
    boolean? merged;
    # Number of lines added in the pull request, according to VCS.
    int? num_added;
    # The ID of the branch for the particular pull request.
    int? branch_id;
    # The pull request's unique number ID in VCS.
    int? number;
    # The name of the branch for the particular pull request.
    string? branch_name;
    # The name of the target branch for the particular pull request.
    string? target_branch_name;
    # The number of commits on the pull request.
    int? num_commits;
    # The title of the pull request.
    string? title;
    # The time/date the pull request was created.
    string? updated_at;
    # True/False boolean indicating whether the VCS pull request is in the draft state.
    boolean? draft;
    # The unique ID associated with the pull request in Shortcut.
    int? id;
    # An array of PullRequestLabels attached to the PullRequest.
    PullRequestLabel[]? vcs_labels?;
    # The URL for the pull request.
    string? url;
    # Number of lines removed in the pull request, according to VCS.
    int? num_removed;
    # The status of the review for the pull request.
    string? review_status?;
    # Number of lines modified in the pull request, according to VCS.
    int? num_modified;
    # The status of the Continuous Integration workflow for the pull request.
    string? build_status?;
    # The ID of the target branch for the particular pull request.
    int? target_branch_id;
    # The ID of the repository for the particular pull request.
    int? repository_id;
    # The time/date the pull request was created.
    string? created_at;
};

# A Label can be used to associate and filter Stories and Epics, and also create new Workspaces. A slim Label does not include aggregate stats. Fetch the Label using the labels endpoint to retrieve them.
public type LabelSlim record {
    # The Shortcut application url for the Label.
    string? app_url;
    # The description of the Label.
    string? description;
    # A true/false boolean indicating if the Label has been archived.
    boolean? archived;
    # A string description of this resource.
    string? entity_type;
    # The hex color to be displayed with the Label (for example, "#ff0000").
    string? color;
    # The name of the Label.
    string? name;
    # The time/date that the Label was updated.
    string? updated_at;
    # This field can be set to another unique ID. In the case that the Label has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id;
    # The unique ID of the Label.
    int? id;
    # The time/date that the Label was created.
    string? created_at;
};

# A history item is a group of actions that represent a transactional change to a Story.
public type History record {
    # The date when the change occurred.
    string? changed_at;
    # The ID of the primary entity that has changed, if applicable.
    int? primary_id?;
    # An array of objects affected by the change. Reference objects provide basic information for the entities reference in the history actions. Some have specific fields, but they always contain an id, entity_type, and a name.
    (HistoryReferenceBranch|HistoryReferenceCommit|HistoryReferenceEpic|HistoryReferenceGroup|HistoryReferenceIteration|HistoryReferenceLabel|HistoryReferenceProject|HistoryReferenceStory|HistoryReferenceStoryTask|HistoryReferenceWorkflowState|HistoryReferenceGeneral?)[]? references?;
    # An array of actions that were performed for the change.
    record {}[]? actions;
    # The ID of the member who performed the change.
    string? member_id?;
    # The ID of the webhook that handled the change.
    string? external_id?;
    # The ID representing the change for the story.
    string? id;
    # The version of the change format.
    string? 'version;
    # The ID of the webhook that handled the change.
    string? webhook_id?;
};

# An action representing a Label being created.
public type HistoryActionLabelCreate record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The action of the entity referenced.
    string? action;
    # The application URL of the Label.
    string? app_url;
    # The name of the Label.
    string? name;
};

public type BasicWorkspaceInfo record {
    string? url_slug;
    int[]? estimate_scale;
};

# Story links allow you create semantic relationships between two stories. Relationship types are relates to, blocks / blocked by, and duplicates / is duplicated by. The format is `subject -> link -> object`, or for example "story 5 blocks story 6".
public type StoryLink record {
    # A string description of this resource.
    string? entity_type;
    # The unique identifier of the Story Link.
    int? id;
    # The ID of the subject Story.
    int? subject_id;
    # The workflow state of the "subject" story.
    int? subject_workflow_state_id;
    # How the subject Story acts on the object Story. This can be "blocks", "duplicates", or "relates to".
    string? verb;
    # The ID of the object Story.
    int? object_id;
    # The time/date when the Story Link was created.
    string? created_at;
    # The time/date when the Story Link was last updated.
    string? updated_at;
};

# An action representing a VCS Branch being merged.
public type HistoryActionBranchMerge record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The name of the VCS Branch that was pushed
    string? name;
    # The URL from the provider of the VCS Branch that was pushed
    string? url;
    # The action of the entity referenced.
    string? action;
};

public type UpdateStories record {
    # If the Stories should be archived or not.
    boolean? archived?;
    # The Ids of the Stories you wish to update.
    int[]? story_ids;
    # The type of story (feature, bug, chore).
    string? story_type?;
    # One of "first" or "last". This can be used to move the given story to the first or last position in the workflow state.
    string? move_to?;
    # The UUIDs of the new followers to be added.
    string[]? follower_ids_add?;
    # The ID of the epic the story belongs to.
    int? epic_id?;
    # An array of External Links associated with this story.
    string[]? external_links?;
    # The UUIDs of the followers to be removed.
    string[]? follower_ids_remove?;
    # The ID of the member that requested the story.
    string? requested_by_id?;
    # The ID of the iteration the story belongs to.
    int? iteration_id?;
    # An array of labels to be added.
    CreateLabelParams[]? labels_add?;
    # The Id of the Group the Stories should belong to.
    string? group_id?;
    # The ID of the workflow state to put the stories in.
    int? workflow_state_id?;
    # The ID of the story that the stories are to be moved before.
    int? before_id?;
    # The numeric point estimate of the story. Can also be null, which means unestimated.
    int? estimate?;
    # The ID of the story that the stories are to be moved below.
    int? after_id?;
    # The UUIDs of the owners to be removed.
    string[]? owner_ids_remove?;
    # The ID of the Project the Stories should belong to.
    int? project_id?;
    # An array of labels to be removed.
    CreateLabelParams[]? labels_remove?;
    # The due date of the story.
    string? deadline?;
    # The UUIDs of the new owners to be added.
    string[]? owner_ids_add?;
};

public type DeleteStories record {
    # An array of IDs of Stories to delete.
    int[]? story_ids;
};

# The changes that have occurred as a result of the action.
public type HistoryChangesStoryLink record {
    # A timestamp that represents the Story's deadline.
    StoryHistoryChangeOldNewStr? verb?;
    # The estimate value for the Story
    StoryHistoryChangeOldNewInt? object_id?;
    # The estimate value for the Story
    StoryHistoryChangeOldNewInt? subject_id?;
};

public type GetExternalLinkStoriesParams record {
    # The external link associated with one or more stories.
    string? external_link;
};

# The Identity of the VCS user that authored the Commit.
public type Identity record {
    # A string description of this resource.
    string? entity_type;
    # This is your login in VCS.
    string? name;
    # The type of Identity; currently only type is github.
    string? 'type;
};

# Stories are the standard unit of work in Shortcut and represent individual features, bugs, and chores.
public type Story record {
    # The Shortcut application url for the Story.
    string? app_url;
    # The description of the story.
    string? description;
    # True if the story has been archived or not.
    boolean? archived;
    # A true/false boolean indicating if the Story has been started.
    boolean? started;
    # An array of story links attached to the Story.
    TypedStoryLink[]? story_links;
    # A string description of this resource.
    string? entity_type;
    # An array of labels attached to the story.
    LabelSlim[]? labels;
    # Deprecated: use member_mention_ids.
    string[]? mention_ids;
    # An array of Member IDs that have been mentioned in the Story description.
    string[]? member_mention_ids;
    # The type of story (feature, bug, chore).
    string? story_type;
    # An array of linked files attached to the story.
    LinkedFile[]? linked_files;
    # The ID of the workflow the story belongs to.
    int? workflow_id;
    # A manual override for the time/date the Story was completed.
    string? completed_at_override;
    # The time/date the Story was started.
    string? started_at;
    # The time/date the Story was completed.
    string? completed_at;
    # The name of the story.
    string? name;
    # A true/false boolean indicating if the Story has been completed.
    boolean? completed;
    # An array of comments attached to the story.
    StoryComment[]? comments;
    # A true/false boolean indicating if the Story is currently a blocker of another story.
    boolean? blocker;
    # An array of Git branches attached to the story.
    Branch[]? branches;
    # The ID of the epic the story belongs to.
    int? epic_id;
    # The ID of the story template used to create this story, or null if not created using a template.
    string? story_template_id;
    # An array of external links (strings) associated with a Story
    string[]? external_links;
    # The IDs of the iteration the story belongs to.
    int[]? previous_iteration_ids;
    # The ID of the Member that requested the story.
    string? requested_by_id;
    # The ID of the iteration the story belongs to.
    int? iteration_id;
    # An array of tasks connected to the story.
    Task[]? tasks;
    # An array of label ids attached to the story.
    int[]? label_ids;
    # A manual override for the time/date the Story was started.
    string? started_at_override;
    # The ID of the group associated with the story.
    string? group_id;
    # The ID of the workflow state the story is currently in.
    int? workflow_state_id;
    # The time/date the Story was updated.
    string? updated_at;
    # An array of Pull/Merge Requests attached to the story.
    PullRequest[]? pull_requests;
    # An array of Group IDs that have been mentioned in the Story description.
    string[]? group_mention_ids;
    # An array of UUIDs for any Members listed as Followers.
    string[]? follower_ids;
    # An array of UUIDs of the owners of this story.
    string[]? owner_ids;
    # This field can be set to another unique ID. In the case that the Story has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id;
    # The unique ID of the Story.
    int? id;
    # The lead time (in seconds) of this story when complete.
    int? lead_time?;
    # The numeric point estimate of the story. Can also be null, which means unestimated.
    int? estimate;
    # An array of commits attached to the story.
    Commit[]? commits;
    # An array of files attached to the story.
    UploadedFile[]? files;
    # A number representing the position of the story in relation to every other story in the current project.
    int? position;
    # A true/false boolean indicating if the Story is currently blocked.
    boolean? blocked;
    # The ID of the project the story belongs to.
    int? project_id;
    # The due date of the story.
    string? deadline;
    # The stats object for Stories
    StoryStats? stats;
    # The cycle time (in seconds) of this story when complete.
    int? cycle_time?;
    # The time/date the Story was created.
    string? created_at;
    # The time/date the Story was last changed workflow-state.
    string? moved_at;
};

# A Comment is any note added within the Comment field of a Story.
public type StoryComment record {
    # The Shortcut application url for the Comment.
    string? app_url;
    # A string description of this resource.
    string? entity_type;
    # The ID of the Story on which the Comment appears.
    int? story_id;
    # Deprecated: use member_mention_ids.
    string[]? mention_ids;
    # The unique ID of the Member who is the Comment's author.
    string? author_id;
    # The unique IDs of the Member who are mentioned in the Comment.
    string[]? member_mention_ids;
    # The time/date when the Comment was updated.
    string? updated_at;
    # The unique IDs of the Group who are mentioned in the Comment.
    string[]? group_mention_ids;
    # This field can be set to another unique ID. In the case that the Comment has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id;
    # The unique ID of the Comment.
    int? id;
    # The Comments numerical position in the list from oldest to newest.
    int? position;
    # A set of Reactions to this Comment.
    StoryReaction[]? reactions;
    # The time/date when the Comment was created.
    string? created_at;
    # The text of the Comment.
    string? text;
};

public type UpdateStory record {
    # The description of the story.
    string? description?;
    # True if the story is archived, otherwise false.
    boolean? archived?;
    # An array of labels attached to the story.
    CreateLabelParams[]? labels?;
    # An array of IDs of Pull/Merge Requests attached to the story.
    int[]? pull_request_ids?;
    # The type of story (feature, bug, chore).
    string? story_type?;
    # One of "first" or "last". This can be used to move the given story to the first or last position in the workflow state.
    string? move_to?;
    # An array of IDs of files attached to the story.
    int[]? file_ids?;
    # A manual override for the time/date the Story was completed.
    string? completed_at_override?;
    # The title of the story.
    string? name?;
    # The ID of the epic the story belongs to.
    int? epic_id?;
    # An array of External Links associated with this story.
    string[]? external_links?;
    # An array of IDs of Branches attached to the story.
    int[]? branch_ids?;
    # An array of IDs of Commits attached to the story.
    int[]? commit_ids?;
    # The ID of the member that requested the story.
    string? requested_by_id?;
    # The ID of the iteration the story belongs to.
    int? iteration_id?;
    # A manual override for the time/date the Story was started.
    string? started_at_override?;
    # The ID of the group to associate with this story
    string? group_id?;
    # The ID of the workflow state to put the story in.
    int? workflow_state_id?;
    # An array of UUIDs of the followers of this story.
    string[]? follower_ids?;
    # An array of UUIDs of the owners of this story.
    string[]? owner_ids?;
    # The ID of the story we want to move this story before.
    int? before_id?;
    # The numeric point estimate of the story. Can also be null, which means unestimated.
    int? estimate?;
    # The ID of the story we want to move this story after.
    int? after_id?;
    # The ID of the project the story belongs to.
    int? project_id?;
    # An array of IDs of linked files attached to the story.
    int[]? linked_file_ids?;
    # The due date of the story.
    string? deadline?;
};

# An action representing a Story being created.
public type HistoryActionStoryCreate record {
    # The application URL of the Story.
    string? app_url;
    # The description of the Story.
    string? description?;
    # Whether or not the Story has been started.
    boolean? started?;
    # The type of entity referenced.
    string? entity_type;
    # An array of Task IDs on this Story.
    int[]? task_ids?;
    # The type of Story; either feature, bug, or chore.
    string? story_type;
    # The name of the Story.
    string? name;
    # Whether or not the Story is completed.
    boolean? completed?;
    # Whether or not the Story is blocking another Story.
    boolean? blocker?;
    # The Epic ID for this Story.
    int? epic_id?;
    # The ID of the Member that requested the Story.
    string? requested_by_id?;
    # The Iteration ID the Story is in.
    int? iteration_id?;
    # An array of Labels IDs attached to the Story.
    int[]? label_ids?;
    # An array of Workflow State IDs attached to the Story.
    int? workflow_state_id?;
    # An array of Story IDs that are the object of a Story Link relationship.
    int[]? object_story_link_ids?;
    # An array of Member IDs for the followers of the Story.
    string[]? follower_ids?;
    # An array of Member IDs that are the owners of the Story.
    string[]? owner_ids?;
    # The ID of the entity referenced.
    int? id;
    # The estimate (or point value) for the Story.
    int? estimate?;
    # An array of Story IDs that are the subject of a Story Link relationship.
    int[]? subject_story_link_ids?;
    # The action of the entity referenced.
    string? action;
    # Whether or not the Story is blocked by another Story.
    boolean? blocked?;
    # The Project ID of the Story is in.
    int? project_id?;
    # The timestamp representing the Story's deadline.
    string? deadline?;
};

# Task IDs that have been added or removed from the Story.
public type StoryHistoryChangeAddsRemovesInt record {
    # The values that have been added.
    int[]? adds?;
    # The values that have been removed
    int[]? removes?;
};

public type UpdateCategory record {
    # The new name of the Category.
    string? name?;
    # The hex color to be displayed with the Category (for example, "#ff0000").
    string? color?;
    # A true/false boolean indicating if the Category has been archived.
    boolean? archived?;
};

public type UpdateTask record {
    # The Task's description.
    string? description?;
    # An array of UUIDs of the owners of this story.
    string[]? owner_ids?;
    # A true/false boolean indicating whether the task is complete.
    boolean? complete?;
    # Move task before this task ID.
    int? before_id?;
    # Move task after this task ID.
    int? after_id?;
};

public type UpdateFile record {
    # The description of the file.
    string? description?;
    # The time/date that the file was uploaded.
    string? created_at?;
    # The time/date that the file was last updated.
    string? updated_at?;
    # The name of the file.
    string? name?;
    # The unique ID assigned to the Member who uploaded the file to Shortcut.
    string? uploader_id?;
    # An additional ID that you may wish to assign to the file.
    string? external_id?;
};

public type CreateEpic record {
    # The Epic's description.
    string? description?;
    # An array of Labels attached to the Epic.
    CreateLabelParams[]? labels?;
    # A manual override for the time/date the Epic was completed.
    string? completed_at_override?;
    # The Epic's name.
    string? name;
    # The Epic's planned start date.
    string? planned_start_date?;
    # `Deprecated` The Epic's state (to do, in progress, or done); will be ignored when `epic_state_id` is set.
    string? state?;
    # The ID of the Milestone this Epic is related to.
    int? milestone_id?;
    # The ID of the member that requested the epic.
    string? requested_by_id?;
    # The ID of the Epic State.
    int? epic_state_id?;
    # A manual override for the time/date the Epic was started.
    string? started_at_override?;
    # The ID of the group to associate with the epic.
    string? group_id?;
    # Defaults to the time/date it is created but can be set to reflect another date.
    string? updated_at?;
    # An array of UUIDs for any Members you want to add as Followers on this new Epic.
    string[]? follower_ids?;
    # An array of UUIDs for any members you want to add as Owners on this new Epic.
    string[]? owner_ids?;
    # This field can be set to another unique ID. In the case that the Epic has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id?;
    # The Epic's deadline.
    string? deadline?;
    # Defaults to the time/date it is created but can be set to reflect another date.
    string? created_at?;
};

# An action representing a Story being updated.
public type HistoryActionStoryUpdate record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The action of the entity referenced.
    string? action;
    # The application URL of the Story.
    string? app_url;
    # The changes that have occurred as a result of the action.
    HistoryChangesStory? changes?;
    # The name of the Story.
    string? name;
    # The type of Story; either feature, bug, or chore.
    string? story_type;
};

# Workflow is the array of defined Workflow States. Workflow can be queried using the API but must be updated in the Shortcut UI. 
public type Workflow record {
    # A description of the workflow.
    string? description;
    # A string description of this resource.
    string? entity_type;
    # An array of IDs of projects within the Workflow.
    float[]? project_ids;
    # A map of the states in this Workflow.
    WorkflowState[]? states;
    # The name of the workflow.
    string? name;
    # The date the Workflow was updated.
    string? updated_at;
    # Indicates if an owner is automatically assigned when an unowned story is started.
    boolean? auto_assign_owner;
    # The unique ID of the Workflow.
    int? id;
    # The ID of the team the workflow belongs to.
    int? team_id;
    # The date the Workflow was created.
    string? created_at;
    # The unique ID of the default state that new Stories are entered into.
    int? default_state_id;
};

# An action representing a Task being updated.
public type HistoryActionTaskUpdate record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The action of the entity referenced.
    string? action;
    # The changes that have occurred as a result of the action.
    HistoryChangesTask? changes;
    # Whether or not the Task is complete.
    boolean? complete?;
    # The description of the Task.
    string? description;
    # The Story ID that contains the Task.
    int? story_id;
};

# The changes that have occurred as a result of the action.
public type HistoryChangesTask record {
    # True if the Story has archived, otherwise false.
    StoryHistoryChangeOldNewBool? complete?;
    # A timestamp that represents the Story's deadline.
    StoryHistoryChangeOldNewStr? description?;
    # Member IDs that have been added or removed as a owner of the Story.
    StoryHistoryChangeAddsRemovesUuid? mention_ids?;
    # Member IDs that have been added or removed as a owner of the Story.
    StoryHistoryChangeAddsRemovesUuid? owner_ids?;
};

public type UpdateComment record {
    # The updated comment text.
    string? text;
};

# EpicSlim represents the same resource as an Epic but is more light-weight, including all Epic fields except the comments array. The description string can be optionally included. Use the [Get Epic](#Get-Epic) endpoint to fetch the unabridged payload for an Epic.
public type EpicSlim record {
    # The Shortcut application url for the Epic.
    string? app_url;
    # The Epic's description.
    string? description?;
    # True/false boolean that indicates whether the Epic is archived or not.
    boolean? archived;
    # A true/false boolean indicating if the Epic has been started.
    boolean? started;
    # A string description of this resource.
    string? entity_type;
    # An array of Labels attached to the Epic.
    LabelSlim[]? labels;
    # Deprecated: use member_mention_ids.
    string[]? mention_ids;
    # An array of Member IDs that have been mentioned in the Epic description.
    string[]? member_mention_ids;
    # The IDs of Projects related to this Epic.
    int[]? project_ids;
    # The number of stories in this epic which are not associated with a project.
    int? stories_without_projects;
    # A manual override for the time/date the Epic was completed.
    string? completed_at_override;
    # The ID of the associated productboard integration.
    string? productboard_plugin_id;
    # The time/date the Epic was started.
    string? started_at;
    # The time/date the Epic was completed.
    string? completed_at;
    # The name of the Epic.
    string? name;
    # A true/false boolean indicating if the Epic has been completed.
    boolean? completed;
    # The URL of the associated productboard feature.
    string? productboard_url;
    # The Epic's planned start date.
    string? planned_start_date;
    # `Deprecated` The workflow state that the Epic is in.
    string? state;
    # The ID of the Milestone this Epic is related to.
    int? milestone_id;
    # The ID of the Member that requested the epic.
    string? requested_by_id;
    # The ID of the Epic State.
    int? epic_state_id;
    # An array of Label ids attached to the Epic.
    int[]? label_ids;
    # A manual override for the time/date the Epic was started.
    string? started_at_override;
    # Group ID
    string? group_id;
    # The time/date the Epic was updated.
    string? updated_at;
    # An array of Group IDs that have been mentioned in the Epic description.
    string[]? group_mention_ids;
    # The ID of the associated productboard feature.
    string? productboard_id;
    # An array of UUIDs for any Members you want to add as Followers on this Epic.
    string[]? follower_ids;
    # An array of UUIDs for any members you want to add as Owners on this new Epic.
    string[]? owner_ids;
    # This field can be set to another unique ID. In the case that the Epic has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id;
    # The unique ID of the Epic.
    int? id;
    # The Epic's relative position in the Epic workflow state.
    int? position;
    # The name of the associated productboard feature.
    string? productboard_name;
    # The Epic's deadline.
    string? deadline;
    # A group of calculated values for this Epic.
    EpicStats? stats;
    # The time/date the Epic was created.
    string? created_at;
};

# Projects typically map to teams (such as Frontend, Backend, Mobile, Devops, etc) but can represent any open-ended product, component, or initiative.
public type Project record {
    # The Shortcut application url for the Project.
    string? app_url;
    # The description of the Project.
    string? description;
    # True/false boolean indicating whether the Project is in an Archived state.
    boolean? archived;
    # A string description of this resource.
    string? entity_type;
    # The number of days before the thermometer appears in the Story summary.
    int? days_to_thermometer;
    # The color associated with the Project in the Shortcut member interface.
    string? color;
    # The ID of the workflow the project belongs to.
    int? workflow_id;
    # The name of the Project
    string? name;
    # The date at which the Project was started.
    string? start_time;
    # The time/date that the Project was last updated.
    string? updated_at;
    # An array of UUIDs for any Members listed as Followers.
    string[]? follower_ids;
    # This field can be set to another unique ID. In the case that the Project has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id;
    # The unique ID of the Project.
    int? id;
    # Configuration to enable or disable thermometers in the Story summary.
    boolean? show_thermometer;
    # The ID of the team the project belongs to.
    int? team_id;
    # The number of weeks per iteration in this Project.
    int? iteration_length;
    # The Project abbreviation used in Story summaries. Should be kept to 3 characters at most.
    string? abbreviation;
    # A group of calculated values for this Project.
    ProjectStats? stats;
    # The time/date that the Project was created.
    string? created_at;
};

# A container entity for the attributes this template should populate.
public type StoryContents record {
    # The description of the story.
    string? description?;
    # A string description of this resource.
    string? entity_type?;
    # An array of labels attached to the story.
    LabelSlim[]? labels?;
    # The type of story (feature, bug, chore).
    string? story_type?;
    # An array of linked files attached to the story.
    LinkedFile[]? linked_files?;
    # The name of the story.
    string? name?;
    # The ID of the epic the story belongs to.
    int? epic_id?;
    # An array of external links connected to the story.
    string[]? external_links?;
    # The ID of the iteration the story belongs to.
    int? iteration_id?;
    # An array of tasks connected to the story.
    StoryContentsTask[]? tasks?;
    # An array of label ids attached to the story.
    int[]? label_ids?;
    # The ID of the group to which the story is assigned.
    string? group_id?;
    # The ID of the workflow state the story is currently in.
    int? workflow_state_id?;
    # An array of UUIDs for any Members listed as Followers.
    string[]? follower_ids?;
    # An array of UUIDs of the owners of this story.
    string[]? owner_ids?;
    # The numeric point estimate of the story. Can also be null, which means unestimated.
    int? estimate?;
    # An array of files attached to the story.
    UploadedFile[]? files?;
    # The ID of the project the story belongs to.
    int? project_id?;
    # The due date of the story.
    string? deadline?;
};

public type GetLabelStories record {
    # A true/false boolean indicating whether to return Stories with their descriptions.
    boolean? includes_description?;
};

# An action representing a Label being updated.
public type HistoryActionLabelUpdate record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The action of the entity referenced.
    string? action;
};

# An action representing a Story Link being updated.
public type HistoryActionStoryLinkUpdate record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The action of the entity referenced.
    string? action;
    # The verb describing the link's relationship.
    string? verb;
    # The Story ID of the subject Story.
    int? subject_id;
    # The Story ID of the object Story.
    int? object_id;
    # The changes that have occurred as a result of the action.
    HistoryChangesStoryLink? changes;
};

public type GetMember record {
    # The unique ID of the Organization to limit the lookup to.
    string? 'org\-public\-id?;
};

# The estimate value for the Story
public type StoryHistoryChangeOldNewInt record {
    # The old value.
    int? old?;
    # The new value.
    int? 'new?;
};

# A Group.
public type Group record {
    # The Shortcut application url for the Group.
    string? app_url;
    # The description of the Group.
    string? description;
    # Whether or not the Group is archived.
    boolean? archived;
    # A string description of this resource.
    string? entity_type;
    # The hex color to be displayed with the Group (for example, "#ff0000").
    string? color;
    # The number of stories assigned to the group which are in a started workflow state.
    int? num_stories_started;
    # The mention name of the Group.
    string? mention_name;
    # The name of the Group.
    string? name;
    # The color key to be displayed with the Group.
    string? color_key;
    # The total number of stories assigned ot the group.
    int? num_stories;
    # The number of epics assigned to the group which are in the started workflow state.
    int? num_epics_started;
    # The id of the Group.
    string? id;
    # Icons are used to attach images to Organizations, Members, and Loading screens in the Shortcut web application.
    Icon? display_icon;
    # The Member IDs contain within the Group.
    string[]? member_ids;
    # The Workflow IDs which have stories assigned to the group.
    int[]? story_workflow_ids;
    # The Workflow IDs contained within the Group.
    int[]? workflow_ids;
};

# The Member ID of the preson who requested the Story.
public type StoryHistoryChangeOldNewUuid record {
    # The old value.
    string? old?;
    # The new value.
    string? 'new?;
};

# A reference to a Story.
public type HistoryReferenceStory record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The application URL of the Story.
    string? app_url;
    # The name of the entity referenced.
    string? name;
    # If the referenced entity is a Story, either "bug", "chore", or "feature".
    string? story_type;
};

# A reference to an Iteration.
public type HistoryReferenceIteration record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The application URL of the Iteration.
    string? app_url;
    # The name of the entity referenced.
    string? name;
};

public type ListGroupStories record {
    # The maximum number of results to return. (Defaults to 1000, max 1000)
    int? 'limit?;
    # The offset at which to begin returning results. (Defaults to 0)
    int? offset?;
};

# A default reference for entity types that don't have extra fields.
public type HistoryReferenceGeneral record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The name of the entity referenced.
    string? name;
};

public type CreateProject record {
    # The Project description.
    string? description?;
    # The color you wish to use for the Project in the system.
    string? color?;
    # The name of the Project.
    string? name;
    # The date at which the Project was started.
    string? start_time?;
    # Defaults to the time/date it is created but can be set to reflect another date.
    string? updated_at?;
    # An array of UUIDs for any members you want to add as Owners on this new Epic.
    string[]? follower_ids?;
    # This field can be set to another unique ID. In the case that the Project has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id?;
    # The ID of the team the project belongs to.
    int? team_id;
    # The number of weeks per iteration in this Project.
    int? iteration_length?;
    # The Project abbreviation used in Story summaries. Should be kept to 3 characters at most.
    string? abbreviation?;
    # Defaults to the time/date it is created but can be set to reflect another date.
    string? created_at?;
};

# Emoji reaction on a comment.
public type StoryReaction record {
    # Emoji text of the reaction.
    string? emoji;
    # Permissions who have reacted with this.
    string[]? permission_ids;
};

# A group of Member profile details.
public type Profile record {
    # A string description of this resource.
    string? entity_type;
    # A true/false boolean indicating whether the Member has been deactivated within Shortcut.
    boolean? deactivated;
    # If Two Factor Authentication is activated for this User.
    boolean? two_factor_auth_activated?;
    # The Member's username within the Organization.
    string? mention_name;
    # The Member's name within the Organization.
    string? name;
    # This is the gravatar hash associated with email_address.
    string? gravatar_hash;
    # The unique identifier of the profile.
    string? id;
    # Icons are used to attach images to Organizations, Members, and Loading screens in the Shortcut web application.
    Icon? display_icon;
    # The primary email address of the Member with the Organization.
    string? email_address;
};

# IterationSlim represents the same resource as an Iteration, but is more light-weight. Use the [Get Iteration](#Get-Iteration) endpoint to fetch the unabridged payload for an Iteration. 
public type IterationSlim record {
    # The Shortcut application url for the Iteration.
    string? app_url;
    # A string description of this resource
    string? entity_type;
    # An array of labels attached to the iteration.
    Label[]? labels;
    # Deprecated: use member_mention_ids.
    string[]? mention_ids;
    # An array of Member IDs that have been mentioned in the Story description.
    string[]? member_mention_ids;
    # The name of the iteration.
    string? name;
    # An array of label ids attached to the iteration.
    int[]? label_ids;
    # The instant when this iteration was last updated.
    string? updated_at;
    # An array of Group IDs that have been mentioned in the Story description.
    string[]? group_mention_ids;
    # The date this iteration begins.
    string? end_date;
    # An array of UUIDs for any Members listed as Followers.
    string[]? follower_ids;
    # An array of UUIDs for any Groups you want to add as Followers. Currently, only one Group association is presented in our web UI.
    string[]? group_ids;
    # The date this iteration begins.
    string? start_date;
    # The status of the iteration. Values are either "unstarted", "started", or "done".
    string? status;
    # The ID of the iteration.
    int? id;
    # A group of calculated values for this Iteration.
    IterationStats? stats;
    # The instant when this iteration was created.
    string? created_at;
};

public type MemberInfo record {
    string? id;
    string? name;
    string? mention_name;
    BasicWorkspaceInfo? workspace2;
};

# Request paramaters for creating an entirely new entity template.
public type CreateEntityTemplate record {
    # The name of the new entity template
    string? name;
    # The id of the user creating this template.
    string? author_id?;
    # A map of story attributes this template populates.
    CreateStoryContents? story_contents;
};

public type StoryContentsTask record {
    # Full text of the Task.
    string? description;
    # The number corresponding to the Task's position within a list of Tasks on a Story.
    int? position?;
    # True/false boolean indicating whether the Task has been completed.
    boolean? complete?;
    # An array of UUIDs of the Owners of this Task.
    string[]? owner_ids?;
    # This field can be set to another unique ID. In the case that the Task has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id?;
};

# A group of calculated values for this Epic.
public type EpicStats record {
    # The total number of completed points in this Epic.
    int? num_points_done;
    # The total number of documents associated with this Epic.
    int? num_related_documents;
    # The average cycle time (in seconds) of completed stories in this Epic.
    int? average_cycle_time?;
    # The total number of unstarted Stories in this Epic.
    int? num_stories_unstarted;
    # The total number of Stories in this Epic.
    int? num_stories_total;
    # The date of the last update of a Story in this Epic.
    string? last_story_update;
    # The total number of started points in this Epic.
    int? num_points_started;
    # The total number of unstarted points in this Epic.
    int? num_points_unstarted;
    # The total number of started Stories in this Epic.
    int? num_stories_started;
    # The total number of Stories with no point estimate.
    int? num_stories_unestimated;
    # The average lead time (in seconds) of completed stories in this Epic.
    int? average_lead_time?;
    # The total number of points in this Epic.
    int? num_points;
    # The total number of done Stories in this Epic.
    int? num_stories_done;
};

public type CreateIteration record {
    # An array of UUIDs for any Members you want to add as Followers.
    string[]? follower_ids?;
    # An array of UUIDs for any Groups you want to add as Followers. Currently, only one Group association is presented in our web UI.
    string[]? group_ids?;
    # An array of Labels attached to the Iteration.
    CreateLabelParams[]? labels?;
    # The description of the Iteration.
    string? description?;
    # The name of this Iteration.
    string? name;
    # The date this Iteration begins, e.g. 2019-07-01.
    string? start_date;
    # The date this Iteration ends, e.g. 2019-07-01.
    string? end_date;
};

# An action representing a Task being deleted.
public type HistoryActionTaskDelete record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The action of the entity referenced.
    string? action;
    # The description of the Task being deleted.
    string? description;
};

# An action representing a Story Comment being created.
public type HistoryActionStoryCommentCreate record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The action of the entity referenced.
    string? action;
    # The application URL of the Story Comment.
    string? app_url;
    # The text of the Story Comment.
    string? text;
    # The Member ID of who created the Story Comment.
    string? author_id;
};

# Comments associated with Epic Discussions.
public type ThreadedComment record {
    # The Shortcut application url for the Comment.
    string? app_url;
    # A string description of this resource.
    string? entity_type;
    # True/false boolean indicating whether the Comment is deleted.
    boolean? deleted;
    # Deprecated: use member_mention_ids.
    string[]? mention_ids;
    # The unique ID of the Member that authored the Comment.
    string? author_id;
    # An array of Member IDs that have been mentioned in this Comment.
    string[]? member_mention_ids;
    # A nested array of threaded comments.
    ThreadedComment[]? comments;
    # The time/date the Comment was updated.
    string? updated_at;
    # An array of Group IDs that have been mentioned in this Comment.
    string[]? group_mention_ids;
    # This field can be set to another unique ID. In the case that the Comment has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id;
    # The unique ID of the Comment.
    int? id;
    # The time/date the Comment was created.
    string? created_at;
    # The text of the Comment.
    string? text;
};

public type CreateGroup record {
    # The description of the Group.
    string? description?;
    # The Member ids to add to this Group.
    string[]? member_ids?;
    # The Workflow ids to add to the Group.
    int[]? workflow_ids?;
    # The name of this Group.
    string? name;
    # The mention name of this Group.
    string? mention_name;
    # The color you wish to use for the Group in the system.
    string? color?;
    # The color key you wish to use for the Group in the system.
    string? color_key?;
    # The Icon id for the avatar of this Group.
    string? display_icon_id?;
};

# A reference to an Epic.
public type HistoryReferenceEpic record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The application URL of the Epic.
    string? app_url;
    # The name of the entity referenced.
    string? name;
};

public type CreateStoryComment record {
    # The comment text.
    string? text;
    # The Member ID of the Comment's author. Defaults to the user identified by the API token.
    string? author_id?;
    # Defaults to the time/date the comment is created, but can be set to reflect another date.
    string? created_at?;
    # Defaults to the time/date the comment is last updated, but can be set to reflect another date.
    string? updated_at?;
    # This field can be set to another unique ID. In the case that the comment has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id?;
};

# An action representing a Story Link being deleted.
public type HistoryActionStoryLinkDelete record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The action of the entity referenced.
    string? action;
    # The verb describing the link's relationship.
    string? verb;
    # The Story ID of the subject Story.
    int? subject_id;
    # The Story ID of the object Story.
    int? object_id;
};

# Repository refers to a VCS repository.
public type Repository record {
    # A string description of this resource.
    string? entity_type;
    # The shorthand name of the VCS repository.
    string? name;
    # The type of Repository. Currently this can only be "github".
    string? 'type;
    # The time/date the Repository was updated.
    string? updated_at;
    # The VCS unique identifier for the Repository.
    string? external_id;
    # The ID associated to the VCS repository in Shortcut.
    int? id;
    # The URL of the Repository.
    string? url;
    # The full name of the VCS repository.
    string? full_name;
    # The time/date the Repository was created.
    string? created_at;
};

public type CreateMilestone record {
    # The name of the Milestone.
    string? name;
    # The Milestone's description.
    string? description?;
    # The workflow state that the Milestone is in.
    string? state?;
    # A manual override for the time/date the Milestone was started.
    string? started_at_override?;
    # A manual override for the time/date the Milestone was completed.
    string? completed_at_override?;
    # An array of IDs of Categories attached to the Milestone.
    CreateCategoryParams[]? categories?;
};

public type UpdateMilestone record {
    # The Milestone's description.
    string? description?;
    # A manual override for the time/date the Milestone was completed.
    string? completed_at_override?;
    # The name of the Milestone.
    string? name?;
    # The workflow state that the Milestone is in.
    string? state?;
    # A manual override for the time/date the Milestone was started.
    string? started_at_override?;
    # An array of IDs of Categories attached to the Milestone.
    CreateCategoryParams[]? categories?;
    # The ID of the Milestone we want to move this Milestone before.
    int? before_id?;
    # The ID of the Milestone we want to move this Milestone after.
    int? after_id?;
};

# Epic State is any of the at least 3 columns. Epic States correspond to one of 3 types: Unstarted, Started, or Done.
public type EpicState record {
    # The description of what sort of Epics belong in that Epic State.
    string? description;
    # A string description of this resource.
    string? entity_type;
    # The hex color for this Epic State.
    string? color?;
    # The Epic State's name.
    string? name;
    # The type of Epic State (Unstarted, Started, or Done)
    string? 'type;
    # When the Epic State was last updated.
    string? updated_at;
    # The unique ID of the Epic State.
    int? id;
    # The position that the Epic State is in, starting with 0 at the left.
    int? position;
    # The time/date the Epic State was created.
    string? created_at;
};

# Epic Workflow is the array of defined Epic States. Epic Workflow can be queried using the API but must be updated in the Shortcut UI. 
public type EpicWorkflow record {
    # A string description of this resource.
    string? entity_type;
    # The unique ID of the Epic Workflow.
    int? id;
    # The date the Epic Workflow was created.
    string? created_at;
    # The date the Epic Workflow was updated.
    string? updated_at;
    # The unique ID of the default Epic State that new Epics are assigned by default.
    int? default_epic_state_id;
    # A map of the Epic States in this Epic Workflow.
    EpicState[]? epic_states;
};

public type CreateCategory record {
    # The name of the new Category.
    string? name;
    # The hex color to be displayed with the Category (for example, "#ff0000").
    string? color?;
    # This field can be set to another unique ID. In the case that the Category has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id?;
    # The type of entity this Category is associated with; currently Milestone is the only type of Category.
    string? 'type;
};

# An action representing a Label being deleted.
public type HistoryActionLabelDelete record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The action of the entity referenced.
    string? action;
    # The name of the Label.
    string? name;
};

# A group of calculated values for this Milestone.
public type MilestoneStats record {
    # The average cycle time (in seconds) of completed stories in this Milestone.
    int? average_cycle_time?;
    # The average lead time (in seconds) of completed stories in this Milestone.
    int? average_lead_time?;
    # The number of related documents tp this Milestone.
    int? num_related_documents;
};

# Linked files are stored on a third-party website and linked to one or more Stories. Shortcut currently supports linking files from Google Drive, Dropbox, Box, and by URL.
public type LinkedFile record {
    # The description of the file.
    string? description;
    # A string description of this resource.
    string? entity_type;
    # The IDs of the stories this file is attached to.
    int[]? story_ids;
    # Deprecated: use member_mention_ids.
    string[]? mention_ids;
    # The members that are mentioned in the description of the file.
    string[]? member_mention_ids;
    # The name of the linked file.
    string? name;
    # The URL of the file thumbnail, if the integration provided it.
    string? thumbnail_url;
    # The integration type (e.g. google, dropbox, box).
    string? 'type;
    # The filesize, if the integration provided it.
    int? size;
    # The UUID of the member that uploaded the file.
    string? uploader_id;
    # The content type of the image (e.g. txt/plain).
    string? content_type;
    # The time/date the LinkedFile was updated.
    string? updated_at;
    # The groups that are mentioned in the description of the file.
    string[]? group_mention_ids;
    # The unique identifier for the file.
    int? id;
    # The URL of the file.
    string? url;
    # The time/date the LinkedFile was created.
    string? created_at;
};

public type Task record {
    # Full text of the Task.
    string? description;
    # A string description of this resource.
    string? entity_type;
    # The unique identifier of the parent Story.
    int? story_id;
    # Deprecated: use member_mention_ids.
    string[]? mention_ids;
    # An array of UUIDs of Members mentioned in this Task.
    string[]? member_mention_ids;
    # The time/date the Task was completed.
    string? completed_at;
    # The time/date the Task was updated.
    string? updated_at;
    # An array of UUIDs of Groups mentioned in this Task.
    string[]? group_mention_ids;
    # An array of UUIDs of the Owners of this Task.
    string[]? owner_ids;
    # This field can be set to another unique ID. In the case that the Task has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id;
    # The unique ID of the Task.
    int? id;
    # The number corresponding to the Task's position within a list of Tasks on a Story.
    int? position;
    # True/false boolean indicating whether the Task has been completed.
    boolean? complete;
    # The time/date the Task was created.
    string? created_at;
};

public type UnusableEntitlementError record {
    # The tag for violating an entitlement action.
    string? reason_tag;
    # Short tag describing the unusable entitlement action taken by the user.
    string? entitlement_tag;
    # Message displayed to the user on why their action failed.
    string? message;
};

public type UpdateIteration record {
    # An array of UUIDs for any Members you want to add as Followers.
    string[]? follower_ids?;
    # An array of UUIDs for any Groups you want to add as Followers. Currently, only one Group association is presented in our web UI.
    string[]? group_ids?;
    # An array of Labels attached to the Iteration.
    CreateLabelParams[]? labels?;
    # The description of the Iteration.
    string? description?;
    # The name of this Iteration
    string? name?;
    # The date this Iteration begins, e.g. 2019-07-01
    string? start_date?;
    # The date this Iteration ends, e.g. 2019-07-05.
    string? end_date?;
};

# An entity template can be used to prefill various fields when creating new stories.
public type EntityTemplate record {
    # A string description of this resource.
    string? entity_type;
    # The unique identifier for the entity template.
    string? id;
    # The time/date when the entity template was created.
    string? created_at;
    # The time/date when the entity template was last updated.
    string? updated_at;
    # The template's name.
    string? name;
    # The unique ID of the member who created the template.
    string? author_id;
    # The last time that someone created an entity using this template.
    string? last_used_at;
    # A container entity for the attributes this template should populate.
    StoryContents? story_contents;
};

# A Label can be used to associate and filter Stories and Epics, and also create new Workspaces.
public type Label record {
    # The Shortcut application url for the Label.
    string? app_url;
    # The description of the Label.
    string? description;
    # A true/false boolean indicating if the Label has been archived.
    boolean? archived;
    # A string description of this resource.
    string? entity_type;
    # The hex color to be displayed with the Label (for example, "#ff0000").
    string? color;
    # The name of the Label.
    string? name;
    # The time/date that the Label was updated.
    string? updated_at;
    # This field can be set to another unique ID. In the case that the Label has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id;
    # The unique ID of the Label.
    int? id;
    # A group of calculated values for this Label. This is not included if the slim? flag is set to true for the List Labels endpoint.
    LabelStats? stats?;
    # The time/date that the Label was created.
    string? created_at;
};

# True if the Story has archived, otherwise false.
public type StoryHistoryChangeOldNewBool record {
    # The old value.
    boolean? old?;
    # The new value.
    boolean? 'new?;
};

# The results of the multi-entity search query.
public type SearchResults record {
    # The results of the Epic search query.
    EpicSearchResults? epics;
    # The results of the Story search query.
    StorySearchResults? stories;
};

# A map of story attributes this template populates.
public type CreateStoryContents record {
    # The description of the story.
    string? description?;
    # A string description of this resource.
    string? entity_type?;
    # An array of labels to be populated by the template.
    CreateLabelParams[]? labels?;
    # The type of story (feature, bug, chore).
    string? story_type?;
    # An array of linked files attached to the story.
    LinkedFile[]? linked_files?;
    # An array of the attached file IDs to be populated.
    int[]? file_ids?;
    # The name of the story.
    string? name?;
    # The ID of the epic the to be populated.
    int? epic_id?;
    # An array of external links to be populated.
    string[]? external_links?;
    # The ID of the iteration the to be populated.
    int? iteration_id?;
    # An array of tasks to be populated by the template.
    EntityTemplateTask[]? tasks?;
    # An array of label ids attached to the story.
    int[]? label_ids?;
    # The ID of the group to be populated.
    string? group_id?;
    # The ID of the workflow state the story is currently in.
    int? workflow_state_id?;
    # An array of UUIDs for any Members listed as Followers.
    string[]? follower_ids?;
    # An array of UUIDs of the owners of this story.
    string[]? owner_ids?;
    # The numeric point estimate to be populated.
    int? estimate?;
    # An array of files attached to the story.
    UploadedFile[]? files?;
    # The ID of the project the story belongs to.
    int? project_id?;
    # An array of the linked file IDs to be populated.
    int[]? linked_file_ids?;
    # The due date of the story.
    string? deadline?;
};

# An action representing a Project being updated.
public type HistoryActionProjectUpdate record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The action of the entity referenced.
    string? action;
    # The application URL of the Project.
    string? app_url;
    # The name of the Project.
    string? name;
};

# The changes that have occurred as a result of the action.
public type HistoryChangesStory record {
    # A timestamp that represents the Story's deadline.
    StoryHistoryChangeOldNewStr? description?;
    # True if the Story has archived, otherwise false.
    StoryHistoryChangeOldNewBool? archived?;
    # True if the Story has archived, otherwise false.
    StoryHistoryChangeOldNewBool? started?;
    # Task IDs that have been added or removed from the Story.
    StoryHistoryChangeAddsRemovesInt? task_ids?;
    # Member IDs that have been added or removed as a owner of the Story.
    StoryHistoryChangeAddsRemovesUuid? mention_ids?;
    # A timestamp that represents the Story's deadline.
    StoryHistoryChangeOldNewStr? story_type?;
    # A timestamp that represents the Story's deadline.
    StoryHistoryChangeOldNewStr? name?;
    # True if the Story has archived, otherwise false.
    StoryHistoryChangeOldNewBool? completed?;
    # True if the Story has archived, otherwise false.
    StoryHistoryChangeOldNewBool? blocker?;
    # The estimate value for the Story
    StoryHistoryChangeOldNewInt? epic_id?;
    # Task IDs that have been added or removed from the Story.
    StoryHistoryChangeAddsRemovesInt? branch_ids?;
    # Task IDs that have been added or removed from the Story.
    StoryHistoryChangeAddsRemovesInt? commit_ids?;
    # The Member ID of the preson who requested the Story.
    StoryHistoryChangeOldNewUuid? requested_by_id?;
    # The estimate value for the Story
    StoryHistoryChangeOldNewInt? iteration_id?;
    # Task IDs that have been added or removed from the Story.
    StoryHistoryChangeAddsRemovesInt? label_ids?;
    # The estimate value for the Story
    StoryHistoryChangeOldNewInt? workflow_state_id?;
    # Task IDs that have been added or removed from the Story.
    StoryHistoryChangeAddsRemovesInt? object_story_link_ids?;
    # Member IDs that have been added or removed as a owner of the Story.
    StoryHistoryChangeAddsRemovesUuid? follower_ids?;
    # Member IDs that have been added or removed as a owner of the Story.
    StoryHistoryChangeAddsRemovesUuid? owner_ids?;
    # The estimate value for the Story
    StoryHistoryChangeOldNewInt? estimate?;
    # Task IDs that have been added or removed from the Story.
    StoryHistoryChangeAddsRemovesInt? subject_story_link_ids?;
    # True if the Story has archived, otherwise false.
    StoryHistoryChangeOldNewBool? blocked?;
    # The estimate value for the Story
    StoryHistoryChangeOldNewInt? project_id?;
    # A timestamp that represents the Story's deadline.
    StoryHistoryChangeOldNewStr? deadline?;
};

# Request parameters for creating a Story Link within a Story.
public type CreateStoryLinkParams record {
    # The unique ID of the Story defined as subject.
    int? subject_id?;
    # How the subject Story acts on the object Story. This can be "blocks", "duplicates", or "relates to".
    string? verb;
    # The unique ID of the Story defined as object.
    int? object_id?;
};

public type Search record {
    # See our help center article on [search operators](https://help.shortcut.com/hc/en-us/articles/360000046646-Search-Operators)
    string? query;
    # The number of search results to include in a page. Minimum of 1 and maximum of 25.
    int? page_size?;
    # The next page token.
    string? next?;
    string? include?;
};

# A reference to a Group.
public type HistoryReferenceGroup record {
    # The ID of the entity referenced.
    string? id;
    # The type of entity referenced.
    string? entity_type;
    # The name of the entity referenced.
    string? name;
};

# Request parameters for changing either a template's name or any of
#   the attributes it is designed to pre-populate.
public type UpdateEntityTemplate record {
    # The updated template name.
    string? name?;
    # Updated attributes for the template to populate.
    UpdateStoryContents? story_contents?;
};

# An action representing a VCS Branch being pushed.
public type HistoryActionBranchPush record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The name of the VCS Branch that was pushed
    string? name;
    # The URL from the provider of the VCS Branch that was pushed
    string? url;
    # The action of the entity referenced.
    string? action;
};

public type CreateEpicComment record {
    # The comment text.
    string? text;
    # The Member ID of the Comment's author. Defaults to the user identified by the API token.
    string? author_id?;
    # Defaults to the time/date the comment is created, but can be set to reflect another date.
    string? created_at?;
    # Defaults to the time/date the comment is last updated, but can be set to reflect another date.
    string? updated_at?;
    # This field can be set to another unique ID. In the case that the comment has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id?;
};

# Request parameters for creating a Task on a Story.
public type CreateTaskParams record {
    # The Task description.
    string? description;
    # True/false boolean indicating whether the Task is completed. Defaults to false.
    boolean? complete?;
    # An array of UUIDs for any members you want to add as Owners on this new Task.
    string[]? owner_ids?;
    # Defaults to the time/date the Task is created but can be set to reflect another creation time/date.
    string? created_at?;
    # Defaults to the time/date the Task is created in Shortcut but can be set to reflect another time/date.
    string? updated_at?;
    # This field can be set to another unique ID. In the case that the Task has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id?;
};

# Details about individual Shortcut user within the Shortcut organization that has issued the token.
public type Member record {
    # The Member's role in the Shortcut organization.
    string? role;
    # A string description of this resource.
    string? entity_type;
    # True/false boolean indicating whether the Member has been disabled within this Organization.
    boolean? disabled;
    # The user state, one of partial, full, disabled, or imported.  A partial
    #            user is disabled, has no means to log in, and is not an import user.  A full
    #            user is enabled and has a means to log in.  A disabled user is disabled and has
    #            a means to log in.  An import user is disabled, has no means to log in, and is
    #            marked as an import user.
    string? state;
    # The time/date the Member was last updated.
    string? updated_at;
    # Whether this member was created as a placeholder entity.
    boolean? created_without_invite;
    # The Member's group ids
    string[]? group_ids;
    # The Member's ID in Shortcut.
    string? id;
    # A group of Member profile details.
    Profile? profile;
    # The time/date the Member was created.
    string? created_at;
    # The id of the member that replaces this one when merged.
    string? replaced_by?;
};

public type CreateStories record {
    # An array of stories to be created.
    CreateStoryParams[]? stories;
};

# Request parameters for creating a story.
public type CreateStoryParams record {
    # The description of the story.
    string? description?;
    # Controls the story's archived state.
    boolean? archived?;
    # An array of story links attached to the story.
    CreateStoryLinkParams[]? story_links?;
    # An array of labels attached to the story.
    CreateLabelParams[]? labels?;
    # The type of story (feature, bug, chore).
    string? story_type?;
    # An array of IDs of files attached to the story.
    int[]? file_ids?;
    # A manual override for the time/date the Story was completed.
    string? completed_at_override?;
    # The name of the story.
    string? name;
    # An array of comments to add to the story.
    CreateStoryCommentParams[]? comments?;
    # The ID of the epic the story belongs to.
    int? epic_id?;
    # The id of the story template used to create this story, if applicable.
    string? story_template_id?;
    # An array of External Links associated with this story.
    string[]? external_links?;
    # The ID of the member that requested the story.
    string? requested_by_id?;
    # The ID of the iteration the story belongs to.
    int? iteration_id?;
    # An array of tasks connected to the story.
    CreateTaskParams[]? tasks?;
    # A manual override for the time/date the Story was started.
    string? started_at_override?;
    # The id of the group to associate with this story.
    string? group_id?;
    # The ID of the workflow state the story will be in.
    int? workflow_state_id?;
    # The time/date the Story was updated.
    string? updated_at?;
    # An array of UUIDs of the followers of this story.
    string[]? follower_ids?;
    # An array of UUIDs of the owners of this story.
    string[]? owner_ids?;
    # This field can be set to another unique ID. In the case that the Story has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id?;
    # The numeric point estimate of the story. Can also be null, which means unestimated.
    int? estimate?;
    # The ID of the project the story belongs to.
    int? project_id?;
    # An array of IDs of linked files attached to the story.
    int[]? linked_file_ids?;
    # The due date of the story.
    string? deadline?;
    # The time/date the Story was created.
    string? created_at?;
};

# A Milestone is a collection of Epics that represent a release or some other large initiative that your organization is working on.
public type Milestone record {
    # The Shortcut application url for the Milestone.
    string? app_url;
    # The Milestone's description.
    string? description;
    # A true/false boolean indicating if the Milestone has been started.
    boolean? started;
    # A string description of this resource.
    string? entity_type;
    # A manual override for the time/date the Milestone was completed.
    string? completed_at_override;
    # The time/date the Milestone was started.
    string? started_at;
    # The time/date the Milestone was completed.
    string? completed_at;
    # The name of the Milestone.
    string? name;
    # A true/false boolean indicating if the Milestone has been completed.
    boolean? completed;
    # The workflow state that the Milestone is in.
    string? state;
    # A manual override for the time/date the Milestone was started.
    string? started_at_override;
    # The time/date the Milestone was updated.
    string? updated_at;
    # An array of Categories attached to the Milestone.
    Category[]? categories;
    # The unique ID of the Milestone.
    int? id;
    # A number representing the position of the Milestone in relation to every other Milestone within the Organization.
    int? position;
    # A group of calculated values for this Milestone.
    MilestoneStats? stats?;
    # The time/date the Milestone was created.
    string? created_at;
};

public type UpdateEpic record {
    # The Epic's description.
    string? description?;
    # A true/false boolean indicating whether the Epic is in archived state.
    boolean? archived?;
    # An array of Labels attached to the Epic.
    CreateLabelParams[]? labels?;
    # A manual override for the time/date the Epic was completed.
    string? completed_at_override?;
    # The Epic's name.
    string? name?;
    # The Epic's planned start date.
    string? planned_start_date?;
    # `Deprecated` The Epic's state (to do, in progress, or done); will be ignored when `epic_state_id` is set.
    string? state?;
    # The ID of the Milestone this Epic is related to.
    int? milestone_id?;
    # The ID of the member that requested the epic.
    string? requested_by_id?;
    # The ID of the Epic State.
    int? epic_state_id?;
    # A manual override for the time/date the Epic was started.
    string? started_at_override?;
    # The ID of the group to associate with the epic.
    string? group_id?;
    # An array of UUIDs for any Members you want to add as Followers on this Epic.
    string[]? follower_ids?;
    # An array of UUIDs for any members you want to add as Owners on this Epic.
    string[]? owner_ids?;
    # The ID of the Epic we want to move this Epic before.
    int? before_id?;
    # The ID of the Epic we want to move this Epic after.
    int? after_id?;
    # The Epic's deadline.
    string? deadline?;
};

# A reference to an Project.
public type HistoryReferenceProject record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The application URL of the Project.
    string? app_url;
    # The name of the entity referenced.
    string? name;
};

public type SearchStories record {
    # A true/false boolean indicating whether the Story is in archived state.
    boolean? archived?;
    # An array of UUIDs for any Users who may be Owners of the Stories.
    string? owner_id?;
    # The type of Stories that you want returned.
    string? story_type?;
    # The Epic IDs that may be associated with the Stories.
    int[]? epic_ids?;
    # The IDs for the Projects the Stories may be assigned to.
    int[]? project_ids?;
    # Stories should have been updated before this date.
    string? updated_at_end?;
    # Stories should have been completed before this date.
    string? completed_at_end?;
    # The type of Workflow State the Stories may be in.
    string[]? workflow_state_types?;
    # Stories should have a deadline before this date.
    string? deadline_end?;
    # Stories should have been created after this date.
    string? created_at_start?;
    # The Epic IDs that may be associated with the Stories.
    int? epic_id?;
    # The name of any associated Labels.
    string? label_name?;
    # The UUID of any Users who may have requested the Stories.
    string? requested_by_id?;
    # The Iteration ID that may be associated with the Stories.
    int? iteration_id?;
    # The Label IDs that may be associated with the Stories.
    int[]? label_ids?;
    # The Group ID that is associated with the Stories
    string? group_id?;
    # The unique IDs of the specific Workflow States that the Stories should be in.
    int? workflow_state_id?;
    # The Iteration IDs that may be associated with the Stories.
    int[]? iteration_ids?;
    # Stories should have been created before this date.
    string? created_at_end?;
    # Stories should have a deadline after this date.
    string? deadline_start?;
    # The Group IDs that are associated with the Stories
    string[]? group_ids?;
    # An array of UUIDs for any Users who may be Owners of the Stories.
    string[]? owner_ids?;
    # An ID or URL that references an external resource. Useful during imports.
    string? external_id?;
    # Whether to include the story description in the response.
    boolean? includes_description?;
    # The number of estimate points associate with the Stories.
    int? estimate?;
    # The IDs for the Projects the Stories may be assigned to.
    int? project_id?;
    # Stories should have been competed after this date.
    string? completed_at_start?;
    # Stories should have been updated after this date.
    string? updated_at_start?;
};

public type UpdateLabel record {
    # The new name of the label.
    string? name?;
    # The new description of the label.
    string? description?;
    # The hex color to be displayed with the Label (for example, "#ff0000").
    string? color?;
    # A true/false boolean indicating if the Label has been archived.
    boolean? archived?;
};

# A reference to a Story Task.
public type HistoryReferenceStoryTask record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The description of the Story Task.
    string? description;
};

public type CreateTask record {
    # The Task description.
    string? description;
    # True/false boolean indicating whether the Task is completed. Defaults to false.
    boolean? complete?;
    # An array of UUIDs for any members you want to add as Owners on this new Task.
    string[]? owner_ids?;
    # Defaults to the time/date the Task is created but can be set to reflect another creation time/date.
    string? created_at?;
    # Defaults to the time/date the Task is created in Shortcut but can be set to reflect another time/date.
    string? updated_at?;
    # This field can be set to another unique ID. In the case that the Task has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id?;
};

# Request parameters for specifying how to pre-populate a task through a template.
public type EntityTemplateTask record {
    # The Task description.
    string? description;
    # True/false boolean indicating whether the Task is completed. Defaults to false.
    boolean? complete?;
    # An array of UUIDs for any members you want to add as Owners on this new Task.
    string[]? owner_ids?;
    # This field can be set to another unique ID. In the case that the Task has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id?;
};

# Request parameters for creating a Label on a Shortcut Story.
public type CreateLabelParams record {
    # The name of the new Label.
    string? name;
    # The description of the new Label.
    string? description?;
    # The hex color to be displayed with the Label (for example, "#ff0000").
    string? color?;
    # This field can be set to another unique ID. In the case that the Label has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id?;
};

# A reference to an Label.
public type HistoryReferenceLabel record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The application URL of the Label.
    string? app_url;
    # The name of the entity referenced.
    string? name;
};

# Corresponds to a VCS Label associated with a Pull Request.
public type PullRequestLabel record {
    # A string description of this resource.
    string? entity_type;
    # The unique ID of the VCS Label.
    int? id;
    # The color of the VCS label.
    string? color;
    # The description of the VCS label.
    string? description?;
    # The name of the VCS label.
    string? name;
};

public type UpdateLinkedFile record {
    # The description of the file.
    string? description?;
    # The ID of the linked story.
    int? story_id?;
    # The name of the file.
    string? name?;
    # The URL of the thumbnail, if the integration provided it.
    string? thumbnail_url?;
    # The integration type of the file (e.g. google, dropbox, box).
    string? 'type?;
    # The filesize, if the integration provided it.
    int? size?;
    # The UUID of the member that uploaded the file.
    string? uploader_id?;
    # The URL of linked file.
    string? url?;
};

# Icons are used to attach images to Organizations, Members, and Loading screens in the Shortcut web application.
public type Icon record {
    # A string description of this resource.
    string? entity_type;
    # The unique ID of the Icon.
    string? id;
    # The time/date that the Icon was created.
    string? created_at;
    # The time/date that the Icon was updated.
    string? updated_at;
    # The URL of the Icon.
    string? url;
};

# A reference to a VCS Commit.
public type HistoryReferenceCommit record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The message from the Commit.
    string? message;
    # The external URL for the Branch.
    string? url;
};

# An action representing a VCS Branch being created.
public type HistoryActionBranchCreate record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The name of the VCS Branch that was pushed
    string? name;
    # The URL from the provider of the VCS Branch that was pushed
    string? url;
    # The action of the entity referenced.
    string? action;
};

# Error returned when total maximum supported results have been reached.
public type MaxSearchResultsExceededError record {
    # The name for this type of error, `maximum-results-exceeded`
    string? _error;
    # An explanatory message: "A maximum of 1000 search results are supported."
    string? message;
    # The maximum number of search results supported, `1000`
    int? 'maximum\-results;
};

# A Category can be used to associate Milestones.
public type Category record {
    # A true/false boolean indicating if the Category has been archived.
    boolean? archived;
    # A string description of this resource.
    string? entity_type;
    # The hex color to be displayed with the Category (for example, "#ff0000").
    string? color;
    # The name of the Category.
    string? name;
    # The type of entity this Category is associated with; currently Milestone is the only type of Category.
    string? 'type;
    # The time/date that the Category was updated.
    string? updated_at;
    # This field can be set to another unique ID. In the case that the Category has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id;
    # The unique ID of the Category.
    int? id;
    # The time/date that the Category was created.
    string? created_at;
};

# Member IDs that have been added or removed as a owner of the Story.
public type StoryHistoryChangeAddsRemovesUuid record {
    # The values that have been added.
    string[]? adds?;
    # The values that have been removed
    string[]? removes?;
};

# The results of the Story search query.
public type StorySearchResults record {
    # The total number of matches for the search query. The first 1000 matches can be paged through via the API.
    int? total;
    # A list of search results.
    Story[]? data;
    # The URL path and query string for the next page of search results.
    string? next;
    # Cursors
    string[]? cursors?;
};

public type CreateCommentComment record {
    # The comment text.
    string? text;
    # The Member ID of the Comment's author. Defaults to the user identified by the API token.
    string? author_id?;
    # Defaults to the time/date the comment is created, but can be set to reflect another date.
    string? created_at?;
    # Defaults to the time/date the comment is last updated, but can be set to reflect another date.
    string? updated_at?;
    # This field can be set to another unique ID. In the case that the comment has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id?;
};

# An action representing various operations for a Pull Request.
public type HistoryActionPullRequest record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The action of the entity referenced.
    string? action;
    # The VCS Repository-specific ID for the Pull Request.
    int? number;
    # The title of the Pull Request.
    string? title;
    # The URL from the provider of the VCS Pull Request.
    string? url;
};

# An Iteration is a defined, time-boxed period of development for a collection of Stories. See https://help.shortcut.com/hc/en-us/articles/360028953452-Iterations-Overview for more information.
public type Iteration record {
    # The Shortcut application url for the Iteration.
    string? app_url;
    # The description of the iteration.
    string? description;
    # A string description of this resource
    string? entity_type;
    # An array of labels attached to the iteration.
    Label[]? labels;
    # Deprecated: use member_mention_ids.
    string[]? mention_ids;
    # An array of Member IDs that have been mentioned in the Story description.
    string[]? member_mention_ids;
    # The name of the iteration.
    string? name;
    # An array of label ids attached to the iteration.
    int[]? label_ids;
    # The instant when this iteration was last updated.
    string? updated_at;
    # An array of Group IDs that have been mentioned in the Story description.
    string[]? group_mention_ids;
    # The date this iteration begins.
    string? end_date;
    # An array of UUIDs for any Members listed as Followers.
    string[]? follower_ids;
    # An array of UUIDs for any Groups you want to add as Followers. Currently, only one Group association is presented in our web UI.
    string[]? group_ids;
    # The date this iteration begins.
    string? start_date;
    # The status of the iteration. Values are either "unstarted", "started", or "done".
    string? status;
    # The ID of the iteration.
    int? id;
    # A group of calculated values for this Iteration.
    IterationStats? stats;
    # The instant when this iteration was created.
    string? created_at;
};

# An action representing a Task being created.
public type HistoryActionTaskCreate record {
    # The description of the Task.
    string? description;
    # The type of entity referenced.
    string? entity_type;
    # An array of Member IDs that represent who has been mentioned in the Task.
    string[]? mention_ids?;
    # An array of Groups IDs that represent which have been mentioned in the Task.
    string[]? group_mention_ids?;
    # An array of Member IDs that represent the Task's owners.
    string[]? owner_ids?;
    # The ID of the entity referenced.
    int? id;
    # The action of the entity referenced.
    string? action;
    # Whether or not the Task is complete.
    boolean? complete;
    # A timestamp that represent's the Task's deadline.
    string? deadline?;
};

public type ListLabels record {
    # A true/false boolean indicating if the slim versions of the Label should be returned.
    boolean? slim?;
};

public type UpdateStoryComment record {
    # The updated comment text.
    string? text;
};

# Branch refers to a VCS branch. Branches are feature branches associated with Shortcut Stories.
public type Branch record {
    # A string description of this resource.
    string? entity_type;
    # A true/false boolean indicating if the Branch has been deleted.
    boolean? deleted;
    # The name of the Branch.
    string? name;
    # A true/false boolean indicating if the Branch is persistent; e.g. master.
    boolean? persistent;
    # The time/date the Branch was updated.
    string? updated_at;
    # An array of PullRequests attached to the Branch (there is usually only one).
    PullRequest[]? pull_requests;
    # The IDs of the Branches the Branch has been merged into.
    int[]? merged_branch_ids;
    # The unique ID of the Branch.
    int? id;
    # The URL of the Branch.
    string? url;
    # The ID of the Repository that contains the Branch.
    int? repository_id;
    # The time/date the Branch was created.
    string? created_at;
};

# The results of the Epic search query.
public type EpicSearchResults record {
    # The total number of matches for the search query. The first 1000 matches can be paged through via the API.
    int? total;
    # A list of search results.
    Epic[]? data;
    # The URL path and query string for the next page of search results.
    string? next;
    # Cursors
    string[]? cursors?;
};

# StorySlim represents the same resource as a Story, but is more light-weight. For certain fields it provides ids rather than full resources (e.g., `comment_ids` and `file_ids`) and it also excludes certain aggregate values (e.g., `cycle_time`). The `description` field can be optionally included. Use the [Get Story](#Get-Story) endpoint to fetch the unabridged payload for a Story.
public type StorySlim record {
    # The Shortcut application url for the Story.
    string? app_url;
    # The description of the Story.
    string? description?;
    # True if the story has been archived or not.
    boolean? archived;
    # A true/false boolean indicating if the Story has been started.
    boolean? started;
    # An array of story links attached to the Story.
    TypedStoryLink[]? story_links;
    # A string description of this resource.
    string? entity_type;
    # An array of labels attached to the story.
    LabelSlim[]? labels;
    # An array of IDs of Tasks attached to the story.
    int[]? task_ids;
    # Deprecated: use member_mention_ids.
    string[]? mention_ids;
    # An array of Member IDs that have been mentioned in the Story description.
    string[]? member_mention_ids;
    # The type of story (feature, bug, chore).
    string? story_type;
    # An array of IDs of Files attached to the story.
    int[]? file_ids;
    # The number of tasks on the story which are complete.
    int? num_tasks_completed;
    # The ID of the workflow the story belongs to.
    int? workflow_id;
    # A manual override for the time/date the Story was completed.
    string? completed_at_override;
    # The time/date the Story was started.
    string? started_at;
    # The time/date the Story was completed.
    string? completed_at;
    # The name of the story.
    string? name;
    # A true/false boolean indicating if the Story has been completed.
    boolean? completed;
    # A true/false boolean indicating if the Story is currently a blocker of another story.
    boolean? blocker;
    # The ID of the epic the story belongs to.
    int? epic_id;
    # The ID of the story template used to create this story, or null if not created using a template.
    string? story_template_id;
    # An array of external links (strings) associated with a Story
    string[]? external_links;
    # The IDs of the iteration the story belongs to.
    int[]? previous_iteration_ids;
    # The ID of the Member that requested the story.
    string? requested_by_id;
    # The ID of the iteration the story belongs to.
    int? iteration_id;
    # An array of label ids attached to the story.
    int[]? label_ids;
    # A manual override for the time/date the Story was started.
    string? started_at_override;
    # The ID of the group associated with the story.
    string? group_id;
    # The ID of the workflow state the story is currently in.
    int? workflow_state_id;
    # The time/date the Story was updated.
    string? updated_at;
    # An array of Group IDs that have been mentioned in the Story description.
    string[]? group_mention_ids;
    # An array of UUIDs for any Members listed as Followers.
    string[]? follower_ids;
    # An array of UUIDs of the owners of this story.
    string[]? owner_ids;
    # This field can be set to another unique ID. In the case that the Story has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id;
    # The unique ID of the Story.
    int? id;
    # The lead time (in seconds) of this story when complete.
    int? lead_time?;
    # The numeric point estimate of the story. Can also be null, which means unestimated.
    int? estimate;
    # A number representing the position of the story in relation to every other story in the current project.
    int? position;
    # A true/false boolean indicating if the Story is currently blocked.
    boolean? blocked;
    # The ID of the project the story belongs to.
    int? project_id;
    # An array of IDs of LinkedFiles attached to the story.
    int[]? linked_file_ids;
    # The due date of the story.
    string? deadline;
    # The stats object for Stories
    StoryStats? stats;
    # An array of IDs of Comments attached to the story.
    int[]? comment_ids;
    # The cycle time (in seconds) of this story when complete.
    int? cycle_time?;
    # The time/date the Story was created.
    string? created_at;
    # The time/date the Story was last changed workflow-state.
    string? moved_at;
};

public type CreateOrDeleteStoryReaction record {
    # The emoji short-code to add / remove. E.g. `:thumbsup::skin-tone-4:`.
    string? emoji;
};

# A reference to a VCS Branch.
public type HistoryReferenceBranch record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The name of the entity referenced.
    string? name;
    # The external URL for the Branch.
    string? url;
};

# The type of Story Link. The string can be subject or object. 
public type TypedStoryLink record {
    # A string description of this resource.
    string? entity_type;
    # The ID of the object Story.
    int? object_id;
    # How the subject Story acts on the object Story. This can be "blocks", "duplicates", or "relates to".
    string? verb;
    # This indicates whether the Story is the subject or object in the Story Link.
    string? 'type;
    # The time/date when the Story Link was last updated.
    string? updated_at;
    # The unique identifier of the Story Link.
    int? id;
    # The ID of the subject Story.
    int? subject_id;
    # The workflow state of the "subject" story.
    int? subject_workflow_state_id;
    # The time/date when the Story Link was created.
    string? created_at;
};

# An action representing a Story Link being created.
public type HistoryActionStoryLinkCreate record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The action of the entity referenced.
    string? action;
    # The verb describing the link's relationship.
    string? verb;
    # The Story ID of the subject Story.
    int? subject_id;
    # The Story ID of the object Story.
    int? object_id;
};

# Request parameters for creating a Comment on a Shortcut Story.
public type CreateStoryCommentParams record {
    # The comment text.
    string? text;
    # The Member ID of the Comment's author. Defaults to the user identified by the API token.
    string? author_id?;
    # Defaults to the time/date the comment is created, but can be set to reflect another date.
    string? created_at?;
    # Defaults to the time/date the comment is last updated, but can be set to reflect another date.
    string? updated_at?;
    # This field can be set to another unique ID. In the case that the comment has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id?;
};

public type CreateLinkedFile record {
    # The description of the file.
    string? description?;
    # The ID of the linked story.
    int? story_id?;
    # The name of the file.
    string? name;
    # The URL of the thumbnail, if the integration provided it.
    string? thumbnail_url?;
    # The integration type of the file (e.g. google, dropbox, box).
    string? 'type;
    # The filesize, if the integration provided it.
    int? size?;
    # The UUID of the member that uploaded the file.
    string? uploader_id?;
    # The content type of the image (e.g. txt/plain).
    string? content_type?;
    # The URL of linked file.
    string? url;
};

public type ListMembers record {
    # The unique ID of the Organization to limit the list to.
    string? 'org\-public\-id?;
};

# Updated attributes for the template to populate.
public type UpdateStoryContents record {
    # The description of the story.
    string? description?;
    # A string description of this resource.
    string? entity_type?;
    # An array of labels to be populated by the template.
    CreateLabelParams[]? labels?;
    # The type of story (feature, bug, chore).
    string? story_type?;
    # An array of linked files attached to the story.
    LinkedFile[]? linked_files?;
    # An array of the attached file IDs to be populated.
    int[]? file_ids?;
    # The name of the story.
    string? name?;
    # The ID of the epic the to be populated.
    int? epic_id?;
    # An array of external links to be populated.
    string[]? external_links?;
    # The ID of the iteration the to be populated.
    int? iteration_id?;
    # An array of tasks to be populated by the template.
    EntityTemplateTask[]? tasks?;
    # An array of label ids attached to the story.
    int[]? label_ids?;
    # The ID of the group to be populated.
    string? group_id?;
    # The ID of the workflow state the story is currently in.
    int? workflow_state_id?;
    # An array of UUIDs for any Members listed as Followers.
    string[]? follower_ids?;
    # An array of UUIDs of the owners of this story.
    string[]? owner_ids?;
    # The numeric point estimate to be populated.
    int? estimate?;
    # An array of files attached to the story.
    UploadedFile[]? files?;
    # The ID of the project the story belongs to.
    int? project_id?;
    # An array of the linked file IDs to be populated.
    int[]? linked_file_ids?;
    # The due date of the story.
    string? deadline?;
};

# An action representing a Story being deleted.
public type HistoryActionStoryDelete record {
    # The ID of the entity referenced.
    int? id;
    # The type of entity referenced.
    string? entity_type;
    # The action of the entity referenced.
    string? action;
    # The name of the Story.
    string? name;
    # The type of Story; either feature, bug, or chore.
    string? story_type;
};

# A group of calculated values for this Iteration.
public type IterationStats record {
    # The total number of completed points in this Iteration.
    int? num_points_done;
    # The total number of documents related to an Iteration
    int? num_related_documents;
    # The average cycle time (in seconds) of completed stories in this Iteration.
    int? average_cycle_time?;
    # The total number of unstarted Stories in this Iteration.
    int? num_stories_unstarted;
    # The total number of started points in this Iteration.
    int? num_points_started;
    # The total number of unstarted points in this Iteration.
    int? num_points_unstarted;
    # The total number of started Stories in this Iteration.
    int? num_stories_started;
    # The total number of Stories with no point estimate.
    int? num_stories_unestimated;
    # The average lead time (in seconds) of completed stories in this Iteration.
    int? average_lead_time?;
    # The total number of points in this Iteration.
    int? num_points;
    # The total number of done Stories in this Iteration.
    int? num_stories_done;
};

# Commit refers to a VCS commit and all associated details.
public type Commit record {
    # A string description of this resource.
    string? entity_type;
    # The ID of the Member that authored the Commit, if known.
    string? author_id;
    # The Commit hash.
    string? hash;
    # The time/date the Commit was updated.
    string? updated_at;
    # The IDs of the Branches the Commit has been merged into.
    int[]? merged_branch_ids;
    # The unique ID of the Commit.
    int? id;
    # The URL of the Commit.
    string? url;
    # The email address of the VCS user that authored the Commit.
    string? author_email;
    # The time/date the Commit was pushed.
    string? timestamp;
    # The Identity of the VCS user that authored the Commit.
    Identity? author_identity;
    # The ID of the Repository that contains the Commit.
    int? repository_id;
    # The time/date the Commit was created.
    string? created_at;
    # The Commit message.
    string? message;
};

# A timestamp that represents the Story's deadline.
public type StoryHistoryChangeOldNewStr record {
    # The old value.
    string? old?;
    # The new value.
    string? 'new?;
};

# An UploadedFile is any document uploaded to your Shortcut Workspace. Files attached from a third-party service are different: see the Linked Files endpoint.
public type UploadedFile record {
    # The description of the file.
    string? description;
    # A string description of this resource.
    string? entity_type;
    # The unique IDs of the Stories associated with this file.
    int[]? story_ids;
    # Deprecated: use member_mention_ids.
    string[]? mention_ids;
    # The unique IDs of the Members who are mentioned in the file description.
    string[]? member_mention_ids;
    # The optional User-specified name of the file.
    string? name;
    # The url where the thumbnail of the file can be found in Shortcut.
    string? thumbnail_url;
    # The size of the file.
    int? size;
    # The unique ID of the Member who uploaded the file.
    string? uploader_id;
    # Free form string corresponding to a text or image file.
    string? content_type;
    # The time/date that the file was updated.
    string? updated_at;
    # The name assigned to the file in Shortcut upon upload.
    string? filename;
    # The unique IDs of the Groups who are mentioned in the file description.
    string[]? group_mention_ids;
    # This field can be set to another unique ID. In the case that the File has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id;
    # The unique ID for the file.
    int? id;
    # The URL for the file.
    string? url;
    # The time/date that the file was created.
    string? created_at;
};

public type UpdateProject record {
    # The Project's description.
    string? description?;
    # A true/false boolean indicating whether the Story is in archived state.
    boolean? archived?;
    # The number of days before the thermometer appears in the Story summary.
    int? days_to_thermometer?;
    # The color that represents the Project in the UI.
    string? color?;
    # The Project's name.
    string? name?;
    # An array of UUIDs for any Members you want to add as Followers.
    string[]? follower_ids?;
    # Configuration to enable or disable thermometers in the Story summary.
    boolean? show_thermometer?;
    # The ID of the team the project belongs to.
    int? team_id?;
    # The Project abbreviation used in Story summaries. Should be kept to 3 characters at most.
    string? abbreviation?;
};

# Workflow State is any of the at least 3 columns. Workflow States correspond to one of 3 types: Unstarted, Started, or Done.
public type WorkflowState record {
    # The description of what sort of Stories belong in that Workflow state.
    string? description;
    # A string description of this resource.
    string? entity_type;
    # The hex color for this Workflow State.
    string? color?;
    # The verb that triggers a move to that Workflow State when making VCS commits.
    string? verb;
    # The Workflow State's name.
    string? name;
    # The number of Stories currently in that Workflow State.
    int? num_stories;
    # The type of Workflow State (Unstarted, Started, or Finished)
    string? 'type;
    # When the Workflow State was last updated.
    string? updated_at;
    # The unique ID of the Workflow State.
    int? id;
    # The number of Story Templates associated with that Workflow State.
    int? num_story_templates;
    # The position that the Workflow State is in, starting with 0 at the left.
    int? position;
    # The time/date the Workflow State was created.
    string? created_at;
};

# The stats object for Stories
public type StoryStats record {
    # The number of documents related to this Story.
    int? num_related_documents;
};

# Request parameters for creating a Category with a Milestone.
public type CreateCategoryParams record {
    # The name of the new Category.
    string? name;
    # The hex color to be displayed with the Category (for example, "#ff0000").
    string? color?;
    # This field can be set to another unique ID. In the case that the Category has been imported from another tool, the ID in the other tool can be indicated here.
    string? external_id?;
};

public type ListEpics record {
    # A true/false boolean indicating whether to return Epics with their descriptions.
    boolean? includes_description?;
};

public type UpdateStoryLink record {
    # The type of link.
    string? verb?;
    # The ID of the subject Story.
    int? subject_id?;
    # The ID of the object Story.
    int? object_id?;
};

# A group of calculated values for this Label. This is not included if the slim? flag is set to true for the List Labels endpoint.
public type LabelStats record {
    # The total number of Documents associated this Label.
    int? num_related_documents;
    # The total number of Epics with this Label.
    int? num_epics;
    # The total number of stories unstarted Stories with this Label.
    int? num_stories_unstarted;
    # The total number of Stories with this Label.
    int? num_stories_total;
    # The number of unstarted epics assoicated with this label.
    int? num_epics_unstarted;
    # The number of in progress epics assoicated with this label.
    int? num_epics_in_progress;
    # The total number of unstarted points with this Label.
    int? num_points_unstarted;
    # The total number of Stories with no point estimate with this Label.
    int? num_stories_unestimated;
    # The total number of in-progress points with this Label.
    int? num_points_in_progress;
    # The total number of Epics assoicated with this Label.
    int? num_epics_total;
    # The total number of completed Stories with this Label.
    int? num_stories_completed;
    # The total number of completed points with this Label.
    int? num_points_completed;
    # The total number of points with this Label.
    int? num_points_total;
    # The total number of in-progress Stories with this Label.
    int? num_stories_in_progress;
    # The number of completed Epics assoicated with this Label.
    int? num_epics_completed;
};

public type CreateStoryLink record {
    # The type of link.
    string? verb;
    # The ID of the subject Story.
    int? subject_id;
    # The ID of the object Story.
    int? object_id;
};

public type UpdateGroup record {
    # The description of this Group.
    string? description?;
    # Whether or not this Group is archived.
    boolean? archived?;
    # The color you wish to use for the Group in the system.
    string? color?;
    # The Icon id for the avatar of this Group.
    string? display_icon_id?;
    # The mention name of this Group.
    string? mention_name?;
    # The name of this Group.
    string? name?;
    # The color key you wish to use for the Group in the system.
    string? color_key?;
    # The Member ids to add to this Group.
    string[]? member_ids?;
    # The Workflow ids to add to the Group.
    int[]? workflow_ids?;
};

public type GetEpicStories record {
    # A true/false boolean indicating whether to return Stories with their descriptions.
    boolean? includes_description?;
};
