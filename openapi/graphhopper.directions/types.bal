// Copyright (c) 2021 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `key`
    @display {label: "", kind: "password"}
    string key;
|};

public type Address record {
    # Specifies the id of the location.
    string location_id;
    # Name of location.
    string name?;
    # Longitude of location.
    float lon;
    # Latitude of location.
    float lat;
    # Optional parameter. Specifies a hint for each address to better snap the coordinates (lon,lat) to road network. E.g. if there is an address or house with two or more neighboring streets you can control for which street the closest location is looked up.
    string street_hint?;
    # Optional parameter. Specifies on which side a point should be relative to the driver when she leaves/arrives at a start/target/via point. Only supported for motor vehicles and OpenStreetMap.
    string curbside?;
};

# Specifies general configurations that are taken into account when solving the vehicle routing problem.
public type Configuration record {
    # This contains all routing specific configurations.
    Routing routing?;
};

public type RoutePoint record {
    string 'type?;
    record {}[] coordinates?;
};

public type TimeWindowBreak record {
    # Specifies the earliest start time of the break in seconds.
    int earliest;
    # Specifies the latest start time of break in seconds.
    int latest;
    # Specifies the duration of the break in seconds.
    int duration;
};

public type Stop record {
    Address address?;
    # Specifies the duration of the pickup or delivery in seconds, e.g. how long it takes unload items at the customer site.
    int duration?;
    # Specifies the preparation time in seconds. It can be used to model parking lot search time since if you have 3 identical locations in a row, it only falls due once.
    int preparation_time?;
    # Specifies an array of time window objects (see time window object below). For example, if an item needs to be delivered between 7am and 10am then specify the array as follows: [ { "earliest": 25200, "latest" : 32400 } ] (starting the day from 0 in seconds).
    TimeWindow[] time_windows?;
    # Group this stop belongs to. See the group relation and [this post](https://discuss.graphhopper.com/t/4040) on how to utilize this.
    string 'group?;
};

public type ClusterRequest record {
    ClusterConfiguration configuration?;
    ClusterCustomer[] customers?;
};

public type GeocodingResponse record {
    GeocodingLocation[] hits?;
    # in ms
    int took?;
};

public type Activity record {
    # type of activity
    string 'type?;
    # Id referring to the underlying service or shipment, i.e. the shipment or service this activity belongs to
    string id?;
    # Id that refers to address
    string location_id?;
    # Address of activity
    ResponseAddress address?;
    # Arrival time at this activity in seconds. If type is `start`, this is not available (since it makes no sense to have `arr_time` at start). However, `end_time` is available and actually means \"departure time\" at start location. It is important to note that `arr_time` does not necessarily mean \"start of underlying activity\", it solely means arrival time at activity location. If this activity has no time windows and if there are no further preparation times, `arr_time` is equal to activity start time.
    int arr_time?;
    # End time of and thus departure time at this activity. If type is `end`, this is not available (since it makes no sense to have an `end_time` at end) `end_time` at each activity is equal to the departure time at the activity location.
    int end_time?;
    # End date time with offset like this 1970-01-01T01:00+01:00. If you do not use time-dependent optimization, this is `null`.
    string end_date_time?;
    # Arrival date time with offset like this 1970-01-01T01:00+01:00. If you do not use time-dependent optimization, this is `null`.
    string arr_date_time?;
    # Waiting time at this activity in seconds. A waiting time can occur if the activity has at least one time window. If `arr_time` < `time_window.earliest` a waiting time of `time_window_earliest` - `arr_time` occurs.
    int waiting_time?;
    # preparation time at this activity in seconds
    int preparation_time?;
    # cumulated distance from start to this activity in m
    int distance?;
    # cumulated driving time from start to this driver activity in seconds
    int driving_time?;
    # Array with size/capacity dimensions before this activity
    int[] load_before?;
    # Array with size/capacity dimensions after this activity
    int[] load_after?;
};

public type GherrorHints record {
    string message?;
};

public type Vehicle record {
    # Specifies the ID of the vehicle. Ids must be unique, i.e. if there are two vehicles with the same ID, an error is returned.
    string vehicle_id;
    # The type ID assigns a vehicle type to this vehicle. You can specify types in the array of vehicle types. If you omit the type ID, the default type is used. The default type is a `car` with a capacity of 0.
    string type_id?;
    Address start_address;
    Address end_address?;
    TimeWindowBreak|DriveTimeBreak 'break?;
    # If it is false, the algorithm decides where to end the vehicle route. It ends in one of your customers' locations. The end is chosen such that it contributes to the overall objective function, e.g. min transport_time. If it is true, you can either specify a specific end location (which is then regarded as end depot) or you can leave it and the driver returns to its start location.
    boolean return_to_depot?;
    # Earliest start of vehicle in seconds. It is recommended to use the unix timestamp.
    int earliest_start?;
    # Latest end of vehicle in seconds, i.e. the time the vehicle needs to be at its end location at latest.
    int latest_end?;
    # Array of skills, i.e. array of string (not case sensitive).
    string[] skills?;
    # Specifies the maximum distance (in meters) a vehicle can go.
    int max_distance?;
    # Specifies the maximum drive time (in seconds) a vehicle/driver can go, i.e. the maximum time on the road (service and waiting times are not included here)
    int max_driving_time?;
    # Specifies the maximum number of jobs a vehicle can load.
    int max_jobs?;
    # Specifies the minimum number of jobs a vehicle should load. This is a soft constraint, i.e. if it is not possible to fulfill “min_jobs”, we will still try to get as close as possible to this constraint.
    int min_jobs?;
    # Specifies the maximum number of activities a vehicle can conduct.
    int max_activities?;
    # Indicates whether a vehicle should be moved even though it has not been assigned any jobs.
    boolean move_to_end_address?;
};

