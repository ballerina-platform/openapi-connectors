## Overview
* Explain What does this module do*
 
This module supports <version> version.
 
## Obtaining tokens
### Prerequisites
* If you don't have a Mailchimp account already, you’ll need to [create one](https://login.mailchimp.com/signup/) in order to use the API.
### Obtaining tokens
1. Navigate to the [API Keys section](https://us1.admin.mailchimp.com/account/api/) of your Mailchimp account.
2. If you already have an API key listed and you’d like to use it for your application, simply copy it. Otherwise, click Create a Key and give it a descriptive name that will remind you which application it’s used for.
 
## Quickstart

### API Root URL
The root url for the API is https://<dc>.api.mailchimp.com/3.0/. The <dc> part of the URL corresponds to the data center for your account. For example, if the data center for your account is us6, all API endpoints for your account are available relative to https://us6.api.mailchimp.com/3.0/.

There are a few ways to find your data center. It’s the first part of the URL you see in the API keys section of your account; if the URL is https://us6.mailchimp.com/account/api/, then the data center subdomain is `us6`. It’s also appended to your API key in the form key-dc; if your API key is `0123456789abcdef0123456789abcde-us6`, then the data center subdomain is `us6`.


### Creating a Client

To use the connector, first you must create a `mailchimp:Client` object. The samples for creating a Mailchimp client can be found below.

```ballerina
mailchimp:ClientConfig clientConfig = {
    authConfig: {
        username: "<username>",
        password: "<API_KEY>"
    }
};

mailchimp:Client mailchimpClient = check new (clientConfig,"<API_Root_URL>");
```

 
## Snippets
### Health Check - Ping Operation

 ```ballerina
   mailchimp:GetPingResponse getPingResponse = check mailchimpClient->getPing();
   log:printInfo(getPingResponse?.health_status);
   ```
 
 ### Get Campaigns

 ```ballerina
    mailchimp:GetCampaignsResponse campaigns = check mailchimpClient->getCampaigns();
    log:printInfo("Response: ", campaigns=campaigns);
 ```

 ### Create a Campaign 

 ```ballerina
    mailchimp:PostCampaignsRequest campaignCreateRequest = {
        'type: "regular"
    };

    mailchimp:PostCampaignsResponse campaignCreateResponse = check mailchimpClient->postCampaigns(campaignCreateRequest);
    log:printInfo("Response: ", createdCampaign=campaignCreateResponse);
 ```
