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
    # A themeable solid color value.
    OpaqueColor opaqueColor?;
};

# The properties of the Page. The page will inherit properties from the parent page. Depending on the page type the hierarchy is defined in either SlideProperties or LayoutProperties.
public type PageProperties record {
    # The palette of predefined colors for a page.
    ColorScheme colorScheme?;
    # The page background fill.
    PageBackgroundFill pageBackgroundFill?;
};

# A location of a single table cell within a table.
public type TableCellLocation record {
    # The 0-based column index.
    int columnIndex?;
    # The 0-based row index.
    int rowIndex?;
};

# A width and height.
public type Size record {
    # A magnitude in a single direction in the specified units.
    Dimension height?;
    # A magnitude in a single direction in the specified units.
    Dimension width?;
};

# A TextElement kind that represents auto text.
public type AutoText record {
    # The rendered content of this auto text, if available.
    string content?;
    # Represents the styling that can be applied to a TextRun. If this text is contained in a shape with a parent placeholder, then these text styles may be inherited from the parent. Which text styles are inherited depend on the nesting level of lists: * A text run in a paragraph that is not in a list will inherit its text style from the the newline character in the paragraph at the 0 nesting level of the list inside the parent placeholder. * A text run in a paragraph that is in a list will inherit its text style from the newline character in the paragraph at its corresponding nesting level of the list inside the parent placeholder. Inherited text styles are represented as unset fields in this message. If text is contained in a shape without a parent placeholder, unsetting these fields will revert the style to a value matching the defaults in the Slides editor.
    TextStyle style?;
    # The type of this auto text.
    string 'type?;
};

# A criteria that matches a specific string of text in a shape or table.
public type SubstringMatchCriteria record {
    # Indicates whether the search should respect case: - `True`: the search is case sensitive. - `False`: the search is case insensitive.
    boolean matchCase?;
    # The text to search for in the shape or table.
    string text?;
};

# Styles that apply to a whole paragraph. If this text is contained in a shape with a parent placeholder, then these paragraph styles may be inherited from the parent. Which paragraph styles are inherited depend on the nesting level of lists: * A paragraph not in a list will inherit its paragraph style from the paragraph at the 0 nesting level of the list inside the parent placeholder. * A paragraph in a list will inherit its paragraph style from the paragraph at its corresponding nesting level of the list inside the parent placeholder. Inherited paragraph styles are represented as unset fields in this message.
public type ParagraphStyle record {
    # The text alignment for this paragraph.
    string alignment?;
    # The text direction of this paragraph. If unset, the value defaults to LEFT_TO_RIGHT since text direction is not inherited.
    string direction?;
    # A magnitude in a single direction in the specified units.
    Dimension indentEnd?;
    # A magnitude in a single direction in the specified units.
    Dimension indentFirstLine?;
    # A magnitude in a single direction in the specified units.
    Dimension indentStart?;
    # The amount of space between lines, as a percentage of normal, where normal is represented as 100.0. If unset, the value is inherited from the parent.
    float lineSpacing?;
    # A magnitude in a single direction in the specified units.
    Dimension spaceAbove?;
    # A magnitude in a single direction in the specified units.
    Dimension spaceBelow?;
    # The spacing mode for the paragraph.
    string spacingMode?;
};

# A PageElement kind representing an image.
public type Image record {
    # An URL to an image with a default lifetime of 30 minutes. This URL is tagged with the account of the requester. Anyone with the URL effectively accesses the image as the original requester. Access to the image may be lost if the presentation's sharing settings change.
    string contentUrl?;
    # The properties of the Image.
    ImageProperties imageProperties?;
    # The source URL is the URL used to insert the image. The source URL can be empty.
    string sourceUrl?;
};

# The thumbnail of a page.
public type Thumbnail record {
    # The content URL of the thumbnail image. The URL to the image has a default lifetime of 30 minutes. This URL is tagged with the account of the requester. Anyone with the URL effectively accesses the image as the original requester. Access to the image may be lost if the presentation's sharing settings change. The mime type of the thumbnail image is the same as specified in the `GetPageThumbnailRequest`.
    string contentUrl?;
    # The positive height in pixels of the thumbnail image.
    int height?;
    # The positive width in pixels of the thumbnail image.
    int width?;
};

# Deletes text from a shape or a table cell.
public type DeleteTextRequest record {
    # A location of a single table cell within a table.
    TableCellLocation cellLocation?;
    # The object ID of the shape or table from which the text will be deleted.
    string objectId?;
    # Specifies a contiguous range of an indexed collection, such as characters in text.
    Range textRange?;
};

# The properties of each border cell.
public type TableBorderCell record {
    # A location of a single table cell within a table.
    TableCellLocation location?;
    # The border styling properties of the TableBorderCell.
    TableBorderProperties tableBorderProperties?;
};

# The result of creating a video.
public type CreateVideoResponse record {
    # The object ID of the created video.
    string objectId?;
};

# The properties of Page that are only relevant for pages with page_type SLIDE.
public type SlideProperties record {
    # Whether the slide is skipped in the presentation mode. Defaults to false.
    boolean isSkipped?;
    # The object ID of the layout that this slide is based on. This property is read-only.
    string layoutObjectId?;
    # The object ID of the master that this slide is based on. This property is read-only.
    string masterObjectId?;
    # A page in a presentation.
    Page notesPage?;
};

# The result of creating a slide.
public type CreateSlideResponse record {
    # The object ID of the created slide.
    string objectId?;
};

# Updates the styling for all of the paragraphs within a Shape or Table that overlap with the given text index range.
public type UpdateParagraphStyleRequest record {
    # A location of a single table cell within a table.
    TableCellLocation cellLocation?;
    # The fields that should be updated. At least one field must be specified. The root `style` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. For example, to update the paragraph alignment, set `fields` to `"alignment"`. To reset a property to its default value, include its field name in the field mask but leave the field itself unset.
    string fields?;
    # The object ID of the shape or table with the text to be styled.
    string objectId?;
    # Styles that apply to a whole paragraph. If this text is contained in a shape with a parent placeholder, then these paragraph styles may be inherited from the parent. Which paragraph styles are inherited depend on the nesting level of lists: * A paragraph not in a list will inherit its paragraph style from the paragraph at the 0 nesting level of the list inside the parent placeholder. * A paragraph in a list will inherit its paragraph style from the paragraph at its corresponding nesting level of the list inside the parent placeholder. Inherited paragraph styles are represented as unset fields in this message.
    ParagraphStyle style?;
    # Specifies a contiguous range of an indexed collection, such as characters in text.
    Range textRange?;
};

# Groups objects to create an object group. For example, groups PageElements to create a Group on the same page as all the children.
public type GroupObjectsRequest record {
    # The object IDs of the objects to group. Only page elements can be grouped. There should be at least two page elements on the same page that are not already in another group. Some page elements, such as videos, tables and placeholders cannot be grouped.
    string[] childrenObjectIds?;
    # A user-supplied object ID for the group to be created. If you specify an ID, it must be unique among all pages and page elements in the presentation. The ID must start with an alphanumeric character or an underscore (matches regex `[a-zA-Z0-9_]`); remaining characters may include those as well as a hyphen or colon (matches regex `[a-zA-Z0-9_-:]`). The length of the ID must not be less than 5 or greater than 50. If you don't specify an ID, a unique one is generated.
    string groupObjectId?;
};

# Contents of each border row in a table.
public type TableBorderRow record {
    # Properties of each border cell. When a border's adjacent table cells are merged, it is not included in the response.
    TableBorderCell[] tableBorderCells?;
};

# The fill of the line.
public type LineFill record {
    # A solid color fill. The page or page element is filled entirely with the specified color value. If any field is unset, its value may be inherited from a parent placeholder if it exists.
    SolidFill solidFill?;
};

# The crop properties of an object enclosed in a container. For example, an Image. The crop properties is represented by the offsets of four edges which define a crop rectangle. The offsets are measured in percentage from the corresponding edges of the object's original bounding rectangle towards inside, relative to the object's original dimensions. - If the offset is in the interval (0, 1), the corresponding edge of crop rectangle is positioned inside of the object's original bounding rectangle. - If the offset is negative or greater than 1, the corresponding edge of crop rectangle is positioned outside of the object's original bounding rectangle. - If the left edge of the crop rectangle is on the right side of its right edge, the object will be flipped horizontally. - If the top edge of the crop rectangle is below its bottom edge, the object will be flipped vertically. - If all offsets and rotation angle is 0, the object is not cropped. After cropping, the content in the crop rectangle will be stretched to fit its container.
public type CropProperties record {
    # The rotation angle of the crop window around its center, in radians. Rotation angle is applied after the offset.
    float angle?;
    # The offset specifies the bottom edge of the crop rectangle that is located above the original bounding rectangle bottom edge, relative to the object's original height.
    float bottomOffset?;
    # The offset specifies the left edge of the crop rectangle that is located to the right of the original bounding rectangle left edge, relative to the object's original width.
    float leftOffset?;
    # The offset specifies the right edge of the crop rectangle that is located to the left of the original bounding rectangle right edge, relative to the object's original width.
    float rightOffset?;
    # The offset specifies the top edge of the crop rectangle that is located below the original bounding rectangle top edge, relative to the object's original height.
    float topOffset?;
};

# Creates a new table.
public type CreateTableRequest record {
    # Number of columns in the table.
    int columns?;
    # Common properties for a page element. Note: When you initially create a PageElement, the API may modify the values of both `size` and `transform`, but the visual size will be unchanged.
    PageElementProperties elementProperties?;
    # A user-supplied object ID. If you specify an ID, it must be unique among all pages and page elements in the presentation. The ID must start with an alphanumeric character or an underscore (matches regex `[a-zA-Z0-9_]`); remaining characters may include those as well as a hyphen or colon (matches regex `[a-zA-Z0-9_-:]`). The length of the ID must not be less than 5 or greater than 50. If you don't specify an ID, a unique one is generated.
    string objectId?;
    # Number of rows in the table.
    int rows?;
};

# Slide layout reference. This may reference either: - A predefined layout - One of the layouts in the presentation.
public type LayoutReference record {
    # Layout ID: the object ID of one of the layouts in the presentation.
    string layoutId?;
    # Predefined layout.
    string predefinedLayout?;
};

