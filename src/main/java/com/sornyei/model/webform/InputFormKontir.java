package com.sornyei.model.webform;

import com.sornyei.model.AfaKulcs;
import org.springframework.stereotype.Component;

/**
 * Created by gaborsornyei on 20/08/15.
 */
@Component
public class InputFormKontir {
	private String fokszam;
	private String megnevezes;
	private String ellenbizszam;
	private AfaKulcs afa;
	private int osszeg;
	private String tkjelleg;

	public String getFokszam() {
		return fokszam;
	}

	public void setFokszam(String fokszam) {
		this.fokszam = fokszam;
	}

	public String getMegnevezes() {
		return megnevezes;
	}

	public String getEllenbizszam() {
		return ellenbizszam;
	}

	public void setEllenbizszam(String ellenbizszam) {
		this.ellenbizszam = ellenbizszam;
	}

	public void setMegnevezes(String megnevezes) {
		this.megnevezes = megnevezes;
	}

	public AfaKulcs getAfa() {
		return afa;
	}

	public void setAfa(AfaKulcs afa) {
		this.afa = afa;
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

	@Override
	public String toString() {
		return "InputFormKontir{" +
				"fokszam='" + fokszam + '\'' +
				", megnevezes='" + megnevezes + '\'' +
				", ellenbizszam='" + ellenbizszam + '\'' +
				", afa=" + afa +
				", osszeg=" + osszeg +
				", tkjelleg='" + tkjelleg + '\'' +
				'}';
	}
}
