/* ==================================================================
   ROAD & RAIL LINES
/* ================================================================== */

#roads_low::outline[zoom>=6][zoom<=8] {
  [zoom=6] {
    [type='motorway'] {
      line-width: 0.6;
      line-color: lighten(@motorway_line, 20%);
    }
  }
  [zoom=7] {
    [type='motorway'] {
      line-width: 1.1;
      line-color: lighten(@motorway_line, 30%);
    }
  }
  [zoom=8] {
    [type='motorway'] {
      line-width: 2.75;
      line-color: lighten(@motorway_line, 25%);
    }
  }
}

#roads_low[zoom>=6][zoom<=8] {
  [zoom=6] {
    [type='motorway'] {
      line-width: 0.0;
      line-color: #fff;
    }
  }
  [zoom=7] {
    [type='motorway'] {
      line-width: 0.0;
      line-color: #fff;
    }
  }
  [zoom=8] {
    [type='motorway'] {
      line-width: 0.65;
      line-color: #fff;
    }
  }
}

/* At mid-level scales start to show primary and secondary routes
as well. */
#roads_med[zoom>=9][zoom<=10] {
  ::outline {
    [type='motorway'],
    [type='motorway_link'] {
      line-color: lighten(@motorway_line, 12%);
      [zoom=9] {
      	line-color: lighten(@motorway_line, 16%);
      }
    }
    [type='trunk'],
    [type='trunk_link'] {
      line-color: lighten(@trunk_line, 12%);
      [zoom=9] {
      	line-color: lighten(@trunk_line, 16%);
      }
    }
    [type='primary'] { line-color: @primary_line; }
    [type='secondary'] { line-color: @secondary_line; }
    [type='tertiary'] { line-color: @standard_line; }
    [zoom=9] {
      [type='motorway_link'] { line-width: 0.8; }
      [type='motorway'],[type='trunk'] { line-width: 3.2; }
      [type='primary'],[type='trunk_link'] { line-width: 0.8; }
      [type='secondary'] { line-width: 0.3; }
    }
    [zoom=10] {
      [type='motorway_link'] { line-width: 0.8; }
      [type='motorway'],[type='trunk'] { line-width: 3.4; }
      [type='primary'], [type='trunk_link'] { line-width: 0.8; }
      [type='secondary'] { line-width: 0.3; }
    }
  }
  [type='motorway'],[type='trunk'] {
    line-color: #fff;
    line-width: 1.4;
  }
}


/* At higher levels the roads become more complex. We're now showing 
more than just automobile routes - railways, footways, and cycleways
come in as well.

/* Road width variables that are used in road & bridge styles */
@rdz11_maj: 1.6; @rdz11_med: 1.7; @rdz11_min: 0.4;
@rdz12_maj: 2.5; @rdz12_med: 1.7; @rdz12_min: 0.8;
@rdz13_maj: 3;   @rdz13_med: 2.0; @rdz13_min: 1;
@rdz14_maj: 4;   @rdz14_med: 3.0; @rdz14_min: 1.5;
@rdz15_maj: 6;   @rdz15_med: 4.5; @rdz15_min: 2;
@rdz16_maj: 8;   @rdz16_med: 6;   @rdz16_min: 4;
@rdz17_maj: 14;  @rdz17_med: 12;  @rdz17_min: 10;
@rdz18_maj: 20;  @rdz18_med: 17;  @rdz18_min: 14;

/* ---- Path, cycleway and track bridges fill ---------------- */


/* ---- Casing ----------------------------------------------- */

