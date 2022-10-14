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

public type InlineResponse200Arr InlineResponse200[];

public type InlineResponse2001Arr InlineResponse2001[];

public type SubscriptionDataArr SubscriptionData[];

public type NotificationactionUrlbackgroundoptionsHttpheader record {
    string 'key?;
    string value?;
};

# Configuration for a web request.
public type NotificationactionUrlbackgroundoptions record {
    # HTTP Method (GET, POST, PUT)
    string httpMethod?;
    # HTTP Content Type
    string httpContentType?;
    # Request body
    string httpBody?;
    # HTTP Headers
    NotificationactionUrlbackgroundoptionsHttpheader[] httpHeader?;
};

public type NotificationAction record {
    # Name of the action.
    string name;
    # Value that will be passed as input to this action when executed.
    string input?;
    # URL that will be opened.
    string url?;
    # HomeKit scene that will be set.
    string homekit?;
    # If true, run the Shortcut or HomeKit scenes on the Automation Server.
    boolean runOnServer?;
    # Online Action that will be executed.
    string online?;
    # Configuration for a web request.
    NotificationactionUrlbackgroundoptions urlBackgroundOptions?;
    # Shortcut that will be run.
    string shortcut?;
    # If true, this action will not dismiss the notification
    boolean keepNotification?;
};

public type Execute record {
    # Value that is passed as input to the shortcut.
    string input?;
};

public type SubscriptionData record {
    # ID of the subscription.
    string id?;
    # Name of the service that registered it.
    string serviceName?;
    # Identifier of the online action.
    string actionName?;
    # URL of the registered webhook
    string url?;
    # True if the URL should be triggered locally.
    boolean isLocalUrl?;
};

public type InlineResponse2001 record {
    # Name of the notification definition
    string id?;
    # Title of the notification
    string title?;
};

public type InlineResponse200 record {
    # Name of the device
    string id?;
};

public type InlineResponse2002 record {
    # ID of the subscription
    string id?;
};

public type Subscription record {
    # A unique name to identify the online action.
    string actionName;
    # The URL to which EventData will be posted to.
    string url;
    # If set to true, the device will call the webhook on its local network.
    boolean isLocalUrl?;
};

public type GeneralError record {
    # Error message
    string 'error?;
};

public type Notification record {
    # Text that is used instead of the one defined in the app.
    string text?;
    # Title that is used instead of the one defined in the app.
    string title?;
    # Value that is passed as input to the notification action.
    string input?;
    NotificationAction defaultAction?;
    # Name of importet image, or URL to an image. (https or local network)
    string image?;
    # Name of a sound that is used to the notification.
    string sound?;
    # List of dynamic actions that will added or merged with the static ones.
    NotificationAction[] actions?;
    # List of devices this notification is sent to. (default is all devices)
    string[] devices?;
};

public type EventData record {
    # Unique id of trigger event
    string id?;
    # Name of the triggered action.
    string actionName?;
    # Input passed with the action.
    string input?;
    # Timestamp of the event
    decimal timestamp?;
};
