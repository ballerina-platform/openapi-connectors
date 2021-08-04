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

import ballerina/http;

public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# This is a generated connector for [eBay logistics API v1_beta.0.0](https://developer.ebay.com/api-docs/sell/logistics/static/overview.html) OpenAPI Specification.
# This is an API available only to select developers approved by business units.The Logistics API resources offer the following capabilities: 
# shipping_quote Consolidates into a list a set of live shipping rates, or quotes, from which you can select a rate to ship a package. 
# shipment creates a "shipment" for the selected shipping rate. Call createShippingQuote to get a list of live shipping rates. 
# The rates returned are all valid for a specific time window and all quoted prices are at eBay-negotiated rates. Select 
# one of the live rates and using its associated rateId, create a "shipment" for the package by calling createFromShippingQuote. 
# Creating a shipment completes an agreement, and the cost of the base service and any added shipping options are summed into the 
# returned totalShippingCost value. This action also generates a shipping label that you can use to ship the package.  The total 
# cost of the shipment is incurred when the package is shipped using the supplied shipping label. Sellers must set up a payment 
# method via their eBay account before they can use the methods in this API to create a shipment and the associated shipping label.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [developer account](https://developer.ebay.com/api-docs/static/creating-edp-account.html)  and obtain tokens following [this guide](https://developer.ebay.com/api-docs/static/oauth-tokens.html).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.ebay.com/sell/logistics/v1_beta") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # The createShippingQuote method returns a shipping quote that contains a list of live rates. Each rate represents an offer made by a shipping carrier for a specific service and each offer has a live quote for the base service cost. Rates have a time window in which they are live, and rates expire when their purchase window ends. If offered by the carrier, rates can include shipping options (and their associated prices), and users can add any offered shipping option to the base service should they desire. Also, depending on the services required, rates can also include pickup and delivery windows. Each rate is for a single package and is based on the following information: The shipping origin The shipping destination The package size (weight and dimensions) Rates are identified by a unique eBay-assigned rateId and rates are based on price points, pickup and delivery time frames, and other user requirements. Because each rate offered must be compliant with the eBay shipping program, all rates reflect eBay-negotiated prices. The various rates returned in a shipping quote offer the user a choice from which they can choose a shipping service that best fits their needs. Select the rate for your shipment and using the associated rateId, call cerateFromShippingQuote to create a shipment and generate a shipping label that you can use to ship the package.
    #
    # + payload - The request object for createShippingQuote.
    # + return - Created
    remote isolated function createShippingQuote(ShippingQuoteRequest payload) returns ShippingQuote|error {
        string  path = string `/shipping_quote`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ShippingQuote response = check self.clientEp->post(path, request, targetType=ShippingQuote);
        return response;
    }
    # This method retrieves the complete details of the shipping quote associated with the specified shippingQuoteId value. A shipping quote pertains to a single specific package and contains a set of shipping rates that quote the cost to ship the package by different shipping carriers and services. The quotes are based on the package's origin, destination, and size. Call createShippingQuote to create a shippingQuoteId.
    #
    # + shippingQuoteId - This path parameter specifies the unique eBay-assigned ID of the shipping quote you want to retrieve. The shippingQuoteId value is generated and returned by a call to createShippingQuote.
    # + return - Success
    remote isolated function getShippingQuote(string shippingQuoteId) returns ShippingQuote|error {
        string  path = string `/shipping_quote/${shippingQuoteId}`;
        ShippingQuote response = check self.clientEp-> get(path, targetType = ShippingQuote);
        return response;
    }
    # This method creates a shipment based on the shippingQuoteId and rateId values supplied in the request. The rate identified by the rateId value specifies the carrier and service for the package shipment, and the rate ID must be contained in the shipping quote identified by the shippingQuoteId value. Call createShippingQuote to retrieve a set of live shipping rates. When you create a shipment, eBay generates a shipping label that you can download and use to ship your package. In a createFromShippingQuote request, sellers can include a list of shipping options they want to add to the base service quoted in the selected rate. The list of available shipping options is specific to each quoted rate and if available, the options are listed in the rate container of the of the shipping quote. In addition to a configurable return-to location and other details about the shipment, the response to this method includes: The shipping carrier and service to be used for the package shipment A list of selected shipping options, if any The shipment tracking number The total shipping cost (the sum cost of the base shipping service and any added options) When you create a shipment, your billing agreement account is charged the sum of the baseShippingCost and the total cost of any additional shipping options you might have selected. Use the URL returned in labelDownloadUrl field, or call downloadLabelFile with the shipmentId value from the response, to download a shipping label for your package. Important! Sellers must set up their payment method with eBay before they can use this method to create a shipment and the associated shipping label.
    #
    # + payload - The create shipment from quote request.
    # + return - Created
    remote isolated function createFromShippingQuote(CreateShipmentFromQuoteRequest payload) returns Shipment|error {
        string  path = string `/shipment/create_from_shipping_quote`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Shipment response = check self.clientEp->post(path, request, targetType=Shipment);
        return response;
    }
    # This method retrieves the shipment details for the specified shipment ID. Call createFromShippingQuote to generate a shipment ID.
    #
    # + shipmentId - This path parameter specifies the unique eBay-assigned ID of the shipment you want to retrieve. The shipmentId value is generated and returned by a call to createFromShippingQuote.
    # + return - Success
    remote isolated function getShipment(string shipmentId) returns Shipment|error {
        string  path = string `/shipment/${shipmentId}`;
        Shipment response = check self.clientEp-> get(path, targetType = Shipment);
        return response;
    }
    # This method returns the shipping label file that was generated for the shipmentId value specified in the request. Call createFromShippingQuote to generate a shipment ID. Use the Accept HTTP header to specify the format of the returned file. The default file format is a PDF file.
    #
    # + shipmentId - This path parameter specifies the unique eBay-assigned ID of the shipment associated with the shipping label you want to download. The shipmentId value is generated and returned by a call to createFromShippingQuote.
    # + return - Success
    remote isolated function downloadLabelFile(string shipmentId) returns string[]|error {
        string  path = string `/shipment/${shipmentId}/download_label_file`;
        string[] response = check self.clientEp-> get(path, targetType = stringArr);
        return response;
    }
    # This method cancels the shipment associated with the specified shipment ID and the associated shipping label is deleted. When you cancel a shipment, the totalShippingCost of the canceled shipment is refunded to the account established by the user's billing agreement. Note that you cannot cancel a shipment if you have used the associated shipping label.
    #
    # + shipmentId - This path parameter specifies the unique eBay-assigned ID of the shipment to be canceled. The shipmentId value is generated and returned by a call to createFromShippingQuote.
    # + return - Success
    remote isolated function cancelShipment(string shipmentId) returns Shipment|error {
        string  path = string `/shipment/${shipmentId}/cancel`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Shipment response = check self.clientEp-> post(path, request, targetType = Shipment);
        return response;
    }
}
