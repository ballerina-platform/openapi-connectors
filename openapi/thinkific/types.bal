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

public type CollectionRequest record {
    # The name of the Category
    string name;
    # The description of the Category
    string description;
    # The slug of the Category.
    string slug;
};

public type Meta record {
    # Pagination metadata
    Pagination pagination?;
};

public type IdEnrollmentsBody1 record {
    decimal user_id;
    # The date/time at which the Enrollment is to be activated. If not provided, the Enrollment will only provide access to free preview content within the Courses. Provide full access to courses by setting this value to the current date/time.
    string activated_at?;
    # The date/time at which the Enrollment should be expired. If not provided, the Enrollment does not expire.
    string expiry_date?;
};

public type ChapterResponse record {
    # The ID of the Chapter as an integer
    decimal id;
    # The name of the Chapter
    string name;
    # The position of the Chapter within the Course
    decimal position;
    # The description of the Chapter
    string description?;
    # The duration of the Chapter in seconds. This is the sum of the length of the video lessons in the Chapter
    decimal duration_in_seconds?;
    decimal[] content_ids;
};

public type ContentResponse record {
    # The ID of the Content as an integer
    decimal id;
    # The name of the Content
    string name;
    # The position of the Content within a Chapter.
    decimal position;
    # The ID of the Chapter that the Content is in as an integer
    decimal chapter_id;
    # The type of the Content
    string contentable_type;
    # A boolean indicating whether the Content is free
    boolean free;
    # The url of the Content in the Course Player
    string take_url;
};

public type CreateCourseReviewRequest record {
    # The rating, out of 5, of the Course Review.
    decimal rating;
    # The Course Review title.
    string title;
    # The body of the Course Review.
    string review_text;
    # The ID of the User writing the Course Review as an integer.
    decimal user_id;
    # A boolean indicating whether the Course Review has been approved.
    boolean approved;
};

public type GetCollectionsResponse record {
    CollectionResponse[] items;
    Meta meta;
};

public type IdEnrollmentsBody record {
    decimal user_id;
    # The date/time at which the Enrollment is to be activated. If not provided, the Enrollment will only provide access to free preview content within the Courses. Provide full access to courses by setting this value to the current date/time.
    string activated_at?;
    # The date/time at which the Enrollment should be expired. If not provided, the Enrollment does not expire.
    string expiry_date?;
};

public type ProductPublishRequest record {
    # The ID pf the Product as an integer.
    decimal product_id;
    # The approval status of the Product Publish Request. Can be either 'approved' or 'denied'.
    string status;
    # The text of the response provided by the approver.
    string response_text?;
    # The ID of the requesting User as an integer.
    decimal requesting_user_id;
    # The ID of the responding User as an integer.
    decimal responding_user_id?;
    # The date/time the Product Publish Request was completed.
    string completed_at?;
    # The date/time the Product Publish Request was created.
    string created_at?;
    # The date/time the Product Publish Request was last updated.
    string updated_at?;
};

public type Item record {
    # Product ID
    decimal product_id?;
    # Product name
    string product_name?;
    # Product price in dollars
    decimal amount_dollars?;
    # Product price in cents
    decimal amount_cents?;
};

# Pagination metadata
public type Pagination record {
    # Current page number
    decimal current_page?;
    # Next page number
    decimal next_page?;
    # Previous page number
    decimal prev_page?;
    # Number of total pages
    decimal total_pages?;
    # Number of total items
    decimal total_items?;
    # Entries info
    string entries_info?;
};

public type GetProductPublishResponse record {
    PromotionResponse[] items;
    Meta meta;
};

public type CustomProfileField record {
    # Custom profile field ID
    decimal id?;
    # Custom profile field value
    string value?;
    # Custom profile field label
    string label?;
    # Custom profile field definition ID
    decimal custom_profile_field_definition_id?;
};

public type GetInstructorsResponse record {
    InstructorResponse[] items;
    Meta meta;
};

public type GetEnrollmentsResponse record {
    EnrollmentResponse[] items;
    Meta meta;
};

