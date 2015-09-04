package com.sornyei.model.lista;

import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 04..
 */
@Component
public class NaploLista {
	private List<NaploTetel> naploTetelList;
	private int tartOsszesen;
	private int kovOsszesen;

	public void calculate() {
		for (NaploTetel tetel : naploTetelList) {
			this.tartOsszesen += tetel.getTartozik();
			this.kovOsszesen += tetel.getKovetel();
		}
	}

	public List<NaploTetel> getNaploTetelList() {
		return naploTetelList;
	}

	public void setNaploTetelList(List<NaploTetel> naploTetelList) {
		this.naploTetelList = naploTetelList;
	}

	public int getKovOsszesen() {
		return kovOsszesen;
	}

	public void setKovOsszesen(int kovOsszesen) {
		this.kovOsszesen = kovOsszesen;
	}

	public int getTartOsszesen() {
		return tartOsszesen;
	}

	public void setTartOsszesen(int tartOsszesen) {
		this.tartOsszesen = tartOsszesen;
	}
}
