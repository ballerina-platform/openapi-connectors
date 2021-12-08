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

public type Status string?;

public type StatusTaskState record {
    int? accumulate?;
    string[]? activity_tracker?;
};

public type ActivityqueuestatusQueryConfigFilterParam record {
    string? fromDate?;
    string? toDate?;
};

public type ActiveQueryConfigFilterParams record {
    string? fromDate?;
    string? toDate?;
};

public type Columns record {
    string? column_name?;
    int? data_length?;
    string? data_precision?;
    string? data_scale?;
    string? data_type?;
};

public type RevenueJobResponse record {
    string? message?;
    boolean? success?;
};

public type Journal record {
    int? client_id?;
    string? crtd_by?;
    string? crtd_dt?;
    int? id?;
    string? name?;
    string? status?;
    string? updt_by?;
    string? updt_dt?;
    int? report_id?;
};

public type StageError record {
    int? client_id?;
    string? crtd_by?;
    string? crtd_dt?;
    string? err_msg?;
    int? id?;
    string? inv_line_id?;
    string? inv_line_num?;
    string? processed_flag?;
    string? sec_atr_val?;
    string? so_line_id?;
    string? so_line_num?;
    string? so_num?;
    string? 'type?;
    string? updt_by?;
    string? updt_dt?;
    string? upload_id?;
};

public type Active record {
    int? accumulate?;
    ActiveActivityTracker? activity_tracker?;
    string? message?;
    string? metric?;
    ActiveQueryConfig? query_config?;
    string? status?;
    string? task_id?;
};

public type RevenuejobdetailData record {
    string? actual_start_date?;
    string? crtd_by?;
    string? crtd_dt?;
    int? id?;
    string? status?;
    string? updt_dt?;
};

public type RevenueJobDetail record {
    RevenuejobdetailData? data?;
    boolean? success?;
};

public type UploadStatus record {
    string? file_log?;
    int? file_request_id?;
};

public type ActiveQueryConfig record {
    ActiveQueryConfigFilterParams? filter_params?;
    string? object_name?;
};

public type Completed string?;

public type UploadMapping record {
    int? client_id?;
    string? col_name?;
    string? data_type?;
    int? id?;
    string? label?;
    int? seq?;
    int? upload_id?;
};

public type ActivityqueuestatusQueryConfig record {
    ActivityqueuestatusQueryConfigFilterParam? filter_param?;
    string? object_name?;
};

public type ActiveActivityTracker record {
    string? elapsed_time?;
    string? initated_time?;
    string? last_activity?;
};

public type ActivityqueuestatusActivityTracker record {
    string? elapsed_time?;
    string? initated_time?;
    string? last_activity?;
};

public type RevenueJobRequest record {
    # Name of the RC template that is defined in Zuora Revenue (**Policies > RC Grouping Template**).
    string? rc_template_name?;
    # The organization ID that can be found in Zuora Revenue (**Setups > Application > Organization**). This field is required only for multi-organization tenants.
    int? org_id?;
};

public type ActivityQueueStatus record {
    int? accumulate?;
    ActivityqueuestatusActivityTracker? activity_tracker?;
    string? message?;
    int? metric?;
    ActivityqueuestatusQueryConfig? query_config?;
    string? status?;
    string? task_id?;
};

public type Draining string?;

public type Stale string?;

public type ReportList record {
    string? category?;
    string? file_name?;
    int? id?;
    string? layout_name?;
    string? rep_desc?;
    string? rep_name?;
    string? report_date?;
    string? status?;
};
