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

# Plain text of podcast name.
public type PodcastTitleOriginalField string;

# Low resolution image url of the playlist.
public type PlaylistThumbnailField string;

public type EpisodeSimple record {
    # Whether or not this episode's audio is invalid. Podcasters may delete the original audio.
    MaybeAudioInvalidField maybe_audio_invalid?;
    # Published date for this episode. In millisecond.
    EpisodePubDateMsField pub_date_ms?;
    # Audio url of this episode, which can be played directly.
    AudioField audio?;
    # Edit url of this episode where you can update the audio url if you find the audio is broken.
    EpisodeLNEditUrlField listennotes_edit_url?;
    # Image url for this episode.
    # If an episode doesn't have its own image, then this field would be the url of the podcast artwork image.
    # If you are using PRO/ENTERPRISE plan, then it's
    # a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**,
    # low resolution image (300x300).
    EpisodeImageField image?;
    # Thumbnail image (300x300) url for this episode.
    # If an episode doesn't have its own image, then this field would be the url of the podcast artwork thumbnail image.
    EpisodeThumbnailField thumbnail?;
    # Html of this episode's full description
    EpisodeDescriptionField description?;
    # Episode name.
    EpisodeNameField title?;
    # Whether this podcast contains explicit language.
    ExplicitField explicit_content?;
    # The url of this episode on [ListenNotes.com](https://www.ListenNotes.com).
    EpisodeLNUrlField listennotes_url?;
    # Audio length of this episode. In seconds.
    AudioLengthSecField audio_length_sec?;
    # Episode id.
    EpisodeIdField id?;
    # Web link of this episode.
    LinkField link?;
    PodcastMinimum podcast?;
};

# Episode name.
public type EpisodeNameField string;

# The type of this podcast - episodic or serial.
public type PodcastTypeField string;

# The podcast that this episode belongs to.
public type EpisodesearchresultPodcast record {
    # Podcast id.
    PodcastIdField id?;
    # Array of genre ids.
    GenreIdsField genre_ids?;
    # The url of this podcast on [ListenNotes.com](https://www.ListenNotes.com).
    PodcastLNUrlField listennotes_url?;
    # Highlighted segment of podcast name.
    PodcastTitleHighlightedField title_highlighted?;
    # Plain text of podcast name.
    PodcastTitleOriginalField title_original?;
    # Highlighted segment of this podcast's publisher name.
    PublisherHighlightedField publisher_highlighted?;
    # Plain text of this podcast's publisher name.
    PublisherOriginalField publisher_original?;
    # Image url for this podcast's artwork. If you are using PRO/ENTERPRISE plan, then it's
    # a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**,
    # low resolution image (300x300).
    ImageField image?;
    # Thumbnail image url for this podcast's artwork (300x300).
    ThumbnailField thumbnail?;
    # The estimated popularity score of a podcast compared to all other rss-based public podcasts in the world on a scale from 0 to 100.
    # If the score is not available, it'll be null. Learn more at listennotes.com/listen-score
    ListenScoreField listen_score?;
    # The estimated popularity ranking of a podcast compared to all other rss-based public podcasts in the world.
    # For example, if the value is 0.5%, then this podcast is one of the top 0.5% most popular shows out of all podcasts globally, ranked by Listen Score.
    # If the ranking is not available, it'll be null. Learn more at listennotes.com/listen-score
    ListenScoreGlobalRankField listen_score_global_rank?;
};

# Playlist name.
public type PlaylistNameField string;

