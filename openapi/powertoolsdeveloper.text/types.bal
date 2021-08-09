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

public type InputReplaceString record {
    # String containing the text to be replaced
    string 'source;
    # Text to replace
    string value;
    # Replacement text
    string replacement;
};

public type OutputBoolean record {
    # Result
    boolean result?;
};

public type InputTranslateString record {
    # String containing the text to be translated
    string input;
    # Translation language
    string language;
};

public type OutputString record {
    # Result
    string result?;
};

public type InputSplitString record {
    # Text to split
    string input;
    # One or more characters that will be used to split the text
    string characters;
};

public type InputStringToFile record {
    # Text string (body of file)
    string input;
    # File extension
    string extension;
    # Name of file (without extension)
    string filename;
};

public type InputStringComparison record {
    # Original string
    string input;
    # Comparison string
    string compare;
    # Convert strings to lowercase before comparison
    string lower;
    # Trim strings before comparison
    string trim;
};

public type InputRedactString record {
    # String containing the complete text
    string 'source;
    # Individual string to redact
    string value?;
    # Collection of strings to redact
    string[] values?;
    # Regular expression pattern for matching strings
    string regex?;
};

public type InputTextToSpeech record {
    # Text to convert (10,000 characters max)
    string text;
    # Text or file type
    string 'type;
    # Voice locale (must match language of input text)
    string voice;
};

public type InputTrimString record {
    # String containing the text to be trimmed
    string 'source;
    # Type of white space to remove
    string 'type;
};

public type InputCaseConversion record {
    # String containing the text to convert
    string input;
    # Case of conversion result
    string alphacase;
};

public type InputGenerateUniqueID record {
    # All uppercase alpha characters
    string uppercase;
};

public type OutputStringArray record {
    # data
    string[] data?;
};

public type InputVerifyHash record {
    # Original source string
    string input;
    # Hash algorithm
    string algorithm;
    # Hashed result
    string hash;
};

public type Body record {
    # Encoded string variable or text value
    string 'source;
};

public type InputGenerateHash record {
    # Hash source string
    string input;
    # Hash algorithm
    string algorithm;
};

public type Body4 record {
    # String variable or text value
    string 'source;
};

public type InputStringContains record {
    # Text to match
    string find;
    # Text to search
    string input;
    # Convert strings to lowercase
    string lower;
};

public type Body2 record {
    # Language of audio input
    string language;
    # Source audio file (WAV, MP3, AAC, M4A)
    string file;
};

public type Body3 record {
    # Encoded string variable or text value
    string 'source;
};

public type InputJoinStrings record {
    # Collection of strings to be joined
    string[] input;
    # Separator character
    string separator;
    # Convert strings in collection to lowercase
    string lower;
    # Trim strings in collection
    string trim;
};

public type InputString record {
    # String variable or text value
    string 'source;
};

public type Body1 record {
    # String variable or text value
    string 'source;
};
