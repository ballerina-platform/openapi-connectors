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

# Encapsulates a list of results.
public type ResultPage record {
    # The list of currently accessible results.
    record {}[] items?;
    # The total number of accessible results, including the results not listed in <em>items</em>.
    int total?;
    # If <em>true</em>, indicates that you are denied access to part of, or all the results.
    boolean restrictedRights?;
};

public type GlobalSummary record {
    # The ID of the global summary (this ID will always be "global").
    string id?;
    # The total power consumption of all the devices.
    decimal totalPowerConsumption?;
    # The lowest heating margin among the heating margins of all the devices.<br><u>Note</u>:This field will only be present if a value could be found.
    decimal heatingMargin?;
    # The percentage of devices whose heating margin could be found.<br><u>Note</u>:This field will only be present if a value could be found.
    decimal heatingMarginCoverage?;
    # The link to the details of the device having the lowest heating margin.<br><u>Note</u>:This field will only be present if a value could be found.
    string heatingMarginDeviceUrl?;
    # The name of the device having the lowest heating margin.<br><u>Note</u>:This field will only be present if a value could be found.
    string heatingMarginDeviceName?;
    # The electricity rate for all devices. This value can be updated by users with sufficient permissions.
    decimal energyCost?;
    # The CO<sub>2</sub> emissions for all devices. This value can be updated by users with sufficient permissions.
    decimal co2Emission?;
    # Regular expression used to filter the groups for which the power consumption will be reported.
    string groupNameFilter?;
    # The data collection time (as an Epoch time, in seconds).
    int updateTimestamp?;
    # The unit in which the total power consumption is being expressed.
    string totalPowerConsumptionUnit?;
    # The unit in which the heating margin is being expressed.
    string heatingMarginUnit?;
    # The unit in which the electricity rate is being expressed.
    string energyCostUnit?;
    # The unit in which the CO<sub>2</sub> emission is being expressed.
    string co2EmissionUnit?;
    # If <em>true</em>, indicates that you do not have sufficient rights to update the global settings. However, you may still have sufficient rights to update a specific group's setting.
    boolean editable?;
};

# Contains all information regarding a specific PATROL Agent.
public type DeviceAgent record {
    # The operating system the PATROL Agent is running on.
    string os?;
    # The FQDN of the PATROL Agent.
    string name?;
    # The version of the PATROL Agent.
    string 'version?;
    # The port the PATROL Agent is running on.
    string port?;
    # The ID of the PATROL Agent.
    string id?;
    # The status of the PATROL Agent's connection.
    string connectionStatus?;
    # The link to the 'Monitors' tab of the PATROL Agent.
    string url?;
};

