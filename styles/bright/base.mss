/* BASE.MSS CONTENTS
 * - Landuse & landcover
 * - Water areas
 * - Water ways
 */



/* ================================================================== */
/* LANDUSE & LANDCOVER
/* ================================================================== */
#10m_land[zoom>=0][zoom<6],
#land_polygons_z8[zoom>=6][zoom<10],
#processed_p[zoom>=10] {
  ::outline {
    polygon-fill: darken(@water,@waterarea_darken_border_factor);
    line-width: 1.25;
    line-color: darken(@water,@waterarea_darken_border_factor);
  }
  ::fill {
    polygon-fill: @land;
    line-width: 0.25;
    line-color: @land;
  }
}

#landuse_gen0[zoom>=6][zoom<=9],
#landuse_gen1[zoom>9][zoom<=12],
#landuse[zoom>12] {
  [type='farm'],
  [type='farmland'],
  [type='vineyard'],
  [type='quarry'] {
    polygon-fill: @land;
  }
  
  [type='fuel'][zoom>8][zoom<=11],
  [type='parking'][zoom>8][zoom<=11],
  [type='retail'][zoom>8][zoom<=11],
  [type='commercial'][zoom>8][zoom<=11],
  [type='industrial'][zoom>8][zoom<=11],
  [type='railway'][zoom>8][zoom<=11],
  [type='parking'][zoom>8][zoom<=11],
  [type='garages'][zoom>8][zoom<=11],
  [type='barracks'][zoom>8][zoom<=11],
  [type='cemetery'][zoom>8][zoom<=11],
  [type='grave_yard'][zoom>8][zoom<=11],
  [type='hospital'][zoom>8][zoom<=11],
  [type='school'][zoom>8][zoom<=11],
  [type='college'][zoom>8][zoom<=11],
  [type='university'][zoom>8][zoom<=11],
  [type='library'][zoom>8][zoom<=11],
  [type='cinema'][zoom>8][zoom<=11],
  [type='theatre'][zoom>8][zoom<=11],
  [type='zoo'][zoom>8][zoom<=11],
  [type='place_of_worship'][zoom>8][zoom<=11],
  [type='residential'][zoom>8][zoom<=11] {
    polygon-fill: @urban;
    line-width: 0.5;
    line-color: @urban;
  }

  [type='fuel'][zoom>11],
  [type='parking'][zoom>11],
  [type='retail'][zoom>11],
  [type='commercial'][zoom>11],
  [type='industrial'][zoom>11],
  [type='railway'][zoom>11],
  [type='parking'][zoom>11],
  [type='garages'][zoom>11],
  [type='barracks'][zoom>11],
  [type='cemetery'][zoom>11],
  [type='grave_yard'][zoom>11],
  [type='hospital'][zoom>11],
  [type='school'][zoom>11],
  [type='college'][zoom>11],
  [type='university'][zoom>11],
  [type='library'][zoom>11],
  [type='cinema'][zoom>11],
  [type='theatre'][zoom>11],
  [type='zoo'][zoom>11],
  [type='place_of_worship'][zoom>11],
  [type='residential'][zoom>11] {
    ::outline[zoom>12] {
      polygon-fill: darken(@urban,@urban_darken_border_factor);
      line-width: 0.8;
      line-color: darken(@water,@urban_darken_border_factor);
    }
    ::fill {
      polygon-fill: darken(@urban,@urban_darken_scale_factor);
      line-width: 0.5;
      line-color: darken(@urban,@urban_darken_scale_factor);
    }
  }
  
  [type='apron'][zoom>10],
  [type='aerodrome'][zoom>8] {
    ::outline[zoom>12] {
      polygon-fill: darken(@aerodrome,@aerodrome_darken_border_factor);
      line-width: 0.3;
      line-color: darken(@aerodrome,@aerodrome_darken_border_factor);
    }
    ::fill {
      polygon-fill: @aerodrome;
      line-width: 0.5;
      line-color: @aerodrome;
    }
  }
  
  [type='sports_center'][zoom>12],
  [type='stadium'][zoom>12],
  [type='playground'][zoom>12],
  [type='recreation_ground'][zoom>12],
  [type='pitch'][zoom>12] {
    ::outline[zoom>12] {
      polygon-fill: darken(@sports,@sports_darken_border_factor);
      line-width: 0.8;
      line-color: darken(@sports,@sports_darken_border_factor);
    }
    ::fill {
      polygon-fill: @sports;
      line-width: 0.5;
      line-color: @sports;
    }
  }
  
  [type='garden'][zoom>12],
  [type='village_green'][zoom>12],
  [type='park'][zoom>10],
  [type='golf_course'][zoom>10],
  [type='grass'][zoom>10],
  [type='scrub'][zoom>10],
  [type='allotments'][zoom>10],
  [type='meadow'][zoom>10],
  [type='orchard'][zoom>10] {
    ::outline[zoom>12] {
      polygon-fill: darken(@grass,@grass_darken_border_factor);
      line-width: 0.8;
      line-color: darken(@grass,@grass_darken_border_factor);
    }    
    ::fill {
      polygon-fill: @grass;
      line-width: 0.5;
      line-color: @grass;
    }
  }

  [type='wood'],
  [type='forest'] {
    ::outline[zoom>12] {
      polygon-fill: darken(@wood,@wood_darken_border_factor);
      line-width: 0.8;
      line-color: darken(@wood,@wood_darken_border_factor);
    }
    ::fill {
      polygon-fill: @wood;
      line-width: 0.5;
      line-color: @wood;
    }
  }

  [type='wetland'][zoom>8][zoom<13] {
    polygon-fill: @grass;
    line-width: 0.5;
    line-color: @grass;
  }
  
  [type='wetland'][zoom>=12] {
    polygon-fill: @grass;
    polygon-pattern-file: url(img/pattern/marsh-16.png);
    line-width: 0.5;
    line-color: @grass;
  }
}