public type GroupRelation record {
    # Specifies the type of relation. It must be either of type - in_sequence or in_direct_sequence.
    string 'type;
    # An array of groups that should be related
    string[] groups;
};

public type GeocodingPoint record {
    # Latitude
    float lat?;
    # Longitude
    float lng?;
};

# Polygon details
public type Polygon record {
    # Type
    string 'type?;
    # Coordinates
    decimal[][][] coordinates?;
};

public type GHError record {
    string message?;
    # Optional error information.
    GherrorHints[] hints?;
};

public type Route record {
    # Id of vehicle that operates route
    string vehicle_id?;
    # Distance of route in meter
    int distance?;
    # Transport time of route in seconds
    int transport_time?;
    # Completion time of route in seconds
    int completion_time?;
    # Waiting time of route in seconds
    int waiting_time?;
    # Service duration of route in seconds
    int service_duration?;
    # Preparation time of route in seconds
    int preparation_time?;
    # Array of activities
    Activity[] activities?;
    # Array of route planning points
    RoutePoint[] points?;
};

# Additional information for your request
public type ResponseInfo record {
    # Attribution according to our documentation is necessary if no white-label option included.
    string[] copyrights?;
    # Took value
    float took?;
};

# Polygon properties
public type IsochroneresponsepolygonProperties record {
    # Bucket detail
    int bucket?;
};

public type RouteRequest record {
    # The points for the route in an array of `[longitude,latitude]`. For instance, if you want to calculate a route from point A to B to C
    # then you specify `points: [ [A_longitude, A_latitude], [B_longitude, B_latitude], [C_longitude, C_latitude]]`
    decimal[][] points?;
    # Optional parameter. Specifies a hint for each point in the `points` array to prefer a certain street for the closest location lookup. E.g. if there is an address or house with two or more neighboring streets you can control for which street the closest location is looked up.
    string[] point_hints?;
    # Optional parameter to avoid snapping to a certain road class or road environment. Current supported values `motorway`, `trunk`, `ferry`, `tunnel`, `bridge` and `ford`
    string[] snap_preventions?;
    # Optional parameter. It specifies on which side a point should be relative to the driver when she leaves/arrives at a start/target/via point. You need to specify this parameter for either none or all points. Only supported for motor vehicles and OpenStreetMap.
    string[] curbsides?;
    # The vehicle profile for which the route should be calculated. Other vehicles are listed [here](#section/Map-Data-and-Routing-Profiles/OpenStreetMap) for the details.
    string vehicle?;
    # The locale of the resulting turn instructions. E.g. `pt_PT` for Portuguese or `de` for German.
    string locale?;
    # If `true`, a third coordinate, the altitude, is included with all positions in the response.
    # This changes the format of the `points` and `snapped_waypoints` fields of the response, in both their
    # encodings. Unless you switch off the `points_encoded` parameter, you need special code on the
    # client side that can handle three-dimensional coordinates.
    # A request can fail if the vehicle profile does not support elevation. See the features object for every vehicle profile.
    boolean elevation?;
    # Optional parameter to retrieve path details. You can request additional details for the route: `street_name`,
    # `time`, `distance`, `max_speed`, `toll`, `road_class`, `road_class_link`, `road_access`, `road_environment`, `lanes`, and `surface`. Read more about the usage of path details [here](https://discuss.graphhopper.com/t/2539).
    string[] details?;
    # Normally, the calculated route will visit the points in the order you specified them.
    # If you have more than two points, you can set this parameter to `"true"` and the points may be re-ordered to minimize the total travel time.
    # Keep in mind that the limits on the number of locations of the Route Optimization API applies, and the request costs more credits.
    string optimize?;
    # If instructions should be calculated and returned
    boolean instructions?;
    # If the points for the route should be calculated at all.
    boolean calc_points?;
    # If `true`, the output will be formatted.
    boolean debug?;
    # Allows changing the encoding of location data in the response. The default is polyline encoding, which is compact
    # but requires special client code to unpack. (We provide it in our JavaScript client library!)
    # Set this parameter to `false` to switch the encoding to simple coordinate pairs like `[lon,lat]`, or `[lon,lat,elevation]`.
    # See the description of the response format for more information.
    boolean points_encoded?;
    # Use this parameter in combination with one or more parameters from below.
    boolean 'ch\.disable?;
    # Determines the way the ''best'' route is calculated. Default is `fastest`. Other options are `shortest` (e.g. for `vehicle=foot` or `bike`) and `short_fastest` which finds a reasonable balance between `shortest` and `fastest`. Requires `ch.disable=true`.
    string weighting?;
    # Favour a heading direction for a certain point. Specify either one heading for the start point or as many as there are points.
    # In this case headings are associated by their order to the specific points. Headings are given as north based clockwise angle between 0 and 360 degree.
    # This parameter also influences the tour generated with `algorithm=round_trip` and forces the initial direction.  Requires `ch.disable=true`.
    int[] headings?;
    # Time penalty in seconds for not obeying a specified heading. Requires `ch.disable=true`.
    int heading_penalty?;
    # If `true`, u-turns are avoided at via-points with regard to the `heading_penalty`. Requires `ch.disable=true`.
    boolean pass_through?;
    # Block road access via a point with the format `latitude,longitude`
    # or an area defined by a circle `lat,lon,radius` or a rectangle `lat1,lon1,lat2,lon2`.
    # Separate several values with `;`. Requires `ch.disable=true`.
    string block_area?;
    # Specify which road classes and environments you would like to avoid.
    # Possible values are `motorway`, `steps`, `track`, `toll`, `ferry`, `tunnel` and `bridge`.
    # Separate several values with `;`. Obviously not all the values make sense for all vehicle profiles e.g. `bike` is already forbidden on a `motorway`. Requires `ch.disable=true`.
    string avoid?;
    # Rather than looking for the shortest or fastest path, this lets you solve two different problems related to routing:
    # With `round_trip`, the route will get you back to where you started. This is meant for fun (think of
    # a bike trip), so we will add some randomness. This requires `ch.disable=true`.
    # With `alternative_route`, we give you not one but several routes that are close to optimal, but
    # not too similar to each other. You can control both of these features with additional parameters, see below.
    string algorithm?;
    # If `algorithm=round_trip`, this parameter configures approximative length of the resulting round trip. Requires `ch.disable=true`.
    int 'round\_trip\.distance?;
    # If `algorithm=round_trip`, this sets the random seed. Change this to get a different tour for each value.
    int 'round\_trip\.seed?;
    # If `algorithm=alternative_route`, this parameter sets the number of maximum paths which should be calculated. Increasing can lead to worse alternatives.
    int 'alternative\_route\.max\_paths?;
    # If `algorithm=alternative_route`, this parameter sets the factor by which the alternatives routes can be longer than the optimal route. Increasing can lead to worse alternatives.
    decimal 'alternative\_route\.max\_weight\_factor?;
    # If `algorithm=alternative_route`, this parameter specifies how similar an alternative route can be to the optimal route. Increasing can lead to worse alternatives.
    decimal 'alternative\_route\.max\_share\_factor?;
};

