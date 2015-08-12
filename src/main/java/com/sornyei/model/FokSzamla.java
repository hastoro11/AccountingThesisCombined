package com.sornyei.model;

import org.springframework.stereotype.Component;

/**
 * Created by gaborsornyei on 11/08/15.
 */
@Component
public class FokSzamla {
	private String fokszam;
	private String megnevezes;
	private boolean osszesito;

	public String getFokszam() {
		return fokszam;
	}

	public void setFokszam(String fokszam) {
		this.fokszam = fokszam;
	}

	public String getMegnevezes() {
		return megnevezes;
	}

	public void setMegnevezes(String megnevezes) {
		this.megnevezes = megnevezes;
	}

	public boolean isOsszesito() {
		return osszesito;
	}

	public void setOsszesito(boolean osszesito) {
		this.osszesito = osszesito;
	}

	@Override
	public String toString() {
		return "FokSzamla{" +
				"fokszam='" + fokszam + '\'' +
				", megnevezes='" + megnevezes + '\'' +
				", osszesito=" + osszesito +
				'}';
	}
}
