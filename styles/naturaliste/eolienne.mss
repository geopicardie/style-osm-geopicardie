@hauteur_eolienne: 22;
@couleur_electrique: #b2cd33;

#eoliennes::picto_eolienne {
	[zoom>11] {
		marker-file: url(img/icon/eolienne.svg);
		marker-height: @hauteur_eolienne;
		marker-fill: @couleur_electrique;
		marker-line-color: @couleur_electrique;
		marker-transform: translate(0,@hauteur_eolienne*(-1));
	}
}

#osm_powerlines {
	line-width: 1;
	line-color: @couleur_electrique;
	text-name: [voltage];
	text-face-name: @sans;
	text-placement: line;
	text-halo-fill: white;
	text-halo-radius: 3;
	text-size: 10;
	text-fill: #8aa11e;
	text-dy: -7;
	marker-file: url(img/icon/electricite.svg);
	marker-fill: @couleur_electrique;
	marker-line-color: @couleur_electrique;
	marker-height: 14;
	marker-placement: line;
	/*marker-direction: auto-down;*/
	[type='line'] {
		line-color: @couleur_electrique;
		text-fill: @couleur_electrique;
		line-width: 1.2;
	}
	[type='minor-line'] {
		line-color: lighten(@couleur_electrique, 10%);
		text-fill: lighten(@couleur_electrique, 10%);
		line-width: 0.8;
	}
}
