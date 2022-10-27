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

import ballerina/http;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://accounts.google.com/o/oauth2/token";
|};

# A color that can either be fully opaque or fully transparent.
public type OptionalColor record {
    # A solid color.
    Color color?;
};

# A ParagraphElement describes content within a Paragraph.
public type ParagraphElement record {
    # A ParagraphElement representing a spot in the text that is dynamically replaced with content that can change over time, like a page number.
    AutoText autoText?;
    # A ParagraphElement representing a column break. A column break makes the subsequent text start at the top of the next column.
    ColumnBreak columnBreak?;
    # The zero-base end index of this paragraph element, exclusive, in UTF-16 code units.
    int endIndex?;
    # A ParagraphElement representing an equation.
    Equation equation?;
    # A ParagraphElement representing a footnote reference. A footnote reference is the inline content rendered with a number and is used to identify the footnote.
    FootnoteReference footnoteReference?;
    # A ParagraphElement representing a horizontal line.
    HorizontalRule horizontalRule?;
    # A ParagraphElement that contains an InlineObject.
    InlineObjectElement inlineObjectElement?;
    # A ParagraphElement representing a page break. A page break makes the subsequent text start at the top of the next page.
    PageBreak pageBreak?;
    # A person or email address mentioned in a document. These mentions behave as a single, immutable element containing the person's name or email address.
    Person person?;
    # A link to a Google resource (e.g., a file in Drive, a YouTube video, a Calendar event, etc.).
    RichLink richLink?;
    # The zero-based start index of this paragraph element, in UTF-16 code units.
    int startIndex?;
    # A ParagraphElement that represents a run of text that all has the same styling.
    TextRun textRun?;
};

# The styling that applies to a section.
public type SectionStyle record {
    # The section's columns properties. If empty, the section contains one column with the default properties in the Docs editor. A section can be updated to have no more than three columns. When updating this property, setting a concrete value is required. Unsetting this property will result in a 400 bad request error.
    SectionColumnProperties[] columnProperties?;
    # The style of column separators. This style can be set even when there is one column in the section. When updating this property, setting a concrete value is required. Unsetting this property results in a 400 bad request error.
    string columnSeparatorStyle?;
    # The content direction of this section. If unset, the value defaults to LEFT_TO_RIGHT. When updating this property, setting a concrete value is required. Unsetting this property results in a 400 bad request error.
    string contentDirection?;
    # The ID of the default footer. If unset, the value inherits from the previous SectionBreak's SectionStyle. If the value is unset in the first SectionBreak, it inherits from DocumentStyle's default_footer_id. This property is read-only.
    string defaultFooterId?;
    # The ID of the default header. If unset, the value inherits from the previous SectionBreak's SectionStyle. If the value is unset in the first SectionBreak, it inherits from DocumentStyle's default_header_id. This property is read-only.
    string defaultHeaderId?;
    # The ID of the footer used only for even pages. If the value of DocumentStyle's use_even_page_header_footer is true, this value is used for the footers on even pages in the section. If it is false, the footers on even pages uses the default_footer_id. If unset, the value inherits from the previous SectionBreak's SectionStyle. If the value is unset in the first SectionBreak, it inherits from DocumentStyle's even_page_footer_id. This property is read-only.
    string evenPageFooterId?;
    # The ID of the header used only for even pages. If the value of DocumentStyle's use_even_page_header_footer is true, this value is used for the headers on even pages in the section. If it is false, the headers on even pages uses the default_header_id. If unset, the value inherits from the previous SectionBreak's SectionStyle. If the value is unset in the first SectionBreak, it inherits from DocumentStyle's even_page_header_id. This property is read-only.
    string evenPageHeaderId?;
    # The ID of the footer used only for the first page of the section. If use_first_page_header_footer is true, this value is used for the footer on the first page of the section. If it is false, the footer on the first page of the section uses the default_footer_id. If unset, the value inherits from the previous SectionBreak's SectionStyle. If the value is unset in the first SectionBreak, it inherits from DocumentStyle's first_page_footer_id. This property is read-only.
    string firstPageFooterId?;
    # The ID of the header used only for the first page of the section. If use_first_page_header_footer is true, this value is used for the header on the first page of the section. If it is false, the header on the first page of the section uses the default_header_id. If unset, the value inherits from the previous SectionBreak's SectionStyle. If the value is unset in the first SectionBreak, it inherits from DocumentStyle's first_page_header_id. This property is read-only.
    string firstPageHeaderId?;
    # A magnitude in a single direction in the specified units.
    Dimension marginBottom?;
    # A magnitude in a single direction in the specified units.
    Dimension marginFooter?;
    # A magnitude in a single direction in the specified units.
    Dimension marginHeader?;
    # A magnitude in a single direction in the specified units.
    Dimension marginLeft?;
    # A magnitude in a single direction in the specified units.
    Dimension marginRight?;
    # A magnitude in a single direction in the specified units.
    Dimension marginTop?;
    # The page number from which to start counting the number of pages for this section. If unset, page numbering continues from the previous section. If the value is unset in the first SectionBreak, refer to DocumentStyle's page_number_start. When updating this property, setting a concrete value is required. Unsetting this property results in a 400 bad request error.
    int pageNumberStart?;
    # Output only. The type of section.
    string sectionType?;
    # Indicates whether to use the first page header / footer IDs for the first page of the section. If unset, it inherits from DocumentStyle's use_first_page_header_footer for the first section. If the value is unset for subsequent sectors, it should be interpreted as false. When updating this property, setting a concrete value is required. Unsetting this property results in a 400 bad request error.
    boolean useFirstPageHeaderFooter?;
};

# Location of a single cell within a table.
public type TableCellLocation record {
    # The zero-based column index. For example, the second column in the table has a column index of 1.
    int columnIndex?;
    # The zero-based row index. For example, the second row in the table has a row index of 1.
    int rowIndex?;
    # A particular location in the document.
    Location tableStartLocation?;
};

# A width and height.
public type Size record {
    # A magnitude in a single direction in the specified units.
    Dimension height?;
    # A magnitude in a single direction in the specified units.
    Dimension width?;
};

# A ParagraphElement representing a spot in the text that is dynamically replaced with content that can change over time, like a page number.
public type AutoText record {
    # The suggested deletion IDs. If empty, then there are no suggested deletions of this content.
    string[] suggestedDeletionIds?;
    # The suggested insertion IDs. An AutoText may have multiple insertion IDs if it is a nested suggested change. If empty, then this is not a suggested insertion.
    string[] suggestedInsertionIds?;
    # The suggested text style changes to this AutoText, keyed by suggestion ID.
    record {} suggestedTextStyleChanges?;
    # Represents the styling that can be applied to text. Inherited text styles are represented as unset fields in this message. A text style's parent depends on where the text style is defined: * The TextStyle of text in a Paragraph inherits from the paragraph's corresponding named style type. * The TextStyle on a named style inherits from the normal text named style. * The TextStyle of the normal text named style inherits from the default text style in the Docs editor. * The TextStyle on a Paragraph element that is contained in a table may inherit its text style from the table style. If the text style does not inherit from a parent, unsetting fields will revert the style to a value matching the defaults in the Docs editor.
    TextStyle textStyle?;
    # The type of this auto text.
    string 'type?;
};

# A criteria that matches a specific string of text in the document.
public type SubstringMatchCriteria record {
    # Indicates whether the search should respect case: - `True`: the search is case sensitive. - `False`: the search is case insensitive.
    boolean matchCase?;
    # The text to search for in the document.
    string text?;
};

# A mask that indicates which of the fields on the base ImageProperties have been changed in this suggestion. For any field set to true, there is a new suggested value.
public type ImagePropertiesSuggestionState record {
    # Indicates if there was a suggested change to angle.
    boolean angleSuggested?;
    # Indicates if there was a suggested change to brightness.
    boolean brightnessSuggested?;
    # Indicates if there was a suggested change to content_uri.
    boolean contentUriSuggested?;
    # Indicates if there was a suggested change to contrast.
    boolean contrastSuggested?;
    # A mask that indicates which of the fields on the base CropProperties have been changed in this suggestion. For any field set to true, there is a new suggested value.
    CropPropertiesSuggestionState cropPropertiesSuggestionState?;
    # Indicates if there was a suggested change to source_uri.
    boolean sourceUriSuggested?;
    # Indicates if there was a suggested change to transparency.
    boolean transparencySuggested?;
};

# Styles that apply to a whole paragraph. Inherited paragraph styles are represented as unset fields in this message. A paragraph style's parent depends on where the paragraph style is defined: * The ParagraphStyle on a Paragraph inherits from the paragraph's corresponding named style type. * The ParagraphStyle on a named style inherits from the normal text named style. * The ParagraphStyle of the normal text named style inherits from the default paragraph style in the Docs editor. * The ParagraphStyle on a Paragraph element that is contained in a table may inherit its paragraph style from the table style. If the paragraph style does not inherit from a parent, unsetting fields will revert the style to a value matching the defaults in the Docs editor.
public type ParagraphStyle record {
    # The text alignment for this paragraph.
    string alignment?;
    # Whether to avoid widows and orphans for the paragraph. If unset, the value is inherited from the parent.
    boolean avoidWidowAndOrphan?;
    # A border around a paragraph.
    ParagraphBorder borderBetween?;
    # A border around a paragraph.
    ParagraphBorder borderBottom?;
    # A border around a paragraph.
    ParagraphBorder borderLeft?;
    # A border around a paragraph.
    ParagraphBorder borderRight?;
    # A border around a paragraph.
    ParagraphBorder borderTop?;
    # The text direction of this paragraph. If unset, the value defaults to LEFT_TO_RIGHT since paragraph direction is not inherited.
    string direction?;
    # The heading ID of the paragraph. If empty, then this paragraph is not a heading. This property is read-only.
    string headingId?;
    # A magnitude in a single direction in the specified units.
    Dimension indentEnd?;
    # A magnitude in a single direction in the specified units.
    Dimension indentFirstLine?;
    # A magnitude in a single direction in the specified units.
    Dimension indentStart?;
    # Whether all lines of the paragraph should be laid out on the same page or column if possible. If unset, the value is inherited from the parent.
    boolean keepLinesTogether?;
    # Whether at least a part of this paragraph should be laid out on the same page or column as the next paragraph if possible. If unset, the value is inherited from the parent.
    boolean keepWithNext?;
    # The amount of space between lines, as a percentage of normal, where normal is represented as 100.0. If unset, the value is inherited from the parent.
    float lineSpacing?;
    # The named style type of the paragraph. Since updating the named style type affects other properties within ParagraphStyle, the named style type is applied before the other properties are updated.
    string namedStyleType?;
    # The shading of a paragraph.
    Shading shading?;
    # A magnitude in a single direction in the specified units.
    Dimension spaceAbove?;
    # A magnitude in a single direction in the specified units.
    Dimension spaceBelow?;
    # The spacing mode for the paragraph.
    string spacingMode?;
    # A list of the tab stops for this paragraph. The list of tab stops is not inherited. This property is read-only.
    TabStop[] tabStops?;
};

# A StructuralElement representing a table of contents.
public type TableOfContents record {
    # The content of the table of contents.
    StructuralElement[] content?;
    # The suggested deletion IDs. If empty, then there are no suggested deletions of this content.
    string[] suggestedDeletionIds?;
    # The suggested insertion IDs. A TableOfContents may have multiple insertion IDs if it is a nested suggested change. If empty, then this is not a suggested insertion.
    string[] suggestedInsertionIds?;
};