public type SymmetricalMatrixRequest record {
    # Specify multiple points for which the weight-, route-, time- or distance-matrix should be calculated as follows: `[longitude,latitude]`. In this case the origins are identical to the destinations. Thus, if there are N points, NxN entries are calculated. The order of the point parameter is important. Specify at least three points. Cannot be used together with `from_point` or `to_point.`.
    decimal[][] points?;
    # Optional parameter. Specifies a hint for each point in the `points` array to prefer a certain street for the closest location lookup. E.g. if there is an address or house with two or more neighboring streets you can control for which street the closest location is looked up.
    string[] point_hints?;
    # Optional parameter to avoid snapping to a certain road class or road environment. Current supported values `motorway`, `trunk`, `ferry`, `tunnel`, `bridge` and `ford`
    string[] snap_preventions?;
    # Optional parameter. It specifies on which side a point should be relative to the driver when she leaves/arrives at a start/target/via point. You need to specify this parameter for either none or all points. Only supported for motor vehicles and OpenStreetMap.
    string[] curbsides?;
    # Specifies which matrices should be included in the response. Specify one or more of the following options `weights`, `times`, `distances`. The units of the entries of `distances` are meters, of `times` are seconds and of `weights` is arbitrary and it can differ for different vehicles or versions of this API.
    string[] out_arrays?;
    # The vehicle profile for which the route should be calculated. Other vehicles are listed [here](#section/Map-Data-and-Routing-Profiles/OpenStreetMap) for the details.
    string vehicle?;
    # Specifies whether or not the matrix calculation should return with an error as soon as possible in case some points cannot be found or some points are not connected. If set to `false` the time/weight/distance matrix will be calculated for all valid points and contain the `null` value for all entries that could not be calculated. The `hint` field of the response will also contain additional information about what went wrong (see its documentation).
    boolean fail_fast?;
    # Specifies if turn restrictions should be considered. Enabling this option increases the matrix computation time. Only supported for motor vehicles and OpenStreetMap.
    boolean turn_costs?;
};

public type Shipment record {
    # Specifies the id of the shipment. Ids need to be unique so there must not be two services/shipments with the same id.
    string id;
    # Meaningful name for shipment, e.g. "pickup and deliver pizza to Peter".
    string name?;
    # Specifies the priority. Can be 1 = high priority to 10 = low priority. Often there are more services/shipments than the available vehicle fleet can handle. Then you can set priorities to differentiate high priority tasks from those that could be left unassigned. I.e. the lower the priority the earlier these tasks are omitted in the solution.
    int priority?;
    Stop pickup;
    Stop delivery;
    # Size can have multiple dimensions and should be in line with the capacity dimension array of the vehicle type. For example, if the item that needs to be delivered has two size dimension, volume and weight, then specify it as follow [ 20, 5 ] assuming a volume of 20 and a weight of 5.
    int[] size?;
    # Specifies an array of required skills, i.e. array of string (not case sensitive). For example, if this shipment needs to be conducted by a technician having a `drilling_machine` and a `screw_driver` then specify the array as follows: `["drilling_machine","screw_driver"]`. This means that the service can only be done by a vehicle (technician) that has the skills `drilling_machine` AND `screw_driver` in its skill array. Otherwise it remains unassigned.
    string[] required_skills?;
    # Specifies an array of allowed vehicles, i.e. array of vehicle ids. For example, if this shipment can only be conducted EITHER by "technician_peter" OR "technician_stefan" specify this as follows: ["technician_peter","technician_stefan"].
    string[] allowed_vehicles?;
    # Specifies an array of disallowed vehicles, i.e. array of vehicle ids.
    string[] disallowed_vehicles?;
    # Specifies the maximum time in seconds a shipment can stay in the vehicle.
    int max_time_in_vehicle?;
};

# Address of activity
public type ResponseAddress record {
    # Specifies the id of the location.
    string location_id?;
    # Name of location.
    string name?;
    # Longitude of location.
    float lon?;
    # Latitude of location.
    float lat?;
    # Optional parameter. Specifies a hint for each address to better snap the coordinates (lon,lat) to road network. E.g. if there is an address or house with two or more neighboring streets you can control for which street the closest location is looked up.
    string street_hint?;
    # Access point to the (road)network. It is only available if `return_snapped_waypoints` is true (be default it is false).
    SnappedWaypoint snapped_waypoint?;
};

