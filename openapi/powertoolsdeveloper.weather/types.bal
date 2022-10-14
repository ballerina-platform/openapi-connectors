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

public type InputReplaceString record {
    # String containing the text to be replaced
    string 'source;
    # Text to replace
    string value;
    # Replacement text
    string replacement;
};

public type OutputBoolean record {
    # Result
    boolean result?;
};

public type OutputImageMetadata record {
    # Image EXIF Metadata
    OutputimagemetadataResult[] result?;
};

public type MaptimezoneBody record {
    # Full or partial address
    string 'source;
};

public type OutputHourlyForecast record {
    # Daily weather forecast
    OutputhourlyforecastResult[] result?;
};

public type InputNumberRange record {
    # Start of range
    decimal 'start;
    # End of range
    decimal end;
};

public type OutputactivityforecastResult record {
    # Name
    string name?;
    # Date
    string date?;
    # Quality of weather for specified activity
    string quality?;
    # General quality rating
    decimal rating?;
    # Description
    string description?;
};

public type InputCollectionConversionXML record {
    # Collection containing strings to convert
    string[] input;
    # Name of root XML node
    string root;
    # Name of child XML node(s)
    string child;
};

public type InputMapImage record {
    # Full or partial address
    string 'source;
    # Map image zoom level
    decimal zoom;
    # Image height
    decimal height;
    # Image width
    decimal width;
};

public type OutputMarketIndex record {
    # Date
    string date?;
    # Index symbol
    string symbol?;
    # Market exchange
    string exchange?;
    # Open value
    decimal open?;
    # High value
    decimal high?;
    # Low value
    decimal low?;
    # Close value
    decimal close?;
    # Trading volume
    decimal volume?;
    # Adjusted open value
    decimal adj_open?;
    # Adjusted high value
    decimal adj_high?;
    # Adjusted low value
    decimal adj_low?;
    # Adjusted close value
    decimal adj_close?;
    # Adjusted trading volume
    decimal adj_volume?;
};

public type OutputFileByte record {
    # Result
    string result?;
};

public type OutputdailyforecastResult record {
    # Date
    string date?;
    # Low temperature
    string low?;
    # High temperature
    string high?;
    # Hours of Sunlight
    decimal sunlight?;
    # Relative air quality
    string airQuality?;
    # Description
    string description?;
    # Observable precipitation
    boolean precipitation?;
    # Chance of precipitiation
    decimal precipitationProbability?;
    # Type of precipitation
    string precipitationType?;
    # Hours of precipitation
    decimal hoursPrecipitation?;
    # Probability of rain
    decimal rainProbability?;
    # Probability of snow
    decimal snowProbability?;
    # Probability of ice
    decimal iceProbability?;
    # Probability of thunderstorms
    decimal thunderstormProbability?;
    # Wind direction
    string windDirection?;
    # Wind speed
    string windSpeed?;
    # Wind gust
    string windGust?;
    # Total rain
    string totalRain?;
    # Total snow
    string totalSnow?;
    # Total ice
    string totalIce?;
    # Cloud cover
    decimal cloudCover?;
};

public type InputWeatherActivityForecast record {
    # Full or partial address
    string 'source;
    # Weather-related activity
    string activity;
};

public type InputTranslateString record {
    # String containing the text to be translated
    string input;
    # Translation language
    string language;
};

public type InputMarketIndex record {
    # Market index
    string symbol;
    # Date (yyyy-MM-dd, leave empty for last trading day)
    string date?;
};

public type ShortenlinkBody record {
    # String variable or text value
    string 'source;
};

public type InputCollectionConversion record {
    # Collection containing strings to convert
    string[] input;
    # Collection name
    string name;
};

public type InputConvertDistance record {
    decimal input;
    string 'source;
    string target;
};

public type OutputCollectionString record {
    # Success
    boolean status?;
    # First Value
    string item?;
    # All Values
    string[] items?;
};

public type OutputString record {
    # Result
    string result?;
};

public type InputCollectionSplit record {
    # Collection of items to split
    string[] input;
    # String to match (explicit, case-insensitive, leave empty to use Index)
    string 'match?;
    # Index location to split (leave empty to use Match value)
    string index?;
};

public type InputSplitString record {
    # Text to split
    string input;
    # One or more characters that will be used to split the text
    string characters;
};

