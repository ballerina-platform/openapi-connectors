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

# News API error response
public type WSNewsErrorResponse record {
    # If request was successful or not. Options: ok, error. In case of ok, below two properties will not be present
    string status?;
    # Short code identifying type of error returned
    string code?;
    # Fuller description of error, usually including how to fix it
    string message?;
};

# Record representing list sources
public type WSNewsSourcesResponse record {
    # If request was successful or not. Options: ok, error. In case of ok, below two properties will not be present
    string status?;
    # Results of request
    WSNewsSource[] sources?;
};

# Record representing a news article
public type WSNewsArticle record {
    # Record representing source of a news articles
    WSNewsSource 'source?;
    # Author of article
    string? author?;
    # Headline or title of article
    string title?;
    # Description or snippet from article
    string? description?;
    # Direct URL to article
    string? url?;
    # URL to a relevant image for article
    string? urlToImage?;
    # Date and time that article was published, in UTC (+000)
    string publishedAt?;
    # Unformatted content of article, where available. This is truncated to 200 chars
    string? content?;
};

# Record representing source of a news articles
public type WSNewsSource record {
    # Identifier of news source. You can use this with our other endpoints
    string? id?;
    # Name of news source
    string name?;
    # Description of news source
    string description?;
    # URL of homepage
    string url?;
    # Find sources that display news of this category. Default: all categories
    string category?;
    # Find sources that display news in a specific language. Possible options: ar de en es fr he it nl no pt ru se ud zh .Default: all languages
    string language?;
    # Find sources that display news in a specific country. Default: all countries
    string country?;
};

# Record representing top headlines
public type WSNewsTopHeadlineResponse record {
    # If request was successful or not. Options: ok, error. In case of error a code and message property will be populated
    string status?;
    # Total number of results available for request. Only a limited number are shown at a time though, so use page parameter in requests to page through them
    int totalResults?;
    # Results of request
    WSNewsArticle[] articles?;
};
