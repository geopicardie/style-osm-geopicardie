# Copyright 2011 Omniscale (http://omniscale.com)
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from imposm.mapping import (
    Options,
    Points, LineStrings, Polygons,
    String, Bool, Integer, OneOfInt,
    set_default_name_type, LocalizedName,
    WayZOrder, ZOrder, Direction,
    GeneralizedTable, UnionView,
    PseudoArea, meter_to_mapunit, sqr_meter_to_mapunit,
)

# # internal configuration options
# # uncomment to make changes to the default values
import imposm.config
# 
# # import relations with missing rings
imposm.config.import_partial_relations = False
# 
# # select relation builder: union or contains
imposm.config.relation_builder = 'contains'
# 
# # log relation that take longer than x seconds
# imposm.config.imposm_multipolygon_report = 60
# 
# # skip relations with more rings (0 skip nothing)
# imposm.config.imposm_multipolygon_max_ring = 0


# # You can prefer a language other than the data's local language
# set_default_name_type(LocalizedName(['name:en', 'int_name', 'name']))
set_default_name_type(LocalizedName(['name:fr', 'name', 'int_name']))

db_conf = Options(
    # db='osm',
    host='localhost',
    port=5432,
    user='osm',
    password='osm',
    sslmode='allow',
    prefix='osm_new_',
    proj='epsg:900913',
)

# gpic int_ref modif
class Highway(LineStrings):
    fields = (
        ('tunnel', Bool()),
        ('bridge', Bool()),
        ('oneway', Direction()),
        ('ref', String()),
        ('layer', Integer()),
        ('z_order', WayZOrder()),
        ('access', String()),
        ('int_ref', String()),
    )
    field_filter = (
        ('area', Bool()),
    )

places = Points(
    name = 'places',
    mapping = {
        'place': (
            'country',
            'state',
            'region',
            'county',
            'city',
            'town',
            'village',
            'hamlet',
            'suburb',
            'locality',
        ),
    },
    fields = (
        ('z_order', ZOrder([
            'country',
            'state',
            'region',
            'county',
            'city',
            'town',
            'village',
            'hamlet',
            'suburb',
            'locality',
        ])),
        ('population', Integer()),
    ),
)

admin = Polygons(
    name = 'admin',
    mapping = {
        'boundary': (
            'administrative',
        ),
    },
    fields = (
        ('admin_level', OneOfInt('1 2 3 4 5 6'.split())),
    ),
)

motorways = Highway(
    name = 'motorways',
    mapping = {
        'highway': (
            'motorway',
            'motorway_link',
            'trunk',
            'trunk_link',
        ),
    }
)

mainroads = Highway(
    name = 'mainroads',
    mapping = {
        'highway': (
            'primary',
            'primary_link',
            'secondary',
            'secondary_link',
            'tertiary',
            'tertiary_link',
    )}
)

buildings = Polygons(
    name = 'buildings',
    fields = (
        ('area', PseudoArea()),
    ),
    mapping = {
        'building': (
            '__any__',
        ),
        'aeroway': (
            'terminal',
        ),
    }
)

minorroads = Highway(
    name = 'minorroads',
    mapping = {
        'highway': (
            'road',
            'path',
            'track',
            'service',
            'footway',
            'bridleway',
            'cycleway',
            'steps',
            'pedestrian',
            'living_street',
            'unclassified',
            'residential',
    )}
)

transport_points = Points(
    name = 'transport_points',
    fields = (
        ('ref', String()),
    ),
    mapping = {
        'highway': (
            'motorway_junction',
            'turning_circle',
            'bus_stop',
        ),
        'railway': (
            'station',
            'halt',
            'tram_stop',
            'crossing',
            'level_crossing',
            'subway_entrance',
        ),
        'aeroway': (
            'aerodrome',
            'terminal',
            'helipad',
            'gate',
    )}
)