# A Google Docs document.
public type Document record {
    # The document body. The body typically contains the full document contents except for headers, footers and footnotes.
    Body body?;
    # Output only. The ID of the document.
    string documentId?;
    # The style of the document.
    DocumentStyle documentStyle?;
    # Output only. The footers in the document, keyed by footer ID.
    record {} footers?;
    # Output only. The footnotes in the document, keyed by footnote ID.
    record {} footnotes?;
    # Output only. The headers in the document, keyed by header ID.
    record {} headers?;
    # Output only. The inline objects in the document, keyed by object ID.
    record {} inlineObjects?;
    # Output only. The lists in the document, keyed by list ID.
    record {} lists?;
    # Output only. The named ranges in the document, keyed by name.
    record {} namedRanges?;
    # The named styles. Paragraphs in the document can inherit their TextStyle and ParagraphStyle from these named styles.
    NamedStyles namedStyles?;
    # Output only. The positioned objects in the document, keyed by object ID.
    record {} positionedObjects?;
    # Output only. The revision ID of the document. Can be used in update requests to specify which revision of a document to apply updates to and how the request should behave if the document has been edited since that revision. Only populated if the user has edit access to the document. The format of the revision ID may change over time, so it should be treated opaquely. A returned revision ID is only guaranteed to be valid for 24 hours after it has been returned and cannot be shared across users. If the revision ID is unchanged between calls, then the document has not changed. Conversely, a changed ID (for the same document and user) usually means the document has been updated; however, a changed ID can also be due to internal factors such as ID format changes.
    string revisionId?;
    # Output only. The suggested changes to the style of the document, keyed by suggestion ID.
    record {} suggestedDocumentStyleChanges?;
    # Output only. The suggested changes to the named styles of the document, keyed by suggestion ID.
    record {} suggestedNamedStylesChanges?;
    # Output only. The suggestions view mode applied to the document. Note: When editing a document, changes must be based on a document with SUGGESTIONS_INLINE.
    string suggestionsViewMode?;
    # The title of the document.
    string title?;
};

# A suggested change to a Bullet.
public type SuggestedBullet record {
    # Describes the bullet of a paragraph.
    Bullet bullet?;
    # A mask that indicates which of the fields on the base Bullet have been changed in this suggestion. For any field set to true, there is a new suggested value.
    BulletSuggestionState bulletSuggestionState?;
};

# Update the styling of all paragraphs that overlap with the given range.
public type UpdateParagraphStyleRequest record {
    # The fields that should be updated. At least one field must be specified. The root `paragraph_style` is implied and should not be specified. For example, to update the paragraph style's alignment property, set `fields` to `"alignment"`. To reset a property to its default value, include its field name in the field mask but leave the field itself unset.
    string fields?;
    # Styles that apply to a whole paragraph. Inherited paragraph styles are represented as unset fields in this message. A paragraph style's parent depends on where the paragraph style is defined: * The ParagraphStyle on a Paragraph inherits from the paragraph's corresponding named style type. * The ParagraphStyle on a named style inherits from the normal text named style. * The ParagraphStyle of the normal text named style inherits from the default paragraph style in the Docs editor. * The ParagraphStyle on a Paragraph element that is contained in a table may inherit its paragraph style from the table style. If the paragraph style does not inherit from a parent, unsetting fields will revert the style to a value matching the defaults in the Docs editor.
    ParagraphStyle paragraphStyle?;
    # Specifies a contiguous range of text.
    Range range?;
};

# A ParagraphElement representing a page break. A page break makes the subsequent text start at the top of the next page.
public type PageBreak record {
    # The suggested deletion IDs. If empty, then there are no suggested deletions of this content.
    string[] suggestedDeletionIds?;
    # The suggested insertion IDs. A PageBreak may have multiple insertion IDs if it is a nested suggested change. If empty, then this is not a suggested insertion.
    string[] suggestedInsertionIds?;
    # The suggested text style changes to this PageBreak, keyed by suggestion ID.
    record {} suggestedTextStyleChanges?;
    # Represents the styling that can be applied to text. Inherited text styles are represented as unset fields in this message. A text style's parent depends on where the text style is defined: * The TextStyle of text in a Paragraph inherits from the paragraph's corresponding named style type. * The TextStyle on a named style inherits from the normal text named style. * The TextStyle of the normal text named style inherits from the default text style in the Docs editor. * The TextStyle on a Paragraph element that is contained in a table may inherit its text style from the table style. If the text style does not inherit from a parent, unsetting fields will revert the style to a value matching the defaults in the Docs editor.
    TextStyle textStyle?;
};

# A ParagraphElement representing a horizontal line.
public type HorizontalRule record {
    # The suggested deletion IDs. If empty, then there are no suggested deletions of this content.
    string[] suggestedDeletionIds?;
    # The suggested insertion IDs. A HorizontalRule may have multiple insertion IDs if it is a nested suggested change. If empty, then this is not a suggested insertion.
    string[] suggestedInsertionIds?;
    # The suggested text style changes to this HorizontalRule, keyed by suggestion ID.
    record {} suggestedTextStyleChanges?;
    # Represents the styling that can be applied to text. Inherited text styles are represented as unset fields in this message. A text style's parent depends on where the text style is defined: * The TextStyle of text in a Paragraph inherits from the paragraph's corresponding named style type. * The TextStyle on a named style inherits from the normal text named style. * The TextStyle of the normal text named style inherits from the default text style in the Docs editor. * The TextStyle on a Paragraph element that is contained in a table may inherit its text style from the table style. If the text style does not inherit from a parent, unsetting fields will revert the style to a value matching the defaults in the Docs editor.
    TextStyle textStyle?;
};

# A suggested change to a TableRowStyle.
public type SuggestedTableRowStyle record {
    # Styles that apply to a table row.
    TableRowStyle tableRowStyle?;
    # A mask that indicates which of the fields on the base TableRowStyle have been changed in this suggestion. For any field set to true, there is a new suggested value.
    TableRowStyleSuggestionState tableRowStyleSuggestionState?;
};

# Updates the style of a range of table cells.
public type UpdateTableCellStyleRequest record {
    # The fields that should be updated. At least one field must be specified. The root `tableCellStyle` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. For example to update the table cell background color, set `fields` to `"backgroundColor"`. To reset a property to its default value, include its field name in the field mask but leave the field itself unset.
    string fields?;
    # The style of a TableCell. Inherited table cell styles are represented as unset fields in this message. A table cell style can inherit from the table's style.
    TableCellStyle tableCellStyle?;
    # A table range represents a reference to a subset of a table. It's important to note that the cells specified by a table range do not necessarily form a rectangle. For example, let's say we have a 3 x 3 table where all the cells of the last row are merged together. The table looks like this: [ ] A table range with table cell location = (table_start_location, row = 0, column = 0), row span = 3 and column span = 2 specifies the following cells: x x [ x x x ]
    TableRange tableRange?;
    # A particular location in the document.
    Location tableStartLocation?;
};

# The crop properties of an image. The crop rectangle is represented using fractional offsets from the original content's four edges. - If the offset is in the interval (0, 1), the corresponding edge of crop rectangle is positioned inside of the image's original bounding rectangle. - If the offset is negative or greater than 1, the corresponding edge of crop rectangle is positioned outside of the image's original bounding rectangle. - If all offsets and rotation angle are 0, the image is not cropped.
public type CropProperties record {
    # The clockwise rotation angle of the crop rectangle around its center, in radians. Rotation is applied after the offsets.
    float angle?;
    # The offset specifies how far inwards the bottom edge of the crop rectangle is from the bottom edge of the original content as a fraction of the original content's height.
    float offsetBottom?;
    # The offset specifies how far inwards the left edge of the crop rectangle is from the left edge of the original content as a fraction of the original content's width.
    float offsetLeft?;
    # The offset specifies how far inwards the right edge of the crop rectangle is from the right edge of the original content as a fraction of the original content's width.
    float offsetRight?;
    # The offset specifies how far inwards the top edge of the crop rectangle is from the top edge of the original content as a fraction of the original content's height.
    float offsetTop?;
};

# A mask that indicates which of the fields on the base EmbeddedObject have been changed in this suggestion. For any field set to true, there is a new suggested value.
public type EmbeddedObjectSuggestionState record {
    # Indicates if there was a suggested change to description.
    boolean descriptionSuggested?;
    # A mask that indicates which of the fields on the base EmbeddedDrawingProperties have been changed in this suggestion. For any field set to true, there is a new suggested value.
    EmbeddedDrawingPropertiesSuggestionState embeddedDrawingPropertiesSuggestionState?;
    # A mask that indicates which of the fields on the base EmbeddedObjectBorder have been changed in this suggestion. For any field set to true, there is a new suggested value.
    EmbeddedObjectBorderSuggestionState embeddedObjectBorderSuggestionState?;
    # A mask that indicates which of the fields on the base ImageProperties have been changed in this suggestion. For any field set to true, there is a new suggested value.
    ImagePropertiesSuggestionState imagePropertiesSuggestionState?;
    # A mask that indicates which of the fields on the base LinkedContentReference have been changed in this suggestion. For any field set to true, there is a new suggested value.
    LinkedContentReferenceSuggestionState linkedContentReferenceSuggestionState?;
    # Indicates if there was a suggested change to margin_bottom.
    boolean marginBottomSuggested?;
    # Indicates if there was a suggested change to margin_left.
    boolean marginLeftSuggested?;
    # Indicates if there was a suggested change to margin_right.
    boolean marginRightSuggested?;
    # Indicates if there was a suggested change to margin_top.
    boolean marginTopSuggested?;
    # A mask that indicates which of the fields on the base Size have been changed in this suggestion. For any field set to true, the Size has a new suggested value.
    SizeSuggestionState sizeSuggestionState?;
    # Indicates if there was a suggested change to title.
    boolean titleSuggested?;
};

# A suggested change to PositionedObjectProperties.
public type SuggestedPositionedObjectProperties record {
    # Properties of a PositionedObject.
    PositionedObjectProperties positionedObjectProperties?;
    # A mask that indicates which of the fields on the base PositionedObjectProperties have been changed in this suggestion. For any field set to true, there is a new suggested value.
    PositionedObjectPropertiesSuggestionState positionedObjectPropertiesSuggestionState?;
};

# A mask that indicates which of the fields on the base PositionedObjectPositioning have been changed in this suggestion. For any field set to true, there is a new suggested value.
public type PositionedObjectPositioningSuggestionState record {
    # Indicates if there was a suggested change to layout.
    boolean layoutSuggested?;
    # Indicates if there was a suggested change to left_offset.
    boolean leftOffsetSuggested?;
    # Indicates if there was a suggested change to top_offset.
    boolean topOffsetSuggested?;
};

# Represents the background of a document.
public type Background record {
    # A color that can either be fully opaque or fully transparent.
    OptionalColor color?;
};

# A ParagraphElement representing a footnote reference. A footnote reference is the inline content rendered with a number and is used to identify the footnote.
public type FootnoteReference record {
    # The ID of the footnote that contains the content of this footnote reference.
    string footnoteId?;
    # The rendered number of this footnote.
    string footnoteNumber?;
    # The suggested deletion IDs. If empty, then there are no suggested deletions of this content.
    string[] suggestedDeletionIds?;
    # The suggested insertion IDs. A FootnoteReference may have multiple insertion IDs if it is a nested suggested change. If empty, then this is not a suggested insertion.
    string[] suggestedInsertionIds?;
    # The suggested text style changes to this FootnoteReference, keyed by suggestion ID.
    record {} suggestedTextStyleChanges?;
    # Represents the styling that can be applied to text. Inherited text styles are represented as unset fields in this message. A text style's parent depends on where the text style is defined: * The TextStyle of text in a Paragraph inherits from the paragraph's corresponding named style type. * The TextStyle on a named style inherits from the normal text named style. * The TextStyle of the normal text named style inherits from the default text style in the Docs editor. * The TextStyle on a Paragraph element that is contained in a table may inherit its text style from the table style. If the text style does not inherit from a parent, unsetting fields will revert the style to a value matching the defaults in the Docs editor.
    TextStyle textStyle?;
};

# A suggested change to a ParagraphStyle.
public type SuggestedParagraphStyle record {
    # Styles that apply to a whole paragraph. Inherited paragraph styles are represented as unset fields in this message. A paragraph style's parent depends on where the paragraph style is defined: * The ParagraphStyle on a Paragraph inherits from the paragraph's corresponding named style type. * The ParagraphStyle on a named style inherits from the normal text named style. * The ParagraphStyle of the normal text named style inherits from the default paragraph style in the Docs editor. * The ParagraphStyle on a Paragraph element that is contained in a table may inherit its paragraph style from the table style. If the paragraph style does not inherit from a parent, unsetting fields will revert the style to a value matching the defaults in the Docs editor.
    ParagraphStyle paragraphStyle?;
    # A mask that indicates which of the fields on the base ParagraphStyle have been changed in this suggestion. For any field set to true, there is a new suggested value.
    ParagraphStyleSuggestionState paragraphStyleSuggestionState?;
};

