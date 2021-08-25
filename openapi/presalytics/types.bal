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

public type ChartAxisdatatypesArr ChartAxisdatatypes[];

public type ChildObjectsArr ChildObjects[];

public type ChartPlottypeArr ChartPlottype[];

public type ChartRowcolArr ChartRowcol[];

public type ChartRownameformattypesArr ChartRownameformattypes[];

public type DocumentArr Document[];

public type DocumentTypeArr DocumentType[];

public type SharedColortypesArr SharedColortypes[];

public type SharedDashtypesArr SharedDashtypes[];

public type SharedEffecttypesArr SharedEffecttypes[];

public type SharedFilltypesArr SharedFilltypes[];

public type SharedLineendsizesArr SharedLineendsizes[];

public type SharedLineendtypesArr SharedLineendtypes[];

public type SlideGraphictypesArr SlideGraphictypes[];

public type SlideGroupelementtypesArr SlideGroupelementtypes[];

public type ThemeIntensityArr ThemeIntensity[];

public type OoxmlDTO record {
    string? id?;
    string? openOfficeXml?;
    string? 'type?;
};

public type SlideColormaps record {
    int accent1?;
    int accent2?;
    int accent3?;
    int accent4?;
    int accent5?;
    int accent6?;
    int background1?;
    int background2?;
    int followedHyperlink?;
    int hyperlink?;
    string id?;
    string? slideMasterId?;
    int text1?;
    int text2?;
};

public type ChartChartdata record {
    string? chartId?;
    string id?;
};

public type ThemeThemes record {
    string? baseElementBlobUrl?;
    string? changedBaseElementBlobUrl?;
    string id?;
    string? name?;
    string? packageUri?;
    string? slideId?;
};

public type ChartRows record {
    string id?;
    int index?;
    string? name?;
    string? rowNameCollectionId?;
};

public type SharedColortransformations record {
    string id?;
    string? name?;
    string? solidFillsId?;
};

public type SharedPicturesDetails record {
    string? baseElementBlobUrl?;
    string? changedBaseElementBlobUrl?;
    string dateCreated?;
    string dateModified?;
    string? fileExtension?;
    string? graphicsId?;
    string id?;
    string? imageFileBlobUrl?;
    SharedImagefillsDetails imageFill?;
    string? imageFillsId?;
    string? name?;
    string? packageUri?;
    SlideGraphicsDetails parentGraphic?;
    string userCreated?;
    string userModified?;
};

public type SlideSmartartsDetails record {
    string? baseElementBlobUrl?;
    string? changedBaseElementBlobUrl?;
    string dateCreated?;
    string dateModified?;
    string? graphicsId?;
    string id?;
    string? name?;
    string? packageUri?;
    SlideGraphicsDetails parentGraphic?;
    string? svgBlobUrl?;
    string userCreated?;
    string userModified?;
};

public type Document record {
    string? baseElementBlobUrl?;
    string? blobLocation?;
    string? changedBaseElementBlobUrl?;
    int documentTypeId?;
    string? filename?;
    string id?;
    string? name?;
    string ownerGuid?;
    string? packageUri?;
    string storyId?;
    string? tableStylesXmlBlobUrl?;
    string? title?;
};

public type ThemeBackgroundfills record {
    string id?;
    int intensityId?;
    string? themeId?;
};

public type ChartColumncollectionsDetails record {
    ChartChartdataDetails chartData?;
    string? chartDataId?;
    ChartColumnsDetails[]? columns?;
    string dateCreated?;
    string dateModified?;
    string id?;
    string userCreated?;
    string userModified?;
};

public type ThemeFills record {
    string id?;
    int intensityId?;
    string? themeId?;
};

public type SlideSlides record {
    string? baseElementBlobUrl?;
    string? changedBaseElementBlobUrl?;
    string? documentId?;
    string id?;
    string? name?;
    int number?;
    int ooxmlId?;
    string? packageUri?;
    string? slideDocumentUrl?;
    string? svgBlobUrl?;
};

public type SharedTextDetails record {
    SharedSolidfillsDetails colorSolidFill?;
    string? colorSolidFillsId?;
    string dateCreated?;
    string dateModified?;
    string? font?;
    int? fontSize?;
    string id?;
    boolean isBold?;
    boolean isItalic?;
    boolean isThemeFont?;
    boolean isUnderline?;
    SharedParagraphDetails paragraph?;
    string? paragraphId?;
    string? rawText?;
    int sequence?;
    string userCreated?;
    string userModified?;
};

