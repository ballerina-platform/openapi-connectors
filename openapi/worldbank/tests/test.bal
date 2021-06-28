import ballerina/log;
import ballerina/test;


Client myclient = check new();

@test:Config{}
function testGetPopulation() {
    CountryPopulation[]|error result = myclient->getPopulation();
    if result is CountryPopulation[] {
        log:printInfo("Results: " + result.length().toString()+" records found");
    }else {
        log:printError(result.message());
        test:assertFail(result.toString());
    }
}

@test:Config{}
function testGetPopulationByCountry() {
    CountryPopulation[]|error result = myclient->getPopulationByCountry(country_code="USA");
    if result is CountryPopulation[] {
        log:printInfo("Results: " + result.length().toString()+" records found");
    }else {
        log:printError(result.message());
        test:assertFail(result.toString());
    }
}

@test:Config{}
function testGetGDP() {
    GrossDomesticProduct[]|error result = myclient->getGDP();
    if result is GrossDomesticProduct[] {
        log:printInfo("Results: " + result.length().toString()+" records found");
    }else {
        log:printError(result.message());
        test:assertFail(result.toString());
    }
}

@test:Config{}
function testGetGDPByCountry() {
    GrossDomesticProduct[]|error result = myclient->getGDPByCountry(country_code="USA" );
    if result is GrossDomesticProduct[] {
        log:printInfo("Results: " + result.length().toString()+" records found");
    }else {
        log:printError(result.message());
        test:assertFail(result.toString());
    }
}

@test:Config{}
function testGetAccessToElectricityPercentageOfCountries() {
    AccessToElectricity[]|error result = myclient->getAccessToElectricityPercentage();
    if result is AccessToElectricity[] {
        log:printInfo("Results: " + result.length().toString()+" records found");
    }else {
        log:printError(result.message());
        test:assertFail(result.toString());
    }
}

@test:Config{}
function testGetAccessToElectricityPercentageByCountry() {
    AccessToElectricity[]|error result = myclient->getAccessToElectricityPercentageByCountry(country_code="USA");
    if result is AccessToElectricity[] {
        log:printInfo("Results: " + result.length().toString()+" records found");
    }else {
        log:printError(result.message());
        test:assertFail(result.toString());
    }
}

@test:Config{}
function testGetYouthLiteracyRate() {
    YouthLiteracyRate[]|error result = myclient->getYouthLiteracyRate();
    if result is YouthLiteracyRate[] {
        log:printInfo("Results: " + result.length().toString()+" records found");
    }else {
        log:printError(result.message());
        test:assertFail(result.toString());
    }
}

@test:Config{}
function testGetYouthLiteracyRateByCountry() {
    YouthLiteracyRate[]|error result = myclient->getYouthLiteracyRateByCountry(country_code="USA");
    if result is YouthLiteracyRate[] {
        log:printInfo("Results: " + result.length().toString()+" records found");
    }else {
        log:printError(result.message());
        test:assertFail(result.toString());
    }
}

@test:Config{}
function testGetGovernmentExpenditureOnPrimaryEducation() {
    PrimaryEducationExpenditure[]|error result = myclient->getGovernmentExpenditureOnPrimaryEducation();
    if result is PrimaryEducationExpenditure[] {
        log:printInfo("Results: " + result.length().toString()+" records found");
    }else {
        log:printError(result.message());
        test:assertFail(result.toString());
    }
}

@test:Config{}
function testGetGovernmentExpenditureOnPrimaryEducationByCountry() {
    PrimaryEducationExpenditure[]|error result = myclient->getGovernmentExpenditureOnPrimaryEducationByCountry(country_code="USA");
    if result is PrimaryEducationExpenditure[] {
        log:printInfo("Results: " + result.length().toString()+" records found");
    }else {
        log:printError(result.message());
        test:assertFail(result.toString());
    }
}