# A ParagraphElement representing a column break. A column break makes the subsequent text start at the top of the next column.
public type ColumnBreak record {
    # The suggested deletion IDs. If empty, then there are no suggested deletions of this content.
    string[] suggestedDeletionIds?;
    # The suggested insertion IDs. A ColumnBreak may have multiple insertion IDs if it is a nested suggested change. If empty, then this is not a suggested insertion.
    string[] suggestedInsertionIds?;
    # The suggested text style changes to this ColumnBreak, keyed by suggestion ID.
    record {} suggestedTextStyleChanges?;
    # Represents the styling that can be applied to text. Inherited text styles are represented as unset fields in this message. A text style's parent depends on where the text style is defined: * The TextStyle of text in a Paragraph inherits from the paragraph's corresponding named style type. * The TextStyle on a named style inherits from the normal text named style. * The TextStyle of the normal text named style inherits from the default text style in the Docs editor. * The TextStyle on a Paragraph element that is contained in a table may inherit its text style from the table style. If the text style does not inherit from a parent, unsetting fields will revert the style to a value matching the defaults in the Docs editor.
    TextStyle textStyle?;
};

# The shading of a paragraph.
public type Shading record {
    # A color that can either be fully opaque or fully transparent.
    OptionalColor backgroundColor?;
};

# A reference to the external linked source content.
public type LinkedContentReference record {
    # A reference to a linked chart embedded from Google Sheets.
    SheetsChartReference sheetsChartReference?;
};

# A suggested change to ListProperties.
public type SuggestedListProperties record {
    # The properties of a list which describe the look and feel of bullets belonging to paragraphs associated with a list.
    ListProperties listProperties?;
    # A mask that indicates which of the fields on the base ListProperties have been changed in this suggestion. For any field set to true, there is a new suggested value.
    ListPropertiesSuggestionState listPropertiesSuggestionState?;
};

# A mask that indicates which of the fields on the base InlineObjectProperties have been changed in this suggestion. For any field set to true, there is a new suggested value.
public type InlineObjectPropertiesSuggestionState record {
    # A mask that indicates which of the fields on the base EmbeddedObject have been changed in this suggestion. For any field set to true, there is a new suggested value.
    EmbeddedObjectSuggestionState embeddedObjectSuggestionState?;
};

# Replaces an existing image with a new image. Replacing an image removes some image effects from the existing image in order to mirror the behavior of the Docs editor.
public type ReplaceImageRequest record {
    # The ID of the existing image that will be replaced.
    string imageObjectId?;
    # The replacement method.
    string imageReplaceMethod?;
    # The URI of the new image. The image is fetched once at insertion time and a copy is stored for display inside the document. Images must be less than 50MB in size, cannot exceed 25 megapixels, and must be in one of PNG, JPEG, or GIF format. The provided URI can be at most 2 kB in length. The URI itself is saved with the image, and exposed via the ImageProperties.source_uri field.
    string uri?;
};

# The properties of a list which describe the look and feel of bullets belonging to paragraphs associated with a list.
public type ListProperties record {
    # Describes the properties of the bullets at the associated level. A list has at most nine levels of nesting with nesting level 0 corresponding to the top-most level and nesting level 8 corresponding to the most nested level. The nesting levels are returned in ascending order with the least nested returned first.
    NestingLevel[] nestingLevels?;
};

# The suggestion state of a NamedStyles message.
public type NamedStylesSuggestionState record {
    # A mask that indicates which of the fields on the corresponding NamedStyle in styles have been changed in this suggestion. The order of these named style suggestion states match the order of the corresponding named style within the named styles suggestion.
    NamedStyleSuggestionState[] stylesSuggestionStates?;
};

# Deletes a PositionedObject from the document.
public type DeletePositionedObjectRequest record {
    # The ID of the positioned object to delete.
    string objectId?;
};

# A document header.
public type Header record {
    # The contents of the header. The indexes for a header's content begin at zero.
    StructuralElement[] content?;
    # The ID of the header.
    string headerId?;
};

# The result of inserting an inline image.
public type InsertInlineImageResponse record {
    # The ID of the created InlineObject.
    string objectId?;
};

# Inserts a page break followed by a newline at the specified location.
public type InsertPageBreakRequest record {
    # Location at the end of a body, header, footer or footnote. The location is immediately before the last newline in the document segment.
    EndOfSegmentLocation endOfSegmentLocation?;
    # A particular location in the document.
    Location location?;
};

# The properties of an image.
public type ImageProperties record {
    # The clockwise rotation angle of the image, in radians.
    float angle?;
    # The brightness effect of the image. The value should be in the interval [-1.0, 1.0], where 0 means no effect.
    float brightness?;
    # A URI to the image with a default lifetime of 30 minutes. This URI is tagged with the account of the requester. Anyone with the URI effectively accesses the image as the original requester. Access to the image may be lost if the document's sharing settings change.
    string contentUri?;
    # The contrast effect of the image. The value should be in the interval [-1.0, 1.0], where 0 means no effect.
    float contrast?;
    # The crop properties of an image. The crop rectangle is represented using fractional offsets from the original content's four edges. - If the offset is in the interval (0, 1), the corresponding edge of crop rectangle is positioned inside of the image's original bounding rectangle. - If the offset is negative or greater than 1, the corresponding edge of crop rectangle is positioned outside of the image's original bounding rectangle. - If all offsets and rotation angle are 0, the image is not cropped.
    CropProperties cropProperties?;
    # The source URI is the URI used to insert the image. The source URI can be empty.
    string sourceUri?;
    # The transparency effect of the image. The value should be in the interval [0.0, 1.0], where 0 means no effect and 1 means completely transparent.
    float transparency?;
};

# The contents and style of a row in a Table.
public type TableRow record {
    # The zero-based end index of this row, exclusive, in UTF-16 code units.
    int endIndex?;
    # The zero-based start index of this row, in UTF-16 code units.
    int startIndex?;
    # The suggested deletion IDs. If empty, then there are no suggested deletions of this content.
    string[] suggestedDeletionIds?;
    # The suggested insertion IDs. A TableRow may have multiple insertion IDs if it is a nested suggested change. If empty, then this is not a suggested insertion.
    string[] suggestedInsertionIds?;
    # The suggested style changes to this row, keyed by suggestion ID.
    record {} suggestedTableRowStyleChanges?;
    # The contents and style of each cell in this row. It is possible for a table to be non-rectangular, so some rows may have a different number of cells than other rows in the same table.
    TableCell[] tableCells?;
    # Styles that apply to a table row.
    TableRowStyle tableRowStyle?;
};

# Properties specific to a linked Person.
public type PersonProperties record {
    # Output only. The email address linked to this Person. This field is always present.
    string email?;
    # Output only. The name of the person if it is displayed in the link text instead of the person's email address.
    string name?;
};

# A suggested change to InlineObjectProperties.
public type SuggestedInlineObjectProperties record {
    # Properties of an InlineObject.
    InlineObjectProperties inlineObjectProperties?;
    # A mask that indicates which of the fields on the base InlineObjectProperties have been changed in this suggestion. For any field set to true, there is a new suggested value.
    InlineObjectPropertiesSuggestionState inlineObjectPropertiesSuggestionState?;
};

# A person or email address mentioned in a document. These mentions behave as a single, immutable element containing the person's name or email address.
public type Person record {
    # Output only. The unique ID of this link.
    string personId?;
    # Properties specific to a linked Person.
    PersonProperties personProperties?;
    # IDs for suggestions that remove this person link from the document. A Person might have multiple deletion IDs if, for example, multiple users suggest to delete it. If empty, then this person link isn't suggested for deletion.
    string[] suggestedDeletionIds?;
    # IDs for suggestions that insert this person link into the document. A Person might have multiple insertion IDs if it is a nested suggested change (a suggestion within a suggestion made by a different user, for example). If empty, then this person link isn't a suggested insertion.
    string[] suggestedInsertionIds?;
    # The suggested text style changes to this Person, keyed by suggestion ID.
    record {} suggestedTextStyleChanges?;
    # Represents the styling that can be applied to text. Inherited text styles are represented as unset fields in this message. A text style's parent depends on where the text style is defined: * The TextStyle of text in a Paragraph inherits from the paragraph's corresponding named style type. * The TextStyle on a named style inherits from the normal text named style. * The TextStyle of the normal text named style inherits from the default text style in the Docs editor. * The TextStyle on a Paragraph element that is contained in a table may inherit its text style from the table style. If the text style does not inherit from a parent, unsetting fields will revert the style to a value matching the defaults in the Docs editor.
    TextStyle textStyle?;
};

# A reference to another portion of a document or an external URL resource.
public type Link record {
    # The ID of a bookmark in this document.
    string bookmarkId?;
    # The ID of a heading in this document.
    string headingId?;
    # An external URL.
    string url?;
};

# Deletes a Header from the document.
public type DeleteHeaderRequest record {
    # The id of the header to delete. If this header is defined on DocumentStyle, the reference to this header is removed, resulting in no header of that type for the first section of the document. If this header is defined on a SectionStyle, the reference to this header is removed and the header of that type is now continued from the previous section.
    string headerId?;
};

# Creates a Footnote segment and inserts a new FootnoteReference to it at the given location. The new Footnote segment will contain a space followed by a newline character.
public type CreateFootnoteRequest record {
    # Location at the end of a body, header, footer or footnote. The location is immediately before the last newline in the document segment.
    EndOfSegmentLocation endOfSegmentLocation?;
    # A particular location in the document.
    Location location?;
};

# Represents a font family and weight of text.
public type WeightedFontFamily record {
    # The font family of the text. The font family can be any font from the Font menu in Docs or from [Google Fonts] (https://fonts.google.com/). If the font name is unrecognized, the text is rendered in `Arial`.
    string fontFamily?;
    # The weight of the font. This field can have any value that is a multiple of `100` between `100` and `900`, inclusive. This range corresponds to the numerical values described in the CSS 2.1 Specification, [section 15.6](https://www.w3.org/TR/CSS21/fonts.html#font-boldness), with non-numerical values disallowed. The default value is `400` ("normal"). The font weight makes up just one component of the rendered font weight. The rendered weight is determined by a combination of the `weight` and the text style's resolved `bold` value, after accounting for inheritance: * If the text is bold and the weight is less than `400`, the rendered weight is 400. * If the text is bold and the weight is greater than or equal to `400` but is less than `700`, the rendered weight is `700`. * If the weight is greater than or equal to `700`, the rendered weight is equal to the weight. * If the text is not bold, the rendered weight is equal to the weight.
    int weight?;
};

# Unmerges cells in a Table.
public type UnmergeTableCellsRequest record {
    # A table range represents a reference to a subset of a table. It's important to note that the cells specified by a table range do not necessarily form a rectangle. For example, let's say we have a 3 x 3 table where all the cells of the last row are merged together. The table looks like this: [ ] A table range with table cell location = (table_start_location, row = 0, column = 0), row span = 3 and column span = 2 specifies the following cells: x x [ x x x ]
    TableRange tableRange?;
};

# Inserts a table at the specified location. A newline character will be inserted before the inserted table.
public type InsertTableRequest record {
    # The number of columns in the table.
    int columns?;
    # Location at the end of a body, header, footer or footnote. The location is immediately before the last newline in the document segment.
    EndOfSegmentLocation endOfSegmentLocation?;
    # A particular location in the document.
    Location location?;
    # The number of rows in the table.
    int rows?;
};

# A table range represents a reference to a subset of a table. It's important to note that the cells specified by a table range do not necessarily form a rectangle. For example, let's say we have a 3 x 3 table where all the cells of the last row are merged together. The table looks like this: [ ] A table range with table cell location = (table_start_location, row = 0, column = 0), row span = 3 and column span = 2 specifies the following cells: x x [ x x x ]
public type TableRange record {
    # The column span of the table range.
    int columnSpan?;
    # The row span of the table range.
    int rowSpan?;
    # Location of a single cell within a table.
    TableCellLocation tableCellLocation?;
};

# Deletes a row from a table.
public type DeleteTableRowRequest record {
    # Location of a single cell within a table.
    TableCellLocation tableCellLocation?;
};