public type PodcastSimple record {
    # Whether this podcast is claimed by its producer on [ListenNotes.com](https://www.ListenNotes.com).
    IsClaimedField is_claimed?;
    # The type of this podcast - episodic or serial.
    PodcastTypeField 'type?;
    # Whether this podcast contains explicit language.
    ExplicitField explicit_content?;
    # Website url of this podcast.
    WebsiteField website?;
    # Total number of episodes in this podcast.
    TotalEpisodesField total_episodes?;
    # The published date of the oldest episode of this podcast. In milliseconds
    EarliestPubDateMsField earliest_pub_date_ms?;
    # RSS url of this podcast. This field is available only in the PRO/ENTERPRISE plan.
    RssField rss?;
    # The published date of the latest episode of this podcast. In milliseconds
    LatestPubDateMsField latest_pub_date_ms?;
    # Podcast name.
    PodcastNameField title?;
    # The language of this podcast. You can get all supported languages from `GET /languages`.
    LanguageField language?;
    # Html of this episode's full description
    PodcastDescriptionField description?;
    # The email of this podcast's producer. This field is available only in the PRO/ENTERPRISE plan.
    EmailField email?;
    # Image url for this podcast's artwork. If you are using PRO/ENTERPRISE plan, then it's
    # a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**,
    # low resolution image (300x300).
    ImageField image?;
    # Thumbnail image url for this podcast's artwork (300x300).
    ThumbnailField thumbnail?;
    # The url of this podcast on [ListenNotes.com](https://www.ListenNotes.com).
    PodcastLNUrlField listennotes_url?;
    # Podcast id.
    PodcastIdField id?;
    # The country where this podcast is produced.
    CountryField country?;
    # Podcast publisher name.
    PublisherField publisher?;
    # iTunes id for this podcast.
    ITunesIdField itunes_id?;
    PodcastLookingForField looking_for?;
    PodcastExtraField extra?;
    # Array of genre ids.
    GenreIdsField genre_ids?;
    # The estimated popularity score of a podcast compared to all other rss-based public podcasts in the world on a scale from 0 to 100.
    # If the score is not available, it'll be null. Learn more at listennotes.com/listen-score
    ListenScoreField listen_score?;
    # The estimated popularity ranking of a podcast compared to all other rss-based public podcasts in the world.
    # For example, if the value is 0.5%, then this podcast is one of the top 0.5% most popular shows out of all podcasts globally, ranked by Listen Score.
    # If the ranking is not available, it'll be null. Learn more at listennotes.com/listen-score
    ListenScoreGlobalRankField listen_score_global_rank?;
};

public type GetLanguagesResponse record {
    string[] languages;
};

# Image url for this episode.
# If an episode doesn't have its own image, then this field would be the url of the podcast artwork image.
# If you are using PRO/ENTERPRISE plan, then it's
# a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**,
# low resolution image (300x300).
public type EpisodeImageField string;

public type SubmitPodcastResponse record {
    # The status of this submission.
    string status;
    PodcastMinimum podcast;
};

public type PodcastFull record {
    EpisodeMinimum[] episodes?;
    # Whether this podcast is claimed by its producer on [ListenNotes.com](https://www.ListenNotes.com).
    IsClaimedField is_claimed?;
    # The type of this podcast - episodic or serial.
    PodcastTypeField 'type?;
    # Whether this podcast contains explicit language.
    ExplicitField explicit_content?;
    # Website url of this podcast.
    WebsiteField website?;
    # Total number of episodes in this podcast.
    TotalEpisodesField total_episodes?;
    # The published date of the oldest episode of this podcast. In milliseconds
    EarliestPubDateMsField earliest_pub_date_ms?;
    # RSS url of this podcast. This field is available only in the PRO/ENTERPRISE plan.
    RssField rss?;
    # The published date of the latest episode of this podcast. In milliseconds
    LatestPubDateMsField latest_pub_date_ms?;
    # Podcast name.
    PodcastNameField title?;
    # The language of this podcast. You can get all supported languages from `GET /languages`.
    LanguageField language?;
    # Html of this episode's full description
    PodcastDescriptionField description?;
    # The email of this podcast's producer. This field is available only in the PRO/ENTERPRISE plan.
    EmailField email?;
    # Image url for this podcast's artwork. If you are using PRO/ENTERPRISE plan, then it's
    # a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**,
    # low resolution image (300x300).
    ImageField image?;
    # Thumbnail image url for this podcast's artwork (300x300).
    ThumbnailField thumbnail?;
    # The url of this podcast on [ListenNotes.com](https://www.ListenNotes.com).
    PodcastLNUrlField listennotes_url?;
    # Podcast id.
    PodcastIdField id?;
    # The country where this podcast is produced.
    CountryField country?;
    # Podcast publisher name.
    PublisherField publisher?;
    # iTunes id for this podcast.
    ITunesIdField itunes_id?;
    PodcastLookingForField looking_for?;
    PodcastExtraField extra?;
    # Array of genre ids.
    GenreIdsField genre_ids?;
    # Passed to the **next_episode_pub_date** parameter of `GET /podcasts/{id}` to paginate through episodes of that podcast.
    NextEpisodePubDateField next_episode_pub_date?;
    # The estimated popularity score of a podcast compared to all other rss-based public podcasts in the world on a scale from 0 to 100.
    # If the score is not available, it'll be null. Learn more at listennotes.com/listen-score
    ListenScoreField listen_score?;
    # The estimated popularity ranking of a podcast compared to all other rss-based public podcasts in the world.
    # For example, if the value is 0.5%, then this podcast is one of the top 0.5% most popular shows out of all podcasts globally, ranked by Listen Score.
    # If the ranking is not available, it'll be null. Learn more at listennotes.com/listen-score
    ListenScoreGlobalRankField listen_score_global_rank?;
};

