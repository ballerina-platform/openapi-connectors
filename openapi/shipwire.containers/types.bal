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

# Request to update container information
public type UpdateAContainerRequest record {
    # A unique user-provided identifier for a Shipwire Anywhere warehouse in an external system.
    string warehouseExternalId?;
    # A unique user-provided identifier for a container in an external system.
    string externalId?;
    # A unique identifier for the container in the Shipwire system. It can be standardized to be the dimensions of the container (length, width, height) and type.
    string name;
    # This is the type of container based on the contents stored in it.
    string 'type;
    # A boolean which indicates whether or not the warehouse can use the container for a particular customer for packaging
    int isActive;
    # A unique identifier for a Shipwire or Shipwire Anywhere warehouse. (See the warehouses API.)
    int warehouseId;
    # Basis is a parameter used to prioritize the use of some containers over others. To give preference to one container over another, assign a higher basis value.
    string basis;
    # It indicates that this container is used with a particular carrier service (eg. FDX 1D).
    string serviceSpecificCarrierCode?;
    # Dimensions
    record {} dimensions;
    # Values
    record {} values;
};

# Response for container update
public type UpdateAContainerResponse record {
    *PutPostResponseModel;
};

# Container dimensions
public type ContainerDimensions record {
    # This is the length of the container based on its Unit of Measurement (lengthUnit)
    decimal length?;
    # This is the width of the container based on its Unit of Measurement (widthUnit)
    decimal width?;
    # This is the height of the container based on its Unit of Measurement (heightUnit)
    float height?;
    # This is the weight of the container based on its Unit of Measurement (weightUnit)
    float weight?;
    # This is the maximum weight that the container can hold based on its Unit of Measurement (maxWeightUnit)
    float maxWeight?;
    # This is the Unit of Measurement for Container length (e.g. inches)
    string lengthUnit?;
    # This is the Unit of Measurement for Container width (e.g. inches)
    string widthUnit?;
    # This is the Unit of Measurement for Container height (e.g. inches)
    string heightUnit?;
    # This is the Unit of Measurement for Container weight (e.g. pounds)
    string weightUnit?;
    # This is the Unit of Measurement for Container's max weight (e.g. pounds)
    string maxWeightUnit?;
};

public type GetResponseModel record {
    # This is the HTTP status code.
    int status?;
    # This is the HTTP status message.
    string message?;
    # A URL that gives more information about the linked resource. A null value would mean that no further information is available for that resource.
    string resourceLocation?;
};

# Get container details
public type GetContainersResponse record {
    *GetResponseModel;
};

public type Get404ResponseModel record {
    # This is the HTTP status code.
    int status?;
    # This is the HTTP status message.
    string message?;
    # A URL that gives more information about the linked resource. A null value would mean that no further information is available for that resource.
    string resourceLocation?;
};

# Container value
public type ContainerValue record {
    # This is the cost value for the container. During the carton selection phase for an order, Shipwire will first consider containers with a lower cost, even if chosing one will end up making the shipping cost comparatively higher. (i.e. Shipwire will chose a container 1 with a $0 cost over a container 2 with a $1 cost, even if the shipping cost for using container 1 is higher than it would be using container 2.)
    decimal costValue?;
    # This is the retail value for the container. Container retail value will be added to the shipping quote for the customer. If a merchant doesn't plan to charge customers for cartons/boxes, the container retail value should be set to $0.
    decimal retailValue?;
    # This is the currency used in determining cost value for the container.
    string costValueCurrency?;
    # This is the currency used in determining retail value for the container.
    string retailValueCurrency?;
};

# Get using invalid container Id
public type ContainerNotFound404Response record {
    *Get404ResponseModel;
};

# Container response model
public type ContainerResponseModel record {
    # A unique auto-generated ID assigned to each new container added to the Shipwire Platform.
    int id?;
    # A unique user-provided identifier for a container in an external system.
    string externalId?;
    # A unique identifier for the container in the Shipwire system. It can be standardized to be the dimensions of the container (length, width, height) and type.
    string name?;
    # This is the type of container based on the contents stored in it.
    string 'type?;
    # A boolean which indicates whether or not the warehouse can use the container for a particular customer for packaging
    int isActive?;
    # A unique identifier for a Shipwire or Shipwire Anywhere warehouse. (See the warehouses API.)
    int warehouseId?;
    # A unique user-provided identifier for a Shipwire Anywhere warehouse in an external system.
    string warehouseExternalId?;
    # Basis is a parameter used to prioritize the use of some containers over others. To give preference to one container over another, assign a higher basis value.
    string basis?;
    # It indicates that this container is used with a particular carrier service (eg. FDX 1D).
    string serviceSpecificCarrierCode?;
    # Dimensions
    ContainerresponsemodelDimensions dimensions?;
    # Values
    ContainerresponsemodelValues values?;
};

# Response post container creation
public type CreateANewContainerResponse record {
    *PutPostResponseModel;
};

public type PutPostResponseModel record {
    # This is the HTTP status code.
    int status?;
    # This is the HTTP status message.
    string message?;
    # A notification that warns the user of something or that serves as a caution. Eg. an externalId supplied greater than 32 characters.
    record {} warnings?;
    # A fatal error that prevents the user from performing some action. (e.g. invalid warehouseId specified when creating a container)
    record {} errors?;
    # A URL that gives more information about the linked resource. A null value would mean that no further information is available for that resource.
    string resourceLocation?;
};

# Dimensions
public type ContainerresponsemodelDimensions record {
    # Resource location
    string resourceLocation?;
    # Container dimensions
    ContainerDimensions 'resource?;
};

# Get container details
public type GetAContainerResponse record {
    # This is the HTTP status code.
    int status?;
    # This is the HTTP status message.
    string message?;
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string resourceLocation?;
    # Container response model
    ContainerResponseModel 'resource?;
};

# Values
public type ContainerresponsemodelValues record {
    # Resource location
    string resourceLocation?;
    # Container value
    ContainerValue 'resource?;
};

# Request to create new container
public type CreateANewContainerRequest record {
    # A unique user-provided identifier for a Shipwire Anywhere warehouse in an external system.
    string warehouseExternalId?;
    # A unique user-provided identifier for a container in an external system.
    string externalId?;
    # A unique identifier for the container in the Shipwire system. It can be standardized to be the dimensions of the container (length, width, height) and type.
    string name;
    # This is the type of container based on the contents stored in it.
    string 'type;
    # A boolean which indicates whether or not the warehouse can use the container for a particular customer for packaging
    int isActive;
    # A unique identifier for a Shipwire or Shipwire Anywhere warehouse. (See the warehouses API.)
    int warehouseId;
    # Basis is a parameter used to prioritize the use of some containers over others. To give preference to one container over another, assign a higher basis value.
    string basis;
    # It indicates that this container is used with a particular carrier service (eg. FDX 1D).
    string serviceSpecificCarrierCode?;
    # Dimensions
    record {} dimensions;
    # Values
    record {} values;
};