public type ValidationError record {
    # validation error
    string field_name?;
};

public type BulkCreateCouponRequest record {
    # The number of times each of the autogenerated Coupons can be used. Defaults to allowing unlimited use.
    decimal bulk_quantity_per_coupon?;
    # The length of the Coupon code. The minimum length is 6.
    decimal bulk_coupon_code_length?;
    # The number of unique Coupons to create. Maximum value is 1000.
    decimal bulk_quantity?;
};

public type GetOrdersResponse record {
    OrderResponse[] items;
    Meta meta;
};

public type SiteScriptResponse record {
    # The Site Script's ID.
    string id?;
    # A string containing HTML/Javascript. Required if `src` is not provided.
    string content?;
    # A URL that points to where the script is hosted. Required if `content` is not provided.
    string src?;
    # A short and user-friendly string to identify the script.
    string name?;
    # A user-friendly explanation of the script's purpose and what it does.
    string description?;
    # An array of page and domain identifiers that the Site Script should be injected onto. `page_scopes` can contain identifiers that are groupings of pages and/or the pages themselves.
    # 
    # The majority of the page identifiers correspond to Liquid pages. For more details, take a look at our [Liquid API docs](https://developers.thinkific.com/themes/liquid-api/pages/).
    # 
    # Groupings and Page Identifiers:
    # 
    # | Page Grouping | Page Identifiers Included |
    # | ------- | --------|
    # | landing_pages   | home_landing_page, course_landing_page, collections_landing_page, bundle_landing_page, coming_soon_page, page_template (used for custom pages)   |
    # | checkout   | checkout_thankyou_page   |
    # | learning_experience   | student_dashboard, course_player   |
    # | all   | all page identifiers listed above   |
    string[] page_scopes?;
    # Where in the HTML the script should be injected. Accepted values are: head or footer
    string location?;
    # How the Site Script will be loaded into the page. Accepted values are: async, defer, and default
    string load_method?;
    # Describes the purpose of the script. Accepted values are: functional, analytics, marketing
    string category?;
    # Site Script's created date
    string created_at?;
    # Site Script's updated date
    string updated_at?;
};

# External Order Request
public type ExternalOrderRequest record {
    # An identifier to external provider
    string payment_provider;
    # The ID of the user as an integer
    decimal user_id;
    # The ID of the product as an integer
    decimal product_id;
    # type of the order
    string order_type;
    # External Order Transaction
    ExternalOrderTransaction 'transaction?;
};

public type CollectionResponse record {
    # The ID of the Category as an integer
    decimal id;
    # The name of the Category
    string name;
    # The description of the Category
    string description;
    # courses (string, required) - The slug of the Category
    string slug?;
    # The date and time when the Category was created
    string created_at;
    decimal[] product_ids;
    # A boolean indicating whether the Category is the default
    boolean default;
};

public type GetPromotionsResponse record {
    PromotionResponse[] items;
    Meta meta;
};

public type ErrorBadRequest record {
    # Malformed request error
    string 'error?;
};

public type CustomProfileFieldDefinitionsResponse record {
    # The ID of the Custom Profile Field Definition as an integer.
    decimal id;
    # The label of the Custom Profile Field Definition.
    string label;
    # The Course's Product ID as an integer.
    string field_type;
    # A boolean indicating whether the Custom Profile Field Definition is required.
    boolean required;
};

public type GetSiteScriptsResponse record {
    SiteScriptResponse[] items;
    Meta meta;
};

public type GetCoursesResponse record {
    CourseResponse[] items?;
    Meta meta?;
};

public type UpdateEnrollmentRequest record {
    # The date/time at which the Enrollment is activated. If not provided, the Enrollment is a free trial.
    string activated_at?;
    # The date/time at which the Enrollment expired. If not provided, the Enrollment does not expire.
    string expiry_date?;
};

public type GroupAnalystsAddGroupRequest record {
    # The list of Group IDs to add the analyst
    decimal[] group_ids;
};

public type GetProductsResponse record {
    ProductResponse[] items;
    Meta meta;
};

