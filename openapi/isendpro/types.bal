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

public type Directorycreatereponse record {
    DirectorycreatereponseEtat etat?;
};

public type ShortlinkRequest record {
    string keyid;
    string shortlink;
};

public type DirectoryUpdateRequest record {
    # Contact names
    string[] champ1?;
    # Champs I des contacts
    string[] champ10?;
    # Champs J des contacts
    string[] champ11?;
    # Champs K des contacts
    string[] champ12?;
    # Champs L des contacts
    string[] champ13?;
    # Champs M des contacts
    string[] champ14?;
    # Champs N des contacts
    string[] champ15?;
    # Champs O des contacts
    string[] champ16?;
    # Champs P des contacts
    string[] champ17?;
    # Champs Q des contacts
    string[] champ18?;
    # Champs R des contacts
    string[] champ19?;
    # Champs A des contacts
    string[] champ2?;
    # Champs S des contacts
    string[] champ20?;
    # Champs T des contacts
    string[] champ21?;
    # Champs U des contacts
    string[] champ22?;
    # Champs V des contacts
    string[] champ23?;
    # Champs W des contacts
    string[] champ24?;
    # Champs X des contacts
    string[] champ25?;
    # Champs Y des contacts
    string[] champ26?;
    # Champs Z des contacts
    string[] champ27?;
    # Champs B des contacts
    string[] champ3?;
    # Champs C des contacts
    string[] champ4?;
    # Champs D des contacts
    string[] champ5?;
    # Champs E des contacts
    string[] champ6?;
    # Champs F des contacts
    string[] champ7?;
    # Champs G des contacts
    string[] champ8?;
    # Champs H des contacts
    string[] champ9?;
    # API key
    string keyid;
    # list of phone numbers to add or delete
    string[] num;
    # Action to perform, "add" for adding numbers, "del" for removing numbers
    string repertoireEdit;
    # directory ID of the target directory
    string repertoireId;
};

public type SmsresponseEtatEtat record {
    # Return code. See "return code table" in the appendix of the documentation
    int code?;
    # Label associated with the return code
    string message?;
    # Number of long SMS invoiced
    string smslong?;
    # Phone number concerned
    string tel?;
};

public type SubaccountaddresponseEtatEtat record {
    decimal code?;
    string message?;
    string subAccountId?;
    string subAccountKeyId?;
    string subAccountLogin?;
};

public type BlacklistresponseEtatEtat record {
    # Must be "OK"
    string listeNoire;
    # Telephone number to be blacklisted. National French or international format.
    string tel;
};

public type SubaccountresponseEtat record {
    SubaccountresponseEtatEtat[] etat?;
};

public type SmsUniqueRequest record {
    # Date sent in YYYY-MM-DD format hh: mm. This parameter is optional, if it is omitted, the sending is carried out immediately.
    string date_envoi?;
    # - The sender must be an alphanumeric string between 4 and 11 characters long.
    # 
    # - The accepted characters are numbers between 0 and 9, letters between A and Z and space.
    # 
    # - It cannot consist of only numbers.
    # 
    # - For the modification of the transmitter and within the framework of commercial campaigns, the operators contractually impose to add at the end of the message the text "STOP XXXXX". As a result, the message sent cannot exceed a length of 148 characters instead of 160 characters, the "STOP" being added automatically.
    string emetteur?;
    # Fuseau horaire de la date d'envoi
    string gmt_zone?;
    # API key
    string keyid;
    # If the message is not for commercial purposes, you can request to withdraw the obligation from the STOP. Once your request has been validated by our services, you can remove the STOP SMS mention by adding nostop = "1"
    string nostop?;
    # Telephone number in national (example 0680010203) or international (example 33680010203) format
    string num;
    string numAzur?;
    # Message to send to recipients. The message must be encoded in utf-8 format and contain only characters existing in the GSM alphabet. It is also possible to send (abroad only) SMS in UCS-2, see parameter ucs2 for more details.
    string sms;
    # The long SMS allows you to exceed the limit of 160 characters by sending a message consisting of
    # of several SMS.
    # Up to 6 concatenated SMS can be sent for a maximum total length of 918
    # characters per message.
    # For technical reasons, the limit per concatenated SMS is 153 characters.
    # If the transmitter is changed, consider the automatic addition of 12 characters
    # of the "STOP SMS".
    # To send a smslong, you must add the smslong parameter to the calls. The value of SMS must be the maximum number of concatenated SMS allowed. In order not to have this error message and to obtain a dynamic calculation of the number of SMS then you must enter smslong = "999"
    string smslong?;
    # Le tracker doit être une chaine alphanumérique de moins de 50 caractères. Ce tracker sera ensuite renvoyé en paramètre des urls pour les retours des accusés de réception. 
    string tracker?;
    # It is also possible to send SMS in non-Latin alphabet (Russian, Chinese, Arabic, etc.) on 
    # numbers outside mainland France.
    # To do this, the request should be encoded in UTF-8 format and contain the argument ucs2 = "1"
    # Due to technical constraints, 1 unique SMS cannot exceed 70 characters (instead of
    # the usual 160) and in the case of long SMS, each SMS cannot exceed 67 characters.
    string ucs2?;
};