railways = LineStrings(
    name = 'railways',
    fields = (
        ('tunnel', Bool()),
        ('bridge', Bool()),
        # ('ref', String()),
        ('layer', Integer()),
        ('z_order', WayZOrder()),
        # ('access', String()),
        ('service', String()),
        ('usage', String()),
    ),
    mapping = {
        'railway': (
            'rail',
            'tram',
            'light_rail',
            'subway',
            'narrow_gauge',
            'preserved',
            'funicular',
            'monorail',
    )}
)

waterways = LineStrings(
    name = 'waterways',
    mapping = {
        'waterway': (
            'stream',
            'river',
            'canal',
            'drain',
            'ditch',
        ),
    },
    fields = (
        ('boat', String()),
        ('layer', Integer()),
    ),
    field_filter = (
        ('tunnel', Bool()),
    ),
)

waterareas = Polygons(
    name = 'waterareas',
    fields = (
        ('boat', String()),
        ('area', PseudoArea()),
    ),
    mapping = {
        'waterway': ('riverbank',),
        'natural': ('water',),
        'landuse': ('basin', 'reservoir'), 
    },
)

barrierpoints = Points(
    name = 'barrierpoints',
    mapping = {
        'barrier': (
            'block',
            'bollard',
            'cattle_grid',
            'chain',
            'cycle_barrier',
            'entrance',
            'horse_stile',
            'gate',
            'spikes',
            'lift_gate',
            'kissing_gate',
            'fence',
            'yes',
            'wire_fence',
            'toll_booth',
            'stile',
    )}
)
barrierways = LineStrings(
    name = 'barrierways',
    mapping = {
        'barrier': (
            'city_wall',
            'fence',
            'hedge',
            'retaining_wall',
            'wall',
            'bollard',
            'gate',
            'spikes',
            'lift_gate',
            'kissing_gate',
            'embankment',
            'yes',
            'wire_fence',
    )}
)

aeroways = LineStrings(
    name = 'aeroways',
    mapping = {
        'aeroway': (
            'runway',
            'taxiway',
    )}
)

landusages = Polygons(
    name = 'landusages',
    fields = (
        ('area', PseudoArea()),
        ('z_order', ZOrder([
            'pedestrian',
            'footway',
            'aerodrome',
            'helipad',
            'apron',
            'playground',
            'park',
            'forest',
            'cemetery',
            'farmyard',
            'farm',
            'farmland',
            'wood',
            'meadow',
            'grass',
            'wetland',
            'village_green',
            'recreation_ground',
            'garden',
            'sports_centre',
            'pitch',
            'common',
            'allotments',
            'golf_course',
            'university',
            'school',
            'college',
            'library',
            'fuel',
            'parking',
            'nature_reserve',
            'cinema',
            'theatre',
            'place_of_worship',
            'hospital',
            'scrub',
            'zoo',
            'quarry',
            'residential',
            'retail',
            'commercial',
            'industrial',
            'railway',
            'island',
            'land',
        ])),
    ),
    mapping = {
        'landuse': (
            'park',
            'forest',
            'residential',
            'retail',
            'commercial',
            'industrial',
            'railway',
            'cemetery',
            'grass',
            'farmyard',
            'farm',
            'farmland',
            'wood',
            'meadow',
            'village_green',
            'recreation_ground',
            'allotments',
            'quarry',
        ),
        'leisure': (
            'park',
            'garden',
            'playground',
            'golf_course',
            'sports_centre',
            'pitch',
            'stadium',
            'common',
            'nature_reserve',
        ),
        'natural': (
            'wood',
            'land',
            'scrub',
            'wetland',
        ),
        'highway': (
            'pedestrian',
            'footway',
        ),
        'amenity': (
            'university',
            'school',
            'college',
            'library',
            'fuel',
            'parking',
            'cinema',
            'theatre',
            'place_of_worship',
            'hospital',
        ),
        'place': (
            'island',
        ),
        'tourism': (
            'zoo',
        ),
        'aeroway': (
            'aerodrome',
            'helipad',
            'apron',
        ),
})

amenities = Points(
    name='amenities',
    mapping = {
        'amenity': (
            'university',
            'school',
            'library',
            'fuel',
            'hospital',
            'fire_station',
            'police',
            'townhall',
        ),
})

