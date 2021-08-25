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
import ballerina/url;
import ballerina/lang.'string;

# This is a generated connector for [Presalytics API v1](https://presalytics.io/docs/api-specifications) OpenAPI specification.  
# The Presalytics API provides the capability to automate reports and slide decks creation.
@display {label: "Presalytics", iconPath: "resources/presalytics.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Presalytics account](https://presalytics.io/signup) and obtain tokens by following [this guide](https://presalytics.io/docs/api-specifications/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.presalytics.io/ooxml-automation") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Axes: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function chartAxesGetId(string id) returns ChartAxes|error {
        string  path = string `/Charts/Axes/${id}`;
        ChartAxes response = check self.clientEp-> get(path, targetType = ChartAxes);
        return response;
    }
    # AxisDataTypes: List All Possible Types
    #
    # + return - Success 
    remote isolated function chartAxisdatatypesGet() returns ChartAxisdatatypes[]|error {
        string  path = string `/Charts/AxisDataTypes`;
        ChartAxisdatatypes[] response = check self.clientEp-> get(path, targetType = ChartAxisdatatypesArr);
        return response;
    }
    # AxisDataTypes: Get By Type Id
    #
    # + typeId - Type ID 
    # + return - Success 
    remote isolated function chartAxisdatatypesTypeidGetTypeId(int typeId) returns ChartAxisdatatypes|error {
        string  path = string `/Charts/AxisDataTypes/TypeId/${typeId}`;
        ChartAxisdatatypes response = check self.clientEp-> get(path, targetType = ChartAxisdatatypes);
        return response;
    }
    # AxisDataTypes: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function chartAxisdatatypesGetId(string id) returns ChartAxisdatatypes|error {
        string  path = string `/Charts/AxisDataTypes/${id}`;
        ChartAxisdatatypes response = check self.clientEp-> get(path, targetType = ChartAxisdatatypes);
        return response;
    }
    # ChartData: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function chartChartdataGetId(string id) returns ChartChartdata|error {
        string  path = string `/Charts/ChartData/${id}`;
        ChartChartdata response = check self.clientEp-> get(path, targetType = ChartChartdata);
        return response;
    }
    # Charts: Get Chart Data
    #
    # + id - ID 
    # + return - Success 
    remote isolated function chartsChartsChartupdateGetId(string id) returns ChartChartdatadto|error {
        string  path = string `/Charts/ChartUpdate/${id}`;
        ChartChartdatadto response = check self.clientEp-> get(path, targetType = ChartChartdatadto);
        return response;
    }
    # Charts: Update Chart Data
    #
    # + id - The Chart Id 
    # + payload - The ChartDataDto Object 
    # + return - Success 
    remote isolated function chartsChartsChartupdatePutId(string id, ChartChartdatadto payload) returns http:Response|error {
        string  path = string `/Charts/ChartUpdate/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Charts: Get Dependent Objects Tree
    #
    # + id - ID 
    # + return - Success 
    remote isolated function chartsChartsChildobjectsGetId(string id) returns ChildObjects[]|error {
        string  path = string `/Charts/ChildObjects/${id}`;
        ChildObjects[] response = check self.clientEp-> get(path, targetType = ChildObjectsArr);
        return response;
    }
    # ColumnCollections: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function chartColumncollectionsGetId(string id) returns ChartColumncollections|error {
        string  path = string `/Charts/ColumnCollections/${id}`;
        ChartColumncollections response = check self.clientEp-> get(path, targetType = ChartColumncollections);
        return response;
    }
    # Columns: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function chartColumnsGetId(string id) returns ChartColumns|error {
        string  path = string `/Charts/Columns/${id}`;
        ChartColumns response = check self.clientEp-> get(path, targetType = ChartColumns);
        return response;
    }
    # DataPoints: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function chartDatapointsGetId(string id) returns ChartDatapoints|error {
        string  path = string `/Charts/DataPoints/${id}`;
        ChartDatapoints response = check self.clientEp-> get(path, targetType = ChartDatapoints);
        return response;
    }
    # Charts: Get Details
    #
    # + id - ID 
    # + return - Success 
    remote isolated function chartsChartsDetailsGetId(string id) returns ChartChartsDetails|error {
        string  path = string `/Charts/Details/${id}`;
        ChartChartsDetails response = check self.clientEp-> get(path, targetType = ChartChartsDetails);
        return response;
    }
    # Charts: Get Underlying Xml
    #
    # + id - ID 
    # + updated - Indicates whether API should return the orginal uploaded xml (false) or the actively updated version (true, default) 
    # + return - Success 
    remote isolated function chartsChartsOpenofficexmlGetIdUpdated(string id, boolean updated = true) returns OoxmlDTO|error {
        string  path = string `/Charts/OpenOfficeXml/${id}`;
        map<anydata> queryParam = {"updated": updated};
        path = path + check getPathForQueryParam(queryParam);
        OoxmlDTO response = check self.clientEp-> get(path, targetType = OoxmlDTO);
        return response;
    }
    # Charts: Modify Underlying Xml
    #
    # + id - ID 
    # + payload - OOXML DTO 
    # + return - Success 
    remote isolated function chartsChartsOpenofficexmlPutId(string id, OoxmlDTO payload) returns http:Response|error {
        string  path = string `/Charts/OpenOfficeXml/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # PlotType: List All Possible Types
    #
    # + return - Success 
    remote isolated function chartPlottypeGet() returns ChartPlottype[]|error {
        string  path = string `/Charts/PlotType`;
        ChartPlottype[] response = check self.clientEp-> get(path, targetType = ChartPlottypeArr);
        return response;
    }
    # PlotType: Get By Type Id
    #
    # + typeId - Type ID 
    # + return - Success 
    remote isolated function chartPlottypeTypeidGetTypeId(int typeId) returns ChartPlottype|error {
        string  path = string `/Charts/PlotType/TypeId/${typeId}`;
        ChartPlottype response = check self.clientEp-> get(path, targetType = ChartPlottype);
        return response;
    }
    # PlotType: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function chartPlottypeGetId(string id) returns ChartPlottype|error {
        string  path = string `/Charts/PlotType/${id}`;
        ChartPlottype response = check self.clientEp-> get(path, targetType = ChartPlottype);
        return response;
    }
    # RowCol: List All Possible Types
    #
    # + return - Success 
    remote isolated function chartRowcolGet() returns ChartRowcol[]|error {
        string  path = string `/Charts/RowCol`;
        ChartRowcol[] response = check self.clientEp-> get(path, targetType = ChartRowcolArr);
        return response;
    }
    # RowCol: Get By Type Id
    #
    # + typeId - Type ID 
    # + return - Success 
    remote isolated function chartRowcolTypeidGetTypeId(int typeId) returns ChartRowcol|error {
        string  path = string `/Charts/RowCol/TypeId/${typeId}`;
        ChartRowcol response = check self.clientEp-> get(path, targetType = ChartRowcol);
        return response;
    }
    # RowCol: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function chartRowcolGetId(string id) returns ChartRowcol|error {
        string  path = string `/Charts/RowCol/${id}`;
        ChartRowcol response = check self.clientEp-> get(path, targetType = ChartRowcol);
        return response;
    }
    # RowCollections: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function chartRowcollectionsGetId(string id) returns ChartRowcollections|error {
        string  path = string `/Charts/RowCollections/${id}`;
        ChartRowcollections response = check self.clientEp-> get(path, targetType = ChartRowcollections);
        return response;
    }
    # RowNameFormatTypes: List All Possible Types
    #
    # + return - Success 
    remote isolated function chartRownameformattypesGet() returns ChartRownameformattypes[]|error {
        string  path = string `/Charts/RowNameFormatTypes`;
        ChartRownameformattypes[] response = check self.clientEp-> get(path, targetType = ChartRownameformattypesArr);
        return response;
    }
    # RowNameFormatTypes: Get By Type Id
    #
    # + typeId - Type ID 
    # + return - Success 
    remote isolated function chartRownameformattypesTypeidGetTypeId(int typeId) returns ChartRownameformattypes|error {
        string  path = string `/Charts/RowNameFormatTypes/TypeId/${typeId}`;
        ChartRownameformattypes response = check self.clientEp-> get(path, targetType = ChartRownameformattypes);
        return response;
    }
    # RowNameFormatTypes: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function chartRownameformattypesGetId(string id) returns ChartRownameformattypes|error {
        string  path = string `/Charts/RowNameFormatTypes/${id}`;
        ChartRownameformattypes response = check self.clientEp-> get(path, targetType = ChartRownameformattypes);
        return response;
    }
    # Rows: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function chartRowsGetId(string id) returns ChartRows|error {
        string  path = string `/Charts/Rows/${id}`;
        ChartRows response = check self.clientEp-> get(path, targetType = ChartRows);
        return response;
    }
    # Charts: Get Svg file
    #
    # + id - ID 
    # + useCache - Indicates whether API should retrieve content from a cache if aviable (true, default), or force an update (false) 
    # + return - Returns an svg formatted-image of this object. 
    remote isolated function chartsChartsSvgGetIdUseCache(string id, boolean useCache = false) returns string|error {
        string  path = string `/Charts/Svg/${id}`;
        map<anydata> queryParam = {"use_cache": useCache};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Charts: Get by Id
    #
    # + id - An Id of the respository DTO elemennt 
    # + return - Success 
    remote isolated function chartsChartsGetId(string id) returns ChartCharts|error {
        string  path = string `/Charts/${id}`;
        ChartCharts response = check self.clientEp-> get(path, targetType = ChartCharts);
        return response;
    }
    # Slides: Get Dependent Objects Tree
    #
    # + id - ID 
    # + return - Success 
    remote isolated function slidesConnectionshapesChildobjectsGetId(string id) returns ChildObjects[]|error {
        string  path = string `/ConnectionShapes/ChildObjects/${id}`;
        ChildObjects[] response = check self.clientEp-> get(path, targetType = ChildObjectsArr);
        return response;
    }
    # Slides: Get Details
    #
    # + id - ID 
    # + return - Success 
    remote isolated function slidesConnectionshapesDetailsGetId(string id) returns SlideConnectorDetails|error {
        string  path = string `/ConnectionShapes/Details/${id}`;
        SlideConnectorDetails response = check self.clientEp-> get(path, targetType = SlideConnectorDetails);
        return response;
    }
    # Slides: Get Underlying Xml
    #
    # + id - ID 
    # + updated - Indicates whether API should return the orginal uploaded xml (false) or the actively updated version (true, default) 
    # + return - Success 
    remote isolated function slidesConnectionshapesOpenofficexmlGetIdUpdated(string id, boolean updated = true) returns OoxmlDTO|error {
        string  path = string `/ConnectionShapes/OpenOfficeXml/${id}`;
        map<anydata> queryParam = {"updated": updated};
        path = path + check getPathForQueryParam(queryParam);
        OoxmlDTO response = check self.clientEp-> get(path, targetType = OoxmlDTO);
        return response;
    }
    # Slides: Modify Underlying Xml
    #
    # + id - ID 
    # + payload - OOXML DTO 
    # + return - Success 
    remote isolated function slidesConnectionshapesOpenofficexmlPutId(string id, OoxmlDTO payload) returns http:Response|error {
        string  path = string `/ConnectionShapes/OpenOfficeXml/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Slides: Get Svg file
    #
    # + id - ID 
    # + useCache - Indicates whether API should retrieve content from a cache if aviable (true, default), or force an update (false) 
    # + return - Returns an svg formatted-image of this object. 
    remote isolated function slidesConnectionshapesSvgGetIdUseCache(string id, boolean useCache = false) returns string|error {
        string  path = string `/ConnectionShapes/Svg/${id}`;
        map<anydata> queryParam = {"use_cache": useCache};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # ConnectionShapes: Get by Id
    #
    # + id - An Id of the respository DTO elemennt 
    # + return - Success 
    remote isolated function slidesConnectionshapesGetId(string id) returns SlideConnector|error {
        string  path = string `/ConnectionShapes/${id}`;
        SlideConnector response = check self.clientEp-> get(path, targetType = SlideConnector);
        return response;
    }
    # Documents: Upload
    #
    # + payload - Document to be uploaded 
    # + return - Success 
    remote isolated function documentsPost(StoryFileFormData payload) returns Document[]|error {
        string  path = string `/Documents`;
        http:Request request = new;
        Document[] response = check self.clientEp->post(path, request, targetType=DocumentArr);
        return response;
    }
    # DocumentsController: Get Dependent Objects Tree
    #
    # + id - ID 
    # + return - Success 
    remote isolated function documentsChildobjectsGetId(string id) returns ChildObjects[]|error {
        string  path = string `/Documents/ChildObjects/${id}`;
        ChildObjects[] response = check self.clientEp-> get(path, targetType = ChildObjectsArr);
        return response;
    }
    # Documents: Clone an existing Ooxml Document to new Parent Story
    #
    # + id - the Source document Id 
    # + payload - A DocumentCloneDto object with containing information required for cloning the document 
    # + return - Success 
    remote isolated function documentsClonePostId(string id, DocumentCloneDTO payload) returns Document|error {
        string  path = string `/Documents/Clone/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Document response = check self.clientEp->post(path, request, targetType=Document);
        return response;
    }
    # DocumentType: List All Possible Types
    #
    # + return - Success 
    remote isolated function documentsDocumenttypeGet() returns DocumentType[]|error {
        string  path = string `/Documents/DocumentType`;
        DocumentType[] response = check self.clientEp-> get(path, targetType = DocumentTypeArr);
        return response;
    }
    # DocumentType: Get By Type Id
    #
    # + typeId - Type ID 
    # + return - Success 
    remote isolated function documentsDocumenttypeTypeidGetTypeId(int typeId) returns DocumentType|error {
        string  path = string `/Documents/DocumentType/TypeId/${typeId}`;
        DocumentType response = check self.clientEp-> get(path, targetType = DocumentType);
        return response;
    }
    # DocumentType: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function documentsDocumenttypeGetId(string id) returns DocumentType|error {
        string  path = string `/Documents/DocumentType/${id}`;
        DocumentType response = check self.clientEp-> get(path, targetType = DocumentType);
        return response;
    }
    # Documents: Download
    #
    # + id - ID 
    # + orginal - Is original 
    # + return - Returns an updated version of the OpenOffice Xml file 
    remote isolated function documentsDownloadGetIdOrginal(string id, boolean orginal = false) returns string|error {
        string  path = string `/Documents/Download/${id}`;
        map<anydata> queryParam = {"orginal": orginal};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Documents: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function documentsGetId(string id) returns Document|error {
        string  path = string `/Documents/${id}`;
        Document response = check self.clientEp-> get(path, targetType = Document);
        return response;
    }
    # Documents: Delete by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function documentsDeleteId(string id) returns http:Response|error {
        string  path = string `/Documents/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Slides: Get Dependent Objects Tree
    #
    # + id - ID 
    # + return - Success 
    remote isolated function slidesGroupsChildobjectsGetId(string id) returns ChildObjects[]|error {
        string  path = string `/Groups/ChildObjects/${id}`;
        ChildObjects[] response = check self.clientEp-> get(path, targetType = ChildObjectsArr);
        return response;
    }
    # Slides: Get Details
    #
    # + id - ID 
    # + return - Success 
    remote isolated function slidesGroupsDetailsGetId(string id) returns SlideGroupsDetails|error {
        string  path = string `/Groups/Details/${id}`;
        SlideGroupsDetails response = check self.clientEp-> get(path, targetType = SlideGroupsDetails);
        return response;
    }
    # Slides: Get Underlying Xml
    #
    # + id - ID 
    # + updated - Indicates whether API should return the orginal uploaded xml (false) or the actively updated version (true, default) 
    # + return - Success 
    remote isolated function slidesGroupsOpenofficexmlGetIdUpdated(string id, boolean updated = true) returns OoxmlDTO|error {
        string  path = string `/Groups/OpenOfficeXml/${id}`;
        map<anydata> queryParam = {"updated": updated};
        path = path + check getPathForQueryParam(queryParam);
        OoxmlDTO response = check self.clientEp-> get(path, targetType = OoxmlDTO);
        return response;
    }
    # Slides: Modify Underlying Xml
    #
    # + id - ID 
    # + payload - OOXML DTO 
    # + return - Success 
    remote isolated function slidesGroupsOpenofficexmlPutId(string id, OoxmlDTO payload) returns http:Response|error {
        string  path = string `/Groups/OpenOfficeXml/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Slides: Get Svg file
    #
    # + id - ID 
    # + useCache - Indicates whether API should retrieve content from a cache if aviable (true, default), or force an update (false) 
    # + return - Returns an svg formatted-image of this object. 
    remote isolated function slidesGroupsSvgGetIdUseCache(string id, boolean useCache = false) returns string|error {
        string  path = string `/Groups/Svg/${id}`;
        map<anydata> queryParam = {"use_cache": useCache};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Groups: Get by Id
    #
    # + id - An Id of the respository DTO elemennt 
    # + return - Success 
    remote isolated function slidesGroupsGetId(string id) returns SlideGroups|error {
        string  path = string `/Groups/${id}`;
        SlideGroups response = check self.clientEp-> get(path, targetType = SlideGroups);
        return response;
    }
    # Shared: Get Dependent Objects Tree
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedImagesChildobjectsGetId(string id) returns ChildObjects[]|error {
        string  path = string `/Images/ChildObjects/${id}`;
        ChildObjects[] response = check self.clientEp-> get(path, targetType = ChildObjectsArr);
        return response;
    }
    # Shared: Get Details
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedImagesDetailsGetId(string id) returns SharedPicturesDetails|error {
        string  path = string `/Images/Details/${id}`;
        SharedPicturesDetails response = check self.clientEp-> get(path, targetType = SharedPicturesDetails);
        return response;
    }
    # Image: Download Image
    #
    # + id - The Image Id 
    # + return - Success 
    remote isolated function sharedImagesGetimagePutId(string id) returns http:Response|error {
        string  path = string `/Images/GetImage/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Shared: Get Underlying Xml
    #
    # + id - ID 
    # + updated - Indicates whether API should return the orginal uploaded xml (false) or the actively updated version (true, default) 
    # + return - Success 
    remote isolated function sharedImagesOpenofficexmlGetIdUpdated(string id, boolean updated = true) returns OoxmlDTO|error {
        string  path = string `/Images/OpenOfficeXml/${id}`;
        map<anydata> queryParam = {"updated": updated};
        path = path + check getPathForQueryParam(queryParam);
        OoxmlDTO response = check self.clientEp-> get(path, targetType = OoxmlDTO);
        return response;
    }
    # Shared: Modify Underlying Xml
    #
    # + id - ID 
    # + payload - OoxmlDTO 
    # + return - Success 
    remote isolated function sharedImagesOpenofficexmlPutId(string id, OoxmlDTO payload) returns http:Response|error {
        string  path = string `/Images/OpenOfficeXml/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Shared: Get Svg file
    #
    # + id - ID 
    # + useCache - Indicates whether API should retrieve content from a cache if aviable (true, default), or force an update (false) 
    # + return - Returns an svg formatted-image of this object. 
    remote isolated function sharedImagesSvgGetIdUseCache(string id, boolean useCache = false) returns string|error {
        string  path = string `/Images/Svg/${id}`;
        map<anydata> queryParam = {"use_cache": useCache};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Images: Get by Id
    #
    # + id - An Id of the respository DTO elemennt 
    # + return - Success 
    remote isolated function sharedImagesGetId(string id) returns SharedPictures|error {
        string  path = string `/Images/${id}`;
        SharedPictures response = check self.clientEp-> get(path, targetType = SharedPictures);
        return response;
    }
    # Slides: Get Dependent Objects Tree
    #
    # + id - ID 
    # + return - Success 
    remote isolated function slidesShapetreesChildobjectsGetId(string id) returns ChildObjects[]|error {
        string  path = string `/ShapeTrees/ChildObjects/${id}`;
        ChildObjects[] response = check self.clientEp-> get(path, targetType = ChildObjectsArr);
        return response;
    }
    # Slides: Get Details
    #
    # + id - ID 
    # + return - Success 
    remote isolated function slidesShapetreesDetailsGetId(string id) returns SlideShapetreesDetails|error {
        string  path = string `/ShapeTrees/Details/${id}`;
        SlideShapetreesDetails response = check self.clientEp-> get(path, targetType = SlideShapetreesDetails);
        return response;
    }
    # Slides: Get Underlying Xml
    #
    # + id - ID 
    # + updated - Indicates whether API should return the orginal uploaded xml (false) or the actively updated version (true, default) 
    # + return - Success 
    remote isolated function slidesShapetreesOpenofficexmlGetIdUpdated(string id, boolean updated = true) returns OoxmlDTO|error {
        string  path = string `/ShapeTrees/OpenOfficeXml/${id}`;
        map<anydata> queryParam = {"updated": updated};
        path = path + check getPathForQueryParam(queryParam);
        OoxmlDTO response = check self.clientEp-> get(path, targetType = OoxmlDTO);
        return response;
    }
    # Slides: Modify Underlying Xml
    #
    # + id - ID 
    # + payload - OoxmlDTO 
    # + return - Success 
    remote isolated function slidesShapetreesOpenofficexmlPutId(string id, OoxmlDTO payload) returns http:Response|error {
        string  path = string `/ShapeTrees/OpenOfficeXml/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Slides: Get Svg file
    #
    # + id - ID 
    # + useCache - Indicates whether API should retrieve content from a cache if aviable (true, default), or force an update (false) 
    # + return - Returns an svg formatted-image of this object. 
    remote isolated function slidesShapetreesSvgGetIdUseCache(string id, boolean useCache = false) returns string|error {
        string  path = string `/ShapeTrees/Svg/${id}`;
        map<anydata> queryParam = {"use_cache": useCache};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # ShapeTrees: Get by Id
    #
    # + id - An Id of the respository DTO elemennt 
    # + return - Success 
    remote isolated function slidesShapetreesGetId(string id) returns SlideShapetrees|error {
        string  path = string `/ShapeTrees/${id}`;
        SlideShapetrees response = check self.clientEp-> get(path, targetType = SlideShapetrees);
        return response;
    }
    # Slides: Get Dependent Objects Tree
    #
    # + id - ID 
    # + return - Success 
    remote isolated function slidesShapesChildobjectsGetId(string id) returns ChildObjects[]|error {
        string  path = string `/Shapes/ChildObjects/${id}`;
        ChildObjects[] response = check self.clientEp-> get(path, targetType = ChildObjectsArr);
        return response;
    }
    # Slides: Get Details
    #
    # + id - ID 
    # + return - Success 
    remote isolated function slidesShapesDetailsGetId(string id) returns SlideShapesDetails|error {
        string  path = string `/Shapes/Details/${id}`;
        SlideShapesDetails response = check self.clientEp-> get(path, targetType = SlideShapesDetails);
        return response;
    }
    # Slides: Get Underlying Xml
    #
    # + id - ID 
    # + updated - Indicates whether API should return the orginal uploaded xml (false) or the actively updated version (true, default) 
    # + return - Success 
    remote isolated function slidesShapesOpenofficexmlGetIdUpdated(string id, boolean updated = true) returns OoxmlDTO|error {
        string  path = string `/Shapes/OpenOfficeXml/${id}`;
        map<anydata> queryParam = {"updated": updated};
        path = path + check getPathForQueryParam(queryParam);
        OoxmlDTO response = check self.clientEp-> get(path, targetType = OoxmlDTO);
        return response;
    }
    # Slides: Modify Underlying Xml
    #
    # + id - ID 
    # + payload - OoxmlDTO 
    # + return - Success 
    remote isolated function slidesShapesOpenofficexmlPutId(string id, OoxmlDTO payload) returns http:Response|error {
        string  path = string `/Shapes/OpenOfficeXml/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Slides: Get Svg file
    #
    # + id - ID 
    # + useCache - Indicates whether API should retrieve content from a cache if aviable (true, default), or force an update (false) 
    # + return - Returns an svg formatted-image of this object. 
    remote isolated function slidesShapesSvgGetIdUseCache(string id, boolean useCache = false) returns string|error {
        string  path = string `/Shapes/Svg/${id}`;
        map<anydata> queryParam = {"use_cache": useCache};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Shapes: Get by Id
    #
    # + id - An Id of the respository DTO elemennt 
    # + return - Success 
    remote isolated function slidesShapesGetId(string id) returns SlideShapes|error {
        string  path = string `/Shapes/${id}`;
        SlideShapes response = check self.clientEp-> get(path, targetType = SlideShapes);
        return response;
    }
    # ColorTransformationAttributes: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedColortransformationattributesGetId(string id) returns SharedColortransformationattributes|error {
        string  path = string `/Shared/ColorTransformationAttributes/${id}`;
        SharedColortransformationattributes response = check self.clientEp-> get(path, targetType = SharedColortransformationattributes);
        return response;
    }
    # ColorTransformations: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedColortransformationsGetId(string id) returns SharedColortransformations|error {
        string  path = string `/Shared/ColorTransformations/${id}`;
        SharedColortransformations response = check self.clientEp-> get(path, targetType = SharedColortransformations);
        return response;
    }
    # ColorTypes: List All Possible Types
    #
    # + return - Success 
    remote isolated function sharedColortypesGet() returns SharedColortypes[]|error {
        string  path = string `/Shared/ColorTypes`;
        SharedColortypes[] response = check self.clientEp-> get(path, targetType = SharedColortypesArr);
        return response;
    }
    # ColorTypes: Get By Type Id
    #
    # + typeId - Type ID 
    # + return - Success 
    remote isolated function sharedColortypesTypeidGetTypeId(int typeId) returns SharedColortypes|error {
        string  path = string `/Shared/ColorTypes/TypeId/${typeId}`;
        SharedColortypes response = check self.clientEp-> get(path, targetType = SharedColortypes);
        return response;
    }
    # ColorTypes: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedColortypesGetId(string id) returns SharedColortypes|error {
        string  path = string `/Shared/ColorTypes/${id}`;
        SharedColortypes response = check self.clientEp-> get(path, targetType = SharedColortypes);
        return response;
    }
    # DashTypes: List All Possible Types
    #
    # + return - Success 
    remote isolated function sharedDashtypesGet() returns SharedDashtypes[]|error {
        string  path = string `/Shared/DashTypes`;
        SharedDashtypes[] response = check self.clientEp-> get(path, targetType = SharedDashtypesArr);
        return response;
    }
    # DashTypes: Get By Type Id
    #
    # + typeId - Type ID 
    # + return - Success 
    remote isolated function sharedDashtypesTypeidGetTypeId(int typeId) returns SharedDashtypes|error {
        string  path = string `/Shared/DashTypes/TypeId/${typeId}`;
        SharedDashtypes response = check self.clientEp-> get(path, targetType = SharedDashtypes);
        return response;
    }
    # DashTypes: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedDashtypesGetId(string id) returns SharedDashtypes|error {
        string  path = string `/Shared/DashTypes/${id}`;
        SharedDashtypes response = check self.clientEp-> get(path, targetType = SharedDashtypes);
        return response;
    }
    # EffectAttributes: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedEffectattributesGetId(string id) returns SharedEffectattributes|error {
        string  path = string `/Shared/EffectAttributes/${id}`;
        SharedEffectattributes response = check self.clientEp-> get(path, targetType = SharedEffectattributes);
        return response;
    }
    # EffectTypes: List All Possible Types
    #
    # + return - Success 
    remote isolated function sharedEffecttypesGet() returns SharedEffecttypes[]|error {
        string  path = string `/Shared/EffectTypes`;
        SharedEffecttypes[] response = check self.clientEp-> get(path, targetType = SharedEffecttypesArr);
        return response;
    }
    # EffectTypes: Get By Type Id
    #
    # + typeId - Type ID 
    # + return - Success 
    remote isolated function sharedEffecttypesTypeidGetTypeId(int typeId) returns SharedEffecttypes|error {
        string  path = string `/Shared/EffectTypes/TypeId/${typeId}`;
        SharedEffecttypes response = check self.clientEp-> get(path, targetType = SharedEffecttypes);
        return response;
    }
    # EffectTypes: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedEffecttypesGetId(string id) returns SharedEffecttypes|error {
        string  path = string `/Shared/EffectTypes/${id}`;
        SharedEffecttypes response = check self.clientEp-> get(path, targetType = SharedEffecttypes);
        return response;
    }
    # Effects: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedEffectsGetId(string id) returns SharedEffects|error {
        string  path = string `/Shared/Effects/${id}`;
        SharedEffects response = check self.clientEp-> get(path, targetType = SharedEffects);
        return response;
    }
    # FillMap: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedFillmapGetId(string id) returns SharedFillmap|error {
        string  path = string `/Shared/FillMap/${id}`;
        SharedFillmap response = check self.clientEp-> get(path, targetType = SharedFillmap);
        return response;
    }
    # FillTypes: List All Possible Types
    #
    # + return - Success 
    remote isolated function sharedFilltypesGet() returns SharedFilltypes[]|error {
        string  path = string `/Shared/FillTypes`;
        SharedFilltypes[] response = check self.clientEp-> get(path, targetType = SharedFilltypesArr);
        return response;
    }
    # FillTypes: Get By Type Id
    #
    # + typeId - Type ID 
    # + return - Success 
    remote isolated function sharedFilltypesTypeidGetTypeId(int typeId) returns SharedFilltypes|error {
        string  path = string `/Shared/FillTypes/TypeId/${typeId}`;
        SharedFilltypes response = check self.clientEp-> get(path, targetType = SharedFilltypes);
        return response;
    }
    # FillTypes: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedFilltypesGetId(string id) returns SharedFilltypes|error {
        string  path = string `/Shared/FillTypes/${id}`;
        SharedFilltypes response = check self.clientEp-> get(path, targetType = SharedFilltypes);
        return response;
    }
    # GradientFills: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedGradientfillsGetId(string id) returns SharedGradientfills|error {
        string  path = string `/Shared/GradientFills/${id}`;
        SharedGradientfills response = check self.clientEp-> get(path, targetType = SharedGradientfills);
        return response;
    }
    # GradientStops: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedGradientstopsGetId(string id) returns SharedGradientstops|error {
        string  path = string `/Shared/GradientStops/${id}`;
        SharedGradientstops response = check self.clientEp-> get(path, targetType = SharedGradientstops);
        return response;
    }
    # ImageFills: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedImagefillsGetId(string id) returns SharedImagefills|error {
        string  path = string `/Shared/ImageFills/${id}`;
        SharedImagefills response = check self.clientEp-> get(path, targetType = SharedImagefills);
        return response;
    }
    # LineEndSizes: List All Possible Types
    #
    # + return - Success 
    remote isolated function sharedLineendsizesGet() returns SharedLineendsizes[]|error {
        string  path = string `/Shared/LineEndSizes`;
        SharedLineendsizes[] response = check self.clientEp-> get(path, targetType = SharedLineendsizesArr);
        return response;
    }
    # LineEndSizes: Get By Type Id
    #
    # + typeId - Type ID 
    # + return - Success 
    remote isolated function sharedLineendsizesTypeidGetTypeId(int typeId) returns SharedLineendsizes|error {
        string  path = string `/Shared/LineEndSizes/TypeId/${typeId}`;
        SharedLineendsizes response = check self.clientEp-> get(path, targetType = SharedLineendsizes);
        return response;
    }
    # LineEndSizes: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedLineendsizesGetId(string id) returns SharedLineendsizes|error {
        string  path = string `/Shared/LineEndSizes/${id}`;
        SharedLineendsizes response = check self.clientEp-> get(path, targetType = SharedLineendsizes);
        return response;
    }
    # LineEndTypes: List All Possible Types
    #
    # + return - Success 
    remote isolated function sharedLineendtypesGet() returns SharedLineendtypes[]|error {
        string  path = string `/Shared/LineEndTypes`;
        SharedLineendtypes[] response = check self.clientEp-> get(path, targetType = SharedLineendtypesArr);
        return response;
    }
    # LineEndTypes: Get By Type Id
    #
    # + typeId - Type ID 
    # + return - Success 
    remote isolated function sharedLineendtypesTypeidGetTypeId(int typeId) returns SharedLineendtypes|error {
        string  path = string `/Shared/LineEndTypes/TypeId/${typeId}`;
        SharedLineendtypes response = check self.clientEp-> get(path, targetType = SharedLineendtypes);
        return response;
    }
    # LineEndTypes: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedLineendtypesGetId(string id) returns SharedLineendtypes|error {
        string  path = string `/Shared/LineEndTypes/${id}`;
        SharedLineendtypes response = check self.clientEp-> get(path, targetType = SharedLineendtypes);
        return response;
    }
    # Lines: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedLinesGetId(string id) returns SharedLines|error {
        string  path = string `/Shared/Lines/${id}`;
        SharedLines response = check self.clientEp-> get(path, targetType = SharedLines);
        return response;
    }
    # Paragraph: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedParagraphGetId(string id) returns SharedParagraph|error {
        string  path = string `/Shared/Paragraph/${id}`;
        SharedParagraph response = check self.clientEp-> get(path, targetType = SharedParagraph);
        return response;
    }
    # SolidFills: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedSolidfillsGetId(string id) returns SharedSolidfills|error {
        string  path = string `/Shared/SolidFills/${id}`;
        SharedSolidfills response = check self.clientEp-> get(path, targetType = SharedSolidfills);
        return response;
    }
    # Text: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedTextGetId(string id) returns SharedText|error {
        string  path = string `/Shared/Text/${id}`;
        SharedText response = check self.clientEp-> get(path, targetType = SharedText);
        return response;
    }
    # TextContainer: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function sharedTextcontainerGetId(string id) returns SharedTextcontainer|error {
        string  path = string `/Shared/TextContainer/${id}`;
        SharedTextcontainer response = check self.clientEp-> get(path, targetType = SharedTextcontainer);
        return response;
    }
    # Slides: Get Dependent Objects Tree
    #
    # + id - ID 
    # + return - Success 
    remote isolated function slidesSlidesChildobjectsGetId(string id) returns ChildObjects[]|error {
        string  path = string `/Slides/ChildObjects/${id}`;
        ChildObjects[] response = check self.clientEp-> get(path, targetType = ChildObjectsArr);
        return response;
    }
    # ColorMaps: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function slidesColormapsGetId(string id) returns SlideColormaps|error {
        string  path = string `/Slides/ColorMaps/${id}`;
        SlideColormaps response = check self.clientEp-> get(path, targetType = SlideColormaps);
        return response;
    }
    # Slides: Get Details
    #
    # + id - ID 
    # + return - Success 
    remote isolated function slidesSlidesDetailsGetId(string id) returns SlideSlidesDetails|error {
        string  path = string `/Slides/Details/${id}`;
        SlideSlidesDetails response = check self.clientEp-> get(path, targetType = SlideSlidesDetails);
        return response;
    }
    # GraphicTypes: List All Possible Types
    #
    # + return - Success 
    remote isolated function slidesGraphictypesGet() returns SlideGraphictypes[]|error {
        string  path = string `/Slides/GraphicTypes`;
        SlideGraphictypes[] response = check self.clientEp-> get(path, targetType = SlideGraphictypesArr);
        return response;
    }
    # GraphicTypes: Get By Type Id
    #
    # + typeId - Type ID 
    # + return - Success 
    remote isolated function slidesGraphictypesTypeidGetTypeId(int typeId) returns SlideGraphictypes|error {
        string  path = string `/Slides/GraphicTypes/TypeId/${typeId}`;
        SlideGraphictypes response = check self.clientEp-> get(path, targetType = SlideGraphictypes);
        return response;
    }
    # GraphicTypes: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function slidesGraphictypesGetId(string id) returns SlideGraphictypes|error {
        string  path = string `/Slides/GraphicTypes/${id}`;
        SlideGraphictypes response = check self.clientEp-> get(path, targetType = SlideGraphictypes);
        return response;
    }
    # Graphics: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function slidesGraphicsGetId(string id) returns SlideGraphics|error {
        string  path = string `/Slides/Graphics/${id}`;
        SlideGraphics response = check self.clientEp-> get(path, targetType = SlideGraphics);
        return response;
    }
    # GroupElementTypes: List All Possible Types
    #
    # + return - Success 
    remote isolated function slidesGroupelementtypesGet() returns SlideGroupelementtypes[]|error {
        string  path = string `/Slides/GroupElementTypes`;
        SlideGroupelementtypes[] response = check self.clientEp-> get(path, targetType = SlideGroupelementtypesArr);
        return response;
    }
    # GroupElementTypes: Get By Type Id
    #
    # + typeId - Type ID 
    # + return - Success 
    remote isolated function slidesGroupelementtypesTypeidGetTypeId(int typeId) returns SlideGroupelementtypes|error {
        string  path = string `/Slides/GroupElementTypes/TypeId/${typeId}`;
        SlideGroupelementtypes response = check self.clientEp-> get(path, targetType = SlideGroupelementtypes);
        return response;
    }
    # GroupElementTypes: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function slidesGroupelementtypesGetId(string id) returns SlideGroupelementtypes|error {
        string  path = string `/Slides/GroupElementTypes/${id}`;
        SlideGroupelementtypes response = check self.clientEp-> get(path, targetType = SlideGroupelementtypes);
        return response;
    }
    # GroupElements: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function slidesGroupelementsGetId(string id) returns SlideGroupelements|error {
        string  path = string `/Slides/GroupElements/${id}`;
        SlideGroupelements response = check self.clientEp-> get(path, targetType = SlideGroupelements);
        return response;
    }
    # Slides: Get Underlying Xml
    #
    # + id - ID 
    # + updated - Indicates whether API should return the orginal uploaded xml (false) or the actively updated version (true, default) 
    # + return - Success 
    remote isolated function slidesSlidesOpenofficexmlGetIdUpdated(string id, boolean updated = true) returns OoxmlDTO|error {
        string  path = string `/Slides/OpenOfficeXml/${id}`;
        map<anydata> queryParam = {"updated": updated};
        path = path + check getPathForQueryParam(queryParam);
        OoxmlDTO response = check self.clientEp-> get(path, targetType = OoxmlDTO);
        return response;
    }
    # Slides: Modify Underlying Xml
    #
    # + id - ID 
    # + payload - OoxmlDTO 
    # + return - Success 
    remote isolated function slidesSlidesOpenofficexmlPutId(string id, OoxmlDTO payload) returns http:Response|error {
        string  path = string `/Slides/OpenOfficeXml/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # SlideMasters: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function slidesSlidemastersGetId(string id) returns SlideSlidemasters|error {
        string  path = string `/Slides/SlideMasters/${id}`;
        SlideSlidemasters response = check self.clientEp-> get(path, targetType = SlideSlidemasters);
        return response;
    }
    # Slides: Get Svg file
    #
    # + id - ID 
    # + useCache - Indicates whether API should retrieve content from a cache if aviable (true, default), or force an update (false) 
    # + return - Returns an svg formatted-image of this object. 
    remote isolated function slidesSlidesSvgGetIdUseCache(string id, boolean useCache = false) returns string|error {
        string  path = string `/Slides/Svg/${id}`;
        map<anydata> queryParam = {"use_cache": useCache};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Slides: Get by Id
    #
    # + id - An Id of the respository DTO elemennt 
    # + return - Success 
    remote isolated function slidesSlidesGetId(string id) returns SlideSlides|error {
        string  path = string `/Slides/${id}`;
        SlideSlides response = check self.clientEp-> get(path, targetType = SlideSlides);
        return response;
    }
    # Slides: Get Dependent Objects Tree
    #
    # + id - ID 
    # + return - Success 
    remote isolated function slidesSmartartsChildobjectsGetId(string id) returns ChildObjects[]|error {
        string  path = string `/SmartArts/ChildObjects/${id}`;
        ChildObjects[] response = check self.clientEp-> get(path, targetType = ChildObjectsArr);
        return response;
    }
    # Slides: Get Details
    #
    # + id - ID 
    # + return - Success 
    remote isolated function slidesSmartartsDetailsGetId(string id) returns SlideSmartartsDetails|error {
        string  path = string `/SmartArts/Details/${id}`;
        SlideSmartartsDetails response = check self.clientEp-> get(path, targetType = SlideSmartartsDetails);
        return response;
    }
    # Slides: Get Underlying Xml
    #
    # + id - ID 
    # + updated - Indicates whether API should return the orginal uploaded xml (false) or the actively updated version (true, default) 
    # + return - Success 
    remote isolated function slidesSmartartsOpenofficexmlGetIdUpdated(string id, boolean updated = true) returns OoxmlDTO|error {
        string  path = string `/SmartArts/OpenOfficeXml/${id}`;
        map<anydata> queryParam = {"updated": updated};
        path = path + check getPathForQueryParam(queryParam);
        OoxmlDTO response = check self.clientEp-> get(path, targetType = OoxmlDTO);
        return response;
    }
    # Slides: Modify Underlying Xml
    #
    # + id - ID 
    # + payload - OoxmlDTO 
    # + return - Success 
    remote isolated function slidesSmartartsOpenofficexmlPutId(string id, OoxmlDTO payload) returns http:Response|error {
        string  path = string `/SmartArts/OpenOfficeXml/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Slides: Get Svg file
    #
    # + id - ID 
    # + useCache - Indicates whether API should retrieve content from a cache if aviable (true, default), or force an update (false) 
    # + return - Returns an svg formatted-image of this object. 
    remote isolated function slidesSmartartsSvgGetIdUseCache(string id, boolean useCache = false) returns string|error {
        string  path = string `/SmartArts/Svg/${id}`;
        map<anydata> queryParam = {"use_cache": useCache};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # SmartArts: Get by Id
    #
    # + id - An Id of the respository DTO elemennt 
    # + return - Success 
    remote isolated function slidesSmartartsGetId(string id) returns SlideSmartarts|error {
        string  path = string `/SmartArts/${id}`;
        SlideSmartarts response = check self.clientEp-> get(path, targetType = SlideSmartarts);
        return response;
    }
    # Borders: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function tablesBordersGetId(string id) returns TableBorders|error {
        string  path = string `/Tables/Borders/${id}`;
        TableBorders response = check self.clientEp-> get(path, targetType = TableBorders);
        return response;
    }
    # Cells: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function tablesCellsGetId(string id) returns TableCells|error {
        string  path = string `/Tables/Cells/${id}`;
        TableCells response = check self.clientEp-> get(path, targetType = TableCells);
        return response;
    }
    # Tables: Get Dependent Objects Tree
    #
    # + id - ID 
    # + return - Success 
    remote isolated function tablesTablesChildobjectsGetId(string id) returns ChildObjects[]|error {
        string  path = string `/Tables/ChildObjects/${id}`;
        ChildObjects[] response = check self.clientEp-> get(path, targetType = ChildObjectsArr);
        return response;
    }
    # Columns: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function tablesColumnsGetId(string id) returns TableColumns|error {
        string  path = string `/Tables/Columns/${id}`;
        TableColumns response = check self.clientEp-> get(path, targetType = TableColumns);
        return response;
    }
    # Tables: Get Details
    #
    # + id - ID 
    # + return - Success 
    remote isolated function tablesTablesDetailsGetId(string id) returns TableTablesDetails|error {
        string  path = string `/Tables/Details/${id}`;
        TableTablesDetails response = check self.clientEp-> get(path, targetType = TableTablesDetails);
        return response;
    }
    # Tables: Get Underlying Xml
    #
    # + id - ID 
    # + updated - Indicates whether API should return the orginal uploaded xml (false) or the actively updated version (true, default) 
    # + return - Success 
    remote isolated function tablesTablesOpenofficexmlGetIdUpdated(string id, boolean updated = true) returns OoxmlDTO|error {
        string  path = string `/Tables/OpenOfficeXml/${id}`;
        map<anydata> queryParam = {"updated": updated};
        path = path + check getPathForQueryParam(queryParam);
        OoxmlDTO response = check self.clientEp-> get(path, targetType = OoxmlDTO);
        return response;
    }
    # Tables: Modify Underlying Xml
    #
    # + id - ID 
    # + payload - OoxmlDTO 
    # + return - Success 
    remote isolated function tablesTablesOpenofficexmlPutId(string id, OoxmlDTO payload) returns http:Response|error {
        string  path = string `/Tables/OpenOfficeXml/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Rows: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function tablesRowsGetId(string id) returns TableRows|error {
        string  path = string `/Tables/Rows/${id}`;
        TableRows response = check self.clientEp-> get(path, targetType = TableRows);
        return response;
    }
    # Tables: Get Svg file
    #
    # + id - ID 
    # + useCache - Indicates whether API should retrieve content from a cache if aviable (true, default), or force an update (false) 
    # + return - Returns an svg formatted-image of this object. 
    remote isolated function tablesTablesSvgGetIdUseCache(string id, boolean useCache = false) returns string|error {
        string  path = string `/Tables/Svg/${id}`;
        map<anydata> queryParam = {"use_cache": useCache};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Table: Get Table Data
    #
    # + id - ID 
    # + return - Success 
    remote isolated function tablesTablesTableupdateGetId(string id) returns TableTabledatadto|error {
        string  path = string `/Tables/TableUpdate/${id}`;
        TableTabledatadto response = check self.clientEp-> get(path, targetType = TableTabledatadto);
        return response;
    }
    # Tables: Update Table Data
    #
    # + id - ID 
    # + payload - TableDataDTO 
    # + return - Success 
    remote isolated function tablesTablesTableupdatePutId(string id, TableTabledatadto payload) returns http:Response|error {
        string  path = string `/Tables/TableUpdate/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Tables: Get by Id
    #
    # + id - An Id of the respository DTO elemennt 
    # + return - Success 
    remote isolated function tablesTablesGetId(string id) returns TableTables|error {
        string  path = string `/Tables/${id}`;
        TableTables response = check self.clientEp-> get(path, targetType = TableTables);
        return response;
    }
    # BackgroundFills: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function themesBackgroundfillsGetId(string id) returns ThemeBackgroundfills|error {
        string  path = string `/Themes/BackgroundFills/${id}`;
        ThemeBackgroundfills response = check self.clientEp-> get(path, targetType = ThemeBackgroundfills);
        return response;
    }
    # Theme: Get Dependent Objects Tree
    #
    # + id - ID 
    # + return - Success 
    remote isolated function themeThemesChildobjectsGetId(string id) returns ChildObjects[]|error {
        string  path = string `/Themes/ChildObjects/${id}`;
        ChildObjects[] response = check self.clientEp-> get(path, targetType = ChildObjectsArr);
        return response;
    }
    # Colors: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function themesColorsGetId(string id) returns ThemeColors|error {
        string  path = string `/Themes/Colors/${id}`;
        ThemeColors response = check self.clientEp-> get(path, targetType = ThemeColors);
        return response;
    }
    # CustomColors: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function themesCustomcolorsGetId(string id) returns ThemeCustomcolors|error {
        string  path = string `/Themes/CustomColors/${id}`;
        ThemeCustomcolors response = check self.clientEp-> get(path, targetType = ThemeCustomcolors);
        return response;
    }
    # Theme: Get Details
    #
    # + id - ID 
    # + return - Success 
    remote isolated function themeThemesDetailsGetId(string id) returns ThemeThemesDetails|error {
        string  path = string `/Themes/Details/${id}`;
        ThemeThemesDetails response = check self.clientEp-> get(path, targetType = ThemeThemesDetails);
        return response;
    }
    # EffectMap: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function themesEffectmapGetId(string id) returns ThemeEffectmap|error {
        string  path = string `/Themes/EffectMap/${id}`;
        ThemeEffectmap response = check self.clientEp-> get(path, targetType = ThemeEffectmap);
        return response;
    }
    # Fills: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function themesFillsGetId(string id) returns ThemeFills|error {
        string  path = string `/Themes/Fills/${id}`;
        ThemeFills response = check self.clientEp-> get(path, targetType = ThemeFills);
        return response;
    }
    # Fonts: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function themesFontsGetId(string id) returns ThemeFonts|error {
        string  path = string `/Themes/Fonts/${id}`;
        ThemeFonts response = check self.clientEp-> get(path, targetType = ThemeFonts);
        return response;
    }
    # Intensity: List All Possible Types
    #
    # + return - Success 
    remote isolated function themesIntensityGet() returns ThemeIntensity[]|error {
        string  path = string `/Themes/Intensity`;
        ThemeIntensity[] response = check self.clientEp-> get(path, targetType = ThemeIntensityArr);
        return response;
    }
    # Intensity: Get By Type Id
    #
    # + typeId - Type ID 
    # + return - Success 
    remote isolated function themesIntensityTypeidGetTypeId(int typeId) returns ThemeIntensity|error {
        string  path = string `/Themes/Intensity/TypeId/${typeId}`;
        ThemeIntensity response = check self.clientEp-> get(path, targetType = ThemeIntensity);
        return response;
    }
    # Intensity: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function themesIntensityGetId(string id) returns ThemeIntensity|error {
        string  path = string `/Themes/Intensity/${id}`;
        ThemeIntensity response = check self.clientEp-> get(path, targetType = ThemeIntensity);
        return response;
    }
    # LineMap: Get by Id
    #
    # + id - ID 
    # + return - Success 
    remote isolated function themesLinemapGetId(string id) returns ThemeLinemap|error {
        string  path = string `/Themes/LineMap/${id}`;
        ThemeLinemap response = check self.clientEp-> get(path, targetType = ThemeLinemap);
        return response;
    }
    # Theme: Get Underlying Xml
    #
    # + id - ID 
    # + updated - Indicates whether API should return the orginal uploaded xml (false) or the actively updated version (true, default) 
    # + return - Success 
    remote isolated function themeThemesOpenofficexmlGetIdUpdated(string id, boolean updated = true) returns OoxmlDTO|error {
        string  path = string `/Themes/OpenOfficeXml/${id}`;
        map<anydata> queryParam = {"updated": updated};
        path = path + check getPathForQueryParam(queryParam);
        OoxmlDTO response = check self.clientEp-> get(path, targetType = OoxmlDTO);
        return response;
    }
    # Theme: Modify Underlying Xml
    #
    # + id - ID 
    # + payload - OoxmlDTO 
    # + return - Success 
    remote isolated function themeThemesOpenofficexmlPutId(string id, OoxmlDTO payload) returns http:Response|error {
        string  path = string `/Themes/OpenOfficeXml/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Theme: Get Svg file
    #
    # + id - ID 
    # + useCache - Indicates whether API should retrieve content from a cache if aviable (true, default), or force an update (false) 
    # + return - Returns an svg formatted-image of this object. 
    remote isolated function themeThemesSvgGetIdUseCache(string id, boolean useCache = false) returns string|error {
        string  path = string `/Themes/Svg/${id}`;
        map<anydata> queryParam = {"use_cache": useCache};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Themes: Get by Id
    #
    # + id - An Id of the respository DTO elemennt 
    # + return - Success 
    remote isolated function themeThemesGetId(string id) returns ThemeThemes|error {
        string  path = string `/Themes/${id}`;
        ThemeThemes response = check self.clientEp-> get(path, targetType = ThemeThemes);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map 
# + return - Returns generated Path or error at failure of client initialization 
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
