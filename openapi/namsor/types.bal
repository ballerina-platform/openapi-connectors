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

import ballerina/constraint;

# Represents the output of inferring the LIKELY gender from a list of personal names.
public type BatchFirstLastNameGenderedOut record {
    # Classified genderized names
    FirstLastNameGenderedOut[] personalNames?;
};

public type FirstLastNamePhoneNumberIn record {
    string id?;
    string firstName?;
    string lastName?;
    string phoneNumber?;
    # Represents the output of inferring the LIKELY country of Origin from a personal name.
    FirstLastNameOriginedOut FirstLastNameOriginedOut?;
};

# Detailed usage as reported by the deduplicating API counter.
public type APICounterV2Out record {
    # The API Key.
    APIKeyOut apiKey?;
    # The apiService corresponds to the classifier name.
    string apiService?;
    # The create datetime of the counter.
    int createdDateTime?;
    # The usage of the counter.
    int totalUsage?;
    # The flush datetime of the counter.
    int lastFlushedDateTime?;
    # The last usage datetime of the counter.
    int lastUsedDateTime?;
    # Usage of special features, such as Chinese, Japanese.
    record {} serviceFeaturesUsage?;
};

# Classified matched names
public type NameMatchCandidatesOut record {
    # Script
    string script?;
    # Id
    string id?;
    # The first name (also known as given name)
    string firstName?;
    # The last name (also known as family name, or surname)
    string lastName?;
    # The option for ordering
    string orderOption?;
    # The ordered list of name matching candidates
    NameMatchCandidateOut[] matchCandidates?;
};

# The software version.
public type SoftwareVersionOut record {
    # The software version
    string softwareNameAndVersion?;
    # The software version major minor build
    int[] softwareVersion?;
};

# The list of classifiers and versions.
public type APIClassifierOut record {
    # The classifier name
    string classifierName?;
    # True if the classifier is serving requests (has reached minimal learning, is not shutting down)
    boolean serving?;
    # True if the classifier is learning
    boolean learning?;
    # True if the classifier is shutting down
    boolean shuttingDown?;
    # True if the classifier has finished the initial learning and calibrated probabilities (meanwhile, during initial learning, probabilities will be equal to -1)
    boolean probabilityCalibrated?;
};

public type NameIn record {
    string id?;
    string name?;
};

# The API Plan governing the subscription.
public type APIPlanSubscriptionOut record {
    # User API Key.
    string apiKey?;
    # Datetime when the user subscribed to the current plan.
    int planStarted?;
    # Datetime when the user subscribed to the prior plan.
    int priorPlanStarted?;
    # Datetime when the user ended the plan.
    int planEnded?;
    # Applicable tax rate for the plan.
    decimal taxRate?;
    # Current plan name.
    string planName?;
    # Current plan key (as in Stripe product).
    string planBaseFeesKey?;
    # Plan status.
    string planStatus?;
    # Current plan quota in quantity of units (NB: some API use several units per name).
    int planQuota?;
    # Current plan monthly price expressed in USD (includes a free quota).
    decimal priceUSD?;
    # Current plan price for overages expressed in USD (extra price per unit above the free quota).
    decimal priceOverageUSD?;
    # Current plan price for overages expressed in Currency (extra price per unit above the free quota).
    decimal price?;
    # Current plan price for overages expressed in Currency (extra price per unit above the free quota).
    decimal priceOverage?;
    # Current plan Currency for prices.
    string currency?;
    # For USD, GBP, EUR - the factor is 1.
    decimal currencyFactor?;
    # Stripe customer identifier.
    string stripeCustomerId?;
    # Stripe status ex active.
    string stripeStatus?;
    # Stripe subscription identifier.
    string stripeSubscription?;
    # Internal user identifier.
    string userId?;
};

public type FirstLastNameGenderIn record {
    string id?;
    string firstName?;
    string lastName?;
    # The known gender of the name
    string gender?;
};

# First name related to transnational interaction
public type FirstLastNameGeoIn record {
    # Id
    string id?;
    # First name
    string firstName?;
    # Last name
    string lastName?;
    # ISO2 country code
    string countryIso2?;
};