# Access point to the (road)network. It is only available if `return_snapped_waypoints` is true (be default it is false).
public type SnappedWaypoint record {
    # Longitude of location.
    float lon?;
    # Latitude of location.
    float lat?;
};

# Use `objectives` instead.
# 
# # Deprecated
@deprecated
public type Algorithm record {
    # Problem type
    string problem_type?;
    # Objective type
    string objective?;
};

public type BadRequest record {
    # Short error message
    string message?;
    # Optional error information.
    ErrorMessage[] hints?;
    # status
    string status?;
};

public type Objective record {
    # Type of objective function, i.e. `min` or `min-max`.
    # 
    #  * `min`: Minimizes the objective value.
    #  * `min-max`: Minimizes the maximum objective value.
    # 
    # For instance, `min` -> `vehicles` minimizes the number of employed vehicles.
    # `min` -> `completion_time` minimizes the sum of your vehicle routes' completion time.
    # 
    # If you use, for example, `min-max` -> `completion_time`, it minimizes the maximum of your vehicle routes' completion time, i.e. it minimizes the overall makespan.
    # This only makes sense if you have more than one vehicle. In case of one vehicle, switching from `min` to `min-max` should not have any impact.
    # If you have more than one vehicle, then the algorithm tries to constantly move stops from one vehicle to another such that
    # the completion time of longest vehicle route can be further reduced. For example, if you have one vehicle that takes 8 hours
    # to serve all customers, adding another vehicle (and using `min-max`) might halve the time to serve all customers to 4 hours. However,
    # this usually comes with higher transport costs.
    # 
    # If you want to minimize `vehicles` first and, second, `completion_time`, you can also combine different objectives like this:
    # 
    # ```json
    # "objectives" : [
    #    {
    #       "type": "min",
    #       "value": "vehicles"
    #    },
    #    {
    #       "type": "min",
    #       "value": "completion_time"
    #    }
    # ]
    # ```
    # 
    # If you want to balance activities or the number of stops among all employed drivers, you need to specify it as follows:
    # 
    # ```json
    # "objectives" : [
    #    {
    #       "type": "min-max",
    #       "value": "completion_time"
    #    },
    #    {
    #       "type": "min-max",
    #       "value": "activities"
    #    }
    # ]
    # ```
    string 'type;
    # The value of the objective function.
    # The objective value `transport_time` solely considers the time
    # your drivers spend on the road, i.e. transport time. In contrary to `transport_time`, `completion_time` also takes waiting times at customer sites into account.
    # The `completion_time` of a route is defined as the time from starting to ending the route,
    # i.e. the route's transport time, the sum of waiting times plus the sum of activity durations.
    # Note that choosing `transport_time` or `completion_time` only makes a difference if you specified time windows for your services/shipments since only in
    # scenarios with time windows waiting times can occur.
    # The objective value `vehicles` can only be used along with `min` and minimizes vehicles.
    string value;
};

public type MatrixResponse record {
    # The distance matrix for the specified points in the same order as the time matrix. The distances are in meters. If `fail_fast=false` the matrix will contain `null` for connections that could not be found.
    decimal[][] distances?;
    # The time matrix for the specified points in the order [[from1->to1, from1->to2, ...], [from2->to1, from2->to2, ...], ...]. The times are in seconds. If `fail_fast=false` the matrix will contain `null` for connections that could not be found.
    decimal[][] times?;
    # The weight matrix for the specified points in the same order as the time matrix. The weights for different vehicles can have a different unit but the weights array is perfectly suited as input for Vehicle Routing Problems as it is currently faster to calculate. If `fail_fast=false` the matrix will contain `null` for connections that could not be found.
    decimal[][] weights?;
    # Additional information for your request
    ResponseInfo info?;
    # Optional. Additional response data.
    MatrixresponseHints[] hints?;
};

public type ClusterCustomerAddress record {
    # Longitude
    float lon?;
    # Latitude
    float lat?;
    # Optional parameter. Specifies a hint for each address to better snap the coordinates (lon,lat) to road network. E.g. if there is an address or house with two or more neighboring streets you can control for which street the closest location is looked up.
    string street_hint?;
};

public type ClusterConfigurationClustering record {
    # Specifies the number of clusters
    int num_clusters?;
    # Specifies max. quantity in a cluster
    int max_quantity?;
    # Specifies min. quantity in a cluster
    int min_quantity?;
};

public type Detail record {
    # Id of unassigned service/shipment
    string id?;
    # Reason code
    # 
    # Code   |  Reason
    # :------|:---------
    # 1 | cannot serve required skill
    # 2 | cannot be visited within time window
    # 3 | does not fit into any vehicle due to capacity
    # 4 | cannot be assigned due to max distance constraint of vehicles
    # 21 | could not be assigned due to relation constraint
    # 22 | could not be assigned due to allowed vehicle constraint
    # 23 | could not be assigned due to max-time-in-vehicle constraint
    # 24 | driver does not need a break
    # 25 | could not be assigned due to disallowed vehicle constraint
    # 26 | could not be assigned due to max drive time constraint
    # 27 | could not be assigned due to max job constraint
    # 28 | could not be assigned due to max activity constraint
    # 50 | underlying location cannot be accessed over road network by at least one vehicle
    int code?;
    # Human readable reason as listed above
    string reason?;
};

# Information about the server and the geographical area that it covers.
public type InfoResponse record {
    # The version of the GraphHopper server that provided this response. This is not related to the API version.
    string 'version?;
    # The bounding box of the geographical area covered by this GraphHopper instance. Format: `"minLon,minLat,maxLon,maxLat"`
    string bbox?;
    # The supported features, such as elevation, per vehicle profile.
    record {} features?;
};

