/* LABELS.MSS CONTENTS:
 * - place names
 * - area labels
 * - waterway labels 
 * - road labels (ref and names)
 */

/* Font sets and colors are defined in palette.mss */

/* ================================================================== */
/* PLACE NAMES
/* ================================================================== */


/* ---- Cities ------------------------------------------------------ */
#10m_populated_places::city_label_and_markers {
  [SCALERANK=1][POP_MAX>12000000][zoom>=2],
  [SCALERANK=1][POP_MAX>9000000][FEATURECLA="Admin-0 capital"][zoom=2],
  [SCALERANK=1][POP_MAX>3000000][FEATURECLA="Admin-0 capital"][zoom=3],
  [SCALERANK=1][FEATURECLA="Admin-0 capital"][zoom=4],
  [SCALERANK<=2][zoom=5],
  [SCALERANK<=3][zoom=6],
  [SCALERANK<=3][zoom=7],
  [SCALERANK<=3][zoom=8] {
    text-name: '[NAME]';
    text-avoid-edges: true;
    text-face-name: @sans_bold;
    text-size: @city_text_size+2;
    text-placement: point;
    text-fill: @city_text;
    text-halo-fill: @city_halo;
    text-halo-radius: 2;
    text-min-distance: 0;
    text-character-spacing: 2;
    text-placement-type: simple;
    text-allow-overlap: false;
    text-min-padding: 0;
    text-dx: 5;
    text-dy: -5;
    point-file: url(img/icon/dot_white_thick.svg);
    point-transform: scale(0.18,0.18);
    point-allow-overlap: false;
    [zoom>4] {
      text-transform: uppercase;
    }
    [zoom<4] {
      text-size: @city_text_size;
      text-dx: 5;
      text-dy: -5;
      point-file: url(img/icon/dot_white_thick.svg);
      point-transform: scale(0.14,0.14);
    }
  }

  [SCALERANK>3][SCALERANK<=4][zoom=5],
  [SCALERANK>3][SCALERANK<=5][zoom=6],
  [SCALERANK>3][SCALERANK<=7][zoom=7],
  [SCALERANK>3][SCALERANK<=9][zoom=8] {
    text-name: '[NAME]';
    text-avoid-edges: true;
    text-face-name: @sans_bold;
    text-size: @city_text_size;
    text-placement: point;
    text-fill: @city_text;
    text-halo-fill: @city_halo;
    text-halo-radius: 2;
    text-min-distance: 0;
    text-character-spacing: 2;
    text-placement-type: simple;
    text-allow-overlap: false;
    text-min-padding: 0;
    text-placement-type: simple;
    text-dx: 5;
    text-dy: -5;
    point-file: url(img/icon/dot_white_thick.svg);
    point-transform: scale(0.14,0.14);
    point-allow-overlap: false;
    marker-opacity: @city_marker_opacity;
  }

}

#place::city_label[type='city'][zoom>=9][zoom<=15] {
  text-name: '[name]';
  text-avoid-edges: true;
  text-face-name: @sans_bold;
  text-placement: point;
  text-fill :@city_text;
  text-halo-fill: @city_halo;
  text-halo-radius: 2;
  text-min-distance: 40;
  [zoom=9] {
    text-size:@city_text_size+2;
    text-character-spacing: 2;
    text-transform: uppercase;
  }
  [zoom=10] {
    text-size:@city_text_size+3;
    text-character-spacing: 2;
    text-transform: uppercase;
  }
  [zoom=11] {
    text-size:@city_text_size+3;
    text-character-spacing: 2;
    text-transform: uppercase;
  }
  [zoom=12] {
    text-size:@city_text_size+3;
    text-character-spacing: 2;
    text-transform: uppercase;
  }
  [zoom=13] {
    text-size:@city_text_size+4;
    text-character-spacing: 3;
    text-transform: uppercase;
  }
  [zoom=14] {
    text-size:@city_text_size+5;
    text-character-spacing: 5;
    text-transform: uppercase;
  }
  [zoom=15] {
    text-size:@city_text_size+5;
    text-character-spacing: 5;
    text-transform: uppercase;
  }
}