# Updates the properties of the table borders in a Table.
public type UpdateTableBorderPropertiesRequest record {
    # The border position in the table range the updates should apply to. If a border position is not specified, the updates will apply to all borders in the table range.
    string borderPosition?;
    # The fields that should be updated. At least one field must be specified. The root `tableBorderProperties` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. For example to update the table border solid fill color, set `fields` to `"tableBorderFill.solidFill.color"`. To reset a property to its default value, include its field name in the field mask but leave the field itself unset.
    string fields?;
    # The object ID of the table.
    string objectId?;
    # The border styling properties of the TableBorderCell.
    TableBorderProperties tableBorderProperties?;
    # A table range represents a reference to a subset of a table. It's important to note that the cells specified by a table range do not necessarily form a rectangle. For example, let's say we have a 3 x 3 table where all the cells of the last row are merged together. The table looks like this: [ ] A table range with location = (0, 0), row span = 3 and column span = 2 specifies the following cells: x x [ x x x ]
    TableRange tableRange?;
};

# Replaces all shapes that match the given criteria with the provided Google Sheets chart. The chart will be scaled and centered to fit within the bounds of the original shape. NOTE: Replacing shapes with a chart requires at least one of the spreadsheets.readonly, spreadsheets, drive.readonly, or drive OAuth scopes.
public type ReplaceAllShapesWithSheetsChartRequest record {
    # The ID of the specific chart in the Google Sheets spreadsheet.
    int chartId?;
    # A criteria that matches a specific string of text in a shape or table.
    SubstringMatchCriteria containsText?;
    # The mode with which the chart is linked to the source spreadsheet. When not specified, the chart will be an image that is not linked.
    string linkingMode?;
    # If non-empty, limits the matches to page elements only on the given pages. Returns a 400 bad request error if given the page object ID of a notes page or a notes master, or if a page with that object ID doesn't exist in the presentation.
    string[] pageObjectIds?;
    # The ID of the Google Sheets spreadsheet that contains the chart.
    string spreadsheetId?;
};

# The shape background fill.
public type ShapeBackgroundFill record {
    # The background fill property state. Updating the fill on a shape will implicitly update this field to `RENDERED`, unless another value is specified in the same request. To have no fill on a shape, set this field to `NOT_RENDERED`. In this case, any other fill fields set in the same request will be ignored.
    string propertyState?;
    # A solid color fill. The page or page element is filled entirely with the specified color value. If any field is unset, its value may be inherited from a parent placeholder if it exists.
    SolidFill solidFill?;
};

# Inserts columns into a table. Other columns in the table will be resized to fit the new column.
public type InsertTableColumnsRequest record {
    # A location of a single table cell within a table.
    TableCellLocation cellLocation?;
    # Whether to insert new columns to the right of the reference cell location. - `True`: insert to the right. - `False`: insert to the left.
    boolean insertRight?;
    # The number of columns to be inserted. Maximum 20 per request.
    int number?;
    # The table to insert columns into.
    string tableObjectId?;
};

# A PageElement kind representing a non-connector line, straight connector, curved connector, or bent connector.
public type Line record {
    # The category of the line. It matches the `category` specified in CreateLineRequest, and can be updated with UpdateLineCategoryRequest.
    string lineCategory?;
    # The properties of the Line. When unset, these fields default to values that match the appearance of new lines created in the Slides editor.
    LineProperties lineProperties?;
    # The type of the line.
    string lineType?;
};

# Replaces an existing image with a new image. Replacing an image removes some image effects from the existing image.
public type ReplaceImageRequest record {
    # The ID of the existing image that will be replaced.
    string imageObjectId?;
    # The replacement method.
    string imageReplaceMethod?;
    # The image URL. The image is fetched once at insertion time and a copy is stored for display inside the presentation. Images must be less than 50MB in size, cannot exceed 25 megapixels, and must be in one of PNG, JPEG, or GIF format. The provided URL can be at most 2 kB in length. The URL itself is saved with the image, and exposed via the Image.source_url field.
    string url?;
};

# Reroutes a line such that it's connected at the two closest connection sites on the connected page elements.
public type RerouteLineRequest record {
    # The object ID of the line to reroute. Only a line with a category indicating it is a "connector" can be rerouted. The start and end connections of the line must be on different page elements.
    string objectId?;
};

# Update the properties of a Shape.
public type UpdateShapePropertiesRequest record {
    # The fields that should be updated. At least one field must be specified. The root `shapeProperties` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. For example to update the shape background solid fill color, set `fields` to `"shapeBackgroundFill.solidFill.color"`. To reset a property to its default value, include its field name in the field mask but leave the field itself unset.
    string fields?;
    # The object ID of the shape the updates are applied to.
    string objectId?;
    # The properties of a Shape. If the shape is a placeholder shape as determined by the placeholder field, then these properties may be inherited from a parent placeholder shape. Determining the rendered value of the property depends on the corresponding property_state field value. Any text autofit settings on the shape are automatically deactivated by requests that can impact how text fits in the shape.
    ShapeProperties shapeProperties?;
};

# The properties of the Image.
public type ImageProperties record {
    # The brightness effect of the image. The value should be in the interval [-1.0, 1.0], where 0 means no effect. This property is read-only.
    float brightness?;
    # The contrast effect of the image. The value should be in the interval [-1.0, 1.0], where 0 means no effect. This property is read-only.
    float contrast?;
    # The crop properties of an object enclosed in a container. For example, an Image. The crop properties is represented by the offsets of four edges which define a crop rectangle. The offsets are measured in percentage from the corresponding edges of the object's original bounding rectangle towards inside, relative to the object's original dimensions. - If the offset is in the interval (0, 1), the corresponding edge of crop rectangle is positioned inside of the object's original bounding rectangle. - If the offset is negative or greater than 1, the corresponding edge of crop rectangle is positioned outside of the object's original bounding rectangle. - If the left edge of the crop rectangle is on the right side of its right edge, the object will be flipped horizontally. - If the top edge of the crop rectangle is below its bottom edge, the object will be flipped vertically. - If all offsets and rotation angle is 0, the object is not cropped. After cropping, the content in the crop rectangle will be stretched to fit its container.
    CropProperties cropProperties?;
    # A hypertext link.
    Link link?;
    # The outline of a PageElement. If these fields are unset, they may be inherited from a parent placeholder if it exists. If there is no parent, the fields will default to the value used for new page elements created in the Slides editor, which may depend on the page element kind.
    Outline outline?;
    # A recolor effect applied on an image.
    Recolor recolor?;
    # The shadow properties of a page element. If these fields are unset, they may be inherited from a parent placeholder if it exists. If there is no parent, the fields will default to the value used for new page elements created in the Slides editor, which may depend on the page element kind.
    Shadow shadow?;
    # The transparency effect of the image. The value should be in the interval [0.0, 1.0], where 0 means no effect and 1 means completely transparent. This property is read-only.
    float transparency?;
};

# Properties and contents of each row in a table.
public type TableRow record {
    # A magnitude in a single direction in the specified units.
    Dimension rowHeight?;
    # Properties and contents of each cell. Cells that span multiple columns are represented only once with a column_span greater than 1. As a result, the length of this collection does not always match the number of columns of the entire table.
    TableCell[] tableCells?;
    # Properties of each row in a table.
    TableRowProperties tableRowProperties?;
};

# AffineTransform uses a 3x3 matrix with an implied last row of [ 0 0 1 ] to transform source coordinates (x,y) into destination coordinates (x', y') according to: x' x = shear_y scale_y translate_y 1 [ 1 ] After transformation, x' = scale_x * x + shear_x * y + translate_x; y' = scale_y * y + shear_y * x + translate_y; This message is therefore composed of these six matrix elements.
public type AffineTransform record {
    # The X coordinate scaling element.
    decimal scaleX?;
    # The Y coordinate scaling element.
    decimal scaleY?;
    # The X coordinate shearing element.
    decimal shearX?;
    # The Y coordinate shearing element.
    decimal shearY?;
    # The X coordinate translation element.
    decimal translateX?;
    # The Y coordinate translation element.
    decimal translateY?;
    # The units for translate elements.
    string unit?;
};

# The fill of the outline.
public type OutlineFill record {
    # A solid color fill. The page or page element is filled entirely with the specified color value. If any field is unset, its value may be inherited from a parent placeholder if it exists.
    SolidFill solidFill?;
};

# The result of replacing shapes with a Google Sheets chart.
public type ReplaceAllShapesWithSheetsChartResponse record {
    # The number of shapes replaced with charts.
    int occurrencesChanged?;
};

# A hypertext link.
public type Link record {
    # If set, indicates this is a link to the specific page in this presentation with this ID. A page with this ID may not exist.
    string pageObjectId?;
    # If set, indicates this is a link to a slide in this presentation, addressed by its position.
    string relativeLink?;
    # If set, indicates this is a link to the slide at this zero-based index in the presentation. There may not be a slide at this index.
    int slideIndex?;
    # If set, indicates this is a link to the external web page at this URL.
    string url?;
};

# A PageElement kind representing a joined collection of PageElements.
public type Group record {
    # The collection of elements in the group. The minimum size of a group is 2.
    PageElement[] children?;
};

# The placeholder information that uniquely identifies a placeholder shape.
public type Placeholder record {
    # The index of the placeholder. If the same placeholder types are present in the same page, they would have different index values.
    int index?;
    # The object ID of this shape's parent placeholder. If unset, the parent placeholder shape does not exist, so the shape does not inherit properties from any other shape.
    string parentObjectId?;
    # The type of the placeholder.
    string 'type?;
};

# Represents a font family and weight used to style a TextRun.
public type WeightedFontFamily record {
    # The font family of the text. The font family can be any font from the Font menu in Slides or from [Google Fonts] (https://fonts.google.com/). If the font name is unrecognized, the text is rendered in `Arial`.
    string fontFamily?;
    # The rendered weight of the text. This field can have any value that is a multiple of `100` between `100` and `900`, inclusive. This range corresponds to the numerical values described in the CSS 2.1 Specification, [section 15.6](https://www.w3.org/TR/CSS21/fonts.html#font-boldness), with non-numerical values disallowed. Weights greater than or equal to `700` are considered bold, and weights less than `700`are not bold. The default value is `400` ("normal").
    int weight?;
};

