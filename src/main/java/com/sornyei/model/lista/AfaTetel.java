package com.sornyei.model.lista;

import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * Created by gaborsornyei on 15. 09. 05..
 */
@Component
public class AfaTetel {
	private int afaKulcsId;
	private Date teljDatum;
	private String naploKod;
	private String bizSzam;
	private String nev;
	private String adoszam;
	private String megnevezes;
	private String fizmod;
	private int bruttoOsszeg;
	private int nettoOsszeg;
	private int afaOsszeg;

	public int getAfaKulcsId() {
		return afaKulcsId;
	}

	public void setAfaKulcsId(int afaKulcsId) {
		this.afaKulcsId = afaKulcsId;
	}

	public Date getTeljDatum() {
		return teljDatum;
	}

	public void setTeljDatum(Date teljDatum) {
		this.teljDatum = teljDatum;
	}

	public String getNaploKod() {
		return naploKod;
	}

	public void setNaploKod(String naploKod) {
		this.naploKod = naploKod;
	}

	public String getBizSzam() {
		return bizSzam;
	}

	public void setBizSzam(String bizSzam) {
		this.bizSzam = bizSzam;
	}

	public String getNev() {
		return nev;
	}

	public void setNev(String nev) {
		this.nev = nev;
	}

	public String getAdoszam() {
		return adoszam;
	}

	public void setAdoszam(String adoszam) {
		this.adoszam = adoszam;
	}

	public String getFizmod() {
		return fizmod;
	}

	public void setFizmod(String fizmod) {
		this.fizmod = fizmod;
	}

	public String getMegnevezes() {
		return megnevezes;
	}

	public void setMegnevezes(String megnevezes) {
		this.megnevezes = megnevezes;
	}

	public int getBruttoOsszeg() {
		return bruttoOsszeg;
	}

	public void setBruttoOsszeg(int bruttoOsszeg) {
		this.bruttoOsszeg = bruttoOsszeg;
	}

	public int getNettoOsszeg() {
		return nettoOsszeg;
	}

	public void setNettoOsszeg(int nettoOsszeg) {
		this.nettoOsszeg = nettoOsszeg;
	}

	public int getAfaOsszeg() {
		return afaOsszeg;
	}

	public void setAfaOsszeg(int afaOsszeg) {
		this.afaOsszeg = afaOsszeg;
	}
}
