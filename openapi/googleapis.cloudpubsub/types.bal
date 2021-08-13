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

# An Identity and Access Management (IAM) policy, which specifies access controls for Google Cloud resources. A `Policy` is a collection of `bindings`. A `binding` binds one or more `members` to a single `role`. Members can be user accounts, service accounts, Google groups, and domains (such as G Suite). A `role` is a named list of permissions; each `role` can be an IAM predefined role or a user-created custom role. For some types of Google Cloud resources, a `binding` can also specify a `condition`, which is a logical expression that allows access to a resource only if the expression evaluates to `true`. A condition can add constraints based on attributes of the request, the resource, or both. To learn which resources support conditions in their IAM policies, see the [IAM documentation](https://cloud.google.com/iam/help/conditions/resource-policies). **JSON example:** { "bindings": [ { "role": "roles/resourcemanager.organizationAdmin", "members": [ "user:mike@example.com", "group:admins@example.com", "domain:google.com", "serviceAccount:my-project-id@appspot.gserviceaccount.com" ] }, { "role": "roles/resourcemanager.organizationViewer", "members": [ "user:eve@example.com" ], "condition": { "title": "expirable access", "description": "Does not grant access after Sep 2020", "expression": "request.time < timestamp('2020-10-01T00:00:00.000Z')", } } ], "etag": "BwWWja0YfJA=", "version": 3 } **YAML example:** bindings: - members: - user:mike@example.com - group:admins@example.com - domain:google.com - serviceAccount:my-project-id@appspot.gserviceaccount.com role: roles/resourcemanager.organizationAdmin - members: - user:eve@example.com role: roles/resourcemanager.organizationViewer condition: title: expirable access description: Does not grant access after Sep 2020 expression: request.time < timestamp('2020-10-01T00:00:00.000Z') - etag: BwWWja0YfJA= - version: 3 For a description of IAM and its features, see the [IAM documentation](https://cloud.google.com/iam/docs/).
public type Policy record {
    # Associates a list of `members` to a `role`. Optionally, may specify a `condition` that determines how and when the `bindings` are applied. Each of the `bindings` must contain at least one member.
    Binding[] bindings?;
    # `etag` is used for optimistic concurrency control as a way to help prevent simultaneous updates of a policy from overwriting each other. It is strongly suggested that systems make use of the `etag` in the read-modify-write cycle to perform policy updates in order to avoid race conditions: An `etag` is returned in the response to `getIamPolicy`, and systems are expected to put that etag in the request to `setIamPolicy` to ensure that their change will be applied to the same version of the policy. **Important:** If you use IAM Conditions, you must include the `etag` field whenever you call `setIamPolicy`. If you omit this field, then IAM allows you to overwrite a version `3` policy with a version `1` policy, and all of the conditions in the version `3` policy are lost.
    string etag?;
    # Specifies the format of the policy. Valid values are `0`, `1`, and `3`. Requests that specify an invalid value are rejected. Any operation that affects conditional role bindings must specify version `3`. This requirement applies to the following operations: * Getting a policy that includes a conditional role binding * Adding a conditional role binding to a policy * Changing a conditional role binding in a policy * Removing any role binding, with or without a condition, from a policy that includes conditions **Important:** If you use IAM Conditions, you must include the `etag` field whenever you call `setIamPolicy`. If you omit this field, then IAM allows you to overwrite a version `3` policy with a version `1` policy, and all of the conditions in the version `3` policy are lost. If a policy does not include any conditions, operations on that policy may specify any valid version or leave the field unset. To learn which resources support conditions in their IAM policies, see the [IAM documentation](https://cloud.google.com/iam/help/conditions/resource-policies).
    int 'version?;
};

# Request for the `Pull` method.
public type PullRequest record {
    # Required. The maximum number of messages to return for this request. Must be a positive integer. The Pub/Sub system may return fewer than the number specified.
    int maxMessages?;
    # Optional. If this field set to true, the system will respond immediately even if it there are no messages available to return in the `Pull` response. Otherwise, the system may wait (for a bounded amount of time) until at least one message is available, rather than returning no messages. Warning: setting this field to `true` is discouraged because it adversely impacts the performance of `Pull` operations. We recommend that users do not set this field.
    boolean returnImmediately?;
};