public type InputQRCode record {
    # Text value(s) (vertical bar delimited by type)
    string input;
    # Payload type
    string payload;
};

public type InputConvertAngle record {
    decimal input;
    string 'source;
    string target;
};

public type InputXmlConversionJSON record {
    # XML string
    string input;
};

public type InputConvertDuration record {
    decimal input;
    string 'source;
    string target;
};

public type InputStringToFile record {
    # Text string (body of file)
    string input;
    # File extension
    string extension;
    # Name of file (without extension)
    string filename;
};

public type OutputDateInfo record {
    # DayOfYear
    decimal DayOfYear?;
    # DayOfWeek
    decimal DayOfWeek?;
    # WeekOfYear
    decimal WeekOfYear?;
    # SecondsInDay
    decimal SecondsInDay?;
    # MinutesInDay
    decimal MinutesInDay?;
    # Ticks
    decimal Ticks?;
};

public type InputCalculateNumber record {
    # Numeric value to calculate
    decimal input;
    # Round to number of decimal places
    decimal decimals;
};

public type InputDataQuery record {
    # XML or JSON string
    string input;
    # XPath or JSONPath query
    string query;
};

public type InputCollectionCount record {
    # Collection of items to count
    string[] input;
};

public type InputConvertEnergy record {
    decimal input;
    string 'source;
    string target;
};

public type InputStringComparison record {
    # Original string
    string input;
    # Comparison string
    string compare;
    # Convert strings to lowercase before comparison
    string lower;
    # Trim strings before comparison
    string trim;
};

public type InputRedactString record {
    # String containing the complete text
    string 'source;
    # Individual string to redact
    string value?;
    # Collection of strings to redact
    string[] values?;
    # Regular expression pattern for matching strings
    string regex?;
};

public type InputDateTimeFormat record {
    # Source date and time
    string input;
    # Language culture
    string culture;
    # Output format
    string format;
};

public type OutputActivityForecast record {
    # Current weather-related activity forecast
    OutputactivityforecastResult[] result?;
};

public type InputCurrencyFormat record {
    # Amount to format
    decimal input;
    string target;
};

public type InputCalculateMinMax record {
    # Colllection of values to calculate
    decimal[] input;
    # Minimum or Maximum
    string 'type;
};

public type InputTextToSpeech record {
    # Text to convert (10,000 characters max)
    string text;
    # Text or file type
    string 'type;
    # Voice locale (must match language of input text)
    string voice;
};

public type InputCollectionReplace record {
    # Collection of strings
    string[] input;
    # Match value
    string 'match;
    # Replacement value
    string replacement;
    # Ignore case
    string ignoreCase;
};

public type InputTrimString record {
    # String containing the text to be trimmed
    string 'source;
    # Type of white space to remove
    string 'type;
};

public type InputDateTimeConversion record {
    # Source date and time
    string input;
    string 'source;
    string target;
    # Display format (defaults to 'yyyy-MM-dd HH:mm:ss')
    string format?;
};

public type InputJsonConversionCSV record {
    # JSON array object
    string input;
    # Include header row
    boolean header;
    # Columns to omit (comma separated)
    string omit?;
    # Column order (comma separated)
    string 'order?;
};

public type OutputDailyForecast record {
    # Daily weather forecast
    OutputdailyforecastResult[] result?;
};

public type InputCaseConversion record {
    # String containing the text to convert
    string input;
    # Case of conversion result
    string alphacase;
};

public type InputGeneratePassword record {
    # Number of characters
    decimal length;
    # Include lowercase characters
    boolean lowercase;
    # Include uppercase characters
    boolean uppercase;
    # Include single-digit numbers
    boolean numeric;
    # Include non-alphanumeric characters
    boolean special;
};

public type InputConvertSpeed record {
    decimal input;
    string 'source;
    string target;
};

public type InputCurrencyConversion record {
    # Amount to convert
    decimal input;
    string 'source;
    string target;
};

public type InputWeatherHourlyForecast record {
    # Full or partial address
    string 'source;
    # Units
    string units;
    # Duration
    decimal duration;
};

public type OutputIPLocation record {
    # Country Name
    string countryName?;
    # Country Code
    string countryCode?;
    # Region
    string region?;
    # Locale
    string locale?;
};