# A link to a Google resource (e.g., a file in Drive, a YouTube video, a Calendar event, etc.).
public type RichLink record {
    # Output only. The ID of this link.
    string richLinkId?;
    # Properties specific to a RichLink.
    RichLinkProperties richLinkProperties?;
    # IDs for suggestions that remove this link from the document. A RichLink might have multiple deletion IDs if, for example, multiple users suggest to delete it. If empty, then this person link isn't suggested for deletion.
    string[] suggestedDeletionIds?;
    # IDs for suggestions that insert this link into the document. A RichLink might have multiple insertion IDs if it is a nested suggested change (a suggestion within a suggestion made by a different user, for example). If empty, then this person link isn't a suggested insertion.
    string[] suggestedInsertionIds?;
    # The suggested text style changes to this RichLink, keyed by suggestion ID.
    record {} suggestedTextStyleChanges?;
    # Represents the styling that can be applied to text. Inherited text styles are represented as unset fields in this message. A text style's parent depends on where the text style is defined: * The TextStyle of text in a Paragraph inherits from the paragraph's corresponding named style type. * The TextStyle on a named style inherits from the normal text named style. * The TextStyle of the normal text named style inherits from the default text style in the Docs editor. * The TextStyle on a Paragraph element that is contained in a table may inherit its text style from the table style. If the text style does not inherit from a parent, unsetting fields will revert the style to a value matching the defaults in the Docs editor.
    TextStyle textStyle?;
};

# A ParagraphElement that represents a run of text that all has the same styling.
public type TextRun record {
    # The text of this run. Any non-text elements in the run are replaced with the Unicode character U+E907.
    string content?;
    # The suggested deletion IDs. If empty, then there are no suggested deletions of this content.
    string[] suggestedDeletionIds?;
    # The suggested insertion IDs. A TextRun may have multiple insertion IDs if it is a nested suggested change. If empty, then this is not a suggested insertion.
    string[] suggestedInsertionIds?;
    # The suggested text style changes to this run, keyed by suggestion ID.
    record {} suggestedTextStyleChanges?;
    # Represents the styling that can be applied to text. Inherited text styles are represented as unset fields in this message. A text style's parent depends on where the text style is defined: * The TextStyle of text in a Paragraph inherits from the paragraph's corresponding named style type. * The TextStyle on a named style inherits from the normal text named style. * The TextStyle of the normal text named style inherits from the default text style in the Docs editor. * The TextStyle on a Paragraph element that is contained in a table may inherit its text style from the table style. If the text style does not inherit from a parent, unsetting fields will revert the style to a value matching the defaults in the Docs editor.
    TextStyle textStyle?;
};

# The style of the document.
public type DocumentStyle record {
    # Represents the background of a document.
    Background background?;
    # The ID of the default footer. If not set, there is no default footer. This property is read-only.
    string defaultFooterId?;
    # The ID of the default header. If not set, there is no default header. This property is read-only.
    string defaultHeaderId?;
    # The ID of the footer used only for even pages. The value of use_even_page_header_footer determines whether to use the default_footer_id or this value for the footer on even pages. If not set, there is no even page footer. This property is read-only.
    string evenPageFooterId?;
    # The ID of the header used only for even pages. The value of use_even_page_header_footer determines whether to use the default_header_id or this value for the header on even pages. If not set, there is no even page header. This property is read-only.
    string evenPageHeaderId?;
    # The ID of the footer used only for the first page. If not set then a unique footer for the first page does not exist. The value of use_first_page_header_footer determines whether to use the default_footer_id or this value for the footer on the first page. If not set, there is no first page footer. This property is read-only.
    string firstPageFooterId?;
    # The ID of the header used only for the first page. If not set then a unique header for the first page does not exist. The value of use_first_page_header_footer determines whether to use the default_header_id or this value for the header on the first page. If not set, there is no first page header. This property is read-only.
    string firstPageHeaderId?;
    # A magnitude in a single direction in the specified units.
    Dimension marginBottom?;
    # A magnitude in a single direction in the specified units.
    Dimension marginFooter?;
    # A magnitude in a single direction in the specified units.
    Dimension marginHeader?;
    # A magnitude in a single direction in the specified units.
    Dimension marginLeft?;
    # A magnitude in a single direction in the specified units.
    Dimension marginRight?;
    # A magnitude in a single direction in the specified units.
    Dimension marginTop?;
    # The page number from which to start counting the number of pages.
    int pageNumberStart?;
    # A width and height.
    Size pageSize?;
    # Indicates whether DocumentStyle margin_header, SectionStyle margin_header and DocumentStyle margin_footer, SectionStyle margin_footer are respected. When false, the default values in the Docs editor for header and footer margin are used. This property is read-only.
    boolean useCustomHeaderFooterMargins?;
    # Indicates whether to use the even page header / footer IDs for the even pages.
    boolean useEvenPageHeaderFooter?;
    # Indicates whether to use the first page header / footer IDs for the first page.
    boolean useFirstPageHeaderFooter?;
};

# Inserts a section break at the given location. A newline character will be inserted before the section break.
public type InsertSectionBreakRequest record {
    # Location at the end of a body, header, footer or footnote. The location is immediately before the last newline in the document segment.
    EndOfSegmentLocation endOfSegmentLocation?;
    # A particular location in the document.
    Location location?;
    # The type of section to insert.
    string sectionType?;
};

# An RGB color.
public type RgbColor record {
    # The blue component of the color, from 0.0 to 1.0.
    float blue?;
    # The green component of the color, from 0.0 to 1.0.
    float green?;
    # The red component of the color, from 0.0 to 1.0.
    float red?;
};

# Updates the TableColumnProperties of columns in a table.
public type UpdateTableColumnPropertiesRequest record {
    # The list of zero-based column indices whose property should be updated. If no indices are specified, all columns will be updated.
    int[] columnIndices?;
    # The fields that should be updated. At least one field must be specified. The root `tableColumnProperties` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. For example to update the column width, set `fields` to `"width"`.
    string fields?;
    # The properties of a column in a table.
    TableColumnProperties tableColumnProperties?;
    # A particular location in the document.
    Location tableStartLocation?;
};

# Update the styling of text.
public type UpdateTextStyleRequest record {
    # The fields that should be updated. At least one field must be specified. The root `text_style` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. For example, to update the text style to bold, set `fields` to `"bold"`. To reset a property to its default value, include its field name in the field mask but leave the field itself unset.
    string fields?;
    # Specifies a contiguous range of text.
    Range range?;
    # Represents the styling that can be applied to text. Inherited text styles are represented as unset fields in this message. A text style's parent depends on where the text style is defined: * The TextStyle of text in a Paragraph inherits from the paragraph's corresponding named style type. * The TextStyle on a named style inherits from the normal text named style. * The TextStyle of the normal text named style inherits from the default text style in the Docs editor. * The TextStyle on a Paragraph element that is contained in a table may inherit its text style from the table style. If the text style does not inherit from a parent, unsetting fields will revert the style to a value matching the defaults in the Docs editor.
    TextStyle textStyle?;
};

# Updates the SectionStyle.
public type UpdateSectionStyleRequest record {
    # The fields that should be updated. At least one field must be specified. The root `section_style` is implied and must not be specified. A single `"*"` can be used as short-hand for listing every field. For example to update the left margin, set `fields` to `"margin_left"`.
    string fields?;
    # Specifies a contiguous range of text.
    Range range?;
    # The styling that applies to a section.
    SectionStyle sectionStyle?;
};

# Creates a Header. The new header is applied to the SectionStyle at the location of the SectionBreak if specificed, otherwise it is applied to the DocumentStyle. If a header of the specified type already exists, a 400 bad request error is returned.
public type CreateHeaderRequest record {
    # A particular location in the document.
    Location sectionBreakLocation?;
    # The type of header to create.
    string 'type?;
};

# A suggested change to a TextStyle.
public type SuggestedTextStyle record {
    # Represents the styling that can be applied to text. Inherited text styles are represented as unset fields in this message. A text style's parent depends on where the text style is defined: * The TextStyle of text in a Paragraph inherits from the paragraph's corresponding named style type. * The TextStyle on a named style inherits from the normal text named style. * The TextStyle of the normal text named style inherits from the default text style in the Docs editor. * The TextStyle on a Paragraph element that is contained in a table may inherit its text style from the table style. If the text style does not inherit from a parent, unsetting fields will revert the style to a value matching the defaults in the Docs editor.
    TextStyle textStyle?;
    # A mask that indicates which of the fields on the base TextStyle have been changed in this suggestion. For any field set to true, there is a new suggested value.
    TextStyleSuggestionState textStyleSuggestionState?;
};

# Describes the bullet of a paragraph.
public type Bullet record {
    # The ID of the list this paragraph belongs to.
    string listId?;
    # The nesting level of this paragraph in the list.
    int nestingLevel?;
    # Represents the styling that can be applied to text. Inherited text styles are represented as unset fields in this message. A text style's parent depends on where the text style is defined: * The TextStyle of text in a Paragraph inherits from the paragraph's corresponding named style type. * The TextStyle on a named style inherits from the normal text named style. * The TextStyle of the normal text named style inherits from the default text style in the Docs editor. * The TextStyle on a Paragraph element that is contained in a table may inherit its text style from the table style. If the text style does not inherit from a parent, unsetting fields will revert the style to a value matching the defaults in the Docs editor.
    TextStyle textStyle?;
};

# The properties of a column in a table.
public type TableColumnProperties record {
    # A magnitude in a single direction in the specified units.
    Dimension width?;
    # The width type of the column.
    string widthType?;
};

# Deletes a Footer from the document.
public type DeleteFooterRequest record {
    # The id of the footer to delete. If this footer is defined on DocumentStyle, the reference to this footer is removed, resulting in no footer of that type for the first section of the document. If this footer is defined on a SectionStyle, the reference to this footer is removed and the footer of that type is now continued from the previous section.
    string footerId?;
};

# A StructuralElement representing a table.
public type Table record {
    # Number of columns in the table. It is possible for a table to be non-rectangular, so some rows may have a different number of cells.
    int columns?;
    # Number of rows in the table.
    int rows?;
    # The suggested deletion IDs. If empty, then there are no suggested deletions of this content.
    string[] suggestedDeletionIds?;
    # The suggested insertion IDs. A Table may have multiple insertion IDs if it is a nested suggested change. If empty, then this is not a suggested insertion.
    string[] suggestedInsertionIds?;
    # The contents and style of each row.
    TableRow[] tableRows?;
    # Styles that apply to a table.
    TableStyle tableStyle?;
};

# Creates a Footer. The new footer is applied to the SectionStyle at the location of the SectionBreak if specificed, otherwise it is applied to the DocumentStyle. If a footer of the specified type already exists, a 400 bad request error is returned.
public type CreateFooterRequest record {
    # A particular location in the document.
    Location sectionBreakLocation?;
    # The type of footer to create.
    string 'type?;
};

# Styles that apply to a table row.
public type TableRowStyle record {
    # A magnitude in a single direction in the specified units.
    Dimension minRowHeight?;
};

# A mask that indicates which of the fields on the base Background have been changed in this suggestion. For any field set to true, the Backgound has a new suggested value.
public type BackgroundSuggestionState record {
    # Indicates whether the current background color has been modified in this suggestion.
    boolean backgroundColorSuggested?;
};

# A named style. Paragraphs in the document can inherit their TextStyle and ParagraphStyle from this named style when they have the same named style type.
public type NamedStyle record {
    # The type of this named style.
    string namedStyleType?;
    # Styles that apply to a whole paragraph. Inherited paragraph styles are represented as unset fields in this message. A paragraph style's parent depends on where the paragraph style is defined: * The ParagraphStyle on a Paragraph inherits from the paragraph's corresponding named style type. * The ParagraphStyle on a named style inherits from the normal text named style. * The ParagraphStyle of the normal text named style inherits from the default paragraph style in the Docs editor. * The ParagraphStyle on a Paragraph element that is contained in a table may inherit its paragraph style from the table style. If the paragraph style does not inherit from a parent, unsetting fields will revert the style to a value matching the defaults in the Docs editor.
    ParagraphStyle paragraphStyle?;
    # Represents the styling that can be applied to text. Inherited text styles are represented as unset fields in this message. A text style's parent depends on where the text style is defined: * The TextStyle of text in a Paragraph inherits from the paragraph's corresponding named style type. * The TextStyle on a named style inherits from the normal text named style. * The TextStyle of the normal text named style inherits from the default text style in the Docs editor. * The TextStyle on a Paragraph element that is contained in a table may inherit its text style from the table style. If the text style does not inherit from a parent, unsetting fields will revert the style to a value matching the defaults in the Docs editor.
    TextStyle textStyle?;
};

