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

import ballerina/url;
import ballerina/mime;

type SimpleBasicType string|boolean|int|float|decimal;

# Represents encoding mechanism details.
type Encoding record {
    # Defines how multiple values are delimited
    string style = FORM;
    # Specifies whether arrays and objects should generate as separate fields
    boolean explode = true;
    # Specifies the custom content type
    string contentType?;
    # Specifies the custom headers
    map<any> headers?;
};

enum EncodingStyle {
    DEEPOBJECT,
    FORM,
    SPACEDELIMITED,
    PIPEDELIMITED
}

# Get Encoded URI for a given value.
#
# + value - Value to be encoded
# + return - Encoded string
isolated function getEncodedUri(anydata value) returns string {
    string|error encoded = url:encode(value.toString(), "UTF8");
    if (encoded is string) {
        return encoded;
    } else {
        return value.toString();
    }
}

isolated function createBodyParts(record {|anydata...; |} anyRecord, map<Encoding> encodingMap = {})
returns mime:Entity[]|error {
    mime:Entity[] entities = [];
    foreach [string, anydata] [key, value] in anyRecord.entries() {
        Encoding encodingData = encodingMap.hasKey(key) ? encodingMap.get(key) : {};
        mime:Entity entity = new mime:Entity();
        if value is byte[] {
            entity.setByteArray(value);
        } else if value is SimpleBasicType|SimpleBasicType[] {
            entity.setText(value.toString());
        } else if value is record {}|record {}[] {
            entity.setJson(value.toJson());
        }
        if (encodingData?.contentType is string) {
            check entity.setContentType(encodingData?.contentType.toString());
        }
        map<any>? headers = encodingData?.headers;
        if (headers is map<any>) {
            foreach var [headerName, headerValue] in headers.entries() {
                if headerValue is SimpleBasicType {
                    entity.setHeader(headerName, headerValue.toString());
                }
            }
        }
        entities.push(entity);
    }
    return entities;
}
