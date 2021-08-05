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

public type UnsubscribeAddress record {
    string contractaddress;
    boolean deleted;
    string ethereumaddress;
    boolean ok;
    string url;
};

public type GetExchangeRate record {
    string currency;
    boolean ok;
    decimal rate;
};

public type Address record {
    string ethereumaddress;
};

public type GetTokenBalanceRequest record {
    string contractaddress;
    string ethereumaddress;
};

public type GetTokenRequest record {
    string contractaddress;
};

public type Ipn record {
    string contractaddress;
    string ethereumaddress;
    string url;
};

public type SubscribeAddressRequest record {
    string contractaddress;
    string ethereumaddress;
    string url;
};

public type NewAddress record {
    string ethereumaddress;
    boolean ok;
    string password;
};

public type GetTransactionsRequest record {
    string txid;
};

public type ClearAddressRequest record {
    string ethereumaddress;
    string newaddress;
    string password;
};

public type ResendFailedIPNRequest record {
    int id;
};

public type ExportAddress record {
    string content;
    string filename;
    boolean ok;
};

public type ImportAddressRequest record {
    Content content;
    string filename;
    string password;
};

public type GetTransactions record {
    boolean ok;
    Transaction[] transactions;
};

public type ExportAddressRequest record {
    string ethaddress;
    string password;
};

public type ImportAddress record {
    string ethaddress;
    string filename;
    boolean ok;
};

public type GetTokenBalance record {
    int balance;
    string contractaddress;
    string ethereumaddress;
    boolean ok;
};

public type SendTokenRequest record {
    int amount;
    string contractaddress;
    string 'from;
    string identifier;
    string password;
    string to;
};

public type ListAddresses record {
    Address[] addresses;
    boolean ok;
};

public type SendToken record {
    int amount;
    string contractaddress;
    string 'from;
    string identifier;
    boolean ok;
    string to;
    string txid;
};

public type ResendFailedIPN record {
    int id;
    boolean ok;
};

public type SendEthereum record {
    string amount;
    string 'from;
    boolean ok;
    string to;
    string txid;
};

public type ListFailedIPNs record {
    FailedIpn[] failed_ipns;
    boolean ok;
};

public type SendEthereumRequest record {
    decimal amount;
    string 'from;
    string password;
    string to;
};

public type UnsubscribeAddressRequest record {
    string contractaddress;
    string ethereumaddress;
    string url;
};

public type DeleteAddress record {
    boolean deleted;
    string ethereumaddress;
    boolean ok;
};

public type GetToken record {
    string contractaddress;
    int decimals;
    string name;
    boolean ok;
    int supply;
    string symbol;
};

public type GetBlockRequest record {
    string block;
};

public type GetExchangeRateRequest record {
    string currency;
};

public type GetLastBlockNumber record {
    int blocknumber;
    boolean ok;
};

public type ClearAddress record {
    decimal amount;
    string ethereumaddress;
    decimal gas;
    string newaddress;
    boolean ok;
    string total;
    string txid;
};

public type GetEthereumBalance record {
    decimal balance;
    string ethereumaddress;
    boolean ok;
};

public type GetEthereumBalanceRequest record {
    string ethereumaddress;
};

public type Crypto record {
    string cipher;
    Cipherparams cipherparams;
    string ciphertext;
    string kdf;
    Kdfparams kdfparams;
    string mac;
};

public type SubscribeAddress record {
    string contractaddress;
    string ethereumaddress;
    boolean ok;
    string url;
};

public type Cipherparams record {
    string iv;
};

public type Transaction record {
    string amount;
    string block_number;
    string contract_address;
    string 'from;
    string gas;
    string gas_price;
    string to;
    string token_decimals;
    string token_name;
    string token_supply;
    string token_symbol;
    string txid;
    string 'type;
};

public type FailedIpn record {
    string action;
    string amount;
    string contractaddress;
    string ethereumaddress;
    string id;
    string timestamp;
    string url;
};

public type GetGasPrice record {
    int gasprice;
    boolean ok;
};

public type Content record {
    string address;
    Crypto crypto;
    string id;
    int 'version;
};

public type DeleteAddressRequest record {
    string ethereumaddress;
    string password;
};

public type NewAddressRequest record {
    string password;
};

public type GetBlock record {
    string block_number;
    string difficulty;
    string gas_limit;
    string gas_used;
    string hash;
    string miner;
    boolean ok;
    string parent_hash;
    string size_in_bytes;
    string time_stamp;
    string transactions_count;
};

public type ListSubscribedAddresses record {
    Ipn[] ipns;
    boolean ok;
};

public type Kdfparams record {
    int dklen;
    int n;
    int p;
    int r;
    string salt;
};
