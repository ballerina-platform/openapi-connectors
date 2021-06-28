import ballerina/test;

Client baseClient = check new Client();

@test:Config{}
function testGetGlobalStatus(){
    CovidAll|error result = baseClient->getGlobalStatus();
    if (result is CovidAll) {
        test:assertTrue(result.length()> 0, "Failed to get Covid19 global status");
    } else {
        test:assertFail(msg = result.message());
    }
}
@test:Config{}
function testgetUSAStatusByState() {
    CovidState|error result = baseClient->getUSAStatusByState("New York");
    if (result is CovidState) {
        test:assertTrue(result.length()> 0, "Failed to get Covid19 status by state");
    } else {
        test:assertFail(msg = result.message());
    }
}
@test:Config{}
function testGetStatusByContinent() {
    CovidContinent|error result = baseClient->getStatusByContinent("Asia");
    if (result is CovidContinent) {
        test:assertTrue(result.length()> 0, "Failed to get Covid19 status by continent");
    } else {
        test:assertFail(msg = result.message());
    }
}
@test:Config{}
function testgetStatusByCountry() {
    CovidCountry|error result = baseClient->getStatusByCountry("LK");
    if (result is CovidContinent) {
        test:assertTrue(result.length()> 0, "Failed to get Covid19 status by country");
    } else {
        test:assertFail(msg = result.message());
    }
}
@test:Config{}
function testgetGlobalStatusInTimeSeries() {
    CovidHistoricalAll|error result = baseClient->getGlobalStatusInTimeSeries();
    if (result is CovidHistoricalAll) {
        test:assertTrue(result.length()> 0, "Failed to get global Covid19 status in time series");
    } else {
        test:assertFail(msg = result.message());
    }
}
@test:Config{}
function testgetTimeSeriesbycountry() {
    CovidHistoricalAll|error result = baseClient->getTimeSeriesBycountry("Sri Lanka", "30");
    if (result is CovidHistoricalAll) {
        test:assertTrue(result.length()> 0, "Failed to get Covid19 status of the country in time series");
    } else {
        test:assertFail(msg = result.message());
    }
}
@test:Config{}
function testgetTimeSeriesByProvince() {
    CovidHistoricalProvince|error result = baseClient->getTimeSeriesByProvince("China", "hainan");
    if (result is CovidHistoricalProvince) {
        test:assertTrue(result.length()> 0, "Failed to get Covid19 status of the province in time series");
    } else {
        test:assertFail(msg = result.message());
    }
}
@test:Config{}
function testgetVaccineTrialData() {
    Vaccines|error result = baseClient->getVaccineTrialData();
    if (result is Vaccines) {
        test:assertTrue(result.length()> 0, "Failed to get Covid19 vaccine trial data");
    } else {
        test:assertFail(msg = result.message());
    }
}
@test:Config{}
function testgetTotalGlobalVaccineDosesAdministered() {
    SimpleVaccineTimeline|error result = baseClient->getTotalGlobalVaccineDosesAdministered();
    if (result is SimpleVaccineTimeline) {
        test:assertTrue(result.length()> 0, "Failed to get Covid19 global vaccination details");
    } else {
        test:assertFail(msg = result.message());
    }
}
@test:Config{}
function testgetVaccineCoverageByCountry() {
    VaccineCountryCoverage|error result = baseClient->getVaccineCoverageByCountry("Sri Lanka");
    if (result is VaccineCountryCoverage) {
        test:assertTrue(result.length()> 0, "Failed to get Covid19 vaccine coverage by country");
    } else {
        test:assertFail(msg = result.message());
    }
}

