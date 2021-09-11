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

public type ScreenshotArr Screenshot[];

public type ScreenshotListArr ScreenshotList[];

public type ScreenshotHostArr ScreenshotHost[];

public type ScreenshotShortArr ScreenshotShort[];

public type BatchArr Batch[];

public type Account record {
    # number of credits left on your account
    int balance;
    # number of free screenshots available for the current month
    int free_screenshots_left;
    # 1 is your account is authorized to create and use private instances, 0 otherwise (default)
    int private_instances;
    # 1 is your account is authorized to request hosting on Browshot, 0 otherwise (default)
    int hosting_browshot;
    # list of private instances as returned by /api/v1/instance/list
    Instance[] instances?;
    # list of custom browsers as returned by /api/v1/browser/list
    Browser[] browsers?;
    # list of 10 latest screenshots requests as returned by /api/v1/screenshot/list
    Screenshot[] screenshots?;
};

public type ScreenshotError record {
    # description of the problem that occurred
    string _error?;
    # status of the request - "in_queue", "processing", "finished", "error"
    string status?;
    # priority given to the screenshot - high (1) to low (3)
    decimal priority?;
    # number of credits taken
    decimal cost?;
};

public type Instance record {
    # instance ID (required to requests screenshots)
    int id?;
    # screen width in pixels
    int width?;
    # screen height in pixels
    int height?;
    # instance load: 
    # < 1: new screenshot requests will be processed immediately, 
    # 1-2: new screenshot requests will be processed in about two minutes, 
    # 2-3: new screenshot requests will be processed in about four minutes, 
    # 3-4: new screenshot requests will be processed in about six minutes, 
    # etc.
    float load?;
    Browser browser?;
    # public, shared or private
    string 'type?;
    # number of credits for each screenshot
    int screenshot_cost?;
    # instance's country of origin
    string country?;
};

public type BatchError record {
    # description of the problem that occurred
    string _error?;
    # status of the request - "in_queue", "processing", "finished", "error"
    string status?;
};

public type ScreenshotHost record {
    # screenshot ID
    int id?;
    # status of the request: "error", "ok" or "in_queue"
    string status?;
    # URL to the hosted screenshot or thumbnail
    string url?;
};

public type ScreenshotInfoError record {
    # screenshot ID
    int id?;
    # description of the problem that occurred
    string _error?;
    # status of the request - "in_queue", "processing", "finished", "error"
    string status?;
};

public type ScreenshotList record {
    decimal 'default?;
};

public type AccountError record {
    # description of the problem that occurred
    string _error?;
    # status of the request - error
    string status?;
};

public type BrowserError record {
    # description of the problem that occurred
    string _error?;
    # status of the request - error
    string status?;
};

public type Batch record {
    # batch ID
    int id?;
    # status of the request - "in_queue", "processing", "finished", "error"
    string status?;
    # time of processing (UNIX timestamp)
    int started?;
    # time of batch completed (UNIX timestamp)
    int finished?;
    # number of unique URLs in the batch
    int count?;
    # number of screenshots finishe
    int processed?;
    # number of screenshots failed
    int failed?;
    # URLs to download the batch
    string[] urls?;
};

public type BrowserList record {
    int 'default?;
};

public type ScreenshotShort record {
    # screenshot ID
    int id?;
    # status of the request
    string status?;
};

public type Screenshot record {
    # screenshot ID
    int id;
    # status of the request: "in_queue", "processing", "finished", "error"
    string status;
    # URL to download the screenshot
    record {} screenshot_url?;
    # description of the problem that occurred
    string _error?;
    # priority given to the screenshot: high (1) to low (3)
    int priority?;
    # original URL requested
    string url;
    # screenshot size requested
    string size?;
    # screenshot width
    int width?;
    # screenshot height
    int height?;
    # URL of the screenshot (redirections can occur)
    string final_url?;
    # image scale. Always 1 for desktop browsers; mobiles may change the scale (zoom in or zoom out) to fit the page on the screen
    float scale?;
    # instance ID used for the screenshot
    int instance_id;
    # number of credits spent for the screenshot
    int cost?;
    # custom referrer used (see Custom POST Data, Referer and Cookie)
    string referer?;
    # POST data sent (see Custom POST Data, Referer and Cookie)
    string post_data?;
    # custom cookie used (see Custom POST Data, Referer and Cookie)
    string cookie?;
    # number of seconds to wait after page load
    int delay?;
    # number of seconds to wait after page load if Flash elements are present
    int flash_delay?;
    # level of details about the screenshot and the page
    int details?;
    # URL of optional javascript file executed after the page load event
    string script?;
    # if the screenshot was shared, show the public URL
    string shared_url?;
};

public type InstanceError record {
    # description of the problem that occurred
    string _error?;
    # status of the request - error
    string status?;
};

public type InstanceList record {
    Instance[] shared?;
    Instance[] free?;
    Instance[] 'private?;
};

public type Body record {
    # instance ID to use
    int instance_id;
    # text file to use
    string file?;
    # screenshots size - "screen" (default) or "page"
    string size?;
    # name of the batch
    string name?;
    # thumbnail width.
    int width?;
    # thumbnail height
    int height?;
    # number of seconds to wait after the page has loaded. This is used to let JavaScript run longer before taking the screenshot. Use delay=0 to take screenshots faster.
    int delay?;
    # number of seconds to wait after the page has loaded if Flash elements are present. Use flash_delay=0 to take screenshots faster.
    int flash_delay?;
    # width of the browser window. For desktop browsers only.
    int screen_width?;
    # height of the browser window. For desktop browsers only. (Note: full-page screenshots can have a height of up to 15,000px)
    int screen_height?;
    # assign priority to the screenshot (for private instances only)
    int priority?;
    # use a custom referrer header - paid screenshots only
    string referer?;
    # send a POST requests with post_data, useful for filling out forms - paid screenshots only
    string post_data?;
    # set a cookie for the URL requested (see Custom POST Data, Referer and Cookie) Cookies should be separated by a ; - paid screenshots only
    string cookie?;
    # URL of javascript file to execute after the page load event
    string script?;
    # level of information available with screenshot/info
    int details?;
    # saves the HTML of the rendered page which can be retrieved by the API call screenshot/html. This feature costs *1 credit* per screenshot.
    int html?;
    # maximum number of seconds to wait before triggering the PageLoad event. Note that delay will still be used. (default: 0 = disabled)
    int max_wait?;
    # any custom HTTP headers. (Not supported with Internet Explorer)
    string headers?;
    # image as PNG or JPEG
    string format?;
};

public type Browser record {
    # browser ID
    int id?;
    # browser name and version: Firefox 45, etc.
    string name?;
    # JavaScript support: 1 if enabled, 0 if disabled
    int javascript?;
    # Flash support: 1 if enabled, 0 if disabled
    int flash?;
    # Mobile browser: 1 if true, 0 if false
    int mobile?;
};
