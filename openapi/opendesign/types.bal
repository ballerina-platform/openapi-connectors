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

# The endpoint requires an auth token provided via the `Authorization` HTTP header.
public type NoAuthTokenError record {
    # Error code
    string code;
    # Error message
    string message;
    # The URL of a documentation web page with more info about the error.
    ErrorDocsUrl docs_url?;
};

# The multipart request does not contain file data.
public type MissingUploadFileError record {
    # Error code
    string code;
    # Error message
    string message;
    # The URL of a documentation web page with more info about the error.
    ErrorDocsUrl docs_url?;
};

# The multipart request contain the file data under the wrong field name.
public type InvalidUploadFileFieldError record {
    # Error code
    string code;
    # Error message
    string message;
    # The URL of a documentation web page with more info about the error.
    ErrorDocsUrl docs_url?;
};

public type Page record {
    # An identifier of an page within a design file.
    PageId id;
    string name;
    # The processing status of a page within a design file.
    PageStatusEnum status;
};

public type InlineResponse500 record {
    ServerError _error;
};

# A design file descriptor
public type Design record {
    # A unique identifier (UUID) of an imported design file.
    string id;
    # The name of the design.
    string? name;
    # The design file format.
    DesignFormatEnum format;
    # UTC timestamp (in milliseconds) when the design file was imported.
    int created_at;
    # UTC timestamp (in milliseconds) when the processing of the design file successfully finished.
    int? completed_at;
    # The processing status of the design file.
    DesignStatusEnum status;
    # Flag denoting there are pages in the design file and the client can obtain the page list via a GET `…/pages` request.
    boolean has_pages;
};

# The processing status of the design file export task.
public type DesignExportStatusEnum string;

# The processing status of the design file.
public type DesignStatusEnum string;

# The design file format.
public type DesignFormatEnum string;

# The processing status of a page within a design file.
public type PageStatusEnum string;

# A multipart file upload field.
public type MultipartFilePart string;

# A required HTTP header is either not provided of invalid.
public type InvalidHeaderError record {
    # Error code
    string code;
    # Error message
    string message;
    # The URL of a documentation web page with more info about the error.
    ErrorDocsUrl docs_url?;
};

# The specified artboard is not present in the design file.
public type ArtboardNotFoundError record {
    # Error code
    string code;
    # Error message
    string message;
    # The URL of a documentation web page with more info about the error.
    ErrorDocsUrl docs_url?;
};

# An identifier of an page within a design file.
public type PageId string;

public type ServerError record {
    # Error code
    string code;
    # A human-readable technical message of the error.
    string message?;
    # The URL of a documentation web page with more info about the error.
    ErrorDocsUrl docs_url?;
};

public type InlineResponse429 record {
    # The rate limit for the operation has been reached.
    RateLimitReachedError _error;
};

public type DesignsUploadBody record {
    # A multipart file upload field.
    MultipartFilePart file;
    # The design file format. (This is not needed when the format can be inferred from the file extension.)
    DesignImportFormatEnum format?;
};

public type InlineResponse4041 record {
    DesignNotFoundError|DesignExportNotFoundError _error;
};

# The URL of a documentation web page with more info about the error.
public type ErrorDocsUrl string;

public type InlineResponse4042 record {
    DesignNotFoundError|ArtboardNotFoundError _error;
};

public type InlineResponse4001 record {
    InvalidHeaderError|InvalidFormatError|MissingUploadFileError|InvalidUploadFileFieldError|InvalidInputError _error;
};

# An identifier of a "frame" component within a Figma file.
public type FigmaFrameId string;

public type InlineResponse4003 record {
    InvalidFormatError|MultipleDesignExportsError|InvalidInputError _error;
};

# The provided file URL is not valid.
public type InvalidUploadLinkError record {
    # Error code
    string code;
    # Error message
    string message;
    # The URL of a documentation web page with more info about the error.
    ErrorDocsUrl docs_url?;
};

public type InlineResponse4002 record {
    InvalidUploadLinkError|InvalidFormatError|InvalidInputError _error;
};