# A schema resource.
public type Schema record {
    # The definition of the schema. This should contain a string representing the full definition of the schema that is a valid schema definition of the type specified in `type`.
    string definition?;
    # Required. Name of the schema. Format is `projects/{project}/schemas/{schema}`.
    string name?;
    # The type of the schema definition.
    string 'type?;
};

# A message and its corresponding acknowledgment ID.
public type ReceivedMessage record {
    # This ID can be used to acknowledge the received message.
    string ackId?;
    # The approximate number of times that Cloud Pub/Sub has attempted to deliver the associated message to a subscriber. More precisely, this is 1 + (number of NACKs) + (number of ack_deadline exceeds) for this message. A NACK is any call to ModifyAckDeadline with a 0 deadline. An ack_deadline exceeds event is whenever a message is not acknowledged within ack_deadline. Note that ack_deadline is initially Subscription.ackDeadlineSeconds, but may get extended automatically by the client library. Upon the first delivery of a given message, `delivery_attempt` will have a value of 1. The value is calculated at best effort and is approximate. If a DeadLetterPolicy is not set on the subscription, this will be 0.
    int deliveryAttempt?;
    # A message that is published by publishers and consumed by subscribers. The message must contain either a non-empty data field or at least one attribute. Note that client libraries represent this object differently depending on the language. See the corresponding [client library documentation](https://cloud.google.com/pubsub/docs/reference/libraries) for more information. See [quotas and limits] (https://cloud.google.com/pubsub/quotas) for more information about message limits.
    PubsubMessage message?;
};

# Settings for validating messages published against a schema.
public type SchemaSettings record {
    # The encoding of messages validated against `schema`.
    string encoding?;
    # Required. The name of the schema that messages published should be validated against. Format is `projects/{project}/schemas/{schema}`. The value of this field will be `_deleted-schema_` if the schema has been deleted.
    string schema?;
};

# A policy that specifies the conditions for resource expiration (i.e., automatic resource deletion).
public type ExpirationPolicy record {
    # Specifies the "time-to-live" duration for an associated resource. The resource expires if it is not active for a period of `ttl`. The definition of "activity" depends on the type of the associated resource. The minimum and maximum allowed values for `ttl` depend on the type of the associated resource, as well. If `ttl` is not set, the associated resource never expires.
    string ttl?;
};

# A message that is published by publishers and consumed by subscribers. The message must contain either a non-empty data field or at least one attribute. Note that client libraries represent this object differently depending on the language. See the corresponding [client library documentation](https://cloud.google.com/pubsub/docs/reference/libraries) for more information. See [quotas and limits] (https://cloud.google.com/pubsub/quotas) for more information about message limits.
public type PubsubMessage record {
    # Attributes for this message. If this field is empty, the message must contain non-empty data. This can be used to filter messages on the subscription.
    record {} attributes?;
    # The message data field. If this field is empty, the message must contain at least one attribute.
    string data?;
    # ID of this message, assigned by the server when the message is published. Guaranteed to be unique within the topic. This value may be read by a subscriber that receives a `PubsubMessage` via a `Pull` call or a push delivery. It must not be populated by the publisher in a `Publish` call.
    string messageId?;
    # If non-empty, identifies related messages for which publish order should be respected. If a `Subscription` has `enable_message_ordering` set to `true`, messages published with the same non-empty `ordering_key` value will be delivered to subscribers in the order in which they are received by the Pub/Sub system. All `PubsubMessage`s published in a given `PublishRequest` must specify the same `ordering_key` value.
    string orderingKey?;
    # The time at which the message was published, populated by the server when it receives the `Publish` call. It must not be populated by the publisher in a `Publish` call.
    string publishTime?;
};

