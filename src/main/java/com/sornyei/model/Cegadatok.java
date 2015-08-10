package com.sornyei.model;

import org.springframework.stereotype.Component;

/**
 * Created by gaborsornyei on 10/08/15.
 */
@Component
public class Cegadatok {
	private int id;
	private String cegnev;
	private String cim;
	private String adoszam;
	private String cegjegyzekszam;
	private String bankszamlaszam;
	private String kshszam;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCegnev() {
		return cegnev;
	}

	public void setCegnev(String cegnev) {
		this.cegnev = cegnev;
	}

	public String getCim() {
		return cim;
	}

	public void setCim(String cim) {
		this.cim = cim;
	}

	public String getAdoszam() {
		return adoszam;
	}

	public void setAdoszam(String adoszam) {
		this.adoszam = adoszam;
	}

	public String getCegjegyzekszam() {
		return cegjegyzekszam;
	}

	public void setCegjegyzekszam(String cegjegyzekszam) {
		this.cegjegyzekszam = cegjegyzekszam;
	}

	public String getBankszamlaszam() {
		return bankszamlaszam;
	}

	public void setBankszamlaszam(String bankszamlaszam) {
		this.bankszamlaszam = bankszamlaszam;
	}

	public String getKshszam() {
		return kshszam;
	}

	public void setKshszam(String kshszam) {
		this.kshszam = kshszam;
	}

	@Override
	public String toString() {
		return "Cegadatok{" +
				"id=" + id +
				", cegnev='" + cegnev + '\'' +
				", cim='" + cim + '\'' +
				", adoszam='" + adoszam + '\'' +
				", cegjegyzekszam='" + cegjegyzekszam + '\'' +
				", bankszamlaszam='" + bankszamlaszam + '\'' +
				", kshszam='" + kshszam + '\'' +
				'}';
	}
}