public type RouteresponsepathInstructions record {
    # A description what the user has to do in order to follow the route. The language depends on the locale parameter.
    string text?;
    # The name of the street to turn onto in order to follow the route.
    string street_name?;
    # The distance for this instruction, in meters.
    float distance?;
    # The duration for this instruction, in milliseconds.
    int time?;
    # Two indices into `points`, referring to the beginning and the end of the segment of the route
    # this instruction refers to.
    int[] interval?;
    # A number which specifies the sign to show:
    # 
    # | sign | description  |
    # |---|---|
    # |-98| an U-turn without the knowledge if it is a right or left U-turn |
    # | -8| a left U-turn |
    # | -7| keep left |
    # | -6| **not yet used**: leave roundabout |
    # | -3| turn sharp left |
    # | -2| turn left |
    # | -1| turn slight left |
    # |  0| continue on street |
    # |  1| turn slight right |
    # |  2| turn right |
    # |  3| turn sharp right |
    # |  4| the finish instruction before the last point |
    # |  5| the instruction before a via point |
    # |  6| the instruction before entering a roundabout |
    # |  7| keep right |
    # |  8| a right U-turn |
    # |  *| **For future compatibility** it is important that all clients are able to handle also unknown instruction sign numbers
    int sign?;
    # Only available for roundabout instructions (sign is 6). The count of exits at which the route leaves the roundabout.
    int exit_number?;
    # Only available for roundabout instructions (sign is 6). The radian of the route within the roundabout `0 < r < 2*PI` for clockwise and
    # `-2*PI < r < 0` for counterclockwise turns.
    float turn_angle?;
};

public type ClusterConfiguration record {
    # Specifies the response format. You can either choose `geojson` or `json`.
    string response_type?;
    ClusterConfigurationRouting routing?;
    ClusterConfigurationClustering clustering?;
};

# JSON data of matrix response
public type CostmatrixData record {
    # Times values
    int[][] times?;
    # Distances
    decimal[][] distances?;
    # Additional information for your request
    CostmatrixDataInfo info?;
};

public type JobRelation record {
    # Specifies the type of relation. It must be either of type - `in_same_route`, `in_sequence` or `in_direct_sequence`.
    # 
    # `in_same_route`: As the name suggest, it enforces the specified services or shipments to be in the same route. It can be specified as follows:
    # 
    # ```json
    # {
    #    "type": "in_same_route",
    #    "ids": ["serv_i_id","serv_j_id"]
    # }
    # ```
    # 
    # This enforces service i to be in the same route as service j no matter which vehicle will be employed. If a specific vehicle (driver) is required to conduct this, just add a `vehicle_id` like this:
    # 
    # ```
    # {
    #    "type": "in_same_route",
    #    "ids": ["serv_i_id","serv_j_id"],
    #    "vehicle_id": "vehicle1"
    # }
    # ```
    # 
    # This not only enforce service i and j to be in the same route, but also makes sure that both services are in the route of `vehicle1`.
    # 
    # *Tip*: This way initial loads and vehicle routes can be modelled. For example, if your vehicles are already on the road and new orders come in, then vehicles can still be rescheduled subject to the orders that have already been assigned to these vehicles.
    # 
    # 
    # 
    # `in_sequence`: This relation type enforces n jobs to be in sequence. It can be specified as
    # 
    # ```json
    # {
    #    "type": "in_sequence",
    #    "ids": ["serv_i_id","serv_j_id"]
    # }
    # ```
    # 
    # which means that service j need to be in the same route as service i AND it needs to occur somewhere after service i. As described above if a specific vehicle needs to conduct this, just add `vehicle_id`.
    # 
    # 
    # `in_direct_sequence`: This enforces n services or shipments to be in direct sequence. It can be specified as
    # 
    # ```json
    # {
    #    "type": "in_direct_sequence",
    #    "ids": ["serv_i_id","serv_j_id","serv_k_id"]
    # }
    # ```
    # 
    # yielding service j to occur directly after service i, and service k to occur directly after service j i.e. in strong order. Again, a vehicle can be assigned a priority by adding a `vehicle_id` to the relation.
    # 
    # 
    # *Special IDs*:
    # If you look at the previous example and you want service i to be the first in the route, use the special ID `start` as follows:
    # 
    # ```json
    # {
    #    "type": "in_direct_sequence",
    #    "ids": ["start","serv_i_id","serv_j_id","serv_k_id"]
    # }
    # ```
    # 
    # Latter enforces the direct sequence of i, j and k at the beginning of the route. If this sequence should be bound to the end of the route, use the special ID `end` like this:
    # 
    # ```json
    # {
    #    "type": "in_direct_sequence",
    #    "ids": ["serv_i_id","service_j_id","serv_k_id","end"]
    # }
    # ```
    # 
    # If you deal with services then you need to use the 'id' of your services in the field 'ids'. To also consider sequences of the pickups and deliveries of your shipments, you need to use a special ID, i.e. use the shipment id plus the keyword `_pickup` or `_delivery`. For example, to ensure that the pickup and delivery of the shipment with the id 'my_shipment' are direct neighbors, you need the following specification:
    # 
    # ```
    # {
    #    "type": "in_direct_sequence",
    #    "ids": ["my_ship_pickup","my_ship_delivery"]
    # }
    # ```
    string 'type;
    # Specifies an array of shipment and/or service ids that are in relation. If you deal with services then you need to use the id of your services in ids. To also consider sequences of the pickups and deliveries of your shipments, you need to use a special ID, i.e. use your shipment id plus the keyword `_pickup` or `_delivery`. If you want to place a service or shipment activity at the beginning of your route, use the special ID `start`. In turn, use `end` to place it at the end of the route.
    string[] ids;
    # Id of pre-assigned vehicle, i.e. the vehicle id that is determined to conduct the services and shipments in this relation.
    string vehicle_id?;
};

