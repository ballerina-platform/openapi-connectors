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

public type DataStreamPageResult record {
    DatastreampageresultItems[] Items?;
    int Count?;
};

public type DatapointverbositylistInner record {
    string name;
    string definition;
    boolean isDefault;
    boolean isAvailableInApi;
};

public type DatastreampageresultItems record {
    string title;
    int id;
    int resourceId;
    string validFrom;
    DatastreampageresultLocation location;
    string unitName;
    string unitAbbreviation;
};

public type DataPoint record {
    string id?;
    string timeValue?;
    DatapointValue[] value?;
};

public type DataPointPage record {
    DatapointpageItems[] Items?;
    string NextPageLink?;
    int Count?;
};

public type DatapointpageItems record {
    string id;
    string timeValue;
    DatapointValue[] value;
};

public type DataPointVerbosityList DatapointverbositylistInner[];

public type DatapointValue record {
    int resourceId;
    record {} value;
};

public type DataPointVerbosity record {
    string name?;
    string definition?;
    boolean isDefault?;
    boolean isAvailableInApi?;
};

public type DatastreampageresultLocation record {
    decimal[] coordinates?;
    decimal[] bbox?;
    string 'type?;
};
