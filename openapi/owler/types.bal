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

public type FeedsVO record {
    string category?;
    CompanyBasicVO company?;
    string enclosure_image?;
    string feed_date?;
    string id?;
    string owler_feed_url?;
    string publisher_logo?;
    string publisher_name?;
    string source_url?;
    string title?;
};

public type SectorVO record {
    string name?;
    string parent_industry?;
};

public type Company record {
    Acquisition[] acquisition?;
    Ceo ceo?;
    int company_id;
    string company_type?;
    string description?;
    string employee_count?;
    string facebook_link?;
    string founded_date?;
    Funding[] funding?;
    Address hq_address?;
    string[] industries?;
    string linkedin_link?;
    string logo_url;
    string name;
    string perm_id?;
    int[] portfolio_company_ids?;
    string profile_url;
    string revenue?;
    SectorVO[] sectors?;
    string short_name?;
    Stock stock?;
    string twitter_link?;
    string website;
    string youtube_link?;
};

public type Address record {
    string city?;
    string country?;
    string phone?;
    string postal_code?;
    string state?;
    string street1?;
    string street2?;
};

public type CompanySearchResultVO record {
    int company_id;
    string company_type?;
    string description?;
    Address hq_address?;
    string logo_url;
    string name;
    string perm_id?;
    string profile_url;
    string short_name?;
    Stock stock?;
    string website;
};

public type Funding record {
    string amount?;
    string date?;
    Investor[] investor?;
    string 'type?;
    string undisclosed?;
};

public type CompanyCompetitorVO record {
    CompanyBasicVO[] competitor?;
};

public type FuzzyResults record {
};

public type Ceo record {
    string ceo_rating?;
    string first_name?;
    string image_url?;
    string last_name?;
};

public type Acquisition record {
    string acquirer_company_id?;
    string amount?;
    string company_id?;
    string date?;
    string name?;
    string status?;
    string undisclosed?;
    string website?;
};

public type BasicResults record {
    CompanyBasicSearchVO[] company?;
};

public type CompanyBasicSearchVO record {
    int company_id?;
    Address hq_address?;
    string name?;
    string perm_id?;
    string profile_url?;
    string short_name?;
    string website?;
};

public type CompanyBasicVO record {
    int company_id;
    string logo_url;
    string name;
    string profile_url;
    string short_name?;
    string website;
};

public type Results record {
    FeedsVO[] feeds?;
    string pagination_id?;
};

public type Competitors record {
    CompetitorBasicVO[] competitor?;
    string pagination_id?;
};

public type CompetitorBasicVO record {
    int company_id;
    string logo_url;
    string name;
    string profile_url;
    int score;
    string short_name?;
    string website;
};

public type Investor record {
    string company_id?;
    string name?;
    string website?;
};

public type Stock record {
    string exchange?;
    string ticker?;
};
