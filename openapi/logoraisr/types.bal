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
import ballerina/constraint;

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
    # Represents API Key `Authorization`
    @display {label: "", kind: "password"}
    string authorization;
|};

public type ResultResponse record {
    # Url from which the result file can be downloaded.
    @constraint:String {maxLength: 256, minLength: 1}
    string result_file_url?;
};

public type FileResponse record {
    # Returns the file_id. To apply processes to the uploaded file, this file_id must be referenced in the API-calls.
    string file_id?;
};

public type Project record {
    # Id of the created project.
    int id?;
    # Number of the created project.
    int project_number?;
    # Id of the file on which the process was applied.
    string file_id?;
    # Id of the result file which the process created.
    string result_file_id?;
    # Process which should applied. Processes are "color-classification".
    @constraint:String {minLength: 1}
    string process_id;
    Process process?;
    # The Date when the project was created.
    string created?;
    # Name of the project with which it was saved.
    @constraint:String {minLength: 1}
    string project_title?;
    # Id of the paypal payment.
    @constraint:String {minLength: 1}
    string paypal_payment_id?;
};

public type ProjectResponse record {
    # Number of the created project.
    int project_number?;
    # Id of the created project.
    int project_id?;
    # Id of the result_file. This id must be specified to create the result_file_url.
    string result_file_id?;
};

public type ReportResponse record {
    # Number of the report which was created.
    int report_number?;
    # The Date when the project was created.
    string created?;
    # Id of the file on which the process was applied.
    @constraint:String {minLength: 1}
    string file_id?;
    # Process which was applied. Processes are "color-classification".
    @constraint:String {minLength: 1}
    string processing_algorithm?;
    Result result?;
};

public type Report record {
    # Number of the created report.
    int report_number;
    # The Date when the report was created.
    string created?;
    # Id of the file on which the report was applied.
    string file_id;
    # Process_id of the process which was applied. Processes are "color-classification".
    int process_id;
    # Result_id of the result which was created.
    int result_id;
    Result result?;
};

public type ReportRequest record {
    # Process which should applied. Processes are "color-classification".
    @constraint:String {minLength: 1}
    string process;
    # Id of the file on which the process is to be applied.
    string file_id;
};

public type ProjectRequest record {
    Process process?;
    # Id of the file on which the process is to be applied.
    string file_id;
    # Name of the project with which it is saved.
    @constraint:String {minLength: 1}
    string project_title;
};

public type Color record {
    # RGB-Red color value.
    int red?;
    # RGB-Green color value.
    int green?;
    # RGB-Blue color value
    int blue?;
    # Percentage of pixels that holds this color.
    string percentage?;
    # Number of pixels that holds this color.
    int number_of_pixel?;
    # Hex-label of this color.
    @constraint:String {minLength: 1}
    string hex?;
};

public type PreviewResponse record {
    # Url from which the preview file can be downloaded.
    @constraint:String {maxLength: 256, minLength: 1}
    string preview_img_url?;
};

public type Process record {
    # Schlüssel welcher Verarbeitungs-Algorithmus angewendet wird. Zur Auswahl stehen "logo-to-vector", "logo-super-resolution", "logo-segmentation" und "image-processing".
    @constraint:String {minLength: 1}
    string processing_algorithm;
    # Changes the size of the image according to the specified size. Example: "resize": "200x300".
    @constraint:String {maxLength: 255, minLength: 1}
    string resize?;
    # Flips the image around the horizontal axis, from top to bottom. Example: "flip": true
    boolean flip?;
    # Mirrors the image around the vertical axis, i.e. from right to left. Example: "mirror": true
    boolean mirror?;
    # Rotates the image around the center according to the specified degree. Example: "rotate": 90
    @constraint:Int {maxValue: 360}
    int rotate?;
    # Crops the image according to the specified mechanism. If you specify the size "WidthexHeight", the image will be cropped centered. If coordinates "x1,y1,x2,y2" are given, the image is cropped according to the coordinates. The image will be cropped to the size of the stories if "faces" are specified as. Example Centered: "crop": "200x300". Example Region: "crop": "200,300,150,300". Example Faces: "crop": "faces".
    @constraint:String {maxLength: 255, minLength: 1}
    string crop?;
};

public type Result record {
    # Number of pixel in image.
    int number_of_pixel_in_image?;
    # Width of image.
    int width?;
    # Height of image.
    int height?;
    Color[] colors?;
};