/* ---- Buildings --------------------------------------------------- */
#buildings[zoom>13][type != 'hedge'][type != 'roof'] {
  polygon-fill: @building;
  line-color:   darken(@building,@building_darken_border_factor);
  line-width:   0;
  [zoom>15] {
    line-width: 0.5;
    polygon-fill: darken(@building,@building_darken_scale_factor);
    line-color:   darken(@building,@building_darken_border_factor);
  }
}

/* ---- Hedges ---- */
#buildings[zoom>=17][type = 'hedge'] {
  building-fill:@wood;
  building-height:1.0;
}

/* ---- Hedges ---- */
#buildings[zoom>=17][type = 'hedge'] {
  building-fill:@wood;
  building-height:1.0;
}

/* ---- Roofs ---- */
#roofs[zoom>16] {
  polygon-fill: @building;
  polygon-opacity: 0.35;
  line-width: 0.5;
  line-color: darken(@building,@building_darken_border_factor);
  line-opacity: 0.25;
}


/* ================================================================== */
/* WATER AREAS
/* ================================================================== */

#10m_lakes[zoom<=5] {
  line-color: darken(@water,@waterarea_darken_border_factor);
  polygon-fill: @water;
  line-width: 0.0;
  [zoom>0][scalerank<1] { line-width: 0.4; }
  [zoom>2][scalerank<2] { line-width: 0.5; }
  [zoom>3][scalerank<3] { line-width: 0.5; }
  [zoom>4][scalerank<4] { line-width: 0.5; }
}

#water_gen0[zoom>7][zoom<=9],
#water_gen1::outline[zoom>9][zoom<=12],
#water::outline[zoom>12] {
  ::outline {
    polygon-fill: darken(@water,@waterarea_darken_border_factor);
    line-width: 1.0;
    line-color: darken(@water,@waterarea_darken_border_factor);
  }
  ::fill {
    polygon-fill: @water;
    line-width: 0.2;
    line-color: @water;
  }
}


