import ballerina/http;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
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

public type ObjectsGetResponseArr ObjectsGetResponse[];

# Definitions of semantic schemas (also see: https://github.com/weaviate/weaviate-semantic-schemas).
public type Schema record {
    # Semantic classes that are available.
    Class[]? classes = ();
    # Email of the maintainer.
    string? maintainer = ();
    # Name of the schema.
    string? name = ();
};

# Filter search results using a where filter
public type WhereFilter record {
    # combine multiple where filters, requires 'And' or 'Or' operator
    WhereFilter[]? operands = ();
    # operator to use
    string? operator = ();
    # path to the property currently being filtered
    string[]? path = ();
    # value as integer
    int? valueInt = ();
    # value as number/float
    float? valueNumber = ();
    # value as boolean
    boolean? valueBoolean = ();
    # value as string
    string? valueString = ();
    # value as text (on text props)
    string? valueText = ();
    # value as date (as string)
    string? valueDate = ();
    # filter within a distance of a georange
    WhereFilterGeoRange valueGeoRange?;
};

# A list of GraphQL queries.
public type GraphQLQueries GraphQLQuery[];

# JSON object value.
public type JsonObject record {
};

# fine-grained control over stopword list usage
public type StopwordConfig record {
    # pre-existing list of common words by language
    string preset?;
    # stopwords to be considered additionally
    string[]? additions = ();
    # stopwords to be removed from consideration
    string[]? removals = ();
};

# Allow custom overrides of vector weights as math expressions. E.g. "pancake": "7" will set the weight for the word pancake to 7 in the vectorization, whereas "w * 3" would triple the originally calculated word. This is an open object, with OpenAPI Specification 3.0 this will be more detailed. See Weaviate docs for more info. In the future this will become a key/value (string/string) object.
public type VectorWeights record {
};

public type ObjectsGetResponse record {
    *Object;
    Deprecation[]? deprecations = ();
    # Results for this specific Object.
    ObjectsGetResponse_result result?;
};

# Configure the inverted index built into Weaviate
public type InvertedIndexConfig record {
    # Asynchronous index clean up happens every n seconds
    int cleanupIntervalSeconds?;
    # tuning parameters for the BM25 algorithm
    BM25Config bm25?;
    # fine-grained control over stopword list usage
    StopwordConfig stopwords?;
    # Index each object by its internal timestamps
    boolean indexTimestamps?;
    # Index each object with the null state
    boolean indexNullState?;
    # Index length of properties
    boolean indexPropertyLength?;
};

public type BatchDelete record {
    # Outlines how to find the objects to be deleted.
    BatchDelete_match 'match?;
    # Controls the verbosity of the output, possible values are: "minimal", "verbose". Defaults to "minimal".
    string output?;
    # If true, objects will not be deleted yet, but merely listed. Defaults to false.
    boolean dryRun?;
};

# Results for this specific Object.
public type BatchDeleteResponse_results_objects record {
    # ID of the Object.
    string id?;
    # Object processing status
    string status?;
    # An error response given by Weaviate end-points.
    ErrorResponse errors?;
};

public type Deprecation record {
    # The id that uniquely identifies this particular deprecations (mostly used internally)
    string id?;
    # Whether the problematic API functionality is deprecated (planned to be removed) or already removed
    string status?;
    # Describes which API is effected, usually one of: REST, GraphQL
    string apiType?;
    # What this deprecation is about
    string msg?;
    # User-required object to not be affected by the (planned) removal
    string mitigation?;
    # The deprecation was introduced in this version
    string sinceVersion?;
    # A best-effort guess of which upcoming version will remove the feature entirely
    string plannedRemovalVersion?;
    # If the feature has already been removed, it was removed in this version
    string? removedIn = ();
    # If the feature has already been removed, it was removed at this timestamp
    string? removedTime = ();
    # The deprecation was introduced in this version
    string sinceTime?;
    # The locations within the specified API affected by this deprecation
    string[] locations?;
};

# Either set beacon (direct reference) or set class and schema (concept reference)
public type SingleRef record {
    # If using a concept reference (rather than a direct reference), specify the desired class name here
    string 'class?;
    # This is an open object, with OpenAPI Specification 3.0 this will be more detailed. See Weaviate docs for more info. In the future this will become a key/value OR a SingleRef definition.
    PropertySchema schema?;
    # If using a direct reference, specify the URI to point to the cross-ref here. Should be in the form of weaviate://localhost/<uuid> for the example of a local cross-ref to an object
    string beacon?;
    # If using a direct reference, this read-only fields provides a link to the referenced resource. If 'origin' is globally configured, an absolute URI is shown - a relative URI otherwise.
    string href?;
    # This meta field contains additional info about the classified reference property
    ReferenceMetaClassification classification?;
};

