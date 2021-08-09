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

public type InputCollectionConversionXML record {
    # Collection containing strings to convert
    string[] input;
    # Name of root XML node
    string root;
    # Name of child XML node(s)
    string child;
};

public type InputCollectionConversion record {
    # Collection containing strings to convert
    string[] input;
    # Collection name
    string name;
};

public type OutputCollectionString record {
    # Success
    boolean status?;
    # First Value
    string item?;
    # All Values
    string[] items?;
};

public type OutputString record {
    # Result
    string result?;
};

public type InputCollectionSplit record {
    # Collection of items to split
    string[] input;
    # String to match (explicit, case-insensitive, leave empty to use Index)
    string 'match?;
    # Index location to split (leave empty to use Match value)
    string index?;
};

public type InputCollectionCount record {
    # Collection of items to count
    string[] input;
};

public type InputCollectionReplace record {
    # Collection of strings
    string[] input;
    # Match value
    string 'match;
    # Replacement value
    string replacement;
    # Ignore case
    string ignoreCase;
};

public type OutputMultiCollection record {
    # First collection result
    string[] result1?;
    # Second collection result
    string[] result2?;
};

public type OutputNumber record {
    # Result
    decimal result?;
};

public type OutputCollectionNumber record {
    # Success
    boolean status?;
    # First Value
    decimal item?;
    # All Values
    decimal[] items?;
};

public type InputCollectionSort record {
    # Collection of strings to sort
    string[] input;
    # Sort order
    string 'order;
};

public type InputCollectionFilter record {
    # Collection of strings to filter
    string[] input;
    # Match type
    string 'match;
    # Keywords (separate multiple values with commas)
    string keywords;
};

public type OutputCollectionResult record {
    # Modified collection result
    string[] result?;
};

public type InputCollectionModify record {
    # Collection of values or objects to modify
    string[] input;
    # Item (for multiple items, leave blank and use Items)
    string item?;
    # Items (Collection, for a single item leave blank and use Item)
    string[] items?;
    # Index position for operation (leave blank to specify end of collection)
    string index?;
};

public type InputCollectionSearchNumeric record {
    # Collection of strings to search
    decimal[] input;
    # Number to match
    decimal 'match;
    # Type of number - integer or decimal
    string 'type?;
};

public type InputCollectionSearch record {
    # Collection of strings to search
    string[] input;
    # Text to match
    string 'match;
    # Trim white space from comparison string
    string trim?;
    # Ignore case when performing comparison
    string ignorecase?;
};