public type ProductResponse record {
    # The ID of the Product as an integer.
    decimal id?;
    # The date and time that the Product was created.
    string created_at?;
    # The ID of the Course or Bundle that is represented by the Product.
    decimal productable_id?;
    # The type of item that the Product represents.
    string productable_type?;
    # The price of the Product. ** NOTE: price will be deprecated in future versions of the API **
    decimal price?;
    # The position of the Product within the site. Used for ordering.
    decimal position?;
    # The status of the Product. Can be either 'published' or 'draft'.
    string status?;
    # The name of the Product.
    string name?;
    # A boolean indicating whether the Product is private. When private, a Product cannot be purchased. A user must be enrolled manually.
    boolean 'private?;
    # A boolean indicating whether the Product is hidden. When hidden, the Product will not appear on any site pages. It's landing page will be still be accessible via a link, however.
    boolean hidden?;
    # A boolean indicating whether the Product is a subscription or not. 
    boolean subscription?;
    # If access to a Product can end, this value controls how many days access is granted for from the date of enrollment.
    decimal days_until_expiry?;
    # A boolean indicating whether the Product has a certificate.
    boolean has_certificate?;
    # Keywords associated with the Product.
    string keywords?;
    # The SEO title of the Product.
    string seo_title?;
    # The SEO description of the Product.
    string seo_description?;
    # The IDs of the Categories to which this Product belongs as integers.
    decimal[] collection_ids?;
    # The IDs of any related Products as integers.
    decimal[] related_product_ids?;
    # The description of the product (course or bundle)
    string description?;
    # The card image URL for the product.
    string card_image_url?;
    # The slug of the product
    string slug?;
    # The Product Price objects for the Product.
    ProductPriceResponse[] product_prices?;
};

public type EnrollmentResponse record {
    # The ID of the Enrollment as an integer.
    decimal id;
    # The email of the User owning the Enrollment.
    string user_email;
    # The full name of the User owning the Enrollment.
    string user_name;
    # The ID of the User owning the Enrollment as an integer.
    decimal user_id;
    # The name of the Course.
    string course_name;
    # The ID of the Course as an integer.
    decimal course_id;
    # The percentage complete of the Enrollment. A number between 0.0 and 1.0. For example, to represent a percentage complete of 75%, this value would be 0.75.
    decimal percentage_completed;
    # A boolean indicating whether the Enrollment is expired.
    boolean expired;
    # A boolean indicating whether the Enrollment is a free trial.
    boolean is_free_trial;
    # A boolean indicating whether the Enrollment is complete.
    boolean completed;
    # The date/time that the Enrollment started.
    string started_at;
    # The date/time that the Enrollment was activated.
    string activated_at;
    # The date/time that the Enrollment was completed.
    string completed_at;
    # The date/time that the Enrollment was updated last.
    string updated_at;
    # The date/time that the Enrollment expires.
    string expiry_date;
};

public type CreateUserRequest record {
    # User's first name 
    string first_name;
    # User's last name
    string last_name;
    # User's email
    string email;
    # The password of the User. If not included, the Express Sign In Link becomes activated for the User.
    @constraint:String {minLength: 6}
    string password?;
    # User's roles
    string[] roles?;
    # User's bio
    string bio?;
    # User's Company Name
    string company?;
    # User's headline
    string headline?;
    # User's affiliate code
    string affiliate_code?;
    # Required only if the User is an affiliate. This should be greater than 0 and less than or equal to 100 if the type is percentage or lower than 9999.99 if is a fixed type.
    decimal affiliate_commission?;
    # The affiliate payout type, it can be either % (percentage, default) or $ (fixed amount). Required only if the User is an affiliate.
    string affiliate_commission_type?;
    # The email of the User. Required only if the user is an affiliate. Used to pay the User out.
    string affiliate_payout_email?;
    # Custom profile fields for the User.
    CustomProfileFieldRequest[] custom_profile_fields?;
    # Option to skip required custom profile fields validation.
    boolean skip_custom_fields_validation = false;
    # Option to send the Site Welcome email to the User.
    boolean send_welcome_email = false;
    # Optional identifier of the user in an external system. Typically used in conjunction with Thinkific's SSO. For further information on this, please read [this](https://help.thinkific.com/support/solutions/articles/221622-sso-automatically-sign-in-from-your-own-website)
    string external_id?;
};

