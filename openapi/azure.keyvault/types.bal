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

# Management policy for a certificate.
public type CertificatePolicy record {
    # The certificate management attributes.
    CertificateAttributes attributes?;
    # The certificate id.
    string id?;
    # Parameters for the issuer of the X509 component of a certificate.
    IssuerParameters issuer?;
    # Properties of the key pair backing a certificate.
    KeyProperties key_props?;
    # Actions that will be performed by Key Vault over the lifetime of a certificate.
    LifetimeAction[] lifetime_actions?;
    # Properties of the key backing a certificate.
    SecretProperties secret_props?;
    # Properties of the X509 component of a certificate.
    X509CertificateProperties x509_props?;
};

# The object attributes managed by the KeyVault service.
public type Attributes record {
    # Creation time in UTC.
    int created?;
    # Determines whether the object is enabled.
    boolean enabled?;
    # Expiry date in UTC.
    int exp?;
    # Not before date in UTC.
    int nbf?;
    # Last updated time in UTC.
    int updated?;
};

# Details of the organization of the certificate issuer.
public type OrganizationDetails record {
    # Details of the organization administrator.
    AdministratorDetails[] admin_details?;
    # Id of the organization.
    string id?;
};

# The certificate import parameters.
public type CertificateImportParameters record {
    # The certificate management attributes.
    CertificateAttributes attributes?;
    # Management policy for a certificate.
    CertificatePolicy policy?;
    # If the private key in base64EncodedCertificate is encrypted, the password used for encryption.
    string pwd?;
    # Application specific metadata in the form of key-value pairs.
    record {} tags?;
    # Base64 encoded representation of the certificate object to import. This certificate needs to contain the private key.
    string value;
};

# The attributes of an issuer managed by the Key Vault service.
public type IssuerAttributes record {
    # Creation time in UTC.
    int created?;
    # Determines whether the issuer is enabled.
    boolean enabled?;
    # Last updated time in UTC.
    int updated?;
};

# A list of keys that have been deleted in this vault.
public type DeletedKeyListResult record {
    # The URL to get the next set of deleted keys.
    string nextLink?;
    # A response message containing a list of deleted keys in the vault along with a link to the next page of deleted keys
    DeletedKeyItem[] value?;
};

# The backup key result, containing the backup blob.
public type BackupKeyResult record {
    # The backup blob containing the backed up key.
    string value?;
};

# The secret restore parameters.
public type SecretRestoreParameters record {
    # The backup blob associated with a secret bundle.
    string value;
};

# The storage account item containing storage account metadata.
public type StorageAccountItem record {
    # The storage account management attributes.
    StorageAccountAttributes attributes?;
    # Storage identifier.
    string id?;
    # Storage account resource Id.
    string resourceId?;
    # Application specific metadata in the form of key-value pairs.
    record {} tags?;
};

# A condition to be satisfied for an action to be executed.
public type Trigger record {
    # Days before expiry to attempt renewal. Value should be between 1 and validity_in_months multiplied by 27. If validity_in_months is 36, then value should be between 1 and 972 (36 * 27).
    int days_before_expiry?;
    # Percentage of lifetime at which to trigger. Value should be between 1 and 99.
    @constraint:Int {minValue: 1, maxValue: 99}
    int lifetime_percentage?;
};

# A SAS definition bundle consists of key vault SAS definition details plus its attributes.
public type SasDefinitionBundle record {
    # The SAS definition management attributes.
    SasDefinitionAttributes attributes?;
    # The SAS definition id.
    string id?;
    # The type of SAS token the SAS definition will create.
    string sasType?;
    # Storage account SAS definition secret id.
    string sid?;
    # Application specific metadata in the form of key-value pairs
    record {} tags?;
    # The SAS definition token template signed with an arbitrary key.  Tokens created according to the SAS definition will have the same properties as the template.
    string templateUri?;
    # The validity period of SAS tokens created according to the SAS definition.
    string validityPeriod?;
};

# The storage account update parameters.
public type StorageAccountUpdateParameters record {
    # The current active storage account key name.
    string activeKeyName?;
    # The storage account management attributes.
    StorageAccountAttributes attributes?;
    # whether keyvault should manage the storage account for the user.
    boolean autoRegenerateKey?;
    # The key regeneration time duration specified in ISO-8601 format.
    string regenerationPeriod?;
    # Application specific metadata in the form of key-value pairs.
    record {} tags?;
};