public type GroupSummary record {
    # The ID of the group.
    string id?;
    # The name of the group.
    string name?;
    # The ID of the server the group is attached to.
    int serverId?;
    DeviceSummary[] deviceSummaries?;
    # The total power consumption of the devices attached to the group.
    decimal totalPowerConsumption?;
    # The unit in which the total power consumption of the devices attached to the group is being expressed.
    string totalPowerConsumptionUnit?;
    # The lowest heating margin among the heating margins of the devices attached to the group.<br><u>Note</u>:This field will only be present if a value could be found.
    decimal heatingMargin?;
    # The unit in which the heating margin of the group is being expressed.
    string heatingMarginUnit?;
    # The name of the device having the lowest heating margin.<br><u>Note</u>:This field will only be present if a value could be found.
    string heatingMarginDeviceName?;
    # The link to the details of the device having the lowest heating margin.<br><u>Note</u>:This field will only be present if a value could be found.
    string heatingMarginDeviceUrl?;
    # The percentage of devices attached to the group, whose heating margin could be found.<br><u>Note</u>:This field will only be present if a value could be found.
    decimal heatingMarginCoverage?;
    # The electricity rate for all devices attached to the group. This value can be updated by users with sufficient permissions.
    decimal energyCost?;
    # The CO<sub>2</sub> emissions for all devices attached to the group. This value can be updated by users with sufficient permissions.
    decimal co2Emission?;
    # The quantity of energy consumed by the devices attached to the group during one day.
    decimal oneDayEnergyConsumption?;
    # The daily cost of the energy consumed by the devices attached to the group.<br><u>Note</u>:This field will only be present if a value could be computed.
    decimal oneDayCost?;
    # The quantity of CO<sub>2</sub> emitted by the devices attached to the group during one day.<br><u>Note</u>:This field will only be present if a value could be computed.
    decimal oneDayEmittedCo2?;
    # The confidence score (percentage) for the daily energy consumption, energy cost and CO<sub>2</sub> emission values.<br>The lower the confidence score, the more extrapolated the values are.
    decimal oneDayConfidence?;
    # The quantity of energy consumed by the devices attached to the group during one month.
    decimal oneMonthEnergyConsumption?;
    # The monthly cost of the energy consumed by the devices attached to the group.<br><u>Note</u>:This field will only be present if a value could be computed.
    decimal oneMonthCost?;
    # The quantity of CO<sub>2</sub> emitted by the devices attached to the group during one month.<br><u>Note</u>:This field will only be present if a value could be computed.
    decimal oneMonthEmittedCo2?;
    # The confidence score (percentage) for the monthly energy consumption, energy cost and CO<sub>2</sub> emission values.<br>The lower the confidence score, the more extrapolated the values are.
    decimal oneMonthConfidence?;
    # The quantity of energy consumed by the devices attached to the group during one year.
    decimal oneYearEnergyConsumption?;
    # The yearly cost of the energy consumed by the devices attached to the group.<br><u>Note</u>:This field will only be present if a value could be computed.
    decimal oneYearCost?;
    # The quantity of CO<sub>2</sub> emitted by the devices attached to the group in one year.<br><u>Note</u>:This field will only be present if a value could be computed.
    decimal oneYearEmittedCo2?;
    # The confidence score (percentage) for the yearly energy consumption, energy cost and CO<sub>2</sub> emission values.<br>The lower the confidence score, the more extrapolated the values are.
    decimal oneYearConfidence?;
    # The data collection time (as an Epoch time, in seconds).
    int updateTimestamp?;
    # The link to the group details.
    string url?;
    # The number of devices attached to the group.
    int numberOfDevices?;
    # The unit in which th euser-defined electricity rate value is being expressed.
    string energyCostUnit?;
    # The average ambient temperature based on the ambient temperatures of the devices attached to the group.
    decimal ambientTemperature?;
    # The unit in which the ambient temperature value is being expressed.
    string ambientTemperatureUnit?;
    # The unit in which the user-defined CO<sub>2</sub> emission value is being expressed.
    string co2EmissionUnit?;
    # The unit in which all energy consumption values are being expressed.
    string energyConsumptionUnit?;
    # The currency in which all energy cost values are being expressed.
    string costUnit?;
    # The unit in which all emitted CO<sub>2</sub> quantities are being expressed.
    string emittedCo2Unit?;
    string historyParentIdKey?;
    # The name of the key used to identify the group in the history table.
    boolean editable?;
};

public type DeviceSummary record {
    # The ID of the device.
    int id?;
    # The ID of the device.
    string name?;
    # The SID of the device.
    string sid?;
    # The ID of the server the device is attached to.
    int serverId?;
    # The name of the server the device is attached to.
    string serverName?;
    # The ID of the PATROL Agent the device is attached to.
    int agentId?;
    # The name of the PATROL Agent the device is attached to.
    string agentName?;
    # The power consumption of the device.
    decimal powerConsumption?;
    # The unit in which the power consumption of the device is being expressed.
    string powerConsumptionUnit?;
    # The heating margin of the device.<br><u>Note</u>:This field will only be present if a value could be found.
    decimal heatingMargin?;
    # The unit in which the heating margin of the device is being expressed.<br><u>Note</u>:This field will only be present if a value could be found.
    string heatingMarginUnit?;
    # The collection time of the heating margin (as an Epoch time, in seconds).<br><u>Note</u>:This field will only be present if a value could be found.
    string collectTime?;
    # The link to the device details.
    string deviceUrl?;
    # The data collection time (as an Epoch time, in seconds).
    int updateTimestamp?;
    # The ambient temperature of the device.
    decimal ambientTemperature?;
    string 'type?;
    # The TSMOKey of the device.
    string deviceTSMOKey?;
    # The Hardware Sentry KM version of the device's Monitor.<br><u>Note</u>:This field will only be present if a value could be found.
    string productVersion?;
};