# External Order Transaction
public type ExternalOrderTransaction record {
    # the order amount in currency's smallest unit
    decimal amount;
    # the order currency
    string currency;
    # reference number provided by external payment provider
    string reference?;
    # Action of the transaction
    string action?;
};

public type UpdateUserRequest record {
    # User's first name 
    string first_name?;
    # User's last name
    string last_name?;
    # User's email
    string email?;
    # The password of the User.
    @constraint:String {minLength: 6}
    string password?;
    # User's roles
    string[] roles?;
    # The fully-qualified avatar url of the User.
    string avatar_url?;
    # User's bio
    string bio?;
    # User's Company Name
    string company?;
    # User's headline
    string headline?;
    # User's external source
    string external_source?;
    # User's affiliate code
    string affiliate_code?;
    # Required only if the User is an affiliate. This should be greater than 0 and less than or equal to 100 if the type is percentage or lower than 9999.99 if is a fixed type.
    decimal affiliate_commission?;
    # The affiliate payout type, it can be either % (percentage, default) or $ (fixed amount). Required only if the User is an affiliate.
    string affiliate_commission_type?;
    # The email of the User. Required only if the user is an affiliate. Used to pay the User out.
    string affiliate_payout_email?;
    # Custom profile fields for the User.
    CustomProfileField[] custom_profile_fields?;
};

public type CourseReviewResponse record {
    # The ID of the Course Review as an integer.
    decimal id;
    # The rating, out of 5, of the Course Review.
    decimal rating;
    # The Course Review title.
    string title;
    # The body of the Course Review.
    string review_text;
    # The ID of the User writing the Course Review as an integer.
    decimal user_id;
    # The ID of the Course being reviewed as an integer.
    decimal course_id;
    # A boolean indicating whether the Course Review has been approved.
    boolean approved;
    # The date and time the Course Review was created.
    string created_at?;
};

public type GroupAddAnalystRequest record {
    # The list of User IDs to add as analysts to the Group
    decimal[] user_ids;
};

public type UpdateCoupon record {
    # The Coupon code.
    string code;
    # A note associated with the Coupon. NOTE: this will be deprecated in future versions of the API.
    string note?;
    # The number of times the Coupon has been used.
    string quantity_used?;
    # The number of times the Coupon can be used. If this value if not set, the Coupon can be used an unlimited number of times.
    decimal quantity?;
};

public type GetUsersResponse record {
    UserResponse[] items;
    Meta meta;
};

public type BundleResponse record {
    # The ID of the Bundle
    decimal id;
    # The name of the Bundle
    string name;
    # The description on the Bundle
    string description?;
    # The tagline for the Bundle (Deprecated)
    string tagline?;
    # Deprecated - use 'bundle_card_image_url'* - The banner image url for the Bundle.
    string banner_image_url?;
    decimal[] course_ids;
    # The card image url for the Bundle
    string bundle_card_image_url?;
};

public type GetGroupAnalystsResponse record {
    # The list of User IDs to add as analysts to the Group
    decimal[] group_analysts;
};

public type InlineResponse201 record {
    decimal id?;
};

public type CustomProfileFieldRequest record {
    # Custom profile field value
    string value?;
    # Custom profile field definition id
    decimal custom_profile_field_definition_id;
};

public type GetChaptersResponse record {
    ChapterResponse[] items;
    Meta meta;
};

public type CouponResponse record {
    # The ID of the Coupon as an integer.
    decimal id;
    # The Coupon code.
    string code;
    # A note associated with the Coupon. NOTE: this will be deprecated in future versions of the API.
    string note;
    # The number of times the Coupon has been used.
    decimal quantity_used;
    # The number of times the Coupon can be used. If this value if not set, the Coupon can be used an unlimited number of times.
    decimal quantity;
    # The ID of the associated Promotion as an integer.
    decimal promotion_id;
    # The data and time the Coupon was created.
    string created_at;
};