# The storage account create parameters.
public type StorageAccountCreateParameters record {
    # Current active storage account key name.
    string activeKeyName;
    # The storage account management attributes.
    StorageAccountAttributes attributes?;
    # whether keyvault should manage the storage account for the user.
    boolean autoRegenerateKey;
    # The key regeneration time duration specified in ISO-8601 format.
    string regenerationPeriod?;
    # Storage account resource id.
    string resourceId;
    # Application specific metadata in the form of key-value pairs.
    record {} tags?;
};

# The storage account key regenerate parameters.
public type StorageAccountRegenerteKeyParameters record {
    # The storage account key name.
    string keyName;
};

# The secret set parameters.
public type SecretSetParameters record {
    # The secret management attributes.
    SecretAttributes attributes?;
    # Type of the secret value such as a password.
    string contentType?;
    # Application specific metadata in the form of key-value pairs.
    record {} tags?;
    # The value of the secret.
    string value;
};

# The storage account management attributes.
public type StorageAccountAttributes record {
    # Creation time in UTC.
    int created?;
    # the enabled state of the object.
    boolean enabled?;
    # Reflects the deletion recovery level currently in effect for storage accounts in the current vault. If it contains 'Purgeable' the storage account can be permanently deleted by a privileged user; otherwise, only the system can purge the storage account, at the end of the retention interval.
    string recoveryLevel?;
    # Last updated time in UTC.
    int updated?;
};

# The backup storage result, containing the backup blob.
public type BackupStorageResult record {
    # The backup blob containing the backed up storage account.
    string value?;
};

# The certificate create parameters.
public type CertificateCreateParameters record {
    # The certificate management attributes.
    CertificateAttributes attributes?;
    # Management policy for a certificate.
    CertificatePolicy policy?;
    # Application specific metadata in the form of key-value pairs.
    record {} tags?;
};

# A certificate bundle consists of a certificate (X509) plus its attributes.
public type CertificateBundle record {
    # The certificate management attributes.
    CertificateAttributes attributes?;
    # CER contents of x509 certificate.
    string cer?;
    # The content type of the secret.
    string contentType?;
    # The certificate id.
    string id?;
    # The key id.
    string kid?;
    # Management policy for a certificate.
    CertificatePolicy policy?;
    # The secret id.
    string sid?;
    # Application specific metadata in the form of key-value pairs
    record {} tags?;
    # Thumbprint of the certificate.
    string x5t?;
};

# The key operation result.
public type KeyOperationResult record {
    # Key identifier
    string kid?;
    # The Base64 representation of the operation result.
    string value?;
};

# As of http://tools.ietf.org/html/draft-ietf-jose-json-web-key-18
public type JsonWebKey record {
    # Elliptic curve name. For valid values, see JsonWebKeyCurveName.
    string crv?;
    # RSA private exponent, or the D component of an EC private key.
    string d?;
    # RSA private key parameter.
    string dp?;
    # RSA private key parameter.
    string dq?;
    # RSA public exponent.
    string e?;
    # Symmetric key.
    string k?;
    # HSM Token, used with 'Bring Your Own Key'.
    string key_hsm?;
    # Supported key operations.
    string[] key_ops?;
    # Key identifier.
    string kid?;
    # JsonWebKey Key Type (kty), as defined in https://tools.ietf.org/html/draft-ietf-jose-json-web-algorithms-40.
    string kty?;
    # RSA modulus.
    string n?;
    # RSA secret prime.
    string p?;
    # RSA secret prime, with p < q.
    string q?;
    # RSA private key parameter.
    string qi?;
    # X component of an EC public key.
    string x?;
    # Y component of an EC public key.
    string y?;
};

# A Deleted Secret consisting of its previous id, attributes and its tags, as well as information on when it will be purged.
public type DeletedSecretBundle SecretBundle;

# The key update parameters.
public type KeyUpdateParameters record {
    # The attributes of a key managed by the key vault service.
    KeyAttributes attributes?;
    # Json web key operations. For more information on possible key operations, see JsonWebKeyOperation.
    string[] key_ops?;
    # Application specific metadata in the form of key-value pairs.
    record {} tags?;
};

# The secret restore parameters.
public type StorageRestoreParameters record {
    # The backup blob associated with a storage account.
    string value;
};

