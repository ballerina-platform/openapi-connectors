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

public type Fetchrequest record {
    # Use actions to automate manual workflows while rendering web pages. They simulate real-world human interaction with pages. _(Chrome fetcher type only)_
    Action[] actions?;
    # The HTTP 200 OK success status response code indicates that the request has succeeded. Sometimes a server returns normal HTML content even with an erroneous Non-200 HTTP response status code. The IgnoreHTTPStatusCode option is useful when you need to force the return of HTML content. Defaults to "false."
    boolean ignoreHTTPStatusErrCodes?;
    # The "Initial Cookies" option is useful for crawling websites that require a login. The simplest solution to get an array of cookies for specific websites is to use a web browser "EditThisCookie" extension. Copy a cookie array with "EditThisCookie" and paste it into the "Initial cookie" field.
    InitialCookie[] initialCookies?;
    # If set to _file_, the content of downloaded HTML is uploaded to Dataflow Kit Storage first. Then the link to this file is returned. Overwise, downloaded content is returned in the response body.
    string output?;
    # Specify proxy by adding [country ISO code](https://en.wikipedia.org/wiki/ISO_3166-2) to `country-` value to send requests through a proxy in the specified country. Use `country-any` to use random geo-targets.
    string proxy?;
    # If set to `base`, the Base fetcher is used for downloading web page content. Use `chrome` for fetching content with a Headless chrome browser. If omitted `base` fetcher is used by default.
    string 'type;
    # Specify URL to download.
    string url;
    # Specify a wait delay (in seconds). This may be useful if certain elements of the web site need to be rendered after the initial page load. _(Chrome fetcher type only)_
    decimal waitDelay?;
};

public type Field record {
    # A set of attributes to extract from a Field. Find more information about attributes
    string[] attrs;
    # Details themself represent independent Parse request that extracts data from linked pages.
    record {*Parserequest;} details?;
    # Filters are used to pre-processing of text data when extracting.
    record {}|record {}[] filters?;
    # Field name is used to aggregate results.
    string name;
    # Selector represents a CSS selector for data extraction within the given block.
    string selector;
    # Selector type. ( 0 - image, 1 - text, 2 - link)
    int 'type;
};

public type  Action record {}|record {}|record {}|record {}|record {}|record {}|record {}|record {}|record {}|record {}|record {}|record {}|record {};

public type Url2screenshotrequest record {
    # Use actions to automate manual workflows while rendering web pages. They simulate real-world human interaction with pages.
    Action[] actions?;
    # Captures a screenshot of specified CSS element on a web page.
    string clipSelector?;
    # Sets the Format of output image
    string format?;
    # takes a screenshot of a full web page. It ignores offsetX, offsety, width and height argument values.
    boolean fullPage?;
    # Rectangle height in device independent pixels (dip).
    int height?;
    # The HTTP 200 OK success status response code indicates that the request has succeeded. Sometimes a server returns normal HTML content even with an erroneous Non-200 HTTP response status code. The IgnoreHTTPStatusCode option is useful when you need to force the return of HTML content. Defaults to "false."
    boolean ignoreHTTPStatusErrCodes?;
    # The "Initial Cookies" option is useful for crawling websites that require a login. The simplest solution to get an array of cookies for specific websites is to use a web browser "EditThisCookie" extension. Copy a cookie array with "EditThisCookie" and paste it into the "Initial cookie" field.
    InitialCookie[] initialCookies?;
    # X offset in device independent pixels (dip).
    int offsetx?;
    # Y offset in device independent pixels (dip).
    int offsety?;
    # If set to _file_, the resulted screenshot is uploaded to Dataflow Kit Storage first. Then the link to this file is returned. Overwise, web site screenshot is returned in the response body.
    string output?;
    # Print background graphics in the PDF.
    boolean printBackground?;
    # Specify proxy by adding [country ISO code](https://en.wikipedia.org/wiki/ISO_3166-2) to `country-` value to send requests through a proxy in the specified country. Use `country-any` to use random geo-targets.
    string proxy?;
    # Sets the Quality of output image. Compression quality from range [0..100] (jpeg only).
    int quality?;
    # Image scale factor. range [0.1 .. 3]
    decimal scale?;
    # The full URL address (including HTTP/HTTPS) of a web page that you want to capture
    string url;
    # Specify a wait delay (in seconds). This may be useful if certain elements of the web site need to be rendered after the initial page load.
    decimal waitDelay?;
    # Rectangle width in device independent pixels (dip).
    int width?;
};