public type ThemeLinemap record {
    string id?;
    int intensityId?;
    string? themeId?;
};

public type SharedColortransformationsDetails record {
    SharedColortransformationattributesDetails[]? colorTransformationAttributes?;
    string dateCreated?;
    string dateModified?;
    string id?;
    string? name?;
    SharedSolidfillsDetails parentSolidFill?;
    string? solidFillsId?;
    string userCreated?;
    string userModified?;
};

public type SharedLinesDetails record {
    TableBordersDetails bLtoTRBorder?;
    string? bLtoTRBorderId?;
    TableBordersDetails bottomBorder?;
    string? bottomBorderId?;
    string? connectorId?;
    int dashTypeId?;
    string dateCreated?;
    string dateModified?;
    int headEndHeightId?;
    int headEndTypeId?;
    int headEndWidthId?;
    string id?;
    TableBordersDetails leftBorder?;
    string? leftBorderId?;
    SharedSolidfillsDetails lineColorSolidFill?;
    ThemeLinemapDetails lineMap?;
    string? lineMapId?;
    SlideConnectorDetails parentConnector?;
    SlideShapesDetails parentShape?;
    TableBordersDetails rightBorder?;
    string? rightBorderId?;
    string? shapeId?;
    TableBordersDetails tLtoBRBorder?;
    string? tLtoBRBorderId?;
    int tailEndHeightId?;
    int tailEndTypeId?;
    int tailEndWidthId?;
    TableBordersDetails topBorder?;
    string? topBorderId?;
    string userCreated?;
    string userModified?;
    int weight?;
};

public type ThemeCustomcolorsDetails record {
    string dateCreated?;
    string dateModified?;
    string? hexValue?;
    string id?;
    string? name?;
    ThemeThemesDetails theme?;
    string? themeId?;
    string userCreated?;
    string userModified?;
};

public type SharedText record {
    string? colorSolidFillsId?;
    string? font?;
    int? fontSize?;
    string id?;
    boolean isBold?;
    boolean isItalic?;
    boolean isThemeFont?;
    boolean isUnderline?;
    string? paragraphId?;
    string? rawText?;
    int sequence?;
};

public type SharedEffecttypes record {
    string? description?;
    string id?;
    string? name?;
    int typeId?;
};

public type ThemeIntensity record {
    string? description?;
    string id?;
    string? name?;
    int typeId?;
};

public type SlideGroupelementsDetails record {
    SlideGroupelementsDetails[]? childGroupElements?;
    SlideConnectorDetails connector?;
    string dateCreated?;
    string dateModified?;
    SlideGraphicsDetails graphic?;
    SlideGroupsDetails 'group?;
    int groupElementTypeId?;
    string? groupElementTypePk?;
    string id?;
    SlideGroupelementsDetails parentGroupElement?;
    string? parentGroupElementId?;
    SlideShapesDetails shape?;
    SlideShapetreesDetails shapeTree?;
    string? shapeTreeId?;
    SlideGroupelementtypesDetails typeInfo?;
    string? ultimateParentShapeTreeId?;
    string userCreated?;
    string userModified?;
};

public type SlideGroupelementtypes record {
    string? description?;
    string id?;
    string? name?;
    int typeId?;
};

public type ChartPlottype record {
    string id?;
    string? plotQualifedAssy?;
    string? plotTypeName?;
    int rowColTypeId?;
    int typeId?;
};

public type SharedColortransformationattributes record {
    string? colorTransformationsId?;
    string id?;
    string? name?;
    string? value?;
};

public type DocumentCloneDTO record {
    string id?;
    string storyId?;
};

public type SharedColortransformationattributesDetails record {
    SharedColortransformationsDetails colorTransformation?;
    string? colorTransformationsId?;
    string dateCreated?;
    string dateModified?;
    string id?;
    string? name?;
    string userCreated?;
    string userModified?;
    string? value?;
};

public type TableTabledatadto record {
    string[][] tableData?;
    string tableId?;
};

public type ThemeColorsDetails record {
    string? accent1?;
    string? accent2?;
    string? accent3?;
    string? accent4?;
    string? accent5?;
    string? accent6?;
    string? dark1?;
    string? dark2?;
    string dateCreated?;
    string dateModified?;
    string? followedHyperlink?;
    string? hyperlink?;
    string id?;
    string? light1?;
    string? light2?;
    string? name?;
    ThemeThemesDetails theme?;
    string? themeId?;
    string userCreated?;
    string userModified?;
};