public type  MatrixCalculateBody MatrixRequest|SymmetricalMatrixRequest;

public type InlineResponse404 record {
    # Error message
    string message?;
    # status
    string status?;
};

public type ClusterConfigurationRouting record {
    # The routing profile for which the travel times and distances should be calculated. Other profiles are listed [here](#section/Map-Data-and-Routing-Profiles/OpenStreetMap)
    string profile?;
    # Cost per second (travel time)
    float cost_per_second?;
    # Cost per meter (travel distance)
    float cost_per_meter?;
};

public type RouteResponse record {
    RouteResponsePath[] paths?;
    # Additional information for your request
    ResponseInfo info?;
};

public type InternalErrorMessage record {
    int code?;
    # Details
    string message?;
};

public type  MatrixBody MatrixRequest|SymmetricalMatrixRequest;

# Additional information for your request
public type CostmatrixDataInfo record {
    # Copyright details
    string[] copyrights?;
    # Took value
    float took?;
};

public type MatrixRequest record {
    # The starting points for the routes in an array of `[longitude,latitude]`. For instance, if you want to calculate three routes from point A such as A->1, A->2, A->3 then you have one `from_point` parameter and three `to_point` parameters.
    decimal[][] from_points?;
    # The destination points for the routes in an array of `[longitude,latitude]`.
    decimal[][] to_points?;
    # See `point_hints`of symmetrical matrix
    string[] from_point_hints?;
    # See `point_hints`of symmetrical matrix
    string[] to_point_hints?;
    # See `snap_preventions` of symmetrical matrix
    string[] snap_preventions?;
    # See `curbsides`of symmetrical matrix
    string[] from_curbsides?;
    # See `curbsides`of symmetrical matrix
    string[] to_curbsides?;
    # Specifies which matrices should be included in the response. Specify one or more of the following options `weights`, `times`, `distances`. The units of the entries of `distances` are meters, of `times` are seconds and of `weights` is arbitrary and it can differ for different vehicles or versions of this API.
    string[] out_arrays?;
    # The vehicle profile for which the route should be calculated. Other vehicles are listed [here](#section/Map-Data-and-Routing-Profiles/OpenStreetMap) for the details.
    string vehicle?;
    # Specifies whether or not the matrix calculation should return with an error as soon as possible in case some points cannot be found or some points are not connected. If set to `false` the time/weight/distance matrix will be calculated for all valid points and contain the `null` value for all entries that could not be calculated. The `hint` field of the response will also contain additional information about what went wrong (see its documentation).
    boolean fail_fast?;
    # Specifies if turn restrictions should be considered. Enabling this option increases the matrix computation time. Only supported for motor vehicles and OpenStreetMap.
    boolean turn_costs?;
};

public type MatrixresponseHints record {
    # Short description of this hint
    string message?;
    # Details of this hint
    string details?;
    # Optional. An array of from_point indices of points that could not be found. Will only be added if `fail_fast=false` and some `from_point`s were not found.
    decimal[] invalid_from_points?;
    # Optional. An array of to_point indices of points that could not be found. Will only be added if `fail_fast=false` and some `to_point`s were not found.
    decimal[] invalid_to_points?;
    # Optional. An array of two-element arrays representing the from/to_point indices of points for which no connection could be found. Will only be added if `fail_fast=false` and some connections were not found.
    decimal[][] point_pairs?;
};

public type JobId record {
    # UUID. Unique id for your job/request with which you can fetch your solution
    string job_id?;
};

# Only available if status field indicates `finished`.
public type Solution record {
    # The cost
    int costs?;
    # Overall distance travelled in meter, i.e. the sum of each route's transport distance
    int distance?;
    # Use `transport_time` instead.
    int time?;
    # Overall time travelled in seconds, i.e. the sum of each route's transport time.
    int transport_time?;
    # Operation time of longest route in seconds.
    int max_operation_time?;
    # Overall waiting time in seconds.
    int waiting_time?;
    # Overall service time in seconds.
    int service_duration?;
    # Overall preparation time in seconds.
    int preparation_time?;
    # Overall completion time in seconds, i.e. the sum of each routes/drivers operation time.
    int completion_time?;
    # Number of employed vehicles.
    int no_vehicles?;
    # Number of jobs that could not be assigned to final solution.
    int no_unassigned?;
    # An array of routes
    Route[] routes?;
    # Unassigned details
    SolutionUnassigned unassigned?;
};

public type CostMatrix record {
    # type of cost matrix, currently default or google are supported
    string 'type?;
    string[] location_ids?;
    # JSON data of matrix response
    CostmatrixData data?;
    # vehicle profile or empty if catch all fallback
    string profile?;
};

public type IsochroneResponse record {
    # The list of polygons in GeoJson format. It can be used e.g. in the Leaflet framework:
    # 
    # ```
    # L.geoJson(json.polygons).addTo(map)
    # ```
    # 
    # The number of polygon is identical to the specified buckets in the query. Every polygon contains the bucket number in the properties section of the GeoJson.
    IsochroneResponsePolygon[] polygons?;
    string[] copyrights?;
};

public type DriveTimeBreak record {
    # Specifies the duration of the break in seconds.
    int duration;
    # Specifies the max driving time (in a row) without break in seconds.
    int max_driving_time;
    # Specifies the initial (current) driving time of a driver to allow dynamic adaptations in seconds.
    int initial_driving_time?;
    # Array specifying how a break duration (in seconds) can be split into several smaller breaks
    int[] possible_split?;
};

public type GeocodingLocation record {
    GeocodingPoint point?;
    # The OSM ID of the entity
    string osm_id?;
    # N = node, R = relation, W = way
    string osm_type?;
    # The OSM key of the entity
    string osm_key?;
    # The name of the entity. Can be a boundary, POI, address, etc
    string name?;
    # The country of the address
    string country?;
    # The city of the address
    string city?;
    # The state of the address
    string state?;
    # The street of the address
    string street?;
    # The housenumber of the address
    string housenumber?;
    # The postcode of the address
    string postcode?;
};

