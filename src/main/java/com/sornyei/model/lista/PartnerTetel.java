package com.sornyei.model.lista;

import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * Created by gaborsornyei on 15. 09. 06..
 */
@Component
public class PartnerTetel {
	private String naploKod;
	private String nev;
	private String bizSzam;
	private String megnevezes;
	private Date esedDatum;
	private Date teljDatum;
	private Date kifizDatum;
	private String tkJelleg;
	private int osszeg;
	private int kifizOsszeg;
	private int tartOsszeg;
	private int kovOsszeg;
	private int egyenleg;

	public String getNaploKod() {
		return naploKod;
	}

	public void setNaploKod(String naploKod) {
		this.naploKod = naploKod;
	}

	public String getNev() {
		return nev;
	}

	public void setNev(String nev) {
		this.nev = nev;
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

	public Date getEsedDatum() {
		return esedDatum;
	}

	public void setEsedDatum(Date esedDatum) {
		this.esedDatum = esedDatum;
	}

	public Date getTeljDatum() {
		return teljDatum;
	}

	public void setTeljDatum(Date teljDatum) {
		this.teljDatum = teljDatum;
	}

	public Date getKifizDatum() {
		return kifizDatum;
	}

	public void setKifizDatum(Date kifizDatum) {
		this.kifizDatum = kifizDatum;
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

	public int getKifizOsszeg() {
		return kifizOsszeg;
	}

	public void setKifizOsszeg(int kifizOsszeg) {
		this.kifizOsszeg = kifizOsszeg;
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
}