#roads_high::outline[zoom>=11][zoom<=20],
#tunnel[render='1_outline'][zoom>=11][zoom<=20],
#bridge[render='1_outline'][zoom>=11][zoom<=20]{
  /* -- colors & styles -- */
  line-cap: round;
  [bridge=1],
  [tunnel=1] {
    line-cap: butt;
  }
  line-join: round;
  line-color: @standard_case;
  [bridge=1] { line-color: @standard_case; }
  [zoom=11],
  [zoom=12],
  [zoom=13] { line-color: @standard_line; }
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_case;
    [bridge=1] { line-color: @motorway_case; }
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_case;
    [bridge=1] { line-color: @trunk_case; }
  }
  [type='primary'],
  [type='primary_link'] {
    line-color: @primary_case;
    [bridge=1] { line-color: @primary_case; }
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color: @secondary_case;
    [bridge=1] { line-color: @secondary_case; }
  }
  [stylegroup='railway'] {
    line-opacity: 0;
  }
  [type='construction'],
  [type='abandoned'],
  [type='disused'] {
    line-width: 0;
    line-opacity: 0;
  }
  [tunnel=1] { line-dasharray: 1,3; }

  /* -- widths -- */
  [zoom=11] {
    [stylegroup='motorway'] { line-width: @rdz11_maj + 2; }
    [stylegroup='mainroad'] { line-width: @rdz11_med + 1.5; }
    [stylegroup='minorroad']{
      line-width: @rdz11_min;
	  [type='motorway_link'],
	  [type='trunk_link'] {
      	line-width: (@rdz11_maj + 2)/1.5;
      }
	  [type='primary_link'] {
      	line-width: (@rdz11_maj + 2)/1.7;
      }
    }
    [stylegroup='restricted']  { line-width: 0; }
    [stylegroup='track']       { line-width: 0; }
    [stylegroup='cycleway']    { line-width: 0; }
    [stylegroup='path']        { line-width: 0; }
    [stylegroup='railway']     { line-width: 0; }
  }
  [zoom=12] {
    [stylegroup='motorway'] { line-width: @rdz12_maj + 2; }
    [stylegroup='mainroad'] { line-width: @rdz12_med + 2; }
    [stylegroup='minorroad']{
      line-width: @rdz12_min;
	  [type='motorway_link'],
	  [type='trunk_link'] {
      	line-width: (@rdz12_maj + 2)/1.5;
      }
	  [type='primary_link'] {
      	line-width: (@rdz12_maj + 2)/1.7;
      }
    }
    [stylegroup='restricted']  { line-width: 0; }
    [stylegroup='track']       { line-width: 0; }
    [stylegroup='cycleway']    { line-width: 0; }
    [stylegroup='path']        { line-width: 0; }
    [stylegroup='railway']     { line-width: 0; }
  }
  [zoom=13] {
    [stylegroup='motorway'] { line-width: @rdz13_maj + 2; }
    [stylegroup='mainroad'] { line-width: @rdz13_med + 2; }
    [stylegroup='minorroad']{
      line-width: @rdz13_min;
	  [type='motorway_link'],
	  [type='trunk_link'] {
      	line-width: (@rdz13_maj + 2)/1.7;
      }
	  [type='primary_link'] {
      	line-width: (@rdz13_maj + 2)/2.0;
      }
    }
    [stylegroup='restricted']  { line-width: 0; }
    [stylegroup='track']       { line-width: 0; }
    [stylegroup='cycleway']    { line-width: 0; }
    [stylegroup='path']        { line-width: 0; }
    [stylegroup='railway']     { line-width: 0; }
  }
  [zoom=14] {
    [stylegroup='motorway'] { line-width: @rdz14_maj + 2; }
    [stylegroup='mainroad'] { line-width: @rdz14_med + 2; }
    [stylegroup='minorroad']{ line-width: @rdz14_min + 2; }
    [stylegroup='restricted']  { line-width: 0; }
    [stylegroup='track']       { line-width: 0; }
    [stylegroup='cycleway']    { line-width: 0; }
    [stylegroup='path']        { line-width: 0; }
    [stylegroup='railway']     { line-width: 0; }
 }
  [zoom=15] {
    [stylegroup='motorway'] { line-width: @rdz15_maj + 2.5; }
    [stylegroup='mainroad'] { line-width: @rdz15_med + 2; }
    [stylegroup='minorroad']{ line-width: @rdz15_min + 2; }
    [stylegroup='restricted']  { line-width: @rdz15_min / 3 + 1.2; }
    [stylegroup='path'],
    [stylegroup='track'],
    [stylegroup='cycleway']    { line-width: 0; }
    [stylegroup='railway']     { line-width: 0; }
  }
  [zoom=16] {
    [stylegroup='motorway'] { line-width: @rdz16_maj + 2.5; }
    [stylegroup='mainroad'] { line-width: @rdz16_med + 2.5; }
    [stylegroup='minorroad']{ line-width: @rdz16_min + 2; }
    [stylegroup='restricted']  { line-width: @rdz16_min / 3 + 2; }
    [stylegroup='path'],
    [stylegroup='track'],
    [stylegroup='cycleway']    { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
  [zoom>=17] {
    [stylegroup='motorway'] { line-width: @rdz17_maj + 3; }
    [stylegroup='mainroad'] { line-width: @rdz17_med + 2.5; }
    [stylegroup='minorroad']{ line-width: @rdz17_min + 2; }
    [stylegroup='restricted']  { line-width: @rdz17_min / 3 + 2; }
    [stylegroup='path'],
    [stylegroup='track'],
    [stylegroup='cycleway']    { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
  [zoom>=18] {
    [stylegroup='motorway'] { line-width: @rdz18_maj + 4; }
    [stylegroup='mainroad'] { line-width: @rdz18_med + 4; }
    [stylegroup='minorroad']{ line-width: @rdz18_min + 3.5; }
    [stylegroup='restricted']  { line-width: @rdz18_min / 2 + 2; }
    [stylegroup='path'],
    [stylegroup='track'],
    [stylegroup='cycleway']    { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
}


#roads_high[zoom>=11][zoom<=20],
#tunnel[render='3_inline'][zoom>=11][zoom<=20],
#bridge[render='3_inline'][zoom>=11][zoom<=20]{
  /* -- colors & styles -- */
  line-color: @standard_fill;
  line-width: 3.0;
  line-opacity: 0;

  [tunnel=1] {
    line-color: @standard_tunnel_fill; 
  }
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_fill;
    line-opacity: 1.0;
    [tunnel=1] { line-color: @motorway_tunnel_fill; }
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_fill;
    line-opacity: 1.0;
    [tunnel=1] { line-color: @trunk_tunnel_fill; }
  }
  [type='primary'],
  [type='primary_link'] {
    line-color: @primary_fill;
    line-opacity: 1.0;
    [tunnel=1] { line-color: @primary_tunnel_fill; }
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color: @secondary_fill;
    line-opacity: 1.0;
    [tunnel=1] { line-color: @secondary_tunnel_fill; }
  }
  [stylegroup='railway'] {
    line-opacity: 1;
    line-color: darken(@rail_fill,18);
    [type='subway'] { line-opacity: 0; line-width: 0; }
    [type='tram'] { line-opacity: 0; line-width: 0; }
    [tunnel=1] { line-opacity: 0; line-width: 0; }
    [usage!='main'] { line-opacity: 0; line-width: 0; }
    [zoom>=13] { line-color: darken(@rail_fill,9); }
    [zoom>=15] { line-color: @rail_fill; }
  }
  [type='construction'],
  [type='abandoned'],
  [type='disused'] {
    line-width: 0;
    line-opacity: 0;
  }
  [stylegroup='path'],
  [stylegroup='track'],
  [stylegroup='cycleway'],
  [stylegroup='restricted'],
  [stylegroup='minorroad'] {
    line-width: 0;
  }
  [stylegroup='restricted'],
  [stylegroup='minorroad'],
  [stylegroup='mainroad'],
  [stylegroup='motorway'] {
    line-cap: round;
    line-join: round;
  }
  [stylegroup='path'],
  [stylegroup='track'],
  [stylegroup='cycleway'] {
    line-join: round;
    line-color: @path;
/*    [bridge=1] { 
      line-color: @standard_fill;
    }
*/
  }
  [tunnel=1] {
    line-cap: butt;
  }

  /* -- widths -- */
  [zoom=11] {
    [stylegroup='motorway'] { line-width: @rdz11_maj; }
    [stylegroup='mainroad'] { line-width: @rdz11_med; }
    [stylegroup='minorroad']{
      line-width: 0;
	  [type='motorway_link'],
	  [type='trunk_link'] {
      	line-width: (@rdz11_maj)/2.0;
      }
	  [type='primary_link'] {
      	line-width: (@rdz11_maj)/2.2;
      }
    }
    [stylegroup='railway'] {
      line-opacity: 0;
      line-width: 0.75;
      [type='rail'] {
        [usage='main'],
        [usage='branch'] {
          line-opacity: 1;
        }
      }
    }
  }
  [zoom=12] {
    [stylegroup='motorway'] { line-width: @rdz12_maj; }
    [stylegroup='mainroad'] { line-width: @rdz12_med; }
    [stylegroup='minorroad']{
      line-width: 0;
	  [type='motorway_link'],
	  [type='trunk_link'] {
      	line-width: (@rdz12_maj)/2.0;
      }
	  [type='primary_link'] {
      	line-width: (@rdz12_maj)/2.2;
      }
    }
  }
  [zoom=12],
  [zoom=13] {
    [stylegroup='railway'] {
      line-width: 0.5;
      line-opacity: 0;
      [type='rail'],
      [type='preserved'] {
        [usage='main'],
        [usage='branch'] {
          line-width: 0.75;
          line-opacity: 1;
        }
        [usage='industrial'][service='none'],
        [usage='military'][service='none'],
        [usage='tourism'][service='none'],
        [usage='none'][service='none'] {
          line-opacity: 0.75;
          line-width: 0.5;
          line-color: @rail_fill;
        }
        [usage='none'][service='siding'],
        [usage='none'][service='spur'],
        [usage='none'][service='yard'] {
          line-opacity: 0.65;
          line-width: 0.3;
          line-color: @rail_fill;
        }
      }
    }
  }
  [zoom=13] {
    [stylegroup='motorway'] { line-width: @rdz13_maj; }
    [stylegroup='mainroad'] { line-width: @rdz13_med; }
    [stylegroup='minorroad']{
      line-width: 0;
	  [type='motorway_link'],
	  [type='trunk_link'] {
      	line-width: (@rdz13_maj)/2.2;
      }
	  [type='primary_link'] {
      	line-width: (@rdz13_maj)/2.6;
      }
    }
  }
  [zoom>=14] {
    [stylegroup='minorroad'], [stylegroup='track'] { line-opacity: 1.0 }
  }
  [zoom=14] {
    [stylegroup='motorway'] { line-width: @rdz14_maj; }
    [stylegroup='mainroad'] { line-width: @rdz14_med; }
    [stylegroup='minorroad']{ line-width: @rdz14_min; }
    [stylegroup='track'] { line-width: 0.5; line-dasharray: 2,1; }
  }
  [zoom=14],
  [zoom=15] {
    [stylegroup='railway'] {
      line-opacity: 0;
      [type='rail'],
      [type='preserved'] {
        [usage='main'],
        [usage='branch'] {
          line-width: 0.9;
          line-opacity: 1;
        }
        [usage='industrial'],
        [usage='military'],
        [usage='tourism'],
        [usage='other'],
        [usage='none'] {
          line-width: 0.7;
          line-opacity: 0.75;
          [service='siding'],
          [service='spur'],
          [service='yard'] {
            line-width: 0.5;
            line-opacity: 0.75;
          }
        }
      }
      [type='subway'][tunnel=0] {
        line-width: 0.7;
        line-opacity: 0.75;
      }
    }
  }
  [zoom>=15] {
    [stylegroup='restricted'], [stylegroup='path'], [stylegroup='cycleway'] { line-opacity: 1.0 }
  }
  [zoom=15] {
    [stylegroup='motorway'] { line-width: @rdz15_maj; }
    [stylegroup='mainroad'] { line-width: @rdz15_med; }
    [stylegroup='minorroad']{ line-width: @rdz15_min; }
    [stylegroup='restricted']  { line-width: @rdz15_min / 2.5; }
    [stylegroup='path'],
    [stylegroup='track'],
    [stylegroup='cycleway']    { line-width: 0.3; line-dasharray: 2,1; }
  }
  [zoom=16] {
    [stylegroup='motorway'] { line-width: @rdz16_maj; }
    [stylegroup='mainroad'] { line-width: @rdz16_med; }
    [stylegroup='minorroad']{ line-width: @rdz16_min; }
    [stylegroup='restricted']  { line-width: @rdz16_min / 2.5; }
    [stylegroup='path'],
    [stylegroup='track'],
    [stylegroup='cycleway']    { line-width: 0.5; line-dasharray: 2,1; }
  }
  [zoom=16],
  [zoom=17] {
    [stylegroup='railway'] {
      line-opacity: 0;
      line-width: 1.0;
      [type='rail'],
      [type='preserved'] {
        [service='none'] {
          line-width: 1.35;
          line-opacity: 1;
        }
        [service='siding'],
        [service='spur'],
        [service='yard'] {
          line-width: 0.8;
          line-opacity: 0.9;
        }
      }
      [type='subway'][tunnel=0] {
        line-width: 0.8;
        line-opacity: 0.9;
      }
    }
  }
  [zoom=17] {
    [stylegroup='motorway'] { line-width: @rdz17_maj; }
    [stylegroup='mainroad'] { line-width: @rdz17_med; }
    [stylegroup='minorroad']{ line-width: @rdz17_min; }
    [stylegroup='restricted']  { line-width: @rdz17_min / 3; }
    [stylegroup='path'],
    [stylegroup='track'],
    [stylegroup='cycleway']    { line-width: 0.8; line-dasharray: 2,2; }
  }
  [zoom>=18] {
    [stylegroup='motorway'] { line-width: @rdz18_maj; }
    [stylegroup='mainroad'] { line-width: @rdz18_med; }
    [stylegroup='minorroad']{ line-width: @rdz18_min; }
    [stylegroup='restricted']  { line-width: @rdz18_min / 2; }
    [stylegroup='path'],
    [stylegroup='track'],
    [stylegroup='cycleway']    { line-width: 1; line-dasharray: 4,2; }
    [stylegroup='railway'] {
      line-opacity: 0;
      [type='rail'],
      [type='preserved'] {
        [service='none'] {
          line-width: 1.8;
          line-opacity: 1;
        }
        [service='siding'],
        [service='spur'],
        [service='yard'] {
          line-width: 1.2;
          line-opacity: 1;
        }
      }
      [type='subway'][tunnel=0] {
        line-width: 1.2;
        line-opacity: 1;
      }
    }
  }
}

/* ---- Bridge fill ------------------------------------------------- */
#tunnel[render='2_line'][zoom>=15][zoom<=20],
#bridge[render='2_line'][zoom>=15][zoom<=20] {
  /* -- colors & styles -- */
  line-width: 0;
  
  [stylegroup='path'],
  [stylegroup='track'],
  [stylegroup='cycleway'] {
    line-color: @small_bridge_fill;
    line-opacity: 1;
    line-join: round;
  }
  [stylegroup='railway'] {
    [tunnel=1] { line-opacity: 0; }
    line-color: @rail_bridge_fill;
  }
  [zoom=15] {
    [stylegroup='path'],
    [stylegroup='track'],
    [stylegroup='cycleway'] { line-width: @rdz15_min / 2; }
    [stylegroup='railway']  { line-width: 5.0; }
  }
  [zoom=16] {
    [stylegroup='path'],
    [stylegroup='track'],
    [stylegroup='cycleway'] { line-width: @rdz16_min / 2; }
    [stylegroup='railway']  { line-width: 5.8; }
  }
  [zoom=17] {
    [stylegroup='path'],
    [stylegroup='track'],
    [stylegroup='cycleway'] { line-width: @rdz17_min / 2; }
    [stylegroup='railway']  { line-width: 7.0; }
  }
  [zoom>=18] {
    [stylegroup='path'],
    [stylegroup='track'],
    [stylegroup='cycleway'] { line-width: @rdz18_min / 2; }
    [stylegroup='railway']  { line-width: 9.0; }
  }
}


/* ---- Pedestrian areas -------------------------------------------- */
#pedestrian_area_case[zoom>=14] {
  polygon-fill: @standard_case;
  line-width: 1.5;
  line-color: @standard_case;
}
#pedestrian_area_fill[zoom>=14] {
  polygon-fill: @standard_fill;
  line-width: 0;
  line-color: @standard_fill;
}


