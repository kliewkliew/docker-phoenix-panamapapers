CREATE TABLE IF NOT EXISTS entities (
  name VARCHAR,
  original_name VARCHAR,
  former_name VARCHAR,
  jurisdiction VARCHAR,
  jurisdiction_description VARCHAR,
  company_type VARCHAR,
  address VARCHAR,
  internal_id INTEGER,
  incorporation_date DATE,
  inactivation_date DATE,
  struck_off_date DATE,
  dorm_date DATE,
  status VARCHAR,
  service_provider VARCHAR,
  ibcRUC VARCHAR,
  country_codes VARCHAR,
  countries VARCHAR,
  note VARCHAR,
  valid_until VARCHAR,
  node_id INTEGER PRIMARY KEY,
  sourceID VARCHAR
);
