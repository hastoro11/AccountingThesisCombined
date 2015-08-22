package com.sornyei.model.input;

import java.util.Date;

/**
 * Created by gaborsornyei on 20/08/15.
 */
public class AfaSor {
	private int id;
	private int afaKulcsId;
	private String naploKod;
	private String naploTipus;
	private int naploSorszam;
	private String bizszam;
	private int partnerId;
	private String megnevezes;
	private int fizmodId;
	private Date teljDatum;
	private int bruttoOsszeg;
	private int nettoOsszeg;
	private int afaOsszeg;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAfaKulcsId() {
		return afaKulcsId;
	}

	public void setAfaKulcsId(int afaKulcsId) {
		this.afaKulcsId = afaKulcsId;
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

	public int getPartnerId() {
		return partnerId;
	}

	public void setPartnerId(int partnerId) {
		this.partnerId = partnerId;
	}

	public String getMegnevezes() {
		return megnevezes;
	}

	public void setMegnevezes(String megnevezes) {
		this.megnevezes = megnevezes;
	}

	public int getFizmodId() {
		return fizmodId;
	}

	public void setFizmodId(int fizmodId) {
		this.fizmodId = fizmodId;
	}

	public Date getTeljDatum() {
		return teljDatum;
	}

	public void setTeljDatum(Date teljDatum) {
		this.teljDatum = teljDatum;
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

	@Override
	public String toString() {
		return "AfaSor{" +
				"id=" + id +
				", afaKulcsId=" + afaKulcsId +
				", naploKod='" + naploKod + '\'' +
				", naploTipus='" + naploTipus + '\'' +
				", naploSorszam=" + naploSorszam +
				", bizszam='" + bizszam + '\'' +
				", partnerId=" + partnerId +
				", megnevezes='" + megnevezes + '\'' +
				", fizmodId=" + fizmodId +
				", teljDatum=" + teljDatum +
				", bruttoOsszeg=" + bruttoOsszeg +
				", nettoOsszeg=" + nettoOsszeg +
				", afaOsszeg=" + afaOsszeg +
				'}';
	}
}