public type TableTablesDetails record {
    string? baseElementBlobUrl?;
    TableCellsDetails[]? cells?;
    string? changedBaseElementBlobUrl?;
    TableColumnsDetails[]? columns?;
    string dateCreated?;
    string dateModified?;
    boolean hasStylePart?;
    string id?;
    string? name?;
    string? packageUri?;
    SlideGraphicsDetails parentGraphic?;
    string? parentGraphicId?;
    TableRowsDetails[]? rows?;
    string? stylePartOuterXml?;
    string? svgBlobUrl?;
    string userCreated?;
    string userModified?;
};

public type ThemeFillsDetails record {
    string dateCreated?;
    string dateModified?;
    SharedFillmapDetails fillMap?;
    string id?;
    int intensityId?;
    ThemeThemesDetails theme?;
    string? themeId?;
    string userCreated?;
    string userModified?;
};

public type ThemeColors record {
    string? accent1?;
    string? accent2?;
    string? accent3?;
    string? accent4?;
    string? accent5?;
    string? accent6?;
    string? dark1?;
    string? dark2?;
    string? followedHyperlink?;
    string? hyperlink?;
    string id?;
    string? light1?;
    string? light2?;
    string? name?;
    string? themeId?;
};

public type SharedImagefillsDetails record {
    string? compressionState?;
    string dateCreated?;
    string dateModified?;
    int? dpi?;
    string? effectsJson?;
    SharedFillmapDetails fillMap?;
    string? fillMapId?;
    string id?;
    SharedPicturesDetails picture?;
    boolean rotateWithShape?;
    string? sourceRectangle?;
    boolean stretch?;
    string? tile?;
    string userCreated?;
    string userModified?;
};

public type SlideSlidemastersDetails record {
    SlideColormapsDetails colorMap?;
    string dateCreated?;
    string dateModified?;
    string id?;
    SlideSlidesDetails parentSlide?;
    string? slideId?;
    string userCreated?;
    string userModified?;
};

public type SharedGradientfillsDetails record {
    int? angle?;
    string dateCreated?;
    string dateModified?;
    SharedFillmapDetails fillMap?;
    string? fillMapId?;
    SharedGradientstopsDetails[]? gradientStops?;
    string id?;
    boolean isPath?;
    string? pathType?;
    boolean rotateWithShape?;
    string userCreated?;
    string userModified?;
};

public type SharedColortypes record {
    int? colorSchemeIndexValueEnum?;
    string? description?;
    string id?;
    string? name?;
    int typeId?;
};

public type TableRows record {
    int height?;
    string id?;
    int index?;
    string? tableId?;
};

public type SharedLineendsizes record {
    string? description?;
    string id?;
    string? name?;
    string? serializedAs?;
    int typeId?;
};

public type ThemeEffectmapDetails record {
    string dateCreated?;
    string dateModified?;
    SharedEffectsDetails effect?;
    string id?;
    int intensityId?;
    ThemeThemesDetails theme?;
    string? themeId?;
    string userCreated?;
    string userModified?;
};

public type ChartAxesDetails record {
    int axisDataTypeId?;
    ChartChartsDetails chart?;
    string chartsId?;
    string dateCreated?;
    string dateModified?;
    string id?;
    int ooxmlId?;
    SharedTextcontainerDetails titleTextContainer?;
    string userCreated?;
    string userModified?;
};

public type SharedImagefills record {
    string? compressionState?;
    int? dpi?;
    string? effectsJson?;
    string? fillMapId?;
    string id?;
    boolean rotateWithShape?;
    string? sourceRectangle?;
    boolean stretch?;
    string? tile?;
};

public type SharedEffects record {
    string? connectorId?;
    string? effectMapId?;
    string id?;
    string? name?;
    string? shapeId?;
};

public type ChartRowcollections record {
    string? axisId?;
    string? chartDataId?;
    string id?;
    int nameFormatType?;
};

public type ChartDatapoints record {
    string? chartDataId?;
    string? columnId?;
    string id?;
    string? rowId?;
    float value?;
};

public type ThemeBackgroundfillsDetails record {
    string dateCreated?;
    string dateModified?;
    SharedFillmapDetails fillMap?;
    string id?;
    int intensityId?;
    ThemeThemesDetails theme?;
    string? themeId?;
    string userCreated?;
    string userModified?;
};

