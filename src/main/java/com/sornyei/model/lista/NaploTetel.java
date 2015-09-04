package com.sornyei.model.lista;

import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * Created by gaborsornyei on 15. 09. 03..
 */
@Component
public class NaploTetel {
	private String naploKod;
	private Date teljDatum;
	private String fokSzam;
	private String bizSzam;
	private String megnevezes;
	private String tkJelleg;
	private int tartozik;
	private int kovetel;
	private int osszeg;

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

	public String getFokSzam() {
		return fokSzam;
	}

	public void setFokSzam(String fokSzam) {
		this.fokSzam = fokSzam;
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

	public int getTartozik() {
		return tartozik;
	}

	public void setTartozik(int tartozik) {
		this.tartozik = tartozik;
	}

	public int getKovetel() {
		return kovetel;
	}

	public void setKovetel(int kovetel) {
		this.kovetel = kovetel;
	}
}
