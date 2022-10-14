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

public type Entity record {
    string id?;
    string typeId?;
    string url?;
};

public type ChannelSectionListResponse record {
    # Etag of this resource.
    string etag?;
    # Serialized EventId of the request which produced this response.
    string eventId?;
    # A list of ChannelSections that match the request criteria.
    ChannelSection[] items?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#channelSectionListResponse".
    string kind?;
    # The visitorId identifies the visitor.
    string visitorId?;
};

# Describes original video file properties, including technical details about audio and video streams, but also metadata information like content length, digitization time, or geotagging information.
public type VideoFileDetails record {
    # A list of audio streams contained in the uploaded video file. Each item in the list contains detailed metadata about an audio stream.
    VideoFileDetailsAudioStream[] audioStreams?;
    # The uploaded video file's combined (video and audio) bitrate in bits per second.
    string bitrateBps?;
    # The uploaded video file's container format.
    string container?;
    # The date and time when the uploaded video file was created. The value is specified in ISO 8601 format. Currently, the following ISO 8601 formats are supported: - Date only: YYYY-MM-DD - Naive time: YYYY-MM-DDTHH:MM:SS - Time with timezone: YYYY-MM-DDTHH:MM:SS+HH:MM 
    string creationTime?;
    # The length of the uploaded video in milliseconds.
    string durationMs?;
    # The uploaded file's name. This field is present whether a video file or another type of file was uploaded.
    string fileName?;
    # The uploaded file's size in bytes. This field is present whether a video file or another type of file was uploaded.
    string fileSize?;
    # The uploaded file's type as detected by YouTube's video processing engine. Currently, YouTube only processes video files, but this field is present whether a video file or another type of file was uploaded.
    string fileType?;
    # A list of video streams contained in the uploaded video file. Each item in the list contains detailed metadata about a video stream.
    VideoFileDetailsVideoStream[] videoStreams?;
};

# LINT.IfChange Describes an invideo branding.
public type InvideoBranding record {
    # The bytes the uploaded image. Only used in api to youtube communication.
    string imageBytes?;
    # The url of the uploaded image. Only used in apiary to api communication.
    string imageUrl?;
    # Describes the spatial position of a visual widget inside a video. It is a union of various position types, out of which only will be set one.
    InvideoPosition position?;
    # The channel to which this branding links. If not present it defaults to the current channel.
    string targetChannelId?;
    # Describes a temporal position of a visual widget inside a video.
    InvideoTiming timing?;
};

# Basic details about a channel, including title, description and thumbnails.
public type ChannelSnippet record {
    # The country of the channel.
    string country?;
    # The custom url of the channel.
    string customUrl?;
    # The language of the channel's default title and description.
    string defaultLanguage?;
    # The description of the channel.
    string description?;
    # Channel localization setting
    ChannelLocalization localized?;
    # The date and time that the channel was created.
    string publishedAt?;
    # Internal representation of thumbnails for a YouTube resource.
    ThumbnailDetails thumbnails?;
    # The channel's title.
    string title?;
};

# Pings that the app shall fire (authenticated by biscotti cookie). Each ping has a context, in which the app must fire the ping, and a url identifying the ping.
public type ChannelConversionPing record {
    # Defines the context of the ping.
    string context?;
    # The url (without the schema) that the player shall send the ping to. It's at caller's descretion to decide which schema to use (http vs https) Example of a returned url: //googleads.g.doubleclick.net/pagead/ viewthroughconversion/962985656/?data=path%3DtHe_path%3Btype%3D cview%3Butuid%3DGISQtTNGYqaYl4sKxoVvKA&labe=default The caller must append biscotti authentication (ms param in case of mobile, for example) to this ping.
    string conversionUrl?;
};

# Basic details about rating of a video.
public type VideoRating record {
    # Rating of a video.
    string rating?;
    # The ID that YouTube uses to uniquely identify the video.
    string videoId?;
};

# A thumbnail is an image representing a YouTube resource.
public type Thumbnail record {
    # (Optional) Height of the thumbnail image.
    int height?;
    # The thumbnail image's URL.
    string url?;
    # (Optional) Width of the thumbnail image.
    int width?;
};

public type VideoAbuseReportReasonListResponse record {
    # Etag of this resource.
    string etag?;
    # Serialized EventId of the request which produced this response.
    string eventId?;
    # A list of valid abuse reasons that are used with `video.ReportAbuse`.
    VideoAbuseReportReason[] items?;
    # Identifies what kind of resource this is. Value: the fixed string `"youtube#videoAbuseReportReasonListResponse"`.
    string kind?;
    # The `visitorId` identifies the visitor.
    string visitorId?;
};

# A *playlist* resource represents a YouTube playlist. A playlist is a collection of videos that can be viewed sequentially and shared with other users. A playlist can contain up to 200 videos, and YouTube does not limit the number of playlists that each user creates. By default, playlists are publicly visible to other users, but playlists can be public or private. YouTube also uses playlists to identify special collections of videos for a channel, such as: - uploaded videos - favorite videos - positively rated (liked) videos - watch history - watch later To be more specific, these lists are associated with a channel, which is a collection of a person, group, or company's videos, playlists, and other YouTube information. You can retrieve the playlist IDs for each of these lists from the channel resource for a given channel. You can then use the playlistItems.list method to retrieve any of those lists. You can also add or remove items from those lists by calling the playlistItems.insert and playlistItems.delete methods.
public type Playlist record {
    PlaylistContentDetails contentDetails?;
    # Etag of this resource.
    string etag?;
    # The ID that YouTube uses to uniquely identify the playlist.
    string id?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#playlist".
    string kind?;
    # Localizations for different languages
    record {} localizations?;
    PlaylistPlayer player?;
    # Basic details about a playlist, including title, description and thumbnails.
    PlaylistSnippet snippet?;
    PlaylistStatus status?;
};

# Describes the spatial position of a visual widget inside a video. It is a union of various position types, out of which only will be set one.
public type InvideoPosition record {
    # Describes in which corner of the video the visual widget will appear.
    string cornerPosition?;
    # Defines the position type.
    string 'type?;
};

# Details about the live streaming metadata.
public type VideoLiveStreamingDetails record {
    # The ID of the currently active live chat attached to this video. This field is filled only if the video is a currently live broadcast that has live chat. Once the broadcast transitions to complete this field will be removed and the live chat closed down. For persistent broadcasts that live chat id will no longer be tied to this video but rather to the new video being displayed at the persistent page.
    string activeLiveChatId?;
    # The time that the broadcast actually ended. This value will not be available until the broadcast is over.
    string actualEndTime?;
    # The time that the broadcast actually started. This value will not be available until the broadcast begins.
    string actualStartTime?;
    # The number of viewers currently watching the broadcast. The property and its value will be present if the broadcast has current viewers and the broadcast owner has not hidden the viewcount for the video. Note that YouTube stops tracking the number of concurrent viewers for a broadcast when the broadcast ends. So, this property would not identify the number of viewers watching an archived video of a live broadcast that already ended.
    string concurrentViewers?;
    # The time that the broadcast is scheduled to end. If the value is empty or the property is not present, then the broadcast is scheduled to contiue indefinitely.
    string scheduledEndTime?;
    # The time that the broadcast is scheduled to begin.
    string scheduledStartTime?;
};

# The auditDetails object encapsulates channel data that is relevant for YouTube Partners during the audit process.
public type ChannelAuditDetails record {
    # Whether or not the channel respects the community guidelines.
    boolean communityGuidelinesGoodStanding?;
    # Whether or not the channel has any unresolved claims.
    boolean contentIdClaimsGoodStanding?;
    # Whether or not the channel has any copyright strikes.
    boolean copyrightStrikesGoodStanding?;
};

# A *subscription* resource contains information about a YouTube user subscription. A subscription notifies a user when new videos are added to a channel or when another user takes one of several actions on YouTube, such as uploading a video, rating a video, or commenting on a video.
public type Subscription record {
    # Details about the content to witch a subscription refers.
    SubscriptionContentDetails contentDetails?;
    # Etag of this resource.
    string etag?;
    # The ID that YouTube uses to uniquely identify the subscription.
    string id?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#subscription".
    string kind?;
    # Basic details about a subscription, including title, description and thumbnails of the subscribed item.
    SubscriptionSnippet snippet?;
    # Basic details about a subscription's subscriber including title, description, channel ID and thumbnails.
    SubscriptionSubscriberSnippet subscriberSnippet?;
};

