/* ==================================================================
   ROAD & RAIL LINES
/* ================================================================== */
@road_opacity: 0.6;

#roads_low [zoom<10] {
  [type='motorway'],
  [type='motorway_link'],
  [type='trunk'],
  [type='primary'] {
    line-width: 1.3;
    line-color: @urban;
    line-opacity: 0.4;
  }

}

#roads_high[zoom>10] {
  [type='motorway'],
  [type='motorway_link'],
  [type='trunk'],
  [type='primary'] {
    line-width: 1.5;
    line-color: @urban;
    line-opacity: 0.4;
  }
  [zoom>14] {
    [type='secondary'],
    [type='residential'] {
      line-width: 1;
      line-color: lighten(@urban,20%);
      line-opacity: 0.5;
    }
  }
}
/******************************************************************* */