# The auth token provided via the `Authorization` HTTP header is not valid.
public type InvalidAuthTokenError record {
    # Error code
    string code;
    # Error message
    string message;
    # The URL of a documentation web page with more info about the error.
    ErrorDocsUrl docs_url?;
};

public type InlineResponse4004 record {
    InvalidFormatError|DesignNotProcessedError|InvalidInputError _error;
};

public type DesignExport record {
    # An identifier of a export task of an imported design file.
    string id;
    # UTC timestamp (in milliseconds) when the design export started.
    int created_at;
    # UTC timestamp (in milliseconds) when the design export successfully finished.
    int? completed_at;
    # The processing status of the design file export task.
    DesignExportStatusEnum status;
    # The target design file format of a export. (Only Sketch is supported currently.)
    DesignExportTargetFormatEnum result_format;
    # The URL of the produced design file in the `result_format` format when the export is successfully finished.
    string? result_url;
};

public type Artboard record {
    # An identifier of an artboard within a design file.
    ArtboardId id;
    # The design file page containing the artboard in case of paged (`has_pages=true`) designs.
    string page_id?;
    # The name of the design file artboard.
    string name;
    # The processing status of an artboard within a design file.
    ArtboardStatusEnum status;
    # Flag denoting there is content in the design file artboard and the client can obtain it via a GET `…/content` request.
    boolean has_content;
};

# An identifier of an artboard within a design file.
public type ArtboardId string;

# The specified design file is not found.
public type DesignNotFoundError record {
    # Error code
    string code;
    # Error message
    string message;
    # The URL of a documentation web page with more info about the error.
    ErrorDocsUrl docs_url?;
};

# A unique identifier (UUID) of an imported design file.
public type DesignId string;

# The auth token provided via the `Authorization` HTTP header is associated with an account which is either expired or blocked.
public type InactiveAccountError record {
    # Error code
    string code;
    # Error message
    string message;
    # The URL of a documentation web page with more info about the error.
    ErrorDocsUrl docs_url?;
};

# A design file descriptor
public type InlineResponse201 record {
    # A design file descriptor
    Design design;
};

public type InlineResponse200 record {
    # UTC timestamp (in milliseconds) when the provided token expires.
    int? expires_at;
};

# A descriptor of a figma design file
public type FigmaDesign record {
    # Design format
    string format;
    # A unique identifier (UUID) of an imported design file.
    string id;
    # The name of the design.
    string? name;
    # UTC timestamp (in milliseconds) when the design file was imported.
    int created_at;
    # UTC timestamp (in milliseconds) when the processing of the design file successfully finished.
    int? completed_at;
    # The processing status of the design file.
    DesignStatusEnum status;
    # Flag denoting there are pages in the design file and the client can obtain the page list via a GET `…/pages` request.
    boolean has_pages;
};

# The specified design file export task is not found.
public type DesignExportNotFoundError record {
    # Error code
    string code;
    # Error message
    string message;
    # The URL of a documentation web page with more info about the error.
    ErrorDocsUrl docs_url?;
};

public type InlineResponse401 record {
    AuthTokenError _error;
};

public type InlineResponse400 record {
    # Some of the input parameters are invalid or missing.
    InvalidInputError _error;
};

# The design file format. (This is not needed when the format can be inferred from the file extension.)
public type DesignImportFormatEnum string;

public type InlineResponse404 record {
    # The specified design file is not found.
    DesignNotFoundError _error;
};

# The target design file format of a export. (Only Sketch is supported currently.)
public type DesignExportTargetFormatEnum string;

# The provided file format is not valid or supported.
public type MultipleDesignExportsError record {
    # Error code
    string code;
    # Error message
    string message;
    # The URL of a documentation web page with more info about the error.
    ErrorDocsUrl docs_url?;
};

# Some of the input parameters are invalid or missing.
public type InvalidInputError record {
    # Error code
    string code;
    # Error message
    string message;
    # The URL of a documentation web page with more info about the error.
    ErrorDocsUrl docs_url?;
};

# The specified design file is not paged (`has_pages=false`).
public type DesignNotPagedError record {
    # Error code
    string code;
    # Error message
    string message;
    # The URL of a documentation web page with more info about the error.
    ErrorDocsUrl docs_url?;
};

