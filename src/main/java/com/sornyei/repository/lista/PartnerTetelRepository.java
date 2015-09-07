package com.sornyei.repository.lista;

import com.sornyei.model.lista.PartnerTetel;

import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 06..
 */
public interface PartnerTetelRepository {
	List<PartnerTetel> getPartnerTetelByPartnerId(int partnerId, boolean kipontozott);
}
