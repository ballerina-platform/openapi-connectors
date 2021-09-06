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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector for [RitKit API v1.0](https://documenter.getpostman.com/view/2010712/SzS7Qku5?version=latest) OpenAPI specification.  
# The RiteKit API provides the capability to perform social media marketing through hashtag suggestions, auto hashtagging, emoji suggestions, etc.
@display {label: "RiteKit", iconPath: "resources/ritekit.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [RitKit account](https://ritekit.com/) and obtain tokens by following [this guide](https://documenter.getpostman.com/view/2010712/SzS7Qku5?version=latest#intro).
    #
    # + apiKeyConfig - Provide your API Key as client_id. Eg: {client_id : <Your API Key>} 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.ritekit.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Auto-Emojify
    #
    # + text - Text of the post 
    # + return - OK 
    remote isolated function autoEmojify(string text) returns json|error {
        string  path = string `/v1/emoji/auto-emojify`;
        map<anydata> queryParam = {"text": text, "client_id": self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Emoji Suggestions
    #
    # + text - Text of the post 
    # + return - OK 
    remote isolated function emojiSuggestions(string text) returns json|error {
        string  path = string `/v1/emoji/suggestions`;
        map<anydata> queryParam = {"text": text, "client_id": self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Animate Image
    #
    # + url - URL of the company 
    # + 'type - URL of the company 
    # + return - OK 
    remote isolated function animateImage(string url, string 'type) returns json|error {
        string  path = string `/v1/images/animate`;
        map<anydata> queryParam = {"url": url, "type": 'type, "client_id": self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Company Logo
    #
    # + domain - URL of the company 
    # + return - Successful response 
    remote isolated function companyLogo(string domain) returns http:Response|error {
        string  path = string `/v1/images/logo`;
        map<anydata> queryParam = {"domain": domain, "client_id": self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Text to Image
    #
    # + quote - Text of the quote 
    # + author - Name of the author/source 
    # + fontSize - Font size for the quote (author font size is calculated automatically) 
    # + quoteFont - Font-family used for quote text 
    # + quoteFontColor - Font color of the quote text 
    # + authorFont - Font-family used for author name 
    # + authorFontColor - Font color of the author 
    # + enableHighlight - Enable highlight on quote text 
    # + highlightColor - Color used for highlight 
    # + bgType - Background type (gradient/solid) 
    # + backgroundColor - Background color for solid background type 
    # + gradientType - Type of gradient background (linear/radial) 
    # + gradientColor1 - First color for gradient background type 
    # + gradientColor2 - Second color for gradient background type 
    # + brandLogo - URL of the brand logo 
    # + animation - Animation type: none, rays, glint, circle 
    # + showQuoteMark - showing/hiding quote mark 
    # + return - OK 
    remote isolated function textToImage(string quote, string author, int fontSize, string quoteFont, string quoteFontColor, string authorFont, string authorFontColor, int enableHighlight, string highlightColor, string bgType, string backgroundColor, string gradientType, string gradientColor1, string gradientColor2, string brandLogo, string animation, int? showQuoteMark = ()) returns json|error {
        string  path = string `/v1/images/quote`;
        map<anydata> queryParam = {"quote": quote, "author": author, "fontSize": fontSize, "quoteFont": quoteFont, "quoteFontColor": quoteFontColor, "authorFont": authorFont, "authorFontColor": authorFontColor, "enableHighlight": enableHighlight, "highlightColor": highlightColor, "bgType": bgType, "backgroundColor": backgroundColor, "gradientType": gradientType, "gradientColor1": gradientColor1, "gradientColor2": gradientColor2, "brandLogo": brandLogo, "animation": animation, "showQuoteMark": showQuoteMark, "client_id": self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # List of CTAs
    #
    # + return - OK 
    remote isolated function listOfCtas() returns json|error {
        string  path = string `/v1/link/cta`;
        map<anydata> queryParam = {"client_id": self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Shorten Link
    #
    # + url - URL 
    # + cta - cta id 
    # + return - OK 
    remote isolated function shortenLink(string url, int cta) returns json|error {
        string  path = string `/v1/link/short-link`;
        map<anydata> queryParam = {"url": url, "cta": cta, "client_id": self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Trending Hashtags
    #
    # + green - Restrict results only to green hashtags. Hides overused (red) hashtags. 
    # + latin - Restrict results only to hashtags with latin characters 
    # + return - OK 
    remote isolated function trendingHashtags(string green = "1", string latin = "1") returns json|error {
        string  path = string `/v1/search/trending`;
        map<anydata> queryParam = {"green": green, "latin": latin, "client_id": self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Auto-Hashtag
    #
    # + post - Text of the post 
    # + maxHashtags - Max number of hashtags. 
    # + hashtagPosition - Position of hashtags: end => at the end, auto => anywhere 
    # + return - OK 
    remote isolated function autoHashtag(string post, int maxHashtags = 2, string hashtagPosition = "auto") returns json|error {
        string  path = string `/v1/stats/auto-hashtag`;
        map<anydata> queryParam = {"post": post, "maxHashtags": maxHashtags, "hashtagPosition": hashtagPosition, "client_id": self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Hashtag Suggestions
    #
    # + text - Topic 
    # + return - OK 
    remote isolated function hashtagSuggestions(string text) returns json|error {
        string  path = string `/v1/stats/hashtag-suggestions`;
        map<anydata> queryParam = {"text": text, "client_id": self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Hashtag History
    #
    # + hashtag - Hashtag without # mark 
    # + return - OK 
    remote isolated function hashtagHistory(string hashtag) returns json|error {
        string  path = string `/v1/stats/history/${hashtag}`;
        map<anydata> queryParam = {"client_id": self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Hashtag Stats
    #
    # + tags - Hashtag(s) without # mark 
    # + return - OK 
    remote isolated function hashtagStats(string tags) returns json|error {
        string  path = string `/v1/stats/multiple-hashtags`;
        map<anydata> queryParam = {"tags": tags, "client_id": self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Hashtags cleaner
    #
    # + post - post 
    # + return - OK 
    remote isolated function hashtagsCleaner(string post) returns json|error {
        string  path = string `/v2/instagram/hashtags-cleaner`;
        map<anydata> queryParam = {"post": post, "client_id": self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
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
