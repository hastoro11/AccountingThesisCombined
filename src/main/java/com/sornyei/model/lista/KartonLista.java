package com.sornyei.model.lista;

import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 04..
 */
@Component
public class KartonLista {
	private List<KartonTetel> kartonTetelList;
	private int tartOsszesen;
	private int kovOsszesen;
	private int egyenleg;
	private String egyenlegTkJelleg;

	public void calculate() {
		int egyenleg = 0;
		for (KartonTetel tetel : kartonTetelList) {
			this.tartOsszesen += tetel.getTartOsszeg();
			this.kovOsszesen += tetel.getKovOsszeg();

			egyenleg += tetel.getTartOsszeg() - tetel.getKovOsszeg();
			if (egyenleg < 0) {
				tetel.setEgyenleg(-egyenleg);
				tetel.setEgyenlegTkJelleg("K");
			} else {
				tetel.setEgyenleg(egyenleg);
				tetel.setEgyenlegTkJelleg("T");
			}
		}

		if (kartonTetelList.size() > 0) {
			this.egyenleg = kartonTetelList.get(kartonTetelList.size() - 1).getEgyenleg();
			this.egyenlegTkJelleg = kartonTetelList.get(kartonTetelList.size() - 1).getEgyenlegTkJelleg();
		}
	}

	public List<KartonTetel> getKartonTetelList() {
		return kartonTetelList;
	}

	public void setKartonTetelList(List<KartonTetel> kartonTetelList) {
		this.kartonTetelList = kartonTetelList;
	}

	public int getTartOsszesen() {
		return tartOsszesen;
	}

	public int getKovOsszesen() {
		return kovOsszesen;
	}

	public int getEgyenleg() {
		return egyenleg;
	}

	public String getEgyenlegTkJelleg() {
		return egyenlegTkJelleg;
	}
}