# The key operations parameters.
public type KeyOperationsParameters record {
    # Algorithm identifier
    @constraint:String {minLength: 1}
    string alg;
    # The Base64 value of encrypted data.
    string value;
};

# The SAS definition update parameters.
public type SasDefinitionUpdateParameters record {
    # The SAS definition management attributes.
    SasDefinitionAttributes attributes?;
    # The type of SAS token the SAS definition will create.
    string sasType?;
    # Application specific metadata in the form of key-value pairs.
    record {} tags?;
    # The SAS definition token template signed with an arbitrary key.  Tokens created according to the SAS definition will have the same properties as the template.
    string templateUri?;
    # The validity period of SAS tokens created according to the SAS definition.
    string validityPeriod?;
};

# The backup certificate result, containing the backup blob.
public type BackupCertificateResult record {
    # The backup blob containing the backed up certificate.
    string value?;
};

# The pending certificate signing request result.
public type PendingCertificateSigningRequestResult record {
    # The pending certificate signing request as Base64 encoded string.
    string value?;
};

# The deleted SAS definition list result
public type DeletedSasDefinitionListResult record {
    # The URL to get the next set of deleted SAS definitions.
    string nextLink?;
    # A response message containing a list of the deleted SAS definitions in the vault along with a link to the next page of deleted sas definitions
    DeletedSasDefinitionItem[] value?;
};

# The key operations parameters.
public type KeySignParameters record {
    # The signing/verification algorithm identifier. For more information on possible algorithm types, see JsonWebKeySignatureAlgorithm.
    @constraint:String {minLength: 1}
    string alg;
    # The Base64 representation of the digest.
    string value;
};

# The credentials to be used for the certificate issuer.
public type IssuerCredentials record {
    # The user name/account name/account id.
    string account_id?;
    # The password/secret/account key.
    string pwd?;
};

# The backup secret result, containing the backup blob.
public type BackupSecretResult record {
    # The backup blob containing the backed up secret.
    string value?;
};

# A deleted SAS definition bundle consisting of its previous id, attributes and its tags, as well as information on when it will be purged.
public type DeletedSasDefinitionBundle SasDefinitionBundle;

# A DeletedKeyBundle consisting of a WebKey plus its Attributes and deletion info
public type DeletedKeyBundle KeyBundle;

# The key vault error exception.
public type KeyVaultError record {
    # The key vault server error.
    Error 'error?;
};

# The deleted SAS definition item containing metadata about the deleted SAS definition.
public type DeletedSasDefinitionItem SasDefinitionItem;

# The action that will be executed.
public type Action record {
    # The type of the action.
    string action_type?;
};

# The deleted certificate item containing metadata about the deleted certificate.
public type DeletedCertificateItem CertificateItem;

# The SAS definition management attributes.
public type SasDefinitionAttributes record {
    # Creation time in UTC.
    int created?;
    # the enabled state of the object.
    boolean enabled?;
    # Reflects the deletion recovery level currently in effect for SAS definitions in the current vault. If it contains 'Purgeable' the SAS definition can be permanently deleted by a privileged user; otherwise, only the system can purge the SAS definition, at the end of the retention interval.
    string recoveryLevel?;
    # Last updated time in UTC.
    int updated?;
};

# The deleted key item containing the deleted key metadata and information about deletion.
public type DeletedKeyItem KeyItem;

# Action and its trigger that will be performed by Key Vault over the lifetime of a certificate.
public type LifetimeAction record {
    # The action that will be executed.
    Action action?;
    # A condition to be satisfied for an action to be executed.
    Trigger trigger?;
};

# A Storage account bundle consists of key vault storage account details plus its attributes.
public type StorageBundle record {
    # The current active storage account key name.
    string activeKeyName?;
    # The storage account management attributes.
    StorageAccountAttributes attributes?;
    # whether keyvault should manage the storage account for the user.
    boolean autoRegenerateKey?;
    # The storage account id.
    string id?;
    # The key regeneration time duration specified in ISO-8601 format.
    string regenerationPeriod?;
    # The storage account resource id.
    string resourceId?;
    # Application specific metadata in the form of key-value pairs
    record {} tags?;
};

# The SAS definition create parameters.
public type SasDefinitionCreateParameters record {
    # The SAS definition management attributes.
    SasDefinitionAttributes attributes?;
    # The type of SAS token the SAS definition will create.
    string sasType;
    # Application specific metadata in the form of key-value pairs.
    record {} tags?;
    # The SAS definition token template signed with an arbitrary key.  Tokens created according to the SAS definition will have the same properties as the template.
    string templateUri;
    # The validity period of SAS tokens created according to the SAS definition.
    string validityPeriod;
};

