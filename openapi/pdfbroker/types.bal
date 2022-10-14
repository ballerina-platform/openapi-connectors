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

import ballerina/constraint;

public type PdfToImageRequestDto record {
    # The pdf file to generate image from, as Base64 encoded string.
    string? PdfFileBase64String?;
    PdfToImageOptions Options?;
};

# WkHtmlToPdfRequestDto is the data transfer object for generating a pdf using wkhtmltopdf;
public type WkHtmlToPdfRequestDto record {
    # The url to generate pdf from. Url has precedence over HtmlBase64String value if both are set.
    string? Url?;
    # Base64 encoded string with html. If property Url is set, it will be used, not HtmlBase64String.
    string? HtmlBase64String?;
    # Command line arguments passed to wkhtmltopdf.
    record {} WkHtmlToPdfArguments?;
    # This is a set of key-value pairs of digital resources like images that is referenced in the HtmlBase64String document. It uses the filename including relative path as key and the data is provided as a Base64 encoded string.
    record {} Resources?;
};

# Set color
public type ColorDto record {
    # Get or sets R value of RGB color
    @constraint:Int {maxValue: 255}
    int R?;
    # Get or sets G value of RGB color
    @constraint:Int {maxValue: 255}
    int G?;
    # Get or sets B value of RGB color
    @constraint:Int {maxValue: 255}
    int B?;
};

# Font style enum representing Regular, Bold, Italic, BoldItalic
public type FontStyle int;

# YOriginPoint
public type YOriginPoint int;

# The request dto object to write a string on pdf page
public type PdfWriteStringRequestDto record {
    # The pdf file to add text to, as Base64 encoded string.
    string? PdfFileBase64String?;
    # Options for writing string in pdf page;
    PdfWriteStringOptions Options?;
    # System fonts are available, but you can provide your own font file to be embedded in the pdf document. Send font as Base64 encoded string.
    string? FontFileBase64String?;
};

# When setting the Accept-header in the request to "application/json" the content of the pdf file will be return as Base64 encoded string. Note that converting data to Base64 encoded strings increases the response size with approximately 33%, if you can accept the a binary format it's better to use Accept-header "application/pdf".
public type PdfResponseDto record {
    # If any error occurs the message will be displayed in here
    string? ErrorMessage?;
    # The Base64 encoded string that is the pdf file.
    string? PdfFileBase64String?;
};

public type PdfXslfowithtransformBody record {
    # An entry named fodocument with your XSL-FO transform is required in the multipart/form-data request
    string fodocument?;
    # An entry named xmldatadocument, on which the XSL-FO transform is applied, is required in the multipart/form-data request
    string xmldatadocument?;
    # After fodocument and xmldatadocument is added, add all digital resources one by one to your multipart/form-data request, using the filename as name in the form.
    string resources?;
};

# When setting the Accept-header in the request to "application/json" the image file will be return as Base64 encoded string. Note that converting data to Base64 encoded strings increases the response size with approximately 33%, if you can accept the a binary format it's better to use Accept-header "image/jpeg", "image/png" or "image/gif".
public type ImageResponseDto record {
    # If any error occurs the message will be displayed in here
    string? ErrorMessage?;
    # The Base64 encoded string that is the image file. This is a complete data uri, including media type that can be used directly as src on a img-tag e.g.
    string? ImageBase64String?;
};

public type ErrorResponseDto record {
    # If any error occurs the message will be displayed in here
    string? ErrorMessage?;
    string? Description?;
    int StatusCode?;
};

# Request to concatenate a list of Pdf documents to a single Pdf document.
public type PdfConcatenationRequestDto record {
    # The list of Pdf documents encoded as Base64 strings.
    string[]? PdfDocumentsAsBase64String?;
};

# Options for writing string in pdf page;
public type PdfWriteStringOptions record {
    # The text to write in the pdf
    string? Text?;
    # Set color
    ColorDto TextColor?;
    # The Font dto object
    FontDto Font?;
    # Get or set which page in the pdf to write on, default is first page.
    int PageNumber?;
    # Get or set the X axis position on where to write string, in reference to XOrigin.
    float XPosition?;
    # Get or set the Y axis position on where to write string, in reference to YOrigin.
    float YPosition?;
    # XOriginPoint
    XOriginPoint XOrigin?;
    # YOriginPoint
    YOriginPoint YOrigin?;
};