public type SlideShapes record {
    string? baseElementBlobUrl?;
    string? changedBaseElementBlobUrl?;
    boolean flipHorizontal?;
    boolean flipVertical?;
    string? freeFormPathXml?;
    string? groupElementsId?;
    int height?;
    boolean hidden?;
    string id?;
    boolean isThemeEffect?;
    boolean isThemeFill?;
    boolean isThemeLine?;
    string? name?;
    int ooxmlId?;
    string? packageUri?;
    string? presetTypeId?;
    int rotation?;
    string? svgBlobUrl?;
    int width?;
    int xOffset?;
    int yOffset?;
};

public type SlideGroups record {
    string? baseElementBlobUrl?;
    string? changedBaseElementBlobUrl?;
    string? groupElementId?;
    boolean hidden?;
    string id?;
    string? name?;
    int ooxmlId?;
    string? packageUri?;
    string? svgBlobUrl?;
    string? title?;
};

public type SlideShapetreesDetails record {
    string? baseElementBlobUrl?;
    string? changedBaseElementBlobUrl?;
    string dateCreated?;
    string dateModified?;
    SlideGroupelementsDetails groupElement?;
    string? groupElementId?;
    SlideGroupelementsDetails[]? groupElements?;
    boolean hidden?;
    string id?;
    string? name?;
    int ooxmlId?;
    string? packageUri?;
    SlideSlidesDetails slide?;
    string? slideId?;
    string? svgBlobUrl?;
    string? title?;
    string userCreated?;
    string userModified?;
};

public type ChartRowcollectionsDetails record {
    ChartAxesDetails axis?;
    string? axisId?;
    ChartChartdataDetails chartData?;
    string? chartDataId?;
    string dateCreated?;
    string dateModified?;
    string id?;
    int nameFormatType?;
    ChartRowsDetails[]? rows?;
    string userCreated?;
    string userModified?;
};

public type ChartDatapointsDetails record {
    ChartChartdataDetails chartData?;
    string? chartDataId?;
    ChartColumnsDetails column?;
    string? columnId?;
    string dateCreated?;
    string dateModified?;
    string id?;
    ChartRowsDetails row?;
    string? rowId?;
    string userCreated?;
    string userModified?;
    float value?;
};

public type SharedLines record {
    string? bLtoTRBorderId?;
    string? bottomBorderId?;
    string? connectorId?;
    int dashTypeId?;
    int headEndHeightId?;
    int headEndTypeId?;
    int headEndWidthId?;
    string id?;
    string? leftBorderId?;
    string? lineMapId?;
    string? rightBorderId?;
    string? shapeId?;
    string? tLtoBRBorderId?;
    int tailEndHeightId?;
    int tailEndTypeId?;
    int tailEndWidthId?;
    string? topBorderId?;
    int weight?;
};

public type TableCellsDetails record {
    TableBordersDetails border?;
    TableColumnsDetails column?;
    string? columnId?;
    int columnSpan?;
    string dateCreated?;
    string dateModified?;
    SharedFillmapDetails fillMap?;
    string id?;
    boolean isMergedHorozontal?;
    boolean isMergedVertical?;
    TableRowsDetails row?;
    string? rowId?;
    int rowSpan?;
    SharedTextcontainerDetails textContainer?;
    string userCreated?;
    string userModified?;
};

public type SharedSolidfills record {
    int? colorTypeId?;
    string? fillMapId?;
    string? hexValue?;
    string id?;
    boolean isUserColor?;
    string? parentGradientStopId?;
    string? parentLineId?;
    string? parentTextId?;
};

public type TableTables record {
    string? baseElementBlobUrl?;
    string? changedBaseElementBlobUrl?;
    boolean hasStylePart?;
    string id?;
    string? name?;
    string? packageUri?;
    string? parentGraphicId?;
    string? stylePartOuterXml?;
    string? svgBlobUrl?;
};