# Stub token pagination template to suppress results.
public type TokenPagination record {
};

# Details about the content of a channel.
public type ChannelContentDetails record {
    ChannelcontentdetailsRelatedplaylists relatedPlaylists?;
};

# DEPRECATED. b/157517979: This part was never populated after it was added. However, it sees non-zero traffic because there is generated client code in the wild that refers to it [1]. We keep this field and do NOT remove it because otherwise V3 would return an error when this part gets requested [2]. [1] https://developers.google.com/resources/api-libraries/documentation/youtube/v3/csharp/latest/classGoogle_1_1Apis_1_1YouTube_1_1v3_1_1Data_1_1VideoProjectDetails.html [2] http://google3/video/youtube/src/python/servers/data_api/common.py?l=1565-1569&rcl=344141677
public type VideoProjectDetails record {
};

# A pair Property / Value.
public type PropertyValue record {
    # A property.
    string property?;
    # The property's value.
    string value?;
};

# Describes processing status and progress and availability of some other Video resource parts.
public type VideoProcessingDetails record {
    # This value indicates whether video editing suggestions, which might improve video quality or the playback experience, are available for the video. You can retrieve these suggestions by requesting the suggestions part in your videos.list() request.
    string editorSuggestionsAvailability?;
    # This value indicates whether file details are available for the uploaded video. You can retrieve a video's file details by requesting the fileDetails part in your videos.list() request.
    string fileDetailsAvailability?;
    # The reason that YouTube failed to process the video. This property will only have a value if the processingStatus property's value is failed.
    string processingFailureReason?;
    # This value indicates whether the video processing engine has generated suggestions that might improve YouTube's ability to process the the video, warnings that explain video processing problems, or errors that cause video processing problems. You can retrieve these suggestions by requesting the suggestions part in your videos.list() request.
    string processingIssuesAvailability?;
    # Video processing progress and completion time estimate.
    VideoProcessingDetailsProcessingProgress processingProgress?;
    # The video's processing status. This value indicates whether YouTube was able to process the video or if the video is still being processed.
    string processingStatus?;
    # This value indicates whether keyword (tag) suggestions are available for the video. Tags can be added to a video's metadata to make it easier for other users to find the video. You can retrieve these suggestions by requesting the suggestions part in your videos.list() request.
    string tagSuggestionsAvailability?;
    # This value indicates whether thumbnail images have been generated for the video.
    string thumbnailsAvailability?;
};

# Basic details about a subscription, including title, description and thumbnails of the subscribed item.
public type SubscriptionSnippet record {
    # The ID that YouTube uses to uniquely identify the subscriber's channel.
    string channelId?;
    # Channel title for the channel that the subscription belongs to.
    string channelTitle?;
    # The subscription's details.
    string description?;
    # The date and time that the subscription was created.
    string publishedAt?;
    # A resource id is a generic reference that points to another YouTube resource.
    ResourceId resourceId?;
    # Internal representation of thumbnails for a YouTube resource.
    ThumbnailDetails thumbnails?;
    # The subscription's title.
    string title?;
};

public type PlaylistStatus record {
    # The playlist's privacy status.
    string privacyStatus?;
};

public type ChannelcontentdetailsRelatedplaylists record {
    # The ID of the playlist that contains the channel"s favorite videos. Use the playlistItems.insert and playlistItems.delete to add or remove items from that list.
    string favorites?;
    # The ID of the playlist that contains the channel"s liked videos. Use the playlistItems.insert and playlistItems.delete to add or remove items from that list.
    string likes?;
    # The ID of the playlist that contains the channel"s uploaded videos. Use the videos.insert method to upload new videos and the videos.delete method to delete previously uploaded videos.
    string uploads?;
    # The ID of the playlist that contains the channel"s watch history. Use the playlistItems.insert and playlistItems.delete to add or remove items from that list.
    string watchHistory?;
    # The ID of the playlist that contains the channel"s watch later playlist. Use the playlistItems.insert and playlistItems.delete to add or remove items from that list.
    string watchLater?;
};

public type PlaylistItemContentDetails record {
    # The time, measured in seconds from the start of the video, when the video should stop playing. (The playlist owner can specify the times when the video should start and stop playing when the video is played in the context of the playlist.) By default, assume that the video.endTime is the end of the video.
    string endAt?;
    # A user-generated note for this item.
    string note?;
    # The time, measured in seconds from the start of the video, when the video should start playing. (The playlist owner can specify the times when the video should start and stop playing when the video is played in the context of the playlist.) The default value is 0.
    string startAt?;
    # The ID that YouTube uses to uniquely identify a video. To retrieve the video resource, set the id query parameter to this value in your API request.
    string videoId?;
    # The date and time that the video was published to YouTube.
    string videoPublishedAt?;
};