# Represents the output of inferring the LIKELY gender from a personal name.
public type FirstLastNameGenderedOut record {
    # Script
    string script?;
    # Id
    string id?;
    # The first name (also known as given name)
    string firstName?;
    # The last name (also known as family name, or surname)
    string lastName?;
    # Most likely gender
    string likelyGender?;
    # Compatibility to NamSor_v1 Gender Scale M[-1..U..+1]F value
    decimal genderScale?;
    # Compatibility to NamSor_v1 Gender score value. Higher score is better, but score is not normalized. Use calibratedProbability if available. 
    @constraint:Number {maxValue: 100}
    decimal score?;
    # The calibrated probability for inferred gender to have been guessed correctly.
    decimal probabilityCalibrated?;
};

# The API Key.
public type APIKeyOut record {
    # The user API Key.
    string apiKey?;
    # The user identifier.
    string userId?;
    # The API Key has admin role.
    boolean admin?;
    # The API Key is vetted (assumed truthful) for machine learning.
    boolean vetted?;
    # The API Key is learnable (without assuming truthfulness) for machine learning. Set learnable=false and anonymized=true for highest privacy (ie. to forget data as it's processed).
    boolean learnable?;
    # The API Key is anonymized (using SHA-252 digest for logging). Set learnable=false and anonymized=true for highest privacy (ie. to forget data as it's processed).
    boolean anonymized?;
    # The API Key has partner role.
    boolean partner?;
    # The API Key is associated to a valid Stripe account.
    boolean striped?;
    # The API Key has role corporate (ex SWIFT payments instead of Stripe payments).
    boolean corporate?;
    # The API Key is temporarily or permanently disabled.
    boolean disabled?;
};

# Represents the output of inferring the LIKELY ethnicity from a personal name, given an country of residence.
public type BatchFirstLastNameDiasporaedOut record {
    # Classified diaspora names
    FirstLastNameDiasporaedOut[] personalNames?;
};

public type BatchPersonalNameGeoOut record {
    # Classified geo names
    PersonalNameGeoOut[] personalNames?;
};

public type APIClassifiersStatusOut record {
    # The software version.
    SoftwareVersionOut softwareVersion?;
    # The list of classifiers and versions.
    APIClassifierOut[] classifiers?;
};

# Classified typed proper names
public type ProperNounCategorizedOut record {
    # Script
    string script?;
    # Id
    string id?;
    # The input name
    string name?;
    # The most likely common name type
    string commonType?;
    # Best alternative for : The most likely common name type
    string commonTypeAlt?;
    # Higher score is better, but score is not normalized. Use calibratedProbability if available. 
    @constraint:Number {maxValue: 100}
    decimal score?;
};

# Classified genderized names
public type PersonalNameGenderedOut record {
    # Script
    string script?;
    # Id
    string id?;
    # The input name
    string name?;
    # Most likely gender
    string likelyGender?;
    # Compatibility to NamSor_v1 Gender Scale M[-1..U..+1]F value
    decimal genderScale?;
    # Compatibility to NamSor_v1 Gender score value. Higher score is better, but score is not normalized. Use calibratedProbability if available. 
    @constraint:Number {maxValue: 100}
    decimal score?;
    # The calibrated probability for inferred gender to have been guessed correctly.
    decimal probabilityCalibrated?;
};

# Represents the output of inferring the LIKELY country of Origin from a personal name.
public type FirstLastNameOriginedOut record {
    # Script
    string script?;
    # Id
    string id?;
    # The first name (also known as given name)
    string firstName?;
    # The last name (also known as family name, or surname)
    string lastName?;
    # Most likely country of Origin
    string countryOrigin?;
    # Second best alternative : country of Origin
    string countryOriginAlt?;
    # List countries of Origin (top 10)
    string[] countriesOriginTop?;
    # Compatibility to NamSor_v1 Origin score value. Higher score is better, but score is not normalized. Use calibratedProbability if available. 
    @constraint:Number {maxValue: 100}
    decimal score?;
    # Most likely region of Origin (based on countryOrigin ISO2 code)
    string regionOrigin?;
    # Most likely top region of Origin (based on countryOrigin ISO2 code)
    string topRegionOrigin?;
    # Most likely sub region of Origin (based on countryOrigin ISO2 code)
    string subRegionOrigin?;
    # The calibrated probability for countryOrigin to have been guessed correctly.
    decimal probabilityCalibrated?;
    # The calibrated probability for countryOrigin OR countryOriginAlt to have been guessed correctly.
    decimal probabilityAltCalibrated?;
};

public type BatchNameGeoIn record {
    NameGeoIn[] properNouns?;
};

public type BatchFirstLastNameGenderIn record {
    FirstLastNameGenderIn[] personalNames?;
};