public type Serprequest record {
    # Specify CSS selectors (patterns) used to gather data from Search Engine Result Pages.
    # 
    # Ready-to-use payloads for collecting search results from the most popular Search Engines are available. These payloads are customizable, though.
    Field[] fields?;
    # Extracted data is returned either in CSV, MS Excel, JSON, JSON(Lines) or XML format.
    string format;
    # Collection name.
    string name;
    # Specify number of pages to crawl.
    int pageNum?;
    # Always specify proxy for sending SERP requests. Add choosen [country ISO code](https://en.wikipedia.org/wiki/ISO_3166-2) to `country-` value to send requests through a proxy in the specified country. Use `country-any` to use random geo-targets.
    string proxy;
    # For SERP requests you should _always_ use `chrome` type to fetch content with a Headless chrome browser
    string 'type;
    # url holds the link to a Search Engine to use, and other optional parameters like languages or country.
    string url;
};

public type InitialCookie record {
    string domain?;
    decimal expirationDate?;
    boolean hostOnly?;
    boolean httpOnly?;
    decimal id?;
    string name?;
    string path?;
    string sameSite?;
    boolean secure?;
    boolean session?;
    string storeID?;
    string value?;
};

public type Url2pdfrequest record {
    # Use actions to automate manual workflows while rendering web pages. They simulate real-world human interaction with pages.
    Action[] actions?;
    # The HTTP 200 OK success status response code indicates that the request has succeeded. Sometimes a server returns normal HTML content even with an erroneous Non-200 HTTP response status code. The IgnoreHTTPStatusCode option is useful when you need to force the return of HTML content. Defaults to "false."
    boolean ignoreHTTPStatusErrCodes?;
    # The "Initial Cookies" option is useful for crawling websites that require a login. The simplest solution to get an array of cookies for specific websites is to use a web browser "EditThisCookie" extension. Copy a cookie array with "EditThisCookie" and paste it into the "Initial cookie" field.
    InitialCookie[] initialCookies?;
    # Paper orientation. Parameter landscape = false means portrait orientation. Set landscape to true for landscape page oriantation.
    boolean landscape?;
    # Bottom Margin of the PDF (in inches)
    decimal marginBottom?;
    # Left Margin of the PDF (in inches)
    decimal marginLeft?;
    # Right Margin of the PDF (in inches)
    decimal marginRight?;
    # Top Margin of the PDF (in inches)
    decimal marginTop?;
    # If set to _file_, the resulted PDF is uploaded to Dataflow Kit Storage first. Then the link to this file is returned. Overwise, PDF content is returned in the response body.
    string output?;
    # Specify page ranges to convert. Defaults to the empty value, which means convert all pages.
    string pageRanges?;
    # Page size parameter consists of the most popular page formats.
    string paperSize?;
    # Print background graphics in the PDF.
    boolean printBackground?;
    # printHeaderFooter  parameter consists of the date, name of the web page, the page URL, and how many pages the document you are printing.
    boolean printHeaderFooter?;
    # Specify proxy by adding [country ISO code](https://en.wikipedia.org/wiki/ISO_3166-2) to `country-` value to send requests through a proxy in the specified country. Use `country-any` to use random geo-targets.
    string proxy?;
    # By default, PDF document content is generated according to dimensions of the original web page content. Using the `scale` parameter, you can specify a custom zoom factor from 0.1 to 5.0 of the webpage rendering.
    decimal scale?;
    # The full URL address (including HTTP/HTTPS) of a web page that you want to save as PDF
    string url;
    # Specify a wait delay (in seconds). This may be useful if certain elements of the web site need to be rendered after the initial page load.
    decimal waitDelay?;
};

public type Paginator record {
    string nextPageSelector?;
    int pageNum?;
};

public type Parserequest record {
    # Specifies common ancestor block for a set of fields used to extract data from a web page. _(CSS Selector)_
    string commonParent?;
    # Define a  set of fields used to extract data from a web page. A Field represents a given chunk of extracted data from every block on each page.
    Field[] fields;
    # Extracted data is returned either in CSV, MS Excel, JSON, JSON(Lines) or XML format.
    string format;
    # Collection name.
    string name;
    Paginator paginator?;
    # Path is a special parameter specifying navigation pages only. It collects information from detailed pages. No results from the current page return. Defaults to false.
    boolean path?;
    Fetchrequest request?;
};
