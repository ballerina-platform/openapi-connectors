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

# Movie list object
public type MovieListObject record {
    # Poster image path
    string? poster_path?;
    # Adult content or not
    boolean adult?;
    # Overview of movie
    string overview?;
    # Release date
    string release_date?;
    # Genre IDs of movie
    int[] genre_ids?;
    # Movie ID
    int id?;
    # Original title
    string original_title?;
    # Original language
    string original_language?;
    # Title of movie
    string title?;
    # Backdrop image path
    string? backdrop_path?;
    # Popularity of movie
    decimal popularity?;
    # Vote count
    int vote_count?;
    # Video available or not
    boolean video?;
    # Vote average
    decimal vote_average?;
};

# TV list object
public type TvListObject record {
    # Poster image path
    string? poster_path?;
    # Popularity of TV show
    decimal popularity?;
    # TV show ID
    int id?;
    # Backdrop image path
    string? backdrop_path?;
    # Vote average
    decimal vote_average?;
    # Overview of TV show
    string overview?;
    # First air date of TV show
    string first_air_date?;
    # Origin country
    string[] origin_country?;
    # Genre IDs of TV show
    int[] genre_ids?;
    # Original language
    string original_language?;
    # Vote count
    int vote_count?;
    # Name
    string name?;
    # Original name of TV show
    string original_name?;
};
