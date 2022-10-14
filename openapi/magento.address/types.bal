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

# Interface LinkInterface Represents link with collected data and initialized vector for decryption.
public type AnalyticsDataLinkInterface record {
    # URL
    string url;
    # initialization vector
    string initialization_vector;
};

# Error parameters item
public type ErrorParametersItem record {
    # ACL resource
    string resources?;
    # Missing or invalid field name
    string fieldName?;
    # Incorrect field value
    string fieldValue?;
};

# Address Consent Token (XML)
public type AmazonshippingaddressAmazonorderreferenceidBody1 record {
    # Address Consent Token
    string addressConsentToken;
};

# Errors list
public type ErrorErrors ErrorErrorsItem[];

# Address Consent Token (JSON)
public type AmazonshippingaddressAmazonorderreferenceidBody record {
    # Address Consent Token
    string addressConsentToken;
};

# Error parameters list
public type ErrorParameters ErrorParametersItem[];

# Error details
public type ErrorErrorsItem record {
    # Error message
    string message?;
    # Error parameters list
    ErrorParameters parameters?;
};

# Address Consent Token
public type AmazonbillingaddressAmazonorderreferenceidBody record {
    # Address Consent Token
    string addressConsentToken;
};

# Address Consent Token(XML)
public type AmazonbillingaddressAmazonorderreferenceidBody1 record {
    # Address Consent Token
    string addressConsentToken;
};

public type ErrorResponse record {
    # Error message
    string message;
    # Errors list
    ErrorErrors errors?;
    # Error code
    int code?;
    # Error parameters list
    ErrorParameters parameters?;
    # Stack trace
    string trace?;
};
