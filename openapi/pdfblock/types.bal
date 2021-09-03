// Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

public type Body8 record {
    # The input PDF document
    string file;
    # The password required to open the file.
    string password;
};

public type Body9 record {
    # The input PDF document
    string file;
};

public type Body6 record {
    # The input PDF document
    string file;
    # The angle of rotation of the pages. Positive angles rotate the pages clockwise. Negative angles rotate the pages counter-clockwise.
    int angle;
    # The first page of the range to rotate in the PDF document. If empty, it defaults to the first page of the document.
    int first_page?;
    # The last page of the range to rotate in the PDF document. If empty, it defaults to the last page of the document.
    int last_page?;
};

public type Body7 record {
    # The input PDF document
    string file;
    # The password required to open and change permissions of the PDF document.
    string owner_password;
    # The password required to open the PDF document. If the `user_password` is not set, the user will be able to open the document without a password.
    string user_password?;
    # The algorithm used to encrypt the PDF document.
    string encryption_algorithm?;
    # If false, the user can't copy text and images to the clipboard.
    boolean allow_copy_content?;
    # If false, the user can't change the content of the document.
    boolean allow_change_content?;
    # If false, the user can't print the document.
    boolean allow_print?;
    # If false, the user can't print the document in high resolution.
    boolean allow_print_high_resolution?;
    # If false, the user can't add, edit or modify annotations or fill form fields.
    boolean allow_comment_and_fill_form?;
    # If false, the user can't fill forms fields.
    boolean allow_fill_form?;
    # If false, the user can't assemble or manipulate the document.
    boolean allow_assemble_document?;
    # If false, accessibility programs can't read the text or images of the document.
    boolean allow_accessibility?;
};

public type Body4 record {
    # The input PDF document
    string file;
    # The first page of the range to extract. If empty, it defaults to the first page of the PDF document.
    int first_page?;
    # The last page of the range to extract. If empty, it defaults to the last page of the PDF document.
    int last_page?;
};

public type Body5 record {
    # The input PDF document
    string file;
    # The first page of the range to remove from the PDF document. If empty, it defaults to the first page of the document.
    int first_page?;
    # The last page of the range to remove from the PDF document. If empty, it defaults to the last page of the document.
    int last_page?;
};

public type Body2 record {
    # The input PDF document
    string file;
    # The image to add as a watermark. The format of the image can be either PNG or JPEG.
    string image;
    # The transparency level for the image watermark from 0 (opaque) to 100 (transparent).
    int transparency?;
    # The distance in inches from the border of the page to the image watermark.
    float margin?;
};

public type Body3 record {
    # The array of PDF documents. PDF documents will be merged in the same order they are inserted into this array.
    string[] file?;
};

public type Body11 record {
    # The input PDF document
    string file;
};

public type Body10 record {
    # The input PDF document
    string file;
};

public type InlineResponse4xx record {
    string 'type?;
    string title?;
    int status?;
    record {} errors?;
};

public type Body1 record {
    # The input PDF document
    string file;
    # The first line of text of the watermark.
    string line_1;
    # The second line of text of the watermark.
    string line_2?;
    # The third line of text of the watermark.
    string line_3?;
    # The [id of the text watermark template](https://www.pdfblocks.com/docs/api/v1/text-watermark-templates.pdf).
    int template?;
    # The color of the text watermark.
    string color?;
    # The transparency level for the text watermark from 0 (opaque) to 100 (transparent).
    int transparency?;
    # The distance in inches from the border of the page to the text watermark.
    float margin?;
};

public type Body record {
    # The input PDF document
    string file;
    # The password required to open the file.
    string password;
    # The algorithm used to encrypt the PDF document.
    string encryption_algorithm?;
};