public type ErrorForbiddenAppsNotAvailable record {
    # access forbidden
    string 'error?;
};

public type CreateBulkCouponResponse record {
    CouponResponse[] items?;
};

public type ErrorForbiddenInsufficientScope record {
    # access forbidden
    string 'error?;
};

public type GetCouponResponse record {
    CouponResponse[] items?;
    Meta meta?;
};

public type MembershipsRequest record {
    decimal[] product_ids;
};

public type GetCustomProfileFieldDefinitions record {
    CustomProfileFieldDefinitionsResponse[] items;
    Meta meta;
};

public type GetContentsResponse record {
    ContentResponse[] items;
    Meta meta;
};

public type SiteScriptRequest record {
    # A URL that points to where the script is hosted. Required if `content` is not provided. Note the TLD of the src url must match the app's url.
    string src?;
    # A string containing HTML/Javascript. Required if `src` is not provided. When providing the script using content, the header HMAC-SHA256-SIGNATURE is also require to be sent. Generate the signature using the app's client secret and the value.
    string content?;
    # A short and user-friendly string to identify the script.
    string name;
    # A user-friendly explanation of the script's purpose and what it does.
    string description;
    # An array of page and domain identifiers that the Site Script should be injected onto. `page_scopes` can contain identifiers that are groupings of pages and/or the pages themselves.
    # 
    # The majority of the page identifiers correspond to Liquid pages. For more details, take a look at our [Liquid API docs](https://developers.thinkific.com/themes/liquid-api/pages/).
    # 
    # Groupings and Page Identifiers:
    # 
    # | Page Grouping | Page Identifiers Included |
    # | ------- | --------|
    # | landing_pages   | home_landing_page, course_landing_page, collections_landing_page, bundle_landing_page, coming_soon_page, page_template (used for custom pages)   |
    # | checkout   | checkout_thankyou_page   |
    # | learning_experience   | student_dashboard, course_player   |
    # | all   | all page identifiers listed above   |
    string[] page_scopes;
    # Where in the HTML the script should be injected. Accepted values are: head or footer
    string location = "footer";
    # How the Site Script will be loaded into the page. Accepted values are: async, defer, and default
    string load_method = "async";
    # Describes the purpose of the script. Accepted values are: functional, analytics, marketing
    string category;
};

public type GetGroupsResponse record {
    GroupResponse[] items;
    Meta meta;
};

public type OrderResponse record {
    # The ID of the User owning the Order as an integer.
    decimal user_id;
    # The Email ID of the User.
    string user_email;
    # The full name of the User owning the Order.
    string user_name;
    # The name of the Product purchased.
    string product_name;
    # The ID of the Product purchased as an integer.
    decimal product_id;
    # The Order amount in dollars.
    decimal amount_dollars;
    # The Order amount in cents.
    decimal amount_cents;
    # A boolean indicating whether the Order was for a subscription.
    boolean subscription;
    # The Coupon code used on the Order.
    string coupon_code?;
    # The ID of the Coupon used on the Order as an integer.
    decimal coupon_id?;
    # Products included in the Order.
    Item[] items?;
    # The Affiliate referral code used on the Order.
    string affiliate_referral_code?;
    # The order status.
    string status;
    # The date/time that the Order was created.
    string 'created\ at?;
    # The ID of the Order as an integer.
    decimal id;
};

public type PromotionResponse record {
    # The ID of the Promotion as an integer.
    decimal id?;
    # The name of the Promotion.
    string name?;
    # A description for the Promotion.
    string description?;
    # The date and time when the Promotion begins.
    string starts_at?;
    # The date and time when the Promotion ends.
    string expires_at?;
    # The type of discount. Must be either 'fixed' or 'percentage'.
    string discount_type?;
    # The amount of the discount. If 'fixed', must be a dollar value. If 'percentage', must be a number greater than 0 and less than or equal to 100.
    decimal amount?;
    # The coupon ids related to the promotion.
    decimal[] coupon_ids?;
    # The duration for which the Promotion is applied. ** This value only applies to Promotions set on Products that are set as subscriptions or Payment Plans. **
    decimal duration?;
};