# Audio length of this episode. In seconds.
public type AudioLengthSecField int;

# This curated list's description.
public type CuratedDescriptionField string;

# The country where this podcast is produced.
public type CountryField string;

# Podcast publisher name.
public type PublisherField string;

public type PodcastLookingForField record {
    # Whether this podcast is looking for cohosts.
    boolean cohosts?;
    # Whether this podcast is looking for cross promotion opportunities with other podcasts.
    boolean cross_promotion?;
    # Whether this podcast is looking for sponsors.
    boolean sponsors?;
    # Whether this podcast is looking for guests.
    boolean guests?;
};

# Image url for this podcast's artwork. If you are using PRO/ENTERPRISE plan, then it's
# a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**,
# low resolution image (300x300).
public type ImageField string;

# A deleted episode or podcast.
# An episode or a podcast could be deleted from our podcast database.
# Possible reasons: 1) Podcast producers sometimes delete their old episodes. 2) Copyright issues.
public type DeletedItem record {
    # Episode id or podcast id.
    string id?;
    # Episode title or podcast title.
    string title?;
    # The status of this episode or podcast. For now, the only possible value is **deleted**.
    string status?;
    # Why this episode or podcast is deleted?
    string _error?;
};

# Html of this episode's full description
public type EpisodeDescriptionField string;

# The domain name of the source of this curated list.
public type CuratedSourceDomainField string;

# High resolution image url of the playlist.
public type PlaylistImageField string;

# A custom audio in a playlist, which is a type of playlist item.
public type CustomAudio record {
    # Custom audio title.
    string title?;
    # Audio url, which can be played directly.
    string audio?;
    # Audio length in seconds.
    int audio_length_sec?;
    # High resolution image url of this custom audio.
    string image?;
    # Low resolution image url of this custom audio.
    string thumbnail?;
    # Published date (in milliseconds) of this custom audio.
    # For now, it's the same as **added_at_ms** of this playlist item.
    int pub_date_ms?;
};

public type SubmitPodcastForm record {
    # A valid podcast rss url.
    string rss;
    # A valid email address. If **email** is specified, then we'll notify this email address once the podcast is accepted.
    string email?;
};

# Whether this podcast is claimed by its producer on [ListenNotes.com](https://www.ListenNotes.com).
public type IsClaimedField boolean;

# When **type** is *curated*.
public type CuratedListSearchResult record {
    # Curated list id.
    CuratedIdField id?;
    # Published date of this curated list. In milliseconds.
    CuratedPubDateMsField pub_date_ms?;
    # Highlighted segment of this curated list's description
    string description_highlighted?;
    # Plain text of this curated list's description
    string description_original?;
    # Highlighted segment of this curated list's title
    string title_highlighted?;
    # Plain text of this curated list's title
    string title_original?;
    # The url of this curated list on [ListenNotes.com](https://www.ListenNotes.com).
    CuratedLNUrlField listennotes_url?;
    # Url of the source of this curated list.
    CuratedSourceUrlField source_url?;
    # The domain name of the source of this curated list.
    CuratedSourceDomainField source_domain?;
    # The total number of podcasts in this curated list.
    CuratedTotalPodcastsField total?;
    # Up to 5 podcasts in this curated list.
    PodcastMinimum[] podcasts?;
};

# Visibility of this playlist.
public type PlaylistVisibilityField string;

# Html of this episode's full description
public type PodcastDescriptionField string;

