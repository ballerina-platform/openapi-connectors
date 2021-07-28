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

public type AssetTypeArr AssetType[];

# See Asset Status Codes.
#
public type AssetStatusQueryParam string;

public type BookDepreciationSetting record {
    # The method of averaging applied to this asset. See Averaging Methods
    string averagingMethod?;
    # Unique Xero identifier for the effective date change
    string bookEffectiveDateOfChangeId?;
    # Unique Xero identifier for the depreciable object
    string depreciableObjectId?;
    # The type of asset object
    string depreciableObjectType?;
    # See Depreciation Calculation Methods
    string depreciationCalculationMethod?;
    # The method of depreciation applied to this asset. See Depreciation Methods
    string depreciationMethod?;
    # The rate of depreciation (e.g. 0.05)
    float depreciationRate?;
    # Effective life of the asset in years (e.g. 5)
    int effectiveLifeYears?;
};

public type Pagination record {
    int itemCount?;
    int page?;
    int pageCount?;
    int pageSize?;
};

public type ResourceValidationErrorsElement record {
    # Detail of the resource validation error
    string detail?;
    # Explanation of the resource validation error
    string localisedMessage?;
    # The field name of the erroneous field
    string resourceName?;
    # Title of the resource validation error
    string title?;
    # Internal type of the resource error message
    string 'type?;
};

public type AssetType record {
    # The account for accumulated depreciation of fixed assets of this type
    string accumulatedDepreciationAccountId?;
    # Xero generated unique identifier for asset types
    string assetTypeId?;
    # The name of the asset type
    string assetTypeName;
    BookDepreciationSetting bookDepreciationSetting;
    # The expense account for the depreciation of fixed assets of this type
    string depreciationExpenseAccountId?;
    # The asset account for fixed assets of this type
    string fixedAssetAccountId?;
    # All asset types that have accumulated depreciation for any assets that use them are deemed ‘locked’ and cannot be removed.
    int locks?;
};

public type BookDepreciationDetail record {
    # The value of the asset you want to depreciate, if this is less than the cost of the asset.
    float costLimit?;
    # All depreciation occurring in the current financial year.
    float currentAccumDepreciationAmount?;
    # When an asset is disposed, this will be the sell price minus the purchase price if a profit was made.
    float currentCapitalGain?;
    # When an asset is disposed, this will be the lowest one of sell price or purchase price, minus the current book value.
    float currentGainLoss?;
    # YYYY-MM-DD
    string depreciationStartDate?;
    # All depreciation prior to the current financial year.
    float priorAccumDepreciationAmount?;
    # The value of the asset remaining when you've fully depreciated it.
    float residualValue?;
};

public type Assets record {
    Asset[] items?;
    Pagination pagination?;
};

public type FieldValidationErrorsElement record {
    # Detail of the field validation error
    string detail?;
    # The field name of the erroneous field
    string fieldName?;
    # Explanation of the field validation error
    string localisedMessage?;
    # Title of the field validation error
    string title?;
    # Internal type of the field validation error message
    string 'type?;
    # The provided value
    string valueProvided?;
};

public type Setting record {
    # The prefix used for fixed asset numbers (“FA-” by default)
    string assetNumberPrefix?;
    # The next available sequence number
    string assetNumberSequence?;
    # The date depreciation calculations started on registered fixed assets in Xero
    string assetStartDate?;
    # Default account that capital gains are posted to
    string defaultCapitalGainOnDisposalAccountId?;
    # Default account that gains are posted to
    string defaultGainOnDisposalAccountId?;
    # Default account that losses are posted to
    string defaultLossOnDisposalAccountId?;
    # The last depreciation date
    string lastDepreciationDate?;
    # opt in for tax calculation
    boolean optInForTax?;
};

public type Asset record {
    # The accounting value of the asset
    float accountingBookValue?;
    # The Xero-generated Id for the asset
    string assetId?;
    # The name of the asset
    string assetName;
    # Must be unique.
    string assetNumber?;
    # See Asset Status Codes.
    AssetStatus assetStatus?;
    # The Xero-generated Id for the asset type
    string assetTypeId?;
    BookDepreciationDetail bookDepreciationDetail?;
    BookDepreciationSetting bookDepreciationSetting?;
    # Boolean to indicate whether depreciation can be rolled back for this asset individually. This is true if it doesn't have 'legacy' journal entries and if there is no lock period that would prevent this asset from rolling back.
    boolean canRollback?;
    # The date the asset was disposed
    string disposalDate?;
    # The price the asset was disposed at
    float disposalPrice?;
    # Boolean to indicate whether delete is enabled
    boolean isDeleteEnabledForDate?;
    # The date the asset was purchased YYYY-MM-DD
    string purchaseDate?;
    # The purchase price of the asset
    float purchasePrice?;
    # The asset's serial number
    string serialNumber?;
    # The date the asset’s warranty expires (if needed) YYYY-MM-DD
    string warrantyExpiryDate?;
};

public type Error record {
    # Detail of the error
    string detail?;
    # Array of elements of field validation errors
    FieldValidationErrorsElement[] fieldValidationErrors?;
    # Array of elements of resource validation errors
    ResourceValidationErrorsElement[] resourceValidationErrors?;
    # Title of the error
    string title?;
    # The internal type of error, not accessible externally
    string 'type?;
};

# See Asset Status Codes.
#
public type AssetStatus string;
