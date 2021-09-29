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

public type Meta record {
    # The current page number of a data set
    int? current_page?;
    # The current position of a data set 
    int? 'from?;
    # The last page of a data set
    string? last_page?;
    # API path
    string? path?;
    # A number of records per page
    int? per_page?;
    # The last position in a data set
    int? to?;
    # Total number of records in a data set
    int? total?;
};

public type ResidualsDetails record {
    string? MID?;
    string? DBA?;
};

public type TemplateRules record {
    string? column?;
    string? rule?;
    int? value?;
    string? 'field?;
};

public type LineitemsMerchant record {
    string? mid?;
    string? dba?;
};

public type ResidualtemplateassignedTemplates record {
    int? id?;
    string? name?;
    int? 'version?;
    int? processor_id?;
    TemplateRules[]? rules?;
};

public type LineitemsAgents record {
    int? user_id?;
    string? username?;
    string? full_name?;
    int? agent_net?;
    int? percentage?;
};

public type LineItems record {
    int? id?;
    string? 'type?;
    int? item_id?;
    LineitemsUser? user?;
    LineitemsMerchant? merchant?;
    int? related_mid?;
    string? related_dba?;
    string? description?;
    int? income?;
    int? expense?;
    int? percentage?;
    int? agent_net?;
    boolean? is_recurring?;
    # Created date of line item
    string? created?;
    # Last update date of line item
    string? modified?;
    LineitemsAgents[]? agents?;
    # Date of start recurring line item
    string? recurring_start_date?;
    # Count of payments what was already done
    int? recurring_payment_count?;
    # Count of payments which will be done (this will be null if there is no limit)
    int? recurring_max_payment_count?;
    string? recurring_period?;
};

public type ResidualTemplate record {
    int? id?;
    string? name?;
    int? creator_id?;
    string? creator_name?;
    # Created date of template
    string? created_at?;
    int? revision?;
    TemplateRules[]? rules?;
};

public type MerchantRow record {
    string? merchant?;
    int? transactions?;
    int? sales_amount?;
    int? income?;
    int? expense?;
    int? net?;
    int? bps?;
    boolean? users?;
    int? percentage?;
    int? agent_net?;
    int? mid?;
};

public type LineitemsUser record {
    int? user_id?;
    string? username?;
    string? full_name?;
    string? 'class?;
};

public type ResidualTemplateAssigned record {
    int? user_id?;
    string? username?;
    string? full_name?;
    ResidualtemplateassignedTemplates[]? templates?;
};

public type SummaryResponse record {
    int? processor_id?;
    string? name?;
    string? created?;
    int? created_by?;
    string? modified?;
    int? modified_by?;
    int? merchants_count?;
    int? sum_transactions?;
    decimal? sum_sales_amount?;
    decimal? sum_income?;
    decimal? sum_expense?;
    decimal? sum_net?;
    decimal? sum_bps?;
    int? sum_agent_net?;
};

public type InlineResponse20010 record {
    SummaryResponse[]? data?;
    Links? links?;
    Meta? meta?;
};

public type InlineResponse20012 record {
    ResidualsDetails[]? data?;
    Links? links?;
    Meta? meta?;
};

public type Links record {
    # An URL to the first page of the data set
    string? first?;
    # An URL to the last page of the data set
    string? last?;
    # An URL to the previous page of the data set
    string? prev?;
    # An URL to the next page of the data set
    string? next?;
};

public type InlineResponse20011 record {
    MerchantRow[]? data?;
    Links? links?;
    Meta? meta?;
};

public type InlineResponse20014 record {
    ResidualTemplate[]? data?;
    Links? links?;
    Meta? meta?;
};

public type InlineResponse20013 record {
    LineItems[]? data?;
    Links? links?;
    Meta? meta?;
};

public type InlineResponse20015 record {
    ResidualTemplateAssigned[]? data?;
    Links? links?;
    Meta? meta?;
};