# An error response caused by a GraphQL query.
public type GraphQLError record {
    # Location of the graphQL query
    GraphQLError_locations[] locations?;
    # error message give by the graphQL query
    string message?;
    # paths in the schema
    string[]? path = ();
};

# Additional Meta information about a single object object.
public type AdditionalProperties record {|
    record {}...;
|};

public type Batch_objects_body record {
    # Define which fields need to be returned. Default value is ALL
    string[] fields?;
    Object[] objects?;
};

# Results due to the deletion operation
public type BatchDeleteResponse_results record {
    # How many objects were matched by the filter.
    int matches?;
    # The most amount of objects that can be deleted in a single query, equals QUERY_MAXIMUM_RESULTS.
    int 'limit?;
    # How many objects were successfully deleted in this round.
    int successful?;
    # How many objects should have been deleted but could not be deleted.
    int failed?;
    # With output set to "minimal" only objects with error occurred will the be described. Successfully deleted objects would be omitted. Output set to "verbose" will list all of the objets with their respective statuses.
    BatchDeleteResponse_results_objects[]? objects = ();
};

public type Property record {
    # Can be a reference to another type when it starts with a capital (for example Person), otherwise "string" or "int".
    string[] dataType?;
    # Description of the property.
    string description?;
    # Configuration specific to modules this Weaviate instance has installed
    record {} moduleConfig?;
    # Name of the property as URI relative to the schema URL.
    string name?;
    # Optional. Should this property be indexed in the inverted index. Defaults to true. If you choose false, you will not be able to use this property in where filters. This property has no affect on vectorization decisions done by modules
    boolean? indexInverted = ();
    # Determines tokenization of the property as separate words or whole field. Optional. Applies to string, string[], text and text[] data types. Allowed values are `word` (default) and `field` for string and string[], `word` (default) for text and text[]. Not supported for remaining data types
    string tokenization?;
};

# Delete Objects response.
public type BatchDeleteResponse record {
    # Outlines how to find the objects to be deleted.
    BatchDelete_match 'match?;
    # Controls the verbosity of the output, possible values are: "minimal", "verbose". Defaults to "minimal".
    string output?;
    # If true, objects will not be deleted yet, but merely listed. Defaults to false.
    boolean dryRun?;
    # Results due to the deletion operation
    BatchDeleteResponse_results results?;
};

# Outlines how to find the objects to be deleted.
public type BatchDelete_match record {
    # Class (name) which objects will be deleted.
    string 'class?;
    # Filter search results using a where filter
    WhereFilter 'where?;
};

public type ErrorResponse_error record {
    string message?;
};

# Configure how replication is executed in a cluster
public type ReplicationConfig record {
    # Number of times a class is replicated
    int factor?;
};

# A Vector in the Contextionary
public type C11yVector float[];

# This is an open object, with OpenAPI Specification 3.0 this will be more detailed. See Weaviate docs for more info. In the future this will become a key/value OR a SingleRef definition.
public type PropertySchema record {
};

# GraphQL based response: http://facebook.github.io/graphql/.
public type GraphQLResponse record {
    # GraphQL data object.
    record {|JsonObject...;|} data?;
    # Array with errors.
    GraphQLError[]? errors = ();
};

# filter within a distance of a georange
public type WhereFilterGeoRange record {
    # GeoCoodinates based on longitute and latitude
    GeoCoordinates geoCoordinates?;
    # distace based on geoCoordinates
    WhereFilterGeoRange_distance distance?;
};

# Multiple instances of references to other objects.
public type MultipleRef SingleRef[];

# An error response given by Weaviate end-points.
public type ErrorResponse record {
    # List of errors
    ErrorResponse_error[] 'error?;
};

# GraphQL query based on: http://facebook.github.io/graphql/.
public type GraphQLQuery record {
    # The name of the operation if multiple exist in the query.
    string operationName?;
    # Query based on GraphQL syntax.
    string query?;
    # Additional variables for the query.
    record {} variables?;
};

# A list of GraphQL responses.
public type GraphQLResponses GraphQLResponse[];

