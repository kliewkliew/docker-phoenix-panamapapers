CREATE TABLE IF NOT EXISTS intermediaries (
  name VARCHAR,
  internal_id VARCHAR,
  address VARCHAR,
  valid_until VARCHAR,
  country_codes VARCHAR,
  countries VARCHAR,
  status VARCHAR,
  node_id INTEGER PRIMARY KEY,
  sourceID VARCHAR
);