public type SlideShapesDetails record {
    string? baseElementBlobUrl?;
    string? changedBaseElementBlobUrl?;
    string dateCreated?;
    string dateModified?;
    SharedEffectsDetails effect?;
    SharedFillmapDetails fillMap?;
    boolean flipHorizontal?;
    boolean flipVertical?;
    string? freeFormPathXml?;
    SlideGroupelementsDetails groupElement?;
    string? groupElementsId?;
    int height?;
    boolean hidden?;
    string id?;
    boolean isThemeEffect?;
    boolean isThemeFill?;
    boolean isThemeLine?;
    SharedLinesDetails line?;
    string? name?;
    int ooxmlId?;
    string? packageUri?;
    string? presetTypeId?;
    int rotation?;
    string? svgBlobUrl?;
    SharedTextcontainerDetails textContainer?;
    string userCreated?;
    string userModified?;
    int width?;
    int xOffset?;
    int yOffset?;
};

public type SharedTextcontainer record {
    string? axisId?;
    string? chartId?;
    string id?;
    string? outerXml?;
    string? shapeId?;
    string? tableCellId?;
};

public type TableColumnsDetails record {
    TableCellsDetails[]? cells?;
    string dateCreated?;
    string dateModified?;
    string id?;
    int index?;
    TableTablesDetails 'table?;
    string? tableId?;
    string userCreated?;
    string userModified?;
    int width?;
};

public type SlideSlidemasters record {
    string id?;
    string? slideId?;
};

public type ChartChartdataDetails record {
    ChartChartsDetails chart?;
    string? chartId?;
    ChartColumncollectionsDetails columnCollection?;
    ChartDatapointsDetails[]? dataPoints?;
    string dateCreated?;
    string dateModified?;
    string id?;
    ChartRowcollectionsDetails rowCollection?;
    string userCreated?;
    string userModified?;
};

public type SharedLineendtypes record {
    string? description?;
    string id?;
    string? name?;
    string? serializedAs?;
    int typeId?;
};

public type SlideGraphictypes record {
    string? description?;
    string id?;
    string? name?;
    int typeId?;
};

public type SharedFillmap record {
    string? connectorId?;
    string? effectAttributeId?;
    int fillTypeId?;
    string id?;
    string? shapeId?;
    string? tableCellId?;
    string? themeBackgroundFillId?;
    string? themeFillId?;
};

public type ThemeLinemapDetails record {
    string dateCreated?;
    string dateModified?;
    string id?;
    int intensityId?;
    SharedLinesDetails line?;
    ThemeThemesDetails theme?;
    string? themeId?;
    string userCreated?;
    string userModified?;
};

public type ChartChartdatadto record {
    string[]? categoryNames?;
    string chartId?;
    decimal[][] dataPoints?;
    string[]? seriesNames?;
};

public type SharedGradientstopsDetails record {
    string dateCreated?;
    string dateModified?;
    SharedGradientfillsDetails gradientFill?;
    string? gradientFillsId?;
    string id?;
    int position?;
    SharedSolidfillsDetails solidFill?;
    string userCreated?;
    string userModified?;
};

public type SharedPictures record {
    string? baseElementBlobUrl?;
    string? changedBaseElementBlobUrl?;
    string? fileExtension?;
    string? graphicsId?;
    string id?;
    string? imageFileBlobUrl?;
    string? imageFillsId?;
    string? name?;
    string? packageUri?;
};

public type SharedFillmapDetails record {
    SlideConnectorDetails connector?;
    string? connectorId?;
    string dateCreated?;
    string dateModified?;
    SharedEffectattributesDetails effectAttribute?;
    string? effectAttributeId?;
    int fillTypeId?;
    SharedGradientfillsDetails gradientFill?;
    string id?;
    SharedImagefillsDetails imageFill?;
    SlideShapesDetails shape?;
    string? shapeId?;
    SharedSolidfillsDetails solidFill?;
    TableCellsDetails tableCell?;
    string? tableCellId?;
    ThemeBackgroundfillsDetails themeBackgroundFill?;
    string? themeBackgroundFillId?;
    ThemeFillsDetails themeFill?;
    string? themeFillId?;
    string userCreated?;
    string userModified?;
};

public type SlideConnectorDetails record {
    string? baseElementBlobUrl?;
    string? changedBaseElementBlobUrl?;
    string dateCreated?;
    string dateModified?;
    SharedEffectsDetails effect?;
    int endConnectionIdx?;
    SlideShapesDetails endConnectionShape?;
    string? endConnectionShapeId?;
    SharedFillmapDetails fillMap?;
    boolean flipHorizontal?;
    boolean flipVertical?;
    string? freeFormPathXml?;
    SlideGroupelementsDetails groupElement?;
    string? groupElementsId?;
    boolean hidden?;
    string id?;
    boolean isThemeEffect?;
    boolean isThemeFill?;
    boolean isThemeLine?;
    SharedLinesDetails line?;
    string? name?;
    int ooxmlId?;
    string? packageUri?;
    string? presetTypeId?;
    int rotation?;
    int startConnectionIdx?;
    SlideShapesDetails startConnectionShape?;
    string? startConnectionShapeId?;
    string? svgBlobUrl?;
    string userCreated?;
    string userModified?;
};

