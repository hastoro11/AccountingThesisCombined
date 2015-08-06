package com.sornyei.model;

import org.springframework.stereotype.Component;

/**
 * Created by gaborsornyei on 05/08/15.
 */
@Component
public class Partner {
	private int id;
	private String nev;
	private String adoszam;
	private String cim;
	private boolean szallito;
	private boolean vevo;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getCim() {
		return cim;
	}

	public void setCim(String cim) {
		this.cim = cim;
	}

	public boolean isSzallito() {
		return szallito;
	}

	public void setSzallito(boolean szallito) {
		this.szallito = szallito;
	}

	public boolean isVevo() {
		return vevo;
	}

	public void setVevo(boolean vevo) {
		this.vevo = vevo;
	}

	@Override
	public String toString() {
		return "Partner{" +
				"id=" + id +
				", nev='" + nev + '\'' +
				", adoszam='" + adoszam + '\'' +
				", cim='" + cim + '\'' +
				", szallito=" + szallito +
				", vevo=" + vevo +
				'}';
	}
}
