// Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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
public type CovidAll record {
    float updated?;
    float cases?;
    float todayCases?;
    float deaths?;
    float recovered?;
    float todayRecovered?;
    float active?;
    float critical?;
    float casesPerOneMillion?;
    float deathsPerOneMillion?;
    float tests?;
    float testsPerOneMillion?;
    float population?;
    float oneCasePerPeople?;
    float oneDeathPerPeople?;
    float oneTestPerPeople?;
    float activePerOneMillion?;
    float recoveredPerOneMillion?;
    float criticalPerOneMillion?;
    float affectedCountries?;
};

public type CovidState record {
    string state?;
    float updated?;
    float cases?;
    float todayCases?;
    float deaths?;
    float todayDeaths?;
    float active?;
    float casesPerOneMillion?;
    float deathsPerOneMillion?;
    float tests?;
    float testsPerOneMillion?;
    float population?;
};

public type CovidContinent record {
    float updated?;
    float cases?;
    float todayCases?;
    float deaths?;
    float todayDeaths?;
    float recovered?;
    float todayRecovered?;
    float active?;
    float critical?;
    float casesPerOneMillion?;
    float deathsPerOneMillion?;
    float tests?;
    float testsPerOneMillion?;
    float population?;
    string continent?;
    float activePerOneMillion?;
    float recoveredPerOneMillion?;
    float criticalPerOneMillion?;
    record  { float lat?; float long?;}  continentInfo?;
    string[] countries?;
};

public type CovidCountry record {
    float updated?;
    string country?;
    record  { float _id?; string iso2?; string iso3?; float lat?; float long?; string flag?;}  countryInfo?;
    float cases?;
    float todayCases?;
    float deaths?;
    float todayDeaths?;
    float recovered?;
    float todayRecovered?;
    float active?;
    float critical?;
    float casesPerOneMillion?;
    float deathsPerOneMillion?;
    float tests?;
    float testsPerOneMillion?;
    float population?;
    string continent?;
    float oneCasePerPeople?;
    float oneDeathPerPeople?;
    float oneTestPerPeople?;
    float activePerOneMillion?;
    float recoveredPerOneMillion?;
    float criticalPerOneMillion?;
};

public type CovidHistoricalAll record {
    record  { float date?;}  cases?;
    record  { float date?;}  deaths?;
    record  { float date?;}  recovered?;
};

public type CovidHistoricalCountry record {
    string country?;
    string[] province?;
    record  { record  { float date?;}  cases?; record  { float date?;}  deaths?; record  { float date?;}  recovered?;}  timeline?;
};

public type CovidHistoricalProvince record {
    string country?;
    string province?;
    record  { record  { float date?;}  cases?; record  { float date?;}  deaths?; record  { float date?;}  recovered?;}  timeline?;
};

public type Vaccines record {
    string 'source?;
    string totalCandidates?;
    Phases[] phases?;
    Vaccine[] data?;
};

public type Vaccine record {
    string candidate?;
    string mechanism?;
    string[] sponsors?;
    string details?;
    string trialPhase?;
    string[] institutions?;
};

public type Phases record {
    string phase?;
    string candidates?;
};

public type  VaccineCoverage SimpleVaccineTimeline|FullVaccineTimeline;

public type VaccineCountryCoverage record {
    string country?;
    anydata timeline?;
};

public type SimpleVaccineTimeline record {
    float date?;
};

public type FullVaccineTimeline record {
    record  { float total?; float daily?; float totalPerHundred?; float dailyPerMillion?; string date?;} [] fullvaccinetimelinelist;
};