public type TableBordersDetails record {
    SharedLinesDetails bLtoTR?;
    SharedLinesDetails bottom?;
    TableCellsDetails cell?;
    string? cellId?;
    string dateCreated?;
    string dateModified?;
    string id?;
    SharedLinesDetails left?;
    SharedLinesDetails right?;
    SharedLinesDetails tLtoBR?;
    SharedLinesDetails top?;
    string userCreated?;
    string userModified?;
};

public type SharedEffectattributes record {
    string? attributesJson?;
    string? effectId?;
    int effectTypeId?;
    string id?;
};

public type ChartAxes record {
    int axisDataTypeId?;
    string chartsId?;
    string id?;
    int ooxmlId?;
};

public type SlideGraphicsDetails record {
    ChartChartsDetails chart?;
    string dateCreated?;
    string dateModified?;
    int graphicTypeId?;
    SlideGroupelementsDetails groupElement?;
    string? groupElementsId?;
    int height?;
    string id?;
    string? name?;
    int ooxmlId?;
    SharedPicturesDetails picture?;
    SlideSmartartsDetails smartArt?;
    TableTablesDetails 'table?;
    string userCreated?;
    string userModified?;
    int width?;
    int xOffset?;
    int yOffset?;
};

public type DocumentDetails record {
    string? baseElementBlobUrl?;
    string? blobLocation?;
    string? changedBaseElementBlobUrl?;
    string dateCreated?;
    string dateModified?;
    int documentTypeId?;
    string? filename?;
    string id?;
    string? name?;
    string ownerGuid?;
    string? packageUri?;
    SlideSlidesDetails[]? slides?;
    string storyId?;
    string? tableStylesXmlBlobUrl?;
    string? title?;
    string userCreated?;
    string userModified?;
};

public type SharedSolidfillsDetails record {
    SharedColortransformationsDetails colorTransformations?;
    int? colorTypeId?;
    string dateCreated?;
    string dateModified?;
    string? fillMapId?;
    string? hexValue?;
    string id?;
    boolean isUserColor?;
    SharedFillmapDetails parentFillMap?;
    SharedGradientstopsDetails parentGradientStop?;
    string? parentGradientStopId?;
    SharedLinesDetails parentLine?;
    string? parentLineId?;
    SharedTextDetails parentText?;
    string? parentTextId?;
    string userCreated?;
    string userModified?;
};

public type SlideShapetrees record {
    string? baseElementBlobUrl?;
    string? changedBaseElementBlobUrl?;
    string? groupElementId?;
    boolean hidden?;
    string id?;
    string? name?;
    int ooxmlId?;
    string? packageUri?;
    string? slideId?;
    string? svgBlobUrl?;
    string? title?;
};

public type ChartColumns record {
    string? axisId?;
    string? columnCollectionId?;
    string id?;
    int index?;
    string? name?;
};

public type ChartChartsDetails record {
    ChartAxesDetails[]? axes?;
    string? baseElementBlobUrl?;
    string? changedBaseElementBlobUrl?;
    ChartChartdataDetails chartData?;
    string dateCreated?;
    string dateModified?;
    string id?;
    string? name?;
    string? packageUri?;
    SlideGraphicsDetails parentGraphic?;
    string? parentGraphicId?;
    string? svgBlobUrl?;
    SharedTextcontainerDetails titleTextContainer?;
    string userCreated?;
    string userModified?;
};

public type SharedEffectsDetails record {
    string? connectorId?;
    string dateCreated?;
    string dateModified?;
    SharedEffectattributesDetails[]? effectAttributes?;
    ThemeEffectmapDetails effectMap?;
    string? effectMapId?;
    string id?;
    string? name?;
    SlideConnectorDetails parentConnector?;
    SlideShapesDetails parentShape?;
    string? shapeId?;
    string userCreated?;
    string userModified?;
};

public type ChartRowcol record {
    string? colName?;
    string? colQualifiedAssy?;
    string id?;
    string? rowName?;
    string? rowQualifedAssy?;
    int typeId?;
};