/* ---- Towns ------------------------------------------------------- */

#place::town[type='town'][zoom>=9][zoom<=17] {
  [zoom>=9][zoom<11]{
    text-name: '[name]';
    text-avoid-edges: true;
    text-face-name: @sans_bold;
    text-placement: point;
    text-halo-fill: @town_halo;
    text-halo-radius: 2;
    text-wrap-width: 50;
    text-min-distance: 40;
    text-placement-type: simple;
    text-allow-overlap: false;
    text-min-padding: 0;
    text-dx: 7;
    text-dy: -7;
    
    [zoom>=9]{
      text-size: @town_text_size;
      text-character-spacing: 2;
      text-fill: @town_text;
    }
    [zoom>=10]{
      text-size: @town_text_size+1;
    }
  }
    
  [zoom>=11]{
    text-name: '[name]';
    text-avoid-edges: true;
    text-face-name: @sans_bold;
    text-placement: point;
    text-fill: @town_text;
    text-size: @town_text_size+2;
    text-character-spacing: 2;
    text-halo-fill: @town_halo;
    text-halo-radius: 2;
    text-wrap-width: 50;
    text-min-distance: 40;

    [zoom>=13]{
      text-transform: uppercase;
      text-character-spacing: 2;
    }
    [zoom>=14]{
      text-size: @town_text_size+3;
      text-character-spacing: 2;
    }
  }
}

/* ---- Villages ------------------------------------------------------- */

#place::village[type='village'][zoom>=10][zoom<=17] {
  [zoom>=10][zoom<14]{
    text-name: '[name]';
    text-avoid-edges: true;
    text-face-name: @sans;
    text-placement: point;
    text-halo-fill: @town_halo;
    text-halo-radius:2;
    text-wrap-width: 30;
    text-min-distance: 70;
    text-placement-type: simple;
    text-allow-overlap: false;
    text-min-padding: 0;
    text-dx: 7;
    text-dy: -7;
    
    [zoom>=10]{
      text-size: @town_text_size;
      text-character-spacing: 1.5;
      text-fill: lighten(@town_text, 10%);
    }
    [zoom>=12]{
      text-size: @town_text_size+1;
      text-character-spacing: 2;
      text-fill: @town_text;
    }
  }

  [zoom>=14]{
    text-name: '[name]';
    text-avoid-edges: true;
    text-face-name: @sans;
    text-placement: point;
    text-fill: @town_text;
    text-size:10;
    text-transform: uppercase;
    text-character-spacing: 2;
    text-halo-fill: @town_halo;
    text-halo-radius: 2;
    text-wrap-width: 30;
    text-min-distance: 70;
  }
}

/* ---- Localities, hamlets and suburbs -------------------------------- */

#place::hamlet[type='hamlet'] [zoom>=14],
#place::hamlet[type='isolated_dwelling'] [zoom>=14],
#place::hamlet[type='farm'] [zoom>=14],
#place::hamlet[type='allotments'] [zoom>=14] {
  text-name:'[name]';
  text-avoid-edges: true;
  text-face-name:@sans;
  text-placement:point;
  text-fill:@town_text;
  text-size:10;
  text-halo-fill:@town_halo;
  text-halo-radius:2;
  text-wrap-width: 50;
  text-min-distance: 40;
  text-character-spacing: 2;
  text-line-spacing: 2;
}

#place::suburb[type='suburb']
[zoom>=14] {
  text-name:'[name]';
  text-avoid-edges: true;
  text-face-name:@sans;
  text-placement:point;
  text-fill:@town_text;
  text-size:10;
  text-halo-fill:@town_halo;
  text-halo-radius:2;
  text-wrap-width: 50;
  text-min-distance: 40;
  text-character-spacing: 2;
  text-line-spacing: 2;
}

#place::locality[type='locality']
[zoom>=15] {
  text-name: '[name]';
  text-avoid-edges: true;
  text-face-name: @sans_light_italic;
  text-placement: point;
  text-fill: lighten(@town_text,27%);
  text-size: 8;
  text-halo-fill: fadeout(@town_halo,30%);
  text-halo-radius: 2;
  text-wrap-width: 50;
  text-min-distance: 40;
  text-character-spacing: 2;
  text-line-spacing: 2;
  text-dx: 5;
  text-dy: -5;
}