public type InlineResponse2011 record {
    FigmaDesign|DesignProcessing design;
    # Inititated design file exports for the import.
    DesignExport[] exports;
};

public type DesignSummary record {
    # The list of pages within the paged (`has_pages=true`) design file.
    Page[] pages?;
    # The list of artboards within the design file.
    Artboard[] artboards;
    # A unique identifier (UUID) of an imported design file.
    string id;
    # The name of the design.
    string? name;
    # The design file format.
    DesignFormatEnum format;
    # UTC timestamp (in milliseconds) when the design file was imported.
    int created_at;
    # UTC timestamp (in milliseconds) when the processing of the design file successfully finished.
    int? completed_at;
    # The processing status of the design file.
    DesignStatusEnum status;
    # Flag denoting there are pages in the design file and the client can obtain the page list via a GET `…/pages` request.
    boolean has_pages;
};

public type DesignsLinkBody record {
    # A publicly accessible URL of the design file to import.
    string url;
    # The design file format. (This is not needed when the format can be inferred from the file extension.)
    DesignImportFormatEnum format?;
    # Name of the design. (When no name is provided, the server infers the name from the URL.)
    string? design_name?;
};

# The provided file format is not valid or supported.
public type DesignNotProcessedError record {
    # Error code
    string code;
    # Error message
    string message;
    # The URL of a documentation web page with more info about the error.
    ErrorDocsUrl docs_url?;
};

# The rate limit for the operation has been reached.
public type RateLimitReachedError record {
    # Error code
    string code;
    # Error message
    string message;
    # The URL of a documentation web page with more info about the error.
    ErrorDocsUrl docs_url?;
};

# The processing status of an artboard within a design file.
public type ArtboardStatusEnum string;

# The provided file format is not valid or supported.
public type InvalidFormatError record {
    # Error code
    string code;
    # Error message
    string message;
    # The URL of a documentation web page with more info about the error.
    ErrorDocsUrl docs_url?;
};

public type DesignsFigmalinkBody record {
    # Name of the design.
    string? design_name?;
    # An access token from Figma.
    string figma_token;
    # ID of the file in Figma.
    string figma_filekey;
    # Frame IDs to sync. When not specified, all frames are included.
    FigmaFrameId[] figma_ids?;
    # Design file exports to intiate automatically with the import. (Only Sketch is supported currently as the target format.)
    DesignsfigmalinkExports[] exports?;
};

public type DesignIdExportsBody record {
    # The target design file format of a export. (Only Sketch is supported currently.)
    DesignExportTargetFormatEnum format;
};

public type InlineResponse406 record {
    # The specified design file is not paged (`has_pages=false`).
    DesignNotPagedError _error;
};

# The specified artboard does not have any content.
public type ArtboardContentNotFoundError record {
    # Error code
    string code;
    # Error message
    string message;
    # The URL of a documentation web page with more info about the error.
    ErrorDocsUrl docs_url?;
};

public type DesignsfigmalinkExports record {
    # The target design file format of a export. (Only Sketch is supported currently.)
    DesignExportTargetFormatEnum format;
};

# A descriptor of a design artboard which is being processed.
public type DesignArtboardProcessing record {
    # An identifier of an artboard within a design file.
    ArtboardId id;
    # A unique identifier (UUID) of an imported design file.
    DesignId design_id;
    # The processing status of an artboard within a design file.
    ArtboardStatusEnum status;
};

# A descriptor of a design file which is being processed.
public type DesignProcessing record {
    # A unique identifier (UUID) of an imported design file.
    string id;
    # The processing status of the design file.
    DesignStatusEnum status;
};

public type InlineResponse2001 record {
    # List of design entities
    Design[] designs;
};

# Descriptor for a design
public type InlineResponse2003 DesignSummary|DesignProcessing;

public type InlineResponse2002 Design|DesignProcessing;

public type InlineResponse2005 record {
    # The list of artboards within the design file.
    Artboard[] artboards;
};

public type InlineResponse2004 record {
    # The list of pages within the paged (`has_pages=true`) design file.
    Page[] pages;
};

public type AuthTokenError NoAuthTokenError|InvalidAuthTokenError|InactiveAccountError;
