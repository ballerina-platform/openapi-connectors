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

public type MappingJobResult record {
    *MappingJobResultFigiList;
};

public type BulkMappingJobResult MappingJobResult[];

# For V3: securityType2 is required when idType is BASE_TICKER or ID_EXCH_SYMBOL.  expiration is required when securityType2 is Option or Warrant.  maturity is required when securityType2 is Pool.
public type MappingJob record {
    # Type of third party identifier
    MappingJobIdType idType;
    # The value for the represented third party identifier
    string|int idValue;
    # Exchange code of the desired instrument(s) (cannot use in conjunction with micCode)
    string? exchCode?;
    # ISO market identification code(MIC) of the desired instrument(s) (cannot use in conjunction with exchCode)
    string? micCode?;
    # Currency associated to the desired instrument(s)
    string? currency?;
    # Market sector description of the desired instrument(s)
    string? marketSecDes?;
    # Security type of the desired instrument(s)
    string? securityType?;
    # An alternative security type of the desired instrument(s)
    string? securityType2?;
    # Set to true to include equity instruments that are not listed on an exchange
    boolean? includeUnlistedEquities?;
    # Will filter instruments based on option type
    MappingJobOptionType optionType?;
    # At least one entry should be non-null.
    NullableNumberInterval? strike?;
    # At least one entry should be non-null.
    NullableNumberInterval? contractSize?;
    # At least one entry should be non-null.
    NullableNumberInterval? coupon?;
    # At least one entry should be non-null.
    NullableDateInterval? expiration?;
    # At least one entry should be non-null.
    NullableDateInterval? maturity?;
    # State code of the desired instrument(s)
    MappingJobStateCode stateCode?;
};

public type FigiResult record {
    # FIGI assigned to the instrument
    string figi?;
    # Enum-like attributes of the instrument
    string? securityType?;
    # Enum-like attributes of the instrument
    string? marketSector?;
    # Various attributes of the instrument
    string? ticker?;
    # Various attributes of the instrument
    string? name?;
    # Enum-like attributes of the instrument
    string? exchCode?;
    # Various attributes of the instrument
    string? shareClassFIGI?;
    # Various attributes of the instrument
    string? compositeFIGI?;
    # Enum-like attributes of the instrument
    string? securityType2?;
    # Various attributes of the instrument
    string? securityDescription?;
    # Exists when API is unable to show non-FIGI fields.
    string? metadata?;
};

public type MappingJobResultFigiList record {
    FigiResult[] data?;
};

public type BulkMappingJob MappingJob[];

# At least one entry should be non-null.
#
public type NullableNumberInterval decimal?[];

# At least one entry should be non-null.
#
public type NullableDateInterval string?[];

public type MappingJobResultFigiNotFound record {
    string warning?;
};

public type Values record {
    string[] values?;
};

public enum MappingJobIdType {
    MAPPINGJOBIDTYPE_IDISIN = "ID_ISIN",
    MAPPINGJOBIDTYPE_IDBBUNIQUE = "ID_BB_UNIQUE",
    MAPPINGJOBIDTYPE_IDSEDOL = "ID_SEDOL",
    MAPPINGJOBIDTYPE_IDCOMMON = "ID_COMMON",
    MAPPINGJOBIDTYPE_IDWERTPAPIER = "ID_WERTPAPIER",
    MAPPINGJOBIDTYPE_IDCUSIP = "ID_CUSIP",
    MAPPINGJOBIDTYPE_IDBB = "ID_BB",
    MAPPINGJOBIDTYPE_IDITALY = "ID_ITALY",
    MAPPINGJOBIDTYPE_IDEXCHSYMBOL = "ID_EXCH_SYMBOL",
    MAPPINGJOBIDTYPE_IDFULLEXCHANGESYMBOL = "ID_FULL_EXCHANGE_SYMBOL",
    MAPPINGJOBIDTYPE_COMPOSITEIDBBGLOBAL = "COMPOSITE_ID_BB_GLOBAL",
    MAPPINGJOBIDTYPE_IDBBGLOBALSHARECLASSLEVEL = "ID_BB_GLOBAL_SHARE_CLASS_LEVEL",
    MAPPINGJOBIDTYPE_IDBBSECNUMDES = "ID_BB_SEC_NUM_DES",
    MAPPINGJOBIDTYPE_IDBBGLOBAL = "ID_BB_GLOBAL",
    MAPPINGJOBIDTYPE_TICKER = "TICKER",
    MAPPINGJOBIDTYPE_IDCUSIP8CHR = "ID_CUSIP_8_CHR",
    MAPPINGJOBIDTYPE_OCCSYMBOL = "OCC_SYMBOL",
    MAPPINGJOBIDTYPE_UNIQUEIDFUTOPT = "UNIQUE_ID_FUT_OPT",
    MAPPINGJOBIDTYPE_OPRASYMBOL = "OPRA_SYMBOL",
    MAPPINGJOBIDTYPE_TRADINGSYSTEMIDENTIFIER = "TRADING_SYSTEM_IDENTIFIER",
    MAPPINGJOBIDTYPE_IDCINS = "ID_CINS",
    MAPPINGJOBIDTYPE_IDSHORTCODE = "ID_SHORT_CODE",
    MAPPINGJOBIDTYPE_BASETICKER = "BASE_TICKER",
    MAPPINGJOBIDTYPE_VENDORINDEXCODE = "VENDOR_INDEX_CODE"
}