/* ================================================================== */
/* WATERWAY LABELS
/* ================================================================== */

#waterway_label[type='river'][zoom>=13],
#waterway_label[type='canal'][zoom>=15],
#waterway_label[type='stream'][zoom>=17] {
  text-avoid-edges: true;
  text-name: '[name]';
  text-face-name: @sans_semi_bold_italic;
  text-fill: darken(@water,40%);
  text-halo-fill: fadeout(darken(@water,80%),20%);
  text-halo-radius: 1;
  text-placement: line;
  text-min-distance: 40;
  text-size: 9;
  text-character-spacing: 2;
  [type='river'][zoom=14],
  [type='canal'][zoom=16],
  [type='stream'][zoom=18] {
    text-character-spacing: 4;
  }
  [type='river'][zoom=15],
  [type='canal'][zoom=17] {
    text-size: 11;
    text-character-spacing: 4;
  }
  [type='river'][zoom>=16],
  [type='canal'][zoom=18] {
    text-size: 12;
    text-character-spacing: 4;
  }
}


/* ================================================================== */
/* ROAD LABELS
/* ================================================================== */
#road_label_ref {
  [type='motorway'] {
    [zoom>=9] {
      text-avoid-edges: true;
      text-name:"[ref]";
      text-face-name:@sans_bold;
      text-size:10;
      text-fill:@motorway_line;
      text-halo-fill:#fff;
      text-halo-radius:2;
      text-character-spacing:1;
      text-placement:line;
      text-min-path-length:150;
      text-min-distance:100;
    }
  }
  [type='trunk'] {
    [zoom>10] {
      text-avoid-edges: true;
      text-name:'[ref]';
      text-face-name:@sans_bold;
      text-size:9;
      text-fill:lighten(@motorway_line,15%);
      text-halo-fill:@road_halo;
      text-halo-radius:2;
      text-character-spacing:1;
      text-placement:line;
      text-min-path-length:150;
      text-min-distance:100;
    }
  }
  [type='primary'][zoom>11],
  [type='secondary'][zoom>11],
  [type='tertiary'][zoom>13] {
    text-avoid-edges: true;
    text-name:'[ref]';
    text-face-name:@sans;
    text-size:9;
    text-fill:darken(@road_text,5%);
    text-halo-fill:@road_halo;
    text-halo-radius:2;
    text-character-spacing:1;
    text-placement:line;
    text-min-path-length: 150;
    text-min-distance:100;
  }
  [class='minorroads'][zoom>13] {
    text-avoid-edges: true;
    text-name:'[ref]';
    text-face-name:@sans;
    text-size:8;
    text-fill:@road_text;
    text-halo-fill:@road_halo;
    text-halo-radius:2;
    text-character-spacing:1.2;
    text-placement:line;
    text-min-path-length: 150;
    text-min-distance:100;
  }
}

#road_label_name {
  [type='primary'][zoom>12],
  [type='secondary'][zoom>13],
  [type='tertiary'][zoom>15],
  [type='residential'][zoom>16] {
    text-avoid-edges: true;
    text-name:'[name]';
    text-face-name:@sans;
    text-size:10;
    text-placement:line;
    text-fill:darken(@road_text,5%);
    text-halo-fill:@road_halo;
    text-halo-radius:2;
    text-character-spacing:1;
  }
  [class='minorroads'][zoom>13] {
    [type!='cycleway'][type!='path'] {
      text-avoid-edges: true;
      text-name:'[name]';
      text-face-name:@sans;
      text-size:9;
      text-placement:line;
      text-fill:@road_text;
      text-halo-fill:@road_halo;
      text-halo-radius:2;
      text-character-spacing:1.2;
    }
  }
  [class='minorroads'][zoom>14] {
    [type!='cycleway'] {
      text-avoid-edges: true;
      text-name:'[name]';
      text-face-name:@sans;
      text-size:9;
      text-placement:line;
      text-fill:@road_text;
      text-halo-fill:@road_halo;
      text-halo-radius:2;
      text-character-spacing:1.2;
    }
  }
}


