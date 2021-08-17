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

# Metadata for `CreateGithubEnterpriseConfig` operation.
public type CreateGitHubEnterpriseConfigOperationMetadata record {
    # Time the operation was completed.
    string completeTime?;
    # Time the operation was created.
    string createTime?;
    # The resource name of the GitHubEnterprise to be created. Format: `projects/{project}/locations/{location}/githubEnterpriseConfigs/{id}`.
    string githubEnterpriseConfig?;
};

# SlackDelivery is the delivery configuration for delivering Slack messages via webhooks. See Slack webhook documentation at: https://api.slack.com/messaging/webhooks.
public type SlackDelivery record {
    # NotifierSecretRef contains the reference to a secret stored in the corresponding NotifierSpec.
    NotifierSecretRef webhookUri?;
};

# GitHubEventsConfig describes the configuration of a trigger that creates a build whenever a GitHub event is received.
public type GitHubEventsConfig record {
    # Optional. The resource name of the github enterprise config that should be applied to this installation. For example: "projects/{$project_id}/githubEnterpriseConfig/{$config_id}"
    string enterpriseConfigResourceName?;
    # The installationID that emits the GitHub event.
    string installationId?;
    # Name of the repository. For example: The name for https://github.com/googlecloudplatform/cloud-builders is "cloud-builders".
    string name?;
    # Owner of the repository. For example: The owner for https://github.com/googlecloudplatform/cloud-builders is "googlecloudplatform".
    string owner?;
    # PullRequestFilter contains filter properties for matching GitHub Pull Requests.
    PullRequestFilter pullRequest?;
    # Push contains filter properties for matching GitHub git pushes.
    PushFilter push?;
};

# Represents the metadata of the long-running operation.
public type GoogleDevtoolsCloudbuildV2OperationMetadata record {
    # Output only. API version used to start the operation.
    string apiVersion?;
    # Output only. The time the operation was created.
    string createTime?;
    # Output only. The time the operation finished running.
    string endTime?;
    # Output only. Identifies whether the user has requested cancellation of the operation. Operations that have successfully been cancelled have Operation.error value with a google.rpc.Status.code of 1, corresponding to `Code.CANCELLED`.
    boolean requestedCancellation?;
    # Output only. Human-readable status of the operation, if any.
    string statusMessage?;
    # Output only. Server-defined resource path for the target of the operation.
    string target?;
    # Output only. Name of the verb executed by the operation.
    string verb?;
};

# Secrets and secret environment variables.
public type Secrets record {
    # Secrets encrypted with KMS key and the associated secret environment variable.
    InlineSecret[] inline?;
    # Secrets in Secret Manager and associated secret environment variable.
    SecretManagerSecret[] secretManager?;
};

# Push contains filter properties for matching GitHub git pushes.
public type PushFilter record {
    # Regexes matching branches to build. The syntax of the regular expressions accepted is the syntax accepted by RE2 and described at https://github.com/google/re2/wiki/Syntax
    string branch?;
    # When true, only trigger a build if the revision regex does NOT match the git_ref regex.
    boolean invertRegex?;
    # Regexes matching tags to build. The syntax of the regular expressions accepted is the syntax accepted by RE2 and described at https://github.com/google/re2/wiki/Syntax
    string tag?;
};

# Specifies a build to retry.
public type RetryBuildRequest record {
    # Required. Build ID of the original build.
    string id?;
    # The name of the `Build` to retry. Format: `projects/{project}/locations/{location}/builds/{build}`
    string name?;
    # Required. ID of the project.
    string projectId?;
};

# Message that represents an arbitrary HTTP body. It should only be used for payload formats that can't be represented as JSON, such as raw binary or an HTML page. This message can be used both in streaming and non-streaming API methods in the request as well as the response. It can be used as a top-level request field, which is convenient if one wants to extract parameters from either the URL or HTTP template into the request fields and also want access to the raw HTTP body. Example: message GetResourceRequest { // A unique request id. string request_id = 1; // The raw HTTP body is bound to this field. google.api.HttpBody http_body = 2; } service ResourceService { rpc GetResource(GetResourceRequest) returns (google.api.HttpBody); rpc UpdateResource(google.api.HttpBody) returns (google.protobuf.Empty); } Example with streaming methods: service CaldavService { rpc GetCalendar(stream google.api.HttpBody) returns (stream google.api.HttpBody); rpc UpdateCalendar(stream google.api.HttpBody) returns (stream google.api.HttpBody); } Use of this type only changes how the request and response bodies are handled, all other features will continue to work unchanged.
public type HttpBody record {
    # The HTTP Content-Type header value specifying the content type of the body.
    string contentType?;
    # The HTTP request/response body as raw binary.
    string data?;
    # Application specific response metadata. Must be set in the first response for streaming APIs.
    record {}[] extensions?;
};

# Location of the source manifest in Google Cloud Storage. This feature is in Preview; see description [here](https://github.com/GoogleCloudPlatform/cloud-builders/tree/master/gcs-fetcher).
public type StorageSourceManifest record {
    # Google Cloud Storage bucket containing the source manifest (see [Bucket Name Requirements](https://cloud.google.com/storage/docs/bucket-naming#requirements)).
    string bucket?;
    # Google Cloud Storage generation for the object. If the generation is omitted, the latest generation will be used.
    string generation?;
    # Google Cloud Storage object containing the source manifest. This object must be a JSON file.
    string 'object?;
};

# Container message for hash values.
public type Hash record {
    # The type of hash that was performed.
    string 'type?;
    # The hash value.
    string value?;
};

# Response containing existing `BuildTriggers`.
public type ListBuildTriggersResponse record {
    # Token to receive the next page of results.
    string nextPageToken?;
    # `BuildTriggers` for the project, sorted by `create_time` descending.
    BuildTrigger[] triggers?;
};