# The estimated popularity ranking of a podcast compared to all other rss-based public podcasts in the world.
# For example, if the value is 0.5%, then this podcast is one of the top 0.5% most popular shows out of all podcasts globally, ranked by Listen Score.
# If the ranking is not available, it'll be null. Learn more at listennotes.com/listen-score
public type ListenScoreGlobalRankField string;

# The published date of the oldest episode of this podcast. In milliseconds
public type EarliestPubDateMsField int;

public type GetEpisodeRecommendationsResponse record {
    EpisodeSimple[] recommendations;
};

# Plain text of this podcast's publisher name.
public type PublisherOriginalField string;

# Audio url of this episode, which can be played directly.
public type AudioField string;

# Highlighted segment of podcast name.
public type PodcastTitleHighlightedField string;

# Thumbnail image url for this podcast's artwork (300x300).
public type ThumbnailField string;

public type GetPodcastsInBatchForm record {
    # Comma-separated list of podcast ids.
    string ids?;
    # Comma-separated rss urls.
    string rsses?;
    # Comma-separated itunes ids.
    string itunes_ids?;
    # Whether or not to fetch up to 10 latest episodes from these podcasts, sorted by pub_date. 1 is yes, and 0 is no.
    int show_latest_episodes?;
    # For latest episodes pagination. It's the value of **next_episode_pub_date** from the response of last request. If not specified, just return latest 10 episodes.
    int next_episode_pub_date?;
};

# The transcript of this episode, in plain text (with the newline character \n). If there's not transcript, it is null. This field is available only in the PRO/ENTERPRISE plan.
public type TranscriptField string;

# Published date for this episode. In millisecond.
public type EpisodePubDateMsField int;

public type PodcastExtraField record {
    # YouTube url affiliated with this podcast
    string youtube_url?;
    # Facebook username affiliated with this podcast
    string facebook_handle?;
    # Instagram username affiliated with this podcast
    string instagram_handle?;
    # Twitter username affiliated with this podcast
    string twitter_handle?;
    # WeChat username affiliated with this podcast
    string wechat_handle?;
    # Patreon username affiliated with this podcast
    string patreon_handle?;
    # Google Podcasts url for this podcast
    string google_url?;
    # LinkedIn url affiliated with this podcast
    string linkedin_url?;
    # Spotify url for this podcast
    string spotify_url?;
    # Url affiliated with this podcast
    string url1?;
    # Url affiliated with this podcast
    string url2?;
    # Url affiliated with this podcast
    string url3?;
};

public type EpisodeFull record {
    # Whether or not this episode's audio is invalid. Podcasters may delete the original audio.
    MaybeAudioInvalidField maybe_audio_invalid?;
    # Published date for this episode. In millisecond.
    EpisodePubDateMsField pub_date_ms?;
    # Audio url of this episode, which can be played directly.
    AudioField audio?;
    # Edit url of this episode where you can update the audio url if you find the audio is broken.
    EpisodeLNEditUrlField listennotes_edit_url?;
    # Image url for this episode.
    # If an episode doesn't have its own image, then this field would be the url of the podcast artwork image.
    # If you are using PRO/ENTERPRISE plan, then it's
    # a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**,
    # low resolution image (300x300).
    EpisodeImageField image?;
    # Thumbnail image (300x300) url for this episode.
    # If an episode doesn't have its own image, then this field would be the url of the podcast artwork thumbnail image.
    EpisodeThumbnailField thumbnail?;
    # Html of this episode's full description
    EpisodeDescriptionField description?;
    # Episode name.
    EpisodeNameField title?;
    # Whether this podcast contains explicit language.
    ExplicitField explicit_content?;
    # The url of this episode on [ListenNotes.com](https://www.ListenNotes.com).
    EpisodeLNUrlField listennotes_url?;
    # Audio length of this episode. In seconds.
    AudioLengthSecField audio_length_sec?;
    # Episode id.
    EpisodeIdField id?;
    PodcastSimple podcast?;
    # Web link of this episode.
    LinkField link?;
    # The transcript of this episode, in plain text (with the newline character \n). If there's not transcript, it is null. This field is available only in the PRO/ENTERPRISE plan.
    TranscriptField transcript?;
};

public type SearchResponse record {
    # Pass this value to the **offset** parameter to do pagination of search results.
    int next_offset?;
    # The time it took to fetch these search results. In seconds.
    decimal took?;
    # The total number of search results.
    int total?;
    # The number of search results in this page.
    int count?;
    # A list of search results.
    EpisodeSearchResult|PodcastSearchResult|CuratedListSearchResult[] results?;
};