# A Deleted Certificate consisting of its previous id, attributes and its tags, as well as information on when it will be purged.
public type DeletedCertificateBundle CertificateBundle;

# The certificate restore parameters.
public type CertificateRestoreParameters record {
    # The backup blob associated with a certificate bundle.
    string value;
};

# The secret item containing secret metadata.
public type SecretItem record {
    # The secret management attributes.
    SecretAttributes attributes?;
    # Type of the secret value such as a password.
    string contentType?;
    # Secret identifier.
    string id?;
    # True if the secret's lifetime is managed by key vault. If this is a key backing a certificate, then managed will be true.
    boolean managed?;
    # Application specific metadata in the form of key-value pairs.
    record {} tags?;
};

# The secret update parameters.
public type SecretUpdateParameters record {
    # The secret management attributes.
    SecretAttributes attributes?;
    # Type of the secret value such as a password.
    string contentType?;
    # Application specific metadata in the form of key-value pairs.
    record {} tags?;
};

# The certificate issuer update parameters.
public type CertificateIssuerUpdateParameters record {
    # The attributes of an issuer managed by the Key Vault service.
    IssuerAttributes attributes?;
    # The credentials to be used for the certificate issuer.
    IssuerCredentials credentials?;
    # Details of the organization of the certificate issuer.
    OrganizationDetails org_details?;
    # The issuer provider.
    string provider?;
};

# The key create parameters.
public type KeyCreateParameters record {
    # The attributes of a key managed by the key vault service.
    KeyAttributes attributes?;
    # Elliptic curve name. For valid values, see JsonWebKeyCurveName.
    string crv?;
    # JSON web key operations. For more information, see JsonWebKeyOperation.
    string[] key_ops?;
    # The key size in bits. For example: 2048, 3072, or 4096 for RSA.
    int key_size?;
    # The type of key to create. For valid values, see JsonWebKeyType.
    @constraint:String {minLength: 1}
    string kty;
    # Application specific metadata in the form of key-value pairs.
    record {} tags?;
};

# The key import parameters.
public type KeyImportParameters record {
    # Whether to import as a hardware key (HSM) or software key.
    boolean Hsm?;
    # The attributes of a key managed by the key vault service.
    KeyAttributes attributes?;
    # As of http://tools.ietf.org/html/draft-ietf-jose-json-web-key-18
    JsonWebKey 'key;
    # Application specific metadata in the form of key-value pairs.
    record {} tags?;
};

# The storage account SAS definition list result.
public type SasDefinitionListResult record {
    # The URL to get the next set of SAS definitions.
    string nextLink?;
    # A response message containing a list of SAS definitions along with a link to the next page of SAS definitions.
    SasDefinitionItem[] value?;
};

# Properties of the X509 component of a certificate.
public type X509CertificateProperties record {
    # The enhanced key usage.
    string[] ekus?;
    # List of key usages.
    string[] key_usage?;
    # The subject alternate names of a X509 object.
    SubjectAlternativeNames sans?;
    # The subject name. Should be a valid X509 distinguished Name.
    string subject?;
    # The duration that the certificate is valid in months.
    int validity_months?;
};

# The certificate update parameters.
public type CertificateUpdateParameters record {
    # The certificate management attributes.
    CertificateAttributes attributes?;
    # Management policy for a certificate.
    CertificatePolicy policy?;
    # Application specific metadata in the form of key-value pairs.
    record {} tags?;
};

# A list of certificates that have been deleted in this vault.
public type DeletedCertificateListResult record {
    # The URL to get the next set of deleted certificates.
    string nextLink?;
    # A response message containing a list of deleted certificates in the vault along with a link to the next page of deleted certificates
    DeletedCertificateItem[] value?;
};

# The deleted storage account item containing metadata about the deleted storage account.
public type DeletedStorageAccountItem StorageAccountItem;

# A secret consisting of a value, id and its attributes.
public type SecretBundle record {
    # The secret management attributes.
    SecretAttributes attributes?;
    # The content type of the secret.
    string contentType?;
    # The secret id.
    string id?;
    # If this is a secret backing a KV certificate, then this field specifies the corresponding key backing the KV certificate.
    string kid?;
    # True if the secret's lifetime is managed by key vault. If this is a secret backing a certificate, then managed will be true.
    boolean managed?;
    # Application specific metadata in the form of key-value pairs.
    record {} tags?;
    # The secret value.
    string value?;
};

