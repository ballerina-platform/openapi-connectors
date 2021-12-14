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

public type AgentArr Agent[];

public type CredentialArr Credential[];

public type EventArr Event[];

public type APIKeyArr APIKey[];

public type OrganizationArr Organization[];

public type SiteArr Site[];

public type TaskArr Task[];

public type UserArr User[];

public type AssetArr Asset[];

public type AssetServiceNowArr AssetServiceNow[];

public type ServiceArr Service[];

public type WirelessArr Wireless[];

public type Site record {
    int created_at?;
    string description?;
    string excludes?;
    string id;
    string name;
    boolean permanent?;
    string scope?;
    int updated_at?;
};

public type Wireless record {
    string agent_name?;
    string authentication?;
    string bssid?;
    string channels?;
    int created_at?;
    record {} data?;
    string encryption?;
    string essid?;
    string family?;
    string id;
    string interface?;
    string last_agent_id?;
    int last_seen?;
    string last_task_id?;
    string org_name?;
    string organization_id?;
    int signal?;
    string site_id?;
    string site_name?;
    string 'type?;
    string vendor?;
};

public type OrgOptions record {
    string description?;
    string expiration_assets_offline?;
    string expiration_assets_stale?;
    string expiration_scans?;
    string export_token?;
    string name?;
    string parent_id?;
    string project?;
};

public type UserOptions record {
    boolean client_admin?;
    string email?;
    string first_name?;
    string last_name?;
    string org_default_role?;
    record {} org_roles?;
};

public type Task record {
    string agent_id?;
    string client_id?;
    int created_at?;
    string created_by?;
    string created_by_user_id?;
    string cruncher_id?;
    string description?;
    string _error?;
    boolean hidden?;
    string id;
    string name?;
    string organization_id?;
    record {} params?;
    string parent_id?;
    boolean recur?;
    string recur_frequency?;
    int recur_last?;
    string recur_last_task_id?;
    int recur_next?;
    string site_id?;
    int start_time?;
    record {} stats?;
    string status?;
    string 'type?;
    int updated_at?;
};

public type Organization record {
    int asset_count?;
    string client_id?;
    int created_at?;
    int deactivated_at?;
    string description?;
    string download_token?;
    int download_token_created_at?;
    int expiration_assets_offline?;
    int expiration_assets_stale?;
    int expiration_scans?;
    string export_token?;
    int export_token_counter?;
    int export_token_created_at?;
    int export_token_last_used_at?;
    string export_token_last_used_by?;
    string id;
    boolean inactive?;
    string name;
    string parent_id?;
    boolean permanent?;
    boolean project?;
    int service_count?;
    int service_count_arp?;
    int service_count_icmp?;
    int service_count_tcp?;
    int service_count_udp?;
    int updated_at?;
};

public type User record {
    boolean client_admin?;
    string client_id?;
    int created_at?;
    string email?;
    string first_name?;
    string id;
    int invite_token_expiration?;
    int last_login_at?;
    string last_login_ip?;
    string last_login_ua?;
    string last_name?;
    int login_failures?;
    string org_default_role?;
    record {} org_roles?;
    int reset_token_expiration?;
    boolean sso_only?;
    int updated_at?;
};

public type AssetsWithCheckpoint record {
    Asset[] assets;
    int since;
};

public type License record {
    int activated_at?;
    string address_city?;
    string address_country?;
    string address_postal?;
    string address_region?;
    string address_street?;
    int created_at?;
    string id?;
    int license_expiration?;
    int license_live_asset_count?;
    int license_max_assets?;
    int license_project_asset_count?;
    string license_type?;
    string name?;
    string partner?;
    string phone?;
    record {} settings?;
    string sso_default_role?;
    string sso_domain?;
    string sso_login_issuer_url?;
    string sso_login_login_url?;
    string sso_login_logout_url?;
    string sso_login_message?;
    string sso_mode?;
    string sso_type?;
    int subscription_cancel_at?;
    int subscription_canceled_at?;
    int subscription_period_end?;
    int subscription_period_start?;
    int updated_at?;
    boolean via_reseller?;
};

# A URL to a resource
public type URL record {
    # ID
    string id?;
};

# A component ID and version
public type ComponentVersion record {
    # Component ID
    string id;
    # Component version
    string 'version;
};

public type AssetComments record {
    string comments;
};

public type Asset record {
    string[] addresses?;
    string[] addresses_extra?;
    string agent_name?;
    boolean alive?;
    record {} attributes?;
    string comments?;
    int created_at?;
    record {} credentials?;
    string detected_by?;
    string[] domains?;
    int first_seen?;
    string hw?;
    string id;
    string last_agent_id?;
    int last_seen?;
    string last_task_id?;
    int lowest_rtt?;
    int lowest_ttl?;
    string[] mac_vendors?;
    string[] macs?;
    string[] names?;
    string newest_mac?;
    int newest_mac_age?;
    string newest_mac_vendor?;
    string org_name?;
    string organization_id?;
    string os?;
    string os_version?;
    record {} rtts?;
    int service_count?;
    int service_count_arp?;
    int service_count_icmp?;
    int service_count_tcp?;
    int service_count_udp?;
    string[] service_ports_products?;
    string[] service_ports_protocols?;
    string[] service_ports_tcp?;
    string[] service_ports_udp?;
    record {} services?;
    string site_id?;
    string site_name?;
    record {} tags?;
    string 'type?;
    int updated_at?;
};