public type ChartRownameformattypes record {
    string? formatCode?;
    string id?;
    int powerToolsId?;
    int typeId?;
};

public type ChartCharts record {
    string? baseElementBlobUrl?;
    string? changedBaseElementBlobUrl?;
    string id?;
    string? name?;
    string? packageUri?;
    string? parentGraphicId?;
    string? svgBlobUrl?;
};

public type SharedParagraphDetails record {
    string dateCreated?;
    string dateModified?;
    string id?;
    int number?;
    SharedTextDetails[]? text?;
    SharedTextcontainerDetails textContainer?;
    string? textContainerId?;
    string userCreated?;
    string userModified?;
};

public type SlideGroupelementtypesDetails record {
    string dateCreated?;
    string dateModified?;
    string? description?;
    string id?;
    string? name?;
    int typeId?;
    string userCreated?;
    string userModified?;
};

public type TableBorders record {
    string? cellId?;
    string id?;
};

public type SharedDashtypes record {
    string? description?;
    string id?;
    string? name?;
    string? serializedAs?;
    int typeId?;
};

public type SlideSlidesDetails record {
    string? baseElementBlobUrl?;
    string? changedBaseElementBlobUrl?;
    string dateCreated?;
    string dateModified?;
    DocumentDetails document?;
    string? documentId?;
    string id?;
    string? name?;
    int number?;
    int ooxmlId?;
    string? packageUri?;
    SlideShapetreesDetails shapeTree?;
    string? slideDocumentUrl?;
    SlideSlidemastersDetails slideMaster?;
    string? svgBlobUrl?;
    ThemeThemesDetails theme?;
    string userCreated?;
    string userModified?;
};

public type ChartColumncollections record {
    string? chartDataId?;
    string id?;
};

public type ChartColumnsDetails record {
    ChartAxesDetails axis?;
    string? axisId?;
    ChartColumncollectionsDetails columnCollection?;
    string? columnCollectionId?;
    string dateCreated?;
    string dateModified?;
    string id?;
    int index?;
    string? name?;
    string userCreated?;
    string userModified?;
};

public type ThemeFontsDetails record {
    string? bodyFont?;
    string dateCreated?;
    string dateModified?;
    string? headingFont?;
    string id?;
    ThemeThemesDetails theme?;
    string? themeId?;
    string userCreated?;
    string userModified?;
};

public type SharedFilltypes record {
    string? description?;
    string id?;
    string? name?;
    int typeId?;
};

public type ThemeThemesDetails record {
    ThemeBackgroundfillsDetails[]? backgroundFills?;
    string? baseElementBlobUrl?;
    string? changedBaseElementBlobUrl?;
    ThemeColorsDetails colors?;
    ThemeCustomcolorsDetails[]? customColors?;
    string dateCreated?;
    string dateModified?;
    ThemeEffectmapDetails[]? effectMaps?;
    ThemeFillsDetails[]? fills?;
    ThemeFontsDetails fonts?;
    string id?;
    ThemeLinemapDetails[]? lineMaps?;
    string? name?;
    string? packageUri?;
    SlideSlidesDetails slide?;
    string? slideId?;
    string userCreated?;
    string userModified?;
};

public type TableColumns record {
    string id?;
    int index?;
    string? tableId?;
    int width?;
};

public type TableCells record {
    string? columnId?;
    int columnSpan?;
    string id?;
    boolean isMergedHorozontal?;
    boolean isMergedVertical?;
    string? rowId?;
    int rowSpan?;
};

public type ChartRowsDetails record {
    string dateCreated?;
    string dateModified?;
    string id?;
    int index?;
    string? name?;
    ChartRowcollectionsDetails rowNameCollection?;
    string? rowNameCollectionId?;
    string userCreated?;
    string userModified?;
};

public type SharedGradientstops record {
    string? gradientFillsId?;
    string id?;
    int position?;
};

public type ThemeEffectmap record {
    string id?;
    int intensityId?;
    string? themeId?;
};

public type ChildObjects record {
    string? entityId?;
    string? entityName?;
    string? objectType?;
    string? parentEntityId?;
    string? parentObjectType?;
};

public type SharedEffectattributesDetails record {
    string? attributesJson?;
    string dateCreated?;
    string dateModified?;
    SharedEffectsDetails effect?;
    string? effectId?;
    int effectTypeId?;
    SharedFillmapDetails fillMap?;
    string id?;
    string userCreated?;
    string userModified?;
};