# A build resource in the Cloud Build API. At a high level, a `Build` describes where to find source code, how to build it (for example, the builder image to run on the source), and where to store the built artifacts. Fields can include the following variables, which will be expanded when the build is created: - $PROJECT_ID: the project ID of the build. - $PROJECT_NUMBER: the project number of the build. - $BUILD_ID: the autogenerated ID of the build. - $REPO_NAME: the source repository name specified by RepoSource. - $BRANCH_NAME: the branch name specified by RepoSource. - $TAG_NAME: the tag name specified by RepoSource. - $REVISION_ID or $COMMIT_SHA: the commit SHA specified by RepoSource or resolved from the specified branch or tag. - $SHORT_SHA: first 7 characters of $REVISION_ID or $COMMIT_SHA.
public type Build record {
    # BuildApproval describes a build's approval configuration, state, and result.
    BuildApproval approval?;
    # Artifacts produced by a build that should be uploaded upon successful completion of all build steps.
    Artifacts artifacts?;
    # Secrets and secret environment variables.
    Secrets availableSecrets?;
    # Output only. The ID of the `BuildTrigger` that triggered this build, if it was triggered automatically.
    string buildTriggerId?;
    # Output only. Time at which the request to create the build was received.
    string createTime?;
    # A fatal problem encountered during the execution of the build.
    FailureInfo failureInfo?;
    # Output only. Time at which execution of the build was finished. The difference between finish_time and start_time is the duration of the build's execution.
    string finishTime?;
    # Output only. Unique identifier of the build.
    string id?;
    # A list of images to be pushed upon the successful completion of all build steps. The images are pushed using the builder service account's credentials. The digests of the pushed images will be stored in the `Build` resource's results field. If any of the images fail to be pushed, the build status is marked `FAILURE`.
    string[] images?;
    # Output only. URL to logs for this build in Google Cloud Console.
    string logUrl?;
    # Google Cloud Storage bucket where logs should be written (see [Bucket Name Requirements](https://cloud.google.com/storage/docs/bucket-naming#requirements)). Logs file names will be of the format `${logs_bucket}/log-${build_id}.txt`.
    string logsBucket?;
    # Output only. The 'Build' name with format: `projects/{project}/locations/{location}/builds/{build}`, where {build} is a unique identifier generated by the service.
    string name?;
    # Optional arguments to enable specific features of builds.
    BuildOptions options?;
    # Output only. ID of the project.
    string projectId?;
    # TTL in queue for this build. If provided and the build is enqueued longer than this value, the build will expire and the build status will be `EXPIRED`. The TTL starts ticking from create_time.
    string queueTtl?;
    # Artifacts created by the build pipeline.
    Results results?;
    # Secrets to decrypt using Cloud Key Management Service. Note: Secret Manager is the recommended technique for managing sensitive data with Cloud Build. Use `available_secrets` to configure builds to access secrets from Secret Manager. For instructions, see: https://cloud.google.com/cloud-build/docs/securing-builds/use-secrets
    Secret[] secrets?;
    # IAM service account whose credentials will be used at build runtime. Must be of the format `projects/{PROJECT_ID}/serviceAccounts/{ACCOUNT}`. ACCOUNT can be email address or uniqueId of the service account. 
    string serviceAccount?;
    # Location of the source in a supported storage service.
    Source 'source?;
    # Provenance of the source. Ways to find the original source, or verify that some source was used for this build.
    SourceProvenance sourceProvenance?;
    # Output only. Time at which execution of the build was started.
    string startTime?;
    # Output only. Status of the build.
    string status?;
    # Output only. Customer-readable message about the current status.
    string statusDetail?;
    # Required. The operations to be performed on the workspace.
    BuildStep[] steps?;
    # Substitutions data for `Build` resource.
    record {} substitutions?;
    # Tags for annotation of a `Build`. These are not docker tags.
    string[] tags?;
    # Amount of time that this build should be allowed to run, to second granularity. If this amount of time elapses, work on the build will cease and the build status will be `TIMEOUT`. `timeout` starts ticking from `startTime`. Default time is ten minutes.
    string timeout?;
    # Output only. Stores timing information for phases of the build. Valid keys are: * BUILD: time to execute all build steps. * PUSH: time to push all specified images. * FETCHSOURCE: time to fetch source. * SETUPBUILD: time to set up build. If the build does not specify source or images, these keys will not be included.
    record {} timing?;
    # Output only. Non-fatal problems encountered during the execution of the build.
    Warning[] warnings?;
};

# Metadata for `DeleteGitHubEnterpriseConfig` operation.
public type DeleteGitHubEnterpriseConfigOperationMetadata record {
    # Time the operation was completed.
    string completeTime?;
    # Time the operation was created.
    string createTime?;
    # The resource name of the GitHubEnterprise to be deleted. Format: `projects/{project}/locations/{location}/githubEnterpriseConfigs/{id}`.
    string githubEnterpriseConfig?;
};

# Response containing existing `WorkerPools`.
public type ListWorkerPoolsResponse record {
    # Continuation token used to page through large result sets. Provide this value in a subsequent ListWorkerPoolsRequest to return the next page of results.
    string nextPageToken?;
    # `WorkerPools` for the specified project.
    WorkerPool[] workerPools?;
};

# Container message for hashes of byte content of files, used in SourceProvenance messages to verify integrity of source input to the build.
public type FileHashes record {
    # Collection of file hashes.
    Hash[] fileHash?;
};

# Location of the source in a Google Cloud Source Repository.
public type RepoSource record {
    # Regex matching branches to build. The syntax of the regular expressions accepted is the syntax accepted by RE2 and described at https://github.com/google/re2/wiki/Syntax
    string branchName?;
    # Explicit commit SHA to build.
    string commitSha?;
    # Directory, relative to the source root, in which to run the build. This must be a relative path. If a step's `dir` is specified and is an absolute path, this value is ignored for that step's execution.
    string dir?;
    # Only trigger a build if the revision regex does NOT match the revision regex.
    boolean invertRegex?;
    # ID of the project that owns the Cloud Source Repository. If omitted, the project ID requesting the build is assumed.
    string projectId?;
    # Name of the Cloud Source Repository.
    string repoName?;
    # Substitutions to use in a triggered build. Should only be used with RunBuildTrigger
    record {} substitutions?;
    # Regex matching tags to build. The syntax of the regular expressions accepted is the syntax accepted by RE2 and described at https://github.com/google/re2/wiki/Syntax
    string tagName?;
};

