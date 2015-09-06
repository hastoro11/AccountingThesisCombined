package com.sornyei.service.lista;

import com.sornyei.model.Partner;
import com.sornyei.model.lista.PartnerLista;
import com.sornyei.model.lista.PartnerTetel;
import com.sornyei.repository.beallitas.partnerek.PartnerRepository;
import com.sornyei.repository.lista.PartnerTetelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 06..
 */
@Service
public class PartnerListaServiceImpl implements PartnerListaService {

	@Autowired
	private PartnerTetelRepository partnerTetelRepository;
	@Autowired
	private PartnerRepository partnerRepository;

	@Override
	public List<PartnerLista> getPartnerListaByTipus(String tipus) {
		List<Partner> partners = partnerRepository.findByTipus(tipus);
		List<PartnerLista> partnerListaList = new ArrayList<>();

		for (Partner partner : partners) {
			PartnerLista partnerLista = new PartnerLista();
			partnerLista.setPartner(partner);
			partnerLista.setPartnerTetelList(partnerTetelRepository.getPartnerTetelByPartnerId(partner.getId()));

			for (PartnerTetel tetel : partnerLista.getPartnerTetelList()) {
				partnerLista.setTartOsszesen(partnerLista.getTartOsszesen() + tetel.getTartOsszeg());
				partnerLista.setKovOsszesen(partnerLista.getKovOsszesen() + tetel.getKovOsszeg());
				partnerLista.setEgyenleg(partnerLista.getEgyenleg() + tetel.getEgyenleg());
			}

			partnerListaList.add(partnerLista);
		}

		return partnerListaList;
	}

}