# This meta field contains additional info about the classified reference property
public type ReferenceMetaClassification record {
    # overall neighbors checked as part of the classification. In most cases this will equal k, but could be lower than k - for example if not enough data was present
    int overallCount?;
    # size of the winning group, a number between 1..k
    int winningCount?;
    # size of the losing group, can be 0 if the winning group size euqals k
    int losingCount?;
    # The lowest distance of any neighbor, regardless of whether they were in the winning or losing group
    float closestOverallDistance?;
    # deprecated - do not use, to be removed in 0.23.0
    float winningDistance?;
    # Mean distance of all neighbors from the winning group
    float meanWinningDistance?;
    # Closest distance of a neighbor from the winning group
    float closestWinningDistance?;
    # The lowest distance of a neighbor in the losing group. Optional. If k equals the size of the winning group, there is no losing group
    float? closestLosingDistance = ();
    # deprecated - do not use, to be removed in 0.23.0
    float? losingDistance = ();
    # Mean distance of all neighbors from the losing group. Optional. If k equals the size of the winning group, there is no losing group.
    float? meanLosingDistance = ();
};

# GeoCoodinates based on longitute and latitude
public type GeoCoordinates record {
    # The latitude of the point on earth in decimal form
    float? latitude = ();
    # The longitude of the point on earth in decimal form
    float? longitude = ();
};

# List of Objects.
public type ObjectsListResponse record {
    # The actual list of Objects.
    Object[] objects?;
    # deprecations
    Deprecation[]? deprecations = ();
    # The total number of Objects for the query. The number of items in a response may be smaller due to paging.
    int totalResults?;
};

# Results for this specific Object.
public type ObjectsGetResponse_result record {
    # Object processing status
    string status?;
    # An error response given by Weaviate end-points.
    ErrorResponse errors?;
};

# distace based on geoCoordinates
public type WhereFilterGeoRange_distance record {
    # max distance
    float max?;
};

public type Class record {
    # Name of the class as URI relative to the schema URL.
    string 'class?;
    # Name of the vector index to use, eg. (HNSW)
    string? vectorIndexType = ();
    # Vector-index config, that is specific to the type of index selected in vectorIndexType
    record {}? vectorIndexConfig = ();
    # Manage how the index should be sharded and distributed in the cluster
    record {}? shardingConfig = ();
    # Configure how replication is executed in a cluster
    ReplicationConfig replicationConfig?;
    # Configure the inverted index built into Weaviate
    InvertedIndexConfig invertedIndexConfig?;
    # Specify how the vectors for this class should be determined. The options are either 'none' - this means you have to import a vector with each object yourself - or the name of a module that provides vectorization capabilities, such as 'text2vec-contextionary'. If left empty, it will use the globally configured default which can itself either be 'none' or a specific module.
    string? vectorizer = ();
    # Configuration specific to modules this Weaviate instance has installed
    record {}? moduleConfig = ();
    # Description of the class.
    string? description = ();
    # The properties of the class.
    Property[]? properties = ();
};

public type Object record {
    # Class of the Object, defined in the schema.
    string 'class?;
    # Allow custom overrides of vector weights as math expressions. E.g. "pancake": "7" will set the weight for the word pancake to 7 in the vectorization, whereas "w * 3" would triple the originally calculated word. This is an open object, with OpenAPI Specification 3.0 this will be more detailed. See Weaviate docs for more info. In the future this will become a key/value (string/string) object.
    VectorWeights? vectorWeights = ();
    # This is an open object, with OpenAPI Specification 3.0 this will be more detailed. See Weaviate docs for more info. In the future this will become a key/value OR a SingleRef definition.
    PropertySchema properties?;
    # ID of the Object.
    string id?;
    # Timestamp of creation of this Object in milliseconds since epoch UTC.
    int creationTimeUnix?;
    # Timestamp of the last Object update in milliseconds since epoch UTC.
    int lastUpdateTimeUnix?;
    # A Vector in the Contextionary
    C11yVector vector?;
    # Additional Meta information about a single object object.
    AdditionalProperties additional?;
};

public type GraphQLError_locations record {
    int column?;
    int line?;
};

# tuning parameters for the BM25 algorithm
public type BM25Config record {
    # calibrates term-weight scaling based on the term frequency within a document
    float k1?;
    # calibrates term-weight scaling based on the document length
    float b?;
};