public type CourseResponse record {
    # The ID of the course
    decimal id;
    # The name of the course
    string name;
    # URL-friendly version of the course name. Used to construct URL for course Landing Pages & Course Player.
    string slug?;
    # Deprecated - Used in legacy themes to display the subtitle of the Course.
    string subtitle?;
    # The Course's Product ID
    decimal product_id;
    # The description of the Course(V2 themes currently don't have that info)
    string description?;
    # Deprecated - use 'description'.* - Used in legacy themes to populate the text for a Course card.
    string course_card_text?;
    # Deprecated - Used in legacy themes to designate an intro video from Youtube.
    string intro_video_youtube?;
    # Deprecated - The contact information of the Course.
    string contact_information?;
    # The keywords of the Course
    string keywords?;
    # Deprecated - Used in legacy themes to display the duration of the Course.
    string duration?;
    # Deprecated - use 'course_card_image_url'* - The landing page banner image url of the Course.
    string banner_image_url?;
    # The card image url of the Course
    string course_card_image_url?;
    # Deprecated - Used in legacy themes to designate an intro video from Wistia.
    string intro_video_wistia_identifier?;
    decimal[] administrator_user_ids?;
    decimal[] chapter_ids;
    # A boolean indicating whether reviews are enabled for the Course
    boolean reviews_enabled;
    # The ID of the User that created the Course
    decimal user_id?;
    # The ID of the Instructor of the Course
    decimal instructor_id;
};

public type GroupResponse record {
    # The ID of the Group
    decimal id;
    # The name of the Group
    string name;
    # The 8-character unique identifier for the Group
    string token;
    # The date/time the Group was created
    string created_at;
};

public type UserResponse record {
    # User's ID
    decimal id?;
    # User's created date
    string created_at?;
    # The first name of the User.
    string first_name?;
    # The last name of the User.
    string last_name?;
    # The email of the User.
    string full_name?;
    # The company of the User.
    string company?;
    # User's email
    string email?;
    # Any specific roles that the User should be placed in. Possible roles are: affiliate, course_admin, group_analyst, site_admin.
    string[] roles?;
    # The fully-qualified avatar url of the User.
    string avatar_url?;
    # The bio of the User.
    string bio?;
    # The headline/title of the User.
    string headline?;
    # The affiliate code of the User. ** Required only if the User is an affiliate. **
    string affiliate_code?;
    # User's external source
    string external_source?;
    # The affiliate commission % of the User. ** Required only if the User is an affiliate. This should be greater than 0 and less than or equal to 100. **
    decimal affiliate_commission?;
    # The affiliate payout type, it can be either % (percentage, default) or $ (fixed amount). ** Required only if the User is an affiliate. **
    string affiliate_commission_type?;
    # The email of the User. ** Required only if the user is an affiliate. Used to pay the User out. **
    string affiliate_payout_email?;
    # User's administered course ids
    decimal[] administered_course_ids?;
    # Custom profile fields for the User.
    CustomProfileField[] custom_profile_fields?;
};

public type ErrorNotFound record {
    # item not found error
    string 'error?;
};

public type GroupRequest record {
    # The name of the Group
    string name;
};

public type PromotionRequest record {
    # The name of the Promotion.
    string name;
    # A description for the Promotion.
    string description?;
    # The date and time when the Promotion begins.
    string starts_at?;
    # The date and time when the Promotion ends.
    string expires_at?;
    # The type of discount. Must be either 'fixed' or 'percentage'.
    string discount_type;
    # The amount of the discount. If 'fixed', must be a dollar value. If 'percentage', must be a number greater than 0 and less than or equal to 100.
    decimal amount;
    # The Products to apply the Promotion to. If none are specified, the Promotion is applicable to all Products.
    decimal[] product_ids?;
    # The coupon ids related to the promotion.
    decimal[] coupon_ids?;
    # The duration for which the Promotion is applied. ** This value only applies to Promotions set on Products that are set as subscriptions or Payment Plans. **
    decimal duration?;
};