public type ClusterCustomer record {
    # id of customer
    string id?;
    ClusterCustomerAddress address?;
    # demand of customer
    int quantity?;
};

public type Pickup record {
    *Stop;
};

public type VehicleType record {
    # Specifies the id of the vehicle type. If a vehicle needs to be of this type, it should refer to this with its type_id attribute.
    string type_id;
    # Specifies the vehicle profile of this type. The profile is used to determine the network, speed and other physical attributes to use for routing the vehicle.
    string profile?;
    # Specifies an array of capacity dimension values which need to be int values. For example, if there are two dimensions such as volume and weight then it needs to be defined as [ 1000, 300 ] assuming a maximum volume of 1000 and a maximum weight of 300.
    int[] capacity?;
    # Specifies a speed factor for this vehicle type. If the vehicle that uses this type needs to be only half as fast as what is actually calculated with our routing engine then set the speed factor to 0.5.
    float speed_factor?;
    # Specifies a service time factor for this vehicle type. If the vehicle/driver that uses this type is able to conduct the service as double as fast as it is determined in the corresponding service or shipment then set it to 0.5.
    float service_time_factor?;
    # **_BETA feature_**! Cost parameter per distance unit, here meter is used
    float cost_per_meter?;
    # **_BETA feature_**! Cost parameter per time unit, here second is used
    float cost_per_second?;
    # **_BETA feature_**! Cost parameter vehicle activation, i.e. fixed costs per vehicle
    float cost_per_activation?;
    # Specifies whether traffic should be considered. if "tomtom" is used and this is false, free flow travel times from "tomtom" are calculated. If this is true, historical traffic info are used. We do not yet have traffic data for "openstreetmap", thus, setting this true has no effect at all.
    boolean consider_traffic?;
    # Specifies the network data provider. Either use [`openstreetmap`](#section/Map-Data-and-Routing-Profiles/OpenStreetMap) (default) or [`tomtom`](#section/Map-Data-and-Routing-Profiles/TomTom) (add-on required).
    string network_data_provider?;
};

public type Request record {
    # Specifies the available vehicles.
    Vehicle[] vehicles?;
    # Specifies the available vehicle types. These types can be assigned to vehicles.
    VehicleType[] vehicle_types?;
    # Specifies the orders of the type "service". These are, for example, pick-ups, deliveries or other stops that are to be approached by the specified vehicles. Each of these orders contains only one location.
    Service[] services?;
    # Specifies the available shipments. Each shipment contains a pickup and a delivery stop, which must be processed one after the other.
    Shipment[] shipments?;
    # Defines additional relationships between orders.
    JobRelation|GroupRelation[] relations?;
    # Use `objectives` instead.
    Algorithm algorithm?;
    # Specifies an objective function. The vehicle routing problem is solved in such a way that this objective function is minimized.
    Objective[] objectives?;
    # Specifies your own tranport time and distance matrices.
    CostMatrix[] cost_matrices?;
    # Specifies general configurations that are taken into account when solving the vehicle routing problem.
    Configuration configuration?;
};

public type ClusterResponse record {
    string[] copyrights?;
    # Indicates the current status of the job
    string status?;
    float waiting_time_in_queue?;
    float processing_time?;
    Cluster[] clusters?;
};

public type Cluster record {
    # Cluster size
    int quantity?;
    # Array of customer ids assigned to this specific cluster
    string[] ids?;
};

public type Service record {
    # Specifies the id of the service. Ids need to be unique so there must not be two services/shipments with the same id.
    string id;
    # Specifies type of service. This makes a difference if items are loaded or unloaded, i.e. if one of the size dimensions > 0. If it is specified as `service` or `pickup`, items are loaded and will stay in the vehicle for the rest of the route (and thus consumes capacity for the rest of the route). If it is a `delivery`, items are implicitly loaded at the beginning of the route and will stay in the route until delivery (and thus releases capacity for the rest of the route).
    string 'type?;
    # Specifies the priority. Can be 1 = high priority to 10 = low priority. Often there are more services/shipments than the available vehicle fleet can handle. Then you can set priorities to differentiate high priority tasks from those that could be left unassigned. I.e. the lower the priority the earlier these tasks are omitted in the solution.
    int priority?;
    # Meaningful name for service, e.g. `"deliver pizza"`.
    string name?;
    Address address?;
    # Specifies the duration of the service in seconds, i.e. how long it takes at the customer site.
    int duration?;
    # Specifies the preparation time in seconds. It can be used to model parking lot search time since if you have 3 identical locations in a row, it only falls due once.
    int preparation_time?;
    # Specifies an array of time window objects (see time_window object below). Specify the time either with the recommended Unix time stamp (the number of seconds since 1970-01-01) or you can also count the seconds relative to Monday morning 00:00 and define the whole week in seconds. For example, Monday 9am is then represented by 9hour * 3600sec/hour = 32400. In turn, Wednesday 1pm corresponds to 2day * 24hour/day * 3600sec/hour + 1day * 13hour/day * 3600sec/hour = 219600. See this tutorial for more information.
    TimeWindow[] time_windows?;
    # Size can have multiple dimensions and should be in line with the capacity dimension array of the vehicle type. For example, if the item that needs to be delivered has two size dimension, volume and weight, then specify it as follow [ 20, 5 ] assuming a volume of 20 and a weight of 5.
    int[] size?;
    # Specifies an array of required skills, i.e. array of string (not case sensitive). For example, if this service needs to be conducted by a technician having a `drilling_machine` and a `screw_driver` then specify the array as follows: `["drilling_machine","screw_driver"]`. This means that the service can only be done by a vehicle (technician) that has the skills `drilling_machine` AND `screw_driver` in its skill array. Otherwise it remains unassigned.
    string[] required_skills?;
    # Specifies an array of allowed vehicles, i.e. array of vehicle ids. For example, if this service can only be conducted EITHER by `technician_peter` OR `technician_stefan` specify this as follows: `["technician_peter","technician_stefan"]`.
    string[] allowed_vehicles?;
    # Specifies an array of disallowed vehicles, i.e. array of vehicle ids.
    string[] disallowed_vehicles?;
    # Specifies the maximum time in seconds a delivery can stay in the vehicle. Currently, it only works with services of "type":"delivery".
    int max_time_in_vehicle?;
    # Group this service belongs to. See the group relation and [this post](https://discuss.graphhopper.com/t/4040) on how to utilize this.
    string 'group?;
};