/* ================================================================== */
/* AREA LABELS
/* ================================================================== */

#area_label[type='water'][zoom>=13],
#area_label[type='wetland'][zoom>=13] {
  text-avoid-edges: true;
  text-name: '[name]';
  text-face-name: @sans_semi_bold_italic;
  text-fill: darken(@water,30%);
  text-halo-fill: fadeout(lighten(@water,40%),20%);
  text-halo-radius: 2;
  text-min-distance: 30;
  text-size: 10;
  text-character-spacing: 2;
  text-wrap-width: 33;
}
#area_label[type='garden'][zoom>=16],
#area_label[type='village_green'][zoom>=16],
#area_label[type='park'][zoom>=16],
#area_label[type='golf_course'][zoom>=16],
#area_label[type='nature_reserve'][zoom>=16],
#area_label[type='grass'][zoom>=15],
#area_label[type='meadow'][zoom>=15],
#area_label[type='scrub'][zoom>=15],
#area_label[type='allotments'][zoom>=15],
#area_label[type='wood'][zoom>=15],
#area_label[type='forest'][zoom>=11][area>6000000],
#area_label[type='forest'][zoom>=13][area>900],
#area_label[type='forest'][zoom>=15] {
  text-name: "[name]";
  text-avoid-edges: true;
  text-face-name: @sans_semi_bold_italic;
  text-fill: fadeout(lighten(@wood,60%), 20%);
  text-halo-fill: desaturate(darken(@wood,45%), 30%);
  text-halo-radius: 1;
  text-min-distance: 20;
  text-size:11;
  text-character-spacing: 2;
  text-wrap-width: 33;
  text-allow-overlap: false;
}
#area_label[type='hospital'][zoom>=16],
#area_label[type='school'][zoom>=16],
#area_label[type='college'][zoom>=16],
#area_label[type='university'][zoom>=16],
#area_label[type='library'][zoom>=16],
#area_label[type='cinema'][zoom>=16],
#area_label[type='theatre'][zoom>=16],
#area_label[type='zoo'][zoom>=16],
#area_label[type='place_of_worship'][zoom>=16],
#area_label[type='cemetery'][zoom>=16],
#area_label[type='aerodrome'][zoom>=11][area>6000000],
#area_label[type='aerodrome'][zoom>=13][area>900],
#area_label[type='aerodrome'][zoom>=15],
#area_label[type='fuel'][zoom>=16],
#area_label[type='parking'][zoom>=16],
#area_label[type='residential'][zoom>=16],
#area_label[type='retail'][zoom>=16],
#area_label[type='commercial'][zoom>=16],
#area_label[type='industrial'][zoom>=16],
#area_label[type='quarry'][zoom>=16],
#area_label[type='sports_center'][zoom>=16],
#area_label[type='playground'][zoom>=16],
#area_label[type='pedestrian'][zoom>=16],
#area_label[type='footway'][zoom>=16],
#area_label[type='stadium'][zoom>=14] {
  text-name: '[name]';
  text-avoid-edges: true;
  text-face-name: @sans_semi_bold_italic;
  text-fill: darken(@urban,45%);
  text-halo-fill: fadeout(lighten(@urban,20%),30%);
  text-halo-radius: 2;
  text-min-distance: 30;
  text-size: 9;
  text-character-spacing: 2;
  text-wrap-width: 33;
}


/* ================================================================== */
/* ONE-WAY ARROWS
/* ================================================================== */

#oneway_roads[zoom>=16] {
  [type="residential"],[type="secondary"],[type="unclassified"] {
    marker-line-width: 10;
    marker-placement:line;
    marker-max-error: 0.5;
    marker-spacing: 200;
    marker-file: url(img/icon/oneway.svg);
    [oneway=-1] { marker-file: url(img/icon/oneway-reverse.svg); }
  }
}


/* ****************************************************************** */