public type InstructorResponse record {
    # The ID of the Instructor as an integer.
    decimal id;
    # The ID of the User owning the Instructor
    decimal user_id?;
    # The title of the Instructor
    string title?;
    # The first name of the Instructor.
    string first_name;
    # The last name of the Instructor.
    string last_name;
    # The bio of the Instructor
    string bio?;
    # The slug of the Instructor NOTE: This will be removed in future API versions
    string slug?;
    # The fully-qualified url of the Instructor's avatar
    string avatar_url?;
    # The email of the Instructor
    string email?;
    # The date/time that the Instructor was created.
    string created_at;
};

public type UnprocessableEntityError record {
    ValidationError[] errors?;
};

public type CreateEnrollmentRequest record {
    # The ID of the Course as an integer.
    decimal course_id?;
    # The ID of the User owning the Enrollment as an integer.
    decimal user_id?;
    # The date/time at which the Enrollment is activated. If not provided, the Enrollment is a free trial.
    string activated_at?;
    # The date/time at which the Enrollment expired. If not provided, the Enrollment does not expire.
    string expiry_date?;
};

public type InstructorRequest record {
    # The ID of the User owning the Instructor
    decimal user_id?;
    # The title of the Instructor
    string title?;
    # The first name of the Instructor
    string first_name;
    # The last name of the Instructor
    string last_name;
    # The bio of the Instructor
    string bio?;
    # The slug of the Instructor NOTE: This will be removed in future API versions
    string slug;
    # The fully-qualified url of the Instructor's avatar
    string avatar_url?;
    # The email of the Instructor
    string email?;
};

public type GetCourseReviewsResponse record {
    CourseReviewResponse[] items;
    Meta meta;
};

public type CreateGroupUsersRequest record {
    # The ID of the User to add to Groups
    decimal user_id;
    # The list of Group names to add selected User to
    string[] group_names;
};

public type ProductPriceResponse record {
    # The ID of the Product Price as an integer.
    decimal id?;
    # A boolean indicating whether the Product Price is the default.
    boolean is_primary?;
    # The type of payment. Must be one of 'free', 'one-time', 'subscription', or 'payment-plan'.
    string payment_type?;
    # The description for the Product Price. This value is required when is_primary is false.
    string label?;
    # The amount in dollars to be charged.
    string price?;
    # The number of days, after purchase, that a student will be enrolled in the course.
    string days_until_expiry?;
    # This text that is displayed on the Buy Button on the course card and the course landing page.
    string pay_button_text?;
    # The number of recurring payments for a Product Price with payment_type of 'payment-plan'.
    string number_of_payments?;
    # The billing frequency. Must be one of 'month' or 'year'.
    string interval?;
    # The number of intervals between billings. For example, if interval is 'month' and interval_count is '1', the billing frequency is once every month.
    string interval_count?;
    # The interval for the trial period. Must be one of 'day' or 'month'.
    string trial_interval?;
    # The number of intervals for the trial period. For example, if trial_interval is 'month' and trial_interval_count is '6', the free trial will end (and regular payments will begin) in 6 months.
    string trial_interval_count?;
    # Students pay this amount for the first payment period of the subscription.
    string custom_first_price?;
    # The name of the Product Price. If is_primary is true, returns the name of the product, otherwise returns "{Product name} - {Product Price label}".
    string price_name?;
    # The three-letter ISO currency code of the Product Price. Must be a supported currency.
    string currency?;
};

public type CreateCouponRequest record {
    # The Coupon code.
    string code;
    # A note associated with the Coupon. NOTE: this will be deprecated in future versions of the API.
    string note?;
    # The number of times the Coupon can be used. If this value if not set, the Coupon can be used an unlimited number of times.
    decimal quantity?;
};