# This contains all routing specific configurations.
public type Routing record {
    # It lets you specify whether the API should provide you with route geometries for vehicle routes or not. Thus, you do not need to do extra routing to get the polyline for each route.
    boolean calc_points?;
    # indicates whether historical traffic information should be considered
    boolean consider_traffic?;
    # specifies the data provider, read more about it [here](#section/Map-Data-and-Routing-Profiles).
    string network_data_provider?;
    # In some cases curbside constraints cannot be fulfilled. For example in one-way streets you cannot arrive at a building that is on the left side of the street such that the building is to the right of you (unless you drove the one-way street the wrong/illegal way). You can set the `curbside_strictness` to `soft` to ignore the curbside constraint in such cases or set it to `strict` to get an error response instead. You can also set it to `ignore` to ignore all curbside constraints (this is useful to compare the results with and without constraints without modifying every single address).
    string curbside_strictness?;
    # indicates whether matrix calculation should fail fast when points cannot be connected
    boolean fail_fast?;
    # Indicates whether a solution includes snapped waypoints. In contrary to the address coordinate a snapped waypoint is the access point to the (road) network.
    boolean return_snapped_waypoints?;
    # Prevents snapping locations to road links of specified road types, e.g. to motorway.
    string[] snap_preventions?;
};

# Unassigned details
public type SolutionUnassigned record {
    # An array of ids of unassigned services
    string[] services?;
    # An array of ids of unassigned shipments
    string[] shipments?;
    # An array of ids of unassigned breaks
    string[] breaks?;
    # An array of details, i.e. reason for unassigned services or shipments
    Detail[] details?;
};

# A found path
public type IsochroneResponsePolygon record {
    # Polygon properties
    IsochroneresponsepolygonProperties properties?;
    # Type detail
    string 'type?;
    # Polygon details
    Polygon geometry?;
};

public type VehicleProfileId string;

public type TimeWindow record {
    # Specifies the opening time of the time window in seconds, i.e. the earliest time the service can start.
    int earliest?;
    # Specifies the closing time of the time window in seconds, i.e. the latest time the service can start.
    int latest?;
};

public type Response record {
    string[] copyrights?;
    # Indicates the current status of the job
    string status?;
    # Waiting time in ms
    int waiting_time_in_queue?;
    # Processing time in ms. If job is still waiting in queue, processing_time is 0
    int processing_time?;
    # Only available if status field indicates `finished`.
    Solution solution?;
};

public type LineString record {
    string 'type?;
    # A list of coordinate pairs or triples, `[lon,lat]` or `[lon,lat,elevation]`.
    decimal[][] coordinates?;
};

# A polyline-encoded list of positions. You'll need to decode this string in client code. We provide open source code in [Java](https://github.com/graphhopper/graphhopper/blob/e649aaed8d3f4378bf2d8889bbbc2318261eabb2/web-api/src/main/java/com/graphhopper/http/WebHelper.java#L54) and [JavaScript](https://github.com/graphhopper/directions-api-js-client/blob/cf43d1a5bc93a3e8007a44fcfc551117e4fa49bc/src/GHUtil.js#L27).
public type EncodedLineString string;

public type RouteResponsePath record {
    # The total distance, in meters. To get this information for one 'leg' please read [this blog post](https://www.graphhopper.com/blog/2019/11/28/routing-api-using-path-details/).
    float distance?;
    # The total travel time, in milliseconds. To get this information for one 'leg' please read [this blog post](https://www.graphhopper.com/blog/2019/11/28/routing-api-using-path-details/).
    int time?;
    # The total ascent, in meters.
    float ascend?;
    # The total descent, in meters.
    float descend?;
    record {} points?;
    record {} snapped_waypoints?;
    # Whether the `points` and `snapped_waypoints` fields are polyline-encoded strings rather than JSON arrays
    # of coordinates. See the field description for more information on the two formats.
    boolean points_encoded?;
    # The bounding box of the route geometry. Format: `[minLon, minLat, maxLon, maxLat]`.
    decimal[] bbox?;
    # The instructions for this route. This feature is under active development, and our instructions can sometimes be misleading,
    # so be mindful when using them for navigation.
    RouteresponsepathInstructions[] instructions?;
    # Details, as requested with the `details` parameter. Consider the value `{"street_name": [[0,2,"Frankfurter Straße"],[2,6,"Zollweg"]]}`.
    # In this example, the route uses two streets: The first, Frankfurter Straße, is
    # used between `points[0]` and `points[2]`, and the second, Zollweg, between `points[2]` and `points[6]`.
    # See [here](https://discuss.graphhopper.com/t/2539) for discussion.
    record {} details?;
    # An array of indices (zero-based), specifiying the order in which the input points are visited.
    # Only present if the `optimize` parameter was used.
    int[] points_order?;
};

public type ErrorMessage record {
    # error message
    string message?;
    # Details
    string details?;
};
