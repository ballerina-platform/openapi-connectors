// Copyright (c) 2022, WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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

# The latest classification associated with the academic level.
public type LatestClassification record {
    # The global identifier for the Latest Classification.
    string id;
};

public type StudentLevelclassifications record {
    # The academic level associated with the student.
    Level level;
    # The latest classification associated with the academic level.
    LatestClassification latestClassification;
};

# The type of student.
public type Type record {
    # The global identifier for the Type.
    string id;
};

# The residency type associated with the student.
public type Residency record {
    # The global identifier for the Residency.
    string id;
};

public type StudentResidencies record {
    # The residency type associated with the student.
    Residency residency;
    # The date the residency became effective.
    string|string startOn?;
    # The starting administrative period associated with the residency.
    record {
        # The global identifier for the Administrative Period.
        string id;
    }|record {} administrativePeriod?;
};

# Metadata about the JSON payload
public type Metadata record {
    # The name of the originator (user or system) of the data. This is informational only, do not use in business logic!
    string createdBy?;
    # The date and time when the entity instance was created
    string|string createdOn?;
    # The name of the modifier (user or system) of the data. This is informational only, do not use in business logic!
    string modifiedBy?;
    # The date and time when the entity instance was last modified
    string|string modifiedOn?;
};

public type StudentTypes record {
    # The type of student.
    Type 'type;
    # The effective date for the student type.
    string startOn;
    # The starting administrative period for the student type.
    record {
        # The global identifier for the Administrative Period.
        string id;
    }|record {} administrativePeriod?;
};

# The academic level associated with the student.
public type Level record {
    # The global identifier for the Level.
    string id;
};

# Information about a person who has, or is eligible to, register/enroll at the institution as a student.
public type Student record {
    # Metadata about the JSON payload
    Metadata metadata?;
    # The global identifier of the student.
    string id;
    # The person who has, or is eligible to, register/enroll at the institution as a student.
    Person person;
    # The types of the student.
    StudentTypes[] types?;
    # The residency types (e.g.: international, in state, out of state, etc.) associated with the student for periods of time.
    StudentResidencies[] residencies?;
    # The most recent student classification for their academic levels.
    StudentLevelclassifications[] levelClassifications?;
};

# The person who has, or is eligible to, register/enroll at the institution as a student.
public type Person record {
    # The global identifier for the Person.
    string id;
};