/* ================================================================== */
/* WATER WAYS
/* ================================================================== */

#10m_rivers[zoom<=5] {
  line-color: darken(@water,@waterway_darken_border_factor);
  line-width: 0.0;
  [zoom>0][scalerank<=2] { line-width: 0.4; }
  [zoom>2][scalerank<=4] { line-width: 0.5; }
  [zoom>3][scalerank<=5] { line-width: 0.5; }
  [zoom>4][scalerank<=6] { line-width: 0.5; }
}

#waterway_low[zoom>5][zoom<=12] {
  line-color: darken(@water,@waterway_darken_border_factor);
  [zoom>5][type='river'] { line-width: 0.5; }
  [zoom>=11]{ line-width: 0.6; }
}

#waterway_med[zoom>=13][zoom<=14] {
  line-color: darken(@water,@waterway_darken_border_factor);
  [type='river'],
  [type='canal'] {
    line-cap: round;
    line-join: round;
    [zoom=13]{ line-width: 1; }
    [zoom=14]{ line-width: 1.5; }
  }
  [type='stream'] {
    [zoom=13]{ line-width: 0.2; }
    [zoom=14]{ line-width: 0.4; }
  }
}
  
#waterway_high::outline[zoom>=15] {
  line-color: darken(@water,@waterway_darken_border_factor);
  [type='river'],
  [type='canal'] {
    line-cap: round;
    line-join: round;
    [zoom=15]{ line-width: 2.7; }
    [zoom=16]{ line-width: 4.7; }
    [zoom=17]{ line-width: 6.7; }
    [zoom>=18]{ line-width: 8.7; }
  }
  [type='stream'] {
    [zoom=15]{ line-width: 2.45; }
    [zoom=16]{ line-width: 3.7; }
    [zoom=17]{ line-width: 4.7; }
    [zoom>=18]{ line-width: 5.7; }
  }
  [type='ditch'],
  [type='drain'] {
    [zoom=15]{ line-width: 2.45; }
    [zoom=16]{ line-width: 3.7; }
    [zoom=17]{ line-width: 4.7; }
    [zoom>=18]{ line-width: 5.7; }
  }
}

#waterway_high[zoom>=15] {
  line-color: @water;
  [type='river'],
  [type='canal'] {
    line-cap: round;
    line-join: round;
    [zoom=15]{ line-width: 1.25; }
    [zoom=16]{ line-width: 3.5; }
    [zoom=17]{ line-width: 6; }
    [zoom>=18]{ line-width: 8; }
  }
  [type='stream'] {
    [zoom=15]{ line-width: 1; }
    [zoom=16]{ line-width: 2.5; }
    [zoom=17]{ line-width: 4; }
    [zoom>=18]{ line-width: 5; }
  }
  [type='ditch'],
  [type='drain'] {
    [zoom=15]{ line-width: 1; }
    [zoom=16]{ line-width: 2.5; }
    [zoom=17]{ line-width: 4; }
    [zoom>=18]{ line-width: 5; }
  }
}

/* ================================================================== */
/* BARRIER POINTS
/* ================================================================== */
#barrier_points[zoom>=17][stylegroup = 'divider'] {
  marker-height: 2;
  marker-fill: #c7c7c7;
  marker-line-opacity:0;
  marker-allow-overlap:true;
}

/* ================================================================== */
/* BARRIER LINES
/* ================================================================== */

#barrier_lines[zoom>=17][stylegroup = 'gate'] {
  line-width:2.5;
  line-color:#aaa;
  line-dasharray:3,2;
}

#barrier_lines[zoom>=17][stylegroup = 'fence'] {
  line-width:1.75;
  line-color:#aaa;
  line-dasharray:1,1;
}

#barrier_lines[zoom>=17][stylegroup = 'hedge'] {
  line-width:3;
  line-color:darken(@park,5);

}
