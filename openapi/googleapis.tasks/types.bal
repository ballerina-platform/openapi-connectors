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

public type Task record {
    # Completion date of the task (as a RFC 3339 timestamp). This field is omitted if the task has not been completed.
    string completed?;
    # Flag indicating whether the task has been deleted. The default is False.
    boolean deleted?;
    # Due date of the task (as a RFC 3339 timestamp). Optional. The due date only records date information; the time portion of the timestamp is discarded when setting the due date. It isn't possible to read or write the time that a task is due via the API.
    string due?;
    # ETag of the resource.
    string etag?;
    # Flag indicating whether the task is hidden. This is the case if the task had been marked completed when the task list was last cleared. The default is False. This field is read-only.
    boolean hidden?;
    # Task identifier.
    string id?;
    # Type of the resource. This is always "tasks#task".
    string kind?;
    # Collection of links. This collection is read-only.
    TaskLinks[] links?;
    # Notes describing the task. Optional.
    string notes?;
    # Parent task identifier. This field is omitted if it is a top-level task. This field is read-only. Use the "move" method to move the task under a different parent or to the top level.
    string parent?;
    # String indicating the position of the task among its sibling tasks under the same parent task or at the top level. If this string is greater than another task's corresponding position string according to lexicographical ordering, the task is positioned after the other task under the same parent task (or at the top level). This field is read-only. Use the "move" method to move the task to another position.
    string position?;
    # URL pointing to this task. Used to retrieve, update, or delete this task.
    string selfLink?;
    # Status of the task. This is either "needsAction" or "completed".
    string status?;
    # Title of the task.
    string title?;
    # Last modification time of the task (as a RFC 3339 timestamp).
    string updated?;
};

public type Tasks record {
    # ETag of the resource.
    string etag?;
    # Collection of tasks.
    Task[] items?;
    # Type of the resource. This is always "tasks#tasks".
    string kind?;
    # Token used to access the next page of this result.
    string nextPageToken?;
};

public type TaskList record {
    # ETag of the resource.
    string etag?;
    # Task list identifier.
    string id?;
    # Type of the resource. This is always "tasks#taskList".
    string kind?;
    # URL pointing to this task list. Used to retrieve, update, or delete this task list.
    string selfLink?;
    # Title of the task list.
    string title?;
    # Last modification time of the task list (as a RFC 3339 timestamp).
    string updated?;
};

public type TaskLists record {
    # ETag of the resource.
    string etag?;
    # Collection of task lists.
    TaskList[] items?;
    # Type of the resource. This is always "tasks#taskLists".
    string kind?;
    # Token that can be used to request the next page of this result.
    string nextPageToken?;
};

public type TaskLinks record {
    # The description. In HTML speak: Everything between <a> and </a>.
    string description?;
    # The URL.
    string link?;
    # Type of the link, e.g. "email".
    string 'type?;
};
