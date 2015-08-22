package com.sornyei.model.input;

import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * Created by gaborsornyei on 20/08/15.
 */
@Component
public class NaploSor {
	private int id;
	private String naploTipus;
	private int naploSorszam;
	private String naploKod;
	private Date teljDatum;
	private String tkJelleg;
	private String fokszam;
	private String bizszam;
	private String megnevezes;
	private int osszeg;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNaploTipus() {
		return naploTipus;
	}

	public void setNaploTipus(String naploTipus) {
		this.naploTipus = naploTipus;
	}

	public int getNaploSorszam() {
		return naploSorszam;
	}

	public void setNaploSorszam(int naploSorszam) {
		this.naploSorszam = naploSorszam;
	}

	public String getNaploKod() {
		return naploKod;
	}

	public void setNaploKod(String naploKod) {
		this.naploKod = naploKod;
	}

	public Date getTeljDatum() {
		return teljDatum;
	}

	public void setTeljDatum(Date teljDatum) {
		this.teljDatum = teljDatum;
	}

	public String getTkJelleg() {
		return tkJelleg;
	}

	public void setTkJelleg(String tkJelleg) {
		this.tkJelleg = tkJelleg;
	}

	public String getFokszam() {
		return fokszam;
	}

	public void setFokszam(String fokszam) {
		this.fokszam = fokszam;
	}

	public String getBizszam() {
		return bizszam;
	}

	public void setBizszam(String bizszam) {
		this.bizszam = bizszam;
	}

	public String getMegnevezes() {
		return megnevezes;
	}

	public void setMegnevezes(String megnevezes) {
		this.megnevezes = megnevezes;
	}

	public int getOsszeg() {
		return osszeg;
	}

	public void setOsszeg(int osszeg) {
		this.osszeg = osszeg;
	}
}
