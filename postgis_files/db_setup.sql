

-- Census Data & Grid

CREATE TABLE census_grid (
	grid_id_num int PRIMARY KEY,
	geom Geometry(Polygon, 25832)
);

CREATE TABLE census_features (
	feature text,
	feature_value text,
	dataset text,
	feature_id int PRIMARY KEY
);

CREATE TABLE census_dta (
	grid_id_num int,
	feature_id int,
	count int,
	CONSTRAINT fk_grid_id_num
		FOREIGN KEY(grid_id_num)
		REFERENCES census_grid(grid_id_num),
	CONSTRAINT fk_feature_id
		FOREIGN KEY(feature_id)
		REFERENCES census_features(feature_id)
);

CREATE INDEX idx_census_dta_grid_id_num 

-- 2. Run AFTER importing the OSM data

/*
	If the data is not yet imported, run

	osm2pgsql \
		berlin-germany.osm.pbf \
		service=test-gis \
		-S default.style \
		--hstore
*/

-- 2.1 Add primary keys (no foreign keys avaiable, only spatial...)


ALTER TABLE planet_osm_point ADD PRIMARY KEY (osm_id);
ALTER TABLE planet_osm_polygon ADD PRIMARY KEY (osm_id);
ALTER TABLE planet_osm_line ADD PRIMARY KEY (osm_id);
ALTER TABLE planet_osm_roads ADD PRIMARY KEY (osm_id);