# Unmerges cells in a Table.
public type UnmergeTableCellsRequest record {
    # The object ID of the table.
    string objectId?;
    # A table range represents a reference to a subset of a table. It's important to note that the cells specified by a table range do not necessarily form a rectangle. For example, let's say we have a 3 x 3 table where all the cells of the last row are merged together. The table looks like this: [ ] A table range with location = (0, 0), row span = 3 and column span = 2 specifies the following cells: x x [ x x x ]
    TableRange tableRange?;
};

# A PageElement kind representing a generic shape that does not have a more specific classification.
public type Shape record {
    # The placeholder information that uniquely identifies a placeholder shape.
    Placeholder placeholder?;
    # The properties of a Shape. If the shape is a placeholder shape as determined by the placeholder field, then these properties may be inherited from a parent placeholder shape. Determining the rendered value of the property depends on the corresponding property_state field value. Any text autofit settings on the shape are automatically deactivated by requests that can impact how text fits in the shape.
    ShapeProperties shapeProperties?;
    # The type of the shape.
    string shapeType?;
    # The general text content. The text must reside in a compatible shape (e.g. text box or rectangle) or a table cell in a page.
    TextContent text?;
};

# Ungroups objects, such as groups.
public type UngroupObjectsRequest record {
    # The object IDs of the objects to ungroup. Only groups that are not inside other groups can be ungrouped. All the groups should be on the same page. The group itself is deleted. The visual sizes and positions of all the children are preserved.
    string[] objectIds?;
};

# The response of duplicating an object.
public type DuplicateObjectResponse record {
    # The ID of the new duplicate object.
    string objectId?;
};

# A table range represents a reference to a subset of a table. It's important to note that the cells specified by a table range do not necessarily form a rectangle. For example, let's say we have a 3 x 3 table where all the cells of the last row are merged together. The table looks like this: [ ] A table range with location = (0, 0), row span = 3 and column span = 2 specifies the following cells: x x [ x x x ]
public type TableRange record {
    # The column span of the table range.
    int columnSpan?;
    # A location of a single table cell within a table.
    TableCellLocation location?;
    # The row span of the table range.
    int rowSpan?;
};

# Deletes a row from a table.
public type DeleteTableRowRequest record {
    # A location of a single table cell within a table.
    TableCellLocation cellLocation?;
    # The table to delete rows from.
    string tableObjectId?;
};

# A TextElement kind that represents a run of text that all has the same styling.
public type TextRun record {
    # The text of this run.
    string content?;
    # Represents the styling that can be applied to a TextRun. If this text is contained in a shape with a parent placeholder, then these text styles may be inherited from the parent. Which text styles are inherited depend on the nesting level of lists: * A text run in a paragraph that is not in a list will inherit its text style from the the newline character in the paragraph at the 0 nesting level of the list inside the parent placeholder. * A text run in a paragraph that is in a list will inherit its text style from the newline character in the paragraph at its corresponding nesting level of the list inside the parent placeholder. Inherited text styles are represented as unset fields in this message. If text is contained in a shape without a parent placeholder, unsetting these fields will revert the style to a value matching the defaults in the Slides editor.
    TextStyle style?;
};

# A recolor effect applied on an image.
public type Recolor record {
    # The name of the recolor effect. The name is determined from the `recolor_stops` by matching the gradient against the colors in the page's current color scheme. This property is read-only.
    string name?;
    # The recolor effect is represented by a gradient, which is a list of color stops. The colors in the gradient will replace the corresponding colors at the same position in the color palette and apply to the image. This property is read-only.
    ColorStop[] recolorStops?;
};

# The autofit properties of a Shape.
public type Autofit record {
    # The autofit type of the shape. If the autofit type is AUTOFIT_TYPE_UNSPECIFIED, the autofit type is inherited from a parent placeholder if it exists. The field is automatically set to NONE if a request is made that might affect text fitting within its bounding text box. In this case the font_scale is applied to the font_size and the line_spacing_reduction is applied to the line_spacing. Both properties are also reset to default values.
    string autofitType?;
    # The font scale applied to the shape. For shapes with autofit_type NONE or SHAPE_AUTOFIT, this value is the default value of 1. For TEXT_AUTOFIT, this value multiplied by the font_size gives the font size that is rendered in the editor. This property is read-only.
    float fontScale?;
    # The line spacing reduction applied to the shape. For shapes with autofit_type NONE or SHAPE_AUTOFIT, this value is the default value of 0. For TEXT_AUTOFIT, this value subtracted from the line_spacing gives the line spacing that is rendered in the editor. This property is read-only.
    float lineSpacingReduction?;
};

# Deletes an object, either pages or page elements, from the presentation.
public type DeleteObjectRequest record {
    # The object ID of the page or page element to delete. If after a delete operation a group contains only 1 or no page elements, the group is also deleted. If a placeholder is deleted on a layout, any empty inheriting placeholders are also deleted.
    string objectId?;
};

# Inserts rows into a table.
public type InsertTableRowsRequest record {
    # A location of a single table cell within a table.
    TableCellLocation cellLocation?;
    # Whether to insert new rows below the reference cell location. - `True`: insert below the cell. - `False`: insert above the cell.
    boolean insertBelow?;
    # The number of rows to be inserted. Maximum 20 per request.
    int number?;
    # The table to insert rows into.
    string tableObjectId?;
};

