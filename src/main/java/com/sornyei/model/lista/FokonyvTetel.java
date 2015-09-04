package com.sornyei.model.lista;

/**
 * Created by gaborsornyei on 15. 09. 04..
 */
public class FokonyvTetel {
	private String fokszam;
	private String megnevezes;
	private boolean osszesito;
	private int halmTartForgalom;
	private int halmKovForgalom;
	private int halmTartEgyenleg;
	private int halmKovEgyenleg;

	public String getFokszam() {
		return fokszam;
	}

	public void setFokszam(String fokszam) {
		this.fokszam = fokszam;
	}

	public String getMegnevezes() {
		return megnevezes;
	}

	public void setMegnevezes(String megnevezes) {
		this.megnevezes = megnevezes;
	}

	public int getHalmTartForgalom() {
		return halmTartForgalom;
	}

	public void setHalmTartForgalom(int halmTartForgalom) {
		this.halmTartForgalom = halmTartForgalom;
	}

	public int getHalmKovForgalom() {
		return halmKovForgalom;
	}

	public void setHalmKovForgalom(int halmKovForgalom) {
		this.halmKovForgalom = halmKovForgalom;
	}

	public int getHalmTartEgyenleg() {
		return halmTartEgyenleg;
	}

	public void setHalmTartEgyenleg(int halmTartEgyenleg) {
		this.halmTartEgyenleg = halmTartEgyenleg;
	}

	public int getHalmKovEgyenleg() {
		return halmKovEgyenleg;
	}

	public void setHalmKovEgyenleg(int halmKovEgyenleg) {
		this.halmKovEgyenleg = halmKovEgyenleg;
	}

	public boolean isOsszesito() {
		return osszesito;
	}

	public void setOsszesito(boolean osszesito) {
		this.osszesito = osszesito;
	}

	@Override
	public String toString() {
		return "FokonyvTetel{" +
				"fokszam='" + fokszam + '\'' +
				", megnevezes='" + megnevezes + '\'' +
				", osszesito=" + osszesito +
				", halmTartForgalom=" + halmTartForgalom +
				", halmKovForgalom=" + halmKovForgalom +
				", halmTartEgyenleg=" + halmTartEgyenleg +
				", halmKovEgyenleg=" + halmKovEgyenleg +
				'}';
	}
}