public type PlaylistsResponse record {
    int previous_page_number?;
    int page_number?;
    boolean has_next?;
    boolean has_previous?;
    int next_page_number?;
    int total?;
    PlaylistsresponsePlaylists[] playlists?;
};

# The url of this playlist on ListenNotes.com.
public type PlaylistListennotesUrlField string;

public type PodcastMinimum record {
    # Image url for this podcast's artwork. If you are using PRO/ENTERPRISE plan, then it's
    # a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**,
    # low resolution image (300x300).
    ImageField image?;
    # Thumbnail image url for this podcast's artwork (300x300).
    ThumbnailField thumbnail?;
    # Podcast name.
    PodcastNameField title?;
    # The url of this podcast on [ListenNotes.com](https://www.ListenNotes.com).
    PodcastLNUrlField listennotes_url?;
    # Podcast id.
    PodcastIdField id?;
    # Podcast publisher name.
    PublisherField publisher?;
    # The estimated popularity score of a podcast compared to all other rss-based public podcasts in the world on a scale from 0 to 100.
    # If the score is not available, it'll be null. Learn more at listennotes.com/listen-score
    ListenScoreField listen_score?;
    # The estimated popularity ranking of a podcast compared to all other rss-based public podcasts in the world.
    # For example, if the value is 0.5%, then this podcast is one of the top 0.5% most popular shows out of all podcasts globally, ranked by Listen Score.
    # If the ranking is not available, it'll be null. Learn more at listennotes.com/listen-score
    ListenScoreGlobalRankField listen_score_global_rank?;
};

# Episode id.
public type EpisodeIdField string;

# The estimated popularity score of a podcast compared to all other rss-based public podcasts in the world on a scale from 0 to 100.
# If the score is not available, it'll be null. Learn more at listennotes.com/listen-score
public type ListenScoreField int;

# iTunes id for this podcast.
public type ITunesIdField int;

# Whether this podcast contains explicit language.
public type ExplicitField boolean;

# A playlist
public type PlaylistsresponsePlaylists record {
    # The number of episodes (including custom audio) in this playlist.
    int episode_count?;
    # The number of podcasts in this playlist.
    int podcast_count?;
    # A 11-character playlist id.
    PlaylistIdField id?;
    # Playlist name.
    PlaylistNameField name?;
    # Playlist description.
    PlaylistDescriptionField description?;
    # High resolution image url of the playlist.
    PlaylistImageField image?;
    # Low resolution image url of the playlist.
    PlaylistThumbnailField thumbnail?;
    # The url of this playlist on ListenNotes.com.
    PlaylistListennotesUrlField listennotes_url?;
    # Visibility of this playlist.
    PlaylistVisibilityField visibility?;
    # Passed to the **last_timestamp_ms** parameter of `GET /playlists/{id}` to paginate through items of that playlist.
    PlaylistLastTimestampMsField last_timestamp_ms?;
};

# The total number of podcasts in this curated list.
public type CuratedTotalPodcastsField int;

# Website url of this podcast.
public type WebsiteField string;

# When **type** is *episode*.
public type EpisodeSearchResult record {
    # Audio url of this episode, which can be played directly.
    AudioField audio?;
    # Audio length of this episode. In seconds.
    AudioLengthSecField audio_length_sec?;
    # RSS url of this podcast. This field is available only in the PRO/ENTERPRISE plan.
    RssField rss?;
    # Highlighted segment of this episode's description
    string description_highlighted?;
    # Plain text of this episode's description
    string description_original?;
    # Highlighted segment of this episode's title
    string title_highlighted?;
    # Plain text of this episode' title
    string title_original?;
    # Up to 2 highlighted segments of the audio transcript of this episode.
    string[] transcripts_highlighted?;
    # Image url for this episode.
    # If an episode doesn't have its own image, then this field would be the url of the podcast artwork image.
    # If you are using PRO/ENTERPRISE plan, then it's
    # a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**,
    # low resolution image (300x300).
    EpisodeImageField image?;
    # Thumbnail image (300x300) url for this episode.
    # If an episode doesn't have its own image, then this field would be the url of the podcast artwork thumbnail image.
    EpisodeThumbnailField thumbnail?;
    # iTunes id for this podcast.
    ITunesIdField itunes_id?;
    # Published date for this episode. In millisecond.
    EpisodePubDateMsField pub_date_ms?;
    # Episode id.
    EpisodeIdField id?;
    # The url of this episode on [ListenNotes.com](https://www.ListenNotes.com).
    EpisodeLNUrlField listennotes_url?;
    # Whether this podcast contains explicit language.
    ExplicitField explicit_content?;
    # Web link of this episode.
    LinkField link?;
    # The podcast that this episode belongs to.
    EpisodesearchresultPodcast podcast?;
};

