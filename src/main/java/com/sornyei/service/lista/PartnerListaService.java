package com.sornyei.service.lista;

import com.sornyei.model.lista.PartnerLista;

import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 06..
 */
public interface PartnerListaService {
	List<PartnerLista> getPartnerListaByTipus(String tipus);
}
