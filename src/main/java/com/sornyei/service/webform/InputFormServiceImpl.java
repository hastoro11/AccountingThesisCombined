package com.sornyei.service.webform;

import com.sornyei.model.input.*;
import com.sornyei.model.webform.InputForm;
import com.sornyei.model.webform.InputFormKontir;
import com.sornyei.service.input.afasor.AfaSorService;
import com.sornyei.service.input.kontirsor.KontirSorService;
import com.sornyei.service.input.naplosor.NaploSorService;
import com.sornyei.service.input.partnersor.PartnerSorService;
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
public class InputFormServiceImpl implements InputFormService {

	final static Logger logger = Logger.getLogger(InputFormService.class);

	@Autowired
	private NaploSorService naploSorService;
	@Autowired
	private KontirSorService kontirSorService;
	@Autowired
	private AfaSorService afaSorService;
	@Autowired
	private PartnerSorService partnerSorService;


	@Override
	@Transactional
	public boolean save(InputForm inputForm) {
		// NaploSor
		NaploSor naploSor = naploSorService.saveNaploSor(getNaploSorFromInputForm(inputForm));
		// KontirSor
		for (KontirSor kontirSor : getKontirSorFromInputForm(inputForm)) {
			kontirSor.setNaploSorszam(naploSor.getNaploSorszam());
			kontirSor.setNaploKod(naploSor.getNaploKod());

			kontirSorService.save(kontirSor);
		}

		// AfaSor
		for (AfaSor afaSor : getAfaSorFromInputForm(inputForm)) {
			afaSor.setNaploSorszam(naploSor.getNaploSorszam());
			afaSor.setNaploKod(naploSor.getNaploKod());

			afaSorService.save(afaSor);
		}

		// PartnerSor
		if (naploSor.getNaploTipus().equals("S") || naploSor.getNaploTipus().equals("V")) {
			PartnerSor partnerSor = getPartnerSorFromInputForm(inputForm);
			partnerSor.setNaploTipus(inputForm.getNaplotipus());
			partnerSor.setNaploKod(naploSor.getNaploKod());
			partnerSor.setNaploSorszam(naploSor.getNaploSorszam());

			partnerSorService.save(partnerSor);

		} else if (naploSor.getNaploTipus().equals("P") || naploSor.getNaploTipus().equals("B")) {
			for (InputFormKontir ks : inputForm.getKontir()) {
				if (ks.getEllenbizszam() != null && ks.getEllenbizszam().length() > 0) {
					List<PartnerSor> partnerSorList = partnerSorService
							.getPartnerSorByPartnerIdAndBizszam(inputForm.getPartner(), ks.getEllenbizszam());
					PartnerSor partnerSor=partnerSorList.get(0);

					partnerSor.setKifizDatum(inputForm.getTeljdatum());
					partnerSor.setKifizOsszeg(ks.getOsszeg());
					partnerSor.setOsszeg(0);
					partnerSor.setNaploTipus(naploSor.getNaploTipus());
					partnerSor.setNaploSorszam(naploSor.getNaploSorszam());
					partnerSor.setNaploKod(naploSor.getNaploKod());

					partnerSorService.save(partnerSor);
				}
			}
		}


		return true;
	}

	private List<KontirSor> getKontirSorFromInputForm(InputForm inputForm) {
		List<KontirSor> list = new ArrayList<>();

		KontirSor kontirSor = new KontirSor();

		kontirSor.setNaploTipus(inputForm.getNaplotipus());
		kontirSor.setTeljDatum(inputForm.getTeljdatum());
		kontirSor.setBizszam(inputForm.getBizszam());
		kontirSor.setFokszam(inputForm.getFokszam());
		kontirSor.setMegnevezes(inputForm.getMegnevezes());
		kontirSor.setTkJelleg(inputForm.getTkjelleg());
		kontirSor.setOsszeg(inputForm.getOsszeg());
		kontirSor.setPartnerId(inputForm.getPartner());

		list.add(kontirSor);

		for (InputFormKontir kontir : inputForm.getKontir()) {
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

	private NaploSor getNaploSorFromInputForm(InputForm inputForm) {
		NaploSor naploSor = new NaploSor();

		naploSor.setNaploTipus(inputForm.getNaplotipus());
		naploSor.setFokszam(inputForm.getFokszam());
		naploSor.setMegnevezes(inputForm.getMegnevezes());
		naploSor.setBizszam(inputForm.getBizszam());
		naploSor.setTeljDatum(inputForm.getTeljdatum());
		naploSor.setOsszeg(inputForm.getOsszeg());
		naploSor.setTkJelleg(inputForm.getTkjelleg());

		return naploSor;
	}

	private List<AfaSor> getAfaSorFromInputForm(InputForm inputForm) {
		List<AfaSor> list = new ArrayList<>();

		int i = 0;

		while (i < inputForm.getKontir().size()) {
			InputFormKontir kontir = inputForm.getKontir().get(i);
			if (kontir.getAfa() == null) {
				i++;
				continue;
			}

			AfaSor afaSor = new AfaSor();
			afaSor.setAfaKulcsId(kontir.getAfa().getId());
			afaSor.setNaploTipus(inputForm.getNaplotipus());
			afaSor.setBizszam(inputForm.getBizszam());
			afaSor.setPartnerId(inputForm.getPartner());
			afaSor.setMegnevezes(kontir.getMegnevezes());
			afaSor.setFizmodId(inputForm.getFizmod());
			afaSor.setTeljDatum(inputForm.getTeljdatum());

			afaSor.setNettoOsszeg(kontir.getOsszeg());
			afaSor.setAfaOsszeg(inputForm.getKontir().get(++i).getOsszeg());
			afaSor.setBruttoOsszeg(afaSor.getNettoOsszeg() + afaSor.getAfaOsszeg());

			list.add(afaSor);
			i++;
		}

		return list;
	}

	private PartnerSor getPartnerSorFromInputForm(InputForm inputForm) {

		PartnerSor partnerSor = new PartnerSor();

		partnerSor.setPartnerId(inputForm.getPartner());
		partnerSor.setBizszam(inputForm.getBizszam());
		partnerSor.setMegnevezes(inputForm.getMegnevezes());
		partnerSor.setTeljDatum(inputForm.getTeljdatum());
		partnerSor.setKiallDatum(inputForm.getKialldatum());
		partnerSor.setEsedDatum(inputForm.getEseddatum());
		partnerSor.setFizmodId(inputForm.getFizmod());
		partnerSor.setTkJelleg(inputForm.getTkjelleg());
		partnerSor.setOsszeg(inputForm.getOsszeg());

		return partnerSor;
	}

}

