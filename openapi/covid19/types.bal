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

# The amount of key-value pairs in 'cases', 'deaths' and 'recovered' is dependent on the 'lastdays' query
public type CovidhistoricalcountryTimeline record {
    CovidhistoricalallCases cases?;
    CovidhistoricalallCases deaths?;
    CovidhistoricalallCases recovered?;
};

public type CovidState record {
    string state?;
    decimal updated?;
    decimal cases?;
    decimal todayCases?;
    decimal deaths?;
    decimal todayDeaths?;
    decimal active?;
    decimal casesPerOneMillion?;
    decimal deathsPerOneMillion?;
    decimal tests?;
    decimal testsPerOneMillion?;
    decimal population?;
};

public type CovidAll record {
    decimal updated?;
    decimal cases?;
    decimal todayCases?;
    decimal deaths?;
    decimal todayDeaths?;
    decimal recovered?;
    decimal todayRecovered?;
    decimal active?;
    decimal critical?;
    decimal casesPerOneMillion?;
    decimal deathsPerOneMillion?;
    decimal tests?;
    decimal testsPerOneMillion?;
    decimal population?;
    decimal oneCasePerPeople?;
    decimal oneDeathPerPeople?;
    decimal oneTestPerPeople?;
    decimal activePerOneMillion?;
    decimal recoveredPerOneMillion?;
    decimal criticalPerOneMillion?;
    decimal affectedCountries?;
};
public type CovidCountry record {
    decimal updated?;
    string country?;
    CovidcountryCountryinfo countryInfo?;
    decimal cases?;
    decimal todayCases?;
    decimal deaths?;
    decimal todayDeaths?;
    decimal recovered?;
    decimal todayRecovered?;
    decimal active?;
    decimal critical?;
    decimal casesPerOneMillion?;
    decimal deathsPerOneMillion?;
    decimal tests?;
    decimal testsPerOneMillion?;
    decimal population?;
    string continent?;
    decimal oneCasePerPeople?;
    decimal oneDeathPerPeople?;
    decimal oneTestPerPeople?;
    decimal activePerOneMillion?;
    decimal recoveredPerOneMillion?;
    decimal criticalPerOneMillion?;
};

public type InfluenzaILINet record {
    decimal updated?;
    string 'source?;
    ILINet[] data?;
};

public type Vaccines record {
    string 'source?;
    string totalCandidates?;
    Phases[] phases?;
    Vaccine[] data?;
};

public type CovidContinent record {
    decimal updated?;
    decimal cases?;
    decimal todayCases?;
    decimal deaths?;
    decimal todayDeaths?;
    decimal recovered?;
    decimal todayRecovered?;
    decimal active?;
    decimal critical?;
    decimal casesPerOneMillion?;
    decimal deathsPerOneMillion?;
    decimal tests?;
    decimal testsPerOneMillion?;
    decimal population?;
    string continent?;
    decimal activePerOneMillion?;
    decimal recoveredPerOneMillion?;
    decimal criticalPerOneMillion?;
    CovidcontinentContinentinfo continentInfo?;
    string[] countries?;
};

public type CovidAppleSubregions record {
    string country?;
    string[] subregions?;
};

public type Phases record {
    string phase?;
    string candidates?;
};

public type CovidHistoricalUSCounty CovidhistoricaluscountyInner[];

public type FullvaccinetimelineInner record {
    decimal total?;
    decimal daily?;
    decimal totalPerHundred?;
    decimal dailyPerMillion?;
    string date?;
};

public type USCL record {
    string week?;
    decimal totalA?;
    decimal totalB?;
    decimal percentPositiveA?;
    decimal percentPositiveB?;
    decimal totalTests?;
    decimal percentPositive?;
};

public type USPHL record {
    string week?;
    decimal 'A\(H3N2v\)?;
    decimal 'A\(H1N1\)?;
    decimal 'A\(H3\)?;
    decimal 'A\(unable\ to\ sub\-type\)\+?;
    decimal 'A\(Subtyping\ not\ performed\)?;
    decimal B?;
    decimal BVIC?;
    decimal totalTests?;
};

public type InfluenzaUSCL record {
    decimal updated?;
    string 'source?;
    USCL[] data?;
};

public type CovidcontinentContinentinfo record {
    decimal lat?;
    decimal long?;
};

public type CovidHistoricalProvinces CovidHistoricalProvince[];

public type CovidNYTUSA CovidnytusaInner[];

public type InfluenzaUSPHL record {
    decimal updated?;
    string 'source?;
    USPHL[] data?;
};

# The amount of key-value pairs in 'cases', 'deaths' and 'recovered' is dependent on the 'lastdays' query
public type CovidHistoricalAll record {
    CovidhistoricalallCases cases?;
    CovidhistoricalallCases deaths?;
    CovidhistoricalallCases recovered?;
};

