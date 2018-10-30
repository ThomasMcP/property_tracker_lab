DROP TABLE IF EXISTS property_tracker;

CREATE TABLE property_tracker(
  id SERIAL4 PRIMARY KEY,
  address VARCHAR(255),
  value INT,
  number_of_bedrooms INT,
  year_built INT,
  status VARCHAR(255),
  sq_metres INT,
  build_type VARCHAR(255)
)
