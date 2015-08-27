package com.sornyei.model.input;

import java.util.Date;

/**
 * Created by gaborsornyei on 20/08/15.
 */
public class PartnerSor {
	private int id;
	private int partnerId;
	private String naploKod;
	private String naploTipus;
	private int naploSorszam;
	private String bizszam;
	private Date teljDatum;
	private Date kiallDatum;
	private Date esedDatum;
	private Date kifizDatum;
	private int fizmodId;
	private String tkJelleg;
	private int osszeg;
	private int kifizOsszeg;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPartnerId() {
		return partnerId;
	}

	public void setPartnerId(int partnerId) {
		this.partnerId = partnerId;
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

	public String getBizszam() {
		return bizszam;
	}

	public void setBizszam(String bizszam) {
		this.bizszam = bizszam;
	}

	public Date getTeljDatum() {
		return teljDatum;
	}

	public void setTeljDatum(Date teljDatum) {
		this.teljDatum = teljDatum;
	}

	public Date getKiallDatum() {
		return kiallDatum;
	}

	public void setKiallDatum(Date kiallDatum) {
		this.kiallDatum = kiallDatum;
	}

	public Date getEsedDatum() {
		return esedDatum;
	}

	public void setEsedDatum(Date esedDatum) {
		this.esedDatum = esedDatum;
	}

	public Date getKifizDatum() {
		return kifizDatum;
	}

	public void setKifizDatum(Date kifizDatum) {
		this.kifizDatum = kifizDatum;
	}

	public int getFizmodId() {
		return fizmodId;
	}

	public void setFizmodId(int fizmodId) {
		this.fizmodId = fizmodId;
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

	@Override
	public String toString() {
		return "PartnerSor{" +
				"id=" + id +
				", partnerId=" + partnerId +
				", naploKod='" + naploKod + '\'' +
				", naploTipus='" + naploTipus + '\'' +
				", naploSorszam=" + naploSorszam +
				", bizszam='" + bizszam + '\'' +
				", teljDatum=" + teljDatum +
				", kiallDatum=" + kiallDatum +
				", esedDatum=" + esedDatum +
				", kifizDatum=" + kifizDatum +
				", fizmodId=" + fizmodId +
				", tkJelleg='" + tkJelleg + '\'' +
				", osszeg=" + osszeg +
				", kifizOsszeg=" + kifizOsszeg +
				'}';
	}
}