public type GetGenresResponse record {
    Genre[] genres;
};

# A 11-character playlist id.
public type PlaylistIdField string;

public type GetPodcastsInBatchResponse record {
    PodcastSimple[] podcasts;
    # Up to 10 latest episodes from these podcasts, sorted by **pub_date**. This field shows up only when **show_latest_episodes** is 1.
    EpisodeSimple[] latest_episodes?;
};

# Web link of this episode.
public type LinkField string;

public type GetRegionsResponse record {
    record {} regions;
};

public type PlaylistResponse record {
    # A 11-character playlist id.
    PlaylistIdField id?;
    # Playlist name.
    PlaylistNameField name?;
    # Playlist description.
    PlaylistDescriptionField description?;
    # High resolution image url of the playlist.
    PlaylistImageField image?;
    # Low resolution image url of the playlist.
    PlaylistThumbnailField thumbnail?;
    # The url of this playlist on ListenNotes.com.
    PlaylistListennotesUrlField listennotes_url?;
    # Visibility of this playlist.
    PlaylistVisibilityField visibility?;
    # Passed to the **last_timestamp_ms** parameter of `GET /playlists/{id}` to paginate through items of that playlist.
    PlaylistLastTimestampMsField last_timestamp_ms?;
    # Total number of items in this playlist.
    int total?;
    # The type of this playlist, which should be either **episode_list** or **podcast_list**.
    string 'type?;
    # A list of playlist items.
    PlaylistItem[] items?;
};

# RSS url of this podcast. This field is available only in the PRO/ENTERPRISE plan.
public type RssField string;

public type GetEpisodesInBatchForm record {
    # Comma-separated list of episode ids.
    string ids;
};

# When **type** is *podcast*.
public type PodcastSearchResult record {
    # RSS url of this podcast. This field is available only in the PRO/ENTERPRISE plan.
    RssField rss?;
    # Highlighted segment of podcast description
    string description_highlighted?;
    # Plain text of podcast description
    string description_original?;
    # Highlighted segment of podcast name.
    PodcastTitleHighlightedField title_highlighted?;
    # Plain text of podcast name.
    PodcastTitleOriginalField title_original?;
    # Highlighted segment of this podcast's publisher name.
    PublisherHighlightedField publisher_highlighted?;
    # Plain text of this podcast's publisher name.
    PublisherOriginalField publisher_original?;
    # Image url for this podcast's artwork. If you are using PRO/ENTERPRISE plan, then it's
    # a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**,
    # low resolution image (300x300).
    ImageField image?;
    # Thumbnail image url for this podcast's artwork (300x300).
    ThumbnailField thumbnail?;
    # iTunes id for this podcast.
    ITunesIdField itunes_id?;
    # The published date of the latest episode of this podcast. In milliseconds
    LatestPubDateMsField latest_pub_date_ms?;
    # The published date of the oldest episode of this podcast. In milliseconds
    EarliestPubDateMsField earliest_pub_date_ms?;
    # Podcast id.
    PodcastIdField id?;
    # Array of genre ids.
    GenreIdsField genre_ids?;
    # The url of this podcast on [ListenNotes.com](https://www.ListenNotes.com).
    PodcastLNUrlField listennotes_url?;
    # Total number of episodes in this podcast.
    TotalEpisodesField total_episodes?;
    # The email of this podcast's producer. This field is available only in the PRO/ENTERPRISE plan.
    EmailField email?;
    # Whether this podcast contains explicit language.
    ExplicitField explicit_content?;
    # Website url of this podcast.
    WebsiteField website?;
    # The estimated popularity score of a podcast compared to all other rss-based public podcasts in the world on a scale from 0 to 100.
    # If the score is not available, it'll be null. Learn more at listennotes.com/listen-score
    ListenScoreField listen_score?;
    # The estimated popularity ranking of a podcast compared to all other rss-based public podcasts in the world.
    # For example, if the value is 0.5%, then this podcast is one of the top 0.5% most popular shows out of all podcasts globally, ranked by Listen Score.
    # If the ranking is not available, it'll be null. Learn more at listennotes.com/listen-score
    ListenScoreGlobalRankField listen_score_global_rank?;
};