motorways_gen1 = GeneralizedTable(
    name = 'motorways_gen1',
    tolerance = meter_to_mapunit(50.0),
    origin = motorways,
)

mainroads_gen1 = GeneralizedTable(
    name = 'mainroads_gen1',
    tolerance = meter_to_mapunit(50.0),
    origin = mainroads,
)

railways_gen1 = GeneralizedTable(
    name = 'railways_gen1',
    tolerance = meter_to_mapunit(50.0),
    origin = railways,
)

motorways_gen0 = GeneralizedTable(
    name = 'motorways_gen0',
    tolerance = meter_to_mapunit(200.0),
    origin = motorways_gen1,
)

mainroads_gen0 = GeneralizedTable(
    name = 'mainroads_gen0',
    tolerance = meter_to_mapunit(200.0),
    origin = mainroads_gen1,
)

railways_gen0 = GeneralizedTable(
    name = 'railways_gen0',
    tolerance = meter_to_mapunit(200.0),
    origin = railways_gen1,
)

landusages_gen0 = GeneralizedTable(
    name = 'landusages_gen0',
    tolerance = meter_to_mapunit(200.0),
    origin = landusages,
    where = "ST_Area(geometry)>%f" % sqr_meter_to_mapunit(500000),
)

landusages_gen1 = GeneralizedTable(
    name = 'landusages_gen1',
    tolerance = meter_to_mapunit(50.0),
    origin = landusages,
    where = "ST_Area(geometry)>%f" % sqr_meter_to_mapunit(50000),
)

waterareas_gen0 = GeneralizedTable(
    name = 'waterareas_gen0',
    tolerance = meter_to_mapunit(200.0),
    origin = waterareas,
    where = "ST_Area(geometry)>%f" % sqr_meter_to_mapunit(500000),
)

waterareas_gen1 = GeneralizedTable(
    name = 'waterareas_gen1',
    tolerance = meter_to_mapunit(50.0),
    origin = waterareas,
    where = "ST_Area(geometry)>%f" % sqr_meter_to_mapunit(50000),
)

# gpic
# tags: int_ref : we need to manage relation for ref and int_ref
roads = UnionView(
    name = 'roads',
    fields = (
        ('ref', None),
        ('int_ref', None),
        ('bridge', 0),
        ('tunnel', 0),
        ('oneway', 0),
        ('layer', 0),
        ('z_order', 0),
        ('access', None),
        ('service', None),
        ('usage', None),
    ),
    mappings = [motorways, mainroads, minorroads, railways],
)

# gpic
# tags: int_ref : we need to manage relation for ref and int_ref
roads_gen1 = UnionView(
    name = 'roads_gen1',
    fields = (
        ('ref', None),
        ('int_ref', None),
        ('bridge', 0),
        ('tunnel', 0),
        ('oneway', 0),
        ('z_order', 0),
        ('access', None),
        ('service', None),
        ('usage', None),
    ),
    mappings = [railways_gen1, mainroads_gen1, motorways_gen1],
)

# gpic
# tags: int_ref : we need to manage relation for ref and int_ref
roads_gen0 = UnionView(
    name = 'roads_gen0',
    fields = (
        ('ref', None),
        ('int_ref', None),
        ('bridge', 0),
        ('tunnel', 0),
        ('oneway', 0),
        ('z_order', 0),
        ('access', None),
        ('service', None),
        ('usage', None),
    ),
    mappings = [railways_gen0, mainroads_gen0, motorways_gen0],
)

windturbines = Points(
    name = 'windturbines',
    mapping = {
        'generator:source': (
            'wind',
         ),
    },
    fields = (
        ('power', String()),
        ('generator:type', String()),
    ),
)

powerlines = LineStrings(
    name = 'powerlines',
    mapping = {
        'power': (
            'line', 'minor_line',
        ),
    },
    fields = (
        ('cables', Integer()),
        ('wires', String()),
        ('voltage', Integer()),
    ),
)

powerpoles = Points(
    name = 'powerpoles',
    mapping = {
        'power': (
            'pole', 'tower',
        ),
    },
    fields = (
        ('height', Integer()),
    ),
)