public type DirectorymodifreponseEtat record {
    DirectorymodifreponseEtatEtat[] etat?;
};

public type ShortlinkresponseEtatEtat record {
    decimal code?;
    string message?;
    string shortlink?;
};

public type SmsresponseEtat record {
    SmsresponseEtatEtat[] etat?;
};

public type Directorymodifreponse record {
    DirectorymodifreponseEtat etat?;
};

public type BlacklistResponse record {
    BlacklistresponseEtat etat?;
};

public type CountRequest record {
    string count;
    # Date sent in YYYY-MM-DD format hh: mm. This parameter is optional, if it is omitted, the sending is carried out immediately.
    string date_envoi?;
    # - The sender must be an alphanumeric string between 4 and 11 characters long.
    # 
    # - The accepted characters are numbers between 0 and 9, letters between A and Z and space.
    # 
    # - It cannot consist of only numbers.
    # 
    # - For the modification of the transmitter and within the framework of commercial campaigns, the operators contractually impose to add at the end of the message the text "STOP XXXXX". As a result, the message sent cannot exceed a length of 148 characters instead of 160 characters, the "STOP" being added automatically.
    string emetteur?;
    # Time zone of the date sent
    string gmt_zone?;
    # API key
    string keyid;
    # If the message is not for commercial purposes, you can request to withdraw the obligation from the STOP. Once your request has been validated by our services, you can remove the STOP SMS mention by adding nostop = "1"
    string nostop?;
    # Telephone number in national (example 0680010203) or international (example 33680010203) format
    string num;
    string numAzur?;
    # Message to send to recipients. The message must be encoded in utf-8 format and contain only characters existing in the GSM alphabet. It is also possible to send (abroad only) SMS in UCS-2, see parameter ucs2 for more details.
    string sms;
    # The long SMS allows you to exceed the limit of 160 characters by sending a message consisting of
    # of several SMS.
    # Up to 6 concatenated SMS can be sent for a maximum total length of 918
    # characters per message.
    # For technical reasons, the limit per concatenated SMS is 153 characters.
    # If the transmitter is changed, consider the automatic addition of 12 characters
    # of the "STOP SMS".
    # To send a smslong, you must add the smslong parameter to the calls. The value of SMS must be the maximum number of concatenated SMS allowed. In order not to have this error message and to obtain a dynamic calculation of the number of SMS then you must enter smslong = "999"
    string smslong?;
    # Le tracker doit être une chaine alphanumérique de moins de 50 caractères. Ce tracker sera ensuite renvoyé en paramètre des urls pour les retours des accusés de réception. 
    string tracker?;
    # It is also possible to send SMS in non-Latin alphabet (Russian, Chinese, Arabic, etc.) on
    # numbers outside mainland France.
    # To do this, the request should be encoded in UTF-8 format and contain the argument ucs2 = "1"
    # Due to technical constraints, 1 unique SMS cannot exceed 70 characters (instead of
    # of the usual 160) and in the case of long SMS, each SMS cannot exceed 67 characters.
    string ucs2?;
};

public type Directorycreaterequest record {
    # API key
    string keyid;
    # Action à réaliser doit valoir "create" ici.
    string repertoireEdit;
    # Nom du répertoire (libellé) à créer
    string repertoireNom;
};

public type SubaccountRequest record {
    # API key
    string keyid;
    # Amount of credit to add
    string subAccountAddCredit?;
    string subAccountCountryCode?;
    # Action to be carried out either setPrice to define a price or addCredit to add credit or setRestriction to modify the restriction stop.
    string subAccountEdit;
    # sub-account key ID
    string subAccountKeyId?;
    string subAccountPrice?;
    string subAccountRestrictionStop?;
    string subAccountRestrictionTime?;
};

# Return code table. If successful, a separate return code for each number submitted.
public type DirectorymodifreponseEtatEtat record {
    # Return code. See "return code table" in the appendix of the documentation
    string code;
    # Label associated with the return code.
    string message?;
    # directory ID passed as argument during the call
    string repertoireId?;
    # Phone number
    string tel?;
};

