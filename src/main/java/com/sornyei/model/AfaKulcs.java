package com.sornyei.model;

import org.springframework.stereotype.Component;

/**
 * Created by gaborsornyei on 14/08/15.
 */
@Component
public class AfaKulcs {
	private int id;
	private String tipus;
	private int kulcs;
	private String fokszam;
	private String megnevezes;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTipus() {
		return tipus;
	}

	public void setTipus(String tipus) {
		this.tipus = tipus;
	}

	public int getKulcs() {
		return kulcs;
	}

	public void setKulcs(int kulcs) {
		this.kulcs = kulcs;
	}

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
}
