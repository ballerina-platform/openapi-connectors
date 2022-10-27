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

import ballerina/http;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://identity.xero.com/connect/token";
|};

public type AssetTypeArr AssetType[];

# See Asset Status Codes.
public type AssetStatusQueryParam string;

public type BookDepreciationSetting record {
    # The method of averaging applied to this asset. See Averaging Methods
    string averagingMethod?;
    # Unique Xero identifier for the effective date change
    string bookEffectiveDateOfChangeId?;
    # Unique Xero identifier for the depreciable object
    string depreciableObjectId?;
    # The type of asset object
    string depreciableObjectType?;
    # See Depreciation Calculation Methods
    string depreciationCalculationMethod?;
    # The method of depreciation applied to this asset. See Depreciation Methods
    string depreciationMethod?;
    # The rate of depreciation (e.g. 0.05)
    decimal depreciationRate?;
    # Effective life of the asset in years (e.g. 5)
    int effectiveLifeYears?;
};

public type Pagination record {
    int itemCount?;
    int page?;
    int pageCount?;
    int pageSize?;
};

public type ResourceValidationErrorsElement record {
    # Detail of the resource validation error
    string detail?;
    # Explanation of the resource validation error
    string localisedMessage?;
    # The field name of the erroneous field
    string resourceName?;
    # Title of the resource validation error
    string title?;
    # Internal type of the resource error message
    string 'type?;
};

public type AssetType record {
    # The account for accumulated depreciation of fixed assets of this type
    string accumulatedDepreciationAccountId?;
    # Xero generated unique identifier for asset types
    string assetTypeId?;
    # The name of the asset type
    string assetTypeName;
    BookDepreciationSetting bookDepreciationSetting;
    # The expense account for the depreciation of fixed assets of this type
    string depreciationExpenseAccountId?;
    # The asset account for fixed assets of this type
    string fixedAssetAccountId?;
    # All asset types that have accumulated depreciation for any assets that use them are deemed ‘locked’ and cannot be removed.
    int locks?;
};

public type BookDepreciationDetail record {
    # The value of the asset you want to depreciate, if this is less than the cost of the asset.
    decimal costLimit?;
    # All depreciation occurring in the current financial year.
    decimal currentAccumDepreciationAmount?;
    # When an asset is disposed, this will be the sell price minus the purchase price if a profit was made.
    decimal currentCapitalGain?;
    # When an asset is disposed, this will be the lowest one of sell price or purchase price, minus the current book value.
    decimal currentGainLoss?;
    # YYYY-MM-DD
    string depreciationStartDate?;
    # All depreciation prior to the current financial year.
    decimal priorAccumDepreciationAmount?;
    # The value of the asset remaining when you've fully depreciated it.
    decimal residualValue?;
};

public type Assets record {
    Asset[] items?;
    Pagination pagination?;
};

public type FieldValidationErrorsElement record {
    # Detail of the field validation error
    string detail?;
    # The field name of the erroneous field
    string fieldName?;
    # Explanation of the field validation error
    string localisedMessage?;
    # Title of the field validation error
    string title?;
    # Internal type of the field validation error message
    string 'type?;
    # The provided value
    string valueProvided?;
};

public type Setting record {
    # The prefix used for fixed asset numbers (“FA-” by default)
    string assetNumberPrefix?;
    # The next available sequence number
    string assetNumberSequence?;
    # The date depreciation calculations started on registered fixed assets in Xero
    string assetStartDate?;
    # Default account that capital gains are posted to
    string defaultCapitalGainOnDisposalAccountId?;
    # Default account that gains are posted to
    string defaultGainOnDisposalAccountId?;
    # Default account that losses are posted to
    string defaultLossOnDisposalAccountId?;
    # The last depreciation date
    string lastDepreciationDate?;
    # opt in for tax calculation
    boolean optInForTax?;
};

public type Asset record {
    # The accounting value of the asset
    decimal accountingBookValue?;
    # The Xero-generated Id for the asset
    string assetId?;
    # The name of the asset
    string assetName;
    # Must be unique.
    string assetNumber?;
    # See Asset Status Codes.
    AssetStatus assetStatus?;
    # The Xero-generated Id for the asset type
    string assetTypeId?;
    BookDepreciationDetail bookDepreciationDetail?;
    BookDepreciationSetting bookDepreciationSetting?;
    # Boolean to indicate whether depreciation can be rolled back for this asset individually. This is true if it doesn't have 'legacy' journal entries and if there is no lock period that would prevent this asset from rolling back.
    boolean canRollback?;
    # The date the asset was disposed
    string disposalDate?;
    # The price the asset was disposed at
    decimal disposalPrice?;
    # Boolean to indicate whether delete is enabled
    boolean isDeleteEnabledForDate?;
    # The date the asset was purchased YYYY-MM-DD
    string purchaseDate?;
    # The purchase price of the asset
    decimal purchasePrice?;
    # The asset's serial number
    string serialNumber?;
    # The date the asset’s warranty expires (if needed) YYYY-MM-DD
    string warrantyExpiryDate?;
};

public type Error record {
    # Detail of the error
    string detail?;
    # Array of elements of field validation errors
    FieldValidationErrorsElement[] fieldValidationErrors?;
    # Array of elements of resource validation errors
    ResourceValidationErrorsElement[] resourceValidationErrors?;
    # Title of the error
    string title?;
    # The internal type of error, not accessible externally
    string 'type?;
};

# See Asset Status Codes.
public type AssetStatus string;