# The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
public type Status record {
    # The status code, which should be an enum value of google.rpc.Code.
    int code?;
    # A list of messages that carry the error details. There is a common set of message types for APIs to use.
    record {}[] details?;
    # A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.
    string message?;
};

# Metadata for `UpdateGitHubEnterpriseConfig` operation.
public type UpdateGitHubEnterpriseConfigOperationMetadata record {
    # Time the operation was completed.
    string completeTime?;
    # Time the operation was created.
    string createTime?;
    # The resource name of the GitHubEnterprise to be updated. Format: `projects/{project}/locations/{location}/githubEnterpriseConfigs/{id}`.
    string githubEnterpriseConfig?;
};

# GitHubEnterpriseConfig represents a configuration for a GitHub Enterprise server.
public type GitHubEnterpriseConfig record {
    # Required. The GitHub app id of the Cloud Build app on the GitHub Enterprise server.
    string appId?;
    # Output only. Time when the installation was associated with the project.
    string createTime?;
    # Name to display for this config.
    string displayName?;
    # The URL of the github enterprise host the configuration is for.
    string hostUrl?;
    # Optional. The full resource name for the GitHubEnterpriseConfig For example: "projects/{$project_id}/githubEnterpriseConfig/{$config_id}"
    string name?;
    # Optional. The network to be used when reaching out to the GitHub Enterprise server. The VPC network must be enabled for private service connection. This should be set if the GitHub Enterprise server is hosted on-premises and not reachable by public internet. If this field is left empty, no network peering will occur and calls to the GitHub Enterprise server will be made over the public internet. Must be in the format `projects/{project}/global/networks/{network}`, where {project} is a project number or id and {network} is the name of a VPC network in the project.
    string peeredNetwork?;
    # GitHubEnterpriseSecrets represents the names of all necessary secrets in Secret Manager for a GitHub Enterprise server. Format is: projects//secrets/.
    GitHubEnterpriseSecrets secrets?;
    # Optional. SSL certificate to use for requests to GitHub Enterprise.
    string sslCa?;
    # The key that should be attached to webhook calls to the ReceiveWebhook endpoint.
    string webhookKey?;
};

# SMTPDelivery is the delivery configuration for an SMTP (email) notification.
public type SMTPDelivery record {
    # This is the SMTP account/email that appears in the `From:` of the email. If empty, it is assumed to be sender.
    string fromAddress?;
    # NotifierSecretRef contains the reference to a secret stored in the corresponding NotifierSpec.
    NotifierSecretRef password?;
    # The SMTP port of the server.
    string port?;
    # This is the list of addresses to which we send the email (i.e. in the `To:` of the email).
    string[] recipientAddresses?;
    # This is the SMTP account/email that is used to send the message.
    string senderAddress?;
    # The address of the SMTP server.
    string server?;
};

# ApprovalConfig describes configuration for manual approval of a build.
public type ApprovalConfig record {
    # Whether or not approval is needed. If this is set on a build, it will become pending when created, and will need to be explicitly approved to start.
    boolean approvalRequired?;
};

# NotifierConfig is the top-level configuration message.
public type NotifierConfig record {
    # The API version of this configuration format.
    string apiVersion?;
    # The type of notifier to use (e.g. SMTPNotifier).
    string kind?;
    # NotifierMetadata contains the data which can be used to reference or describe this notifier.
    NotifierMetadata metadata?;
    # NotifierSpec is the configuration container for notifications.
    NotifierSpec spec?;
};

# Pairs a set of secret environment variables containing encrypted values with the Cloud KMS key to use to decrypt the value. Note: Use `kmsKeyName` with `available_secrets` instead of using `kmsKeyName` with `secret`. For instructions see: https://cloud.google.com/cloud-build/docs/securing-builds/use-encrypted-credentials.
public type Secret record {
    # Cloud KMS key name to use to decrypt these envs.
    string kmsKeyName?;
    # Map of environment variable name to its encrypted value. Secret environment variables must be unique across all of a build's secrets, and must be used by at least one build step. Values can be at most 64 KB in size. There can be at most 100 secret values across all of a build's secrets.
    record {} secretEnv?;
};

# Artifacts produced by a build that should be uploaded upon successful completion of all build steps.
public type Artifacts record {
    # A list of images to be pushed upon the successful completion of all build steps. The images will be pushed using the builder service account's credentials. The digests of the pushed images will be stored in the Build resource's results field. If any of the images fail to be pushed, the build is marked FAILURE.
    string[] images?;
    # Files in the workspace to upload to Cloud Storage upon successful completion of all build steps.
    ArtifactObjects objects?;
};

# NotifierSpec is the configuration container for notifications.
public type NotifierSpec record {
    # Notification is the container which holds the data that is relevant to this particular notification.
    Notification notification?;
    # Configurations for secret resources used by this particular notifier.
    NotifierSecret[] secrets?;
};