# Request for the UpdateSnapshot method.
public type UpdateSnapshotRequest record {
    # A snapshot resource. Snapshots are used in [Seek](https://cloud.google.com/pubsub/docs/replay-overview) operations, which allow you to manage message acknowledgments in bulk. That is, you can set the acknowledgment state of messages in an existing subscription to the state captured by a snapshot.
    Snapshot snapshot?;
    # Required. Indicates which fields in the provided snapshot to update. Must be specified and non-empty.
    string updateMask?;
};

# Configuration for a push delivery endpoint.
public type PushConfig record {
    # Endpoint configuration attributes that can be used to control different aspects of the message delivery. The only currently supported attribute is `x-goog-version`, which you can use to change the format of the pushed message. This attribute indicates the version of the data expected by the endpoint. This controls the shape of the pushed message (i.e., its fields and metadata). If not present during the `CreateSubscription` call, it will default to the version of the Pub/Sub API used to make such call. If not present in a `ModifyPushConfig` call, its value will not be changed. `GetSubscription` calls will always return a valid version, even if the subscription was created without this attribute. The only supported values for the `x-goog-version` attribute are: * `v1beta1`: uses the push format defined in the v1beta1 Pub/Sub API. * `v1` or `v1beta2`: uses the push format defined in the v1 Pub/Sub API. For example: attributes { "x-goog-version": "v1" } 
    record {} attributes?;
    # Contains information needed for generating an [OpenID Connect token](https://developers.google.com/identity/protocols/OpenIDConnect).
    OidcToken oidcToken?;
    # A URL locating the endpoint to which messages should be pushed. For example, a Webhook endpoint might use `https://example.com/push`.
    string pushEndpoint?;
};

# Response for the `ListSnapshots` method.
public type ListSnapshotsResponse record {
    # If not empty, indicates that there may be more snapshot that match the request; this value should be passed in a new `ListSnapshotsRequest`.
    string nextPageToken?;
    # The resulting snapshots.
    Snapshot[] snapshots?;
};

# Request for the `Seek` method.
public type SeekRequest record {
    # The snapshot to seek to. The snapshot's topic must be the same as that of the provided subscription. Format is `projects/{project}/snapshots/{snap}`.
    string snapshot?;
    # The time to seek to. Messages retained in the subscription that were published before this time are marked as acknowledged, and messages retained in the subscription that were published after this time are marked as unacknowledged. Note that this operation affects only those messages retained in the subscription (configured by the combination of `message_retention_duration` and `retain_acked_messages`). For example, if `time` corresponds to a point before the message retention window (or to a point before the system's notion of the subscription creation time), only retained messages will be marked as unacknowledged, and already-expunged messages will not be restored.
    string time?;
};

# Request for the `CreateSnapshot` method.
public type CreateSnapshotRequest record {
    # See Creating and managing labels.
    record {} labels?;
    # Required. The subscription whose backlog the snapshot retains. Specifically, the created snapshot is guaranteed to retain: (a) The existing backlog on the subscription. More precisely, this is defined as the messages in the subscription's backlog that are unacknowledged upon the successful completion of the `CreateSnapshot` request; as well as: (b) Any messages published to the subscription's topic following the successful completion of the CreateSnapshot request. Format is `projects/{project}/subscriptions/{sub}`.
    string subscription?;
};

# Request for the ModifyAckDeadline method.
public type ModifyAckDeadlineRequest record {
    # Required. The new ack deadline with respect to the time this request was sent to the Pub/Sub system. For example, if the value is 10, the new ack deadline will expire 10 seconds after the `ModifyAckDeadline` call was made. Specifying zero might immediately make the message available for delivery to another subscriber client. This typically results in an increase in the rate of message redeliveries (that is, duplicates). The minimum deadline you can specify is 0 seconds. The maximum deadline you can specify is 600 seconds (10 minutes).
    int ackDeadlineSeconds?;
    # Required. List of acknowledgment IDs.
    string[] ackIds?;
};

# Response message for `TestIamPermissions` method.
public type TestIamPermissionsResponse record {
    # A subset of `TestPermissionsRequest.permissions` that the caller is allowed.
    string[] permissions?;
};