public type AssetTags record {
    record {} tags;
};

public type AWSCredentialFields record {
    string access_key;
    string regions?;
    string secret_access_key;
};

public type Agent record {
    string arch?;
    string client_id?;
    boolean connected?;
    int created_at?;
    int deactivated_at?;
    string external_ip?;
    string host_id?;
    string hub_id?;
    string id;
    boolean inactive?;
    string internal_ip?;
    int last_checkin?;
    string name?;
    string organization_id?;
    string os?;
    string site_id?;
    record {} system_info?;
    int updated_at?;
    string 'version?;
};

public type Credential record {
    record {} acl?;
    string[] cidrs?;
    string client_id?;
    int created_at?;
    string created_by_email?;
    string created_by_id?;
    boolean global?;
    string id;
    int last_used_at?;
    string last_used_by_id?;
    string name?;
    # The service the credentials are for.
    string 'type?;
};

public type APIKeyOptions record {
    string comment?;
    string organization_id?;
};

public type Service record {
    string[] addresses?;
    string[] addresses_extra?;
    string agent_name?;
    boolean alive?;
    record {} attributes?;
    string comments?;
    int created_at?;
    record {} credentials?;
    string detected_by?;
    string[] domains?;
    int first_seen?;
    string hw?;
    string id;
    string last_agent_id?;
    int last_seen?;
    string last_task_id?;
    int lowest_rtt?;
    int lowest_ttl?;
    string[] mac_vendors?;
    string[] macs?;
    string[] names?;
    string newest_mac?;
    int newest_mac_age?;
    string newest_mac_vendor?;
    string org_name?;
    string organization_id?;
    string os?;
    string os_version?;
    record {} rtts?;
    string service_address?;
    string service_asset_id?;
    int service_count?;
    int service_count_arp?;
    int service_count_icmp?;
    int service_count_tcp?;
    int service_count_udp?;
    int service_created_at?;
    record {} service_data?;
    string service_id;
    string service_link?;
    string service_port?;
    string[] service_ports_products?;
    string[] service_ports_protocols?;
    string[] service_ports_tcp?;
    string[] service_ports_udp?;
    string service_protocol?;
    string service_screenshot_link?;
    string service_summary?;
    string service_transport?;
    int service_updated_at?;
    string service_vhost?;
    record {} services?;
    string site_id?;
    string site_name?;
    record {} tags?;
    string 'type?;
    int updated_at?;
};

public type SiteOptions record {
    string description?;
    string excludes?;
    string name;
    string scope?;
};

public type APIKey record {
    string client_id?;
    string comment?;
    int counter?;
    int created_at?;
    string created_by?;
    string id;
    boolean inactive?;
    int last_used_at?;
    string last_used_ip?;
    string last_used_ua?;
    string organization_id?;
    string token?;
    string 'type?;
    int usage_limit?;
    int usage_today?;
};

public type MiradoreCredentialFields record {
    string api_key;
    string hostname;
};

public type AgentSiteID record {
    string site_id;
};

public type CredentialOptions record {
    record {} acl?;
    string cidrs?;
    boolean global?;
    string name?;
    AWSCredentialFields|MiradoreCredentialFields secret?;
    string 'type?;
};

public type Event record {
    string action?;
    string client_id?;
    int created_at?;
    record {} details?;
    string id?;
    string organization_id?;
    int processed_at?;
    string processor_id?;
    string site_id?;
    string source_id?;
    string source_name?;
    string source_type?;
    string state?;
    boolean success?;
    string target_id?;
    string target_name?;
    string target_type?;
};

public type ScanOptions record {
    string agent?;
    string excludes?;
    string 'max\-group\-size?;
    string 'max\-host\-rate?;
    string 'max\-sockets?;
    string nameservers?;
    string passes?;
    # Optional probe list, otherwise all probes are used
    string probes?;
    string rate?;
    string 'scan\-description?;
    string 'scan\-frequency?;
    string 'scan\-grace\-period?;
    string 'scan\-name?;
    string 'scan\-start?;
    string 'scan\-tags?;
    string screenshots?;
    string targets;
    string 'tcp\-ports?;
};

public type AssetServiceNow record {
    string addresses_extra?;
    string addresses_scope?;
    boolean alive?;
    string asset_id;
    string comments?;
    string detected_by?;
    string domains?;
    string first_discovered?;
    string hw_product?;
    string hw_vendor?;
    string hw_version?;
    string ip_address?;
    string last_discovered?;
    string last_updated?;
    int lowest_rtt?;
    int lowest_ttl?;
    string mac_address?;
    string mac_manufacturer?;
    string mac_vendors?;
    string macs?;
    string name?;
    string newest_mac_age?;
    string organization?;
    string os_product?;
    string os_vendor?;
    string os_version?;
    int service_count?;
    int service_count_arp?;
    int service_count_icmp?;
    int service_count_tcp?;
    int service_count_udp?;
    string site?;
    string sys_class_name?;
    string tags?;
    string 'type?;
};

public type UserInviteOptions record {
    boolean client_admin?;
    string email?;
    string first_name?;
    string last_name?;
    string message?;
    string org_default_role?;
    record {} org_roles?;
    string subject?;
};