# Configuration for a `WorkerPool`. Cloud Build owns and maintains a pool of workers for general use and have no access to a project's private network. By default, builds submitted to Cloud Build will use a worker from this pool. If your build needs access to resources on a private network, create and use a `WorkerPool` to run your builds. Private `WorkerPool`s give your builds access to any single VPC network that you administer, including any on-prem resources connected to that VPC network. For an overview of private pools, see [Private pools overview](https://cloud.google.com/build/docs/private-pools/private-pools-overview).
public type WorkerPool record {
    # User specified annotations. See https://google.aip.dev/128#annotations for more details such as format and size limitations.
    record {} annotations?;
    # Output only. Time at which the request to create the `WorkerPool` was received.
    string createTime?;
    # Output only. Time at which the request to delete the `WorkerPool` was received.
    string deleteTime?;
    # A user-specified, human-readable name for the `WorkerPool`. If provided, this value must be 1-63 characters.
    string displayName?;
    # Output only. Checksum computed by the server. May be sent on update and delete requests to ensure that the client has an up-to-date value before proceeding.
    string etag?;
    # Output only. The resource name of the `WorkerPool`, with format `projects/{project}/locations/{location}/workerPools/{worker_pool}`. The value of `{worker_pool}` is provided by `worker_pool_id` in `CreateWorkerPool` request and the value of `{location}` is determined by the endpoint accessed.
    string name?;
    # Configuration for a V1 `PrivatePool`.
    PrivatePoolV1Config privatePoolV1Config?;
    # Output only. `WorkerPool` state.
    string state?;
    # Output only. A unique identifier for the `WorkerPool`.
    string uid?;
    # Output only. Time at which the request to update the `WorkerPool` was received.
    string updateTime?;
};

# GitHubEnterpriseSecrets represents the names of all necessary secrets in Secret Manager for a GitHub Enterprise server. Format is: projects//secrets/.
public type GitHubEnterpriseSecrets record {
    # The resource name for the OAuth client ID secret in Secret Manager.
    string oauthClientIdName?;
    # The resource name for the OAuth client ID secret version in Secret Manager.
    string oauthClientIdVersionName?;
    # The resource name for the OAuth secret in Secret Manager.
    string oauthSecretName?;
    # The resource name for the OAuth secret secret version in Secret Manager.
    string oauthSecretVersionName?;
    # The resource name for the private key secret.
    string privateKeyName?;
    # The resource name for the private key secret version.
    string privateKeyVersionName?;
    # The resource name for the webhook secret in Secret Manager.
    string webhookSecretName?;
    # The resource name for the webhook secret secret version in Secret Manager.
    string webhookSecretVersionName?;
};

# Volume describes a Docker container volume which is mounted into build steps in order to persist files across build step execution.
public type Volume record {
    # Name of the volume to mount. Volume names must be unique per build step and must be valid names for Docker volumes. Each named volume must be used by at least two build steps.
    string name?;
    # Path at which to mount the volume. Paths must be absolute and cannot conflict with other volume paths on the same build step or with certain reserved volume paths.
    string path?;
};

# Request to approve or reject a pending build.
public type ApproveBuildRequest record {
    # ApprovalResult describes the decision and associated metadata of a manual approval of a build.
    ApprovalResult approvalResult?;
};

# Files in the workspace to upload to Cloud Storage upon successful completion of all build steps.
public type ArtifactObjects record {
    # Cloud Storage bucket and optional object path, in the form "gs://bucket/path/to/somewhere/". (see [Bucket Name Requirements](https://cloud.google.com/storage/docs/bucket-naming#requirements)). Files in the workspace matching any path pattern will be uploaded to Cloud Storage with this location as a prefix.
    string location?;
    # Path globs used to match files in the build's workspace.
    string[] paths?;
    # Start and end times for a build execution phase.
    TimeSpan timing?;
};

# Pairs a set of secret environment variables mapped to encrypted values with the Cloud KMS key to use to decrypt the value.
public type InlineSecret record {
    # Map of environment variable name to its encrypted value. Secret environment variables must be unique across all of a build's secrets, and must be used by at least one build step. Values can be at most 64 KB in size. There can be at most 100 secret values across all of a build's secrets.
    record {} envMap?;
    # Resource name of Cloud KMS crypto key to decrypt the encrypted value. In format: projects/*/locations/*/keyRings/*/cryptoKeys/*
    string kmsKeyName?;
};

# Metadata for the `CreateWorkerPool` operation.
public type CreateWorkerPoolOperationMetadata record {
    # Time the operation was completed.
    string completeTime?;
    # Time the operation was created.
    string createTime?;
    # The resource name of the `WorkerPool` to create. Format: `projects/{project}/locations/{location}/workerPools/{worker_pool}`.
    string workerPool?;
};

# An image built by the pipeline.
public type BuiltImage record {
    # Docker Registry 2.0 digest.
    string digest?;
    # Name used to push the container image to Google Container Registry, as presented to `docker push`.
    string name?;
    # Start and end times for a build execution phase.
    TimeSpan pushTiming?;
};

# A non-fatal problem encountered during the execution of the build.
public type Warning record {
    # The priority for this warning.
    string priority?;
    # Explanation of the warning generated.
    string text?;
};

# Details about how a build should be executed on a `WorkerPool`. See [running builds in a private pool](https://cloud.google.com/build/docs/private-pools/run-builds-in-private-pool) for more information.
public type PoolOption record {
    # The `WorkerPool` resource to execute the build on. You must have `cloudbuild.workerpools.use` on the project hosting the WorkerPool. Format projects/{project}/locations/{location}/workerPools/{workerPoolId}
    string name?;
};

# Metadata for the `DeleteWorkerPool` operation.
public type DeleteWorkerPoolOperationMetadata record {
    # Time the operation was completed.
    string completeTime?;
    # Time the operation was created.
    string createTime?;
    # The resource name of the `WorkerPool` being deleted. Format: `projects/{project}/locations/{location}/workerPools/{worker_pool}`.
    string workerPool?;
};

