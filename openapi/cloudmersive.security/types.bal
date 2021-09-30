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

# Request to determine if a URL is an SSRF threat check
public type UrlSsrfThreatDetectionRequestFull record {
    # URL to validate
    string URL?;
    # Top level domains that you do not want to allow access to, e.g. mydomain.com - will block all subdomains as well
    string[] BlockedDomains?;
};

# Result of performing a Bot check on an IP address
public type ThreatDetectionBotCheckResponse record {
    # True if the input IP address is a Bot or Robot, false otherwise
    boolean IsBot?;
};

# Result of performing an Insecure Deserialization JSON protection operation
public type StringInsecureDeserializationJsonDetection record {
    # True if the operation was successful, false otherwise
    boolean Successful?;
    # True if the input contained Insecure Deserialization JSON, false otherwise
    boolean ContainedJsonInsecureDeserializationAttack?;
    # Original input string
    string OriginalInput?;
};

# Result of performing an Insecure Deserialization JSON protection operation
public type StringAutomaticThreatDetection record {
    # True if the operation was successful, false otherwise
    boolean Successful?;
    boolean CleanResult?;
    # True if the input contained Insecure Deserialization JSON, false otherwise
    boolean ContainedJsonInsecureDeserializationAttack?;
    # True if the input contained XSS attack, false otherwise
    boolean ContainedXssThreat?;
    # True if the input contained XXE attack, false otherwise
    boolean ContainedXxeThreat?;
    # True if the input contained SQL Injection attack, false otherwise
    boolean ContainedSqlInjectionThreat?;
    # True if the input contained an Server-Side Request Forgery (SSRF) URL attack, false otherwise
    boolean ContainedSsrfThreat?;
    # True if the input string is XML, false otherwise
    boolean IsXML?;
    # True if the input string is JSON, false otherwise
    boolean IsJSON?;
    # True if the input string is a URL, false otherwise
    boolean IsURL?;
    # Original input string
    string OriginalInput?;
};

# Result of performing an XXE threat detection operation
public type StringXxeDetectionResult record {
    # True if the operation was successful, false otherwise
    boolean Successful?;
    # True if the input contained XXE threats, false otherwise
    boolean ContainedXxe?;
};

# Result of performing a Tor node check on an IP address
public type ThreatDetectionTorNodeResponse record {
    # True if the input IP address is a Tor exit node, false otherwise
    boolean IsTorNode?;
};

# Result of checking a URL for SSRF threats
public type UrlSsrfThreatDetectionResponseFull record {
    # True if the URL is clean, false if it is at risk of containing an SSRF threat or attack
    boolean CleanURL?;
    # Threat level of the URL; possible values are High, Medium, Low and None
    string ThreatLevel?;
};

# Result of performing a IP threat check on an IP address
public type IPThreatDetectionResponse record {
    # True if the input IP address is a threat, false otherwise
    boolean IsThreat?;
    # Specifies the type of IP threat; possible values include Blocklist, Botnet, WebBot
    string ThreatType?;
};

# Result of performing an XSS protection operation
public type StringXssProtectionResult record {
    # True if the operation was successful, false otherwise
    boolean Successful?;
    # True if the input contained XSS scripting, false otherwise
    boolean ContainedXss?;
    # Original input string
    string OriginalInput?;
    # Normalized string result, with XSS removed
    string NormalizedResult?;
};

# Result of performing an SQL Injection protection operation
public type StringSqlInjectionDetectionResult record {
    # True if the operation was successful, false otherwise
    boolean Successful?;
    # True if the input contained SQL Injection attacks, false otherwise
    boolean ContainedSqlInjectionAttack?;
    # Original input string
    string OriginalInput?;
};