# Response for the `ListTopics` method.
public type ListTopicsResponse record {
    # If not empty, indicates that there may be more topics that match the request; this value should be passed in a new `ListTopicsRequest`.
    string nextPageToken?;
    # The resulting topics.
    Topic[] topics?;
};

# A subscription resource.
public type Subscription record {
    # The approximate amount of time (on a best-effort basis) Pub/Sub waits for the subscriber to acknowledge receipt before resending the message. In the interval after the message is delivered and before it is acknowledged, it is considered to be *outstanding*. During that time period, the message will not be redelivered (on a best-effort basis). For pull subscriptions, this value is used as the initial value for the ack deadline. To override this value for a given message, call `ModifyAckDeadline` with the corresponding `ack_id` if using non-streaming pull or send the `ack_id` in a `StreamingModifyAckDeadlineRequest` if using streaming pull. The minimum custom deadline you can specify is 10 seconds. The maximum custom deadline you can specify is 600 seconds (10 minutes). If this parameter is 0, a default value of 10 seconds is used. For push delivery, this value is also used to set the request timeout for the call to the push endpoint. If the subscriber never acknowledges the message, the Pub/Sub system will eventually redeliver the message.
    int ackDeadlineSeconds?;
    # Dead lettering is done on a best effort basis. The same message might be dead lettered multiple times. If validation on any of the fields fails at subscription creation/updation, the create/update subscription request will fail.
    DeadLetterPolicy deadLetterPolicy?;
    # Indicates whether the subscription is detached from its topic. Detached subscriptions don't receive messages from their topic and don't retain any backlog. `Pull` and `StreamingPull` requests will return FAILED_PRECONDITION. If the subscription is a push subscription, pushes to the endpoint will not be made.
    boolean detached?;
    # If true, messages published with the same `ordering_key` in `PubsubMessage` will be delivered to the subscribers in the order in which they are received by the Pub/Sub system. Otherwise, they may be delivered in any order.
    boolean enableMessageOrdering?;
    # A policy that specifies the conditions for resource expiration (i.e., automatic resource deletion).
    ExpirationPolicy expirationPolicy?;
    # An expression written in the Pub/Sub [filter language](https://cloud.google.com/pubsub/docs/filtering). If non-empty, then only `PubsubMessage`s whose `attributes` field matches the filter are delivered on this subscription. If empty, then no messages are filtered out.
    string filter?;
    # See Creating and managing labels.
    record {} labels?;
    # How long to retain unacknowledged messages in the subscription's backlog, from the moment a message is published. If `retain_acked_messages` is true, then this also configures the retention of acknowledged messages, and thus configures how far back in time a `Seek` can be done. Defaults to 7 days. Cannot be more than 7 days or less than 10 minutes.
    string messageRetentionDuration?;
    # Required. The name of the subscription. It must have the format `"projects/{project}/subscriptions/{subscription}"`. `{subscription}` must start with a letter, and contain only letters (`[A-Za-z]`), numbers (`[0-9]`), dashes (`-`), underscores (`_`), periods (`.`), tildes (`~`), plus (`+`) or percent signs (`%`). It must be between 3 and 255 characters in length, and it must not start with `"goog"`.
    string name?;
    # Configuration for a push delivery endpoint.
    PushConfig pushConfig?;
    # Indicates whether to retain acknowledged messages. If true, then messages are not expunged from the subscription's backlog, even if they are acknowledged, until they fall out of the `message_retention_duration` window. This must be true if you would like to [`Seek` to a timestamp] (https://cloud.google.com/pubsub/docs/replay-overview#seek_to_a_time) in the past to replay previously-acknowledged messages.
    boolean retainAckedMessages?;
    # A policy that specifies how Cloud Pub/Sub retries message delivery. Retry delay will be exponential based on provided minimum and maximum backoffs. https://en.wikipedia.org/wiki/Exponential_backoff. RetryPolicy will be triggered on NACKs or acknowledgement deadline exceeded events for a given message. Retry Policy is implemented on a best effort basis. At times, the delay between consecutive deliveries may not match the configuration. That is, delay can be more or less than configured backoff.
    RetryPolicy retryPolicy?;
    # Required. The name of the topic from which this subscription is receiving messages. Format is `projects/{project}/topics/{topic}`. The value of this field will be `_deleted-topic_` if the topic has been deleted.
    string topic?;
    # Output only. Indicates the minimum duration for which a message is retained after it is published to the subscription's topic. If this field is set, messages published to the subscription's topic in the last `topic_message_retention_duration` are always available to subscribers. See the `message_retention_duration` field in `Topic`. This field is set only in responses from the server; it is ignored if it is set in any requests.
    string topicMessageRetentionDuration?;
};