public type ApplicationSummary record {
    # The ID of the application.
    string id?;
    # The name of the application.
    string name?;
    # The list of devices attached to the application.<br><u>Note</u>: when using the <b>Applications</b> service, this list is always empty. It is populated only when using the <b>Application Details</b> service.
    DeviceSummary[] deviceSummaries?;
    # The total power consumption of the devices attached to the application.
    decimal totalPowerConsumption?;
    # The unit in which the total power consumption of the devices attached to the application is being expressed.
    string totalPowerConsumptionUnit?;
    # The lowest heating margin among the heating margins of the devices attached to the application.<br><u>Note</u>:This field will only be present if a value could be found.
    decimal heatingMargin?;
    # The unit in which the heating margin of the application is being expressed.
    string heatingMarginUnit?;
    # The name of the device having the lowest heating margin.<br><u>Note</u>:This field will only be present if a value could be found.
    string heatingMarginDeviceName?;
    # The link to the details of the device having the lowest heating margin.<br><u>Note</u>:This field will only be present if a value could be found.
    string heatingMarginDeviceUrl?;
    # The percentage of devices attached to the application, whose heating margin could be found.<br><u>Note</u>:This field will only be present if a value could be found.
    decimal heatingMarginCoverage?;
    # The quantity of energy consumed by the devices attached to the application during one day.
    decimal oneDayEnergyConsumption?;
    # The daily cost of the energy consumed by the devices attached to the application.<br><u>Note</u>:This field will only be present if a value could be computed.
    decimal oneDayCost?;
    # The quantity of CO<sub>2</sub> emitted by the devices attached to the application during one day.<br><u>Note</u>:This field will only be present if a value could be computed.
    decimal oneDayEmittedCo2?;
    # The confidence score (percentage) for the daily energy consumption, energy cost and CO<sub>2</sub> emission values.<br>The lower the confidence score, the more extrapolated the values are.
    decimal oneDayConfidence?;
    # The quantity of energy consumed by the devices attached to the application during one month.
    decimal oneMonthEnergyConsumption?;
    # The monthly cost of the energy consumed by the devices attached to the application.<br><u>Note</u>:This field will only be present if a value could be computed.
    decimal oneMonthCost?;
    # The quantity of CO<sub>2</sub> emitted by the devices attached to the application during one month.<br><u>Note</u>:This field will only be present if a value could be computed.
    decimal oneMonthEmittedCo2?;
    # The confidence score (percentage) for the monthly energy consumption, energy cost and CO<sub>2</sub> emission values.<br>The lower the confidence score, the more extrapolated the values are.
    decimal oneMonthConfidence?;
    # The quantity of energy consumed by the devices attached to the application during one year.
    decimal oneYearEnergyConsumption?;
    # The yearly cost of the energy consumed by the devices attached to the application.<br><u>Note</u>:This field will only be present if a value could be computed.
    decimal oneYearCost?;
    # The quantity of CO<sub>2</sub> emitted by the devices attached to the application in one year.<br><u>Note</u>:This field will only be present if a value could be computed.
    decimal oneYearEmittedCo2?;
    # The confidence score (percentage) for the yearly energy consumption, energy cost and CO<sub>2</sub> emission values.<br>The lower the confidence score, the more extrapolated the values are.
    decimal oneYearConfidence?;
    # The data collection time (as an Epoch time, in seconds).
    int updateTimestamp?;
    # The link to the application details.
    string url?;
    # The number of devices attached to the application.
    int numberOfDevices?;
    # The unit in which all energy consumption values are being expressed.
    string energyConsumptionUnit?;
    # The currency in which all energy cost values are being expressed.
    string costUnit?;
    # The unit in which all CO<sub>2</sub> emission values are being expressed.
    string emittedCo2Unit?;
    # The name of the key used to identify the application in the history table.
    string historyParentIdKey?;
};

# The deserialized form of the <b>Energy Footprint Update</b> service's request payload.
public type GroupConfiguration record {
    # Updates the electricity rate (unit: $/kWh).
    decimal energyCost?;
    # Updates the CO<sub>2</sub> emission (unit: kg/kWh).
    decimal co2Emission?;
    # Updates the regular expression used to filter the groups for which the power consumption should be reported.
    string groupNameFilter?;
};

# The deserialized form of the <b>Reinitialize</b> service's request payload.
public type ReinitializeActionConfiguration record {
    # When set to <em>1</em>, removes all user-defined frequencies for discovery and polling processes to their default values (respectively 1 hour and 2 minutes).
    int resetDiscoveryAndPollingIntervals?;
    # When set to <em>1</em>, resets the number of times thresholds can be breached before triggering an alert to their default values (1 time) for numeric, discrete, connector status and present parameters.
    int resetAlertAfterNTimes?;
    # When set to <em>1</em>, removes all manually set Alert Actions and reverts to basic default actions i.e. trigger a PATROL event and annotate a parameter graph.
    int resetAlertActions?;
    # When set to <em>1</em>, reverts any manually performed configuration changes to the default Hardware Sentry values.
    int resetOtherAlertSettings?;
    # When set to <em>1</em>, deactivates the debug mode when it was manually enabled.
    int resetDebugMode?;
    # When set to <em>1</em>, reactivates the monitoring of all paused or removed objects.
    int resetRemovedPausedObjectList?;
    # When set to <em>1</em>, clears the report schedule.
    int resetReportSettings?;
    # When set to <em>1</em>, removes the custom Java settings (path and credentials). The KM will try to automatically find a suitable JRE.
    int resetJavaSettings?;
    # When set to <em>1</em>, resets all thresholds.
    int resetThresholds?;
};