public enum MappingJobOptionType {
    MAPPINGJOBOPTIONTYPE_PUT = "Put",
    MAPPINGJOBOPTIONTYPE_CALL = "Call"
}

public enum MappingJobStateCode {
    MAPPINGJOBSTATECODE_AB = "AB",
    MAPPINGJOBSTATECODE_AC = "AC",
    MAPPINGJOBSTATECODE_AH = "AH",
    MAPPINGJOBSTATECODE_AK = "AK",
    MAPPINGJOBSTATECODE_AL = "AL",
    MAPPINGJOBSTATECODE_AM = "AM",
    MAPPINGJOBSTATECODE_AR = "AR",
    MAPPINGJOBSTATECODE_AS = "AS",
    MAPPINGJOBSTATECODE_AT = "AT",
    MAPPINGJOBSTATECODE_AZ = "AZ",
    MAPPINGJOBSTATECODE_BC = "BC",
    MAPPINGJOBSTATECODE_BJ = "BJ",
    MAPPINGJOBSTATECODE_CA = "CA",
    MAPPINGJOBSTATECODE_CB = "CB",
    MAPPINGJOBSTATECODE_CO = "CO",
    MAPPINGJOBSTATECODE_CQ = "CQ",
    MAPPINGJOBSTATECODE_CT = "CT",
    MAPPINGJOBSTATECODE_CZ = "CZ",
    MAPPINGJOBSTATECODE_DC = "DC",
    MAPPINGJOBSTATECODE_DE = "DE",
    MAPPINGJOBSTATECODE_EH = "EH",
    MAPPINGJOBSTATECODE_FH = "FH",
    MAPPINGJOBSTATECODE_FI = "FI",
    MAPPINGJOBSTATECODE_FJ = "FJ",
    MAPPINGJOBSTATECODE_FL = "FL",
    MAPPINGJOBSTATECODE_FO = "FO",
    MAPPINGJOBSTATECODE_FS = "FS",
    MAPPINGJOBSTATECODE_GA = "GA",
    MAPPINGJOBSTATECODE_GD = "GD",
    MAPPINGJOBSTATECODE_GF = "GF",
    MAPPINGJOBSTATECODE_GM = "GM",
    MAPPINGJOBSTATECODE_GS = "GS",
    MAPPINGJOBSTATECODE_GU = "GU",
    MAPPINGJOBSTATECODE_GX = "GX",
    MAPPINGJOBSTATECODE_GZ = "GZ",
    MAPPINGJOBSTATECODE_HA = "HA",
    MAPPINGJOBSTATECODE_HB = "HB",
    MAPPINGJOBSTATECODE_HE = "HE",
    MAPPINGJOBSTATECODE_HG = "HG",
    MAPPINGJOBSTATECODE_HI = "HI",
    MAPPINGJOBSTATECODE_HL = "HL",
    MAPPINGJOBSTATECODE_HN = "HN",
    MAPPINGJOBSTATECODE_HO = "HO",
    MAPPINGJOBSTATECODE_HS = "HS",
    MAPPINGJOBSTATECODE_IA = "IA",
    MAPPINGJOBSTATECODE_ID = "ID",
    MAPPINGJOBSTATECODE_IG = "IG",
    MAPPINGJOBSTATECODE_IK = "IK",
    MAPPINGJOBSTATECODE_IL = "IL",
    MAPPINGJOBSTATECODE_IN = "IN",
    MAPPINGJOBSTATECODE_IT = "IT",
    MAPPINGJOBSTATECODE_JL = "JL",
    MAPPINGJOBSTATECODE_JS = "JS",
    MAPPINGJOBSTATECODE_JX = "JX",
    MAPPINGJOBSTATECODE_KA = "KA",
    MAPPINGJOBSTATECODE_KC = "KC",
    MAPPINGJOBSTATECODE_KN = "KN",
    MAPPINGJOBSTATECODE_KO = "KO",
    MAPPINGJOBSTATECODE_KS = "KS",
    MAPPINGJOBSTATECODE_KT = "KT",
    MAPPINGJOBSTATECODE_KU = "KU",
    MAPPINGJOBSTATECODE_KY = "KY",
    MAPPINGJOBSTATECODE_LA = "LA",
    MAPPINGJOBSTATECODE_LN = "LN",
    MAPPINGJOBSTATECODE_MA = "MA",
    MAPPINGJOBSTATECODE_MB = "MB",
    MAPPINGJOBSTATECODE_MD = "MD",
    MAPPINGJOBSTATECODE_ME = "ME",
    MAPPINGJOBSTATECODE_MG = "MG",
    MAPPINGJOBSTATECODE_MI = "MI",
    MAPPINGJOBSTATECODE_MN = "MN",
    MAPPINGJOBSTATECODE_MO = "MO",
    MAPPINGJOBSTATECODE_MS = "MS",
    MAPPINGJOBSTATECODE_MT = "MT",
    MAPPINGJOBSTATECODE_MZ = "MZ",
    MAPPINGJOBSTATECODE_NB = "NB",
    MAPPINGJOBSTATECODE_NC = "NC",
    MAPPINGJOBSTATECODE_ND = "ND",
    MAPPINGJOBSTATECODE_NE = "NE",
    MAPPINGJOBSTATECODE_NG = "NG",
    MAPPINGJOBSTATECODE_NH = "NH",
    MAPPINGJOBSTATECODE_NJ = "NJ",
    MAPPINGJOBSTATECODE_NL = "NL",
    MAPPINGJOBSTATECODE_NM = "NM",
    MAPPINGJOBSTATECODE_NN = "NN",
    MAPPINGJOBSTATECODE_NR = "NR",
    MAPPINGJOBSTATECODE_NS = "NS",
    MAPPINGJOBSTATECODE_NT = "NT",
    MAPPINGJOBSTATECODE_NU = "NU",
    MAPPINGJOBSTATECODE_NV = "NV",
    MAPPINGJOBSTATECODE_NW = "NW",
    MAPPINGJOBSTATECODE_NX = "NX",
    MAPPINGJOBSTATECODE_NY = "NY",
    MAPPINGJOBSTATECODE_OH = "OH",
    MAPPINGJOBSTATECODE_OK = "OK",
    MAPPINGJOBSTATECODE_ON = "ON",
    MAPPINGJOBSTATECODE_OR = "OR",
    MAPPINGJOBSTATECODE_OS = "OS",
    MAPPINGJOBSTATECODE_OT = "OT",
    MAPPINGJOBSTATECODE_OY = "OY",
    MAPPINGJOBSTATECODE_PA = "PA",
    MAPPINGJOBSTATECODE_PE = "PE",
    MAPPINGJOBSTATECODE_PR = "PR",
    MAPPINGJOBSTATECODE_QC = "QC",
    MAPPINGJOBSTATECODE_QH = "QH",
    MAPPINGJOBSTATECODE_QL = "QL",
    MAPPINGJOBSTATECODE_RI = "RI",
    MAPPINGJOBSTATECODE_SA = "SA",
    MAPPINGJOBSTATECODE_SC = "SC",
    MAPPINGJOBSTATECODE_SD = "SD",
    MAPPINGJOBSTATECODE_SH = "SH",
    MAPPINGJOBSTATECODE_SI = "SI",
    MAPPINGJOBSTATECODE_SK = "SK",
    MAPPINGJOBSTATECODE_SN = "SN",
    MAPPINGJOBSTATECODE_ST = "ST",
    MAPPINGJOBSTATECODE_SX = "SX",
    MAPPINGJOBSTATECODE_SZ = "SZ",
    MAPPINGJOBSTATECODE_TA = "TA",
    MAPPINGJOBSTATECODE_TG = "TG",
    MAPPINGJOBSTATECODE_TJ = "TJ",
    MAPPINGJOBSTATECODE_TK = "TK",
    MAPPINGJOBSTATECODE_TN = "TN",
    MAPPINGJOBSTATECODE_TS = "TS",
    MAPPINGJOBSTATECODE_TT = "TT",
    MAPPINGJOBSTATECODE_TX = "TX",
    MAPPINGJOBSTATECODE_TY = "TY",
    MAPPINGJOBSTATECODE_UT = "UT",
    MAPPINGJOBSTATECODE_VA = "VA",
    MAPPINGJOBSTATECODE_VI = "VI",
    MAPPINGJOBSTATECODE_VT = "VT",
    MAPPINGJOBSTATECODE_WA = "WA",
    MAPPINGJOBSTATECODE_WI = "WI",
    MAPPINGJOBSTATECODE_WK = "WK",
    MAPPINGJOBSTATECODE_WV = "WV",
    MAPPINGJOBSTATECODE_WY = "WY",
    MAPPINGJOBSTATECODE_XJ = "XJ",
    MAPPINGJOBSTATECODE_XZ = "XZ",
    MAPPINGJOBSTATECODE_YA = "YA",
    MAPPINGJOBSTATECODE_YN = "YN",
    MAPPINGJOBSTATECODE_YT = "YT",
    MAPPINGJOBSTATECODE_YU = "YU",
    MAPPINGJOBSTATECODE_ZJ = "ZJ"
}
