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

public type Body11 record {
    # Source file (10MB limit)
    string file;
};

public type Body10 record {
    # Crop start position (use negative values to reverse crop area)
    string position;
    # Width (X-axis right, negative to reverse)
    decimal Width;
    # Height (Y-axis down, negative to reverse)
    decimal Height;
    # Source image file
    string file;
};

public type OutputString record {
    # Result
    string result?;
};

public type InputQRCode record {
    # Text value(s) (vertical bar delimited by type)
    string input;
    # Payload type
    string payload;
};

public type Body8 record {
    # Horizontal or Vertical
    string orientation;
    # Source image file
    string file;
};

public type Body9 record {
    # Watermark text
    string text;
    # Text font
    string font;
    # Font size (points)
    decimal size;
    # Text color hex value
    string color;
    # Horizontal alignment
    string horizontal;
    # Vertical alignment
    string vertical;
    # Source image file
    string file;
};

public type Body6 record {
    # Optimize output quality of the target image
    string algorithm;
    # Image adjustment units
    string units;
    # Image height (pixels or percent)
    decimal height?;
    # Image width (pixels or percent)
    decimal width?;
    # Source image file
    string file;
};

public type Body7 record {
    # Number of degrees
    string degrees;
    # Source image file
    string file;
};

public type Body5 record {
    # Output file format
    string format;
    # Source image file
    string file;
};
