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

# A list of managed databases.
public type ManagedDatabaseListResult record {
    # Link to retrieve next page of results.
    string nextLink?;
    # Array of results.
    ManagedDatabase[] value?;
};

# Contains the information necessary to perform a complete database restore operation.
public type CompleteDatabaseRestoreDefinition record {
    # The last backup name to apply
    string lastBackupName;
};

# The managed database's properties.
public type ManagedDatabaseProperties record {
    # Collation of the metadata catalog.
    string catalogCollation?;
    # Collation of the managed database.
    string collation?;
    # Managed database create mode. PointInTimeRestore: Create a database by restoring a point in time backup of an existing database. SourceDatabaseName, SourceManagedInstanceName and PointInTime must be specified. RestoreExternalBackup: Create a database by restoring from external backup files. Collation, StorageContainerUri and StorageContainerSasToken must be specified. Recovery: Creates a database by restoring a geo-replicated backup. RecoverableDatabaseId must be specified as the recoverable database resource ID to restore.
    string createMode?;
    # Creation date of the database.
    string creationDate?;
    # Geo paired region.
    string defaultSecondaryLocation?;
    # Earliest restore point in time for point in time restore.
    string earliestRestorePoint?;
    # Instance Failover Group resource identifier that this managed database belongs to.
    string failoverGroupId?;
    # The resource identifier of the recoverable database associated with create operation of this database.
    string recoverableDatabaseId?;
    # The restorable dropped database resource id to restore when creating this database.
    string restorableDroppedDatabaseId?;
    # Conditional. If createMode is PointInTimeRestore, this value is required. Specifies the point in time (ISO8601 format) of the source database that will be restored to create the new database.
    string restorePointInTime?;
    # The resource identifier of the source database associated with create operation of this database.
    string sourceDatabaseId?;
    # Status of the database.
    string status?;
    # Conditional. If createMode is RestoreExternalBackup, this value is required. Specifies the storage container sas token.
    string storageContainerSasToken?;
    # Conditional. If createMode is RestoreExternalBackup, this value is required. Specifies the uri of the storage container where backups for this restore are stored.
    string storageContainerUri?;
};

# ARM tracked top level resource.
public type TrackedResource record {
    *Resource;
};

# ARM resource.
public type Resource record {
    # Resource ID.
    string id?;
    # Resource name.
    string name?;
    # Resource type.
    string 'type?;
};

# A managed database resource.
public type ManagedDatabase record {
    *TrackedResource;
};

# An managed database update.
public type ManagedDatabaseUpdate record {
    # The managed database's properties.
    ManagedDatabaseProperties properties?;
    # Resource tags.
    record {} tags?;
};