public type IplocationBody record {
    # IP Address
    string 'source;
};

public type InputDateTimeDifference record {
    # First date/time value
    string dateTime1;
    # Second date/time value
    string dateTime2;
};

public type OutputMultiCollection record {
    # First collection result
    string[] result1?;
    # Second collection result
    string[] result2?;
};

public type InputGenerateUniqueID record {
    # All uppercase alpha characters
    string uppercase;
};

public type ValidateemailBody record {
    # String variable or text value
    string 'source;
};

public type OutputstockpriceResult record {
    # Date
    string date?;
    # Ticker symbol
    string symbol?;
    # Stock exchange
    string exchange?;
    # Open
    decimal open?;
    # High
    decimal high?;
    # Low
    decimal low?;
    # Close
    decimal close?;
    # Volume
    decimal volume?;
};

public type UrldecodeBody record {
    # Encoded string variable or text value
    string 'source;
};

public type OutputStringArray record {
    # data
    string[] data?;
};

public type OutputWeatherConditions record {
    # Description
    string description?;
    # Precipitation
    boolean precipitation?;
    # Accumulated precipitation (24 hours)
    string accumulatedPrecipitation?;
    # Temperature
    decimal temperature?;
    # Wind Chill
    decimal windChill?;
    # Relative humidity
    decimal humidity?;
    # Dew point
    decimal dewPoint?;
    # Wind direction
    string windDirection?;
    # Daylight savings time start date
    string dstStart?;
    # Wind speed
    string windSpeed?;
    # Wind gusts (max)
    string windGust?;
    # UV Index
    decimal uvIndex?;
    # UV Level
    string uvDescription?;
    # Visbility
    string visibility?;
    # Cloud cover
    decimal cloudCover?;
    # Ceiling
    string ceiling?;
    # Barometric pressure
    string pressure?;
    # Barometric pressure trend
    string pressureTendency?;
};

public type InputCalculatePower record {
    # Number to raise
    decimal input;
    # Power
    decimal power;
    # Round to number of decimal places
    decimal decimals;
};

public type OutputNumber record {
    # Result
    decimal result?;
};

public type InputWeatherConditions record {
    # Full or partial address
    string 'source;
    # Units
    string units;
};

public type InputDateTimeInfo record {
    # Source date and time
    string input;
    # Language culture
    string culture;
};

public type OutputStockPrice record {
    # Stock price information
    OutputstockpriceResult[] result?;
};

public type InputConvertTemperature record {
    decimal input;
    string 'source;
    string target;
};

public type InputVerifyHash record {
    # Original source string
    string input;
    # Hash algorithm
    string algorithm;
    # Hashed result
    string hash;
};

public type OutputCollectionNumber record {
    # Success
    boolean status?;
    # First Value
    decimal item?;
    # All Values
    decimal[] items?;
};

public type MapcoordinatesBody record {
    # Full or partial address
    string 'source;
};