# Represent multiple classifications for corridor sender and receiver (gender, country, origin, diaspora)
public type CorridorOut record {
    # Id
    string id?;
    # Represents the output of inferring the LIKELY gender from a personal name.
    FirstLastNameGenderedOut FirstLastNameGenderedOut?;
    # Represents the output of inferring the LIKELY country of Origin from a personal name.
    FirstLastNameOriginedOut FirstLastNameOriginedOut?;
    # Represents the output of inferring the LIKELY ethnicity from a personal name, given an country of residence.
    FirstLastNameDiasporaedOut FirstLastNameDiasporaedOut?;
    # Script
    string script?;
};

public type BatchNameMatchedOut record {
    # Classified matched names
    NameMatchedOut[] matchedNames?;
};

public type BatchNameMatchCandidatesOut record {
    # Classified matched names
    NameMatchCandidatesOut[] namesAndMatchCandidates?;
};

public type BatchPersonalNameParsedOut record {
    # Classified parsed names
    PersonalNameParsedOut[] personalNames?;
};

# Represents the output of inferring the LIKELY ethnicity from a personal name, given an country of residence.
public type FirstLastNameDiasporaedOut record {
    # Script
    string script?;
    # Id
    string id?;
    # The first name (also known as given name)
    string firstName?;
    # The last name (also known as family name, or surname)
    string lastName?;
    # Compatibility to NamSor_v1 Diaspora score value. Higher score is better, but score is not normalized. Use calibratedProbability if available. 
    @constraint:Number {maxValue: 100}
    decimal score?;
    # The second best alternative ethnicity
    string ethnicityAlt?;
    # The most likely ethnicity
    string ethnicity?;
    # Indicates if the output ethnicity is based on machine learning only, or further lifted as a known fact by a country-specific rule. Let us know if you believe ethnicity is incorrect on a specific case where lifted is true.
    boolean lifted?;
    # From input data, the countryIso2 of geographic context (US,CA etc.)
    string countryIso2?;
    # List most likely ethnicities (top 10)
    string[] ethnicitiesTop?;
};

public type BatchPersonalNameGenderedOut record {
    # Classified genderized names
    PersonalNameGenderedOut[] personalNames?;
};

public type FeedbackLoopOut record {
    # Number of units recredited as per feedback loop successful classification
    int feedbackCredits?;
};

# The current billing period.
public type APIBillingPeriodUsageOut record {
    # User API Key.
    string apiKey?;
    # Datetime when the user subscribed to the plan.
    int subscriptionStarted?;
    # Datetime when the the plan's current period started.
    int periodStarted?;
    # Datetime when the the plan's current period endend.
    int periodEnded?;
    # Datetime when the the plan's current period endend (in Stripe). Internal and Stripe periodicity should ~coincide.
    int stripeCurrentPeriodEnd?;
    # Datetime when the the plan's current period started (in Stripe). Internal and Stripe periodicity should ~coincide.
    int stripeCurrentPeriodStart?;
    # Current period billing status ex OPEN.
    string billingStatus?;
    # Current period usage in units (NB some API endpoints use more than one unit).
    int usage?;
    # Current period soft limit (reaching the limit sends an email notification).
    int softLimit?;
    # Current period hard limit (reaching the limit sends an email notification and blocks the API Key).
    int hardLimit?;
};

public type APIPeriodUsageOut record {
    # The API Plan governing the subscription.
    APIPlanSubscriptionOut subscription?;
    # The current billing period.
    APIBillingPeriodUsageOut billingPeriod?;
    # Overage amount including any tax.
    decimal overageExclTax?;
    # Overage amount including tax (if applicable).
    decimal overageInclTax?;
    # Currency of the overage amount.
    string overageCurrency?;
    # Quantity above monthly quota of the current subscritpion, in units.
    int overageQuantity?;
};

public type PersonalNameIn record {
    string id?;
    string name?;
};

public type BatchCorridorIn record {
    CorridorIn[] corridorFromTo?;
};

public type APIUsageAggregatedOut record {
    # Time unit is DAY, WEEK or MONTH depending on prior usage
    string timeUnit?;
    # Start datetime of the reporting period
    int periodStart?;
    # End datetime of the reporting period
    int periodEnd?;
    # Total usage in the current period
    int totalUsage?;
    # If the history was truncaded due to data limit
    boolean historyTruncated?;
    # Data points : usage per DAY, WEEK or MONTH and per apiService
    int[][] data?;
    # apiServices as column headers 
    string[] colHeaders?;
    # dates as row headers 
    string[] rowHeaders?;
};

public type APIServicesOut record {
    # List of API Services
    APIServiceOut[] apiServices?;
};