/* ---- Turning Circles --------------------------------------------- */
#turning_circle_case[zoom>=14] {
  marker-fill:@standard_fill;
  marker-line-color:@standard_case;
  marker-line-width:2;
  marker-allow-overlap:true;
}
#turning_circle_fill[zoom>=14] {
  marker-fill:@standard_fill;
  marker-line-width:0;
  marker-line-opacity:0;
  marker-allow-overlap:true;
}
#turning_circle_case,
#turning_circle_fill {
  [zoom=14] { marker-width:@rdz14_min * 1.1; }
  [zoom=15] { marker-width:@rdz15_min * 1.1; }
  [zoom=16] { marker-width:@rdz16_min * 1.1; }
  [zoom=17] { marker-width:@rdz17_min * 1.1; }
  [zoom>=18] { marker-width:@rdz18_min * 1.1; }
}

/* ---- Aeroways ---------------------------------------------------- */

#aeroway[zoom>9] {
  line-color:@aeroway;
  line-cap:butt;
  line-join:miter;
  [type='runway'] {
    [zoom=10]{ line-width:1; }
    [zoom=11]{ line-width:2; }
    [zoom=12]{ line-width:3; }
    [zoom=13]{ line-width:5; }
    [zoom=14]{ line-width:7; }
    [zoom=15]{ line-width:11; }
    [zoom=16]{ line-width:15; }
    [zoom=17]{ line-width:19; }
    [zoom>17]{ line-width:23; }
  }
  [type='taxiway'] {
    [zoom=10]{ line-width:0.4; }
    [zoom=11]{ line-width:0.75; }
    [zoom=12]{ line-width:0.75; }
    [zoom=13]{ line-width:1.5; }
    [zoom=14]{ line-width:2; }
    [zoom=15]{ line-width:3; }
    [zoom=16]{ line-width:4; }
    [zoom>16]{ line-width:4; }
  }
}

/******************************************************************* */