public type OutputimagemetadataResult record {
    # Aperture Value
    string apertureValue?;
    # Artist
    string artist?;
    # Background Color
    string backgroundColor?;
    # Bits Per Sample
    string bitsPerSample?;
    # Brightness Value
    string brightnessValue?;
    # Camera Elevation Angle
    string cameraElevationAngle?;
    # Clip Path
    string clipPath?;
    # Color Map
    string colorMap?;
    # Color Space
    string colorSpace?;
    # Color Type
    string colorType?;
    # Compressed Bits Per Pixel
    string compressedBitsPerPixel?;
    # Compression Type
    string compression?;
    # Contrast
    string contrast?;
    # Copyright
    string copyright?;
    # Custom Rendered
    string customRendered?;
    # Date/Time
    string dateTime?;
    # DateTime Digitized
    string dateTimeDigitized?;
    # DateTime Original
    string dateTimeOriginal?;
    # Decode
    string decode?;
    # Default Image Color
    string defaultImageColor?;
    # Device Setting Description
    string deviceSettingDescription?;
    # Digital Zoom Ratio
    string digitalZoomRatio?;
    # Document Name
    string documentName?;
    # ExifVersion
    string exifVersion?;
    # Exposure Bias Value
    string exposureBiasValue?;
    # Exposure Index
    string exposureIndex?;
    # Exposure Mode
    string exposureMode?;
    # Exposure Time
    string exposureTime?;
    # Extra Samples
    string extraSamples?;
    # File Source
    string fileSource?;
    # Fill Order
    string fillOrder?;
    # Flash
    string flash?;
    # Flash Energy
    string flashEnergy?;
    # F Number
    string fNumber?;
    # Focal Length
    string focalLength?;
    # Gain Control
    string gainControl?;
    # GPS Altitude
    string gpsAltitude?;
    # GPS Altitude Ref
    string gpsAltitudeRef?;
    # GPS Area Information
    string gpsAreaInformation?;
    # GPS Date Stamp
    string gpsDateStamp?;
    # GPS Differential
    string gpsDifferential?;
    # GPS Latitude
    string gpsLatitude?;
    # GPS Longitude
    string gpsLongitude?;
    # GPS Speed
    string gpsSpeed?;
    # GPS Status
    string gpsStatus?;
    # GPS Track
    string gpsTrack?;
    # Host Computer
    string hostComputer?;
    # Image Description
    string imageDescription?;
    # Image History
    string imageHistory?;
    # Image ID
    string imageID?;
    # Image Height
    string imageHeight?;
    # Image Length
    string imageLength?;
    # Image Number
    string imageNumber?;
    # Image Width
    string imageWidth?;
    # ISO Speed
    string isoSpeed?;
    # JPEG Interchange Format
    string jpegInterchangeFormat?;
    # Max Aperture Value
    string maxApertureValue?;
    # Max Sample Value
    string maxSampleValue?;
    # Metering Mode
    string meteringMode?;
    # Model
    string model?;
    # Model Number
    string modelNumber?;
    # Orientation
    string orientation?;
    # Owner Name
    string ownerName?;
    # Pixel Scale
    string pixelScale?;
    # Primary Chromaticities
    string primaryChromaticities?;
    # Profile Type
    string profileType?;
    # Rating
    string rating?;
    # Resolution Units
    string resolutionUnit?;
    # Sample Format
    string sampleFormat?;
    # Scene Type
    string sceneType?;
    # Security Classification
    string securityClassification?;
    # Sensing Method
    string sensingMethod?;
    # Serial Number
    string serialNumber?;
    # Sharpness
    string sharpness?;
    # Shutter Speed Value
    string shutterSpeedValue?;
    # Software
    string software?;
    # User Comment
    string userComment?;
    # Version
    string 'version?;
    # WhiteBalance
    string whiteBalance?;
    # White Point
    string whitePoint?;
    # White Point X
    string whitePointX?;
    # White Point Y
    string whitePointY?;
    # X Resolution
    string xResolution?;
    # Y Resolution
    string yResolution?;
};

public type InputConvertArea record {
    decimal input;
    string 'source;
    string target;
};

public type InputConvertPower record {
    decimal input;
    string 'source;
    string target;
};

public type DecodestringBody record {
    # Encoded string variable or text value
    string 'source;
};

public type InputCollectionSort record {
    # Collection of strings to sort
    string[] input;
    # Sort order
    string 'order;
};

public type InputStockPrices record {
    # Stock ticker symbols (comma-separated, max 20)
    string symbols;
    # Date (yyyy-MM-dd, leave empty for latest)
    string date?;
    # Stock exchange
    string exchange?;
};

public type InputCollectionFilter record {
    # Collection of strings to filter
    string[] input;
    # Match type
    string 'match;
    # Keywords (separate multiple values with commas)
    string keywords;
};

public type InputJsonConversionXML record {
    # JSON array object
    string input;
    # Name of root node
    string root;
};

public type OutputCollectionResult record {
    # Modified collection result
    string[] result?;
};

public type InputGenerateHash record {
    # Hash source string
    string input;
    # Hash algorithm
    string algorithm;
};

public type InputWeatherDailyForecast record {
    # Full or partial address
    string 'source;
    # Units
    string units;
    # Duration
    decimal duration;
};

public type InputCollectionModify record {
    # Collection of values or objects to modify
    string[] input;
    # Item (for multiple items, leave blank and use Items)
    string item?;
    # Items (Collection, for a single item leave blank and use Item)
    string[] items?;
    # Index position for operation (leave blank to specify end of collection)
    string index?;
};

