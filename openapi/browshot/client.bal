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

# This is a generated connector for [Browshot API v1.17.0](https://browshot.com/api/documentation) OpenAPI specification.
# The Browshot API provides services to get screenshots of any website in real time.
@display {label: "Browshot", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Browshot Account](https://browshot.com/login) and obtain token by navigating to `Settings` by following [this guide](https://browshot.com/api/documentation).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://api.browshot.com/api/v1") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
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
        string resourcePath = string `/screenshot/create`;
        map<anydata> queryParam = {"url": url, "instance_id": instanceId, "size": size, "cache": cache, "delay": delay, "flash_delay": flashDelay, "screen_width": screenWidth, "screen_height": screenHeight, "priority": priority, "referer": referer, "post_data": postData, "cookie": cookie, "script": script, "details": details, "html": html, "max_wait": maxWait, "headers": headers, "shots": shots, "shot_interval": shotInterval, "hosting": hosting, "hosting_height": hostingHeight, "hosting_width": hostingWidth, "hosting_scale": hostingScale, "hosting_bucket": hostingBucket, "hosting_file": hostingFile, "hosting_headers": hostingHeaders, "key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Screenshot response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/screenshot/multiple`;
        map<anydata> queryParam = {"url": url, "instance_id": instanceId, "size": size, "cache": cache, "delay": delay, "flash_delay": flashDelay, "screen_width": screenWidth, "screen_height": screenHeight, "priority": priority, "referer": referer, "post_data": postData, "cookie": cookie, "script": script, "details": details, "html": html, "max_wait": maxWait, "headers": headers, "hosting": hosting, "hosting_height": hostingHeight, "hosting_width": hostingWidth, "hosting_scale": hostingScale, "hosting_bucket": hostingBucket, "hosting_file": hostingFile, "hosting_headers": hostingHeaders, "key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ScreenshotList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Query screenshot status
    #
    # + id - screenshot ID received from /api/v1/screenshot/create 
    # + details - level of details about the screenshot and the page 
    # + return - Screenshot found 
    remote isolated function getScreenshotInfo(int id, int details = 2) returns Screenshot[]|error {
        string resourcePath = string `/screenshot/info`;
        map<anydata> queryParam = {"id": id, "details": details, "key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Screenshot[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get information about screenshots
    #
    # + 'limit - maximum number of screenshots' information to return 
    # + status - get list of screenshot in a given status (error, finished, in_process) 
    # + return - list of screenshot information 
    remote isolated function getMultipleScreenshotsInfo(int 'limit = 100, string? status = ()) returns ScreenshotList[]|error {
        string resourcePath = string `/screenshot/list`;
        map<anydata> queryParam = {"limit": 'limit, "status": status, "key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ScreenshotList[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Search for screenshots
    #
    # + url - look for a string matching the URL requested 
    # + 'limit - maximum number of screenshots' information to return 
    # + status - get list of screenshot in a given status (error, finished, in_process) 
    # + return - list of screenshot information 
    remote isolated function searchScreenshot(string url, int 'limit = 50, string? status = ()) returns ScreenshotList[]|error {
        string resourcePath = string `/screenshot/search`;
        map<anydata> queryParam = {"url": url, "limit": 'limit, "status": status, "key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ScreenshotList[] response = check self.clientEp->get(resourcePath);
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
    remote isolated function hostScreenshot(int id, string hosting, int? width = (), int? height = (), decimal scale = 1.0, string? bucket = (), string? file = (), string? headers = ()) returns ScreenshotHost[]|error {
        string resourcePath = string `/screenshot/host`;
        map<anydata> queryParam = {"id": id, "hosting": hosting, "width": width, "height": height, "scale": scale, "bucket": bucket, "file": file, "headers": headers, "key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ScreenshotHost[] response = check self.clientEp->get(resourcePath);
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
    remote isolated function getThumbnail(int id, int? width = (), int? height = (), decimal scale = 1.0, int zoom = 100, string ratio = "fit", int left = 0, int right = 0, int top = 0, int? bottom = (), string format = "png", int shot = 1, int quality = 100) returns http:Response|error {
        string resourcePath = string `/screenshot/thumbnail`;
        map<anydata> queryParam = {"id": id, "width": width, "height": height, "scale": scale, "zoom": zoom, "ratio": ratio, "left": left, "right": right, "top": top, "bottom": bottom, "format": format, "shot": shot, "quality": quality, "key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Share a screenshot
    #
    # + id - screenshot ID 
    # + note - note to add on the sharing page 
    # + return - list of screenshot information 
    remote isolated function shareScreenshot(int id, string? note = ()) returns ScreenshotHost[]|error {
        string resourcePath = string `/screenshot/share`;
        map<anydata> queryParam = {"id": id, "note": note, "key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ScreenshotHost[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete screenshot data
    #
    # + id - screenshot ID 
    # + data - data to remove. You can specify multiple of them (separated by a ,): *image* (image files), *url* (url requested), *metadata* (time added, time finished, post data, cookie and referer used for the screenshot), *all* (all data and files) 
    # + return - list of screenshot information 
    remote isolated function deleteScreenshot(int id, string data = "image") returns ScreenshotShort[]|error {
        string resourcePath = string `/screenshot/delete`;
        map<anydata> queryParam = {"id": id, "data": data, "key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ScreenshotShort[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get the HTML code
    #
    # + id - screenshot ID 
    # + return - HTML code 
    remote isolated function getHTML(int id) returns http:Response|error {
        string resourcePath = string `/screenshot/html`;
        map<anydata> queryParam = {"id": id, "key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get the batch status
    #
    # + id - batch ID 
    # + return - batch information 
    remote isolated function getBatchInfo(int id) returns Batch|error {
        string resourcePath = string `/batch/info`;
        map<anydata> queryParam = {"id": id, "key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Batch response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get information about your account
    #
    # + details - level of information returned 
    # + return - Account information 
    remote isolated function getAccountInfo(int details = 1) returns Account|error {
        string resourcePath = string `/account/info`;
        map<anydata> queryParam = {"details": details, "key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Account response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get information about an instance
    #
    # + id - instance ID 
    # + return - Instance information 
    remote isolated function getInstanceInfo(int id) returns Instance|error {
        string resourcePath = string `/instance/info`;
        map<anydata> queryParam = {"id": id, "key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Instance response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all instances
    #
    # + return - Instance information 
    remote isolated function getInstancesInfo() returns InstanceList|error {
        string resourcePath = string `/instance/list`;
        map<anydata> queryParam = {"key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InstanceList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get information about a browser
    #
    # + id - browser ID 
    # + return - Browser information 
    remote isolated function getBrowserInfo(int id) returns Browser|error {
        string resourcePath = string `/browser/info`;
        map<anydata> queryParam = {"id": id, "key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Browser response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all browsers
    #
    # + return - Instance information 
    remote isolated function getBrowsersInfo() returns BrowserList|error {
        string resourcePath = string `/browser/list`;
        map<anydata> queryParam = {"key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BrowserList response = check self.clientEp->get(resourcePath);
        return response;
    }
}
