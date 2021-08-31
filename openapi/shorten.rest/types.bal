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

public type GetClicksModel record {
    ClickModel[] clicks?;
    string lastId?;
};

public type ClickModel record {
    string alias?;
    string aliasId?;
    string browser?;
    string country?;
    int createdAt?;
    string destination?;
    string domain?;
    string os?;
    string referrer?;
    string userAgent?;
};

public type AliasModel record {
    int createdAt?;
    DestinationModel[] destinations?;
    string domainName?;
    MetaTagModel[] metatags?;
    string name;
    SnippetModel[] snippets?;
    int updatedAt?;
};

public type CreateAliasResponseModel record {
    string aliasName?;
    string domainName?;
    string shortUrl?;
};

public type MetaTagModel record {
    string content;
    string name;
};

public type SnippetModel record {
    # Please check the [supported snippets list](#tag/Snippets)
    string id;
    record {} parameters?;
};

public type DestinationModel record {
    # ISO alpha-2 [country code](//en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements)
    string country?;
    # Please check the [supported OS list](#tag/OperatingSystems)
    string os?;
    string url;
};

public type GetAliasModel record {
    int createdAt?;
    string domainName?;
    string name?;
    int updatedAt?;
};

public type CreateAliasModel record {
    DestinationModel[] destinations?;
    MetaTagModel[] metatags?;
    SnippetModel[] snippets?;
};

public type GetAliasesModel record {
    string[] aliases?;
    string lastId?;
};
