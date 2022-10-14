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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `X-ListenAPI-Key`
    string xListenapiKey;
|};

# This is a generated connector for [Listen Notes API v2.0](https://www.listennotes.com/) OpenAPI specification. 
# Simple & no-nonsense podcast search & directory API. Search all podcasts and episodes by people, places, or topics.
@display {label: "Listen Notes", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Listen Notes account](https://www.listennotes.com/) and obtain tokens by following [this guide](https://help.listennotes.com/en/articles/3416436-how-to-get-an-api-token-of-listen-notes-api).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://listen-api.listennotes.com/api/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Full-text search
    #
    # + q - Search term, e.g., person, place, topic... You can use double quotes to do verbatim match, e.g., "game of thrones". Otherwise, it's fuzzy search. 
    # + sortByDate - Sort by date or not? If 0, then sort by relevance. If 1, then sort by date. 
    # + 'type - What type of contents do you want to search for?  
    # + offset - Offset for search results, for pagination. You'll use **next_offset** from response for this parameter. 
    # + lenMin - Minimum audio length in minutes. Applicable only when type parameter is **episode**. 
    # + lenMax - Maximum audio length in minutes. Applicable only when type parameter is **episode**. 
    # + episodeCountMin - Minimum number of episodes. Applicable only when type parameter is **podcast**. 
    # + episodeCountMax - Maximum number of episodes. Applicable only when type parameter is **podcast**. 
    # + genreIds - A comma-delimited string of a list of genre ids. If not specified, then all genres are included. You can find the id and the name of all genres from `GET /genres`. It works only when **type** is *episode* or *podcast*. 
    # + publishedBefore - Only show episodes/podcasts/curated lists published before this timestamp (in milliseconds). If **published_before** & **published_after** are used at the same time, **published_before** should be bigger than **published_after**. 
    # + publishedAfter - Only show episodes/podcasts/curated lists published after this timestamp (in milliseconds). If **published_before** & **published_after** are used at the same time, **published_before** should be bigger than **published_after**. 
    # + onlyIn - A comma-delimited string to search only in specific fields. Allowed values are title, description, author, and audio. If not specified, then search every fields. 
    # + language - Limit search results to a specific language. If not specified, it'll be any language. You can get a list of supported languages from `GET /languages`. It works only when **type** is *episode* or *podcast*. 
    # + region - Limit search results to a specific region (e.g., us, gb, in...). If not specified, it'll be any region. You can get the supported country codes from `GET /regions`. It works only when **type** is *episode* or *podcast*. 
    # + ocid - A comma-delimited string of podcast ids (up to 5 podcasts) - you can get a podcast id from the **podcast_id** field in response. This parameter is to limit search results from only a few specific podcasts. It works only when **type** is *episode*. 
    # + ncid - A comma-delimited string of podcast ids (up to 5 podcasts) - you can get a podcast id from the **podcast_id** field in response. This parameter is to exclude search results of a few specific podcasts. It works only when **type** is *episode*. 
    # + safeMode - Whether or not to exclude podcasts/episodes with explicit language. 1 is yes and 0 is no. It works only when **type** is *episode* or *podcast*. 
    # + return - OK 
    remote isolated function search(string q, int sortByDate = 0, string 'type = "episode", int offset = 0, int lenMin = 0, int? lenMax = (), int? episodeCountMin = (), int? episodeCountMax = (), string? genreIds = (), int? publishedBefore = (), int publishedAfter = 0, string onlyIn = "title,description,author,audio", string? language = (), string? region = (), string? ocid = (), string? ncid = (), int safeMode = 0) returns SearchResponse|error {
        string resourcePath = string `/search`;
        map<anydata> queryParam = {"q": q, "sort_by_date": sortByDate, "type": 'type, "offset": offset, "len_min": lenMin, "len_max": lenMax, "episode_count_min": episodeCountMin, "episode_count_max": episodeCountMax, "genre_ids": genreIds, "published_before": publishedBefore, "published_after": publishedAfter, "only_in": onlyIn, "language": language, "region": region, "ocid": ocid, "ncid": ncid, "safe_mode": safeMode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-ListenAPI-Key": self.apiKeyConfig.xListenapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SearchResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Typeahead search
    #
    # + q - Search term, e.g., person, place, topic... You can use double quotes to do verbatim match, e.g., "game of thrones". Otherwise, it's fuzzy search. 
    # + showPodcasts - Autosuggest podcasts. This only searches podcast title and publisher and returns very limited info of 5 podcasts. 1 is yes, 0 is no. It's a bit slow to autosuggest podcasts, so we turn it off by default. If show_podcasts=1, you can also pass iTunes id (e.g., 474722933) to the q parameter to fetch podcast meta data. 
    # + showGenres - Whether or not to autosuggest genres. 1 is yes, 0 is no. 
    # + safeMode - Whether or not to exclude podcasts/episodes with explicit language. 1 is yes and 0 is no. It works only when **show_podcasts** is *1*. 
    # + return - OK 
    remote isolated function typeahead(string q, int showPodcasts = 0, int showGenres = 0, int safeMode = 0) returns TypeaheadResponse|error {
        string resourcePath = string `/typeahead`;
        map<anydata> queryParam = {"q": q, "show_podcasts": showPodcasts, "show_genres": showGenres, "safe_mode": safeMode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-ListenAPI-Key": self.apiKeyConfig.xListenapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TypeaheadResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Fetch a list of best podcasts by genre
    #
    # + genreId - You can get the id from `GET /genres`. If not specified, it'll be the overall best podcasts, which can be considered as a special genre. 
    # + page - Page number of those podcasts in this genre. 
    # + region - Filter best podcasts by country/region. Please note that podcasts that are "best" in a country/region may not be produced in that country/region. For example, a podcast from the US may be very popular in Canada. You can get the supported country codes (e.g., us, jp, gb...) from `GET /regions`. If not specified, you'll get "best podcasts" in United States. 
    # + publisherRegion - Filter best podcasts by the publisher's country/region. This is to narrow down the results to include "best podcasts" produced in a specific country/region. You can get the supported country codes (e.g., us, jp, gb...) from `GET /regions`. If not specified, you'll get "best podcasts" produced in any country/region. If you want to get a country/region's "best podcasts" that are also produced in that country/region, then you need to specify both **region** and **publisher_region**, e.g., `region=jp` and `publisher_region=jp`. 
    # + language - Filter best podcasts by language. You can get a list of supported languages (e.g., English, Chinese, Japanese...) from `GET /languages`. If not specified, you'll get "best podcasts" in any language. 
    # + safeMode - Whether or not to exclude podcasts with explicit language. 1 is yes, and 0 is no. 
    # + return - OK 
    remote isolated function getBestPodcasts(string? genreId = (), int? page = (), string region = "us", string? publisherRegion = (), string? language = (), int safeMode = 0) returns BestPodcastsResponse|error {
        string resourcePath = string `/best_podcasts`;
        map<anydata> queryParam = {"genre_id": genreId, "page": page, "region": region, "publisher_region": publisherRegion, "language": language, "safe_mode": safeMode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-ListenAPI-Key": self.apiKeyConfig.xListenapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BestPodcastsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Fetch detailed meta data and episodes for a podcast by id
    #
    # + id - Podcast id. You can get podcast id from using other endpoints, e.g., `GET /search`, `GET /best_podcasts`... 
    # + nextEpisodePubDate - For episodes pagination. It's the value of **next_episode_pub_date** from the response of last request. If not specified, just return latest 10 episodes or oldest 10 episodes, depending on the value of the **sort** parameter. 
    # + sort - How do you want to sort the episodes of this podcast? 
    # + return - OK 
    remote isolated function getPodcastById(string id, int? nextEpisodePubDate = (), string sort = "recent_first") returns PodcastFull|error {
        string resourcePath = string `/podcasts/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"next_episode_pub_date": nextEpisodePubDate, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-ListenAPI-Key": self.apiKeyConfig.xListenapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PodcastFull response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request to delete a podcast
    #
    # + id - Podcast id. You can get podcast id from using other endpoints, e.g., `GET /search`, `GET /best_podcasts`... 
    # + reason - The reason why this podcast should be deleted, e.g., copyright violation, the podcaster wants to delete it... You can put "testing" here to indicate that you are testing this endpoint, so we will not actually delete the podcast. 
    # + return - OK 
    remote isolated function deletePodcastById(string id, string? reason = ()) returns DeletePodcastResponse|error {
        string resourcePath = string `/podcasts/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"reason": reason};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-ListenAPI-Key": self.apiKeyConfig.xListenapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DeletePodcastResponse response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Fetch detailed meta data for an episode by id
    #
    # + id - id for a specific episode. You can get episode id from using other endpoints, e.g., `GET /search`... 
    # + showTranscript - To include the transcript of this episode or not? If it is 1, then include the transcript in the **transcript** field. The default value is 0 - we don't include transcript by default, because 1) it would make the response data very big, thus slow response time; 2) less than 1% of episodes have transcripts. The transcript field is available only in the PRO/ENTERPRISE plan. 
    # + return - OK 
    remote isolated function getEpisodeById(string id, int showTranscript = 0) returns EpisodeFull|error {
        string resourcePath = string `/episodes/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"show_transcript": showTranscript};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-ListenAPI-Key": self.apiKeyConfig.xListenapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EpisodeFull response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Batch fetch basic meta data for episodes
    #
    # + payload - Get episodes batch payload 
    # + return - OK 
    remote isolated function getEpisodesInBatch(GetEpisodesInBatchForm payload) returns GetEpisodesInBatchResponse|error {
        string resourcePath = string `/episodes`;
        map<any> headerValues = {"X-ListenAPI-Key": self.apiKeyConfig.xListenapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        GetEpisodesInBatchResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Batch fetch basic meta data for podcasts
    #
    # + payload - Get podcasts batch payload 
    # + return - OK 
    remote isolated function getPodcastsInBatch(GetPodcastsInBatchForm payload) returns GetPodcastsInBatchResponse|error {
        string resourcePath = string `/podcasts`;
        map<any> headerValues = {"X-ListenAPI-Key": self.apiKeyConfig.xListenapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        GetPodcastsInBatchResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Fetch a curated list of podcasts by id
    #
    # + id - id for a specific curated list of podcasts. You can get the id from the response of `GET /search?type=curated` or `GET /curated_podcasts`. 
    # + return - OK 
    remote isolated function getCuratedPodcastById(string id) returns CuratedListFull|error {
        string resourcePath = string `/curated_podcasts/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-ListenAPI-Key": self.apiKeyConfig.xListenapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CuratedListFull response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Fetch a list of podcast genres
    #
    # + topLevelOnly - Just show top level genres? If 1, yes, just show top level genres. If 0, no, show all genres. 
    # + return - OK 
    remote isolated function getGenres(int topLevelOnly = 0) returns GetGenresResponse|error {
        string resourcePath = string `/genres`;
        map<anydata> queryParam = {"top_level_only": topLevelOnly};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-ListenAPI-Key": self.apiKeyConfig.xListenapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetGenresResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Fetch a list of supported countries/regions for best podcasts
    #
    # + return - OK 
    remote isolated function getRegions() returns GetRegionsResponse|error {
        string resourcePath = string `/regions`;
        map<any> headerValues = {"X-ListenAPI-Key": self.apiKeyConfig.xListenapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetRegionsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Fetch a list of supported languages for podcasts
    #
    # + return - OK 
    remote isolated function getLanguages() returns GetLanguagesResponse|error {
        string resourcePath = string `/languages`;
        map<any> headerValues = {"X-ListenAPI-Key": self.apiKeyConfig.xListenapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetLanguagesResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Fetch a random podcast episode
    #
    # + return - OK 
    remote isolated function justListen() returns EpisodeSimple|error {
        string resourcePath = string `/just_listen`;
        map<any> headerValues = {"X-ListenAPI-Key": self.apiKeyConfig.xListenapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EpisodeSimple response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Fetch curated lists of podcasts
    #
    # + page - Page number of curated lists. 
    # + return - OK 
    remote isolated function getCuratedPodcasts(int page = 1) returns GetCuratedPodcastsResponse|error {
        string resourcePath = string `/curated_podcasts`;
        map<anydata> queryParam = {"page": page};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-ListenAPI-Key": self.apiKeyConfig.xListenapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetCuratedPodcastsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Fetch recommendations for a podcast
    #
    # + id - Podcast id. 
    # + safeMode - Whether or not to exclude podcasts with explicit language. 1 is yes, and 0 is no. 
    # + return - OK 
    remote isolated function getPodcastRecommendations(string id, int safeMode = 0) returns GetPodcastRecommendationsResponse|error {
        string resourcePath = string `/podcasts/${getEncodedUri(id)}/recommendations`;
        map<anydata> queryParam = {"safe_mode": safeMode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-ListenAPI-Key": self.apiKeyConfig.xListenapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetPodcastRecommendationsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Fetch recommendations for an episode
    #
    # + id - Episode id. 
    # + safeMode - Whether or not to exclude podcasts with explicit language. 1 is yes, and 0 is no. 
    # + return - OK 
    remote isolated function getEpisodeRecommendations(string id, int safeMode = 0) returns GetEpisodeRecommendationsResponse|error {
        string resourcePath = string `/episodes/${getEncodedUri(id)}/recommendations`;
        map<anydata> queryParam = {"safe_mode": safeMode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-ListenAPI-Key": self.apiKeyConfig.xListenapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetEpisodeRecommendationsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Submit a podcast to Listen Notes database
    #
    # + payload - Submit podcast payload 
    # + return - OK 
    remote isolated function submitPodcast(SubmitPodcastForm payload) returns SubmitPodcastResponse|error {
        string resourcePath = string `/podcasts/submit`;
        map<any> headerValues = {"X-ListenAPI-Key": self.apiKeyConfig.xListenapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        SubmitPodcastResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Fetch a playlist's info and items (i.e., episodes or podcasts).
    #
    # + id - Playlist id (always 11 characters, e.g., m1pe7z60bsw). You can get the podcast id from the url of a playlist, e.g., m1pe7z60bsw is the playlist id of listennotes.com/listen/podcasts-about-podcasting-m1pe7z60bsw 
    # + 'type - The type of this playlist, which should be either **episode_list** or **podcast_list**. 
    # + lastTimestampMs - For playlist items pagination. It's the value of **last_timestamp_ms** from the response of last request. If it's 0 or not specified, just return the latest or the oldest 20 items, depending on the value of the **sort** parameter. 
    # + sort - How do you want to sort playlist items? 
    # + return - OK 
    remote isolated function getPlaylistById(string id, string 'type = "episode_list", int lastTimestampMs = 0, string sort = "recent_added_first") returns PlaylistResponse|error {
        string resourcePath = string `/playlists/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"type": 'type, "last_timestamp_ms": lastTimestampMs, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-ListenAPI-Key": self.apiKeyConfig.xListenapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PlaylistResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Fetch a list of your playlists.
    #
    # + sort - How do you want to sort playlists? 
    # + page - Page number of playlists. 
    # + return - OK 
    remote isolated function getPlaylists(string sort = "recent_added_first", int page = 1) returns PlaylistsResponse|error {
        string resourcePath = string `/playlists`;
        map<anydata> queryParam = {"sort": sort, "page": page};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-ListenAPI-Key": self.apiKeyConfig.xListenapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PlaylistsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