# The properties of the Video.
public type VideoProperties record {
    # Whether to enable video autoplay when the page is displayed in present mode. Defaults to false.
    boolean autoPlay?;
    # The time at which to end playback, measured in seconds from the beginning of the video. If set, the end time should be after the start time. If not set or if you set this to a value that exceeds the video's length, the video will be played until its end.
    int end?;
    # Whether to mute the audio during video playback. Defaults to false.
    boolean mute?;
    # The outline of a PageElement. If these fields are unset, they may be inherited from a parent placeholder if it exists. If there is no parent, the fields will default to the value used for new page elements created in the Slides editor, which may depend on the page element kind.
    Outline outline?;
    # The time at which to start playback, measured in seconds from the beginning of the video. If set, the start time should be before the end time. If you set this to a value that exceeds the video's length in seconds, the video will be played from the last second. If not set, the video will be played from the beginning.
    int 'start?;
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

# The result of creating a table.
public type CreateTableResponse record {
    # The object ID of the created table.
    string objectId?;
};

# Updates the position of slides in the presentation.
public type UpdateSlidesPositionRequest record {
    # The index where the slides should be inserted, based on the slide arrangement before the move takes place. Must be between zero and the number of slides in the presentation, inclusive.
    int insertionIndex?;
    # The IDs of the slides in the presentation that should be moved. The slides in this list must be in existing presentation order, without duplicates.
    string[] slideObjectIds?;
};

# Updates the properties of a Slide.
public type UpdateSlidePropertiesRequest record {
    # The fields that should be updated. At least one field must be specified. The root 'slideProperties' is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. For example to update whether a slide is skipped, set `fields` to `"isSkipped"`. To reset a property to its default value, include its field name in the field mask but leave the field itself unset.
    string fields?;
    # The object ID of the slide the update is applied to.
    string objectId?;
    # The properties of Page that are only relevant for pages with page_type SLIDE.
    SlideProperties slideProperties?;
};

# Updates the properties of a Table column.
public type UpdateTableColumnPropertiesRequest record {
    # The list of zero-based indices specifying which columns to update. If no indices are provided, all columns in the table will be updated.
    int[] columnIndices?;
    # The fields that should be updated. At least one field must be specified. The root `tableColumnProperties` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. For example to update the column width, set `fields` to `"column_width"`. If '"column_width"' is included in the field mask but the property is left unset, the column width will default to 406,400 EMU (32 points).
    string fields?;
    # The object ID of the table.
    string objectId?;
    # Properties of each column in a table.
    TableColumnProperties tableColumnProperties?;
};

# Update the styling of text in a Shape or Table.
public type UpdateTextStyleRequest record {
    # A location of a single table cell within a table.
    TableCellLocation cellLocation?;
    # The fields that should be updated. At least one field must be specified. The root `style` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. For example, to update the text style to bold, set `fields` to `"bold"`. To reset a property to its default value, include its field name in the field mask but leave the field itself unset.
    string fields?;
    # The object ID of the shape or table with the text to be styled.
    string objectId?;
    # Represents the styling that can be applied to a TextRun. If this text is contained in a shape with a parent placeholder, then these text styles may be inherited from the parent. Which text styles are inherited depend on the nesting level of lists: * A text run in a paragraph that is not in a list will inherit its text style from the the newline character in the paragraph at the 0 nesting level of the list inside the parent placeholder. * A text run in a paragraph that is in a list will inherit its text style from the newline character in the paragraph at its corresponding nesting level of the list inside the parent placeholder. Inherited text styles are represented as unset fields in this message. If text is contained in a shape without a parent placeholder, unsetting these fields will revert the style to a value matching the defaults in the Slides editor.
    TextStyle style?;
    # Specifies a contiguous range of an indexed collection, such as characters in text.
    Range textRange?;
};

# Describes the bullet of a paragraph.
public type Bullet record {
    # Represents the styling that can be applied to a TextRun. If this text is contained in a shape with a parent placeholder, then these text styles may be inherited from the parent. Which text styles are inherited depend on the nesting level of lists: * A text run in a paragraph that is not in a list will inherit its text style from the the newline character in the paragraph at the 0 nesting level of the list inside the parent placeholder. * A text run in a paragraph that is in a list will inherit its text style from the newline character in the paragraph at its corresponding nesting level of the list inside the parent placeholder. Inherited text styles are represented as unset fields in this message. If text is contained in a shape without a parent placeholder, unsetting these fields will revert the style to a value matching the defaults in the Slides editor.
    TextStyle bulletStyle?;
    # The rendered bullet glyph for this paragraph.
    string glyph?;
    # The ID of the list this paragraph belongs to.
    string listId?;
    # The nesting level of this paragraph in the list.
    int nestingLevel?;
};

# A color and position in a gradient band.
public type ColorStop record {
    # The alpha value of this color in the gradient band. Defaults to 1.0, fully opaque.
    float alpha?;
    # A themeable solid color value.
    OpaqueColor color?;
    # The relative position of the color stop in the gradient band measured in percentage. The value should be in the interval [0.0, 1.0].
    float position?;
};

# The properties of Page that are only relevant for pages with page_type NOTES.
public type NotesProperties record {
    # The object ID of the shape on this notes page that contains the speaker notes for the corresponding slide. The actual shape may not always exist on the notes page. Inserting text using this object ID will automatically create the shape. In this case, the actual shape may have different object ID. The `GetPresentation` or `GetPage` action will always return the latest object ID.
    string speakerNotesObjectId?;
};

# Properties of each column in a table.
public type TableColumnProperties record {
    # A magnitude in a single direction in the specified units.
    Dimension columnWidth?;
};

# A PageElement kind representing a table.
public type Table record {
    # Number of columns in the table.
    int columns?;
    # Properties of horizontal cell borders. A table's horizontal cell borders are represented as a grid. The grid has one more row than the number of rows in the table and the same number of columns as the table. For example, if the table is 3 x 3, its horizontal borders will be represented as a grid with 4 rows and 3 columns.
    TableBorderRow[] horizontalBorderRows?;
    # Number of rows in the table.
    int rows?;
    # Properties of each column.
    TableColumnProperties[] tableColumns?;
    # Properties and contents of each row. Cells that span multiple rows are contained in only one of these rows and have a row_span greater than 1.
    TableRow[] tableRows?;
    # Properties of vertical cell borders. A table's vertical cell borders are represented as a grid. The grid has the same number of rows as the table and one more column than the number of columns in the table. For example, if the table is 3 x 3, its vertical borders will be represented as a grid with 3 rows and 4 columns.
    TableBorderRow[] verticalBorderRows?;
};

# Updates the category of a line.
public type UpdateLineCategoryRequest record {
    # The line category to update to. The exact line type is determined based on the category to update to and how it's routed to connect to other page elements.
    string lineCategory?;
    # The object ID of the line the update is applied to. Only a line with a category indicating it is a "connector" can be updated. The line may be rerouted after updating its category.
    string objectId?;
};

# The result of grouping objects.
public type GroupObjectsResponse record {
    # The object ID of the created group.
    string objectId?;
};

# A PageElement kind representing a linked chart embedded from Google Sheets.
public type SheetsChart record {
    # The ID of the specific chart in the Google Sheets spreadsheet that is embedded.
    int chartId?;
    # The URL of an image of the embedded chart, with a default lifetime of 30 minutes. This URL is tagged with the account of the requester. Anyone with the URL effectively accesses the image as the original requester. Access to the image may be lost if the presentation's sharing settings change.
    string contentUrl?;
    # The properties of the SheetsChart.
    SheetsChartProperties sheetsChartProperties?;
    # The ID of the Google Sheets spreadsheet that contains the source chart.
    string spreadsheetId?;
};

# The outline of a PageElement. If these fields are unset, they may be inherited from a parent placeholder if it exists. If there is no parent, the fields will default to the value used for new page elements created in the Slides editor, which may depend on the page element kind.
public type Outline record {
    # The dash style of the outline.
    string dashStyle?;
    # The fill of the outline.
    OutlineFill outlineFill?;
    # The outline property state. Updating the outline on a page element will implicitly update this field to `RENDERED`, unless another value is specified in the same request. To have no outline on a page element, set this field to `NOT_RENDERED`. In this case, any other outline fields set in the same request will be ignored.
    string propertyState?;
    # A magnitude in a single direction in the specified units.
    Dimension weight?;
};

# A magnitude in a single direction in the specified units.
public type Dimension record {
    # The magnitude.
    decimal magnitude?;
    # The units for magnitude.
    string unit?;
};

# A Google Slides presentation.
public type Presentation record {
    # The layouts in the presentation. A layout is a template that determines how content is arranged and styled on the slides that inherit from that layout.
    Page[] layouts?;
    # The locale of the presentation, as an IETF BCP 47 language tag.
    string locale?;
    # The slide masters in the presentation. A slide master contains all common page elements and the common properties for a set of layouts. They serve three purposes: - Placeholder shapes on a master contain the default text styles and shape properties of all placeholder shapes on pages that use that master. - The master page properties define the common page properties inherited by its layouts. - Any other shapes on the master slide appear on all slides using that master, regardless of their layout.
    Page[] masters?;
    # A page in a presentation.
    Page notesMaster?;
    # A width and height.
    Size pageSize?;
    # The ID of the presentation.
    string presentationId?;
    # The revision ID of the presentation. Can be used in update requests to assert that the presentation revision hasn't changed since the last read operation. Only populated if the user has edit access to the presentation. The format of the revision ID may change over time, so it should be treated opaquely. A returned revision ID is only guaranteed to be valid for 24 hours after it has been returned and cannot be shared across users. If the revision ID is unchanged between calls, then the presentation has not changed. Conversely, a changed ID (for the same presentation and user) usually means the presentation has been updated; however, a changed ID can also be due to internal factors such as ID format changes.
    string revisionId?;
    # The slides in the presentation. A slide inherits properties from a slide layout.
    Page[] slides?;
    # The title of the presentation.
    string title?;
};

# A solid color fill. The page or page element is filled entirely with the specified color value. If any field is unset, its value may be inherited from a parent placeholder if it exists.
public type SolidFill record {
    # The fraction of this `color` that should be applied to the pixel. That is, the final pixel color is defined by the equation: pixel color = alpha * (color) + (1.0 - alpha) * (background color) This means that a value of 1.0 corresponds to a solid color, whereas a value of 0.0 corresponds to a completely transparent color.
    float alpha?;
    # A themeable solid color value.
    OpaqueColor color?;
};

# Deletes a column from a table.
public type DeleteTableColumnRequest record {
    # A location of a single table cell within a table.
    TableCellLocation cellLocation?;
    # The table to delete columns from.
    string tableObjectId?;
};

# Updates the properties of a Line.
public type UpdateLinePropertiesRequest record {
    # The fields that should be updated. At least one field must be specified. The root `lineProperties` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. For example to update the line solid fill color, set `fields` to `"lineFill.solidFill.color"`. To reset a property to its default value, include its field name in the field mask but leave the field itself unset.
    string fields?;
    # The properties of the Line. When unset, these fields default to values that match the appearance of new lines created in the Slides editor.
    LineProperties lineProperties?;
    # The object ID of the line the update is applied to.
    string objectId?;
};

# Update the properties of an Image.
public type UpdateImagePropertiesRequest record {
    # The fields that should be updated. At least one field must be specified. The root `imageProperties` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. For example to update the image outline color, set `fields` to `"outline.outlineFill.solidFill.color"`. To reset a property to its default value, include its field name in the field mask but leave the field itself unset.
    string fields?;
    # The properties of the Image.
    ImageProperties imageProperties?;
    # The object ID of the image the updates are applied to.
    string objectId?;
};

# Creates a line.
public type CreateLineRequest record {
    # The category of the line to be created. The exact line type created is determined based on the category and how it's routed to connect to other page elements. If you specify both a `category` and a `line_category`, the `category` takes precedence. If you do not specify a value for `category`, but specify a value for `line_category`, then the specified `line_category` value is used. If you do not specify either, then STRAIGHT is used.
    string category?;
    # Common properties for a page element. Note: When you initially create a PageElement, the API may modify the values of both `size` and `transform`, but the visual size will be unchanged.
    PageElementProperties elementProperties?;
    # The category of the line to be created. *Deprecated*: use `category` instead. The exact line type created is determined based on the category and how it's routed to connect to other page elements. If you specify both a `category` and a `line_category`, the `category` takes precedence.
    string lineCategory?;
    # A user-supplied object ID. If you specify an ID, it must be unique among all pages and page elements in the presentation. The ID must start with an alphanumeric character or an underscore (matches regex `[a-zA-Z0-9_]`); remaining characters may include those as well as a hyphen or colon (matches regex `[a-zA-Z0-9_-:]`). The length of the ID must not be less than 5 or greater than 50. If you don't specify an ID, a unique one is generated.
    string objectId?;
};

# The general text content. The text must reside in a compatible shape (e.g. text box or rectangle) or a table cell in a page.
public type TextContent record {
    # The bulleted lists contained in this text, keyed by list ID.
    record {} lists?;
    # The text contents broken down into its component parts, including styling information. This property is read-only.
    TextElement[] textElements?;
};

# The result of replacing shapes with an image.
public type ReplaceAllShapesWithImageResponse record {
    # The number of shapes replaced with images.
    int occurrencesChanged?;
};

# Request message for PresentationsService.BatchUpdatePresentation.
public type BatchUpdatePresentationRequest record {
    # A list of updates to apply to the presentation.
    Request[] requests?;
    # Provides control over how write requests are executed.
    WriteControl writeControl?;
};

# Provides control over how write requests are executed.
public type WriteControl record {
    # The revision ID of the presentation required for the write request. If specified and the `required_revision_id` doesn't exactly match the presentation's current `revision_id`, the request will not be processed and will return a 400 bad request error.
    string requiredRevisionId?;
};

# The result of creating a shape.
public type CreateShapeResponse record {
    # The object ID of the created shape.
    string objectId?;
};

# Replaces all instances of text matching a criteria with replace text.
public type ReplaceAllTextRequest record {
    # A criteria that matches a specific string of text in a shape or table.
    SubstringMatchCriteria containsText?;
    # If non-empty, limits the matches to page elements only on the given pages. Returns a 400 bad request error if given the page object ID of a notes master, or if a page with that object ID doesn't exist in the presentation.
    string[] pageObjectIds?;
    # The text that will replace the matched text.
    string replaceText?;
};

# The table cell background fill.
public type TableCellBackgroundFill record {
    # The background fill property state. Updating the fill on a table cell will implicitly update this field to `RENDERED`, unless another value is specified in the same request. To have no fill on a table cell, set this field to `NOT_RENDERED`. In this case, any other fill fields set in the same request will be ignored.
    string propertyState?;
    # A solid color fill. The page or page element is filled entirely with the specified color value. If any field is unset, its value may be inherited from a parent placeholder if it exists.
    SolidFill solidFill?;
};

# Creates an image.
public type CreateImageRequest record {
    # Common properties for a page element. Note: When you initially create a PageElement, the API may modify the values of both `size` and `transform`, but the visual size will be unchanged.
    PageElementProperties elementProperties?;
    # A user-supplied object ID. If you specify an ID, it must be unique among all pages and page elements in the presentation. The ID must start with an alphanumeric character or an underscore (matches regex `[a-zA-Z0-9_]`); remaining characters may include those as well as a hyphen or colon (matches regex `[a-zA-Z0-9_-:]`). The length of the ID must not be less than 5 or greater than 50. If you don't specify an ID, a unique one is generated.
    string objectId?;
    # The image URL. The image is fetched once at insertion time and a copy is stored for display inside the presentation. Images must be less than 50MB in size, cannot exceed 25 megapixels, and must be in one of PNG, JPEG, or GIF format. The provided URL can be at most 2 kB in length. The URL itself is saved with the image, and exposed via the Image.source_url field.
    string url?;
};

# The result of creating an image.
public type CreateImageResponse record {
    # The object ID of the created image.
    string objectId?;
};

# A page in a presentation.
public type Page record {
    # The properties of Page are only relevant for pages with page_type LAYOUT.
    LayoutProperties layoutProperties?;
    # The properties of Page that are only relevant for pages with page_type MASTER.
    MasterProperties masterProperties?;
    # The properties of Page that are only relevant for pages with page_type NOTES.
    NotesProperties notesProperties?;
    # The object ID for this page. Object IDs used by Page and PageElement share the same namespace.
    string objectId?;
    # The page elements rendered on the page.
    PageElement[] pageElements?;
    # The properties of the Page. The page will inherit properties from the parent page. Depending on the page type the hierarchy is defined in either SlideProperties or LayoutProperties.
    PageProperties pageProperties?;
    # The type of the page.
    string pageType?;
    # The revision ID of the presentation containing this page. Can be used in update requests to assert that the presentation revision hasn't changed since the last read operation. Only populated if the user has edit access to the presentation. The format of the revision ID may change over time, so it should be treated opaquely. A returned revision ID is only guaranteed to be valid for 24 hours after it has been returned and cannot be shared across users. If the revision ID is unchanged between calls, then the presentation has not changed. Conversely, a changed ID (for the same presentation and user) usually means the presentation has been updated; however, a changed ID can also be due to internal factors such as ID format changes.
    string revisionId?;
    # The properties of Page that are only relevant for pages with page_type SLIDE.
    SlideProperties slideProperties?;
};

# A visual element rendered on a page.
public type PageElement record {
    # The description of the page element. Combined with title to display alt text. The field is not supported for Group elements.
    string description?;
    # A PageElement kind representing a joined collection of PageElements.
    Group elementGroup?;
    # A PageElement kind representing an image.
    Image image?;
    # A PageElement kind representing a non-connector line, straight connector, curved connector, or bent connector.
    Line line?;
    # The object ID for this page element. Object IDs used by google.apps.slides.v1.Page and google.apps.slides.v1.PageElement share the same namespace.
    string objectId?;
    # A PageElement kind representing a generic shape that does not have a more specific classification.
    Shape shape?;
    # A PageElement kind representing a linked chart embedded from Google Sheets.
    SheetsChart sheetsChart?;
    # A width and height.
    Size size?;
    # A PageElement kind representing a table.
    Table 'table?;
    # The title of the page element. Combined with description to display alt text. The field is not supported for Group elements.
    string title?;
    # AffineTransform uses a 3x3 matrix with an implied last row of [ 0 0 1 ] to transform source coordinates (x,y) into destination coordinates (x', y') according to: x' x = shear_y scale_y translate_y 1 [ 1 ] After transformation, x' = scale_x * x + shear_x * y + translate_x; y' = scale_y * y + shear_y * x + translate_y; This message is therefore composed of these six matrix elements.
    AffineTransform transform?;
    # A PageElement kind representing a video.
    Video video?;
    # A PageElement kind representing word art.
    WordArt wordArt?;
};

# Replaces all shapes that match the given criteria with the provided image. The images replacing the shapes are rectangular after being inserted into the presentation and do not take on the forms of the shapes.
public type ReplaceAllShapesWithImageRequest record {
    # A criteria that matches a specific string of text in a shape or table.
    SubstringMatchCriteria containsText?;
    # The image replace method. If you specify both a `replace_method` and an `image_replace_method`, the `image_replace_method` takes precedence. If you do not specify a value for `image_replace_method`, but specify a value for `replace_method`, then the specified `replace_method` value is used. If you do not specify either, then CENTER_INSIDE is used.
    string imageReplaceMethod?;
    # The image URL. The image is fetched once at insertion time and a copy is stored for display inside the presentation. Images must be less than 50MB in size, cannot exceed 25 megapixels, and must be in one of PNG, JPEG, or GIF format. The provided URL can be at most 2 kB in length. The URL itself is saved with the image, and exposed via the Image.source_url field.
    string imageUrl?;
    # If non-empty, limits the matches to page elements only on the given pages. Returns a 400 bad request error if given the page object ID of a notes page or a notes master, or if a page with that object ID doesn't exist in the presentation.
    string[] pageObjectIds?;
    # The replace method. *Deprecated*: use `image_replace_method` instead. If you specify both a `replace_method` and an `image_replace_method`, the `image_replace_method` takes precedence.
    string replaceMethod?;
};

# Properties of each row in a table.
public type TableRowProperties record {
    # A magnitude in a single direction in the specified units.
    Dimension minRowHeight?;
};

# The user-specified ID mapping for a placeholder that will be created on a slide from a specified layout.
public type LayoutPlaceholderIdMapping record {
    # The placeholder information that uniquely identifies a placeholder shape.
    Placeholder layoutPlaceholder?;
    # The object ID of the placeholder on a layout that will be applied to a slide.
    string layoutPlaceholderObjectId?;
    # A user-supplied object ID for the placeholder identified above that to be created onto a slide. If you specify an ID, it must be unique among all pages and page elements in the presentation. The ID must start with an alphanumeric character or an underscore (matches regex `[a-zA-Z0-9_]`); remaining characters may include those as well as a hyphen or colon (matches regex `[a-zA-Z0-9_-:]`). The length of the ID must not be less than 5 or greater than 50. If you don't specify an ID, a unique one is generated.
    string objectId?;
};

# Updates the transform of a page element. Updating the transform of a group will change the absolute transform of the page elements in that group, which can change their visual appearance. See the documentation for PageElement.transform for more details.
public type UpdatePageElementTransformRequest record {
    # The apply mode of the transform update.
    string applyMode?;
    # The object ID of the page element to update.
    string objectId?;
    # AffineTransform uses a 3x3 matrix with an implied last row of [ 0 0 1 ] to transform source coordinates (x,y) into destination coordinates (x', y') according to: x' x = shear_y scale_y translate_y 1 [ 1 ] After transformation, x' = scale_x * x + shear_x * y + translate_x; y' = scale_y * y + shear_y * x + translate_y; This message is therefore composed of these six matrix elements.
    AffineTransform transform?;
};

# Represents the styling that can be applied to a TextRun. If this text is contained in a shape with a parent placeholder, then these text styles may be inherited from the parent. Which text styles are inherited depend on the nesting level of lists: * A text run in a paragraph that is not in a list will inherit its text style from the the newline character in the paragraph at the 0 nesting level of the list inside the parent placeholder. * A text run in a paragraph that is in a list will inherit its text style from the newline character in the paragraph at its corresponding nesting level of the list inside the parent placeholder. Inherited text styles are represented as unset fields in this message. If text is contained in a shape without a parent placeholder, unsetting these fields will revert the style to a value matching the defaults in the Slides editor.
public type TextStyle record {
    # A color that can either be fully opaque or fully transparent.
    OptionalColor backgroundColor?;
    # The text's vertical offset from its normal position. Text with `SUPERSCRIPT` or `SUBSCRIPT` baseline offsets is automatically rendered in a smaller font size, computed based on the `font_size` field. The `font_size` itself is not affected by changes in this field.
    string baselineOffset?;
    # Whether or not the text is rendered as bold.
    boolean bold?;
    # The font family of the text. The font family can be any font from the Font menu in Slides or from [Google Fonts] (https://fonts.google.com/). If the font name is unrecognized, the text is rendered in `Arial`. Some fonts can affect the weight of the text. If an update request specifies values for both `font_family` and `bold`, the explicitly-set `bold` value is used.
    string fontFamily?;
    # A magnitude in a single direction in the specified units.
    Dimension fontSize?;
    # A color that can either be fully opaque or fully transparent.
    OptionalColor foregroundColor?;
    # Whether or not the text is italicized.
    boolean italic?;
    # A hypertext link.
    Link link?;
    # Whether or not the text is in small capital letters.
    boolean smallCaps?;
    # Whether or not the text is struck through.
    boolean strikethrough?;
    # Whether or not the text is underlined.
    boolean underline?;
    # Represents a font family and weight used to style a TextRun.
    WeightedFontFamily weightedFontFamily?;
};

# The properties of the TableCell.
public type TableCellProperties record {
    # The alignment of the content in the table cell. The default alignment matches the alignment for newly created table cells in the Slides editor.
    string contentAlignment?;
    # The table cell background fill.
    TableCellBackgroundFill tableCellBackgroundFill?;
};

# Creates bullets for all of the paragraphs that overlap with the given text index range. The nesting level of each paragraph will be determined by counting leading tabs in front of each paragraph. To avoid excess space between the bullet and the corresponding paragraph, these leading tabs are removed by this request. This may change the indices of parts of the text. If the paragraph immediately before paragraphs being updated is in a list with a matching preset, the paragraphs being updated are added to that preceding list.
public type CreateParagraphBulletsRequest record {
    # The kinds of bullet glyphs to be used. Defaults to the `BULLET_DISC_CIRCLE_SQUARE` preset.
    string bulletPreset?;
    # A location of a single table cell within a table.
    TableCellLocation cellLocation?;
    # The object ID of the shape or table containing the text to add bullets to.
    string objectId?;
    # Specifies a contiguous range of an indexed collection, such as characters in text.
    Range textRange?;
};

# A List describes the look and feel of bullets belonging to paragraphs associated with a list. A paragraph that is part of a list has an implicit reference to that list's ID.
public type List record {
    # The ID of the list.
    string listId?;
    # A map of nesting levels to the properties of bullets at the associated level. A list has at most nine levels of nesting, so the possible values for the keys of this map are 0 through 8, inclusive.
    record {} nestingLevel?;
};

# The properties of Page are only relevant for pages with page_type LAYOUT.
public type LayoutProperties record {
    # The human-readable name of the layout.
    string displayName?;
    # The object ID of the master that this layout is based on.
    string masterObjectId?;
    # The name of the layout.
    string name?;
};

# The properties of the Line. When unset, these fields default to values that match the appearance of new lines created in the Slides editor.
public type LineProperties record {
    # The dash style of the line.
    string dashStyle?;
    # The style of the arrow at the end of the line.
    string endArrow?;
    # The properties for one end of a Line connection.
    LineConnection endConnection?;
    # The fill of the line.
    LineFill lineFill?;
    # A hypertext link.
    Link link?;
    # The style of the arrow at the beginning of the line.
    string startArrow?;
    # The properties for one end of a Line connection.
    LineConnection startConnection?;
    # A magnitude in a single direction in the specified units.
    Dimension weight?;
};

# Inserts text into a shape or a table cell.
public type InsertTextRequest record {
    # A location of a single table cell within a table.
    TableCellLocation cellLocation?;
    # The index where the text will be inserted, in Unicode code units, based on TextElement indexes. The index is zero-based and is computed from the start of the string. The index may be adjusted to prevent insertions inside Unicode grapheme clusters. In these cases, the text will be inserted immediately after the grapheme cluster.
    int insertionIndex?;
    # The object ID of the shape or table where the text will be inserted.
    string objectId?;
    # The text to be inserted. Inserting a newline character will implicitly create a new ParagraphMarker at that index. The paragraph style of the new paragraph will be copied from the paragraph at the current insertion index, including lists and bullets. Text styles for inserted text will be determined automatically, generally preserving the styling of neighboring text. In most cases, the text will be added to the TextRun that exists at the insertion index. Some control characters (U+0000-U+0008, U+000C-U+001F) and characters from the Unicode Basic Multilingual Plane Private Use Area (U+E000-U+F8FF) will be stripped out of the inserted text.
    string text?;
};

# The properties for one end of a Line connection.
public type LineConnection record {
    # The object ID of the connected page element. Some page elements, such as groups, tables, and lines do not have connection sites and therefore cannot be connected to a connector line.
    string connectedObjectId?;
    # The index of the connection site on the connected page element. In most cases, it corresponds to the predefined connection site index from the ECMA-376 standard. More information on those connection sites can be found in the description of the "cnx" attribute in section 20.1.9.9 and Annex H. "Predefined DrawingML Shape and Text Geometries" of "Office Open XML File Formats-Fundamentals and Markup Language Reference", part 1 of [ECMA-376 5th edition] (http://www.ecma-international.org/publications/standards/Ecma-376.htm). The position of each connection site can also be viewed from Slides editor.
    int connectionSiteIndex?;
};

# Specifies a contiguous range of an indexed collection, such as characters in text.
public type Range record {
    # The optional zero-based index of the end of the collection. Required for `FIXED_RANGE` ranges.
    int endIndex?;
    # The optional zero-based index of the beginning of the collection. Required for `FIXED_RANGE` and `FROM_START_INDEX` ranges.
    int startIndex?;
    # The type of range.
    string 'type?;
};

# The result of creating an embedded Google Sheets chart.
public type CreateSheetsChartResponse record {
    # The object ID of the created chart.
    string objectId?;
};

# Common properties for a page element. Note: When you initially create a PageElement, the API may modify the values of both `size` and `transform`, but the visual size will be unchanged.
public type PageElementProperties record {
    # The object ID of the page where the element is located.
    string pageObjectId?;
    # A width and height.
    Size size?;
    # AffineTransform uses a 3x3 matrix with an implied last row of [ 0 0 1 ] to transform source coordinates (x,y) into destination coordinates (x', y') according to: x' x = shear_y scale_y translate_y 1 [ 1 ] After transformation, x' = scale_x * x + shear_x * y + translate_x; y' = scale_y * y + shear_y * x + translate_y; This message is therefore composed of these six matrix elements.
    AffineTransform transform?;
};

# Refreshes an embedded Google Sheets chart by replacing it with the latest version of the chart from Google Sheets. NOTE: Refreshing charts requires at least one of the spreadsheets.readonly, spreadsheets, drive.readonly, or drive OAuth scopes.
public type RefreshSheetsChartRequest record {
    # The object ID of the chart to refresh.
    string objectId?;
};

# A PageElement kind representing a video.
public type Video record {
    # The video source's unique identifier for this video.
    string id?;
    # The video source.
    string 'source?;
    # An URL to a video. The URL is valid as long as the source video exists and sharing settings do not change.
    string url?;
    # The properties of the Video.
    VideoProperties videoProperties?;
};

# Creates a new shape.
public type CreateShapeRequest record {
    # Common properties for a page element. Note: When you initially create a PageElement, the API may modify the values of both `size` and `transform`, but the visual size will be unchanged.
    PageElementProperties elementProperties?;
    # A user-supplied object ID. If you specify an ID, it must be unique among all pages and page elements in the presentation. The ID must start with an alphanumeric character or an underscore (matches regex `[a-zA-Z0-9_]`); remaining characters may include those as well as a hyphen or colon (matches regex `[a-zA-Z0-9_-:]`). The length of the ID must not be less than 5 or greater than 50. If empty, a unique identifier will be generated.
    string objectId?;
    # The shape type.
    string shapeType?;
};

# The properties of Page that are only relevant for pages with page_type MASTER.
public type MasterProperties record {
    # The human-readable name of the master.
    string displayName?;
};

# A PageElement kind representing word art.
public type WordArt record {
    # The text rendered as word art.
    string renderedText?;
};

# Updates the properties of a Table row.
public type UpdateTableRowPropertiesRequest record {
    # The fields that should be updated. At least one field must be specified. The root `tableRowProperties` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. For example to update the minimum row height, set `fields` to `"min_row_height"`. If '"min_row_height"' is included in the field mask but the property is left unset, the minimum row height will default to 0.
    string fields?;
    # The object ID of the table.
    string objectId?;
    # The list of zero-based indices specifying which rows to update. If no indices are provided, all rows in the table will be updated.
    int[] rowIndices?;
    # Properties of each row in a table.
    TableRowProperties tableRowProperties?;
};

# The border styling properties of the TableBorderCell.
public type TableBorderProperties record {
    # The dash style of the border.
    string dashStyle?;
    # The fill of the border.
    TableBorderFill tableBorderFill?;
    # A magnitude in a single direction in the specified units.
    Dimension weight?;
};

# A pair mapping a theme color type to the concrete color it represents.
public type ThemeColorPair record {
    # An RGB color.
    RgbColor color?;
    # The type of the theme color.
    string 'type?;
};

# The palette of predefined colors for a page.
public type ColorScheme record {
    # The ThemeColorType and corresponding concrete color pairs.
    ThemeColorPair[] colors?;
};

# Update the properties of a Video.
public type UpdateVideoPropertiesRequest record {
    # The fields that should be updated. At least one field must be specified. The root `videoProperties` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. For example to update the video outline color, set `fields` to `"outline.outlineFill.solidFill.color"`. To reset a property to its default value, include its field name in the field mask but leave the field itself unset.
    string fields?;
    # The object ID of the video the updates are applied to.
    string objectId?;
    # The properties of the Video.
    VideoProperties videoProperties?;
};

# The shadow properties of a page element. If these fields are unset, they may be inherited from a parent placeholder if it exists. If there is no parent, the fields will default to the value used for new page elements created in the Slides editor, which may depend on the page element kind.
public type Shadow record {
    # The alignment point of the shadow, that sets the origin for translate, scale and skew of the shadow. This property is read-only.
    string alignment?;
    # The alpha of the shadow's color, from 0.0 to 1.0.
    float alpha?;
    # A magnitude in a single direction in the specified units.
    Dimension blurRadius?;
    # A themeable solid color value.
    OpaqueColor color?;
    # The shadow property state. Updating the shadow on a page element will implicitly update this field to `RENDERED`, unless another value is specified in the same request. To have no shadow on a page element, set this field to `NOT_RENDERED`. In this case, any other shadow fields set in the same request will be ignored.
    string propertyState?;
    # Whether the shadow should rotate with the shape. This property is read-only.
    boolean rotateWithShape?;
    # AffineTransform uses a 3x3 matrix with an implied last row of [ 0 0 1 ] to transform source coordinates (x,y) into destination coordinates (x', y') according to: x' x = shear_y scale_y translate_y 1 [ 1 ] After transformation, x' = scale_x * x + shear_x * y + translate_x; y' = scale_y * y + shear_y * x + translate_y; This message is therefore composed of these six matrix elements.
    AffineTransform transform?;
    # The type of the shadow. This property is read-only.
    string 'type?;
};

# Updates the alt text title and/or description of a page element.
public type UpdatePageElementAltTextRequest record {
    # The updated alt text description of the page element. If unset the existing value will be maintained. The description is exposed to screen readers and other accessibility interfaces. Only use human readable values related to the content of the page element.
    string description?;
    # The object ID of the page element the updates are applied to.
    string objectId?;
    # The updated alt text title of the page element. If unset the existing value will be maintained. The title is exposed to screen readers and other accessibility interfaces. Only use human readable values related to the content of the page element.
    string title?;
};

# A TextElement kind that represents the beginning of a new paragraph.
public type ParagraphMarker record {
    # Describes the bullet of a paragraph.
    Bullet bullet?;
    # Styles that apply to a whole paragraph. If this text is contained in a shape with a parent placeholder, then these paragraph styles may be inherited from the parent. Which paragraph styles are inherited depend on the nesting level of lists: * A paragraph not in a list will inherit its paragraph style from the paragraph at the 0 nesting level of the list inside the parent placeholder. * A paragraph in a list will inherit its paragraph style from the paragraph at its corresponding nesting level of the list inside the parent placeholder. Inherited paragraph styles are represented as unset fields in this message.
    ParagraphStyle style?;
};

# The result of creating a line.
public type CreateLineResponse record {
    # The object ID of the created line.
    string objectId?;
};

# Duplicates a slide or page element. When duplicating a slide, the duplicate slide will be created immediately following the specified slide. When duplicating a page element, the duplicate will be placed on the same page at the same position as the original.
public type DuplicateObjectRequest record {
    # The ID of the object to duplicate.
    string objectId?;
    # The object being duplicated may contain other objects, for example when duplicating a slide or a group page element. This map defines how the IDs of duplicated objects are generated: the keys are the IDs of the original objects and its values are the IDs that will be assigned to the corresponding duplicate object. The ID of the source object's duplicate may be specified in this map as well, using the same value of the `object_id` field as a key and the newly desired ID as the value. All keys must correspond to existing IDs in the presentation. All values must be unique in the presentation and must start with an alphanumeric character or an underscore (matches regex `[a-zA-Z0-9_]`); remaining characters may include those as well as a hyphen or colon (matches regex `[a-zA-Z0-9_-:]`). The length of the new ID must not be less than 5 or greater than 50. If any IDs of source objects are omitted from the map, a new random ID will be assigned. If the map is empty or unset, all duplicate objects will receive a new random ID.
    record {} objectIds?;
};

# Properties and contents of each table cell.
public type TableCell record {
    # Column span of the cell.
    int columnSpan?;
    # A location of a single table cell within a table.
    TableCellLocation location?;
    # Row span of the cell.
    int rowSpan?;
    # The properties of the TableCell.
    TableCellProperties tableCellProperties?;
    # The general text content. The text must reside in a compatible shape (e.g. text box or rectangle) or a table cell in a page.
    TextContent text?;
};

# A TextElement describes the content of a range of indices in the text content of a Shape or TableCell.
public type TextElement record {
    # A TextElement kind that represents auto text.
    AutoText autoText?;
    # The zero-based end index of this text element, exclusive, in Unicode code units.
    int endIndex?;
    # A TextElement kind that represents the beginning of a new paragraph.
    ParagraphMarker paragraphMarker?;
    # The zero-based start index of this text element, in Unicode code units.
    int startIndex?;
    # A TextElement kind that represents a run of text that all has the same styling.
    TextRun textRun?;
};

# Creates a video. NOTE: Creating a video from Google Drive requires that the requesting app have at least one of the drive, drive.readonly, or drive.file OAuth scopes.
public type CreateVideoRequest record {
    # Common properties for a page element. Note: When you initially create a PageElement, the API may modify the values of both `size` and `transform`, but the visual size will be unchanged.
    PageElementProperties elementProperties?;
    # The video source's unique identifier for this video. e.g. For YouTube video https://www.youtube.com/watch?v=7U3axjORYZ0, the ID is 7U3axjORYZ0. For a Google Drive video https://drive.google.com/file/d/1xCgQLFTJi5_Xl8DgW_lcUYq5e-q6Hi5Q the ID is 1xCgQLFTJi5_Xl8DgW_lcUYq5e-q6Hi5Q. To access a Google Drive video file, you might need to add a resource key to the HTTP header for a subset of old files. For more information, see [Access link-shared files using resource keys](https://developers.google.com/drive/api/v3/resource-keys).
    string id?;
    # A user-supplied object ID. If you specify an ID, it must be unique among all pages and page elements in the presentation. The ID must start with an alphanumeric character or an underscore (matches regex `[a-zA-Z0-9_]`); remaining characters may include those as well as a hyphen or colon (matches regex `[a-zA-Z0-9_-:]`). The length of the ID must not be less than 5 or greater than 50. If you don't specify an ID, a unique one is generated.
    string objectId?;
    # The video source.
    string 'source?;
};

# The properties of the SheetsChart.
public type SheetsChartProperties record {
    # The properties of the Image.
    ImageProperties chartImageProperties?;
};

# Update the properties of a TableCell.
public type UpdateTableCellPropertiesRequest record {
    # The fields that should be updated. At least one field must be specified. The root `tableCellProperties` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. For example to update the table cell background solid fill color, set `fields` to `"tableCellBackgroundFill.solidFill.color"`. To reset a property to its default value, include its field name in the field mask but leave the field itself unset.
    string fields?;
    # The object ID of the table.
    string objectId?;
    # The properties of the TableCell.
    TableCellProperties tableCellProperties?;
    # A table range represents a reference to a subset of a table. It's important to note that the cells specified by a table range do not necessarily form a rectangle. For example, let's say we have a 3 x 3 table where all the cells of the last row are merged together. The table looks like this: [ ] A table range with location = (0, 0), row span = 3 and column span = 2 specifies the following cells: x x [ x x x ]
    TableRange tableRange?;
};

# Creates a new slide.
public type CreateSlideRequest record {
    # The optional zero-based index indicating where to insert the slides. If you don't specify an index, the new slide is created at the end.
    int insertionIndex?;
    # A user-supplied object ID. If you specify an ID, it must be unique among all pages and page elements in the presentation. The ID must start with an alphanumeric character or an underscore (matches regex `[a-zA-Z0-9_]`); remaining characters may include those as well as a hyphen or colon (matches regex `[a-zA-Z0-9_-:]`). The length of the ID must not be less than 5 or greater than 50. If you don't specify an ID, a unique one is generated.
    string objectId?;
    # An optional list of object ID mappings from the placeholder(s) on the layout to the placeholder(s) that will be created on the new slide from that specified layout. Can only be used when `slide_layout_reference` is specified.
    LayoutPlaceholderIdMapping[] placeholderIdMappings?;
    # Slide layout reference. This may reference either: - A predefined layout - One of the layouts in the presentation.
    LayoutReference slideLayoutReference?;
};

# Deletes bullets from all of the paragraphs that overlap with the given text index range. The nesting level of each paragraph will be visually preserved by adding indent to the start of the corresponding paragraph.
public type DeleteParagraphBulletsRequest record {
    # A location of a single table cell within a table.
    TableCellLocation cellLocation?;
    # The object ID of the shape or table containing the text to delete bullets from.
    string objectId?;
    # Specifies a contiguous range of an indexed collection, such as characters in text.
    Range textRange?;
};

# A themeable solid color value.
public type OpaqueColor record {
    # An RGB color.
    RgbColor rgbColor?;
    # An opaque theme color.
    string themeColor?;
};

# Updates the Z-order of page elements. Z-order is an ordering of the elements on the page from back to front. The page element in the front may cover the elements that are behind it.
public type UpdatePageElementsZOrderRequest record {
    # The Z-order operation to apply on the page elements. When applying the operation on multiple page elements, the relative Z-orders within these page elements before the operation is maintained.
    string operation?;
    # The object IDs of the page elements to update. All the page elements must be on the same page and must not be grouped.
    string[] pageElementObjectIds?;
};

# The properties of a Shape. If the shape is a placeholder shape as determined by the placeholder field, then these properties may be inherited from a parent placeholder shape. Determining the rendered value of the property depends on the corresponding property_state field value. Any text autofit settings on the shape are automatically deactivated by requests that can impact how text fits in the shape.
public type ShapeProperties record {
    # The autofit properties of a Shape.
    Autofit autofit?;
    # The alignment of the content in the shape. If unspecified, the alignment is inherited from a parent placeholder if it exists. If the shape has no parent, the default alignment matches the alignment for new shapes created in the Slides editor.
    string contentAlignment?;
    # A hypertext link.
    Link link?;
    # The outline of a PageElement. If these fields are unset, they may be inherited from a parent placeholder if it exists. If there is no parent, the fields will default to the value used for new page elements created in the Slides editor, which may depend on the page element kind.
    Outline outline?;
    # The shadow properties of a page element. If these fields are unset, they may be inherited from a parent placeholder if it exists. If there is no parent, the fields will default to the value used for new page elements created in the Slides editor, which may depend on the page element kind.
    Shadow shadow?;
    # The shape background fill.
    ShapeBackgroundFill shapeBackgroundFill?;
};

# A single kind of update to apply to a presentation.
public type Request record {
    # Creates an image.
    CreateImageRequest createImage?;
    # Creates a line.
    CreateLineRequest createLine?;
    # Creates bullets for all of the paragraphs that overlap with the given text index range. The nesting level of each paragraph will be determined by counting leading tabs in front of each paragraph. To avoid excess space between the bullet and the corresponding paragraph, these leading tabs are removed by this request. This may change the indices of parts of the text. If the paragraph immediately before paragraphs being updated is in a list with a matching preset, the paragraphs being updated are added to that preceding list.
    CreateParagraphBulletsRequest createParagraphBullets?;
    # Creates a new shape.
    CreateShapeRequest createShape?;
    # Creates an embedded Google Sheets chart. NOTE: Chart creation requires at least one of the spreadsheets.readonly, spreadsheets, drive.readonly, drive.file, or drive OAuth scopes.
    CreateSheetsChartRequest createSheetsChart?;
    # Creates a new slide.
    CreateSlideRequest createSlide?;
    # Creates a new table.
    CreateTableRequest createTable?;
    # Creates a video. NOTE: Creating a video from Google Drive requires that the requesting app have at least one of the drive, drive.readonly, or drive.file OAuth scopes.
    CreateVideoRequest createVideo?;
    # Deletes an object, either pages or page elements, from the presentation.
    DeleteObjectRequest deleteObject?;
    # Deletes bullets from all of the paragraphs that overlap with the given text index range. The nesting level of each paragraph will be visually preserved by adding indent to the start of the corresponding paragraph.
    DeleteParagraphBulletsRequest deleteParagraphBullets?;
    # Deletes a column from a table.
    DeleteTableColumnRequest deleteTableColumn?;
    # Deletes a row from a table.
    DeleteTableRowRequest deleteTableRow?;
    # Deletes text from a shape or a table cell.
    DeleteTextRequest deleteText?;
    # Duplicates a slide or page element. When duplicating a slide, the duplicate slide will be created immediately following the specified slide. When duplicating a page element, the duplicate will be placed on the same page at the same position as the original.
    DuplicateObjectRequest duplicateObject?;
    # Groups objects to create an object group. For example, groups PageElements to create a Group on the same page as all the children.
    GroupObjectsRequest groupObjects?;
    # Inserts columns into a table. Other columns in the table will be resized to fit the new column.
    InsertTableColumnsRequest insertTableColumns?;
    # Inserts rows into a table.
    InsertTableRowsRequest insertTableRows?;
    # Inserts text into a shape or a table cell.
    InsertTextRequest insertText?;
    # Merges cells in a Table.
    MergeTableCellsRequest mergeTableCells?;
    # Refreshes an embedded Google Sheets chart by replacing it with the latest version of the chart from Google Sheets. NOTE: Refreshing charts requires at least one of the spreadsheets.readonly, spreadsheets, drive.readonly, or drive OAuth scopes.
    RefreshSheetsChartRequest refreshSheetsChart?;
    # Replaces all shapes that match the given criteria with the provided image. The images replacing the shapes are rectangular after being inserted into the presentation and do not take on the forms of the shapes.
    ReplaceAllShapesWithImageRequest replaceAllShapesWithImage?;
    # Replaces all shapes that match the given criteria with the provided Google Sheets chart. The chart will be scaled and centered to fit within the bounds of the original shape. NOTE: Replacing shapes with a chart requires at least one of the spreadsheets.readonly, spreadsheets, drive.readonly, or drive OAuth scopes.
    ReplaceAllShapesWithSheetsChartRequest replaceAllShapesWithSheetsChart?;
    # Replaces all instances of text matching a criteria with replace text.
    ReplaceAllTextRequest replaceAllText?;
    # Replaces an existing image with a new image. Replacing an image removes some image effects from the existing image.
    ReplaceImageRequest replaceImage?;
    # Reroutes a line such that it's connected at the two closest connection sites on the connected page elements.
    RerouteLineRequest rerouteLine?;
    # Ungroups objects, such as groups.
    UngroupObjectsRequest ungroupObjects?;
    # Unmerges cells in a Table.
    UnmergeTableCellsRequest unmergeTableCells?;
    # Update the properties of an Image.
    UpdateImagePropertiesRequest updateImageProperties?;
    # Updates the category of a line.
    UpdateLineCategoryRequest updateLineCategory?;
    # Updates the properties of a Line.
    UpdateLinePropertiesRequest updateLineProperties?;
    # Updates the alt text title and/or description of a page element.
    UpdatePageElementAltTextRequest updatePageElementAltText?;
    # Updates the transform of a page element. Updating the transform of a group will change the absolute transform of the page elements in that group, which can change their visual appearance. See the documentation for PageElement.transform for more details.
    UpdatePageElementTransformRequest updatePageElementTransform?;
    # Updates the Z-order of page elements. Z-order is an ordering of the elements on the page from back to front. The page element in the front may cover the elements that are behind it.
    UpdatePageElementsZOrderRequest updatePageElementsZOrder?;
    # Updates the properties of a Page.
    UpdatePagePropertiesRequest updatePageProperties?;
    # Updates the styling for all of the paragraphs within a Shape or Table that overlap with the given text index range.
    UpdateParagraphStyleRequest updateParagraphStyle?;
    # Update the properties of a Shape.
    UpdateShapePropertiesRequest updateShapeProperties?;
    # Updates the properties of a Slide.
    UpdateSlidePropertiesRequest updateSlideProperties?;
    # Updates the position of slides in the presentation.
    UpdateSlidesPositionRequest updateSlidesPosition?;
    # Updates the properties of the table borders in a Table.
    UpdateTableBorderPropertiesRequest updateTableBorderProperties?;
    # Update the properties of a TableCell.
    UpdateTableCellPropertiesRequest updateTableCellProperties?;
    # Updates the properties of a Table column.
    UpdateTableColumnPropertiesRequest updateTableColumnProperties?;
    # Updates the properties of a Table row.
    UpdateTableRowPropertiesRequest updateTableRowProperties?;
    # Update the styling of text in a Shape or Table.
    UpdateTextStyleRequest updateTextStyle?;
    # Update the properties of a Video.
    UpdateVideoPropertiesRequest updateVideoProperties?;
};

# The page background fill.
public type PageBackgroundFill record {
    # The background fill property state. Updating the fill on a page will implicitly update this field to `RENDERED`, unless another value is specified in the same request. To have no fill on a page, set this field to `NOT_RENDERED`. In this case, any other fill fields set in the same request will be ignored.
    string propertyState?;
    # A solid color fill. The page or page element is filled entirely with the specified color value. If any field is unset, its value may be inherited from a parent placeholder if it exists.
    SolidFill solidFill?;
    # The stretched picture fill. The page or page element is filled entirely with the specified picture. The picture is stretched to fit its container.
    StretchedPictureFill stretchedPictureFill?;
};

# Creates an embedded Google Sheets chart. NOTE: Chart creation requires at least one of the spreadsheets.readonly, spreadsheets, drive.readonly, drive.file, or drive OAuth scopes.
public type CreateSheetsChartRequest record {
    # The ID of the specific chart in the Google Sheets spreadsheet.
    int chartId?;
    # Common properties for a page element. Note: When you initially create a PageElement, the API may modify the values of both `size` and `transform`, but the visual size will be unchanged.
    PageElementProperties elementProperties?;
    # The mode with which the chart is linked to the source spreadsheet. When not specified, the chart will be an image that is not linked.
    string linkingMode?;
    # A user-supplied object ID. If specified, the ID must be unique among all pages and page elements in the presentation. The ID should start with a word character [a-zA-Z0-9_] and then followed by any number of the following characters [a-zA-Z0-9_-:]. The length of the ID should not be less than 5 or greater than 50. If empty, a unique identifier will be generated.
    string objectId?;
    # The ID of the Google Sheets spreadsheet that contains the chart. You might need to add a resource key to the HTTP header for a subset of old files. For more information, see [Access link-shared files using resource keys](https://developers.google.com/drive/api/v3/resource-keys).
    string spreadsheetId?;
};

# The result of replacing text.
public type ReplaceAllTextResponse record {
    # The number of occurrences changed by replacing all text.
    int occurrencesChanged?;
};

# The stretched picture fill. The page or page element is filled entirely with the specified picture. The picture is stretched to fit its container.
public type StretchedPictureFill record {
    # Reading the content_url: An URL to a picture with a default lifetime of 30 minutes. This URL is tagged with the account of the requester. Anyone with the URL effectively accesses the picture as the original requester. Access to the picture may be lost if the presentation's sharing settings change. Writing the content_url: The picture is fetched once at insertion time and a copy is stored for display inside the presentation. Pictures must be less than 50MB in size, cannot exceed 25 megapixels, and must be in one of PNG, JPEG, or GIF format. The provided URL can be at most 2 kB in length.
    string contentUrl?;
    # A width and height.
    Size size?;
};

# Response message from a batch update.
public type BatchUpdatePresentationResponse record {
    # The presentation the updates were applied to.
    string presentationId?;
    # The reply of the updates. This maps 1:1 with the updates, although replies to some requests may be empty.
    Response[] replies?;
    # Provides control over how write requests are executed.
    WriteControl writeControl?;
};

# Merges cells in a Table.
public type MergeTableCellsRequest record {
    # The object ID of the table.
    string objectId?;
    # A table range represents a reference to a subset of a table. It's important to note that the cells specified by a table range do not necessarily form a rectangle. For example, let's say we have a 3 x 3 table where all the cells of the last row are merged together. The table looks like this: [ ] A table range with location = (0, 0), row span = 3 and column span = 2 specifies the following cells: x x [ x x x ]
    TableRange tableRange?;
};

# A single response from an update.
public type Response record {
    # The result of creating an image.
    CreateImageResponse createImage?;
    # The result of creating a line.
    CreateLineResponse createLine?;
    # The result of creating a shape.
    CreateShapeResponse createShape?;
    # The result of creating an embedded Google Sheets chart.
    CreateSheetsChartResponse createSheetsChart?;
    # The result of creating a slide.
    CreateSlideResponse createSlide?;
    # The result of creating a table.
    CreateTableResponse createTable?;
    # The result of creating a video.
    CreateVideoResponse createVideo?;
    # The response of duplicating an object.
    DuplicateObjectResponse duplicateObject?;
    # The result of grouping objects.
    GroupObjectsResponse groupObjects?;
    # The result of replacing shapes with an image.
    ReplaceAllShapesWithImageResponse replaceAllShapesWithImage?;
    # The result of replacing shapes with a Google Sheets chart.
    ReplaceAllShapesWithSheetsChartResponse replaceAllShapesWithSheetsChart?;
    # The result of replacing text.
    ReplaceAllTextResponse replaceAllText?;
};

# The fill of the border.
public type TableBorderFill record {
    # A solid color fill. The page or page element is filled entirely with the specified color value. If any field is unset, its value may be inherited from a parent placeholder if it exists.
    SolidFill solidFill?;
};

# Updates the properties of a Page.
public type UpdatePagePropertiesRequest record {
    # The fields that should be updated. At least one field must be specified. The root `pageProperties` is implied and should not be specified. A single `"*"` can be used as short-hand for listing every field. For example to update the page background solid fill color, set `fields` to `"pageBackgroundFill.solidFill.color"`. To reset a property to its default value, include its field name in the field mask but leave the field itself unset.
    string fields?;
    # The object ID of the page the update is applied to.
    string objectId?;
    # The properties of the Page. The page will inherit properties from the parent page. Depending on the page type the hierarchy is defined in either SlideProperties or LayoutProperties.
    PageProperties pageProperties?;
};

# Contains properties describing the look and feel of a list bullet at a given level of nesting.
public type NestingLevel record {
    # Represents the styling that can be applied to a TextRun. If this text is contained in a shape with a parent placeholder, then these text styles may be inherited from the parent. Which text styles are inherited depend on the nesting level of lists: * A text run in a paragraph that is not in a list will inherit its text style from the the newline character in the paragraph at the 0 nesting level of the list inside the parent placeholder. * A text run in a paragraph that is in a list will inherit its text style from the newline character in the paragraph at its corresponding nesting level of the list inside the parent placeholder. Inherited text styles are represented as unset fields in this message. If text is contained in a shape without a parent placeholder, unsetting these fields will revert the style to a value matching the defaults in the Slides editor.
    TextStyle bulletStyle?;
};
