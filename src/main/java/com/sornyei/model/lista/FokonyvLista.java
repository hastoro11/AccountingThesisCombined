package com.sornyei.model.lista;

import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 04..
 */
@Component
public class FokonyvLista {
	private List<FokonyvTetel> fokonyvTetelList;
	private int halmTartForgalom;
	private int halmKovForgalom;
	private int halmTartEgyenleg;
	private int halmKovEgyenleg;

	public void calculate() {


		for (FokonyvTetel tetel : this.fokonyvTetelList) {
			if (!tetel.isOsszesito()) {
				this.halmTartForgalom += tetel.getHalmTartForgalom();
				this.halmKovForgalom += tetel.getHalmKovForgalom();
				this.halmTartEgyenleg += tetel.getHalmTartEgyenleg();
				this.halmKovEgyenleg += tetel.getHalmKovEgyenleg();
			}
		}
	}

	public List<FokonyvTetel> getFokonyvTetelList() {
		return fokonyvTetelList;
	}

	public void setFokonyvTetelList(List<FokonyvTetel> fokonyvTetelList) {
		this.fokonyvTetelList = fokonyvTetelList;
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
}