# A step in the build pipeline.
public type BuildStep record {
    # A list of arguments that will be presented to the step when it is started. If the image used to run the step's container has an entrypoint, the `args` are used as arguments to that entrypoint. If the image does not define an entrypoint, the first element in args is used as the entrypoint, and the remainder will be used as arguments.
    string[] args?;
    # Working directory to use when running this step's container. If this value is a relative path, it is relative to the build's working directory. If this value is absolute, it may be outside the build's working directory, in which case the contents of the path may not be persisted across build step executions, unless a `volume` for that path is specified. If the build specifies a `RepoSource` with `dir` and a step with a `dir`, which specifies an absolute path, the `RepoSource` `dir` is ignored for the step's execution.
    string dir?;
    # Entrypoint to be used instead of the build step image's default entrypoint. If unset, the image's default entrypoint is used.
    string entrypoint?;
    # A list of environment variable definitions to be used when running a step. The elements are of the form "KEY=VALUE" for the environment variable "KEY" being given the value "VALUE".
    string[] env?;
    # Unique identifier for this build step, used in `wait_for` to reference this build step as a dependency.
    string id?;
    # Required. The name of the container image that will run this particular build step. If the image is available in the host's Docker daemon's cache, it will be run directly. If not, the host will attempt to pull the image first, using the builder service account's credentials if necessary. The Docker daemon's cache will already have the latest versions of all of the officially supported build steps ([https://github.com/GoogleCloudPlatform/cloud-builders](https://github.com/GoogleCloudPlatform/cloud-builders)). The Docker daemon will also have cached many of the layers for some popular images, like "ubuntu", "debian", but they will be refreshed at the time you attempt to use them. If you built an image in a previous build step, it will be stored in the host's Docker daemon's cache and is available to use as the name for a later build step.
    string name?;
    # Start and end times for a build execution phase.
    TimeSpan pullTiming?;
    # A shell script to be executed in the step. When script is provided, the user cannot specify the entrypoint or args.
    string script?;
    # A list of environment variables which are encrypted using a Cloud Key Management Service crypto key. These values must be specified in the build's `Secret`.
    string[] secretEnv?;
    # Output only. Status of the build step. At this time, build step status is only updated on build completion; step status is not updated in real-time as the build progresses.
    string status?;
    # Time limit for executing this build step. If not defined, the step has no time limit and will be allowed to continue to run until either it completes or the build itself times out.
    string timeout?;
    # Start and end times for a build execution phase.
    TimeSpan timing?;
    # List of volumes to mount into the build step. Each volume is created as an empty volume prior to execution of the build step. Upon completion of the build, volumes and their contents are discarded. Using a named volume in only one step is not valid as it is indicative of a build request with an incorrect configuration.
    Volume[] volumes?;
    # The ID(s) of the step(s) that this build step depends on. This build step will not start until all the build steps in `wait_for` have completed successfully. If `wait_for` is empty, this build step will start when all previous build steps in the `Build.Steps` list have completed successfully.
    string[] waitFor?;
};

# This resource represents a long-running operation that is the result of a network API call.
public type Operation record {
    # If the value is `false`, it means the operation is still in progress. If `true`, the operation is completed, and either `error` or `response` is available.
    boolean done?;
    # The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
    Status _error?;
    # Service-specific metadata associated with the operation. It typically contains progress information and common metadata such as create time. Some services might not provide such metadata. Any method that returns a long-running operation should document the metadata type, if any.
    record {} metadata?;
    # The server-assigned name, which is only unique within the same service that originally returns it. If you use the default HTTP mapping, the `name` should be a resource name ending with `operations/{unique_id}`.
    string name?;
    # The normal response of the operation in case of success. If the original method returns no data on success, such as `Delete`, the response is `google.protobuf.Empty`. If the original method is standard `Get`/`Create`/`Update`, the response should be the resource. For other methods, the response should have the type XxxResponse, where `Xxx` is the original method name. For example, if the original method name is TakeSnapshot(), the inferred response type is `TakeSnapshotResponse`.
    record {} response?;
};

# BuildApproval describes a build's approval configuration, state, and result.
public type BuildApproval record {
    # ApprovalConfig describes configuration for manual approval of a build.
    ApprovalConfig config?;
    # ApprovalResult describes the decision and associated metadata of a manual approval of a build.
    ApprovalResult result?;
    # Output only. The state of this build's approval.
    string state?;
};

# GitFileSource describes a file within a (possibly remote) code repository.
public type GitFileSource record {
    # The path of the file, with the repo root as the root of the path.
    string path?;
    # See RepoType above.
    string repoType?;
    # The branch, tag, arbitrary ref, or SHA version of the repo to use when resolving the filename (optional). This field respects the same syntax/resolution as described here: https://git-scm.com/docs/gitrevisions If unspecified, the revision from which the trigger invocation originated is assumed to be the revision from which to read the specified path.
    string revision?;
    # The URI of the repo (optional). If unspecified, the repo from which the trigger invocation originated is assumed to be the repo from which to read the specified path.
    string uri?;
};

# Notification is the container which holds the data that is relevant to this particular notification.
public type Notification record {
    # The filter string to use for notification filtering. Currently, this is assumed to be a CEL program. See https://opensource.google/projects/cel for more.
    string filter?;
    # HTTPDelivery is the delivery configuration for an HTTP notification.
    HTTPDelivery httpDelivery?;
    # SlackDelivery is the delivery configuration for delivering Slack messages via webhooks. See Slack webhook documentation at: https://api.slack.com/messaging/webhooks.
    SlackDelivery slackDelivery?;
    # SMTPDelivery is the delivery configuration for an SMTP (email) notification.
    SMTPDelivery smtpDelivery?;
    # Escape hatch for users to supply custom delivery configs.
    record {} structDelivery?;
};

# Location of the source in a supported storage service.
public type Source record {
    # Location of the source in a Google Cloud Source Repository.
    RepoSource repoSource?;
    # Location of the source in an archive file in Google Cloud Storage.
    StorageSource storageSource?;
    # Location of the source manifest in Google Cloud Storage. This feature is in Preview; see description [here](https://github.com/GoogleCloudPlatform/cloud-builders/tree/master/gcs-fetcher).
    StorageSourceManifest storageSourceManifest?;
};

# Start and end times for a build execution phase.
public type TimeSpan record {
    # End of time span.
    string endTime?;
    # Start of time span.
    string startTime?;
};

# Response including listed builds.
public type ListBuildsResponse record {
    # Builds will be sorted by `create_time`, descending.
    Build[] builds?;
    # Token to receive the next page of results. This will be absent if the end of the response list has been reached.
    string nextPageToken?;
};

