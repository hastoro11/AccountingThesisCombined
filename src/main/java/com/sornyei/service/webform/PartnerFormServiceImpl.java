package com.sornyei.service.webform;

import com.sornyei.model.input.*;
import com.sornyei.model.webform.PartnerForm;
import com.sornyei.model.webform.PartnerFormKontir;
import com.sornyei.service.input.afasor.AfaSorService;
import com.sornyei.service.input.kontirsor.KontirSorService;
import com.sornyei.service.input.naplosor.NaploSorService;
import com.sornyei.service.input.szallitosor.PartnerSorService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by gaborsornyei on 22/08/15.
 */
@Service
public class PartnerFormServiceImpl implements PartnerFormService {

	final static Logger logger = Logger.getLogger(PartnerFormService.class);

	@Autowired
	private NaploSorService naploSorService;
	@Autowired
	private KontirSorService kontirSorService;
	@Autowired
	private AfaSorService afaSorService;
	@Autowired
	private PartnerSorService szallitoSorService;


	@Override
	@Transactional
	public boolean save(PartnerForm partnerForm) {
		// NaploSor
		NaploSor naploSor = naploSorService.saveNaploSor(getNaploSorFromPartnerForm(partnerForm));
		// KontirSor
		for (KontirSor kontirSor : getKontirSorFromPartnerForm(partnerForm)) {
			kontirSor.setNaploSorszam(naploSor.getNaploSorszam());
			kontirSor.setNaploKod(naploSor.getNaploKod());

			kontirSorService.save(kontirSor);
		}

		// AfaSor
		for (AfaSor afaSor : getAfaSorFromPartnerForm(partnerForm)) {
			afaSor.setNaploSorszam(naploSor.getNaploSorszam());
			afaSor.setNaploKod(naploSor.getNaploKod());

			afaSorService.save(afaSor);
		}

		// PartnerSor
		PartnerSor partnerSor = getPartnerSorFromSzallitoForm(partnerForm);
		partnerSor.setNaploTipus(partnerForm.getNaplotipus());
		partnerSor.setNaploKod(naploSor.getNaploKod());
		partnerSor.setNaploSorszam(naploSor.getNaploSorszam());

		szallitoSorService.save(partnerSor);

		return true;
	}

	private List<KontirSor> getKontirSorFromPartnerForm(PartnerForm partnerForm) {
		List<KontirSor> list = new ArrayList<>();

		KontirSor kontirSor = new KontirSor();

		kontirSor.setNaploTipus(partnerForm.getNaplotipus());
		kontirSor.setTeljDatum(partnerForm.getTeljdatum());
		kontirSor.setBizszam(partnerForm.getBizszam());
		kontirSor.setFokszam(partnerForm.getFokszam());
		kontirSor.setMegnevezes(partnerForm.getMegnevezes());
		kontirSor.setTkJelleg(partnerForm.getTkjelleg());
		kontirSor.setOsszeg(partnerForm.getOsszeg());
		kontirSor.setPartnerId(partnerForm.getPartner());

		list.add(kontirSor);

		for (PartnerFormKontir kontir : partnerForm.getKontir()) {
			KontirSor ks = new KontirSor();

			ks.setFokszam(kontir.getFokszam());
			ks.setMegnevezes(kontir.getMegnevezes());
			ks.setOsszeg(kontir.getOsszeg());
			ks.setTkJelleg(kontir.getTkjelleg());
			ks.setAfaTetel(kontir.getAfa() != null);

			ks.setNaploTipus(kontirSor.getNaploTipus());
			ks.setTeljDatum(kontirSor.getTeljDatum());
			ks.setBizszam(kontirSor.getBizszam());
			ks.setPartnerId(kontirSor.getPartnerId());

			list.add(ks);
		}


		return list;
	}

	private NaploSor getNaploSorFromPartnerForm(PartnerForm partnerForm) {
		NaploSor naploSor = new NaploSor();

		naploSor.setNaploTipus(partnerForm.getNaplotipus());
		naploSor.setFokszam(partnerForm.getFokszam());
		naploSor.setMegnevezes(partnerForm.getMegnevezes());
		naploSor.setBizszam(partnerForm.getBizszam());
		naploSor.setTeljDatum(partnerForm.getTeljdatum());
		naploSor.setOsszeg(partnerForm.getOsszeg());
		naploSor.setTkJelleg(partnerForm.getTkjelleg());

		return naploSor;
	}

	private List<AfaSor> getAfaSorFromPartnerForm(PartnerForm partnerForm) {
		List<AfaSor> list = new ArrayList<>();

		int i = 0;

		while (i < partnerForm.getKontir().size()) {
			PartnerFormKontir kontir = partnerForm.getKontir().get(i);
			if (kontir.getAfa() == null) {
				i++;
				continue;
			}

			AfaSor afaSor = new AfaSor();
			afaSor.setAfaKulcsId(kontir.getAfa().getId());
			afaSor.setNaploTipus(partnerForm.getNaplotipus());
			afaSor.setBizszam(partnerForm.getBizszam());
			afaSor.setPartnerId(partnerForm.getPartner());
			afaSor.setMegnevezes(kontir.getMegnevezes());
			afaSor.setFizmodId(partnerForm.getFizmod());
			afaSor.setTeljDatum(partnerForm.getTeljdatum());

			afaSor.setNettoOsszeg(kontir.getOsszeg());
			afaSor.setAfaOsszeg(partnerForm.getKontir().get(++i).getOsszeg());
			afaSor.setBruttoOsszeg(afaSor.getNettoOsszeg() + afaSor.getAfaOsszeg());

			list.add(afaSor);
			i++;
		}

		return list;
	}

	private PartnerSor getPartnerSorFromSzallitoForm(PartnerForm partnerForm) {
		PartnerSor partnerSor = new PartnerSor();

		partnerSor.setPartnerId(partnerForm.getPartner());
		partnerSor.setBizszam(partnerForm.getBizszam());
		partnerSor.setTeljDatum(partnerForm.getTeljdatum());
		partnerSor.setKiallDatum(partnerForm.getKialldatum());
		partnerSor.setEsedDatum(partnerForm.getEseddatum());
		partnerSor.setFizmodId(partnerForm.getFizmod());
		partnerSor.setTkJelleg(partnerForm.getTkjelleg());
		partnerSor.setOsszeg(partnerForm.getOsszeg());

		return partnerSor;
	}
}

