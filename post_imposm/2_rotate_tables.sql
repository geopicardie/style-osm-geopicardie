-- backup => /dev/null
drop table if exists osm_areas_for_labels;
drop table if exists osm_roads_for_labels_name;
drop table if exists osm_roads_for_labels_ref;
drop table if exists osm_roads_for_labels_int_ref;
drop table if exists osm_road_relations;
drop table if exists osm_road_relations_members;
drop table if exists osm_waterways_for_labels;

-- public => backup
alter table if exists osm_areas_for_labels set schema backup;
alter table if exists osm_roads_for_labels_name set schema backup;
alter table if exists osm_roads_for_labels_ref set schema backup;
alter table if exists osm_roads_for_labels_int_ref set schema backup;
alter table if exists osm_road_relations set schema backup;
alter table if exists osm_road_relations_members set schema backup;
alter table if exists osm_waterways_for_labels set schema backup;

-- import => public
alter table if exists import.osm_areas_for_labels set schema public;
alter table if exists import.osm_roads_for_labels_name set schema public;
alter table if exists import.osm_roads_for_labels_ref set schema public;
alter table if exists import.osm_roads_for_labels_int_ref set schema public;
alter table if exists import.osm_road_relations set schema public;
alter table if exists import.osm_road_relations_members set schema public;
alter table if exists import.osm_waterways_for_labels set schema public;