public type SharedParagraph record {
    string id?;
    int number?;
    string? textContainerId?;
};

public type SlideGroupsDetails record {
    string? baseElementBlobUrl?;
    string? changedBaseElementBlobUrl?;
    string dateCreated?;
    string dateModified?;
    SlideGroupelementsDetails groupElement?;
    string? groupElementId?;
    boolean hidden?;
    string id?;
    string? name?;
    int ooxmlId?;
    string? packageUri?;
    string? svgBlobUrl?;
    string? title?;
    string userCreated?;
    string userModified?;
};

public type SlideSmartarts record {
    string? baseElementBlobUrl?;
    string? changedBaseElementBlobUrl?;
    string? graphicsId?;
    string id?;
    string? name?;
    string? packageUri?;
    string? svgBlobUrl?;
};

public type DocumentType record {
    string? description?;
    string? fileExtension?;
    string id?;
    string? mimeType?;
    string? name?;
    string? ooxmlPackageType?;
    int typeId?;
};

public type ProblemDetails record {
    string? detail?;
    string? instance?;
    int? status?;
    string? title?;
    string? 'type?;
};

public type ChartAxisdatatypes record {
    string? description?;
    string id?;
    string? name?;
    string? ooxmlName?;
    int typeId?;
};

public type SharedGradientfills record {
    int? angle?;
    string? fillMapId?;
    string id?;
    boolean isPath?;
    string? pathType?;
    boolean rotateWithShape?;
};

public type SlideColormapsDetails record {
    int accent1?;
    int accent2?;
    int accent3?;
    int accent4?;
    int accent5?;
    int accent6?;
    int background1?;
    int background2?;
    string dateCreated?;
    string dateModified?;
    int followedHyperlink?;
    int hyperlink?;
    string id?;
    SlideSlidemastersDetails slideMaster?;
    string? slideMasterId?;
    int text1?;
    int text2?;
    string userCreated?;
    string userModified?;
};

public type StoryFileFormData record {
    # The file to upload.  Must be of type .pptx, ppt
    string file;
    # The story_id of the document being uploaded.
    string storyId;
};

public type ThemeCustomcolors record {
    string? hexValue?;
    string id?;
    string? name?;
    string? themeId?;
};

public type ThemeFonts record {
    string? bodyFont?;
    string? headingFont?;
    string id?;
    string? themeId?;
};

public type SlideGroupelements record {
    int groupElementTypeId?;
    string? groupElementTypePk?;
    string id?;
    string? parentGroupElementId?;
    string? shapeTreeId?;
    string? ultimateParentShapeTreeId?;
};

public type SlideGraphics record {
    int graphicTypeId?;
    string? groupElementsId?;
    int height?;
    string id?;
    string? name?;
    int ooxmlId?;
    int width?;
    int xOffset?;
    int yOffset?;
};

public type SlideConnector record {
    string? baseElementBlobUrl?;
    string? changedBaseElementBlobUrl?;
    int endConnectionIdx?;
    string? endConnectionShapeId?;
    boolean flipHorizontal?;
    boolean flipVertical?;
    string? freeFormPathXml?;
    string? groupElementsId?;
    boolean hidden?;
    string id?;
    boolean isThemeEffect?;
    boolean isThemeFill?;
    boolean isThemeLine?;
    string? name?;
    int ooxmlId?;
    string? packageUri?;
    string? presetTypeId?;
    int rotation?;
    int startConnectionIdx?;
    string? startConnectionShapeId?;
    string? svgBlobUrl?;
};

public type TableRowsDetails record {
    TableCellsDetails[]? cells?;
    string dateCreated?;
    string dateModified?;
    int height?;
    string id?;
    int index?;
    TableTablesDetails 'table?;
    string? tableId?;
    string userCreated?;
    string userModified?;
};

public type SharedTextcontainerDetails record {
    ChartAxesDetails axis?;
    string? axisId?;
    ChartChartsDetails chart?;
    string? chartId?;
    string dateCreated?;
    string dateModified?;
    string id?;
    string? outerXml?;
    SharedParagraphDetails[]? paragraphs?;
    SlideShapesDetails parentShape?;
    string? shapeId?;
    TableCellsDetails tableCell?;
    string? tableCellId?;
    string userCreated?;
    string userModified?;
};