# Ratings schemes. The country-specific ratings are mostly for movies and shows. LINT.IfChange
public type ContentRating record {
    # The video's Australian Classification Board (ACB) or Australian Communications and Media Authority (ACMA) rating. ACMA ratings are used to classify children's television programming.
    string acbRating?;
    # The video's rating from Italy's Autorità per le Garanzie nelle Comunicazioni (AGCOM).
    string agcomRating?;
    # The video's Anatel (Asociación Nacional de Televisión) rating for Chilean television.
    string anatelRating?;
    # The video's British Board of Film Classification (BBFC) rating.
    string bbfcRating?;
    # The video's rating from Thailand's Board of Film and Video Censors.
    string bfvcRating?;
    # The video's rating from the Austrian Board of Media Classification (Bundesministerium für Unterricht, Kunst und Kultur).
    string bmukkRating?;
    # Rating system for Canadian TV - Canadian TV Classification System The video's rating from the Canadian Radio-Television and Telecommunications Commission (CRTC) for Canadian English-language broadcasts. For more information, see the Canadian Broadcast Standards Council website.
    string catvRating?;
    # The video's rating from the Canadian Radio-Television and Telecommunications Commission (CRTC) for Canadian French-language broadcasts. For more information, see the Canadian Broadcast Standards Council website.
    string catvfrRating?;
    # The video's Central Board of Film Certification (CBFC - India) rating.
    string cbfcRating?;
    # The video's Consejo de Calificación Cinematográfica (Chile) rating.
    string cccRating?;
    # The video's rating from Portugal's Comissão de Classificação de Espect´culos.
    string cceRating?;
    # The video's rating in Switzerland.
    string chfilmRating?;
    # The video's Canadian Home Video Rating System (CHVRS) rating.
    string chvrsRating?;
    # The video's rating from the Commission de Contrôle des Films (Belgium).
    string cicfRating?;
    # The video's rating from Romania's CONSILIUL NATIONAL AL AUDIOVIZUALULUI (CNA).
    string cnaRating?;
    # Rating system in France - Commission de classification cinematographique
    string cncRating?;
    # The video's rating from France's Conseil supérieur de l’audiovisuel, which rates broadcast content.
    string csaRating?;
    # The video's rating from Luxembourg's Commission de surveillance de la classification des films (CSCF).
    string cscfRating?;
    # The video's rating in the Czech Republic.
    string czfilmRating?;
    # The video's Departamento de Justiça, Classificação, Qualificação e Títulos (DJCQT - Brazil) rating.
    string djctqRating?;
    # Reasons that explain why the video received its DJCQT (Brazil) rating.
    string[] djctqRatingReasons?;
    # Rating system in Turkey - Evaluation and Classification Board of the Ministry of Culture and Tourism
    string ecbmctRating?;
    # The video's rating in Estonia.
    string eefilmRating?;
    # The video's rating in Egypt.
    string egfilmRating?;
    # The video's Eirin (映倫) rating. Eirin is the Japanese rating system.
    string eirinRating?;
    # The video's rating from Malaysia's Film Censorship Board.
    string fcbmRating?;
    # The video's rating from Hong Kong's Office for Film, Newspaper and Article Administration.
    string fcoRating?;
    # This property has been deprecated. Use the contentDetails.contentRating.cncRating instead.
    string fmocRating?;
    # The video's rating from South Africa's Film and Publication Board.
    string fpbRating?;
    # Reasons that explain why the video received its FPB (South Africa) rating.
    string[] fpbRatingReasons?;
    # The video's Freiwillige Selbstkontrolle der Filmwirtschaft (FSK - Germany) rating.
    string fskRating?;
    # The video's rating in Greece.
    string grfilmRating?;
    # The video's Instituto de la Cinematografía y de las Artes Audiovisuales (ICAA - Spain) rating.
    string icaaRating?;
    # The video's Irish Film Classification Office (IFCO - Ireland) rating. See the IFCO website for more information.
    string ifcoRating?;
    # The video's rating in Israel.
    string ilfilmRating?;
    # The video's INCAA (Instituto Nacional de Cine y Artes Audiovisuales - Argentina) rating.
    string incaaRating?;
    # The video's rating from the Kenya Film Classification Board.
    string kfcbRating?;
    # The video's NICAM/Kijkwijzer rating from the Nederlands Instituut voor de Classificatie van Audiovisuele Media (Netherlands).
    string kijkwijzerRating?;
    # The video's Korea Media Rating Board (영상물등급위원회) rating. The KMRB rates videos in South Korea.
    string kmrbRating?;
    # The video's rating from Indonesia's Lembaga Sensor Film.
    string lsfRating?;
    # The video's rating from Malta's Film Age-Classification Board.
    string mccaaRating?;
    # The video's rating from the Danish Film Institute's (Det Danske Filminstitut) Media Council for Children and Young People.
    string mccypRating?;
    # The video's rating system for Vietnam - MCST
    string mcstRating?;
    # The video's rating from Singapore's Media Development Authority (MDA) and, specifically, it's Board of Film Censors (BFC).
    string mdaRating?;
    # The video's rating from Medietilsynet, the Norwegian Media Authority.
    string medietilsynetRating?;
    # The video's rating from Finland's Kansallinen Audiovisuaalinen Instituutti (National Audiovisual Institute).
    string mekuRating?;
    # The rating system for MENA countries, a clone of MPAA. It is needed to prevent titles go live w/o additional QC check, since some of them can be inappropriate for the countries at all. See b/33408548 for more details.
    string menaMpaaRating?;
    # The video's rating from the Ministero dei Beni e delle Attività Culturali e del Turismo (Italy).
    string mibacRating?;
    # The video's Ministerio de Cultura (Colombia) rating.
    string mocRating?;
    # The video's rating from Taiwan's Ministry of Culture (文化部).
    string moctwRating?;
    # The video's Motion Picture Association of America (MPAA) rating.
    string mpaaRating?;
    # The rating system for trailer, DVD, and Ad in the US. See http://movielabs.com/md/ratings/v2.3/html/US_MPAAT_Ratings.html.
    string mpaatRating?;
    # The video's rating from the Movie and Television Review and Classification Board (Philippines).
    string mtrcbRating?;
    # The video's rating from the Maldives National Bureau of Classification.
    string nbcRating?;
    # The video's rating in Poland.
    string nbcplRating?;
    # The video's rating from the Bulgarian National Film Center.
    string nfrcRating?;
    # The video's rating from Nigeria's National Film and Video Censors Board.
    string nfvcbRating?;
    # The video's rating from the Nacionãlais Kino centrs (National Film Centre of Latvia).
    string nkclvRating?;
    # The National Media Council ratings system for United Arab Emirates.
    string nmcRating?;
    # The video's Office of Film and Literature Classification (OFLC - New Zealand) rating.
    string oflcRating?;
    # The video's rating in Peru.
    string pefilmRating?;
    # The video's rating from the Hungarian Nemzeti Filmiroda, the Rating Committee of the National Office of Film.
    string rcnofRating?;
    # The video's rating in Venezuela.
    string resorteviolenciaRating?;
    # The video's General Directorate of Radio, Television and Cinematography (Mexico) rating.
    string rtcRating?;
    # The video's rating from Ireland's Raidió Teilifís Éireann.
    string rteRating?;
    # The video's National Film Registry of the Russian Federation (MKRF - Russia) rating.
    string russiaRating?;
    # The video's rating in Slovakia.
    string skfilmRating?;
    # The video's rating in Iceland.
    string smaisRating?;
    # The video's rating from Statens medieråd (Sweden's National Media Council).
    string smsaRating?;
    # The video's TV Parental Guidelines (TVPG) rating.
    string tvpgRating?;
    # A rating that YouTube uses to identify age-restricted content.
    string ytRating?;
};

public type VideoAbuseReportSecondaryReason record {
    # The ID of this abuse report secondary reason.
    string id?;
    # The localized label for this abuse report secondary reason.
    string label?;
};

public type CaptionListResponse record {
    # Etag of this resource.
    string etag?;
    # Serialized EventId of the request which produced this response.
    string eventId?;
    # A list of captions that match the request criteria.
    Caption[] items?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#captionListResponse".
    string kind?;
    # The visitorId identifies the visitor.
    string visitorId?;
};

# Basic details about a comment, such as its author and text.
public type CommentSnippet record {
    # The id of the author's YouTube channel, if any.
    CommentSnippetAuthorChannelId authorChannelId?;
    # Link to the author's YouTube channel, if any.
    string authorChannelUrl?;
    # The name of the user who posted the comment.
    string authorDisplayName?;
    # The URL for the avatar of the user who posted the comment.
    string authorProfileImageUrl?;
    # Whether the current viewer can rate this comment.
    boolean canRate?;
    # The id of the corresponding YouTube channel. In case of a channel comment this is the channel the comment refers to. In case of a video comment it's the video's channel.
    string channelId?;
    # The total number of likes this comment has received.
    int likeCount?;
    # The comment's moderation status. Will not be set if the comments were requested through the id filter.
    string moderationStatus?;
    # The unique id of the parent comment, only set for replies.
    string parentId?;
    # The date and time when the comment was originally published.
    string publishedAt?;
    # The comment's text. The format is either plain text or HTML dependent on what has been requested. Even the plain text representation may differ from the text originally posted in that it may replace video links with video titles etc.
    string textDisplay?;
    # The comment's original raw text as initially posted or last updated. The original text will only be returned if it is accessible to the viewer, which is only guaranteed if the viewer is the comment's author.
    string textOriginal?;
    # The date and time when the comment was last updated.
    string updatedAt?;
    # The ID of the video the comment refers to, if any.
    string videoId?;
    # The rating the viewer has given to this comment. For the time being this will never return RATE_TYPE_DISLIKE and instead return RATE_TYPE_NONE. This may change in the future.
    string viewerRating?;
};

# A single tag suggestion with it's relevance information.
public type VideoSuggestionsTagSuggestion record {
    # A set of video categories for which the tag is relevant. You can use this information to display appropriate tag suggestions based on the video category that the video uploader associates with the video. By default, tag suggestions are relevant for all categories if there are no restricts defined for the keyword.
    string[] categoryRestricts?;
    # The keyword tag suggested for the video.
    string tag?;
};

public type VideoAbuseReport record {
    # Additional comments regarding the abuse report.
    string comments?;
    # The language that the content was viewed in.
    string language?;
    # The high-level, or primary, reason that the content is abusive. The value is an abuse report reason ID.
    string reasonId?;
    # The specific, or secondary, reason that this content is abusive (if available). The value is an abuse report reason ID that is a valid secondary reason for the primary reason.
    string secondaryReasonId?;
    # The ID that YouTube uses to uniquely identify the video.
    string videoId?;
};

# A `__videoAbuseReportReason__` resource identifies a reason that a video could be reported as abusive. Video abuse report reasons are used with `video.ReportAbuse`.
public type VideoAbuseReportReason record {
    # Etag of this resource.
    string etag?;
    # The ID of this abuse report reason.
    string id?;
    # Identifies what kind of resource this is. Value: the fixed string `"youtube#videoAbuseReportReason"`.
    string kind?;
    # Basic details about a video category, such as its localized title.
    VideoAbuseReportReasonSnippet snippet?;
};

# Channel localization setting
public type ChannelLocalization record {
    # The localized strings for channel's description.
    string description?;
    # The localized strings for channel's title.
    string title?;
};