public type ShortlinkresponseEtat record {
    ShortlinkresponseEtatEtat[] etat?;
};

public type CountresponseEtat record {
    CountresponseEtatEtat[] etat?;
};

public type SubaccountresponseEtatEtat record {
    string code?;
    string message?;
    string subAccountId?;
    string subAccountKeyid?;
};

public type DirectorycreatereponseEtatEtat record {
    # Return code. See "return code table" in the appendix of the documentation
    string code;
    # Label associated with the return code.
    string message?;
    # directoryId of the directory created.
    string repertoireId?;
};

public type DirectorycreatereponseEtat record {
    DirectorycreatereponseEtatEtat[] etat?;
};

public type ShortlinkResponse record {
    ShortlinkresponseEtat etat?;
};

public type SMSResponse record {
    SmsresponseEtat etat?;
};

public type SubaccountResponse record {
    SubaccountresponseEtat etat?;
};

public type CountResponse record {
    CountresponseEtat etat?;
};

public type Error record {
    ErreurEtat etat?;
};

public type HLRrequest record {
    # Must be "1"
    string getHLR;
    # API key
    string keyid;
    # Phone number list
    string[] num;
};

public type SubaccountaddresponseEtat record {
    SubaccountaddresponseEtatEtat[] etat?;
};

public type SubaccountAddRequest record {
    string keyid;
    string subAccountEdit;
    string subAccountLogin;
    string subAccountPassword;
};

public type ErreurEtatEtat record {
    # Return code. See "return code table" in the appendix of the documentation
    string code?;
    # Label associated with the return code
    string message?;
};

public type HlrresponseEtat record {
    # list of returns
    HlrresponseEtatEtat[] etat;
};

public type CreditresponseEtat record {
    # Amount of credit remaining
    float credit?;
    # Credit equivalence in number of SMS to Metropolitan France.
    string quantite?;
};

public type ErreurEtat record {
    ErreurEtatEtat[] etat?;
};

public type HLRResponse record {
    HlrresponseEtat etat?;
};

public type SubaccountAddResponse record {
    SubaccountaddresponseEtat etat?;
};

public type SMSRequest record {
    # Optional parameter, date of sending in YYYY-MM-DD hh: mm format
    string date_envoi?;
    # The sender must be an alphanumeric string between 4 and 11 characters long. Accepted characters are numbers between 0 and 9, letters between A and Z and space. It cannot consist of only numbers. For modification from the sender and in the context of commercial campaigns, the operators contractually impose the following text to be added at the end of the message: STOP XXXXX Therefore, the message sent may not exceed a length of 148 characters instead of 160 characters, the STOP being added automatically. 
    string emetteur?;
    # Time zone of the date sent
    string gmt_zone?;
    # API key
    string keyid;
    # If the message is not for commercial purposes, you can request to withdraw the obligation from the STOP. Once your request has been validated by our services, you can remove the STOP SMS mention by adding nostop = "1"
    string nostop?;
    string[] num;
    string numAzur?;
    # Directory ID
    string repertoireId?;
    string[] sms;
    # The long SMS allows you to exceed the limit of 160 characters by sending a message consisting of several SMS. Up to 6 concatenated SMS can be sent for a maximum total length of 918 characters per message. For technical reasons, the limit per concatenated SMS is 153 characters. If the transmitter is changed, consider the automatic addition of 12 characters of the "STOP SMS". To send a smslong, you must add the smslong parameter to the calls. The value of SMS must be the maximum number of concatenated SMS allowed. In order not to get this error message and to obtain a dynamic calculation of the number of SMS then you must enter smslong = "999" 
    string smslong?;
    string[] tracker?;
    # It is also possible to send SMS in non-Latin alphabet (Russian, Chinese, Arabic, etc.) to numbers outside mainland France. To do this, the request should be encoded in UTF-8 format and contain the argument ucs2 = "1" Due to technical constraints, 1 single SMS cannot exceed 70 characters (instead of the usual 160) and in the case long SMS, each SMS cannot exceed 67 characters.
    string ucs2?;
};

public type CreditResponse record {
    CreditresponseEtat etat?;
};

public type BlacklistresponseEtat record {
    BlacklistresponseEtatEtat[] etat;
};

public type CountresponseEtatEtat record {
    # Number of characters
    string nb_character?;
    # Number of sms needed
    string nb_sms?;
    # Phone number
    string tel?;
};

public type HlrresponseEtatEtat record {
    # Associated operator (if valid number)
    string operator;
    # Phone number concerned
    string tel;
};
