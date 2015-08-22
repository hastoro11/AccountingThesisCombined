package com.sornyei.model.input;

import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * Created by gaborsornyei on 20/08/15.
 */

@Component
public class KontirSor {
	private int id;
	private String fokszam;
	private String naploKod;
	private String naploTipus;
	private int naploSorszam;
	private Date teljDatum;
	private String bizszam;
	private String megnevezes;
	private String tkJelleg;
	private int osszeg;
	private int partnerId;
	private boolean afaTetel;
	private boolean torolt;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFokszam() {
		return fokszam;
	}

	public void setFokszam(String fokszam) {
		this.fokszam = fokszam;
	}

	public String getNaploKod() {
		return naploKod;
	}

	public void setNaploKod(String naploKod) {
		this.naploKod = naploKod;
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

	public Date getTeljDatum() {
		return teljDatum;
	}

	public void setTeljDatum(Date teljDatum) {
		this.teljDatum = teljDatum;
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

	public boolean isAfaTetel() {
		return afaTetel;
	}

	public void setAfaTetel(boolean afaTetel) {
		this.afaTetel = afaTetel;
	}

	public int getPartnerId() {
		return partnerId;
	}

	public void setPartnerId(int partnerId) {
		this.partnerId = partnerId;
	}

	public boolean isTorolt() {
		return torolt;
	}

	public void setTorolt(boolean torolt) {
		this.torolt = torolt;
	}
}