# Inserts an empty row into a table.
public type InsertTableRowRequest record {
    # Whether to insert new row below the reference cell location. - `True`: insert below the cell. - `False`: insert above the cell.
    boolean insertBelow?;
    # Location of a single cell within a table.
    TableCellLocation tableCellLocation?;
};

# Replaces the contents of the specified NamedRange or NamedRanges with the given replacement content. Note that an individual NamedRange may consist of multiple discontinuous ranges. In this case, only the content in the first range will be replaced. The other ranges and their content will be deleted. In cases where replacing or deleting any ranges would result in an invalid document structure, a 400 bad request error is returned.
public type ReplaceNamedRangeContentRequest record {
    # The ID of the named range whose content will be replaced. If there is no named range with the given ID a 400 bad request error is returned.
    string namedRangeId?;
    # The name of the NamedRanges whose content will be replaced. If there are multiple named ranges with the given name, then the content of each one will be replaced. If there are no named ranges with the given name, then the request will be a no-op.
    string namedRangeName?;
    # Replaces the content of the specified named range(s) with the given text.
    string text?;
};

# A magnitude in a single direction in the specified units.
public type Dimension record {
    # The magnitude.
    decimal magnitude?;
    # The units for magnitude.
    string unit?;
};

# A mask that indicates which of the fields on the base EmbeddedDrawingProperties have been changed in this suggestion. For any field set to true, there is a new suggested value.
public type EmbeddedDrawingPropertiesSuggestionState record {
};

# A mask that indicates which of the fields on the base TextStyle have been changed in this suggestion. For any field set to true, there is a new suggested value.
public type TextStyleSuggestionState record {
    # Indicates if there was a suggested change to background_color.
    boolean backgroundColorSuggested?;
    # Indicates if there was a suggested change to baseline_offset.
    boolean baselineOffsetSuggested?;
    # Indicates if there was a suggested change to bold.
    boolean boldSuggested?;
    # Indicates if there was a suggested change to font_size.
    boolean fontSizeSuggested?;
    # Indicates if there was a suggested change to foreground_color.
    boolean foregroundColorSuggested?;
    # Indicates if there was a suggested change to italic.
    boolean italicSuggested?;
    # Indicates if there was a suggested change to link.
    boolean linkSuggested?;
    # Indicates if there was a suggested change to small_caps.
    boolean smallCapsSuggested?;
    # Indicates if there was a suggested change to strikethrough.
    boolean strikethroughSuggested?;
    # Indicates if there was a suggested change to underline.
    boolean underlineSuggested?;
    # Indicates if there was a suggested change to weighted_font_family.
    boolean weightedFontFamilySuggested?;
};

# A mask that indicates which of the fields on the base PositionedObjectProperties have been changed in this suggestion. For any field set to true, there is a new suggested value.
public type PositionedObjectPropertiesSuggestionState record {
    # A mask that indicates which of the fields on the base EmbeddedObject have been changed in this suggestion. For any field set to true, there is a new suggested value.
    EmbeddedObjectSuggestionState embeddedObjectSuggestionState?;
    # A mask that indicates which of the fields on the base PositionedObjectPositioning have been changed in this suggestion. For any field set to true, there is a new suggested value.
    PositionedObjectPositioningSuggestionState positioningSuggestionState?;
};

# Deletes a column from a table.
public type DeleteTableColumnRequest record {
    # Location of a single cell within a table.
    TableCellLocation tableCellLocation?;
};

# The result of creating a footnote.
public type CreateFootnoteResponse record {
    # The ID of the created footnote.
    string footnoteId?;
};

# A document footer.
public type Footer record {
    # The contents of the footer. The indexes for a footer's content begin at zero.
    StructuralElement[] content?;
    # The ID of the footer.
    string footerId?;
};

# A mask that indicates which of the fields on the base Shading have been changed in this suggested change. For any field set to true, there is a new suggested value.
public type ShadingSuggestionState record {
    # Indicates if there was a suggested change to the Shading.
    boolean backgroundColorSuggested?;
};

# A mask that indicates which of the fields on the base SheetsChartReference have been changed in this suggestion. For any field set to true, there is a new suggested value.
public type SheetsChartReferenceSuggestionState record {
    # Indicates if there was a suggested change to chart_id.
    boolean chartIdSuggested?;
    # Indicates if there was a suggested change to spreadsheet_id.
    boolean spreadsheetIdSuggested?;
};

# A collection of object IDs.
public type ObjectReferences record {
    # The object IDs.
    string[] objectIds?;
};

# Provides control over how write requests are executed.
public type WriteControl record {
    # The revision ID of the document that the write request will be applied to. If this is not the latest revision of the document, the request will not be processed and will return a 400 bad request error. When a required revision ID is returned in a response, it indicates the revision ID of the document after the request was applied.
    string requiredRevisionId?;
    # The target revision ID of the document that the write request will be applied to. If collaborator changes have occurred after the document was read using the API, the changes produced by this write request will be transformed against the collaborator changes. This results in a new revision of the document which incorporates both the changes in the request and the collaborator changes, and the Docs server will resolve conflicting changes. When using `target_revision_id`, the API client can be thought of as another collaborator of the document. The target revision ID may only be used to write to recent versions of a document. If the target revision is too far behind the latest revision, the request will not be processed and will return a 400 bad request error and the request should be retried after reading the latest version of the document. In most cases a `revision_id` will remain valid for use as a target revision for several minutes after it is read, but for frequently-edited documents this window may be shorter.
    string targetRevisionId?;
};

# Replaces all instances of text matching a criteria with replace text.
public type ReplaceAllTextRequest record {
    # A criteria that matches a specific string of text in the document.
    SubstringMatchCriteria containsText?;
    # The text that will replace the matched text.
    string replaceText?;
};

# Inserts an empty column into a table.
public type InsertTableColumnRequest record {
    # Whether to insert new column to the right of the reference cell location. - `True`: insert to the right. - `False`: insert to the left.
    boolean insertRight?;
    # Location of a single cell within a table.
    TableCellLocation tableCellLocation?;
};

# A mask that indicates which of the fields on the base NestingLevel have been changed in this suggestion. For any field set to true, there is a new suggested value.
public type NestingLevelSuggestionState record {
    # Indicates if there was a suggested change to bullet_alignment.
    boolean bulletAlignmentSuggested?;
    # Indicates if there was a suggested change to glyph_format.
    boolean glyphFormatSuggested?;
    # Indicates if there was a suggested change to glyph_symbol.
    boolean glyphSymbolSuggested?;
    # Indicates if there was a suggested change to glyph_type.
    boolean glyphTypeSuggested?;
    # Indicates if there was a suggested change to indent_first_line.
    boolean indentFirstLineSuggested?;
    # Indicates if there was a suggested change to indent_start.
    boolean indentStartSuggested?;
    # Indicates if there was a suggested change to start_number.
    boolean startNumberSuggested?;
    # A mask that indicates which of the fields on the base TextStyle have been changed in this suggestion. For any field set to true, there is a new suggested value.
    TextStyleSuggestionState textStyleSuggestionState?;
};

# A suggested change to a TableCellStyle.
public type SuggestedTableCellStyle record {
    # The style of a TableCell. Inherited table cell styles are represented as unset fields in this message. A table cell style can inherit from the table's style.
    TableCellStyle tableCellStyle?;
    # A mask that indicates which of the fields on the base TableCellStyle have been changed in this suggestion. For any field set to true, there is a new suggested value.
    TableCellStyleSuggestionState tableCellStyleSuggestionState?;
};

# A tab stop within a paragraph.
public type TabStop record {
    # The alignment of this tab stop. If unset, the value defaults to START.
    string alignment?;
    # A magnitude in a single direction in the specified units.
    Dimension offset?;
};

# A mask that indicates which of the fields on the base TableRowStyle have been changed in this suggestion. For any field set to true, there is a new suggested value.
public type TableRowStyleSuggestionState record {
    # Indicates if there was a suggested change to min_row_height.
    boolean minRowHeightSuggested?;
};

# Updates the TableRowStyle of rows in a table.
public type UpdateTableRowStyleRequest record {
    # The fields that should be updated. At least one field must be specified. The root `tableRowStyle` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. For example to update the minimum row height, set `fields` to `"min_row_height"`.
    string fields?;
    # The list of zero-based row indices whose style should be updated. If no indices are specified, all rows will be updated.
    int[] rowIndices?;
    # Styles that apply to a table row.
    TableRowStyle tableRowStyle?;
    # A particular location in the document.
    Location tableStartLocation?;
};

# A border around an EmbeddedObject.
public type EmbeddedObjectBorder record {
    # A color that can either be fully opaque or fully transparent.
    OptionalColor color?;
    # The dash style of the border.
    string dashStyle?;
    # The property state of the border property.
    string propertyState?;
    # A magnitude in a single direction in the specified units.
    Dimension width?;
};

# A StructuralElement describes content that provides structure to the document.
public type StructuralElement record {
    # The zero-based end index of this structural element, exclusive, in UTF-16 code units.
    int endIndex?;
    # A StructuralElement representing a paragraph. A paragraph is a range of content that is terminated with a newline character.
    Paragraph paragraph?;
    # A StructuralElement representing a section break. A section is a range of content which has the same SectionStyle. A section break represents the start of a new section, and the section style applies to the section after the section break. The document body always begins with a section break.
    SectionBreak sectionBreak?;
    # The zero-based start index of this structural element, in UTF-16 code units.
    int startIndex?;
    # A StructuralElement representing a table.
    Table 'table?;
    # A StructuralElement representing a table of contents.
    TableOfContents tableOfContents?;
};

# Represents the styling that can be applied to text. Inherited text styles are represented as unset fields in this message. A text style's parent depends on where the text style is defined: * The TextStyle of text in a Paragraph inherits from the paragraph's corresponding named style type. * The TextStyle on a named style inherits from the normal text named style. * The TextStyle of the normal text named style inherits from the default text style in the Docs editor. * The TextStyle on a Paragraph element that is contained in a table may inherit its text style from the table style. If the text style does not inherit from a parent, unsetting fields will revert the style to a value matching the defaults in the Docs editor.
public type TextStyle record {
    # A color that can either be fully opaque or fully transparent.
    OptionalColor backgroundColor?;
    # The text's vertical offset from its normal position. Text with `SUPERSCRIPT` or `SUBSCRIPT` baseline offsets is automatically rendered in a smaller font size, computed based on the `font_size` field. The `font_size` itself is not affected by changes in this field.
    string baselineOffset?;
    # Whether or not the text is rendered as bold.
    boolean bold?;
    # A magnitude in a single direction in the specified units.
    Dimension fontSize?;
    # A color that can either be fully opaque or fully transparent.
    OptionalColor foregroundColor?;
    # Whether or not the text is italicized.
    boolean italic?;
    # A reference to another portion of a document or an external URL resource.
    Link link?;
    # Whether or not the text is in small capital letters.
    boolean smallCaps?;
    # Whether or not the text is struck through.
    boolean strikethrough?;
    # Whether or not the text is underlined.
    boolean underline?;
    # Represents a font family and weight of text.
    WeightedFontFamily weightedFontFamily?;
};

# Deletes content from the document.
public type DeleteContentRangeRequest record {
    # Specifies a contiguous range of text.
    Range range?;
};

# Properties of a PositionedObject.
public type PositionedObjectProperties record {
    # An embedded object in the document.
    EmbeddedObject embeddedObject?;
    # The positioning of a PositionedObject. The positioned object is positioned relative to the beginning of the Paragraph it is tethered to.
    PositionedObjectPositioning positioning?;
};