# Specifies suggestions on how to improve video content, including encoding hints, tag suggestions, and editor suggestions.
public type VideoSuggestions record {
    # A list of video editing operations that might improve the video quality or playback experience of the uploaded video.
    string[] editorSuggestions?;
    # A list of errors that will prevent YouTube from successfully processing the uploaded video video. These errors indicate that, regardless of the video's current processing status, eventually, that status will almost certainly be failed.
    string[] processingErrors?;
    # A list of suggestions that may improve YouTube's ability to process the video.
    string[] processingHints?;
    # A list of reasons why YouTube may have difficulty transcoding the uploaded video or that might result in an erroneous transcoding. These warnings are generated before YouTube actually processes the uploaded video file. In addition, they identify issues that are unlikely to cause the video processing to fail but that might cause problems such as sync issues, video artifacts, or a missing audio track.
    string[] processingWarnings?;
    # A list of keyword tags that could be added to the video's metadata to increase the likelihood that users will locate your video when searching or browsing on YouTube.
    VideoSuggestionsTagSuggestion[] tagSuggestions?;
};

public type LanguageTag record {
    string value?;
};

# Statistics about a channel: number of subscribers, number of videos in the channel, etc.
public type ChannelStatistics record {
    # The number of comments for the channel.
    string commentCount?;
    # Whether or not the number of subscribers is shown for this user.
    boolean hiddenSubscriberCount?;
    # The number of subscribers that the channel has.
    string subscriberCount?;
    # The number of videos uploaded to the channel.
    string videoCount?;
    # The number of times the channel has been viewed.
    string viewCount?;
};

# Details about monetization of a YouTube Video.
public type VideoMonetizationDetails record {
    # Rights management policy for YouTube resources.
    AccessPolicy access?;
};

# Freebase topic information related to the channel.
public type ChannelTopicDetails record {
    # A list of Wikipedia URLs that describe the channel's content.
    string[] topicCategories?;
    # A list of Freebase topic IDs associated with the channel. You can retrieve information about each topic using the Freebase Topic API.
    string[] topicIds?;
};

public type AbuseReport record {
    AbuseType[] abuseTypes?;
    string description?;
    RelatedEntity[] relatedEntities?;
    Entity subject?;
};

# Playlist localization setting
public type PlaylistLocalization record {
    # The localized strings for playlist's description.
    string description?;
    # The localized strings for playlist's title.
    string title?;
};

public type PlaylistPlayer record {
    # An <iframe> tag that embeds a player that will play the playlist.
    string embedHtml?;
};

public type LocalizedProperty record {
    LanguageTag defaultLanguage?;
    LocalizedString[] localized?;
};

# Basic details about a video category, such as its localized title.
public type VideoAbuseReportReasonSnippet record {
    # The localized label belonging to this abuse report reason.
    string label?;
    # The secondary reasons associated with this reason, if any are available. (There might be 0 or more.)
    VideoAbuseReportSecondaryReason[] secondaryReasons?;
};

# Basic details about a video, including title, description, uploader, thumbnails and category.
public type VideoSnippet record {
    # The YouTube video category associated with the video.
    string categoryId?;
    # The ID that YouTube uses to uniquely identify the channel that the video was uploaded to.
    string channelId?;
    # Channel title for the channel that the video belongs to.
    string channelTitle?;
    # The default_audio_language property specifies the language spoken in the video's default audio track.
    string defaultAudioLanguage?;
    # The language of the videos's default snippet.
    string defaultLanguage?;
    # The video's description. @mutable youtube.videos.insert youtube.videos.update
    string description?;
    # Indicates if the video is an upcoming/active live broadcast. Or it's "none" if the video is not an upcoming/active live broadcast.
    string liveBroadcastContent?;
    # Localized versions of certain video properties (e.g. title).
    VideoLocalization localized?;
    # The date and time when the video was uploaded.
    string publishedAt?;
    # A list of keyword tags associated with the video. Tags may contain spaces.
    string[] tags?;
    # Internal representation of thumbnails for a YouTube resource.
    ThumbnailDetails thumbnails?;
    # The video's title. @mutable youtube.videos.insert youtube.videos.update
    string title?;
};

# DEPRECATED Region restriction of the video.
public type VideoContentDetailsRegionRestriction record {
    # A list of region codes that identify countries where the video is viewable. If this property is present and a country is not listed in its value, then the video is blocked from appearing in that country. If this property is present and contains an empty list, the video is blocked in all countries.
    string[] allowed?;
    # A list of region codes that identify countries where the video is blocked. If this property is present and a country is not listed in its value, then the video is viewable in that country. If this property is present and contains an empty list, the video is viewable in all countries.
    string[] blocked?;
};

# Video processing progress and completion time estimate.
public type VideoProcessingDetailsProcessingProgress record {
    # The number of parts of the video that YouTube has already processed. You can estimate the percentage of the video that YouTube has already processed by calculating: 100 * parts_processed / parts_total Note that since the estimated number of parts could increase without a corresponding increase in the number of parts that have already been processed, it is possible that the calculated progress could periodically decrease while YouTube processes a video.
    string partsProcessed?;
    # An estimate of the total number of parts that need to be processed for the video. The number may be updated with more precise estimates while YouTube processes the video.
    string partsTotal?;
    # An estimate of the amount of time, in millseconds, that YouTube needs to finish processing the video.
    string timeLeftMs?;
};

# A search result contains information about a YouTube video, channel, or playlist that matches the search parameters specified in an API request. While a search result points to a uniquely identifiable resource, like a video, it does not have its own persistent data.
public type SearchResult record {
    # Etag of this resource.
    string etag?;
    # A resource id is a generic reference that points to another YouTube resource.
    ResourceId id?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#searchResult".
    string kind?;
    # Basic details about a search result, including title, description and thumbnails of the item referenced by the search result.
    SearchResultSnippet snippet?;
};

# A resource id is a generic reference that points to another YouTube resource.
public type ResourceId record {
    # The ID that YouTube uses to uniquely identify the referred resource, if that resource is a channel. This property is only present if the resourceId.kind value is youtube#channel.
    string channelId?;
    # The type of the API resource.
    string kind?;
    # The ID that YouTube uses to uniquely identify the referred resource, if that resource is a playlist. This property is only present if the resourceId.kind value is youtube#playlist.
    string playlistId?;
    # The ID that YouTube uses to uniquely identify the referred resource, if that resource is a video. This property is only present if the resourceId.kind value is youtube#video.
    string videoId?;
};

# A *comment thread* represents information that applies to a top level comment and all its replies. It can also include the top level comment itself and some of the replies.
public type CommentThread record {
    # Etag of this resource.
    string etag?;
    # The ID that YouTube uses to uniquely identify the comment thread.
    string id?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#commentThread".
    string kind?;
    # Comments written in (direct or indirect) reply to the top level comment.
    CommentThreadReplies replies?;
    # Basic details about a comment thread.
    CommentThreadSnippet snippet?;
};

public type CommentListResponse record {
    # Etag of this resource.
    string etag?;
    # Serialized EventId of the request which produced this response.
    string eventId?;
    # A list of comments that match the request criteria.
    Comment[] items?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#commentListResponse".
    string kind?;
    # The token that can be used as the value of the pageToken parameter to retrieve the next page in the result set.
    string nextPageToken?;
    # Paging details for lists of resources, including total number of items available and number of resources returned in a single page.
    PageInfo pageInfo?;
    # Stub token pagination template to suppress results.
    TokenPagination tokenPagination?;
    # The visitorId identifies the visitor.
    string visitorId?;
};

# A *playlistItem* resource identifies another resource, such as a video, that is included in a playlist. In addition, the playlistItem resource contains details about the included resource that pertain specifically to how that resource is used in that playlist. YouTube uses playlists to identify special collections of videos for a channel, such as: - uploaded videos - favorite videos - positively rated (liked) videos - watch history - watch later To be more specific, these lists are associated with a channel, which is a collection of a person, group, or company's videos, playlists, and other YouTube information. You can retrieve the playlist IDs for each of these lists from the channel resource for a given channel. You can then use the playlistItems.list method to retrieve any of those lists. You can also add or remove items from those lists by calling the playlistItems.insert and playlistItems.delete methods. For example, if a user gives a positive rating to a video, you would insert that video into the liked videos playlist for that user's channel.
public type PlaylistItem record {
    PlaylistItemContentDetails contentDetails?;
    # Etag of this resource.
    string etag?;
    # The ID that YouTube uses to uniquely identify the playlist item.
    string id?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#playlistItem".
    string kind?;
    # Basic details about a playlist, including title, description and thumbnails. Basic details of a YouTube Playlist item provided by the author. Next ID: 15
    PlaylistItemSnippet snippet?;
    # Information about the playlist item's privacy status.
    PlaylistItemStatus status?;
};

