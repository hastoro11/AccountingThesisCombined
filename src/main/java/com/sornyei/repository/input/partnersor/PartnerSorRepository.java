package com.sornyei.repository.input.partnersor;

import com.sornyei.model.input.PartnerSor;

import java.util.List;

/**
 * Created by gaborsornyei on 22/08/15.
 */
public interface PartnerSorRepository {
	PartnerSor save(PartnerSor partnerSor);

	List<String> getKifizetetlenBizSzamok(int partnerId);

	List<PartnerSor> getPartnerSorByPartnerIdAndBizszamOnlySzallOrVevo(int partnerId, String bizszam);

	List<PartnerSor> getPartnerSorByPartnerIdAndBizszam(int partnerId, String bizszam);

	List<Object[]> getBizszamNotKipontozott();

	void kipontoz(int partnerId, String bizszam);
}
