package com.sornyei.service.input.partnersor;

import com.sornyei.model.input.PartnerSor;

import java.util.List;

/**
 * Created by gaborsornyei on 22/08/15.
 */
public interface PartnerSorService {
	PartnerSor save(PartnerSor partnerSor);

	List<String> getKifizetetlenBizSzamok(int partnerId);

	List<PartnerSor> getPartnerSorByPartnerIdAndBizszam(int partnerId, String bizszam);

	void kipontoz();
}
