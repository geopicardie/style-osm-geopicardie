/* ================================================================== */
/* LIMITES COMMUNES
/* ================================================================== */

#admin_line[admin_level="7"][zoom=12],
#admin_line[admin_level="8"][zoom=12] {
  line-width: 1;
  line-color: @admin_lvl8;
  line-dasharray:5,4;
}
#admin_line[admin_level="7"][zoom>=13],
#admin_line[admin_level="8"][zoom>=13] {
  line-width: 1.3;
  line-color: @admin_lvl8;
  line-dasharray:5,4;
}