# A topic resource.
public type Topic record {
    # The resource name of the Cloud KMS CryptoKey to be used to protect access to messages published on this topic. The expected format is `projects/*/locations/*/keyRings/*/cryptoKeys/*`.
    string kmsKeyName?;
    # See [Creating and managing labels] (https://cloud.google.com/pubsub/docs/labels).
    record {} labels?;
    # Indicates the minimum duration to retain a message after it is published to the topic. If this field is set, messages published to the topic in the last `message_retention_duration` are always available to subscribers. For instance, it allows any attached subscription to [seek to a timestamp](https://cloud.google.com/pubsub/docs/replay-overview#seek_to_a_time) that is up to `message_retention_duration` in the past. If this field is not set, message retention is controlled by settings on individual subscriptions. Cannot be more than 7 days or less than 10 minutes.
    string messageRetentionDuration?;
    # A policy constraining the storage of messages published to the topic.
    MessageStoragePolicy messageStoragePolicy?;
    # Required. The name of the topic. It must have the format `"projects/{project}/topics/{topic}"`. `{topic}` must start with a letter, and contain only letters (`[A-Za-z]`), numbers (`[0-9]`), dashes (`-`), underscores (`_`), periods (`.`), tildes (`~`), plus (`+`) or percent signs (`%`). It must be between 3 and 255 characters in length, and it must not start with `"goog"`.
    string name?;
    # Reserved for future use. This field is set only in responses from the server; it is ignored if it is set in any requests.
    boolean satisfiesPzs?;
    # Settings for validating messages published against a schema.
    SchemaSettings schemaSettings?;
};

# Request for the `ValidateSchema` method.
public type ValidateSchemaRequest record {
    # A schema resource.
    Schema schema?;
};

# Associates `members` with a `role`.
public type Binding record {
    # Represents a textual expression in the Common Expression Language (CEL) syntax. CEL is a C-like expression language. The syntax and semantics of CEL are documented at https://github.com/google/cel-spec. Example (Comparison): title: "Summary size limit" description: "Determines if a summary is less than 100 chars" expression: "document.summary.size() < 100" Example (Equality): title: "Requestor is owner" description: "Determines if requestor is the document owner" expression: "document.owner == request.auth.claims.email" Example (Logic): title: "Public documents" description: "Determine whether the document should be publicly visible" expression: "document.type != 'private' && document.type != 'internal'" Example (Data Manipulation): title: "Notification string" description: "Create a notification string with a timestamp." expression: "'New message received at ' + string(document.create_time)" The exact variables and functions that may be referenced within an expression are determined by the service that evaluates it. See the service documentation for additional information.
    Expr condition?;
    # Specifies the identities requesting access for a Cloud Platform resource. `members` can have the following values: * `allUsers`: A special identifier that represents anyone who is on the internet; with or without a Google account. * `allAuthenticatedUsers`: A special identifier that represents anyone who is authenticated with a Google account or a service account. * `user:{emailid}`: An email address that represents a specific Google account. For example, `alice@example.com` . * `serviceAccount:{emailid}`: An email address that represents a service account. For example, `my-other-app@appspot.gserviceaccount.com`. * `group:{emailid}`: An email address that represents a Google group. For example, `admins@example.com`. * `deleted:user:{emailid}?uid={uniqueid}`: An email address (plus unique identifier) representing a user that has been recently deleted. For example, `alice@example.com?uid=123456789012345678901`. If the user is recovered, this value reverts to `user:{emailid}` and the recovered user retains the role in the binding. * `deleted:serviceAccount:{emailid}?uid={uniqueid}`: An email address (plus unique identifier) representing a service account that has been recently deleted. For example, `my-other-app@appspot.gserviceaccount.com?uid=123456789012345678901`. If the service account is undeleted, this value reverts to `serviceAccount:{emailid}` and the undeleted service account retains the role in the binding. * `deleted:group:{emailid}?uid={uniqueid}`: An email address (plus unique identifier) representing a Google group that has been recently deleted. For example, `admins@example.com?uid=123456789012345678901`. If the group is recovered, this value reverts to `group:{emailid}` and the recovered group retains the role in the binding. * `domain:{domain}`: The G Suite domain (primary) that represents all the users of that domain. For example, `google.com` or `example.com`. 
    string[] members?;
    # Role that is assigned to `members`. For example, `roles/viewer`, `roles/editor`, or `roles/owner`.
    string role?;
};

