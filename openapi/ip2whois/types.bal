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

public type Registrar record {
    string iana_id?;
    string name?;
    string url?;
};

public type DomainInfo record {
    string domain?;
    string domain_id?;
    string status?;
    string create_date?;
    string update_date?;
    string expire_date?;
    int domain_age?;
    string whois_server?;
    Registrar registrar?;
    Data registrant?;
    Data admin?;
    Data tech?;
    Data billing?;
    string[] nameservers?;
    string error_code?;
    string error_message?;
};

public type Data record {
    string name?;
    string organization?;
    string street_address?;
    string city?;
    string region?;
    string zip_code?;
    string country?;
    string phone?;
    string fax?;
    string email?;
};