# RPC response object returned by ListGithubEnterpriseConfigs RPC method.
public type ListGithubEnterpriseConfigsResponse record {
    # A list of GitHubEnterpriseConfigs
    GitHubEnterpriseConfig[] configs?;
};

# Metadata for `ProcessAppManifestCallback` operation.
public type ProcessAppManifestCallbackOperationMetadata record {
    # Time the operation was completed.
    string completeTime?;
    # Time the operation was created.
    string createTime?;
    # The resource name of the GitHubEnterprise to be created. Format: `projects/{project}/locations/{location}/githubEnterpriseConfigs/{id}`.
    string githubEnterpriseConfig?;
};

# Pairs a secret environment variable with a SecretVersion in Secret Manager.
public type SecretManagerSecret record {
    # Environment variable name to associate with the secret. Secret environment variables must be unique across all of a build's secrets, and must be used by at least one build step.
    string env?;
    # Resource name of the SecretVersion. In format: projects/*/secrets/*/versions/*
    string versionName?;
};

# WebhookConfig describes the configuration of a trigger that creates a build whenever a webhook is sent to a trigger's webhook URL.
public type WebhookConfig record {
    # Required. Resource name for the secret required as a URL parameter.
    string secret?;
    # Potential issues with the underlying Pub/Sub subscription configuration. Only populated on get requests.
    string state?;
};

# NotifierSecret is the container that maps a secret name (reference) to its Google Cloud Secret Manager resource path.
public type NotifierSecret record {
    # Name is the local name of the secret, such as the verbatim string "my-smtp-password".
    string name?;
    # Value is interpreted to be a resource path for fetching the actual (versioned) secret data for this secret. For example, this would be a Google Cloud Secret Manager secret version resource path like: "projects/my-project/secrets/my-secret/versions/latest".
    string value?;
};

# Configuration for an automated build in response to source repository changes.
public type BuildTrigger record {
    # ApprovalConfig describes configuration for manual approval of a build.
    ApprovalConfig approvalConfig?;
    # Autodetect build configuration. The following precedence is used (case insensitive): 1. cloudbuild.yaml 2. cloudbuild.yml 3. cloudbuild.json 4. Dockerfile Currently only available for GitHub App Triggers.
    boolean autodetect?;
    # A build resource in the Cloud Build API. At a high level, a `Build` describes where to find source code, how to build it (for example, the builder image to run on the source), and where to store the built artifacts. Fields can include the following variables, which will be expanded when the build is created: - $PROJECT_ID: the project ID of the build. - $PROJECT_NUMBER: the project number of the build. - $BUILD_ID: the autogenerated ID of the build. - $REPO_NAME: the source repository name specified by RepoSource. - $BRANCH_NAME: the branch name specified by RepoSource. - $TAG_NAME: the tag name specified by RepoSource. - $REVISION_ID or $COMMIT_SHA: the commit SHA specified by RepoSource or resolved from the specified branch or tag. - $SHORT_SHA: first 7 characters of $REVISION_ID or $COMMIT_SHA.
    Build build?;
    # Output only. Time when the trigger was created.
    string createTime?;
    # Human-readable description of this trigger.
    string description?;
    # If true, the trigger will never automatically execute a build.
    boolean disabled?;
    # Path, from the source root, to the build configuration file (i.e. cloudbuild.yaml).
    string filename?;
    # A Common Expression Language string.
    string filter?;
    # GitFileSource describes a file within a (possibly remote) code repository.
    GitFileSource gitFileSource?;
    # GitHubEventsConfig describes the configuration of a trigger that creates a build whenever a GitHub event is received.
    GitHubEventsConfig github?;
    # Output only. Unique identifier of the trigger.
    string id?;
    # ignored_files and included_files are file glob matches using https://golang.org/pkg/path/filepath/#Match extended with support for "**". If ignored_files and changed files are both empty, then they are not used to determine whether or not to trigger a build. If ignored_files is not empty, then we ignore any files that match any of the ignored_file globs. If the change has no files that are outside of the ignored_files globs, then we do not trigger a build.
    string[] ignoredFiles?;
    # If any of the files altered in the commit pass the ignored_files filter and included_files is empty, then as far as this filter is concerned, we should trigger the build. If any of the files altered in the commit pass the ignored_files filter and included_files is not empty, then we make sure that at least one of those files matches a included_files glob. If not, then we do not trigger a build.
    string[] includedFiles?;
    # User-assigned name of the trigger. Must be unique within the project. Trigger names must meet the following requirements: + They must contain only alphanumeric characters and dashes. + They can be 1-64 characters long. + They must begin and end with an alphanumeric character.
    string name?;
    # PubsubConfig describes the configuration of a trigger that creates a build whenever a Pub/Sub message is published.
    PubsubConfig pubsubConfig?;
    # The `Trigger` name with format: `projects/{project}/locations/{location}/triggers/{trigger}`, where {trigger} is a unique identifier generated by the service.
    string resourceName?;
    # The service account used for all user-controlled operations including UpdateBuildTrigger, RunBuildTrigger, CreateBuild, and CancelBuild. If no service account is set, then the standard Cloud Build service account ([PROJECT_NUM]@system.gserviceaccount.com) will be used instead. Format: `projects/{PROJECT_ID}/serviceAccounts/{ACCOUNT_ID_OR_EMAIL}`
    string serviceAccount?;
    # GitRepoSource describes a repo and ref of a code repository.
    GitRepoSource sourceToBuild?;
    # Substitutions for Build resource. The keys must match the following regular expression: `^_[A-Z0-9_]+$`.
    record {} substitutions?;
    # Tags for annotation of a `BuildTrigger`
    string[] tags?;
    # Location of the source in a Google Cloud Source Repository.
    RepoSource triggerTemplate?;
    # WebhookConfig describes the configuration of a trigger that creates a build whenever a webhook is sent to a trigger's webhook URL.
    WebhookConfig webhookConfig?;
};