public type ServiceSummary record {
    # The ID of the service.
    string id?;
    # The name of the service.
    string name?;
    # The ID of the server providing the service.
    string providerId?;
    # The list of devices attached to the service.<br><u>Note</u>: when using the <b>Services</b> service, this list is always empty. It is populated only when using the <b>Service Details</b> service.
    DeviceSummary[] deviceSummaries?;
    # The total power consumption of the devices attached to the service.
    decimal totalPowerConsumption?;
    # The unit in which the total power consumption of the devices attached to the service is being expressed.
    string totalPowerConsumptionUnit?;
    # The lowest heating margin among the heating margins of the devices attached to the service.<br><u>Note</u>:This field will only be present if a value could be found.
    decimal heatingMargin?;
    # The unit in which the heating margin of the service is being expressed.
    string heatingMarginUnit?;
    # The name of the device having the lowest heating margin.<br><u>Note</u>:This field will only be present if a value could be found.
    string heatingMarginDeviceName?;
    # The link to the details of the device having the lowest heating margin.<br><u>Note</u>:This field will only be present if a value could be found.
    string heatingMarginDeviceUrl?;
    # The percentage of devices attached to the service, whose heating margin could be found.<br><u>Note</u>:This field will only be present if a value could be found.
    decimal heatingMarginCoverage?;
    # The quantity of energy consumed by the devices attached to the service during one day.
    decimal oneDayEnergyConsumption?;
    # The daily cost of the energy consumed by the devices attached to the service.<br><u>Note</u>:This field will only be present if a value could be computed.
    decimal oneDayCost?;
    # The quantity of CO<sub>2</sub> emitted by the devices attached to the service during one day.<br><u>Note</u>:This field will only be present if a value could be computed.
    decimal oneDayEmittedCo2?;
    # The confidence score (percentage) for the daily energy consumption, energy cost and CO<sub>2</sub> emission values.<br>The lower the confidence score, the more extrapolated the values are.
    decimal oneDayConfidence?;
    # The quantity of energy consumed by the devices attached to the service during one month.
    decimal oneMonthEnergyConsumption?;
    # The monthly cost of the energy consumed by the devices attached to the service.<br><u>Note</u>:This field will only be present if a value could be computed.
    decimal oneMonthCost?;
    # The quantity of CO<sub>2</sub> emitted by the devices attached to the service during one month.<br><u>Note</u>:This field will only be present if a value could be computed.
    decimal oneMonthEmittedCo2?;
    # The confidence score (percentage) for the monthly energy consumption, energy cost and CO<sub>2</sub> emission values.<br>The lower the confidence score, the more extrapolated the values are.
    decimal oneMonthConfidence?;
    # The quantity of energy consumed by the devices attached to the service during one year.
    decimal oneYearEnergyConsumption?;
    # The yearly cost of the energy consumed by the devices attached to the service.<br><u>Note</u>:This field will only be present if a value could be computed.
    decimal oneYearCost?;
    # The quantity of CO<sub>2</sub> emitted by the devices attached to the service in one year.<br><u>Note</u>:This field will only be present if a value could be computed.
    decimal oneYearEmittedCo2?;
    # The confidence score (percentage) for the yearly energy consumption, energy cost and CO<sub>2</sub> emission values.<br>The lower the confidence score, the more extrapolated the values are.
    decimal oneYearConfidence?;
    # The data collection time (as an Epoch time, in seconds).
    int updateTimestamp?;
    # The link to the service details.
    string url?;
    # The number of devices attached to the service.
    int numberOfDevices?;
    # The unit in which all energy consumption values are being expressed.
    string energyConsumptionUnit?;
    # The currency in which all energy cost values are being expressed.
    string costUnit?;
    # The unit in which all CO<sub>2</sub> emission values are being expressed.
    string emittedCo2Unit?;
    # The name of the key used to identify the service in the history table.
    string historyParentIdKey?;
};

# The object encapsulating the output of an operation affecting the PATROL Agent.
public type ActionResponse record {
    # The output of the underlying PSL operation.
    string pslOutput?;
};

public type ErrorResponse record {
    # The error message.
    string message?;
    # The timestamp of the error.
    string date?;
    # The error's business identifier.
    string code?;
};