# Basic details about a comment thread.
public type CommentThreadSnippet record {
    # Whether the current viewer of the thread can reply to it. This is viewer specific - other viewers may see a different value for this field.
    boolean canReply?;
    # The YouTube channel the comments in the thread refer to or the channel with the video the comments refer to. If video_id isn't set the comments refer to the channel itself.
    string channelId?;
    # Whether the thread (and therefore all its comments) is visible to all YouTube users.
    boolean isPublic?;
    # A *comment* represents a single YouTube comment.
    Comment topLevelComment?;
    # The total number of replies (not including the top level comment).
    int totalReplyCount?;
    # The ID of the video the comments refer to, if any. No video_id implies a channel discussion comment.
    string videoId?;
};

public type SearchListResponse record {
    # Etag of this resource.
    string etag?;
    # Serialized EventId of the request which produced this response.
    string eventId?;
    # Pagination information for token pagination.
    SearchResult[] items?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#searchListResponse".
    string kind?;
    # The token that can be used as the value of the pageToken parameter to retrieve the next page in the result set.
    string nextPageToken?;
    # Paging details for lists of resources, including total number of items available and number of resources returned in a single page.
    PageInfo pageInfo?;
    # The token that can be used as the value of the pageToken parameter to retrieve the previous page in the result set.
    string prevPageToken?;
    string regionCode?;
    # Stub token pagination template to suppress results.
    TokenPagination tokenPagination?;
    # The visitorId identifies the visitor.
    string visitorId?;
};

# Recording information associated with the video.
public type VideoRecordingDetails record {
    # Geographical coordinates of a point, in WGS84.
    GeoPoint location?;
    # The text description of the location where the video was recorded.
    string locationDescription?;
    # The date and time when the video was recorded.
    string recordingDate?;
};

public type SubscriptionListResponse record {
    # Etag of this resource.
    string etag?;
    # Serialized EventId of the request which produced this response.
    string eventId?;
    # A list of subscriptions that match the request criteria.
    Subscription[] items?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#subscriptionListResponse".
    string kind?;
    # The token that can be used as the value of the pageToken parameter to retrieve the next page in the result set.
    string nextPageToken?;
    # Paging details for lists of resources, including total number of items available and number of resources returned in a single page.
    PageInfo pageInfo?;
    # The token that can be used as the value of the pageToken parameter to retrieve the previous page in the result set.
    string prevPageToken?;
    # Stub token pagination template to suppress results.
    TokenPagination tokenPagination?;
    # The visitorId identifies the visitor.
    string visitorId?;
};

# Basic details about a playlist, including title, description and thumbnails. Basic details of a YouTube Playlist item provided by the author. Next ID: 15
public type PlaylistItemSnippet record {
    # The ID that YouTube uses to uniquely identify the user that added the item to the playlist.
    string channelId?;
    # Channel title for the channel that the playlist item belongs to.
    string channelTitle?;
    # The item's description.
    string description?;
    # The ID that YouTube uses to uniquely identify thGe playlist that the playlist item is in.
    string playlistId?;
    # The order in which the item appears in the playlist. The value uses a zero-based index, so the first item has a position of 0, the second item has a position of 1, and so forth.
    int position?;
    # The date and time that the item was added to the playlist.
    string publishedAt?;
    # A resource id is a generic reference that points to another YouTube resource.
    ResourceId resourceId?;
    # Internal representation of thumbnails for a YouTube resource.
    ThumbnailDetails thumbnails?;
    # The item's title.
    string title?;
    # Channel id for the channel this video belongs to.
    string videoOwnerChannelId?;
    # Channel title for the channel this video belongs to.
    string videoOwnerChannelTitle?;
};

# JSON template for the status part of a channel.
public type ChannelStatus record {
    # If true, then the user is linked to either a YouTube username or G+ account. Otherwise, the user doesn't have a public YouTube identity.
    boolean isLinked?;
    # The long uploads status of this channel. See https://support.google.com/youtube/answer/71673 for more information.
    string longUploadsStatus?;
    boolean madeForKids?;
    # Privacy status of the channel.
    string privacyStatus?;
    boolean selfDeclaredMadeForKids?;
};

public type ThumbnailSetResponse record {
    # Etag of this resource.
    string etag?;
    # Serialized EventId of the request which produced this response.
    string eventId?;
    # A list of thumbnails.
    ThumbnailDetails[] items?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#thumbnailSetResponse".
    string kind?;
    # The visitorId identifies the visitor.
    string visitorId?;
};

# Information about the playlist item's privacy status.
public type PlaylistItemStatus record {
    # This resource's privacy status.
    string privacyStatus?;
};

# Rights management policy for YouTube resources.
public type AccessPolicy record {
    # The value of allowed indicates whether the access to the policy is allowed or denied by default.
    boolean allowed?;
    # A list of region codes that identify countries where the default policy do not apply.
    string[] exception?;
};

# Geographical coordinates of a point, in WGS84.
public type GeoPoint record {
    # Altitude above the reference ellipsoid, in meters.
    float altitude?;
    # Latitude in degrees.
    float latitude?;
    # Longitude in degrees.
    float longitude?;
};

public type ChannelListResponse record {
    # Etag of this resource.
    string etag?;
    # Serialized EventId of the request which produced this response.
    string eventId?;
    Channel[] items?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#channelListResponse".
    string kind?;
    # The token that can be used as the value of the pageToken parameter to retrieve the next page in the result set.
    string nextPageToken?;
    # Paging details for lists of resources, including total number of items available and number of resources returned in a single page.
    PageInfo pageInfo?;
    # The token that can be used as the value of the pageToken parameter to retrieve the previous page in the result set.
    string prevPageToken?;
    # Stub token pagination template to suppress results.
    TokenPagination tokenPagination?;
    # The visitorId identifies the visitor.
    string visitorId?;
};

public type ChannelSection record {
    # Details about a channelsection, including playlists and channels.
    ChannelSectionContentDetails contentDetails?;
    # Etag of this resource.
    string etag?;
    # The ID that YouTube uses to uniquely identify the channel section.
    string id?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#channelSection".
    string kind?;
    # Localizations for different languages
    record {} localizations?;
    # Basic details about a channel section, including title, style and position.
    ChannelSectionSnippet snippet?;
    # ChannelSection targeting setting.
    ChannelSectionTargeting targeting?;
};

# Statistics about the video, such as the number of times the video was viewed or liked.
public type VideoStatistics record {
    # The number of comments for the video.
    string commentCount?;
    # The number of users who have indicated that they disliked the video by giving it a negative rating.
    string dislikeCount?;
    # The number of users who currently have the video marked as a favorite video.
    string favoriteCount?;
    # The number of users who have indicated that they liked the video by giving it a positive rating.
    string likeCount?;
    # The number of times the video has been viewed.
    string viewCount?;
};

# Basic details about a caption track, such as its language and name.
public type CaptionSnippet record {
    # The type of audio track associated with the caption track.
    string audioTrackType?;
    # The reason that YouTube failed to process the caption track. This property is only present if the state property's value is failed.
    string failureReason?;
    # Indicates whether YouTube synchronized the caption track to the audio track in the video. The value will be true if a sync was explicitly requested when the caption track was uploaded. For example, when calling the captions.insert or captions.update methods, you can set the sync parameter to true to instruct YouTube to sync the uploaded track to the video. If the value is false, YouTube uses the time codes in the uploaded caption track to determine when to display captions.
    boolean isAutoSynced?;
    # Indicates whether the track contains closed captions for the deaf and hard of hearing. The default value is false.
    boolean isCC?;
    # Indicates whether the caption track is a draft. If the value is true, then the track is not publicly visible. The default value is false. @mutable youtube.captions.insert youtube.captions.update
    boolean isDraft?;
    # Indicates whether caption track is formatted for "easy reader," meaning it is at a third-grade level for language learners. The default value is false.
    boolean isEasyReader?;
    # Indicates whether the caption track uses large text for the vision-impaired. The default value is false.
    boolean isLarge?;
    # The language of the caption track. The property value is a BCP-47 language tag.
    string language?;
    # The date and time when the caption track was last updated.
    string lastUpdated?;
    # The name of the caption track. The name is intended to be visible to the user as an option during playback.
    string name?;
    # The caption track's status.
    string status?;
    # The caption track's type.
    string trackKind?;
    # The ID that YouTube uses to uniquely identify the video associated with the caption track. @mutable youtube.captions.insert
    string videoId?;
};

