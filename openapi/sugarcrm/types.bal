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

public type PackageManagerList record {
    Package[] packages?;
};

public type FileUploadResponse record {
    string file_install?;
    string unFile?;
};

public type SuccessResponseStatus record {
    # The success status
    boolean success?;
};

public type InlineResponse200 record {
    record {} modules?;
};

public type SearchOptions record {
    # A maximum number of records to return. Default is 20.
    int max_num?;
    # The number of records to skip over before records are returned. Default is 0.
    int offset?;
    # A search expression, will search on this module. Cannot be used at the same time as a filter expression or id.
    string q?;
    # Wether or not to return highlighted results. Default is true.
    anydata[] sort?;
    # A search expression, will search on this module. Cannot be used at the same time as a filter expression or id.
    boolean highlights?;
    # Comma delimited list of modules to search. If omitted, all search enabled modules will be queried.
    string module_list?;
};

public type FilteredRecordDetails record {
    # Displays the next offset for retrieval of additional results. -1 will be returned when there are no more records.
    int next_offset?;
    # An array of results containing matched records
    anydata[] records?;
};

public type AWSConfig record {
    # The name of the AWS Connect instance
    string aws_connect_instance_name?;
    # The region assigned to the AWS Connect instance
    string aws_connect_region?;
};

public type FreeBusySchedule record {
    string 'start?;
    string end?;
};

public type SearchBackendStatus record {
    boolean available?;
    string[] enabled_modules?;
};

public type SuccessResponseID record {
    string id?;
};

public type LicenselimitdataSeats record {
    int CURRENT?;
    int SUGAR_SERVE?;
    int SUGAR_SELL?;
};

public type LicenseLimitData record {
    int default_limit?;
    int limit_enforced?;
    string default_license_type?;
    LicenselimitdataSeats seats?;
    LicenselimitdataSeats available_seats?;
};

public type DashboardData record {
    # The module dashboard belongs to (e.g. Home, Cases, Accounts)
    string dashboard_module?;
    # The dashboard name (e.g. portal-home)
    string dashboard?;
};

public type Package record {
    string name?;
    string 'version?;
    string 'type?;
    string published_date?;
    string description?;
    boolean uninstallable?;
    string file_install?;
    string file?;
    string enabled?;
    string id?;
    boolean installed?;
    string unFile?;
};

public type FilterOptions record {
    # The [filter expression](https://support.sugarcrm.com/Documentation/Sugar_Developer/Sugar_Developer_Guide_11.3/Integration/Web_Services/REST_API/Endpoints/Accountsrecordlinklink_namefilter_GET/#Filter_Expressions).
    record {}[] filter?;
    # Identifier for a preexisting filter. If filter is also set, the two filters are joined with an AND.
    string filter_id?;
    # A maximum number of records to return. Default is 20.
    int max_num?;
    # The number of records to skip over before records are returned. Default is 0.
    int offset?;
    # Comma delimited list of fields to return. The field date_modified will always be returned. This argument can be combined with the view argument. Example `name,account_type,description`
    string fields?;
    # Instead of defining the fields argument, the view argument can be used instead. The field list is constructed at the server side based on the view definition which is requested. This argument can be used in combination with the fields argument. Common views are "record" and "list". Example- `record `
    string view?;
    # How to sort the returned records, in a comma delimited list with the direction appended to the column name after a colon. Example- `name:DESC,account_type:DESC,date_modified:ASC`
    string order_by?;
    # A search expression, will search on this module. Cannot be used at the same time as a filter expression or id.
    string q?;
    # Boolean to show deleted records in the result set.
    boolean deleted?;
};

public type FreeBusyData record {
    string id?;
    string module?;
    FreeBusySchedule[] freebusy?;
};