# Creates bullets for all of the paragraphs that overlap with the given range. The nesting level of each paragraph will be determined by counting leading tabs in front of each paragraph. To avoid excess space between the bullet and the corresponding paragraph, these leading tabs are removed by this request. This may change the indices of parts of the text. If the paragraph immediately before paragraphs being updated is in a list with a matching preset, the paragraphs being updated are added to that preceding list.
public type CreateParagraphBulletsRequest record {
    # The kinds of bullet glyphs to be used.
    string bulletPreset?;
    # Specifies a contiguous range of text.
    Range range?;
};

# A List represents the list attributes for a group of paragraphs that all belong to the same list. A paragraph that is part of a list has a reference to the list's ID in its bullet.
public type List record {
    # The properties of a list which describe the look and feel of bullets belonging to paragraphs associated with a list.
    ListProperties listProperties?;
    # The suggested deletion IDs. If empty, then there are no suggested deletions of this list.
    string[] suggestedDeletionIds?;
    # The suggested insertion ID. If empty, then this is not a suggested insertion.
    string suggestedInsertionId?;
    # The suggested changes to the list properties, keyed by suggestion ID.
    record {} suggestedListPropertiesChanges?;
};

# A suggested change to the DocumentStyle.
public type SuggestedDocumentStyle record {
    # The style of the document.
    DocumentStyle documentStyle?;
    # A mask that indicates which of the fields on the base DocumentStyle have been changed in this suggestion. For any field set to true, there is a new suggested value.
    DocumentStyleSuggestionState documentStyleSuggestionState?;
};

# Properties of an InlineObject.
public type InlineObjectProperties record {
    # An embedded object in the document.
    EmbeddedObject embeddedObject?;
};

# A mask that indicates which of the fields on the base ListProperties have been changed in this suggestion. For any field set to true, there is a new suggested value.
public type ListPropertiesSuggestionState record {
    # A mask that indicates which of the fields on the corresponding NestingLevel in nesting_levels have been changed in this suggestion. The nesting level suggestion states are returned in ascending order of the nesting level with the least nested returned first.
    NestingLevelSuggestionState[] nestingLevelsSuggestionStates?;
};

# A mask that indicates which of the fields on the base Size have been changed in this suggestion. For any field set to true, the Size has a new suggested value.
public type SizeSuggestionState record {
    # Indicates if there was a suggested change to height.
    boolean heightSuggested?;
    # Indicates if there was a suggested change to width.
    boolean widthSuggested?;
};

# The result of creating a header.
public type CreateHeaderResponse record {
    # The ID of the created header.
    string headerId?;
};

# A solid color.
public type Color record {
    # An RGB color.
    RgbColor rgbColor?;
};

# Inserts text at the specified location.
public type InsertTextRequest record {
    # Location at the end of a body, header, footer or footnote. The location is immediately before the last newline in the document segment.
    EndOfSegmentLocation endOfSegmentLocation?;
    # A particular location in the document.
    Location location?;
    # The text to be inserted. Inserting a newline character will implicitly create a new Paragraph at that index. The paragraph style of the new paragraph will be copied from the paragraph at the current insertion index, including lists and bullets. Text styles for inserted text will be determined automatically, generally preserving the styling of neighboring text. In most cases, the text style for the inserted text will match the text immediately before the insertion index. Some control characters (U+0000-U+0008, U+000C-U+001F) and characters from the Unicode Basic Multilingual Plane Private Use Area (U+E000-U+F8FF) will be stripped out of the inserted text.
    string text?;
};

# The result of inserting an embedded Google Sheets chart.
public type InsertInlineSheetsChartResponse record {
    # The object ID of the inserted chart.
    string objectId?;
};

# The result of creating a named range.
public type CreateNamedRangeResponse record {
    # The ID of the created named range.
    string namedRangeId?;
};

# A collection of all the NamedRanges in the document that share a given name.
public type NamedRanges record {
    # The name that all the named ranges share.
    string name?;
    # The NamedRanges that share the same name.
    NamedRange[] namedRanges?;
};

# Specifies a contiguous range of text.
public type Range record {
    # The zero-based end index of this range, exclusive, in UTF-16 code units. In all current uses, an end index must be provided. This field is an Int32Value in order to accommodate future use cases with open-ended ranges.
    int endIndex?;
    # The ID of the header, footer or footnote that this range is contained in. An empty segment ID signifies the document's body.
    string segmentId?;
    # The zero-based start index of this range, in UTF-16 code units. In all current uses, a start index must be provided. This field is an Int32Value in order to accommodate future use cases with open-ended ranges.
    int startIndex?;
};

# An object that appears inline with text. An InlineObject contains an EmbeddedObject such as an image.
public type InlineObject record {
    # Properties of an InlineObject.
    InlineObjectProperties inlineObjectProperties?;
    # The ID of this inline object.
    string objectId?;
    # The suggested deletion IDs. If empty, then there are no suggested deletions of this content.
    string[] suggestedDeletionIds?;
    # The suggested changes to the inline object properties, keyed by suggestion ID.
    record {} suggestedInlineObjectPropertiesChanges?;
    # The suggested insertion ID. If empty, then this is not a suggested insertion.
    string suggestedInsertionId?;
};

# A reference to a linked chart embedded from Google Sheets.
public type SheetsChartReference record {
    # The ID of the specific chart in the Google Sheets spreadsheet that is embedded.
    int chartId?;
    # The ID of the Google Sheets spreadsheet that contains the source chart.
    string spreadsheetId?;
};

# Properties that apply to a section's column.
public type SectionColumnProperties record {
    # A magnitude in a single direction in the specified units.
    Dimension paddingEnd?;
    # A magnitude in a single direction in the specified units.
    Dimension width?;
};

# Creates a NamedRange referencing the given range.
public type CreateNamedRangeRequest record {
    # The name of the NamedRange. Names do not need to be unique. Names must be at least 1 character and no more than 256 characters, measured in UTF-16 code units.
    string name?;
    # Specifies a contiguous range of text.
    Range range?;
};

# The style of a TableCell. Inherited table cell styles are represented as unset fields in this message. A table cell style can inherit from the table's style.
public type TableCellStyle record {
    # A color that can either be fully opaque or fully transparent.
    OptionalColor backgroundColor?;
    # A border around a table cell. Table cell borders cannot be transparent. To hide a table cell border, make its width 0.
    TableCellBorder borderBottom?;
    # A border around a table cell. Table cell borders cannot be transparent. To hide a table cell border, make its width 0.
    TableCellBorder borderLeft?;
    # A border around a table cell. Table cell borders cannot be transparent. To hide a table cell border, make its width 0.
    TableCellBorder borderRight?;
    # A border around a table cell. Table cell borders cannot be transparent. To hide a table cell border, make its width 0.
    TableCellBorder borderTop?;
    # The column span of the cell. This property is read-only.
    int columnSpan?;
    # The alignment of the content in the table cell. The default alignment matches the alignment for newly created table cells in the Docs editor.
    string contentAlignment?;
    # A magnitude in a single direction in the specified units.
    Dimension paddingBottom?;
    # A magnitude in a single direction in the specified units.
    Dimension paddingLeft?;
    # A magnitude in a single direction in the specified units.
    Dimension paddingRight?;
    # A magnitude in a single direction in the specified units.
    Dimension paddingTop?;
    # The row span of the cell. This property is read-only.
    int rowSpan?;
};

# Response message from a BatchUpdateDocument request.
public type BatchUpdateDocumentResponse record {
    # The ID of the document to which the updates were applied to.
    string documentId?;
    # The reply of the updates. This maps 1:1 with the updates, although replies to some requests may be empty.
    Response[] replies?;
    # Provides control over how write requests are executed.
    WriteControl writeControl?;
};

# A mask that indicates which of the fields on the base TableCellStyle have been changed in this suggestion. For any field set to true, there is a new suggested value.
public type TableCellStyleSuggestionState record {
    # Indicates if there was a suggested change to background_color.
    boolean backgroundColorSuggested?;
    # Indicates if there was a suggested change to border_bottom.
    boolean borderBottomSuggested?;
    # Indicates if there was a suggested change to border_left.
    boolean borderLeftSuggested?;
    # Indicates if there was a suggested change to border_right.
    boolean borderRightSuggested?;
    # Indicates if there was a suggested change to border_top.
    boolean borderTopSuggested?;
    # Indicates if there was a suggested change to column_span.
    boolean columnSpanSuggested?;
    # Indicates if there was a suggested change to content_alignment.
    boolean contentAlignmentSuggested?;
    # Indicates if there was a suggested change to padding_bottom.
    boolean paddingBottomSuggested?;
    # Indicates if there was a suggested change to padding_left.
    boolean paddingLeftSuggested?;
    # Indicates if there was a suggested change to padding_right.
    boolean paddingRightSuggested?;
    # Indicates if there was a suggested change to padding_top.
    boolean paddingTopSuggested?;
    # Indicates if there was a suggested change to row_span.
    boolean rowSpanSuggested?;
};

# A ParagraphElement that contains an InlineObject.
public type InlineObjectElement record {
    # The ID of the InlineObject this element contains.
    string inlineObjectId?;
    # The suggested deletion IDs. If empty, then there are no suggested deletions of this content.
    string[] suggestedDeletionIds?;
    # The suggested insertion IDs. An InlineObjectElement may have multiple insertion IDs if it is a nested suggested change. If empty, then this is not a suggested insertion.
    string[] suggestedInsertionIds?;
    # The suggested text style changes to this InlineObject, keyed by suggestion ID.
    record {} suggestedTextStyleChanges?;
    # Represents the styling that can be applied to text. Inherited text styles are represented as unset fields in this message. A text style's parent depends on where the text style is defined: * The TextStyle of text in a Paragraph inherits from the paragraph's corresponding named style type. * The TextStyle on a named style inherits from the normal text named style. * The TextStyle of the normal text named style inherits from the default text style in the Docs editor. * The TextStyle on a Paragraph element that is contained in a table may inherit its text style from the table style. If the text style does not inherit from a parent, unsetting fields will revert the style to a value matching the defaults in the Docs editor.
    TextStyle textStyle?;
};

# A suggested change to the NamedStyles.
public type SuggestedNamedStyles record {
    # The named styles. Paragraphs in the document can inherit their TextStyle and ParagraphStyle from these named styles.
    NamedStyles namedStyles?;
    # The suggestion state of a NamedStyles message.
    NamedStylesSuggestionState namedStylesSuggestionState?;
};

# The properties of an embedded drawing.
public type EmbeddedDrawingProperties record {
};

# The result of creating a footer.
public type CreateFooterResponse record {
    # The ID of the created footer.
    string footerId?;
};

# An object that is tethered to a Paragraph and positioned relative to the beginning of the paragraph. A PositionedObject contains an EmbeddedObject such as an image.
public type PositionedObject record {
    # The ID of this positioned object.
    string objectId?;
    # Properties of a PositionedObject.
    PositionedObjectProperties positionedObjectProperties?;
    # The suggested deletion IDs. If empty, then there are no suggested deletions of this content.
    string[] suggestedDeletionIds?;
    # The suggested insertion ID. If empty, then this is not a suggested insertion.
    string suggestedInsertionId?;
    # The suggested changes to the positioned object properties, keyed by suggestion ID.
    record {} suggestedPositionedObjectPropertiesChanges?;
};

# A StructuralElement representing a section break. A section is a range of content which has the same SectionStyle. A section break represents the start of a new section, and the section style applies to the section after the section break. The document body always begins with a section break.
public type SectionBreak record {
    # The styling that applies to a section.
    SectionStyle sectionStyle?;
    # The suggested deletion IDs. If empty, then there are no suggested deletions of this content.
    string[] suggestedDeletionIds?;
    # The suggested insertion IDs. A SectionBreak may have multiple insertion IDs if it is a nested suggested change. If empty, then this is not a suggested insertion.
    string[] suggestedInsertionIds?;
};