# A fatal problem encountered during the execution of the build.
public type FailureInfo record {
    # Explains the failure issue in more detail using hard-coded text.
    string detail?;
    # The name of the failure.
    string 'type?;
};

# GitRepoSource describes a repo and ref of a code repository.
public type GitRepoSource record {
    # The branch or tag to use. Must start with "refs/" (required).
    string ref?;
    # See RepoType below.
    string repoType?;
    # The URI of the repo (required).
    string uri?;
};

# PullRequestFilter contains filter properties for matching GitHub Pull Requests.
public type PullRequestFilter record {
    # Regex of branches to match. The syntax of the regular expressions accepted is the syntax accepted by RE2 and described at https://github.com/google/re2/wiki/Syntax
    string branch?;
    # Configure builds to run whether a repository owner or collaborator need to comment `/gcbrun`.
    string commentControl?;
    # If true, branches that do NOT match the git_ref will trigger a build.
    boolean invertRegex?;
};

# Defines the configuration to be used for creating workers in the pool.
public type WorkerConfig record {
    # Size of the disk attached to the worker, in GB. See [Worker pool config file](https://cloud.google.com/build/docs/private-pools/worker-pool-config-file-schema). Specify a value of up to 1000. If `0` is specified, Cloud Build will use a standard disk size.
    string diskSizeGb?;
    # Machine type of a worker, such as `e2-medium`. See [Worker pool config file](https://cloud.google.com/build/docs/private-pools/worker-pool-config-file-schema). If left blank, Cloud Build will use a sensible default.
    string machineType?;
};

# ApprovalResult describes the decision and associated metadata of a manual approval of a build.
public type ApprovalResult record {
    # Output only. The time when the approval decision was made.
    string approvalTime?;
    # Output only. Email of the user that called the ApproveBuild API to approve or reject a build at the time that the API was called (the user's actual email that is tied to their GAIA ID may have changed). This field is not stored, rather, it is calculated on the fly using approver_id.
    string approverAccount?;
    # Optional. An optional comment for this manual approval result.
    string comment?;
    # Required. The decision of this manual approval.
    string decision?;
    # Optional. An optional URL tied to this manual approval result. This field is essentially the same as comment, except that it will be rendered by the UI differently. An example use case is a link to an external job that approved this Build.
    string url?;
};

# Request to cancel an ongoing build.
public type CancelBuildRequest record {
    # Required. ID of the build.
    string id?;
    # The name of the `Build` to cancel. Format: `projects/{project}/locations/{location}/builds/{build}`
    string name?;
    # Required. ID of the project.
    string projectId?;
};

# Represents the metadata of the long-running operation.
public type OperationMetadata record {
    # Output only. API version used to start the operation.
    string apiVersion?;
    # Output only. Identifies whether the user has requested cancellation of the operation. Operations that have been cancelled successfully have Operation.error value with a google.rpc.Status.code of 1, corresponding to `Code.CANCELLED`.
    boolean cancelRequested?;
    # Output only. The time the operation was created.
    string createTime?;
    # Output only. The time the operation finished running.
    string endTime?;
    # Output only. Human-readable status of the operation, if any.
    string statusDetail?;
    # Output only. Server-defined resource path for the target of the operation.
    string target?;
    # Output only. Name of the verb executed by the operation.
    string verb?;
};

# NotifierSecretRef contains the reference to a secret stored in the corresponding NotifierSpec.
public type NotifierSecretRef record {
    # The value of `secret_ref` should be a `name` that is registered in a `Secret` in the `secrets` list of the `Spec`.
    string secretRef?;
};

# Metadata for build operations.
public type BuildOperationMetadata record {
    # A build resource in the Cloud Build API. At a high level, a `Build` describes where to find source code, how to build it (for example, the builder image to run on the source), and where to store the built artifacts. Fields can include the following variables, which will be expanded when the build is created: - $PROJECT_ID: the project ID of the build. - $PROJECT_NUMBER: the project number of the build. - $BUILD_ID: the autogenerated ID of the build. - $REPO_NAME: the source repository name specified by RepoSource. - $BRANCH_NAME: the branch name specified by RepoSource. - $TAG_NAME: the tag name specified by RepoSource. - $REVISION_ID or $COMMIT_SHA: the commit SHA specified by RepoSource or resolved from the specified branch or tag. - $SHORT_SHA: first 7 characters of $REVISION_ID or $COMMIT_SHA.
    Build build?;
};

# Defines the network configuration for the pool.
public type NetworkConfig record {
    # Option to configure network egress for the workers.
    string egressOption?;
    # Required. Immutable. The network definition that the workers are peered to. If this section is left empty, the workers will be peered to `WorkerPool.project_id` on the service producer network. Must be in the format `projects/{project}/global/networks/{network}`, where `{project}` is a project number, such as `12345`, and `{network}` is the name of a VPC network in the project. See [Understanding network configuration options](https://cloud.google.com/build/docs/private-pools/set-up-private-pool-environment)
    string peeredNetwork?;
};

# Provenance of the source. Ways to find the original source, or verify that some source was used for this build.
public type SourceProvenance record {
    # Output only. Hash(es) of the build source, which can be used to verify that the original source integrity was maintained in the build. Note that `FileHashes` will only be populated if `BuildOptions` has requested a `SourceProvenanceHash`. The keys to this map are file paths used as build source and the values contain the hash values for those files. If the build source came in a single package such as a gzipped tarfile (`.tar.gz`), the `FileHash` will be for the single path to that file.
    record {} fileHashes?;
    # Location of the source in a Google Cloud Source Repository.
    RepoSource resolvedRepoSource?;
    # Location of the source in an archive file in Google Cloud Storage.
    StorageSource resolvedStorageSource?;
    # Location of the source manifest in Google Cloud Storage. This feature is in Preview; see description [here](https://github.com/GoogleCloudPlatform/cloud-builders/tree/master/gcs-fetcher).
    StorageSourceManifest resolvedStorageSourceManifest?;
};

