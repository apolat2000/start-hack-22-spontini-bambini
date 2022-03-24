const EVENT_TABLE = {
  name: "event",
  fields: {
    id: "id",
    timestamp: "timestamp",
    type: "type",
    issuerId: "issuer_id", //
    targetId: "target_id",
    payload: "payload", // here be "entitlement"
  },
};

const ORGANIZATION_TABLE = {
  name: "organization",
  fields: {
    id: "id",
    name: "name",
    postalAddress: "postal_address",
    type: "type",
  },
};

const ORGANIZATION_TAGS_TABLE = {
  name: "organization_tags",
  fields: {
    organizationId: "organization_id",
    tag: "tag",
    type: "type",
  },
};

const USER_TABLE = {
  name: "user",
  fields: {
    id: "id",
    homeOrganization: "home_organization",
    eduId: "edu_id",
    firstName: "first_name",
    lastName: "last_name",
    email: "email",
    mobilePhone: "mobile_phone",
    orcid: "orcid",
    // TODO: Quality (?)
  },
};

const TAG_TABLE = {
  name: "tag",
  fields: {
    name: "name",
  },
};

const DICTIONARY = {
  eventTypes: {
    join: "join",
    leave: "leave",
    newRole: "new_role",
    startSuspend: "start_suspend",
    stopSuspend: "stop_suspend",
  },
  prettyEventTypes: {
    join: "Joined",
    leave: "Left",
    newRole: "Promoted to new role",
    startSuspend: "Decided to pause for a while",
    stopSuspend: "Came back to work",
  },
  organizationTypes: {
    npo: "NPO",
    universitySpinOff: "UNIVERSITY_SPIN_OFF",
    university: "UNIVERSITY",
  },
  organizationTagsTypes: {
    skill: "skill",
    branch: "branch",
    value: "value",
  },
};

class User {
  constructor({
    id,
    home_organization,
    edu_id,
    first_name,
    last_name,
    email,
    mobile_phone,
    orcid,
    preferences,
  }) {
    this.id = id;
    this.homeOrganization = home_organization;
    this.eduId = edu_id;
    this.firstName = first_name;
    this.lastName = last_name;
    this.email = email;
    this.mobilePhone = mobile_phone;
    this.orcid = orcid;
    this.preferences = preferences;
  }
}

class Event {
  constructor({ id, timestamp, type, issuer_id, target_id, payload }) {
    this.id = id;
    this.timestamp = timestamp;
    this.type = type;
    this.issuerId = issuer_id;
    this.targetId = target_id;
    this.payload = payload;
  }
}

class Organization {
  constructor({ id, name, postal_address, type }) {
    this.id = id;
    this.name = name;
    this.postalAddress = postal_address;
    this.type = type;
  }
}

class Tag {
  constructor({ name }) {
    this.name = name;
  }
}

class UserDB {
  constructor({
    id,
    homeOrganization,
    eduId,
    firstName,
    lastName,
    email,
    mobilePhone,
    orcid,
    preferences,
  }) {
    this.id = id;
    this.home_organization = homeOrganization;
    this.edu_id = eduId;
    this.first_name = firstName;
    this.last_name = lastName;
    this.email = email;
    this.mobile_phone = mobilePhone;
    this.orcid = orcid;
    this.preferences = preferences;
  }
}

class EventDB {
  constructor({ id, timestamp, type, issuerId, targetId, payload }) {
    this.id = id;
    this.timestamp = timestamp;
    this.type = type;
    this.issuer_id = issuerId;
    this.target_id = targetId;
    this.payload = payload;
  }
}

class OrganizationDB {
  constructor({ id, name, postalAddress, type }) {
    this.id = id;
    this.name = name;
    this.postal_address = postalAddress;
    this.type = type;
  }
}

module.exports = {
  EVENT_TABLE,
  ORGANIZATION_TABLE,
  ORGANIZATION_TAGS_TABLE,
  USER_TABLE,
  TAG_TABLE,
  DICTIONARY,
  User,
  Event,
  Organization,
  Tag,
  UserDB,
  EventDB,
  OrganizationDB,
};