# Curated list name.
public type CuratedNameField string;

# The language of this podcast. You can get all supported languages from `GET /languages`.
public type LanguageField string;

# Curated list id.
public type CuratedIdField string;

public type CuratedListFull record {
    # Curated list id.
    CuratedIdField id?;
    # This curated list's description.
    CuratedDescriptionField description?;
    # Url of the source of this curated list.
    CuratedSourceUrlField source_url?;
    # The domain name of the source of this curated list.
    CuratedSourceDomainField source_domain?;
    # Published date of this curated list. In milliseconds.
    CuratedPubDateMsField pub_date_ms?;
    # The url of this curated list on [ListenNotes.com](https://www.ListenNotes.com).
    CuratedLNUrlField listennotes_url?;
    # Curated list name.
    CuratedNameField title?;
    # The total number of podcasts in this curated list.
    CuratedTotalPodcastsField total?;
    # Complete meta data of all podcasts in this curated list.
    PodcastSimple[] podcasts?;
};

public type TypeaheadResponse record {
    # Search term suggestions.
    string[] terms;
    # Genre suggestions. It'll show up when the **show_genres** parameter is *1*.
    Genre[] genres?;
    # Podcast suggestions. It'll show up when the **show_podcasts** parameter is 1.
    PodcastTypeaheadResult[] podcasts?;
};

# Edit url of this episode where you can update the audio url if you find the audio is broken.
public type EpisodeLNEditUrlField string;

# Highlighted segment of this podcast's publisher name.
public type PublisherHighlightedField string;

public type PodcastTypeaheadResult record {
    # Highlighted segment of this podcast's publisher name.
    PublisherHighlightedField publisher_highlighted?;
    # Plain text of this podcast's publisher name.
    PublisherOriginalField publisher_original?;
    # Whether this podcast contains explicit language.
    ExplicitField explicit_content?;
    # Image url for this podcast's artwork. If you are using PRO/ENTERPRISE plan, then it's
    # a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**,
    # low resolution image (300x300).
    ImageField image?;
    # Thumbnail image url for this podcast's artwork (300x300).
    ThumbnailField thumbnail?;
    # Highlighted segment of podcast name.
    PodcastTitleHighlightedField title_highlighted?;
    # Plain text of podcast name.
    PodcastTitleOriginalField title_original?;
    # Podcast id.
    PodcastIdField id?;
};

# Playlist description.
public type PlaylistDescriptionField string;

# Total number of episodes in this podcast.
public type TotalEpisodesField int;

# The email of this podcast's producer. This field is available only in the PRO/ENTERPRISE plan.
public type EmailField string;

# Passed to the **next_episode_pub_date** parameter of `GET /podcasts/{id}` to paginate through episodes of that podcast.
public type NextEpisodePubDateField int;

# Podcast name.
public type PodcastNameField string;

# Passed to the **last_timestamp_ms** parameter of `GET /playlists/{id}` to paginate through items of that playlist.
public type PlaylistLastTimestampMsField int;

public type CuratedListSimple record {
    # Curated list id.
    CuratedIdField id?;
    # This curated list's description.
    CuratedDescriptionField description?;
    # Url of the source of this curated list.
    CuratedSourceUrlField source_url?;
    # The domain name of the source of this curated list.
    CuratedSourceDomainField source_domain?;
    # Published date of this curated list. In milliseconds.
    CuratedPubDateMsField pub_date_ms?;
    # The url of this curated list on [ListenNotes.com](https://www.ListenNotes.com).
    CuratedLNUrlField listennotes_url?;
    # Curated list name.
    CuratedNameField title?;
    # The total number of podcasts in this curated list.
    CuratedTotalPodcastsField total?;
    # Minimum meta data of up to 5 podcasts in this curated list.
    PodcastMinimum[] podcasts?;
};