# Response for the `ListSubscriptions` method.
public type ListSubscriptionsResponse record {
    # If not empty, indicates that there may be more subscriptions that match the request; this value should be passed in a new `ListSubscriptionsRequest` to get more subscriptions.
    string nextPageToken?;
    # The subscriptions that match the request.
    Subscription[] subscriptions?;
};

# Response for the `Publish` method.
public type PublishResponse record {
    # The server-assigned ID of each published message, in the same order as the messages in the request. IDs are guaranteed to be unique within the topic.
    string[] messageIds?;
};

# Request for the Acknowledge method.
public type AcknowledgeRequest record {
    # Required. The acknowledgment ID for the messages being acknowledged that was returned by the Pub/Sub system in the `Pull` response. Must not be empty.
    string[] ackIds?;
};

# Dead lettering is done on a best effort basis. The same message might be dead lettered multiple times. If validation on any of the fields fails at subscription creation/updation, the create/update subscription request will fail.
public type DeadLetterPolicy record {
    # The name of the topic to which dead letter messages should be published. Format is `projects/{project}/topics/{topic}`.The Cloud Pub/Sub service account associated with the enclosing subscription's parent project (i.e., service-{project_number}@gcp-sa-pubsub.iam.gserviceaccount.com) must have permission to Publish() to this topic. The operation will fail if the topic does not exist. Users should ensure that there is a subscription attached to this topic since messages published to a topic with no subscriptions are lost.
    string deadLetterTopic?;
    # The maximum number of delivery attempts for any message. The value must be between 5 and 100. The number of delivery attempts is defined as 1 + (the sum of number of NACKs and number of times the acknowledgement deadline has been exceeded for the message). A NACK is any call to ModifyAckDeadline with a 0 deadline. Note that client libraries may automatically extend ack_deadlines. This field will be honored on a best effort basis. If this parameter is 0, a default value of 5 is used.
    int maxDeliveryAttempts?;
};

# Request for the UpdateSubscription method.
public type UpdateSubscriptionRequest record {
    # A subscription resource.
    Subscription subscription?;
    # Required. Indicates which fields in the provided subscription to update. Must be specified and non-empty.
    string updateMask?;
};