public type BatchNameIn record {
    NameIn[] properNouns?;
};

# First / last name structure corresponding to the most likely parsing.
public type FirstLastNameOut record {
    # Script
    string script?;
    # Id
    string id?;
    # The first name (also known as given name)
    string firstName?;
    # The last name (also known as family name, or surname)
    string lastName?;
};

# Represents the output of inferring the LIKELY US 'race/ethnicity' from a personal name, given US country of residence and (optionally) a ZIP5 code.
public type BatchFirstLastNameUSRaceEthnicityOut record {
    # Classified US 'race'/ethnicized names
    FirstLastNameUSRaceEthnicityOut[] personalNames?;
};

public type BatchPersonalNameIn record {
    PersonalNameIn[] personalNames?;
};

public type BatchFirstLastNamePhoneNumberIn record {
    FirstLastNamePhoneNumberIn[] personalNamesWithPhoneNumbers?;
};

public type NameGeoIn record {
    string id?;
    string name?;
    string countryIso2?;
};

# Represents the output of inferring the LIKELY country and phone code from a personal name and phone number.
public type FirstLastNamePhoneCodedOut record {
    # Script
    string script?;
    # Id
    string id?;
    # The first name (also known as given name)
    string firstName?;
    # The last name (also known as family name, or surname)
    string lastName?;
    # The normalized phone number, verified using libphonenumber.
    string internationalPhoneNumberVerified?;
    # The phone ISO2 country code, verified using libphonenumber.
    string phoneCountryIso2Verified?;
    # The phone country code of the phone number, verified using libphonenumber.
    int phoneCountryCode?;
    # The best alternative phone country code of the phone number.
    int phoneCountryCodeAlt?;
    # The likely country of the phone number.
    string phoneCountryIso2?;
    # The best alternative country of the phone number.
    string phoneCountryIso2Alt?;
    # The likely country of origin of the name.
    string originCountryIso2?;
    # The best alternative country of origin of the name.
    string originCountryIso2Alt?;
    # The input phone number.
    string phoneNumber?;
    # Indicates if the phone number could be positively verified using libphonenumber.
    boolean verified?;
    # Higher score is better, but score is not normalized. Use calibratedProbability if available. 
    @constraint:Number {maxValue: 100}
    decimal score?;
    # ISO2 country code
    string countryIso2?;
};

public type MatchPersonalFirstLastNameIn record {
    string id?;
    FirstLastNameIn name1?;
    PersonalNameIn name2?;
};

public type PersonalNameParsedOut record {
    # Script
    string script?;
    # Id
    string id?;
    # The input name
    string name?;
    # Name parsing is addressed as a classification problem, for example FN1LN1 means a first then last name order.
    string nameParserType?;
    # Second best alternative parsing. Name parsing is addressed as a classification problem, for example FN1LN1 means a first then last name order.
    string nameParserTypeAlt?;
    # First / last name structure corresponding to the most likely parsing.
    FirstLastNameOut firstLastName?;
    # Higher score is better, but score is not normalized. Use calibratedProbability if available. 
    @constraint:Number {maxValue: 100}
    decimal score?;
};

public type BatchFirstLastNameGeoZippedIn record {
    FirstLastNameGeoZippedIn[] personalNames?;
};

# Represents the output of inferring the LIKELY origin from a list of personal names.
public type BatchFirstLastNameOriginedOut record {
    # Classified origined names
    FirstLastNameOriginedOut[] personalNames?;
};

public type FirstLastNameGeoZippedIn record {
    string id?;
    string firstName?;
    string lastName?;
    string countryIso2?;
    string zipCode?;
};

# Represent any transnational interaction between names (ex. remittance, communication, cross-border investment, airline travel
public type CorridorIn record {
    # Id
    string id?;
    # First name related to transnational interaction
    FirstLastNameGeoIn firstLastNameGeoFrom?;
    # First name related to transnational interaction
    FirstLastNameGeoIn firstLastNameGeoTo?;
};

public type BatchCorridorOut record {
    # Classified corridors
    CorridorOut[] corridorFromTo?;
};

public type BatchPersonalNameGeoIn record {
    PersonalNameGeoIn[] personalNames?;
};

public type FirstLastNameIn record {
    string id?;
    string firstName?;
    string lastName?;
};

public type APIClassifierTaxonomyOut record {
    # Name of the classifier as per apiStatus (corresponds also to the name of the service in apiServices)
    string classifierName?;
    # The taxonomy classes this classifier classifies to
    string[] taxonomyClasses?;
};

