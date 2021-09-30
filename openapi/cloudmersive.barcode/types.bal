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

# Matching product for the input barcode
public type ProductMatch record {
    # EAN code for the product
    string EAN?;
    # Title of the product
    string Title?;
};

# Result of the barcode scan
public type BarcodeScanResult record {
    # True if the operation was successful, false otherwise
    boolean Successful?;
    # The type of the barcode; possible values are AZTEC, CODABAR, CODE_39, CODE_93, CODE_128, DATA_MATRIX, EAN_8, EAN_13, ITF, MAXICODE, PDF_417, QR_CODE, RSS_14, RSS_EXPANDED, UPC_A, UPC_E, All_1D, UPC_EAN_EXTENSION, MSI, PLESSEY, IMB
    string BarcodeType?;
    # The barcode text
    string RawText?;
};

# Result of performing a barcode lookup
public type BarcodeLookupResponse record {
    # True if operation was successful, false otherwise
    boolean Successful?;
    # Resulting product matches for the input barcode
    ProductMatch[] Matches?;
};