public type CovidjhucountriesStats record {
    decimal confirmed?;
    decimal deaths?;
    decimal recovered?;
};

public type CovidContinents CovidContinent[];

public type CovidHistoricalCountry record {
    string country?;
    string[] province?;
    # The amount of key-value pairs in 'cases', 'deaths' and 'recovered' is dependent on the 'lastdays' query
    CovidhistoricalcountryTimeline timeline?;
};

public type Therapeutics record {
    string 'source?;
    string totalCandidates?;
    Phases[] phases?;
    Therapeutic[] data?;
};

public type CovidcountryCountryinfo record {
    decimal? _id?;
    string? iso2?;
    string? iso3?;
    decimal lat?;
    decimal long?;
    string flag?;
};

public type CovidhistoricaluscountyInner record {
    string province?;
    string county?;
    # The amount of key-value pairs in 'cases', 'deaths' and 'recovered' is dependent on the 'lastdays' query
    record  { record  { decimal date?;}  cases?; record  { decimal date?;}  deaths?; record  { decimal date?;}  recovered?;}  timeline?;
};

public type CovidNYTCounty CovidnytcountyInner[];

public type CovidJHUCountries record {
    string country?;
    string county?;
    string updatedAt?;
    CovidjhucountriesStats stats?;
    CovidjhucountriesCoordinates coordinates?;
    string province?;
};

public type VaccineStatesCoverage VaccineStateCoverage[];

public type  VaccineCoverage SimpleVaccineTimeline|FullVaccineTimeline;

public type CovidHistoricalUSCounties string[];

public type CovidnytusaInner record {
    string date?;
    decimal cases?;
    decimal deaths?;
};

public type CovidAppleData record {
    string country?;
    string subregion?;
    CovidappledataData[] data?;
};

public type CovidAppleCountries string[];

public type VaccineCountryCoverage record {
    string country?;
    SimpleVaccineTimeline|FullVaccineTimeline timeline?;
};

public type ILINet record {
    string week?;
    decimal 'age\ 5\-24?;
    decimal 'age\ 25\-49?;
    decimal 'age\ 50\-64?;
    decimal 'age\ 64\+?;
    decimal totalILI?;
    decimal totalPatients?;
    decimal percentUnweightedILI?;
    decimal percentWeightedILI?;
};

public type VaccineCountriesCoverage VaccineCountryCoverage[];

public type CovidhistoricalallCases record {
    decimal date?;
};

public type CovidStates CovidState[];

public type CovidGov string[];

public type CovidhistoricalInner record {
    string country?;
    string province?;
    # The amount of key-value pairs in 'cases', 'deaths' and 'recovered' is dependent on the 'lastdays' query
    record  { record  { decimal date?;}  cases?; record  { decimal date?;}  deaths?; record  { decimal date?;}  recovered?;}  timeline?;
};

public type CovidappledataData record {
    string 'sub\-region?;
    string subregion_and_city?;
    string geo_type?;
    string date?;
    decimal driving?;
    decimal transit?;
    decimal walking?;
};

public type CovidjhucountriesCoordinates record {
    string latitude?;
    string longitude?;
};

public type CovidCountries CovidCountry[];

public type FullVaccineTimeline FullvaccinetimelineInner[];

public type CovidnytstateInner record {
    string date?;
    string state?;
    string fips?;
    decimal cases?;
    decimal deaths?;
};

public type Therapeutic record {
    string medicationClass?;
    string[] tradeName?;
    string details?;
    string[] developerResearcher?;
    string[] sponsors?;
    string trialPhase?;
    string lastUpdate?;
};

public type Vaccine record {
    string candidate?;
    string mechanism?;
    string[] sponsors?;
    string details?;
    string trialPhase?;
    string[] institutions?;
};

public type CovidHistorical CovidhistoricalInner[];

public type CovidJHUCounty record {
    string country?;
    string province?;
    string county?;
    string updatedAt?;
    CovidjhucountriesStats stats?;
    CovidjhucountriesCoordinates coordinates?;
};

public type CovidJHUCounties CovidJHUCounty[];

public type CovidHistoricalProvince record {
    string country?;
    string province?;
    # The amount of key-value pairs in 'cases', 'deaths' and 'recovered' is dependent on the 'lastdays' query
    CovidhistoricalcountryTimeline timeline?;
};

public type CovidHistoricalCountries CovidHistoricalCountry[];

public type VaccineStateCoverage record {
    string state?;
    SimpleVaccineTimeline|FullVaccineTimeline timeline?;
};

public type CovidNYTState CovidnytstateInner[];

public type CovidnytcountyInner record {
    string date?;
    string county?;
    string state?;
    string fips?;
    decimal cases?;
    decimal deaths?;
};

public type SimpleVaccineTimeline record {
    decimal date?;
};
