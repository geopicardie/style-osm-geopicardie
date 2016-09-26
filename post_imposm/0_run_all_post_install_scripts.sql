set search_path to import,public;

\i roads_n_railways/add_indices.sql
\i roads_n_railways/clean_tiny_geometries.sql
\i roads_n_railways/clean_road_refs.sql
\i roads_n_railways/clean_geom_osm_roads_n_railways_gen0.sql
\i roads_n_railways/clean_geom_osm_roads_n_railways_gen1.sql
\i roads_n_railways/add_table_osm_roads_for_labels.sql

\i areas/clean_geom_osm_buildings.sql
\i areas/clean_geom_osm_landusages.sql
\i areas/clean_geom_osm_landusages_gen0.sql
\i areas/clean_geom_osm_landusages_gen1.sql
\i areas/clean_geom_osm_waterareas.sql
\i areas/clean_geom_osm_waterareas_gen0.sql
\i areas/clean_geom_osm_waterareas_gen1.sql
\i areas/add_table_osm_areas_for_labels.sql

\i waterways/add_table_osm_waterways_for_labels.sql