# Request message for `SetIamPolicy` method.
public type SetIamPolicyRequest record {
    # An Identity and Access Management (IAM) policy, which specifies access controls for Google Cloud resources. A `Policy` is a collection of `bindings`. A `binding` binds one or more `members` to a single `role`. Members can be user accounts, service accounts, Google groups, and domains (such as G Suite). A `role` is a named list of permissions; each `role` can be an IAM predefined role or a user-created custom role. For some types of Google Cloud resources, a `binding` can also specify a `condition`, which is a logical expression that allows access to a resource only if the expression evaluates to `true`. A condition can add constraints based on attributes of the request, the resource, or both. To learn which resources support conditions in their IAM policies, see the [IAM documentation](https://cloud.google.com/iam/help/conditions/resource-policies). **JSON example:** { "bindings": [ { "role": "roles/resourcemanager.organizationAdmin", "members": [ "user:mike@example.com", "group:admins@example.com", "domain:google.com", "serviceAccount:my-project-id@appspot.gserviceaccount.com" ] }, { "role": "roles/resourcemanager.organizationViewer", "members": [ "user:eve@example.com" ], "condition": { "title": "expirable access", "description": "Does not grant access after Sep 2020", "expression": "request.time < timestamp('2020-10-01T00:00:00.000Z')", } } ], "etag": "BwWWja0YfJA=", "version": 3 } **YAML example:** bindings: - members: - user:mike@example.com - group:admins@example.com - domain:google.com - serviceAccount:my-project-id@appspot.gserviceaccount.com role: roles/resourcemanager.organizationAdmin - members: - user:eve@example.com role: roles/resourcemanager.organizationViewer condition: title: expirable access description: Does not grant access after Sep 2020 expression: request.time < timestamp('2020-10-01T00:00:00.000Z') - etag: BwWWja0YfJA= - version: 3 For a description of IAM and its features, see the [IAM documentation](https://cloud.google.com/iam/docs/).
    Policy policy?;
};

# Request message for `TestIamPermissions` method.
public type TestIamPermissionsRequest record {
    # The set of permissions to check for the `resource`. Permissions with wildcards (such as '*' or 'storage.*') are not allowed. For more information see [IAM Overview](https://cloud.google.com/iam/docs/overview#permissions).
    string[] permissions?;
};

# Request for the `ValidateMessage` method.
public type ValidateMessageRequest record {
    # The encoding expected for messages
    string encoding?;
    # Message to validate against the provided `schema_spec`.
    string message?;
    # Name of the schema against which to validate. Format is `projects/{project}/schemas/{schema}`.
    string name?;
    # A schema resource.
    Schema schema?;
};

# Contains information needed for generating an [OpenID Connect token](https://developers.google.com/identity/protocols/OpenIDConnect).
public type OidcToken record {
    # Audience to be used when generating OIDC token. The audience claim identifies the recipients that the JWT is intended for. The audience value is a single case-sensitive string. Having multiple values (array) for the audience field is not supported. More info about the OIDC JWT token audience here: https://tools.ietf.org/html/rfc7519#section-4.1.3 Note: if not specified, the Push endpoint URL will be used.
    string audience?;
    # [Service account email](https://cloud.google.com/iam/docs/service-accounts) to be used for generating the OIDC token. The caller (for CreateSubscription, UpdateSubscription, and ModifyPushConfig RPCs) must have the iam.serviceAccounts.actAs permission for the service account.
    string serviceAccountEmail?;
};

# Request for the Publish method.
public type PublishRequest record {
    # Required. The messages to publish.
    PubsubMessage[] messages?;
};

# Request for the ModifyPushConfig method.
public type ModifyPushConfigRequest record {
    # Configuration for a push delivery endpoint.
    PushConfig pushConfig?;
};

# Response for the `ListTopicSubscriptions` method.
public type ListTopicSubscriptionsResponse record {
    # If not empty, indicates that there may be more subscriptions that match the request; this value should be passed in a new `ListTopicSubscriptionsRequest` to get more subscriptions.
    string nextPageToken?;
    # The names of subscriptions attached to the topic specified in the request.
    string[] subscriptions?;
};

# A snapshot resource. Snapshots are used in [Seek](https://cloud.google.com/pubsub/docs/replay-overview) operations, which allow you to manage message acknowledgments in bulk. That is, you can set the acknowledgment state of messages in an existing subscription to the state captured by a snapshot.
public type Snapshot record {
    # The snapshot is guaranteed to exist up until this time. A newly-created snapshot expires no later than 7 days from the time of its creation. Its exact lifetime is determined at creation by the existing backlog in the source subscription. Specifically, the lifetime of the snapshot is `7 days - (age of oldest unacked message in the subscription)`. For example, consider a subscription whose oldest unacked message is 3 days old. If a snapshot is created from this subscription, the snapshot -- which will always capture this 3-day-old backlog as long as the snapshot exists -- will expire in 4 days. The service will refuse to create a snapshot that would expire in less than 1 hour after creation.
    string expireTime?;
    # See [Creating and managing labels] (https://cloud.google.com/pubsub/docs/labels).
    record {} labels?;
    # The name of the snapshot.
    string name?;
    # The name of the topic from which this snapshot is retaining messages.
    string topic?;
};

