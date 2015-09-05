package com.sornyei.model.lista;

import com.sornyei.model.AfaKulcs;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 05..
 */
@Component
public class AfaLista {
	private AfaKulcs afaKulcs;
	private List<AfaTetel> afaTetelList;
	private int bruttoOsszesen;
	private int nettoOsszesen;
	private int afaOsszesen;

	public AfaKulcs getAfaKulcs() {
		return afaKulcs;
	}

	public void setAfaKulcs(AfaKulcs afaKulcs) {
		this.afaKulcs = afaKulcs;
	}

	public List<AfaTetel> getAfaTetelList() {
		return afaTetelList;
	}

	public void setAfaTetelList(List<AfaTetel> afaTetelList) {
		this.afaTetelList = afaTetelList;
	}

	public int getBruttoOsszesen() {
		return bruttoOsszesen;
	}

	public void setBruttoOsszesen(int bruttoOsszesen) {
		this.bruttoOsszesen = bruttoOsszesen;
	}

	public int getNettoOsszesen() {
		return nettoOsszesen;
	}

	public void setNettoOsszesen(int nettoOsszesen) {
		this.nettoOsszesen = nettoOsszesen;
	}

	public int getAfaOsszesen() {
		return afaOsszesen;
	}

	public void setAfaOsszesen(int afaOsszesen) {
		this.afaOsszesen = afaOsszesen;
	}
}