# The contents and style of a cell in a Table.
public type TableCell record {
    # The content of the cell.
    StructuralElement[] content?;
    # The zero-based end index of this cell, exclusive, in UTF-16 code units.
    int endIndex?;
    # The zero-based start index of this cell, in UTF-16 code units.
    int startIndex?;
    # The suggested deletion IDs. If empty, then there are no suggested deletions of this content.
    string[] suggestedDeletionIds?;
    # The suggested insertion IDs. A TableCell may have multiple insertion IDs if it is a nested suggested change. If empty, then this is not a suggested insertion.
    string[] suggestedInsertionIds?;
    # The suggested changes to the table cell style, keyed by suggestion ID.
    record {} suggestedTableCellStyleChanges?;
    # The style of a TableCell. Inherited table cell styles are represented as unset fields in this message. A table cell style can inherit from the table's style.
    TableCellStyle tableCellStyle?;
};

# Deletes a NamedRange.
public type DeleteNamedRangeRequest record {
    # The name of the range(s) to delete. All named ranges with the given name will be deleted.
    string name?;
    # The ID of the named range to delete.
    string namedRangeId?;
};

# A mask that indicates which of the fields on the base EmbeddedObjectBorder have been changed in this suggestion. For any field set to true, there is a new suggested value.
public type EmbeddedObjectBorderSuggestionState record {
    # Indicates if there was a suggested change to color.
    boolean colorSuggested?;
    # Indicates if there was a suggested change to dash_style.
    boolean dashStyleSuggested?;
    # Indicates if there was a suggested change to property_state.
    boolean propertyStateSuggested?;
    # Indicates if there was a suggested change to width.
    boolean widthSuggested?;
};

# The positioning of a PositionedObject. The positioned object is positioned relative to the beginning of the Paragraph it is tethered to.
public type PositionedObjectPositioning record {
    # The layout of this positioned object.
    string layout?;
    # A magnitude in a single direction in the specified units.
    Dimension leftOffset?;
    # A magnitude in a single direction in the specified units.
    Dimension topOffset?;
};

# A border around a table cell. Table cell borders cannot be transparent. To hide a table cell border, make its width 0.
public type TableCellBorder record {
    # A color that can either be fully opaque or fully transparent.
    OptionalColor color?;
    # The dash style of the border.
    string dashStyle?;
    # A magnitude in a single direction in the specified units.
    Dimension width?;
};

# Deletes bullets from all of the paragraphs that overlap with the given range. The nesting level of each paragraph will be visually preserved by adding indent to the start of the corresponding paragraph.
public type DeleteParagraphBulletsRequest record {
    # Specifies a contiguous range of text.
    Range range?;
};

# The document body. The body typically contains the full document contents except for headers, footers and footnotes.
public type Body record {
    # The contents of the body. The indexes for the body's content begin at zero.
    StructuralElement[] content?;
};

# Styles that apply to a table.
public type TableStyle record {
    # The properties of each column. Note that in Docs, tables contain rows and rows contain cells, similar to HTML. So the properties for a row can be found on the row's table_row_style.
    TableColumnProperties[] tableColumnProperties?;
};

# A mask that indicates which of the fields on the base Bullet have been changed in this suggestion. For any field set to true, there is a new suggested value.
public type BulletSuggestionState record {
    # Indicates if there was a suggested change to the list_id.
    boolean listIdSuggested?;
    # Indicates if there was a suggested change to the nesting_level.
    boolean nestingLevelSuggested?;
    # A mask that indicates which of the fields on the base TextStyle have been changed in this suggestion. For any field set to true, there is a new suggested value.
    TextStyleSuggestionState textStyleSuggestionState?;
};

# A document footnote.
public type Footnote record {
    # The contents of the footnote. The indexes for a footnote's content begin at zero.
    StructuralElement[] content?;
    # The ID of the footnote.
    string footnoteId?;
};

# A single update to apply to a document.
public type Request record {
    # Creates a Footer. The new footer is applied to the SectionStyle at the location of the SectionBreak if specificed, otherwise it is applied to the DocumentStyle. If a footer of the specified type already exists, a 400 bad request error is returned.
    CreateFooterRequest createFooter?;
    # Creates a Footnote segment and inserts a new FootnoteReference to it at the given location. The new Footnote segment will contain a space followed by a newline character.
    CreateFootnoteRequest createFootnote?;
    # Creates a Header. The new header is applied to the SectionStyle at the location of the SectionBreak if specificed, otherwise it is applied to the DocumentStyle. If a header of the specified type already exists, a 400 bad request error is returned.
    CreateHeaderRequest createHeader?;
    # Creates a NamedRange referencing the given range.
    CreateNamedRangeRequest createNamedRange?;
    # Creates bullets for all of the paragraphs that overlap with the given range. The nesting level of each paragraph will be determined by counting leading tabs in front of each paragraph. To avoid excess space between the bullet and the corresponding paragraph, these leading tabs are removed by this request. This may change the indices of parts of the text. If the paragraph immediately before paragraphs being updated is in a list with a matching preset, the paragraphs being updated are added to that preceding list.
    CreateParagraphBulletsRequest createParagraphBullets?;
    # Deletes content from the document.
    DeleteContentRangeRequest deleteContentRange?;
    # Deletes a Footer from the document.
    DeleteFooterRequest deleteFooter?;
    # Deletes a Header from the document.
    DeleteHeaderRequest deleteHeader?;
    # Deletes a NamedRange.
    DeleteNamedRangeRequest deleteNamedRange?;
    # Deletes bullets from all of the paragraphs that overlap with the given range. The nesting level of each paragraph will be visually preserved by adding indent to the start of the corresponding paragraph.
    DeleteParagraphBulletsRequest deleteParagraphBullets?;
    # Deletes a PositionedObject from the document.
    DeletePositionedObjectRequest deletePositionedObject?;
    # Deletes a column from a table.
    DeleteTableColumnRequest deleteTableColumn?;
    # Deletes a row from a table.
    DeleteTableRowRequest deleteTableRow?;
    # Inserts an InlineObject containing an image at the given location.
    InsertInlineImageRequest insertInlineImage?;
    # Inserts a page break followed by a newline at the specified location.
    InsertPageBreakRequest insertPageBreak?;
    # Inserts a section break at the given location. A newline character will be inserted before the section break.
    InsertSectionBreakRequest insertSectionBreak?;
    # Inserts a table at the specified location. A newline character will be inserted before the inserted table.
    InsertTableRequest insertTable?;
    # Inserts an empty column into a table.
    InsertTableColumnRequest insertTableColumn?;
    # Inserts an empty row into a table.
    InsertTableRowRequest insertTableRow?;
    # Inserts text at the specified location.
    InsertTextRequest insertText?;
    # Merges cells in a Table.
    MergeTableCellsRequest mergeTableCells?;
    # Replaces all instances of text matching a criteria with replace text.
    ReplaceAllTextRequest replaceAllText?;
    # Replaces an existing image with a new image. Replacing an image removes some image effects from the existing image in order to mirror the behavior of the Docs editor.
    ReplaceImageRequest replaceImage?;
    # Replaces the contents of the specified NamedRange or NamedRanges with the given replacement content. Note that an individual NamedRange may consist of multiple discontinuous ranges. In this case, only the content in the first range will be replaced. The other ranges and their content will be deleted. In cases where replacing or deleting any ranges would result in an invalid document structure, a 400 bad request error is returned.
    ReplaceNamedRangeContentRequest replaceNamedRangeContent?;
    # Unmerges cells in a Table.
    UnmergeTableCellsRequest unmergeTableCells?;
    # Updates the DocumentStyle.
    UpdateDocumentStyleRequest updateDocumentStyle?;
    # Update the styling of all paragraphs that overlap with the given range.
    UpdateParagraphStyleRequest updateParagraphStyle?;
    # Updates the SectionStyle.
    UpdateSectionStyleRequest updateSectionStyle?;
    # Updates the style of a range of table cells.
    UpdateTableCellStyleRequest updateTableCellStyle?;
    # Updates the TableColumnProperties of columns in a table.
    UpdateTableColumnPropertiesRequest updateTableColumnProperties?;
    # Updates the TableRowStyle of rows in a table.
    UpdateTableRowStyleRequest updateTableRowStyle?;
    # Update the styling of text.
    UpdateTextStyleRequest updateTextStyle?;
};

# A ParagraphElement representing an equation.
public type Equation record {
    # The suggested deletion IDs. If empty, then there are no suggested deletions of this content.
    string[] suggestedDeletionIds?;
    # The suggested insertion IDs. A Equation may have multiple insertion IDs if it is a nested suggested change. If empty, then this is not a suggested insertion.
    string[] suggestedInsertionIds?;
};

# An embedded object in the document.
public type EmbeddedObject record {
    # The description of the embedded object. The `title` and `description` are both combined to display alt text.
    string description?;
    # The properties of an embedded drawing.
    EmbeddedDrawingProperties embeddedDrawingProperties?;
    # A border around an EmbeddedObject.
    EmbeddedObjectBorder embeddedObjectBorder?;
    # The properties of an image.
    ImageProperties imageProperties?;
    # A reference to the external linked source content.
    LinkedContentReference linkedContentReference?;
    # A magnitude in a single direction in the specified units.
    Dimension marginBottom?;
    # A magnitude in a single direction in the specified units.
    Dimension marginLeft?;
    # A magnitude in a single direction in the specified units.
    Dimension marginRight?;
    # A magnitude in a single direction in the specified units.
    Dimension marginTop?;
    # A width and height.
    Size size?;
    # The title of the embedded object. The `title` and `description` are both combined to display alt text.
    string title?;
};

# A suggestion state of a NamedStyle message.
public type NamedStyleSuggestionState record {
    # The named style type that this suggestion state corresponds to. This field is provided as a convenience for matching the NamedStyleSuggestionState with its corresponding NamedStyle.
    string namedStyleType?;
    # A mask that indicates which of the fields on the base ParagraphStyle have been changed in this suggestion. For any field set to true, there is a new suggested value.
    ParagraphStyleSuggestionState paragraphStyleSuggestionState?;
    # A mask that indicates which of the fields on the base TextStyle have been changed in this suggestion. For any field set to true, there is a new suggested value.
    TextStyleSuggestionState textStyleSuggestionState?;
};

# Request message for BatchUpdateDocument.
public type BatchUpdateDocumentRequest record {
    # A list of updates to apply to the document.
    Request[] requests?;
    # Provides control over how write requests are executed.
    WriteControl writeControl?;
};

# A mask that indicates which of the fields on the base DocumentStyle have been changed in this suggestion. For any field set to true, there is a new suggested value.
public type DocumentStyleSuggestionState record {
    # A mask that indicates which of the fields on the base Background have been changed in this suggestion. For any field set to true, the Backgound has a new suggested value.
    BackgroundSuggestionState backgroundSuggestionState?;
    # Indicates if there was a suggested change to default_footer_id.
    boolean defaultFooterIdSuggested?;
    # Indicates if there was a suggested change to default_header_id.
    boolean defaultHeaderIdSuggested?;
    # Indicates if there was a suggested change to even_page_footer_id.
    boolean evenPageFooterIdSuggested?;
    # Indicates if there was a suggested change to even_page_header_id.
    boolean evenPageHeaderIdSuggested?;
    # Indicates if there was a suggested change to first_page_footer_id.
    boolean firstPageFooterIdSuggested?;
    # Indicates if there was a suggested change to first_page_header_id.
    boolean firstPageHeaderIdSuggested?;
    # Indicates if there was a suggested change to margin_bottom.
    boolean marginBottomSuggested?;
    # Indicates if there was a suggested change to margin_footer.
    boolean marginFooterSuggested?;
    # Indicates if there was a suggested change to margin_header.
    boolean marginHeaderSuggested?;
    # Indicates if there was a suggested change to margin_left.
    boolean marginLeftSuggested?;
    # Indicates if there was a suggested change to margin_right.
    boolean marginRightSuggested?;
    # Indicates if there was a suggested change to margin_top.
    boolean marginTopSuggested?;
    # Indicates if there was a suggested change to page_number_start.
    boolean pageNumberStartSuggested?;
    # A mask that indicates which of the fields on the base Size have been changed in this suggestion. For any field set to true, the Size has a new suggested value.
    SizeSuggestionState pageSizeSuggestionState?;
    # Indicates if there was a suggested change to use_custom_header_footer_margins.
    boolean useCustomHeaderFooterMarginsSuggested?;
    # Indicates if there was a suggested change to use_even_page_header_footer.
    boolean useEvenPageHeaderFooterSuggested?;
    # Indicates if there was a suggested change to use_first_page_header_footer.
    boolean useFirstPageHeaderFooterSuggested?;
};