# A channel banner returned as the response to a channel_banner.insert call.
public type ChannelBannerResource record {
    string etag?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#channelBannerResource".
    string kind?;
    # The URL of this banner image.
    string url?;
};

# Basic details about a video category, such as its localized title. Next Id: 17
public type VideoStatus record {
    # This value indicates if the video can be embedded on another website. @mutable youtube.videos.insert youtube.videos.update
    boolean embeddable?;
    # This value explains why a video failed to upload. This property is only present if the uploadStatus property indicates that the upload failed.
    string failureReason?;
    # The video's license. @mutable youtube.videos.insert youtube.videos.update
    string license?;
    boolean madeForKids?;
    # The video's privacy status.
    string privacyStatus?;
    # This value indicates if the extended video statistics on the watch page can be viewed by everyone. Note that the view count, likes, etc will still be visible if this is disabled. @mutable youtube.videos.insert youtube.videos.update
    boolean publicStatsViewable?;
    # The date and time when the video is scheduled to publish. It can be set only if the privacy status of the video is private..
    string publishAt?;
    # This value explains why YouTube rejected an uploaded video. This property is only present if the uploadStatus property indicates that the upload was rejected.
    string rejectionReason?;
    boolean selfDeclaredMadeForKids?;
    # The status of the uploaded video.
    string uploadStatus?;
};

# A *channel* resource contains information about a YouTube channel.
public type Channel record {
    # The auditDetails object encapsulates channel data that is relevant for YouTube Partners during the audit process.
    ChannelAuditDetails auditDetails?;
    # Branding properties of a YouTube channel.
    ChannelBrandingSettings brandingSettings?;
    # Details about the content of a channel.
    ChannelContentDetails contentDetails?;
    # The contentOwnerDetails object encapsulates channel data that is relevant for YouTube Partners linked with the channel.
    ChannelContentOwnerDetails contentOwnerDetails?;
    # The conversionPings object encapsulates information about conversion pings that need to be respected by the channel.
    ChannelConversionPings conversionPings?;
    # Etag of this resource.
    string etag?;
    # The ID that YouTube uses to uniquely identify the channel.
    string id?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#channel".
    string kind?;
    # Localizations for different languages
    record {} localizations?;
    # Basic details about a channel, including title, description and thumbnails.
    ChannelSnippet snippet?;
    # Statistics about a channel: number of subscribers, number of videos in the channel, etc.
    ChannelStatistics statistics?;
    # JSON template for the status part of a channel.
    ChannelStatus status?;
    # Freebase topic information related to the channel.
    ChannelTopicDetails topicDetails?;
};

# Details about the content of a YouTube Video.
public type VideoContentDetails record {
    # The value of captions indicates whether the video has captions or not.
    string caption?;
    # Ratings schemes. The country-specific ratings are mostly for movies and shows. LINT.IfChange
    ContentRating contentRating?;
    # Rights management policy for YouTube resources.
    AccessPolicy countryRestriction?;
    # The value of definition indicates whether the video is available in high definition or only in standard definition.
    string definition?;
    # The value of dimension indicates whether the video is available in 3D or in 2D.
    string dimension?;
    # The length of the video. The tag value is an ISO 8601 duration in the format PT#M#S, in which the letters PT indicate that the value specifies a period of time, and the letters M and S refer to length in minutes and seconds, respectively. The # characters preceding the M and S letters are both integers that specify the number of minutes (or seconds) of the video. For example, a value of PT15M51S indicates that the video is 15 minutes and 51 seconds long.
    string duration?;
    # Indicates whether the video uploader has provided a custom thumbnail image for the video. This property is only visible to the video uploader.
    boolean hasCustomThumbnail?;
    # The value of is_license_content indicates whether the video is licensed content.
    boolean licensedContent?;
    # Specifies the projection format of the video.
    string projection?;
    # DEPRECATED Region restriction of the video.
    VideoContentDetailsRegionRestriction regionRestriction?;
};

# The conversionPings object encapsulates information about conversion pings that need to be respected by the channel.
public type ChannelConversionPings record {
    # Pings that the app shall fire (authenticated by biscotti cookie). Each ping has a context, in which the app must fire the ping, and a url identifying the ping.
    ChannelConversionPing[] pings?;
};

public type PlaylistItemListResponse record {
    string etag?;
    # Serialized EventId of the request which produced this response.
    string eventId?;
    # A list of playlist items that match the request criteria.
    PlaylistItem[] items?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#playlistItemListResponse". Etag of this resource.
    string kind?;
    # The token that can be used as the value of the pageToken parameter to retrieve the next page in the result set.
    string nextPageToken?;
    # Paging details for lists of resources, including total number of items available and number of resources returned in a single page.
    PageInfo pageInfo?;
    # The token that can be used as the value of the pageToken parameter to retrieve the previous page in the result set.
    string prevPageToken?;
    # Stub token pagination template to suppress results.
    TokenPagination tokenPagination?;
    # The visitorId identifies the visitor.
    string visitorId?;
};

# Describes a temporal position of a visual widget inside a video.
public type InvideoTiming record {
    # Defines the duration in milliseconds for which the promotion should be displayed. If missing, the client should use the default.
    string durationMs?;
    # Defines the time at which the promotion will appear. Depending on the value of type the value of the offsetMs field will represent a time offset from the start or from the end of the video, expressed in milliseconds.
    string offsetMs?;
    # Describes a timing type. If the value is offsetFromStart, then the offsetMs field represents an offset from the start of the video. If the value is offsetFromEnd, then the offsetMs field represents an offset from the end of the video.
    string 'type?;
};

# Internal representation of thumbnails for a YouTube resource.
public type ThumbnailDetails record {
    # A thumbnail is an image representing a YouTube resource.
    Thumbnail high?;
    # A thumbnail is an image representing a YouTube resource.
    Thumbnail maxres?;
    # A thumbnail is an image representing a YouTube resource.
    Thumbnail medium?;
    # A thumbnail is an image representing a YouTube resource.
    Thumbnail standard?;
};

# A *video* resource represents a YouTube video.
public type Video record {
    VideoAgeGating ageGating?;
    # Details about the content of a YouTube Video.
    VideoContentDetails contentDetails?;
    # Etag of this resource.
    string etag?;
    # Describes original video file properties, including technical details about audio and video streams, but also metadata information like content length, digitization time, or geotagging information.
    VideoFileDetails fileDetails?;
    # The ID that YouTube uses to uniquely identify the video.
    string id?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#video".
    string kind?;
    # Details about the live streaming metadata.
    VideoLiveStreamingDetails liveStreamingDetails?;
    # The localizations object contains localized versions of the basic details about the video, such as its title and description.
    record {} localizations?;
    # Details about monetization of a YouTube Video.
    VideoMonetizationDetails monetizationDetails?;
    # Player to be used for a video playback.
    VideoPlayer player?;
    # Describes processing status and progress and availability of some other Video resource parts.
    VideoProcessingDetails processingDetails?;
    # DEPRECATED. b/157517979: This part was never populated after it was added. However, it sees non-zero traffic because there is generated client code in the wild that refers to it [1]. We keep this field and do NOT remove it because otherwise V3 would return an error when this part gets requested [2]. [1] https://developers.google.com/resources/api-libraries/documentation/youtube/v3/csharp/latest/classGoogle_1_1Apis_1_1YouTube_1_1v3_1_1Data_1_1VideoProjectDetails.html [2] http://google3/video/youtube/src/python/servers/data_api/common.py?l=1565-1569&rcl=344141677
    VideoProjectDetails projectDetails?;
    # Recording information associated with the video.
    VideoRecordingDetails recordingDetails?;
    # Basic details about a video, including title, description, uploader, thumbnails and category.
    VideoSnippet snippet?;
    # Statistics about the video, such as the number of times the video was viewed or liked.
    VideoStatistics statistics?;
    # Basic details about a video category, such as its localized title. Next Id: 17
    VideoStatus status?;
    # Specifies suggestions on how to improve video content, including encoding hints, tag suggestions, and editor suggestions.
    VideoSuggestions suggestions?;
    # Freebase topic information related to the video.
    VideoTopicDetails topicDetails?;
};