# The ordered list of name matching candidates
public type NameMatchCandidateOut record {
    # The name matching candidate name
    string candidateName?;
    # The name matching estimated probability.
    decimal probability?;
    # The given name prediction score.
    decimal predScoreGivenName?;
    # The family name prediction score.
    decimal predScoreFamilyName?;
};

public type APIUsageHistoryOut record {
    # Detailed usage as reported by the deduplicating API counter.
    APICounterV2Out[] detailedUsage?;
};

# Represents the output of inferring the LIKELY country and phone code of personal names+phones.
public type BatchFirstLastNamePhoneCodedOut record {
    # Classified phone-coded names
    FirstLastNamePhoneCodedOut[] personalNamesWithPhoneNumbers?;
};

# Represents the output of inferring the LIKELY US 'race/ethnicity' from a personal name, given US country of residence and (optionally) a ZIP5 code.
public type FirstLastNameUSRaceEthnicityOut record {
    # Script
    string script?;
    # Id
    string id?;
    # The first name (also known as given name)
    string firstName?;
    # The last name (also known as family name, or surname)
    string lastName?;
    # Second most likely US 'race'/ethnicity
    string raceEthnicityAlt?;
    # Most likely US 'race'/ethnicity
    string raceEthnicity?;
    # Higher score is better, but score is not normalized. Use calibratedProbability if available. 
    @constraint:Number {maxValue: 100}
    decimal score?;
    # List 'race'/ethnicities
    string[] raceEthnicitiesTop?;
    # The calibrated probability for raceEthnicity to have been guessed correctly.
    decimal probabilityCalibrated?;
    # The calibrated probability for raceEthnicity OR raceEthnicityAlt to have been guessed correctly.
    decimal probabilityAltCalibrated?;
};

public type BatchFirstLastNamePhoneNumberGeoIn record {
    FirstLastNamePhoneNumberGeoIn[] personalNamesWithPhoneNumbers?;
};

public type PersonalNameGeoIn record {
    string id?;
    string name?;
    string countryIso2?;
};

# List of API Services
public type APIServiceOut record {
    # A service name corresponds to classifier name in apiStatus (ex. personalname_gender or personalfullname_gender)
    string serviceName?;
    # Groups together classifiers providing a similar service (ex. gender groups personalname_gender and personalfullname_gender)
    string serviceGroup?;
    # Indicates how many units per call this service costs (ex. the number of units per name)
    int costInUnits?;
};

# Represents the output of inferring the common type (anthroponym, toponym, brand, etc.) from a list of proper names.
public type BatchProperNounCategorizedOut record {
    # Classified typed proper names
    ProperNounCategorizedOut[] properNouns?;
};

public type BatchFirstLastNameIn record {
    FirstLastNameIn[] personalNames?;
};

# Classified matched names
public type NameMatchedOut record {
    # Script
    string script?;
    # Id
    string id?;
    # The name matching status.
    string matchStatus?;
    # Score.
    decimal score?;
};

public type BatchMatchPersonalFirstLastNameIn record {
    MatchPersonalFirstLastNameIn[] personalNames?;
};

public type FirstLastNamePhoneNumberGeoIn record {
    string id?;
    string firstName?;
    string lastName?;
    string phoneNumber?;
    # Represents the output of inferring the LIKELY country of Origin from a personal name.
    FirstLastNameOriginedOut FirstLastNameOriginedOut?;
    string countryIso2?;
    string countryIso2Alt?;
};

# Classified geo names
public type PersonalNameGeoOut record {
    # Script
    string script?;
    # Id
    string id?;
    # The input name.
    string name?;
    # Higher score is better, but score is not normalized. Use calibratedProbability if available. 
    @constraint:Number {maxValue: 100}
    decimal score?;
    # Most likely country 
    string country?;
    # Second best alternative : country 
    string countryAlt?;
    # Most likely region (based on country ISO2 code)
    string region?;
    # Most likely top region (based on country ISO2 code)
    string topRegion?;
    # Most likely sub region (based on country ISO2 code)
    string subRegion?;
    # List countries (top 10)
    string[] countriesTop?;
    # The calibrated probability for country to have been guessed correctly.
    decimal probabilityCalibrated?;
    # The calibrated probability for country OR countryAlt to have been guessed correctly.
    decimal probabilityAltCalibrated?;
};

public type BatchFirstLastNameGeoIn record {
    FirstLastNameGeoIn[] personalNames?;
};