# A KeyBundle consisting of a WebKey plus its attributes.
public type KeyBundle record {
    # The attributes of a key managed by the key vault service.
    KeyAttributes attributes?;
    # As of http://tools.ietf.org/html/draft-ietf-jose-json-web-key-18
    JsonWebKey 'key?;
    # True if the key's lifetime is managed by key vault. If this is a key backing a certificate, then managed will be true.
    boolean managed?;
    # Application specific metadata in the form of key-value pairs.
    record {} tags?;
};

# The certificate issuer item containing certificate issuer metadata.
public type CertificateIssuerItem record {
    # Certificate Identifier.
    string id?;
    # The issuer provider.
    string provider?;
};

# The SAS definition item containing storage SAS definition metadata.
public type SasDefinitionItem record {
    # The SAS definition management attributes.
    SasDefinitionAttributes attributes?;
    # The storage SAS identifier.
    string id?;
    # The storage account SAS definition secret id.
    string sid?;
    # Application specific metadata in the form of key-value pairs.
    record {} tags?;
};

# The storage accounts list result.
public type StorageListResult record {
    # The URL to get the next set of storage accounts.
    string nextLink?;
    # A response message containing a list of storage accounts in the key vault along with a link to the next page of storage accounts.
    StorageAccountItem[] value?;
};

# Properties of the key pair backing a certificate.
public type KeyProperties record {
    # Elliptic curve name. For valid values, see JsonWebKeyCurveName.
    string crv?;
    # Indicates if the private key can be exported.
    boolean exportable?;
    # The key size in bits. For example: 2048, 3072, or 4096 for RSA.
    int key_size?;
    # The type of key pair to be used for the certificate.
    string kty?;
    # Indicates if the same key pair will be used on certificate renewal.
    boolean reuse_key?;
};

# The certificate management attributes.
public type CertificateAttributes Attributes;

# The certificate list result.
public type CertificateListResult record {
    # The URL to get the next set of certificates.
    string nextLink?;
    # A response message containing a list of certificates in the key vault along with a link to the next page of certificates.
    CertificateItem[] value?;
};

# The certificate merge parameters
public type CertificateMergeParameters record {
    # The certificate management attributes.
    CertificateAttributes attributes?;
    # Application specific metadata in the form of key-value pairs.
    record {} tags?;
    # The certificate or the certificate chain to merge.
    string[] x5c;
};

# Parameters for the issuer of the X509 component of a certificate.
public type IssuerParameters record {
    # Indicates if the certificates generated under this policy should be published to certificate transparency logs.
    boolean cert_transparency?;
    # Certificate type as supported by the provider (optional); for example 'OV-SSL', 'EV-SSL'
    string cty?;
    # Name of the referenced issuer object or reserved names; for example, 'Self' or 'Unknown'.
    string name?;
};

# The attributes of a key managed by the key vault service.
public type KeyAttributes Attributes;

# The key list result.
public type KeyListResult record {
    # The URL to get the next set of keys.
    string nextLink?;
    # A response message containing a list of keys in the key vault along with a link to the next page of keys.
    KeyItem[] value?;
};

# The key vault server error.
public type Error record {
    # The error code.
    string code?;
    # The key vault server error.
    Error innererror?;
    # The error message.
    string message?;
};

# The subject alternate names of a X509 object.
public type SubjectAlternativeNames record {
    # Domain names.
    string[] dns_names?;
    # Email addresses.
    string[] emails?;
    # User principal names.
    string[] upns?;
};

# The key item containing key metadata.
public type KeyItem record {
    # The attributes of a key managed by the key vault service.
    KeyAttributes attributes?;
    # Key identifier.
    string kid?;
    # True if the key's lifetime is managed by key vault. If this is a key backing a certificate, then managed will be true.
    boolean managed?;
    # Application specific metadata in the form of key-value pairs.
    record {} tags?;
};

# The certificate issuer set parameters.
public type CertificateIssuerSetParameters record {
    # The attributes of an issuer managed by the Key Vault service.
    IssuerAttributes attributes?;
    # The credentials to be used for the certificate issuer.
    IssuerCredentials credentials?;
    # Details of the organization of the certificate issuer.
    OrganizationDetails org_details?;
    # The issuer provider.
    string provider;
};