public type OutputMapCoordinates record {
    # Latitude
    decimal latitude?;
    # Longitude
    decimal longitude?;
};

public type InputJsonConversionHTML record {
    # JSON array object
    string input;
    # Include header row
    boolean header;
    # Alternate header row markup
    string alternate?;
    # Optional table attributes (single quoted values)
    string attributes?;
    # Columns to omit (comma separated)
    string omit?;
    # Column order (comma separated)
    string 'order?;
};

public type InputConvertVolume record {
    decimal input;
    string 'source;
    string target;
};

public type OutputhourlyforecastResult record {
    # Date
    string date?;
    # Description
    string description?;
    # Temperature
    string temperature?;
    # Dew point
    string dewPoint?;
    # Relative humidity
    decimal relativeHumidity?;
    # Visibility
    string visibility?;
    # UV Index
    string uvIndex?;
    # Observable precipitation
    boolean precipitation?;
    # Chance of precipitiation
    decimal precipitationProbability?;
    # Probability of rain
    decimal rainProbability?;
    # Probability of snow
    decimal snowProbability?;
    # Probability of ice
    decimal iceProbability?;
    # Wind direction
    string windDirection?;
    # Wind speed
    string windSpeed?;
    # Wind gust
    string windGust?;
    # Total rain
    string totalRain?;
    # Total snow
    string totalSnow?;
    # Total ice
    string totalIce?;
    # Ceiling
    string ceiling?;
    # Cloud cover
    decimal cloudCover?;
};

public type InputCsvConversionJSON record {
    # CSV string
    string input;
    # Include header row
    boolean header;
};

public type InputStringContains record {
    # Text to match
    string find;
    # Text to search
    string input;
    # Convert strings to lowercase
    string lower;
};

public type OutputTimezoneInfo record {
    # Timezone ID
    string id?;
    # Full country name
    string countryName?;
    # Two-letter country code
    string countryCode?;
    # Short timezone name
    string shortName?;
    # Standard timezone name
    string standardName?;
    # Daylight Savings timezone name
    string dstName?;
    # Standard timezone offset from GMT
    string standardOffset?;
    # Daylight savings timezone offset from GMT
    string dstOffset?;
    # Daylight savings time start date
    string dstStart?;
    # Daylight savings time end date
    string dstEnd?;
    # Time of sunrise in target timezone
    string sunrise?;
    # Time of sunset in target timezone
    string sunset?;
};

public type InputConvertWeight record {
    decimal input;
    string 'source;
    string target;
};

public type InputJoinStrings record {
    # Collection of strings to be joined
    string[] input;
    # Separator character
    string separator;
    # Convert strings in collection to lowercase
    string lower;
    # Trim strings in collection
    string trim;
};

public type InputCollectionSearchNumeric record {
    # Collection of strings to search
    decimal[] input;
    # Number to match
    decimal 'match;
    # Type of number - integer or decimal
    string 'type = "Integer";
};

public type InputCalculateNumbers record {
    # Numeric value
    decimal input;
    # Addend, subtrahend, factor, divisor or radicand
    decimal value;
    # Round to number of decimal places
    decimal decimals;
};

public type InputString record {
    # String variable or text value
    string 'source;
};

public type InputCalculateSeries record {
    # Colllection of values to calculate
    decimal[] input;
    # Round to number of decimal places
    decimal decimals;
};

public type OutputDateDifference record {
    # Years
    decimal years?;
    # Months
    decimal months?;
    # Days
    decimal days?;
    # Hours
    decimal hours?;
    # Minutes
    decimal minutes?;
    # Milliseconds
    decimal milliseconds?;
    # Total Years
    decimal totalYears?;
    # Total Months
    decimal totalMonths?;
    # Total Days
    decimal totalDays?;
    # Total Hours
    decimal totalHours?;
    # Total Minutes
    decimal totalMinutes?;
    # Total Seconds
    decimal totalSeconds?;
    # Total Milliseconds
    decimal totalMilliseconds?;
    # Ticks
    decimal ticks?;
};

public type InputCollectionSearch record {
    # Collection of strings to search
    string[] input;
    # Text to match
    string 'match;
    # Trim white space from comparison string
    string trim?;
    # Ignore case when performing comparison
    string ignorecase?;
};
