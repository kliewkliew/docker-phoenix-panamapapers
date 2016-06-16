CREATE TABLE IF NOT EXISTS all_edges (
  node_1 INTEGER NOT NULL,
  rel_type VARCHAR,
  node_2 INTEGER NOT NULL,
  CONSTRAINT pk PRIMARY KEY (node_1, node_2)
);
