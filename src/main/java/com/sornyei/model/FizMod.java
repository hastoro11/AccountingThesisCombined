package com.sornyei.model;

import org.springframework.stereotype.Component;

/**
 * Created by gaborsornyei on 13/08/15.
 */
@Component
public class FizMod {
	private int id;
	private String megnevezes;
	private int fizhatarido;
	private boolean torolheto;

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

	public int getFizhatarido() {
		return fizhatarido;
	}

	public void setFizhatarido(int fizhatarido) {
		this.fizhatarido = fizhatarido;
	}

	public boolean isTorolheto() {
		return torolheto;
	}

	public void setTorolheto(boolean torolheto) {
		this.torolheto = torolheto;
	}
}
