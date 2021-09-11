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
import ballerina/url;
import ballerina/lang.'string;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector for [Browshot API v1.17.0](https://browshot.com/api/documentation) OpenAPI specification.
# The Browshot API provides services to get screenshots of any website in real time.
@display {label: "Browshot", iconPath: "resources/browshot.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Browshot Account](https://browshot.com/login) and obtain token by navigating to `Settings` by following [this guide](https://browshot.com/api/documentation).
    #
    # + apiKeyConfig - Provide your API key as `key`. Eg: `{"key" : "<your API key>"}` 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.browshot.com/api/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Request a screenshot
    #
    # + url - URL of the page to get a screenshot for 
    # + instanceId - instance ID to use 
    # + size - screenshot size - "screen" (default) or "page" 
    # + cache - use a previous screenshot (same URL, same instance) if it was done within <cache_value> seconds. The default value is 24hours. Specify cache=0 if you want a new screenshot. 
    # + delay - number of seconds to wait after the page has loaded. This is used to let JavaScript run longer before taking the screenshot. Use delay=0 to take screenshots faster. 
    # + flashDelay - number of seconds to wait after the page has loaded if Flash elements are present. Use flash_delay=0 to take screenshots faster. 
    # + screenWidth - width of the browser window. For desktop browsers only. 
    # + screenHeight - height of the browser window. For desktop browsers only. (Note: full-page screenshots can have a height of up to 15,000px) 
    # + priority - assign priority to the screenshot (for private instances only) 
    # + referer - use a custom referrer header - paid screenshots only 
    # + postData - send a POST requests with post_data, useful for filling out forms - paid screenshots only 
    # + cookie - set a cookie for the URL requested (see Custom POST Data, Referer and Cookie) Cookies should be separated by a ; - paid screenshots only 
    # + script - URL of javascript file to execute after the page load event 
    # + details - level of information available with screenshot/info 
    # + html - saves the HTML of the rendered page which can be retrieved by the API call screenshot/html. This feature costs *1 credit* per screenshot. 
    # + maxWait - maximum number of seconds to wait before triggering the PageLoad event. Note that delay will still be used. (default: 0 = disabled) 
    # + headers - any custom HTTP headers. (Not supported with Internet Explorer) 
    # + shots - take multiple screenshots of the same page. This costs 1 additional credit for every 2 additional screenshots. 
    # + shotInterval - number of seconds between 2 screenshots 
    # + hosting - hosting option - s3 or browshot 
    # + hostingHeight - maximum height of the thumbnail to host 
    # + hostingWidth - maximum height of the thumbnail to host 
    # + hostingScale - scale of the thumbnail to host 
    # + hostingBucket - S3 bucket to upload the screenshot or thumbnail (required for S3) 
    # + hostingFile - file name to use (for S3 only) 
    # + hostingHeaders - list of headers to add to the S3 object (for S3 only) 
    # + return - Request accepted 
    remote isolated function createScreenshot(string url, int instanceId, string size = "screen", int cache = 86400, int delay = 5, int flashDelay = 10, int screenWidth = 1024, int screenHeight = 768, int? priority = (), string? referer = (), string? postData = (), string? cookie = (), string? script = (), int details = 2, int html = 0, int maxWait = 0, string? headers = (), int shots = 1, int shotInterval = 5, string? hosting = (), int? hostingHeight = (), int? hostingWidth = (), float hostingScale = 1.0, string? hostingBucket = (), string? hostingFile = (), string? hostingHeaders = ()) returns Screenshot|error {
        string  path = string `/screenshot/create`;
        map<anydata> queryParam = {"url": url, "instance_id": instanceId, "size": size, "cache": cache, "delay": delay, "flash_delay": flashDelay, "screen_width": screenWidth, "screen_height": screenHeight, "priority": priority, "referer": referer, "post_data": postData, "cookie": cookie, "script": script, "details": details, "html": html, "max_wait": maxWait, "headers": headers, "shots": shots, "shot_interval": shotInterval, "hosting": hosting, "hosting_height": hostingHeight, "hosting_width": hostingWidth, "hosting_scale": hostingScale, "hosting_bucket": hostingBucket, "hosting_file": hostingFile, "hosting_headers": hostingHeaders, "key": self.apiKeys["key"]};
        path = path + check getPathForQueryParam(queryParam);
        Screenshot response = check self.clientEp-> get(path, targetType = Screenshot);
        return response;
    }
    # Request multiple screenshots
    #
    # + url - URL of the page to get a screenshot for. You can specify multiple url parameters (up to 10). 
    # + instanceId - instance ID to use. You can specify multiple instance_id parameters (up to 10). 
    # + size - screenshot size - "screen" (default) or "page" 
    # + cache - use a previous screenshot (same URL, same instance) if it was done within <cache_value> seconds. The default value is 24hours. Specify cache=0 if you want a new screenshot. 
    # + delay - number of seconds to wait after the page has loaded. This is used to let JavaScript run longer before taking the screenshot. Use delay=0 to take screenshots faster. 
    # + flashDelay - number of seconds to wait after the page has loaded if Flash elements are present. Use flash_delay=0 to take screenshots faster. 
    # + screenWidth - width of the browser window. For desktop browsers only. 
    # + screenHeight - height of the browser window. For desktop browsers only. (Note: full-page screenshots can have a height of up to 15,000px) 
    # + priority - assign priority to the screenshot (for private instances only) 
    # + referer - use a custom referrer header - paid screenshots only 
    # + postData - send a POST requests with post_data, useful for filling out forms - paid screenshots only 
    # + cookie - set a cookie for the URL requested (see Custom POST Data, Referer and Cookie) Cookies should be separated by a ; - paid screenshots only 
    # + script - URL of javascript file to execute after the page load event 
    # + details - level of information available with screenshot/info 
    # + html - saves the HTML of the rendered page which can be retrieved by the API call screenshot/html. This feature costs *1 credit* per screenshot. 
    # + maxWait - maximum number of seconds to wait before triggering the PageLoad event. Note that delay will still be used. (default: 0 = disabled) 
    # + headers - any custom HTTP headers. (Not supported with Internet Explorer) 
    # + hosting - hosting option - s3 or browshot 
    # + hostingHeight - maximum height of the thumbnail to host 
    # + hostingWidth - maximum height of the thumbnail to host 
    # + hostingScale - scale of the thumbnail to host 
    # + hostingBucket - S3 bucket to upload the screenshot or thumbnail (required for S3) 
    # + hostingFile - file name to use (for S3 only) 
    # + hostingHeaders - list of headers to add to the S3 object (for S3 only) 
    # + return - Request accepted 
    remote isolated function createMultipleScreenshots(string url, int instanceId, string size = "screen", int cache = 86400, int delay = 5, int flashDelay = 10, int screenWidth = 1024, int screenHeight = 768, int? priority = (), string? referer = (), string? postData = (), string? cookie = (), string? script = (), int details = 2, int html = 0, int maxWait = 0, string? headers = (), string? hosting = (), int? hostingHeight = (), int? hostingWidth = (), float hostingScale = 1.0, string? hostingBucket = (), string? hostingFile = (), string? hostingHeaders = ()) returns ScreenshotList|error {
        string  path = string `/screenshot/multiple`;
        map<anydata> queryParam = {"url": url, "instance_id": instanceId, "size": size, "cache": cache, "delay": delay, "flash_delay": flashDelay, "screen_width": screenWidth, "screen_height": screenHeight, "priority": priority, "referer": referer, "post_data": postData, "cookie": cookie, "script": script, "details": details, "html": html, "max_wait": maxWait, "headers": headers, "hosting": hosting, "hosting_height": hostingHeight, "hosting_width": hostingWidth, "hosting_scale": hostingScale, "hosting_bucket": hostingBucket, "hosting_file": hostingFile, "hosting_headers": hostingHeaders, "key": self.apiKeys["key"]};
        path = path + check getPathForQueryParam(queryParam);
        ScreenshotList response = check self.clientEp-> get(path, targetType = ScreenshotList);
        return response;
    }
    # Query screenshot status
    #
    # + id - screenshot ID received from /api/v1/screenshot/create 
    # + details - level of details about the screenshot and the page 
    # + return - Screenshot found 
    remote isolated function getScreenshotInfo(int id, int details = 2) returns Screenshot[]|error {
        string  path = string `/screenshot/info`;
        map<anydata> queryParam = {"id": id, "details": details, "key": self.apiKeys["key"]};
        path = path + check getPathForQueryParam(queryParam);
        Screenshot[] response = check self.clientEp-> get(path, targetType = ScreenshotArr);
        return response;
    }
    # Get information about screenshots
    #
    # + 'limit - maximum number of screenshots' information to return 
    # + status - get list of screenshot in a given status (error, finished, in_process) 
    # + return - list of screenshot information 
    remote isolated function getMultipleScreenshotsInfo(int 'limit = 100, string? status = ()) returns ScreenshotList[]|error {
        string  path = string `/screenshot/list`;
        map<anydata> queryParam = {"limit": 'limit, "status": status, "key": self.apiKeys["key"]};
        path = path + check getPathForQueryParam(queryParam);
        ScreenshotList[] response = check self.clientEp-> get(path, targetType = ScreenshotListArr);
        return response;
    }
    # Search for screenshots
    #
    # + url - look for a string matching the URL requested 
    # + 'limit - maximum number of screenshots' information to return 
    # + status - get list of screenshot in a given status (error, finished, in_process) 
    # + return - list of screenshot information 
    remote isolated function searchScreenshot(string url, int 'limit = 50, string? status = ()) returns ScreenshotList[]|error {
        string  path = string `/screenshot/search`;
        map<anydata> queryParam = {"url": url, "limit": 'limit, "status": status, "key": self.apiKeys["key"]};
        path = path + check getPathForQueryParam(queryParam);
        ScreenshotList[] response = check self.clientEp-> get(path, targetType = ScreenshotListArr);
        return response;
    }
    # Host thumbnails on your own S3 account or on Browshot.
    #
    # + id - screenshot ID 
    # + hosting - hosting option: s3 or browshot 
    # + width - width of the thumbnail 
    # + height - height of the thumbnail 
    # + scale - scale of the thumbnail 
    # + bucket - S3 bucket to upload the screenshot or thumbnail - required with hosting=s3 
    # + file - file name to use - optional, used with hosting=s3 
    # + headers - HTTP headers to add to your S3 object - optional, used with hosting=s3 
    # + return - list of screenshot information 
    remote isolated function hostScreenshot(int id, string hosting, int? width = (), int? height = (), float scale = 1.0, string? bucket = (), string? file = (), string? headers = ()) returns ScreenshotHost[]|error {
        string  path = string `/screenshot/host`;
        map<anydata> queryParam = {"id": id, "hosting": hosting, "width": width, "height": height, "scale": scale, "bucket": bucket, "file": file, "headers": headers, "key": self.apiKeys["key"]};
        path = path + check getPathForQueryParam(queryParam);
        ScreenshotHost[] response = check self.clientEp-> get(path, targetType = ScreenshotHostArr);
        return response;
    }
    # Retrieve a thumbnail image
    #
    # + id - screenshot ID 
    # + width - width of the thumbnail 
    # + height - height of the thumbnail 
    # + scale - scale of the thumbnail 
    # + zoom - zoom 1 to 100 percent 
    # + ratio - Use fit to keep the original page ration, and fill to get a thumbnail for the exact width and height.  specified. If you provide both width and height, you need to specify the ratio: fit to keep the original width/height ratio (the thumbnail might be smaller than the specified width and height), or fill to crop the image if necessary. 
    # + left - left edge of the area to be cropped 
    # + right - right edge of the area to be cropped 
    # + top - top edge of the area to be cropped 
    # + bottom - bottom edge of the area to be cropped 
    # + format - image as PNG or JPEG 
    # + shot - get the second or third screenshot if multiple screenshots were requested 
    # + quality - JPEG quality factor (for JPEG thumbnails only) 
    # + return - thumbnail 
    remote isolated function getThumbnail(int id, int? width = (), int? height = (), float scale = 1.0, int zoom = 100, string ratio = "fit", int left = 0, int right = 0, int top = 0, int? bottom = (), string format = "png", int shot = 1, int quality = 100) returns http:Response|error {
        string  path = string `/screenshot/thumbnail`;
        map<anydata> queryParam = {"id": id, "width": width, "height": height, "scale": scale, "zoom": zoom, "ratio": ratio, "left": left, "right": right, "top": top, "bottom": bottom, "format": format, "shot": shot, "quality": quality, "key": self.apiKeys["key"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Share a screenshot
    #
    # + id - screenshot ID 
    # + note - note to add on the sharing page 
    # + return - list of screenshot information 
    remote isolated function shareScreenshot(int id, string? note = ()) returns ScreenshotHost[]|error {
        string  path = string `/screenshot/share`;
        map<anydata> queryParam = {"id": id, "note": note, "key": self.apiKeys["key"]};
        path = path + check getPathForQueryParam(queryParam);
        ScreenshotHost[] response = check self.clientEp-> get(path, targetType = ScreenshotHostArr);
        return response;
    }
    # Delete screenshot data
    #
    # + id - screenshot ID 
    # + data - data to remove. You can specify multiple of them (separated by a ,): *image* (image files), *url* (url requested), *metadata* (time added, time finished, post data, cookie and referer used for the screenshot), *all* (all data and files) 
    # + return - list of screenshot information 
    remote isolated function deleteScreenshot(int id, string data = "image") returns ScreenshotShort[]|error {
        string  path = string `/screenshot/delete`;
        map<anydata> queryParam = {"id": id, "data": data, "key": self.apiKeys["key"]};
        path = path + check getPathForQueryParam(queryParam);
        ScreenshotShort[] response = check self.clientEp-> get(path, targetType = ScreenshotShortArr);
        return response;
    }
    # Get the HTML code
    #
    # + id - screenshot ID 
    # + return - HTML code 
    remote isolated function getHTML(int id) returns http:Response|error {
        string  path = string `/screenshot/html`;
        map<anydata> queryParam = {"id": id, "key": self.apiKeys["key"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Requests thousands of screenshtos at once
    #
    # + payload - Request payload to create batch 
    # + hosting - hosting option - s3 or browshot 
    # + hostingHeight - maximum height of the thumbnail to host 
    # + hostingWidth - maximum height of the thumbnail to host 
    # + hostingScale - scale of the thumbnail to host 
    # + hostingBucket - S3 bucket to upload the screenshot or thumbnail (required for S3) 
    # + hostingFile - file name to use (for S3 only) 
    # + hostingHeaders - list of headers to add to the S3 object (for S3 only) 
    # + return - batch information 
    remote isolated function createBatch(Body payload, string? hosting = (), int? hostingHeight = (), int? hostingWidth = (), float hostingScale = 1.0, string? hostingBucket = (), string? hostingFile = (), string? hostingHeaders = ()) returns Batch[]|error {
        string  path = string `/batch/ceate`;
        map<anydata> queryParam = {"hosting": hosting, "hosting_height": hostingHeight, "hosting_width": hostingWidth, "hosting_scale": hostingScale, "hosting_bucket": hostingBucket, "hosting_file": hostingFile, "hosting_headers": hostingHeaders, "key": self.apiKeys["key"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        Batch[] response = check self.clientEp->post(path, request, targetType=BatchArr);
        return response;
    }
    # Get the batch status
    #
    # + id - batch ID 
    # + return - batch information 
    remote isolated function getBatchInfo(int id) returns Batch|error {
        string  path = string `/batch/info`;
        map<anydata> queryParam = {"id": id, "key": self.apiKeys["key"]};
        path = path + check getPathForQueryParam(queryParam);
        Batch response = check self.clientEp-> get(path, targetType = Batch);
        return response;
    }
    # Get information about your account
    #
    # + details - level of information returned 
    # + return - Account information 
    remote isolated function getAccountInfo(int details = 1) returns Account|error {
        string  path = string `/account/info`;
        map<anydata> queryParam = {"details": details, "key": self.apiKeys["key"]};
        path = path + check getPathForQueryParam(queryParam);
        Account response = check self.clientEp-> get(path, targetType = Account);
        return response;
    }
    # Get information about an instance
    #
    # + id - instance ID 
    # + return - Instance information 
    remote isolated function getInstanceInfo(int id) returns Instance|error {
        string  path = string `/instance/info`;
        map<anydata> queryParam = {"id": id, "key": self.apiKeys["key"]};
        path = path + check getPathForQueryParam(queryParam);
        Instance response = check self.clientEp-> get(path, targetType = Instance);
        return response;
    }
    # Get all instances
    #
    # + return - Instance information 
    remote isolated function getInstancesInfo() returns InstanceList|error {
        string  path = string `/instance/list`;
        map<anydata> queryParam = {"key": self.apiKeys["key"]};
        path = path + check getPathForQueryParam(queryParam);
        InstanceList response = check self.clientEp-> get(path, targetType = InstanceList);
        return response;
    }
    # Get information about a browser
    #
    # + id - browser ID 
    # + return - Browser information 
    remote isolated function getBrowserInfo(int id) returns Browser|error {
        string  path = string `/browser/info`;
        map<anydata> queryParam = {"id": id, "key": self.apiKeys["key"]};
        path = path + check getPathForQueryParam(queryParam);
        Browser response = check self.clientEp-> get(path, targetType = Browser);
        return response;
    }
    # Get all browsers
    #
    # + return - Instance information 
    remote isolated function getBrowsersInfo() returns BrowserList|error {
        string  path = string `/browser/list`;
        map<anydata> queryParam = {"key": self.apiKeys["key"]};
        path = path + check getPathForQueryParam(queryParam);
        BrowserList response = check self.clientEp-> get(path, targetType = BrowserList);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map 
# + return - Returns generated Path or error at failure of client initialization 
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
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
