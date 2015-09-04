package com.sornyei.model.lista;

import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * Created by gaborsornyei on 15. 09. 04..
 */
@Component
public class KartonTetel {
	private Date teljDatum;
	private String bizSzam;
	private String megnevezes;
	private String tkJelleg;
	private int osszeg;
	private int tartOsszeg;
	private int kovOsszeg;
	private int egyenleg;
	private String egyenlegTkJelleg;
	private String naploKod;

	public Date getTeljDatum() {
		return teljDatum;
	}

	public void setTeljDatum(Date teljDatum) {
		this.teljDatum = teljDatum;
	}

	public String getBizSzam() {
		return bizSzam;
	}

	public void setBizSzam(String bizSzam) {
		this.bizSzam = bizSzam;
	}

	public String getMegnevezes() {
		return megnevezes;
	}

	public void setMegnevezes(String megnevezes) {
		this.megnevezes = megnevezes;
	}

	public String getTkJelleg() {
		return tkJelleg;
	}

	public void setTkJelleg(String tkJelleg) {
		this.tkJelleg = tkJelleg;
	}

	public int getOsszeg() {
		return osszeg;
	}

	public void setOsszeg(int osszeg) {
		this.osszeg = osszeg;
	}

	public int getTartOsszeg() {
		return tartOsszeg;
	}

	public void setTartOsszeg(int tartOsszeg) {
		this.tartOsszeg = tartOsszeg;
	}

	public int getKovOsszeg() {
		return kovOsszeg;
	}

	public void setKovOsszeg(int kovOsszeg) {
		this.kovOsszeg = kovOsszeg;
	}

	public int getEgyenleg() {
		return egyenleg;
	}

	public void setEgyenleg(int egyenleg) {
		this.egyenleg = egyenleg;
	}

	public String getEgyenlegTkJelleg() {
		return egyenlegTkJelleg;
	}

	public void setEgyenlegTkJelleg(String egyenlegTkJelleg) {
		this.egyenlegTkJelleg = egyenlegTkJelleg;
	}

	public String getNaploKod() {
		return naploKod;
	}

	public void setNaploKod(String naploKod) {
		this.naploKod = naploKod;
	}
}
