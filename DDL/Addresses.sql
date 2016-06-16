CREATE TABLE IF NOT EXISTS addresses (
  address VARCHAR,
  icij_id VARCHAR,
  valid_until VARCHAR,
  country_codes VARCHAR,
  countries VARCHAR,
  node_id INTEGER PRIMARY KEY,
  sourceID VARCHAR
);
