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

public type OutputString record {
    # Result
    string result?;
};

public type InputXmlConversionJSON record {
    # XML string
    string input;
};

public type InputDataQuery record {
    # XML or JSON string
    string input;
    # XPath or JSONPath query
    string query;
};

public type InputJsonConversionCSV record {
    # JSON array object
    string input;
    # Include header row
    boolean header;
    # Columns to omit (comma separated)
    string omit?;
    # Column order (comma separated)
    string 'order?;
};

public type InputJsonConversionXML record {
    # JSON array object
    string input;
    # Name of root node
    string root;
};

public type InputJsonConversionHTML record {
    # JSON array object
    string input;
    # Include header row
    boolean header;
    # Alternate header row markup
    string alternate?;
    # Optional table attributes (single quoted values)
    string attributes?;
    # Columns to omit (comma separated)
    string omit?;
    # Column order (comma separated)
    string 'order?;
};

public type InputCsvConversionJSON record {
    # CSV string
    string input;
    # Include header row
    boolean header;
};