public type VideoAgeGating record {
    # Indicates whether or not the video has alcoholic beverage content. Only users of legal purchasing age in a particular country, as identified by ICAP, can view the content.
    boolean alcoholContent?;
    # Age-restricted trailers. For redband trailers and adult-rated video-games. Only users aged 18+ can view the content. The the field is true the content is restricted to viewers aged 18+. Otherwise The field won't be present.
    boolean restricted?;
    # Video game rating, if any.
    string videoGameRating?;
};

public type PlaylistContentDetails record {
    # The number of videos in the playlist.
    int itemCount?;
};

public type PlaylistListResponse record {
    # Etag of this resource.
    string etag?;
    # Serialized EventId of the request which produced this response.
    string eventId?;
    # A list of playlists that match the request criteria
    Playlist[] items?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#playlistListResponse".
    string kind?;
    # The token that can be used as the value of the pageToken parameter to retrieve the next page in the result set.
    string nextPageToken?;
    # Paging details for lists of resources, including total number of items available and number of resources returned in a single page.
    PageInfo pageInfo?;
    # The token that can be used as the value of the pageToken parameter to retrieve the previous page in the result set.
    string prevPageToken?;
    # Stub token pagination template to suppress results.
    TokenPagination tokenPagination?;
    # The visitorId identifies the visitor.
    string visitorId?;
};

# Freebase topic information related to the video.
public type VideoTopicDetails record {
    # Similar to topic_id, except that these topics are merely relevant to the video. These are topics that may be mentioned in, or appear in the video. You can retrieve information about each topic using Freebase Topic API.
    string[] relevantTopicIds?;
    # A list of Wikipedia URLs that provide a high-level description of the video's content.
    string[] topicCategories?;
    # A list of Freebase topic IDs that are centrally associated with the video. These are topics that are centrally featured in the video, and it can be said that the video is mainly about each of these. You can retrieve information about each topic using the < a href="http://wiki.freebase.com/wiki/Topic_API">Freebase Topic API.
    string[] topicIds?;
};

# The id of the author's YouTube channel, if any.
public type CommentSnippetAuthorChannelId record {
    string value?;
};

# Basic details about a playlist, including title, description and thumbnails.
public type PlaylistSnippet record {
    # The ID that YouTube uses to uniquely identify the channel that published the playlist.
    string channelId?;
    # The channel title of the channel that the video belongs to.
    string channelTitle?;
    # The language of the playlist's default title and description.
    string defaultLanguage?;
    # The playlist's description.
    string description?;
    # Playlist localization setting
    PlaylistLocalization localized?;
    # The date and time that the playlist was created.
    string publishedAt?;
    # Keyword tags associated with the playlist.
    string[] tags?;
    # Note: if the playlist has a custom thumbnail, this field will not be populated. The video id selected by the user that will be used as the thumbnail of this playlist. This field defaults to the first publicly viewable video in the playlist, if: 1. The user has never selected a video to be the thumbnail of the playlist. 2. The user selects a video to be the thumbnail, and then removes that video from the playlist. 3. The user selects a non-owned video to be the thumbnail, but that video becomes private, or gets deleted.
    string thumbnailVideoId?;
    # Internal representation of thumbnails for a YouTube resource.
    ThumbnailDetails thumbnails?;
    # The playlist's title.
    string title?;
};

# A *videoCategory* resource identifies a category that has been or could be associated with uploaded videos.
public type VideoCategory record {
    # Etag of this resource.
    string etag?;
    # The ID that YouTube uses to uniquely identify the video category.
    string id?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#videoCategory".
    string kind?;
    # Basic details about a video category, such as its localized title.
    VideoCategorySnippet snippet?;
};

public type AbuseType record {
    string id?;
};

# Branding properties of a YouTube channel.
public type ChannelBrandingSettings record {
    # Branding properties for the channel view.
    ChannelSettings 'channel?;
    # Additional experimental branding properties.
    PropertyValue[] hints?;
    # Branding properties for images associated with the channel.
    ImageSettings image?;
    # Branding properties for the watch. All deprecated.
    WatchSettings watch?;
};

# Basic details about a channel section, including title, style and position.
public type ChannelSectionSnippet record {
    # The ID that YouTube uses to uniquely identify the channel that published the channel section.
    string channelId?;
    # The language of the channel section's default title and description.
    string defaultLanguage?;
    # ChannelSection localization setting
    ChannelSectionLocalization localized?;
    # The position of the channel section in the channel.
    int position?;
    # The style of the channel section.
    string style?;
    # The channel section's title for multiple_playlists and multiple_channels.
    string title?;
    # The type of the channel section.
    string 'type?;
};

# Comments written in (direct or indirect) reply to the top level comment.
public type CommentThreadReplies record {
    # A limited number of replies. Unless the number of replies returned equals total_reply_count in the snippet the returned replies are only a subset of the total number of replies.
    Comment[] comments?;
};

public type LocalizedString record {
    string language?;
    string value?;
};

public type VideoGetRatingResponse record {
    # Etag of this resource.
    string etag?;
    # Serialized EventId of the request which produced this response.
    string eventId?;
    # A list of ratings that match the request criteria.
    VideoRating[] items?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#videoGetRatingResponse".
    string kind?;
    # The visitorId identifies the visitor.
    string visitorId?;
};

# Information about an audio stream.
public type VideoFileDetailsAudioStream record {
    # The audio stream's bitrate, in bits per second.
    string bitrateBps?;
    # The number of audio channels that the stream contains.
    int channelCount?;
    # The audio codec that the stream uses.
    string codec?;
    # A value that uniquely identifies a video vendor. Typically, the value is a four-letter vendor code.
    string vendor?;
};

# ChannelSection localization setting
public type ChannelSectionLocalization record {
    # The localized strings for channel section's title.
    string title?;
};

# Information about a video stream.
public type VideoFileDetailsVideoStream record {
    # The video content's display aspect ratio, which specifies the aspect ratio in which the video should be displayed.
    float aspectRatio?;
    # The video stream's bitrate, in bits per second.
    string bitrateBps?;
    # The video codec that the stream uses.
    string codec?;
    # The video stream's frame rate, in frames per second.
    float frameRateFps?;
    # The encoded video content's height in pixels.
    int heightPixels?;
    # The amount that YouTube needs to rotate the original source content to properly display the video.
    string rotation?;
    # A value that uniquely identifies a video vendor. Typically, the value is a four-letter vendor code.
    string vendor?;
    # The encoded video content's width in pixels. You can calculate the video's encoding aspect ratio as width_pixels / height_pixels.
    int widthPixels?;
};

# Localized versions of certain video properties (e.g. title).
public type VideoLocalization record {
    # Localized version of the video's description.
    string description?;
    # Localized version of the video's title.
    string title?;
};

# Branding properties for the channel view.
public type ChannelSettings record {
    # The country of the channel.
    string country?;
    string defaultLanguage?;
    # Which content tab users should see when viewing the channel.
    string defaultTab?;
    # Specifies the channel description.
    string description?;
    # Title for the featured channels tab.
    string featuredChannelsTitle?;
    # The list of featured channels.
    string[] featuredChannelsUrls?;
    # Lists keywords associated with the channel, comma-separated.
    string keywords?;
    # Whether user-submitted comments left on the channel page need to be approved by the channel owner to be publicly visible.
    boolean moderateComments?;
    # A prominent color that can be rendered on this channel page.
    string profileColor?;
    # Whether the tab to browse the videos should be displayed.
    boolean showBrowseView?;
    # Whether related channels should be proposed.
    boolean showRelatedChannels?;
    # Specifies the channel title.
    string title?;
    # The ID for a Google Analytics account to track and measure traffic to the channels.
    string trackingAnalyticsAccountId?;
    # The trailer of the channel, for users that are not subscribers.
    string unsubscribedTrailer?;
};