# The Font dto object
public type FontDto record {
    # Gets the name of the font
    string? Name?;
    # Gets the size of the font
    float Size?;
    # Font style enum representing Regular, Bold, Italic, BoldItalic
    FontStyle Style?;
};

public type PdfPdfconcatBody record {
    # Add pdf files to be concatenated into single file
    string pdfdocument1?;
    # You can add more than two files in the same request
    string pdfdocument2?;
};

# XOriginPoint
public type XOriginPoint int;

public type PdfPdfwritestringBody record {
    # An entry named pdfdocument is required in the multipart/form-data request
    string pdfdocument?;
    # After pdfdocument is added, add an entry named options with your PdfWriteStringOptions object serialized as JSON.
    string options?;
    # Optional entry to attach your own TrueType font file to style string
    string fontfile?;
};

# The XSL-FO transform document and xml data document as a Base64 encoded string with a set of resources provided with a name and the data of the resource as a Base64 encoded string.
public type FoTransformRequestDto record {
    # This is the complete XSL-FO document provided using Base64 encoding.
    string? FoDocumentBase64String?;
    # This is a set of key-value pairs of digital resources like images that is referenced in the XSL-FO document. It uses the filename as key and the data is provided as a Base64 encoded string.
    record {} Resources?;
    # Enter meta data for pdf document
    PdfMetadataDto Metadata?;
    # This is xml data document on which the XSL-FO transform document is applied. Provided using Base64 encoding.
    string? XmlDataDocumentBase64String?;
};

public type PdfPdftoimageBody record {
    # An entry named pdfdocument is required in the multipart/form-data request
    string pdfdocument?;
    # After pdfdocument is added, add an entry named options with your PdfToImageOptions object serialized as JSON.
    string options?;
};

# Enter meta data for pdf document
public type PdfMetadataDto record {
    # Pdf document title
    string? Title?;
    # Pdf document author
    string? Author?;
    # Pdf document subject
    string? Subject?;
    # Pdf document keywords
    string[]? Keywords?;
    # Enables or disables adding or modifying text annotations and interactive
    # form fields.
    boolean EnableAdd?;
    # Enables or disables copying of text and graphics.
    boolean EnableCopy?;
    # Enables or disables modifying document contents (other than text annotations and 
    # interactive form fields).
    boolean EnableModify?;
    # Enables or disables printing.
    boolean EnablePrinting?;
    # Specifies the owner password that will protect full access to any generated PDF documents.
    string? OwnerPassword?;
    # Specifies the user password that will protect access to any generated PDF documents.
    string? UserPassword?;
};

public type PdfToImageOptions record {
    # Which page of the pdf file to generate image from, default is first page
    int PageNumber?;
    # Valid options are "image/jpeg", "image/png" or "image/gif". Default is "image/png"
    string? ImageFormat?;
    # Set the horizontal resolution, default is 96 dpi;
    decimal HorizontalResolution?;
    # Set the vertical resolution, default is 96 dpi;
    decimal VerticalResolution?;
    # Set the width of the output image, default value is width of source document. To scale width, and keeping proportions, do not set height;
    int Width?;
    # Set the height of the output image, default value is width of source document. To scale height, and keeping proportions, do not set width;
    int Height?;
    # Keep the background of the image transparent. This setting is not available in JPEG-files, since transparency is not supported in the JPEG format.
    boolean Transparent?;
    # Sets the quality of jpeg images, range 0 to 100, default is 75
    int JpegQuality?;
    # Sets the png compression level, range 1 - 9, default is 6
    int PngCompressionLevel?;
};

# The basic request with the XSL-FO document as a Base64 encoded string with a set of resources provided with a name and the data of the resource as a Base64 encoded string.
public type FoRequestDto record {
    # This is the complete XSL-FO document provided using Base64 encoding.
    string? FoDocumentBase64String?;
    # This is a set of key-value pairs of digital resources like images that is referenced in the XSL-FO document. It uses the filename as key and the data is provided as a Base64 encoded string.
    record {} Resources?;
    # Enter meta data for pdf document
    PdfMetadataDto Metadata?;
};

public type PdfXslfoBody record {
    # An entry named fodocument is required in the multipart/form-data request
    string fodocument?;
    # After fodocument is added, add all digital resources one by one to your multipart/form-data request, using the filename as name in the form.
    string resources?;
    # Add pdf document metadata like title, author, subject and keywords
    string? metadata?;
};
