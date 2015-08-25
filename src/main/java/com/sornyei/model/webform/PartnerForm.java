package com.sornyei.model.webform;

import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * Created by gaborsornyei on 20/08/15.
 */
@Component
public class PartnerForm {
	private String naplotipus;
	private String fokszam;
	private int partner;
	private int fizmod;
	private String bizszam;
	private Date teljdatum;
	private Date kialldatum;
	private Date eseddatum;
	private String megnevezes;
	private int osszeg;
	private String tkjelleg;
	private List<PartnerFormKontir> kontir;

	public String getNaplotipus() {
		return naplotipus;
	}

	public void setNaplotipus(String naplotipus) {
		this.naplotipus = naplotipus;
	}

	public String getFokszam() {
		return fokszam;
	}

	public void setFokszam(String fokszam) {
		this.fokszam = fokszam;
	}

	public int getPartner() {
		return partner;
	}

	public void setPartner(int partner) {
		this.partner = partner;
	}

	public int getFizmod() {
		return fizmod;
	}

	public void setFizmod(int fizmod) {
		this.fizmod = fizmod;
	}

	public String getBizszam() {
		return bizszam;
	}

	public void setBizszam(String bizszam) {
		this.bizszam = bizszam;
	}

	public Date getTeljdatum() {
		return teljdatum;
	}

	public void setTeljdatum(Date teljdatum) {
		this.teljdatum = teljdatum;
	}

	public Date getKialldatum() {
		return kialldatum;
	}

	public void setKialldatum(Date kialldatum) {
		this.kialldatum = kialldatum;
	}

	public Date getEseddatum() {
		return eseddatum;
	}

	public void setEseddatum(Date eseddatum) {
		this.eseddatum = eseddatum;
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

	public String getTkjelleg() {
		return tkjelleg;
	}

	public void setTkjelleg(String tkjelleg) {
		this.tkjelleg = tkjelleg;
	}

	public List<PartnerFormKontir> getKontir() {
		return kontir;
	}

	public void setKontir(List<PartnerFormKontir> kontir) {
		this.kontir = kontir;
	}

	@Override
	public String toString() {
		StringBuilder result =
				new StringBuilder("SzallitoForm{" +
										  "fokszam='" + fokszam + '\'' +
										  ", partner=" + partner +
										  ", fizmod=" + fizmod +
										  ", bizszam='" + bizszam + '\'' +
										  ", teljdatum=" + teljdatum +
										  ", kialldatum=" + kialldatum +
										  ", eseddatum=" + eseddatum +
										  ", megnevezes='" + megnevezes + '\'' +
										  ", osszeg=" + osszeg +
										  ", tkjelleg='" + tkjelleg + '\'' +
										  '}');

		for (PartnerFormKontir sor : kontir) {
			int i = 0;
			result.append("# " + ++i + " " + sor);
		}

		return result.toString();
	}
}

