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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # All requests on the chaingateway.io API needs to include an API key. The API key can be provided as part of the query string or as a request header. The name of the API key needs to be `Authorization`
    @display {label: "", kind: "password"}
    string authorization;
|};

public type UnsubscribeAddress record {
    boolean ok;
    string ethereumaddress;
    string contractaddress;
    string url;
    boolean deleted;
};

public type GetExchangeRate record {
    boolean ok;
    string currency;
    decimal rate;
};

public type GetTokenRequest record {
    string contractaddress;
};

public type GetTokenBalanceRequest record {
    string contractaddress;
    string ethereumaddress;
};

public type Address record {
    string ethereumaddress;
};

public type SubscribeAddressRequest record {
    string ethereumaddress;
    string contractaddress;
    string url;
};

public type Ipn record {
    string ethereumaddress;
    string contractaddress;
    string url;
};

public type NewAddress record {
    boolean ok;
    string ethereumaddress;
    string password;
};

public type GetTransactionsRequest record {
    string txid;
};

public type ResendFailedIPNRequest record {
    int id;
};

public type ClearAddressRequest record {
    string ethereumaddress;
    string newaddress;
    string password;
};

public type ImportAddressRequest record {
    string filename;
    Content content;
    string password;
};

public type ExportAddress record {
    boolean ok;
    string filename;
    string content;
};

public type GetTransactions record {
    boolean ok;
    Transaction[] transactions;
};

public type ImportAddress record {
    boolean ok;
    string ethaddress;
    string filename;
};

public type ExportAddressRequest record {
    string ethaddress;
    string password;
};

public type GetTokenBalance record {
    boolean ok;
    string contractaddress;
    string ethereumaddress;
    int balance;
};

public type SendTokenRequest record {
    string contractaddress;
    string 'from;
    string to;
    string password;
    int amount;
    string identifier;
};

public type ListAddresses record {
    boolean ok;
    Address[] addresses;
};

public type SendToken record {
    boolean ok;
    string identifier;
    string txid;
    string contractaddress;
    string 'from;
    string to;
    int amount;
};

public type ResendFailedIPN record {
    boolean ok;
    int id;
};

public type SendEthereum record {
    boolean ok;
    string txid;
    string 'from;
    string to;
    string amount;
};

public type UnsubscribeAddressRequest record {
    string ethereumaddress;
    string contractaddress;
    string url;
};

public type ListFailedIPNs record {
    boolean ok;
    FailedIpn[] failed_ipns;
};

public type SendEthereumRequest record {
    string 'from;
    string to;
    string password;
    decimal amount;
};

public type DeleteAddress record {
    boolean ok;
    string ethereumaddress;
    boolean deleted;
};

public type GetToken record {
    boolean ok;
    string contractaddress;
    string name;
    string symbol;
    int decimals;
    int supply;
};

public type GetBlockRequest record {
    string block;
};

public type GetLastBlockNumber record {
    boolean ok;
    int blocknumber;
};

public type GetExchangeRateRequest record {
    string currency;
};

public type GetEthereumBalance record {
    boolean ok;
    string ethereumaddress;
    decimal balance;
};

public type ClearAddress record {
    boolean ok;
    string txid;
    string ethereumaddress;
    string newaddress;
    decimal amount;
    decimal gas;
    string total;
};

public type GetEthereumBalanceRequest record {
    string ethereumaddress;
};

public type Crypto record {
    string ciphertext;
    Cipherparams cipherparams;
    string cipher;
    string kdf;
    Kdfparams kdfparams;
    string mac;
};

public type SubscribeAddress record {
    boolean ok;
    string ethereumaddress;
    string contractaddress;
    string url;
};

public type Cipherparams record {
    string iv;
};

public type Transaction record {
    string txid;
    string block_number;
    string contract_address;
    string 'type;
    string token_name;
    string token_symbol;
    string token_decimals;
    string token_supply;
    string gas;
    string gas_price;
    string 'from;
    string to;
    string amount;
};

public type GetGasPrice record {
    boolean ok;
    int gasprice;
};

public type FailedIpn record {
    string id;
    string timestamp;
    string ethereumaddress;
    string contractaddress;
    string amount;
    string url;
    string action;
};

public type NewAddressRequest record {
    string password;
};

public type DeleteAddressRequest record {
    string ethereumaddress;
    string password;
};

public type Content record {
    int 'version;
    string id;
    string address;
    Crypto crypto;
};

public type GetBlock record {
    boolean ok;
    string hash;
    string block_number;
    string parent_hash;
    string miner;
    string difficulty;
    string size_in_bytes;
    string gas_limit;
    string gas_used;
    string time_stamp;
    string transactions_count;
};

public type ListSubscribedAddresses record {
    boolean ok;
    Ipn[] ipns;
};

public type Kdfparams record {
    int dklen;
    string salt;
    int n;
    int r;
    int p;
};