# Response for the `Pull` method.
public type PullResponse record {
    # Received Pub/Sub messages. The list will be empty if there are no more messages available in the backlog. For JSON, the response can be entirely empty. The Pub/Sub system may return fewer than the `maxMessages` requested even if there are more messages available in the backlog.
    ReceivedMessage[] receivedMessages?;
};

# Represents a textual expression in the Common Expression Language (CEL) syntax. CEL is a C-like expression language. The syntax and semantics of CEL are documented at https://github.com/google/cel-spec. Example (Comparison): title: "Summary size limit" description: "Determines if a summary is less than 100 chars" expression: "document.summary.size() < 100" Example (Equality): title: "Requestor is owner" description: "Determines if requestor is the document owner" expression: "document.owner == request.auth.claims.email" Example (Logic): title: "Public documents" description: "Determine whether the document should be publicly visible" expression: "document.type != 'private' && document.type != 'internal'" Example (Data Manipulation): title: "Notification string" description: "Create a notification string with a timestamp." expression: "'New message received at ' + string(document.create_time)" The exact variables and functions that may be referenced within an expression are determined by the service that evaluates it. See the service documentation for additional information.
public type Expr record {
    # Optional. Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI.
    string description?;
    # Textual representation of an expression in Common Expression Language syntax.
    string expression?;
    # Optional. String indicating the location of the expression for error reporting, e.g. a file name and a position in the file.
    string location?;
    # Optional. Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression.
    string title?;
};

# A policy constraining the storage of messages published to the topic.
public type MessageStoragePolicy record {
    # A list of IDs of GCP regions where messages that are published to the topic may be persisted in storage. Messages published by publishers running in non-allowed GCP regions (or running outside of GCP altogether) will be routed for storage in one of the allowed regions. An empty list means that no regions are allowed, and is not a valid configuration.
    string[] allowedPersistenceRegions?;
};

# Response for the `ListSchemas` method.
public type ListSchemasResponse record {
    # If not empty, indicates that there may be more schemas that match the request; this value should be passed in a new `ListSchemasRequest`.
    string nextPageToken?;
    # The resulting schemas.
    Schema[] schemas?;
};

# Request for the UpdateTopic method.
public type UpdateTopicRequest record {
    # A topic resource.
    Topic topic?;
    # Required. Indicates which fields in the provided topic to update. Must be specified and non-empty. Note that if `update_mask` contains "message_storage_policy" but the `message_storage_policy` is not set in the `topic` provided above, then the updated value is determined by the policy configured at the project or organization level.
    string updateMask?;
};

# A policy that specifies how Cloud Pub/Sub retries message delivery. Retry delay will be exponential based on provided minimum and maximum backoffs. https://en.wikipedia.org/wiki/Exponential_backoff. RetryPolicy will be triggered on NACKs or acknowledgement deadline exceeded events for a given message. Retry Policy is implemented on a best effort basis. At times, the delay between consecutive deliveries may not match the configuration. That is, delay can be more or less than configured backoff.
public type RetryPolicy record {
    # The maximum delay between consecutive deliveries of a given message. Value should be between 0 and 600 seconds. Defaults to 600 seconds.
    string maximumBackoff?;
    # The minimum delay between consecutive deliveries of a given message. Value should be between 0 and 600 seconds. Defaults to 10 seconds.
    string minimumBackoff?;
};

# Response for the `ListTopicSnapshots` method.
public type ListTopicSnapshotsResponse record {
    # If not empty, indicates that there may be more snapshots that match the request; this value should be passed in a new `ListTopicSnapshotsRequest` to get more snapshots.
    string nextPageToken?;
    # The names of the snapshots that match the request.
    string[] snapshots?;
};
