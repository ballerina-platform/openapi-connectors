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

import ballerina/http;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `key`
    string key;
|};

# This is a generated connector for [GraphHopper Directions API v1.0.0](https://docs.graphhopper.com/) OpenAPI Specification. 
# 
# With the [GraphHopper Directions API](https://www.graphhopper.com/products/) you can integrate A-to-B route planning, turn-by-turn navigation,
# route optimization, isochrone calculations and other tools in your application.
@display {label: "GraphHopper Directions", iconPath: "resources/GraphHopperDirections.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [GraphHopper account](https://support.graphhopper.com/a/solutions/articles/44001976025) and obtain tokens following  [this guide](https://docs.graphhopper.com/#section/Authentication).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://graphhopper.com/api/1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # GET Route Endpoint
    #
    # + point - The points for which the route should be calculated. Format: `[latitude,longitude]`. Specify at least an origin and a destination. Via points are possible. The maximum number depends on your plan. 
    # + pointHint - The `point_hint` is typically a road name to which the associated `point` parameter should be snapped to. Specify no `point_hint` parameter or the same number as you have `point` parameters. 
    # + snapPrevention - Optional parameter to avoid snapping to a certain road class or road environment. Currently supported values are `motorway`, `trunk`, `ferry`, `tunnel`, `bridge` and `ford`. Multiple values are specified like `snap_prevention=ferry&snap_prevention=motorway`. 
    # + vehicle - The vehicle profile for which the route should be calculated. 
    # + curbside - Optional parameter. It specifies on which side a point should be relative to the driver when she leaves/arrives at a start/target/via point. You need to specify this parameter for either none or all points. Only supported for motor vehicles and OpenStreetMap. 
    # + turnCosts - Specifies if turn restrictions should be considered. Enabling this option increases the route computation time. Only supported for motor vehicles and OpenStreetMap. 
    # + locale - The locale of the resulting turn instructions. E.g. `pt_PT` for Portuguese or `de` for German. 
    # + elevation - If `true`, a third coordinate, the altitude, is included with all positions in the response. This changes the format of the `points` and `snapped_waypoints` fields of the response, in both their encodings. Unless you switch off the `points_encoded` parameter, you need special code on the client side that can handle three-dimensional coordinates. A request can fail if the vehicle profile does not support elevation. See the features object for every vehicle profile. 
    # + details - Optional parameter to retrieve path details. You can request additional details for the route: `street_name`,  `time`, `distance`, `max_speed`, `toll`, `road_class`, `road_class_link`, `road_access`, `road_environment`, `lanes`, and `surface`. Read more about the usage of path details [here](https://discuss.graphhopper.com/t/2539). 
    # + optimize - Normally, the calculated route will visit the points in the order you specified them. If you have more than two points, you can set this parameter to `"true"` and the points may be re-ordered to minimize the total travel time. Keep in mind that the limits on the number of locations of the Route Optimization API applies, and the request costs more credits. 
    # + instructions - If instructions should be calculated and returned 
    # + calcPoints - If the points for the route should be calculated at all. 
    # + debug - If `true`, the output will be formatted. 
    # + pointsEncoded - Allows changing the encoding of location data in the response. The default is polyline encoding, which is compact but requires special client code to unpack. (We provide it in our JavaScript client library!) Set this parameter to `false` to switch the encoding to simple coordinate pairs like `[lon,lat]`, or `[lon,lat,elevation]`. See the description of the response format for more information. 
    # + chDisable - Use this parameter in combination with one or more parameters from below. 
    # + weighting - Determines the way the "best" route is calculated. Besides `fastest` you can use `short_fastest` which finds a reasonable balance between the distance influence (`shortest`) and the time (`fastest`). You could also use `shortest` but is deprecated and not recommended for motor vehicles. All except `fastest` require `ch.disable=true`. 
    # + heading - Favour a heading direction for a certain point. Specify either one heading for the start point or as many as there are points. In this case headings are associated by their order to the specific points. Headings are given as north based clockwise angle between 0 and 360 degree. This parameter also influences the tour generated with `algorithm=round_trip` and forces the initial direction.  Requires `ch.disable=true`. 
    # + headingPenalty - Time penalty in seconds for not obeying a specified heading. Requires `ch.disable=true`. 
    # + passThrough - If `true`, u-turns are avoided at via-points with regard to the `heading_penalty`. Requires `ch.disable=true`. 
    # + blockArea - Block road access by specifying a point close to the road segment to be blocked, with the format `lat,lon`. You can also block all road segments crossing a geometric shape. Specify a circle using the format `lat,lon,radius`, or a polygon using the format `lat1,lon1,lat2,lon2,...,latN,lonN`. You can specify several shapes, separating them with `;`. Requires `ch.disable=true`. 
    # + avoid - Specify which road classes and environments you would like to avoid.  Possible values are `motorway`, `steps`, `track`, `toll`, `ferry`, `tunnel` and `bridge`. Separate several values with `;`. Obviously not all the values make sense for all vehicle profiles e.g. `bike` is already forbidden on a `motorway`. Requires `ch.disable=true`. 
    # + algorithm - Rather than looking for the shortest or fastest path, this parameter lets you solve two different problems related to routing: With `alternative_route`, we give you not one but several routes that are close to optimal, but not too similar to each other.  With `round_trip`, the route will get you back to where you started. This is meant for fun (think of a bike trip), so we will add some randomness. The `round_trip` option requires `ch.disable=true`. You can control both of these features with additional parameters, see below.  
    # + roundTripDistance - If `algorithm=round_trip`, this parameter configures approximative length of the resulting round trip. Requires `ch.disable=true`. 
    # + roundTripSeed - If `algorithm=round_trip`, this sets the random seed. Change this to get a different tour for each value. 
    # + alternativeRouteMaxPaths - If `algorithm=alternative_route`, this parameter sets the number of maximum paths which should be calculated. Increasing can lead to worse alternatives. 
    # + alternativeRouteMaxWeightFactor - If `algorithm=alternative_route`, this parameter sets the factor by which the alternatives routes can be longer than the optimal route. Increasing can lead to worse alternatives. 
    # + alternativeRouteMaxShareFactor - If `algorithm=alternative_route`, this parameter specifies how similar an alternative route can be to the optimal route. Increasing can lead to worse alternatives. 
    # + return - Routing Result 
    remote isolated function getRoute(string[] point, string[]? pointHint = (), string[]? snapPrevention = (), VehicleProfileId? vehicle = (), string[]? curbside = (), boolean turnCosts = false, string locale = "en", boolean elevation = false, string[]? details = (), string optimize = "false", boolean instructions = true, boolean calcPoints = true, boolean debug = false, boolean pointsEncoded = true, boolean chDisable = false, string weighting = "fastest", int[]? heading = (), int headingPenalty = 120, boolean passThrough = false, string? blockArea = (), string? avoid = (), string? algorithm = (), int roundTripDistance = 10000, int? roundTripSeed = (), int alternativeRouteMaxPaths = 2, decimal alternativeRouteMaxWeightFactor = 1.4, decimal alternativeRouteMaxShareFactor = 0.6) returns RouteResponse|error {
        string  path = string `/route`;
        map<anydata> queryParam = {"point": point, "point_hint": pointHint, "snap_prevention": snapPrevention, "vehicle": vehicle, "curbside": curbside, "turn_costs": turnCosts, "locale": locale, "elevation": elevation, "details": details, "optimize": optimize, "instructions": instructions, "calc_points": calcPoints, "debug": debug, "points_encoded": pointsEncoded, "ch.disable": chDisable, "weighting": weighting, "heading": heading, "heading_penalty": headingPenalty, "pass_through": passThrough, "block_area": blockArea, "avoid": avoid, "algorithm": algorithm, "round_trip.distance": roundTripDistance, "round_trip.seed": roundTripSeed, "alternative_route.max_paths": alternativeRouteMaxPaths, "alternative_route.max_weight_factor": alternativeRouteMaxWeightFactor, "alternative_route.max_share_factor": alternativeRouteMaxShareFactor, "key": self.apiKeyConfig.key};
        map<Encoding> queryParamEncoding = {"point": {style: FORM, explode: true}, "point_hint": {style: FORM, explode: true}, "snap_prevention": {style: FORM, explode: true}, "curbside": {style: FORM, explode: true}, "details": {style: FORM, explode: true}, "heading": {style: FORM, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        RouteResponse response = check self.clientEp-> get(path, targetType = RouteResponse);
        return response;
    }
    # POST Route Endpoint
    #
    # + payload - Route request details 
    # + return - Routing Result 
    remote isolated function postRoute(RouteRequest payload) returns RouteResponse|error {
        string  path = string `/route`;
        map<anydata> queryParam = {"key": self.apiKeyConfig.key};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RouteResponse response = check self.clientEp->post(path, request, targetType=RouteResponse);
        return response;
    }
    # Coverage information
    #
    # + return - Coverage Information 
    remote isolated function getCoverageInformation() returns InfoResponse|error {
        string  path = string `/route/info`;
        map<anydata> queryParam = {"key": self.apiKeyConfig.key};
        path = path + check getPathForQueryParam(queryParam);
        InfoResponse response = check self.clientEp-> get(path, targetType = InfoResponse);
        return response;
    }
    # Isochrone Endpoint
    #
    # + point - Specify the start coordinate 
    # + timeLimit - Specify which time the vehicle should travel. In seconds. 
    # + distanceLimit - Specify which distance the vehicle should travel. In meters. 
    # + vehicle - The vehicle profile for which the route should be calculated. 
    # + buckets - Number by which to divide the given `time_limit` to create `buckets` nested isochrones of time intervals `time_limit-n*time_limit/buckets`. Applies analogously to `distance_limit`. 
    # + reverseFlow - If `false` the flow goes from point to the polygon, if `true` the flow goes from the polygon "inside" to the point. Example use case for `false`&#58; *How many potential customer can be reached within 30min travel time from your store* vs. `true`&#58; *How many customers can reach your store within 30min travel time.* 
    # + weighting - Use `"shortest"` to get an isodistance line instead of an isochrone. 
    # + return - Isochrone Result 
    remote isolated function getIsochrone(string point, int timeLimit = 600, int? distanceLimit = (), VehicleProfileId? vehicle = (), int buckets = 1, boolean reverseFlow = false, string weighting = "fastest") returns IsochroneResponse|error {
        string  path = string `/isochrone`;
        map<anydata> queryParam = {"point": point, "time_limit": timeLimit, "distance_limit": distanceLimit, "vehicle": vehicle, "buckets": buckets, "reverse_flow": reverseFlow, "weighting": weighting, "key": self.apiKeyConfig.key};
        path = path + check getPathForQueryParam(queryParam);
        IsochroneResponse response = check self.clientEp-> get(path, targetType = IsochroneResponse);
        return response;
    }
    # GET Matrix Endpoint
    #
    # + point - Specify multiple points in `latitude,longitude` for which the weight-, route-, time- or distance-matrix should be calculated. In this case the starts are identical to the destinations. If there are N points, then NxN entries will be calculated. The order of the point parameter is important. Specify at least three points. Cannot be used together with from_point or to_point. 
    # + fromPoint - The starting points for the routes in `latitude,longitude`. E.g. if you want to calculate the three routes A-&gt;1, A-&gt;2, A-&gt;3 then you have one from_point parameter and three to_point parameters. 
    # + toPoint - The destination points for the routes in `latitude,longitude`. 
    # + pointHint - Optional parameter. Specifies a hint for each `point` parameter to prefer a certain street for the closest location lookup. E.g. if there is an address or house with two or more neighboring streets you can control for which street the closest location is looked up. 
    # + fromPointHint - For the from_point parameter. See point_hint 
    # + toPointHint - For the to_point parameter. See point_hint 
    # + snapPrevention - Optional parameter to avoid snapping to a certain road class or road environment. Current supported values `motorway`, `trunk`, `ferry`, `tunnel`, `bridge` and `ford`. Multiple values are specified like `snap_prevention=ferry&snap_prevention=motorway` 
    # + curbside - Optional parameter. It specifies on which side a point should be relative to the driver when she leaves/arrives at a start/target/via point. You need to specify this parameter for either none or all points. Only supported for motor vehicles and OpenStreetMap. 
    # + fromCurbside - Curbside setting for the from_point parameter. See curbside. 
    # + toCurbside - Curbside setting for the to_point parameter. See curbside. 
    # + outArray - Specifies which arrays should be included in the response. Specify one or more of the following options 'weights', 'times', 'distances'. To specify more than one array use e.g. out_array=times&out_array=distances. The units of the entries of distances are meters, of times are seconds and of weights is arbitrary and it can differ for different vehicles or versions of this API. 
    # + vehicle - The vehicle profile for which the matrix should be calculated. 
    # + failFast - Specifies whether or not the matrix calculation should return with an error as soon as possible in case some points cannot be found or some points are not connected. If set to `false` the time/weight/distance matrix will be calculated for all valid points and contain the `null` value for all entries that could not be calculated. The `hint` field of the response will also contain additional information about what went wrong (see its documentation). 
    # + turnCosts - Specifies if turn restrictions should be considered. Enabling this option increases the matrix computation time. Only supported for motor vehicles and OpenStreetMap. 
    # + return - Matrix API response 
    remote isolated function getMatrix(string[]? point = (), string[]? fromPoint = (), string[]? toPoint = (), string[]? pointHint = (), string[]? fromPointHint = (), string[]? toPointHint = (), string[]? snapPrevention = (), string[]? curbside = (), string[]? fromCurbside = (), string[]? toCurbside = (), string[]? outArray = (), VehicleProfileId? vehicle = (), boolean failFast = true, boolean turnCosts = false) returns MatrixResponse|error {
        string  path = string `/matrix`;
        map<anydata> queryParam = {"point": point, "from_point": fromPoint, "to_point": toPoint, "point_hint": pointHint, "from_point_hint": fromPointHint, "to_point_hint": toPointHint, "snap_prevention": snapPrevention, "curbside": curbside, "from_curbside": fromCurbside, "to_curbside": toCurbside, "out_array": outArray, "vehicle": vehicle, "fail_fast": failFast, "turn_costs": turnCosts, "key": self.apiKeyConfig.key};
        map<Encoding> queryParamEncoding = {"point": {style: FORM, explode: true}, "from_point": {style: FORM, explode: true}, "to_point": {style: FORM, explode: true}, "point_hint": {style: FORM, explode: true}, "from_point_hint": {style: FORM, explode: true}, "to_point_hint": {style: FORM, explode: true}, "snap_prevention": {style: FORM, explode: true}, "curbside": {style: FORM, explode: true}, "from_curbside": {style: FORM, explode: true}, "to_curbside": {style: FORM, explode: true}, "out_array": {style: FORM, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        MatrixResponse response = check self.clientEp-> get(path, targetType = MatrixResponse);
        return response;
    }
    # POST Matrix Endpoint
    #
    # + payload - Matrix Request Detail 
    # + return - Matrix API response 
    remote isolated function postMatrix(MatrixBody payload) returns MatrixResponse|error {
        string  path = string `/matrix`;
        map<anydata> queryParam = {"key": self.apiKeyConfig.key};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        MatrixResponse response = check self.clientEp->post(path, request, targetType=MatrixResponse);
        return response;
    }
    # Batch Matrix Endpoint
    #
    # + payload - Matrix request details 
    # + return - A jobId you can use to retrieve your solution from the server. 
    remote isolated function calculateMatrix(MatrixCalculateBody payload) returns JobId|error {
        string  path = string `/matrix/calculate`;
        map<anydata> queryParam = {"key": self.apiKeyConfig.key};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        JobId response = check self.clientEp->post(path, request, targetType=JobId);
        return response;
    }
    # GET Batch Matrix Endpoint
    #
    # + jobId - Request solution with jobId 
    # + return - A response containing the matrix 
    remote isolated function getMatrixSolution(string jobId) returns MatrixResponse|error {
        string  path = string `/matrix/solution/${jobId}`;
        map<anydata> queryParam = {"key": self.apiKeyConfig.key};
        path = path + check getPathForQueryParam(queryParam);
        MatrixResponse response = check self.clientEp-> get(path, targetType = MatrixResponse);
        return response;
    }
    # Map-match a GPX file
    #
    # + gpsAccuracy - Specify the precision of a point, in meter 
    # + vehicle - Specify the vehicle profile like car 
    # + return - Routing Result 
    remote isolated function postGPX(int? gpsAccuracy = (), string? vehicle = ()) returns RouteResponse|error {
        string  path = string `/match`;
        map<anydata> queryParam = {"gps_accuracy": gpsAccuracy, "vehicle": vehicle, "key": self.apiKeyConfig.key};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        RouteResponse response = check self.clientEp-> post(path, request, targetType = RouteResponse);
        return response;
    }
    # Geocoding Endpoint
    #
    # + q - If you do forward geocoding, this is `required` and is a textual description of the address you are looking for. 
    # + locale - Display the search results for the specified locale. Currently French (fr), English (en), German (de) and Italian (it) are supported. If the locale wasn't found the default (en) is used. 
    # + 'limit - Specify the maximum number of results to return 
    # + reverse - It is `required` to be `true` if you want to do a reverse geocoding request. If it is `true`, `point` must be defined as well, and `q` must not be used. 
    # + debug - If `true`, the output will be formatted. 
    # + point - _Forward geocoding_: The location bias in the format 'latitude,longitude' e.g. point=45.93272,11.58803. _Reverse geocoding_: The location to find amenities, cities. 
    # + provider - The provider parameter is currently under development and can fall back to `default` at any time. The intend is to provide alternatives to our default geocoder. Each provider has its own strenghts and might fit better for certain scenarios, so it's worth to compare the different providers. To try it append the `provider`parameter to the URL like `&provider=nominatim`, the result structure should be identical in all cases - if not, please report this back to us. Keep in mind that some providers do not support certain parameters or don't return some fields, for example `osm_id` and `osm_type` are not supported by every geocoding provider. If you would like to use additional parameters of one of the providers, but it's not available for the GraphHopper Geocoding API, yet? Please contact us. The credit costs can be different for all providers - see [here](https://support.graphhopper.com/support/solutions/articles/44000718211-what-is-one-credit-) for more information about it. Currently, only the default provider and gisgraphy supports autocompletion of partial search strings. All providers support normal "forward" geocoding and reverse geocoding via `reverse=true`. #### Default (`provider=default`) This provider returns results of our internal geocoding engine, as described above. In addition to the above documented parameters the following parameters are possible: * `bbox` - the expected format is `minLon,minLat,maxLon,maxLat` * `osm_tag` - you can filter `key:value` or exclude places with certain OpenStreetMap tags `!key:value`. E.g. `osm_tag=tourism:museum` or just the key `osm_tag=tourism`. To exclude multiple tags you add multiple `osm_tag` parameters. #### Nominatim (`provider=nominatim`) The GraphHopper Directions API uses a commercially hosted Nominatim geocoder. You can try this provider [here](https://nominatim.openstreetmap.org/). The provider does **not** fall under the [restrictions](https://operations.osmfoundation.org/policies/nominatim/) of the Nominatim instance hosted by OpenStreetMap. In addition to the above documented parameters Nominatim allows to use the following parameters, which can be used as documented [here](https://github.com/openstreetmap/Nominatim/blob/master/docs/api/Search.md#parameters): * `viewbox` - the expected format is `minLon,minLat,maxLon,maxLat` * `bounded` - If 1 and a viewbox is given, restrict the result to items contained within that viewbox. Default is 0. #### Gisgraphy (`provider=gisgraphy`) This provider returns results from the Gisgraphy geocoder which you can try [here](https://services.gisgraphy.com/static/leaflet/index.html). **Limitations:** The `locale` parameter is not supported. Gisgraphy does not return OSM tags or an extent. Gisgraphy has a special autocomplete API, which you can use by adding `autocomplete=true` (does not work with `reverse=true`). The autocomplete API is optimized on predicting text input, but returns less information. In addition to the above documented parameters Gisgraphy allows to use the following parameters, which can be used as documented [here](https://www.gisgraphy.com/documentation/user-guide.php#geocodingservice): * `radius` - radius in meters * `country` - restrict search for the specified country. The value must be the ISO 3166 Alpha 2 code of the country. #### NetToolKit (`provider=nettoolkit`) This provider returns results from the NetToolKit provider which is specialized for US addresses and provides a wrapper around Nominatim for other addresses. You can try it [here](https://www.nettoolkit.com/geo/demo). The following additional NetToolKit parameters are supported (read [here](https://www.nettoolkit.com/docs/geo/geocoding) for more details): - `source`: User can choose which source provider to geocode the address, this value is "NetToolKit" by default - `country_code`: an iso-3166-2 country code (e.g : US) filter the results to the specify country code **Limitations:** NetToolKit does not support the `locale` parameter. NetToolKit does not return OSM tags (e.g. osm_id, osm_type, osm_value). #### OpenCage Data (`provider=opencagedata`) This provider returns results from the OpenCageData geocoder which you can try [here](https://geocoder.opencagedata.com/demo). In addition to the above documented parameters OpenCage Data allows to use the following parameters, which can be used as documented [here](https://geocoder.opencagedata.com/api#forward-opt): * countrycode - The country code is a two letter code as defined by the ISO 3166-1 Alpha 2 standard. E.g. gb for the United Kingdom, fr for France, us for United States.  * bounds - the expected format is `minLon,minLat,maxLon,maxLat` 
    # + return - An array found locations 
    remote isolated function getGeocode(string? q = (), string locale = "en", int 'limit = 10, boolean reverse = false, boolean debug = false, string? point = (), string provider = "default") returns GeocodingResponse|error {
        string  path = string `/geocode`;
        map<anydata> queryParam = {"q": q, "locale": locale, "limit": 'limit, "reverse": reverse, "debug": debug, "point": point, "provider": provider, "key": self.apiKeyConfig.key};
        path = path + check getPathForQueryParam(queryParam);
        GeocodingResponse response = check self.clientEp-> get(path, targetType = GeocodingResponse);
        return response;
    }
    # POST route optimization problem
    #
    # + payload - The request that contains the vehicle routing problem to be solved. 
    # + return - A response containing the solution 
    remote isolated function solveVRP(Request payload) returns Response|error {
        string  path = string `/vrp`;
        map<anydata> queryParam = {"key": self.apiKeyConfig.key};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Response response = check self.clientEp->post(path, request, targetType=Response);
        return response;
    }
    # POST route optimization problem (batch mode)
    #
    # + payload - The request that contains the problem to be solved. 
    # + return - A jobId you can use to retrieve your solution from the server - see solution endpoint. 
    remote isolated function asyncVRP(Request payload) returns JobId|error {
        string  path = string `/vrp/optimize`;
        map<anydata> queryParam = {"key": self.apiKeyConfig.key};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        JobId response = check self.clientEp->post(path, request, targetType=JobId);
        return response;
    }
    # GET the solution (batch mode)
    #
    # + jobId - Request solution with jobId 
    # + return - A response containing the solution 
    remote isolated function getSolution(string jobId) returns Response|error {
        string  path = string `/vrp/solution/${jobId}`;
        map<anydata> queryParam = {"key": self.apiKeyConfig.key};
        path = path + check getPathForQueryParam(queryParam);
        Response response = check self.clientEp-> get(path, targetType = Response);
        return response;
    }
    # POST Cluster Endpoint
    #
    # + payload - Request object that contains the problem to be solved 
    # + return - A response containing the solution 
    remote isolated function solveClusteringProblem(ClusterRequest payload) returns ClusterResponse|error {
        string  path = string `/cluster`;
        map<anydata> queryParam = {"key": self.apiKeyConfig.key};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ClusterResponse response = check self.clientEp->post(path, request, targetType=ClusterResponse);
        return response;
    }
    # Batch Cluster Endpoint
    #
    # + payload - Request object that contains the problem to be solved 
    # + return - A jobId you can use to retrieve your solution from the server - see solution endpoint. 
    remote isolated function asyncClusteringProblem(ClusterRequest payload) returns JobId|error {
        string  path = string `/cluster/calculate`;
        map<anydata> queryParam = {"key": self.apiKeyConfig.key};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        JobId response = check self.clientEp->post(path, request, targetType=JobId);
        return response;
    }
    # GET Batch Solution Endpoint
    #
    # + jobId - Request solution with jobId 
    # + return - A response containing the solution 
    remote isolated function getClusterSolution(string jobId) returns ClusterResponse|error {
        string  path = string `/cluster/solution/${jobId}`;
        map<anydata> queryParam = {"key": self.apiKeyConfig.key};
        path = path + check getPathForQueryParam(queryParam);
        ClusterResponse response = check self.clientEp-> get(path, targetType = ClusterResponse);
        return response;
    }
}
