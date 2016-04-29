/* ================================================================== */
/* ADMIN LINES
/* ================================================================== */

#osmregionsfr_gen[zoom>=6][zoom<10] {
  line-width: 1.1;
  line-color: @admin_lvl4;
  line-dasharray: 10, 4, 2, 4;
}

#osmregionsfr[zoom>=10] {
  line-width: 2;
  line-color: @admin_lvl4;
  line-dasharray: 10, 3, 2, 3;
}

