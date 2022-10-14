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

public type CollectionresponseData record {
    # Information defining the items in the collection
    CollectionresponseDataSet set?;
    # Individual items items in the collection
    anydata[] list?;
};

public type SearchData record {
    record {} data?;
};

public type UrlsDataRestapi record {
    UrlsDataRestapiRef ref?;
};

public type UrlsData record {
    string DISPLAYNAME?;
    string URL_ADDRESS?;
    UrlsDataRestapi _restapi?;
};

# Collection of items based on the provided criteria
public type CollectionResponse record {
    CollectionresponseData data?;
};

public type UploadData record {
    string file?;
    record {} data?;
};

public type IdRequestsBody record {
    record {} data?;
};

public type Error record {
    int code;
    string message;
};

public type DownloadResponse record {
    string file?;
};

public type ProfileData record {
    record {} data?;
};

public type IdSettingBody record {
    record {} data?;
};

public type ConnectBody record {
    ConnectData data?;
};

public type UrlsBody record {
    UrlsData data?;
};

# Information defining the items in the collection
public type CollectionresponseDataSet record {
    int 'start?;
    int max?;
    string 'ascending?;
    string 'descending?;
    string filter?;
    int total?;
};

public type ConnectData record {
    string userid?;
    string password?;
    string library?;
};

public type IdReferencesBody1 record {
    record {} data?;
};

public type IdReferencesBody2 record {
    record {} data?;
};

public type AttachmentData record {
    string file?;
    record {} data?;
};

public type SecurityData record {
    record {} data?;
};

public type IdReferencesBody3 record {
    record {} data?;
};

public type IdReferencesBody record {
    record {} data?;
};

public type UrlsDataRestapiRef record {
    string 'type?;
    string id?;
    string lib?;
};
