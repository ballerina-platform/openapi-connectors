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

public type BookRelated record {
    string 'type?;
};

# Describe the conditions of the price by merchant. Only with the Pro plan
public type Merchant record {
    string condition?;
    string merchant?;
    string merchant_logo?;
    MerchantMerchantLogoOffset merchant_logo_offset?;
    string shipping?;
    string price?;
    string total?;
    string link?;
};

# Describes the results of a query in the author's database
public type AuthorQueryResults record {
    int total?;
    string[] authors?;
};

# Describes a book in the book's database
public type Book record {
    string title?;
    string title_long?;
    string isbn?;
    string isbn13?;
    string dewey_decimal?;
    string binding?;
    string publisher?;
    string language?;
    string date_published?;
    string edition?;
    int pages?;
    string dimensions?;
    string overview?;
    # The link to the cover image
    CoverLink image?;
    decimal msrp?;
    string excerpt?;
    string synopsys?;
    string[] authors?;
    string[] subjects?;
    string[] reviews?;
    # Only shows if the query param 'with_prices' is present.
    Merchant[] prices?;
    BookRelated related?;
};

# Details of books published
public type PublisherBooks record {
    string isbn?;
};

# Describes the name of an author and the books written by that author in the database
public type Author record {
    # Author name
    string author?;
    # Detail about books written by author
    Book[] books?;
};

public type BooksBody record {
    # a list of ISBN 10 or ISBN 13 in the Books database
    string[] isbns;
};

# Describes about book publisher details
public type Publisher record {
    # Name of book publisher
    string name?;
    # Details of books published
    PublisherBooks[] books?;
};

# Describes about what the book is about
public type Subject record {
    string subject?;
    string parent?;
};

public type BooksBody1 record {
    # a list of ISBN 10 or ISBN 13 in the Books database
    string[] isbns;
};

public type MerchantMerchantLogoOffset record {
    # Merchant logo x-offset
    string x?;
    # Merchant logo y-offset
    string y?;
};

# The link to the cover image
public type CoverLink string;