# The result of replacing text.
public type ReplaceAllTextResponse record {
    # The number of occurrences changed by replacing all text.
    int occurrencesChanged?;
};

# A StructuralElement representing a paragraph. A paragraph is a range of content that is terminated with a newline character.
public type Paragraph record {
    # Describes the bullet of a paragraph.
    Bullet bullet?;
    # The content of the paragraph broken down into its component parts.
    ParagraphElement[] elements?;
    # Styles that apply to a whole paragraph. Inherited paragraph styles are represented as unset fields in this message. A paragraph style's parent depends on where the paragraph style is defined: * The ParagraphStyle on a Paragraph inherits from the paragraph's corresponding named style type. * The ParagraphStyle on a named style inherits from the normal text named style. * The ParagraphStyle of the normal text named style inherits from the default paragraph style in the Docs editor. * The ParagraphStyle on a Paragraph element that is contained in a table may inherit its paragraph style from the table style. If the paragraph style does not inherit from a parent, unsetting fields will revert the style to a value matching the defaults in the Docs editor.
    ParagraphStyle paragraphStyle?;
    # The IDs of the positioned objects tethered to this paragraph.
    string[] positionedObjectIds?;
    # The suggested changes to this paragraph's bullet.
    record {} suggestedBulletChanges?;
    # The suggested paragraph style changes to this paragraph, keyed by suggestion ID.
    record {} suggestedParagraphStyleChanges?;
    # The IDs of the positioned objects that are suggested to be attached to this paragraph, keyed by suggestion ID.
    record {} suggestedPositionedObjectIds?;
};

# Merges cells in a Table.
public type MergeTableCellsRequest record {
    # A table range represents a reference to a subset of a table. It's important to note that the cells specified by a table range do not necessarily form a rectangle. For example, let's say we have a 3 x 3 table where all the cells of the last row are merged together. The table looks like this: [ ] A table range with table cell location = (table_start_location, row = 0, column = 0), row span = 3 and column span = 2 specifies the following cells: x x [ x x x ]
    TableRange tableRange?;
};

# A single response from an update.
public type Response record {
    # The result of creating a footer.
    CreateFooterResponse createFooter?;
    # The result of creating a footnote.
    CreateFootnoteResponse createFootnote?;
    # The result of creating a header.
    CreateHeaderResponse createHeader?;
    # The result of creating a named range.
    CreateNamedRangeResponse createNamedRange?;
    # The result of inserting an inline image.
    InsertInlineImageResponse insertInlineImage?;
    # The result of inserting an embedded Google Sheets chart.
    InsertInlineSheetsChartResponse insertInlineSheetsChart?;
    # The result of replacing text.
    ReplaceAllTextResponse replaceAllText?;
};

# The named styles. Paragraphs in the document can inherit their TextStyle and ParagraphStyle from these named styles.
public type NamedStyles record {
    # The named styles. There is an entry for each of the possible named style types.
    NamedStyle[] styles?;
};

# Updates the DocumentStyle.
public type UpdateDocumentStyleRequest record {
    # The style of the document.
    DocumentStyle documentStyle?;
    # The fields that should be updated. At least one field must be specified. The root `document_style` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. For example to update the background, set `fields` to `"background"`.
    string fields?;
};

# Inserts an InlineObject containing an image at the given location.
public type InsertInlineImageRequest record {
    # Location at the end of a body, header, footer or footnote. The location is immediately before the last newline in the document segment.
    EndOfSegmentLocation endOfSegmentLocation?;
    # A particular location in the document.
    Location location?;
    # A width and height.
    Size objectSize?;
    # The image URI. The image is fetched once at insertion time and a copy is stored for display inside the document. Images must be less than 50MB in size, cannot exceed 25 megapixels, and must be in one of PNG, JPEG, or GIF format. The provided URI can be at most 2 kB in length. The URI itself is saved with the image, and exposed via the ImageProperties.content_uri field.
    string uri?;
};

# A mask that indicates which of the fields on the base CropProperties have been changed in this suggestion. For any field set to true, there is a new suggested value.
public type CropPropertiesSuggestionState record {
    # Indicates if there was a suggested change to angle.
    boolean angleSuggested?;
    # Indicates if there was a suggested change to offset_bottom.
    boolean offsetBottomSuggested?;
    # Indicates if there was a suggested change to offset_left.
    boolean offsetLeftSuggested?;
    # Indicates if there was a suggested change to offset_right.
    boolean offsetRightSuggested?;
    # Indicates if there was a suggested change to offset_top.
    boolean offsetTopSuggested?;
};

# A mask that indicates which of the fields on the base ParagraphStyle have been changed in this suggestion. For any field set to true, there is a new suggested value.
public type ParagraphStyleSuggestionState record {
    # Indicates if there was a suggested change to alignment.
    boolean alignmentSuggested?;
    # Indicates if there was a suggested change to avoid_widow_and_orphan.
    boolean avoidWidowAndOrphanSuggested?;
    # Indicates if there was a suggested change to border_between.
    boolean borderBetweenSuggested?;
    # Indicates if there was a suggested change to border_bottom.
    boolean borderBottomSuggested?;
    # Indicates if there was a suggested change to border_left.
    boolean borderLeftSuggested?;
    # Indicates if there was a suggested change to border_right.
    boolean borderRightSuggested?;
    # Indicates if there was a suggested change to border_top.
    boolean borderTopSuggested?;
    # Indicates if there was a suggested change to direction.
    boolean directionSuggested?;
    # Indicates if there was a suggested change to heading_id.
    boolean headingIdSuggested?;
    # Indicates if there was a suggested change to indent_end.
    boolean indentEndSuggested?;
    # Indicates if there was a suggested change to indent_first_line.
    boolean indentFirstLineSuggested?;
    # Indicates if there was a suggested change to indent_start.
    boolean indentStartSuggested?;
    # Indicates if there was a suggested change to keep_lines_together.
    boolean keepLinesTogetherSuggested?;
    # Indicates if there was a suggested change to keep_with_next.
    boolean keepWithNextSuggested?;
    # Indicates if there was a suggested change to line_spacing.
    boolean lineSpacingSuggested?;
    # Indicates if there was a suggested change to named_style_type.
    boolean namedStyleTypeSuggested?;
    # A mask that indicates which of the fields on the base Shading have been changed in this suggested change. For any field set to true, there is a new suggested value.
    ShadingSuggestionState shadingSuggestionState?;
    # Indicates if there was a suggested change to space_above.
    boolean spaceAboveSuggested?;
    # Indicates if there was a suggested change to space_below.
    boolean spaceBelowSuggested?;
    # Indicates if there was a suggested change to spacing_mode.
    boolean spacingModeSuggested?;
};

# Location at the end of a body, header, footer or footnote. The location is immediately before the last newline in the document segment.
public type EndOfSegmentLocation record {
    # The ID of the header, footer or footnote the location is in. An empty segment ID signifies the document's body.
    string segmentId?;
};

# A mask that indicates which of the fields on the base LinkedContentReference have been changed in this suggestion. For any field set to true, there is a new suggested value.
public type LinkedContentReferenceSuggestionState record {
    # A mask that indicates which of the fields on the base SheetsChartReference have been changed in this suggestion. For any field set to true, there is a new suggested value.
    SheetsChartReferenceSuggestionState sheetsChartReferenceSuggestionState?;
};

# Properties specific to a RichLink.
public type RichLinkProperties record {
    # Output only. The [MIME type](https://developers.google.com/drive/api/v3/mime-types) of the RichLink, if there is one (i.e., when it is a file in Drive).
    string mimeType?;
    # Output only. The title of the RichLink as displayed in the link. This title matches the title of the linked resource at the time of the insertion or last update of the link. This field is always present.
    string title?;
    # Output only. The URI to the RichLink. This is always present.
    string uri?;
};

# A border around a paragraph.
public type ParagraphBorder record {
    # A color that can either be fully opaque or fully transparent.
    OptionalColor color?;
    # The dash style of the border.
    string dashStyle?;
    # A magnitude in a single direction in the specified units.
    Dimension padding?;
    # A magnitude in a single direction in the specified units.
    Dimension width?;
};

# A collection of Ranges with the same named range ID. Named ranges allow developers to associate parts of a document with an arbitrary user-defined label so their contents can be programmatically read or edited at a later time. A document can contain multiple named ranges with the same name, but every named range has a unique ID. A named range is created with a single Range, and content inserted inside a named range generally expands that range. However, certain document changes can cause the range to be split into multiple ranges. Named ranges are not private. All applications and collaborators that have access to the document can see its named ranges.
public type NamedRange record {
    # The name of the named range.
    string name?;
    # The ID of the named range.
    string namedRangeId?;
    # The ranges that belong to this named range.
    Range[] ranges?;
};

# A particular location in the document.
public type Location record {
    # The zero-based index, in UTF-16 code units. The index is relative to the beginning of the segment specified by segment_id.
    int index?;
    # The ID of the header, footer or footnote the location is in. An empty segment ID signifies the document's body.
    string segmentId?;
};

# Contains properties describing the look and feel of a list bullet at a given level of nesting.
public type NestingLevel record {
    # The alignment of the bullet within the space allotted for rendering the bullet.
    string bulletAlignment?;
    # The format string used by bullets at this level of nesting. The glyph format contains one or more placeholders, and these placeholder are replaced with the appropriate values depending on the glyph_type or glyph_symbol. The placeholders follow the pattern `%[nesting_level]`. Furthermore, placeholders can have prefixes and suffixes. Thus, the glyph format follows the pattern `%[nesting_level]`. Note that the prefix and suffix are optional and can be arbitrary strings. For example, the glyph format `%0.` indicates that the rendered glyph will replace the placeholder with the corresponding glyph for nesting level 0 followed by a period as the suffix. So a list with a glyph type of UPPER_ALPHA and glyph format `%0.` at nesting level 0 will result in a list with rendered glyphs `A.` `B.` `C.` The glyph format can contain placeholders for the current nesting level as well as placeholders for parent nesting levels. For example, a list can have a glyph format of `%0.` at nesting level 0 and a glyph format of `%0.%1.` at nesting level 1. Assuming both nesting levels have DECIMAL glyph types, this would result in a list with rendered glyphs `1.` `2.` ` 2.1.` ` 2.2.` `3.` For nesting levels that are ordered, the string that replaces a placeholder in the glyph format for a particular paragraph depends on the paragraph's order within the list.
    string glyphFormat?;
    # A custom glyph symbol used by bullets when paragraphs at this level of nesting are unordered. The glyph symbol replaces placeholders within the glyph_format. For example, if the glyph_symbol is the solid circle corresponding to Unicode U+25cf code point and the glyph_format is `%0`, the rendered glyph would be the solid circle.
    string glyphSymbol?;
    # The type of glyph used by bullets when paragraphs at this level of nesting are ordered. The glyph type determines the type of glyph used to replace placeholders within the glyph_format when paragraphs at this level of nesting are ordered. For example, if the nesting level is 0, the glyph_format is `%0.` and the glyph type is DECIMAL, then the rendered glyph would replace the placeholder `%0` in the glyph format with a number corresponding to list item's order within the list.
    string glyphType?;
    # A magnitude in a single direction in the specified units.
    Dimension indentFirstLine?;
    # A magnitude in a single direction in the specified units.
    Dimension indentStart?;
    # The number of the first list item at this nesting level. A value of 0 is treated as a value of 1 for lettered lists and roman numeraled lists, i.e. for values of both 0 and 1, lettered and roman numeraled lists will begin at `a` and `i` respectively. This value is ignored for nesting levels with unordered glyphs.
    int startNumber?;
    # Represents the styling that can be applied to text. Inherited text styles are represented as unset fields in this message. A text style's parent depends on where the text style is defined: * The TextStyle of text in a Paragraph inherits from the paragraph's corresponding named style type. * The TextStyle on a named style inherits from the normal text named style. * The TextStyle of the normal text named style inherits from the default text style in the Docs editor. * The TextStyle on a Paragraph element that is contained in a table may inherit its text style from the table style. If the text style does not inherit from a parent, unsetting fields will revert the style to a value matching the defaults in the Docs editor.
    TextStyle textStyle?;
};
