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

public type SuccessfulCertListRetrievalResponse SuccessfulcertlistretrievalresponseInner[];

public type AuthorizeRequest record {
    string username;
    string password;
};

public type MdnMessage record {
    string mdnId;
    int messageId;
    string as2MessageId;
    string disposition;
    string humanMessage;
    string rawMdnS3Key;
    string mic;
    boolean signed;
    boolean incoming;
    string status;
    int timestamp;
};

public type SuccessfulMessageSubmitResponse record {
    string message?;
    string as2MessageId?;
};

public type Attachment record {
    string name;
    string url;
};

public type SuccessfulStationCreationResponse record {
    string message;
    int stationId?;
};

public type TransportHeader record {
    string 'AS2\-From;
    string 'User\-Agent;
    string 'Accept\-Encoding?;
    string 'Content\-Transfer\-Encoding?;
    string 'Message\-ID?;
    string 'Disposition\-Notification\-Options?;
    string 'AS2\-To;
    string 'Content\-Type;
    string 'Disposition\-Notification\-To?;
    string 'AS2\-Version;
    string Host?;
    string From;
    string 'MIME\-Version;
    string Subject;
};

public type SuccessfulMessageBatchDeletionResponse record {
    # AS2 IDs of the deleted messages
    string[] deleted;
};

public type MessageSubmitBody record {
    byte[] File;
};

public type SuccessfulCertRetrievalResponse record {
    string alias;
    string 'type;
    string serial_number;
    string subject_common_name;
    string subject_distinguish_name;
    string issuer_common_name;
    string issuer_distinguish_name;
    string valid_from;
    string expiry;
    # To which entities this certificate belongs to
    string[] belongsTo;
};

public type AS2Message record {
    int id;
    string as2MessageId;
    boolean incoming;
    string msgStatus;
    string mdnStatus;
    string receiverAS2Id;
    string senderAS2Id;
    string subject;
    int failures;
    string[] attachmentPaths;
    boolean compressed;
    boolean signed;
    boolean encrypted;
    string mic;
    boolean micMatches;
    int transportStatusReceived;
    string userAgent;
    int timestamp;
    boolean apiFetched;
    TransportHeader transportHeaders?;
    MdnMessage mdnMessage?;
};

public type CreationErrorResponse record {
    string message;
    RequestFieldError[] errors;
};

public type ResponseWithMessage record {
    string message;
};

public type RefreshAuthTokenRequest record {
    string username;
    string refreshToken;
};

public type MessageBatchOperationRequest record {
    # AS2 IDs of the messages
    string[] as2MessageIds;
};

public enum CertificateType {
    NEW_SELF_SIGN_CERTIFICATE,
    FROM_KEYSTORE,
    FROM_CERTIFICATE_STORE
}

public type CreateStationRequest record {
    string name;
    string as2Identifier;
    # Comma separated list of emails (up to maximum of 3 emails)
    string email;
    # Nested JSON object with station identity certificate configuration
    NewCertificateForStation|CertificateFromKeystoreForStation|CertificateFromCertStoreForStation certificate;
    string description?;
    # Whether to enable email notifications for received messages
    boolean receivedMessageNotifications?;
    # Whether to enable email notifications for send failures
    boolean failedMessageNotifications?;
    # Whether to receive messages with payload size larger than 3MB through static IP address (Business/Enterprise tier feature)
    boolean largePayloadSupport?;
};

public type NewCertificateForStation record {
    # Certificate configuration type
    CertificateType 'type = NEW_SELF_SIGN_CERTIFICATE;
    # Certificate Common Name
    string commonName;
    # Private key password
    string password;
    # Certificate key length
    int keyLength;
    # Certificate validity in years
    int validity;
    # Organization unit
    string orgUnit?;
    # Organization name
    string orgName?;
    # City
    string city?;
    # State code ISO 3166-1 alpha-2
    string state?;
    # Country code ISO 3166-1 alpha-2
    string country?;
};