# The certificate operation update parameters.
public type CertificateOperationUpdateParameter record {
    # Indicates if cancellation was requested on the certificate operation.
    boolean cancellation_requested;
};

# A certificate operation is returned in case of asynchronous requests.
public type CertificateOperation record {
    # Indicates if cancellation was requested on the certificate operation.
    boolean cancellation_requested?;
    # The certificate signing request (CSR) that is being used in the certificate operation.
    string csr?;
    # The key vault server error.
    Error 'error?;
    # The certificate id.
    string id?;
    # Parameters for the issuer of the X509 component of a certificate.
    IssuerParameters issuer?;
    # Identifier for the certificate operation.
    string request_id?;
    # Status of the certificate operation.
    string status?;
    # The status details of the certificate operation.
    string status_details?;
    # Location which contains the result of the certificate operation.
    string target?;
};

# The deleted secret item containing metadata about the deleted secret.
public type DeletedSecretItem SecretItem;

# The deleted secret list result
public type DeletedSecretListResult record {
    # The URL to get the next set of deleted secrets.
    string nextLink?;
    # A response message containing a list of the deleted secrets in the vault along with a link to the next page of deleted secrets
    DeletedSecretItem[] value?;
};

# A deleted storage account bundle consisting of its previous id, attributes and its tags, as well as information on when it will be purged.
public type DeletedStorageBundle StorageBundle;

# The contact information for the vault certificates.
public type Contact record {
    # Email address.
    string email?;
    # Name.
    string name?;
    # Phone number.
    string phone?;
};

# The issuer for Key Vault certificate.
public type IssuerBundle record {
    # The attributes of an issuer managed by the Key Vault service.
    IssuerAttributes attributes?;
    # The credentials to be used for the certificate issuer.
    IssuerCredentials credentials?;
    # Identifier for the issuer object.
    string id?;
    # Details of the organization of the certificate issuer.
    OrganizationDetails org_details?;
    # The issuer provider.
    string provider?;
};

# The key restore parameters.
public type KeyRestoreParameters record {
    # The backup blob associated with a key bundle.
    string value;
};

# Properties of the key backing a certificate.
public type SecretProperties record {
    # The media type (MIME type).
    string contentType?;
};

# The contacts for the vault certificates.
public type Contacts record {
    # The contact list for the vault certificates.
    Contact[] contacts?;
    # Identifier for the contacts collection.
    string id?;
};

# The key verify result.
public type KeyVerifyResult record {
    # True if the signature is verified, otherwise false.
    boolean value?;
};

# The certificate item containing certificate metadata.
public type CertificateItem record {
    # The certificate management attributes.
    CertificateAttributes attributes?;
    # Certificate identifier.
    string id?;
    # Application specific metadata in the form of key-value pairs.
    record {} tags?;
    # Thumbprint of the certificate.
    string x5t?;
};

# The secret management attributes.
public type SecretAttributes Attributes;

# The secret list result.
public type SecretListResult record {
    # The URL to get the next set of secrets.
    string nextLink?;
    # A response message containing a list of secrets in the key vault along with a link to the next page of secrets.
    SecretItem[] value?;
};

# The certificate issuer list result.
public type CertificateIssuerListResult record {
    # The URL to get the next set of certificate issuers.
    string nextLink?;
    # A response message containing a list of certificate issuers in the key vault along with a link to the next page of certificate issuers.
    CertificateIssuerItem[] value?;
};

# Details of the organization administrator of the certificate issuer.
public type AdministratorDetails record {
    # Email address.
    string email?;
    # First name.
    string first_name?;
    # Last name.
    string last_name?;
    # Phone number.
    string phone?;
};

# The deleted storage account list result
public type DeletedStorageListResult record {
    # The URL to get the next set of deleted storage accounts.
    string nextLink?;
    # A response message containing a list of the deleted storage accounts in the vault along with a link to the next page of deleted storage accounts
    DeletedStorageAccountItem[] value?;
};

# The key verify parameters.
public type KeyVerifyParameters record {
    # The signing/verification algorithm. For more information on possible algorithm types, see JsonWebKeySignatureAlgorithm.
    @constraint:String {minLength: 1}
    string alg;
    # The digest used for signing.
    string digest;
    # The signature to be verified.
    string value;
};