# Player to be used for a video playback.
public type VideoPlayer record {
    string embedHeight?;
    # An <iframe> tag that embeds a player that will play the video.
    string embedHtml?;
    # The embed width
    string embedWidth?;
};

# A *comment* represents a single YouTube comment.
public type Comment record {
    # Etag of this resource.
    string etag?;
    # The ID that YouTube uses to uniquely identify the comment.
    string id?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#comment".
    string kind?;
    # Basic details about a comment, such as its author and text.
    CommentSnippet snippet?;
};

# Basic details about a video category, such as its localized title.
public type VideoCategorySnippet record {
    boolean assignable?;
    # The YouTube channel that created the video category.
    string channelId?;
    # The video category's title.
    string title?;
};

# Details about the content to witch a subscription refers.
public type SubscriptionContentDetails record {
    # The type of activity this subscription is for (only uploads, everything).
    string activityType?;
    # The number of new items in the subscription since its content was last read.
    int newItemCount?;
    # The approximate number of items that the subscription points to.
    int totalItemCount?;
};

# Basic details about a subscription's subscriber including title, description, channel ID and thumbnails.
public type SubscriptionSubscriberSnippet record {
    # The channel ID of the subscriber.
    string channelId?;
    # The description of the subscriber.
    string description?;
    # Internal representation of thumbnails for a YouTube resource.
    ThumbnailDetails thumbnails?;
    # The title of the subscriber.
    string title?;
};

public type VideoCategoryListResponse record {
    # Etag of this resource.
    string etag?;
    # Serialized EventId of the request which produced this response.
    string eventId?;
    # A list of video categories that can be associated with YouTube videos. In this map, the video category ID is the map key, and its value is the corresponding videoCategory resource.
    VideoCategory[] items?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#videoCategoryListResponse".
    string kind?;
    # The token that can be used as the value of the pageToken parameter to retrieve the next page in the result set.
    string nextPageToken?;
    # Paging details for lists of resources, including total number of items available and number of resources returned in a single page.
    PageInfo pageInfo?;
    # The token that can be used as the value of the pageToken parameter to retrieve the previous page in the result set.
    string prevPageToken?;
    # Stub token pagination template to suppress results.
    TokenPagination tokenPagination?;
    # The visitorId identifies the visitor.
    string visitorId?;
};

public type RelatedEntity record {
    Entity entity?;
};

# ChannelSection targeting setting.
public type ChannelSectionTargeting record {
    # The country the channel section is targeting.
    string[] countries?;
    # The language the channel section is targeting.
    string[] languages?;
    # The region the channel section is targeting.
    string[] regions?;
};

# The contentOwnerDetails object encapsulates channel data that is relevant for YouTube Partners linked with the channel.
public type ChannelContentOwnerDetails record {
    # The ID of the content owner linked to the channel.
    string contentOwner?;
    # The date and time when the channel was linked to the content owner.
    string timeLinked?;
};

# A *caption* resource represents a YouTube caption track. A caption track is associated with exactly one YouTube video.
public type Caption record {
    # Etag of this resource.
    string etag?;
    # The ID that YouTube uses to uniquely identify the caption track.
    string id?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#caption".
    string kind?;
    # Basic details about a caption track, such as its language and name.
    CaptionSnippet snippet?;
};

# Branding properties for images associated with the channel.
public type ImageSettings record {
    LocalizedProperty backgroundImageUrl?;
    # This is generated when a ChannelBanner.Insert request has succeeded for the given channel.
    string bannerExternalUrl?;
    # Banner image. Desktop size (1060x175).
    string bannerImageUrl?;
    # Banner image. Mobile size high resolution (1440x395).
    string bannerMobileExtraHdImageUrl?;
    # Banner image. Mobile size high resolution (1280x360).
    string bannerMobileHdImageUrl?;
    # Banner image. Mobile size (640x175).
    string bannerMobileImageUrl?;
    # Banner image. Mobile size low resolution (320x88).
    string bannerMobileLowImageUrl?;
    # Banner image. Mobile size medium/high resolution (960x263).
    string bannerMobileMediumHdImageUrl?;
    # Banner image. Tablet size extra high resolution (2560x424).
    string bannerTabletExtraHdImageUrl?;
    # Banner image. Tablet size high resolution (2276x377).
    string bannerTabletHdImageUrl?;
    # Banner image. Tablet size (1707x283).
    string bannerTabletImageUrl?;
    # Banner image. Tablet size low resolution (1138x188).
    string bannerTabletLowImageUrl?;
    # Banner image. TV size high resolution (1920x1080).
    string bannerTvHighImageUrl?;
    # Banner image. TV size extra high resolution (2120x1192).
    string bannerTvImageUrl?;
    # Banner image. TV size low resolution (854x480).
    string bannerTvLowImageUrl?;
    # Banner image. TV size medium resolution (1280x720).
    string bannerTvMediumImageUrl?;
    LocalizedProperty largeBrandedBannerImageImapScript?;
    LocalizedProperty largeBrandedBannerImageUrl?;
    LocalizedProperty smallBrandedBannerImageImapScript?;
    LocalizedProperty smallBrandedBannerImageUrl?;
    # The URL for a 1px by 1px tracking pixel that can be used to collect statistics for views of the channel or video pages.
    string trackingImageUrl?;
    string watchIconImageUrl?;
};

# Paging details for lists of resources, including total number of items available and number of resources returned in a single page.
public type PageInfo record {
    # The number of results included in the API response.
    int resultsPerPage?;
    # The total number of results in the result set.
    int totalResults?;
};

# Basic details about a search result, including title, description and thumbnails of the item referenced by the search result.
public type SearchResultSnippet record {
    # The value that YouTube uses to uniquely identify the channel that published the resource that the search result identifies.
    string channelId?;
    # The title of the channel that published the resource that the search result identifies.
    string channelTitle?;
    # A description of the search result.
    string description?;
    # It indicates if the resource (video or channel) has upcoming/active live broadcast content. Or it's "none" if there is not any upcoming/active live broadcasts.
    string liveBroadcastContent?;
    # The creation date and time of the resource that the search result identifies.
    string publishedAt?;
    # Internal representation of thumbnails for a YouTube resource.
    ThumbnailDetails thumbnails?;
    # The title of the search result.
    string title?;
};

public type CommentThreadListResponse record {
    # Etag of this resource.
    string etag?;
    # Serialized EventId of the request which produced this response.
    string eventId?;
    # A list of comment threads that match the request criteria.
    CommentThread[] items?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#commentThreadListResponse".
    string kind?;
    # The token that can be used as the value of the pageToken parameter to retrieve the next page in the result set.
    string nextPageToken?;
    # Paging details for lists of resources, including total number of items available and number of resources returned in a single page.
    PageInfo pageInfo?;
    # Stub token pagination template to suppress results.
    TokenPagination tokenPagination?;
    # The visitorId identifies the visitor.
    string visitorId?;
};

# Branding properties for the watch. All deprecated.
public type WatchSettings record {
    # The text color for the video watch page's branded area.
    string backgroundColor?;
    # An ID that uniquely identifies a playlist that displays next to the video player.
    string featuredPlaylistId?;
    # The background color for the video watch page's branded area.
    string textColor?;
};

public type VideoListResponse record {
    # Etag of this resource.
    string etag?;
    # Serialized EventId of the request which produced this response.
    string eventId?;
    Video[] items?;
    # Identifies what kind of resource this is. Value: the fixed string "youtube#videoListResponse".
    string kind?;
    # The token that can be used as the value of the pageToken parameter to retrieve the next page in the result set.
    string nextPageToken?;
    # Paging details for lists of resources, including total number of items available and number of resources returned in a single page.
    PageInfo pageInfo?;
    # The token that can be used as the value of the pageToken parameter to retrieve the previous page in the result set.
    string prevPageToken?;
    # Stub token pagination template to suppress results.
    TokenPagination tokenPagination?;
    # The visitorId identifies the visitor.
    string visitorId?;
};

# Details about a channelsection, including playlists and channels.
public type ChannelSectionContentDetails record {
    # The channel ids for type multiple_channels.
    string[] channels?;
    # The playlist ids for type single_playlist and multiple_playlists. For singlePlaylist, only one playlistId is allowed.
    string[] playlists?;
};