# Configuration for a V1 `PrivatePool`.
public type PrivatePoolV1Config record {
    # Defines the network configuration for the pool.
    NetworkConfig networkConfig?;
    # Defines the configuration to be used for creating workers in the pool.
    WorkerConfig workerConfig?;
};

# An artifact that was uploaded during a build. This is a single record in the artifact manifest JSON file.
public type ArtifactResult record {
    # The file hash of the artifact.
    FileHashes[] fileHash?;
    # The path of an artifact in a Google Cloud Storage bucket, with the generation number. For example, `gs://mybucket/path/to/output.jar#generation`.
    string location?;
};

# HTTPDelivery is the delivery configuration for an HTTP notification.
public type HTTPDelivery record {
    # The URI to which JSON-containing HTTP POST requests should be sent.
    string uri?;
};

# PubsubConfig describes the configuration of a trigger that creates a build whenever a Pub/Sub message is published.
public type PubsubConfig record {
    # Service account that will make the push request.
    string serviceAccountEmail?;
    # Potential issues with the underlying Pub/Sub subscription configuration. Only populated on get requests.
    string state?;
    # Output only. Name of the subscription. Format is `projects/{project}/subscriptions/{subscription}`.
    string subscription?;
    # The name of the topic from which this subscription is receiving messages. Format is `projects/{project}/topics/{topic}`.
    string topic?;
};

# Metadata for the `UpdateWorkerPool` operation.
public type UpdateWorkerPoolOperationMetadata record {
    # Time the operation was completed.
    string completeTime?;
    # Time the operation was created.
    string createTime?;
    # The resource name of the `WorkerPool` being updated. Format: `projects/{project}/locations/{location}/workerPools/{worker_pool}`.
    string workerPool?;
};

# NotifierMetadata contains the data which can be used to reference or describe this notifier.
public type NotifierMetadata record {
    # The human-readable and user-given name for the notifier. For example: "repo-merge-email-notifier".
    string name?;
    # The string representing the name and version of notifier to deploy. Expected to be of the form of "/:". For example: "gcr.io/my-project/notifiers/smtp:1.2.34".
    string notifier?;
};

# Optional arguments to enable specific features of builds.
public type BuildOptions record {
    # Requested disk size for the VM that runs the build. Note that this is *NOT* "disk free"; some of the space will be used by the operating system and build utilities. Also note that this is the minimum disk size that will be allocated for the build -- the build may run with a larger disk than requested. At present, the maximum disk size is 1000GB; builds that request more than the maximum are rejected with an error.
    string diskSizeGb?;
    # Option to specify whether or not to apply bash style string operations to the substitutions. NOTE: this is always enabled for triggered builds and cannot be overridden in the build configuration file.
    boolean dynamicSubstitutions?;
    # A list of global environment variable definitions that will exist for all build steps in this build. If a variable is defined in both globally and in a build step, the variable will use the build step value. The elements are of the form "KEY=VALUE" for the environment variable "KEY" being given the value "VALUE".
    string[] env?;
    # Option to define build log streaming behavior to Google Cloud Storage.
    string logStreamingOption?;
    # Option to specify the logging mode, which determines if and where build logs are stored.
    string logging?;
    # Compute Engine machine type on which to run the build.
    string machineType?;
    # Details about how a build should be executed on a `WorkerPool`. See [running builds in a private pool](https://cloud.google.com/build/docs/private-pools/run-builds-in-private-pool) for more information.
    PoolOption pool?;
    # Requested verifiability options.
    string requestedVerifyOption?;
    # A list of global environment variables, which are encrypted using a Cloud Key Management Service crypto key. These values must be specified in the build's `Secret`. These variables will be available to all build steps in this build.
    string[] secretEnv?;
    # Requested hash for SourceProvenance.
    string[] sourceProvenanceHash?;
    # Option to specify behavior when there is an error in the substitution checks. NOTE: this is always set to ALLOW_LOOSE for triggered builds and cannot be overridden in the build configuration file.
    string substitutionOption?;
    # Global list of volumes to mount for ALL build steps Each volume is created as an empty volume prior to starting the build process. Upon completion of the build, volumes and their contents are discarded. Global volume names and paths cannot conflict with the volumes defined a build step. Using a global volume in a build with only one step is not valid as it is indicative of a build request with an incorrect configuration.
    Volume[] volumes?;
    # This field deprecated; please use `pool.name` instead.
    string workerPool?;
};

# Artifacts created by the build pipeline.
public type Results record {
    # Path to the artifact manifest. Only populated when artifacts are uploaded.
    string artifactManifest?;
    # Start and end times for a build execution phase.
    TimeSpan artifactTiming?;
    # List of build step digests, in the order corresponding to build step indices.
    string[] buildStepImages?;
    # List of build step outputs, produced by builder images, in the order corresponding to build step indices. [Cloud Builders](https://cloud.google.com/cloud-build/docs/cloud-builders) can produce this output by writing to `$BUILDER_OUTPUT/output`. Only the first 4KB of data is stored.
    string[] buildStepOutputs?;
    # Container images that were built as a part of the build.
    BuiltImage[] images?;
    # Number of artifacts uploaded. Only populated when artifacts are uploaded.
    string numArtifacts?;
};

# Specifies a build trigger to run and the source to use.
public type RunBuildTriggerRequest record {
    # Required. ID of the project.
    string projectId?;
    # Location of the source in a Google Cloud Source Repository.
    RepoSource 'source?;
    # Required. ID of the trigger.
    string triggerId?;
};

# Location of the source in an archive file in Google Cloud Storage.
public type StorageSource record {
    # Google Cloud Storage bucket containing the source (see [Bucket Name Requirements](https://cloud.google.com/storage/docs/bucket-naming#requirements)).
    string bucket?;
    # Google Cloud Storage generation for the object. If the generation is omitted, the latest generation will be used.
    string generation?;
    # Google Cloud Storage object containing the source. This object must be a zipped (`.zip`) or gzipped archive file (`.tar.gz`) containing source to build.
    string 'object?;
};
