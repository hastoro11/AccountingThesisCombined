package com.sornyei.model.lista;

import com.sornyei.model.Partner;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 06..
 */
@Component
public class PartnerLista {
	private Partner partner;
	private List<PartnerTetel> partnerTetelList;
	private int tartOsszesen;
	private int kovOsszesen;
	private int egyenleg;

	public Partner getPartner() {
		return partner;
	}

	public void setPartner(Partner partner) {
		this.partner = partner;
	}

	public List<PartnerTetel> getPartnerTetelList() {
		return partnerTetelList;
	}

	public void setPartnerTetelList(List<PartnerTetel> partnerTetelList) {
		this.partnerTetelList = partnerTetelList;
	}

	public int getTartOsszesen() {
		return tartOsszesen;
	}

	public void setTartOsszesen(int tartOsszesen) {
		this.tartOsszesen = tartOsszesen;
	}

	public int getKovOsszesen() {
		return kovOsszesen;
	}

	public void setKovOsszesen(int kovOsszesen) {
		this.kovOsszesen = kovOsszesen;
	}

	public int getEgyenleg() {
		return egyenleg;
	}

	public void setEgyenleg(int egyenleg) {
		this.egyenleg = egyenleg;
	}
}
