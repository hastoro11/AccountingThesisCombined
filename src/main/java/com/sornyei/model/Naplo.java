package com.sornyei.model;

import org.springframework.stereotype.Component;

/**
 * Created by gaborsornyei on 11/08/15.
 */
@Component
public class Naplo {
	private int id;
	private String megnevezes;
	private String jel;
	private  String fokszam;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMegnevezes() {
		return megnevezes;
	}

	public void setMegnevezes(String megnevezes) {
		this.megnevezes = megnevezes;
	}

	public String getJel() {
		return jel;
	}

	public void setJel(String jel) {
		this.jel = jel;
	}

	public String getFokszam() {
		return fokszam;
	}

	public void setFokszam(String fokszam) {
		this.fokszam = fokszam;
	}

	@Override
	public String toString() {
		return "Naplo{" +
				"id=" + id +
				", megnevezes='" + megnevezes + '\'' +
				", jel='" + jel + '\'' +
				", fokszam='" + fokszam + '\'' +
				'}';
	}
}