# Whether or not this episode's audio is invalid. Podcasters may delete the original audio.
public type MaybeAudioInvalidField boolean;

public type DeletePodcastResponse record {
    # The status of this podcast deletion request.
    string status;
};

# The published date of the latest episode of this podcast. In milliseconds
public type LatestPubDateMsField int;

public type GetPodcastRecommendationsResponse record {
    PodcastSimple[] recommendations;
};

public type BestPodcastsResponse record {
    boolean has_previous;
    # This genre's name.
    string name;
    # Url of the list of best podcasts on [ListenNotes.com](https://www.ListenNotes.com).
    BestPodcastsLNUrlField listennotes_url;
    int previous_page_number;
    int page_number;
    boolean has_next;
    int next_page_number;
    # The id of parent genre.
    int parent_id;
    # The id of this genre
    int id;
    int total;
    PodcastSimple[] podcasts;
};

# The url of this curated list on [ListenNotes.com](https://www.ListenNotes.com).
public type CuratedLNUrlField string;

# Url of the source of this curated list.
public type CuratedSourceUrlField string;

public type GetEpisodesInBatchResponse record {
    EpisodeSimple[] episodes;
};

public type GetCuratedPodcastsResponse record {
    boolean has_previous;
    int previous_page_number;
    int page_number;
    int next_page_number;
    boolean has_next;
    int total;
    CuratedListSimple[] curated_lists;
};

# Array of genre ids.
# Array of genre ids.
public type GenreIdsField int[];

# Url of the list of best podcasts on [ListenNotes.com](https://www.ListenNotes.com).
public type BestPodcastsLNUrlField string;

# The url of this episode on [ListenNotes.com](https://www.ListenNotes.com).
public type EpisodeLNUrlField string;

public type EpisodeMinimum record {
    # Whether or not this episode's audio is invalid. Podcasters may delete the original audio.
    MaybeAudioInvalidField maybe_audio_invalid?;
    # Published date for this episode. In millisecond.
    EpisodePubDateMsField pub_date_ms?;
    # Audio url of this episode, which can be played directly.
    AudioField audio?;
    # Edit url of this episode where you can update the audio url if you find the audio is broken.
    EpisodeLNEditUrlField listennotes_edit_url?;
    # Image url for this podcast's artwork. If you are using PRO/ENTERPRISE plan, then it's
    # a high resolution image (1400x1400). If you are using FREE plan, then it's the same as **thumbnail**,
    # low resolution image (300x300).
    ImageField image?;
    # Thumbnail image url for this podcast's artwork (300x300).
    ThumbnailField thumbnail?;
    # Html of this episode's full description
    EpisodeDescriptionField description?;
    # Episode name.
    EpisodeNameField title?;
    # Whether this podcast contains explicit language.
    ExplicitField explicit_content?;
    # The url of this episode on [ListenNotes.com](https://www.ListenNotes.com).
    EpisodeLNUrlField listennotes_url?;
    # Audio length of this episode. In seconds.
    AudioLengthSecField audio_length_sec?;
    # Episode id.
    EpisodeIdField id?;
    # Web link of this episode.
    LinkField link?;
};

# Thumbnail image (300x300) url for this episode.
# If an episode doesn't have its own image, then this field would be the url of the podcast artwork thumbnail image.
public type EpisodeThumbnailField string;

# The url of this podcast on [ListenNotes.com](https://www.ListenNotes.com).
public type PodcastLNUrlField string;

public type Genre record {
    # Genre id
    int id?;
    # Genre name.
    string name?;
    # Parent genre id.
    int parent_id?;
};

# Published date of this curated list. In milliseconds.
public type CuratedPubDateMsField int;

# An item in a playlist
public type PlaylistItem record {
    # Playlist item id.
    int id?;
    # The type of this playlist item.
    # If a playlist is **episode_list**, then an item could be either **episode** or **custom_audio**.
    # If it's **podcast_list**, then an item can only be **podcast**.
    string 'type?;
    # Notes for this item.
    string notes?;
    # Timestamp (in milliseconds) when this item is added.
    int added_at_ms?;
    # Playlist item data
    EpisodeSimple|PodcastSimple|CustomAudio|DeletedItem data?;
};

# Podcast id.
public type PodcastIdField string;