public type CertificateFromKeystoreForStation record {
    # Certificate configuration type
    CertificateType 'type = FROM_KEYSTORE;
    # S3 key of the existing keystore in your MFT Gateway S3 bucket
    string keystore;
    # Keystore password
    string keystorePassword;
    # Certificate alias
    string alias;
    # Existing private key password
    string privateKeyPassword;
    # New private key password. If not provided, the existing private key password will be used as new password.
    string newPrivateKeyPassword?;
};

public type CertificateFromCertStoreForStation record {
    # Certificate configuration type
    CertificateType 'type = FROM_CERTIFICATE_STORE;
    # Existing MFT Gateway **IDENTITY** type certificate alias
    string alias;
};

public type CreatepartnerrequestCustomheaders record {
    string headerName;
    string headerValue;
};

public type RequestFieldError record {
};

public type SuccessfulcertlistretrievalresponseInner record {
    string alias?;
    string 'type?;
};

public type SuccessfulPartnerCreationResponse record {
    string message;
    int partnerId?;
};

public type SuccessfulAuthorizationResponse record {
    string api_token;
    string refresh_token;
};

public type SuccessfulMessageListRetrievalResponse record {
    # Array of AS2 IDs of the messages
    string[] messages;
};

public type SuccessfulMessageDeletionResponse record {
    # AS2 ID of the deleted message
    string deleted;
};

public type SuccessfulAttachmentListResponse record {
    int total;
    Attachment[] attachments;
};

public type SuccessfulMDNRetrievalResponse record {
    string url;
};

public type CreatePartnerRequest record {
    string name;
    string as2Identifier;
    string description?;
    # Trading partner message delivery endpoint
    string url;
    # **Base64 encoded** encryption certificate
    string encryptionCertificate;
    # Whether to encrypt outbound messages
    boolean encryptMessage?;
    # Encryption algorithm to be used
    string encryptionAlgorithm?;
    # Whether to sign outbound messages
    boolean signMessage?;
    # Signature algorithm to be used
    string signatureAlgorithm?;
    # Whether to use a different certificate to verify signature of the inbound messages. If set to `false`, **encryptionCertificate** will be used to validate incoming message signatures.
    boolean useDiffCertAsSignCert?;
    # Base64 encoded signature certificate (Required if **useDiffCertAsSignCert** set to `true`)
    string signatureCertificate?;
    # Base64 encoded SSL certificate
    string httpsCertificate?;
    # Base64 encoded encryption/sign chain certificate(s)
    string[] encryptSignChainCertificates?;
    # Base64 encoded SSL chain certificate(s)
    string[] httpsChainCertificates?;
    # Whether to validate trust anchor of the uploaded certificates
    boolean validateTrustAnchor?;
    # Default message subject for trading partner
    string messageSubject?;
    # Whether to compress messages before encryption/sign
    boolean compressBefore?;
    # Whether to compress messages after encryption/sign
    boolean compressAfter?;
    # Whether to request Message Disposition Notification
    boolean requestMDN?;
    # Whether to request signed Message Disposition Notification
    boolean requestSignedMDN?;
    # Whether to request asynchronous Disposition Notification
    boolean requestAsyncMDN?;
    # Whether to use Static IP for outbound messages (Business/Enterprise tier feature)
    boolean useStaticIP?;
    # Maximum waiting time (in seconds) before closing the outbound connection
    int transmissionTimeout?;
    # Whether to delete Attachments from the S3 bucket when a success MDN is received
    boolean deleteAttachmentsOnSuccessMdn?;
    # Whether to auto retry incomplete messages.
    #   Incomplete messages may have successfully processed by the trading partner but failed to acknowledge before
    #   the configured timeout. If sets to `true` there is a possibility of duplicating outbound messages.
    boolean autoRetryIncompleteMessages?;
    # Custom transport headers to be included in the outbound messages to this trading partner.
    #   Following header names are reserved and cannot be used. 'as2-from', 'as2-to', 'as2-version',
    #   'content-transfer-encoding', 'content-type', 'disposition-notification-options', 'mime-version',
    #   'message-id', 'receipt-delivery-option', 'destination'
    CreatepartnerrequestCustomheaders[] customHeaders?;
};