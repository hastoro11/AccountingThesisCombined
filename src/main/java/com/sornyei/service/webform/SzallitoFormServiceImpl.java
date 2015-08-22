package com.sornyei.service.webform;

import com.sornyei.model.input.AfaSor;
import com.sornyei.model.input.KontirSor;
import com.sornyei.model.input.NaploSor;
import com.sornyei.model.input.SzallitoSor;
import com.sornyei.model.webform.SzallitoForm;
import com.sornyei.model.webform.SzallitoFormKontir;
import com.sornyei.service.input.afasor.AfaSorService;
import com.sornyei.service.input.kontirsor.KontirSorService;
import com.sornyei.service.input.naplosor.NaploSorService;
import com.sornyei.service.input.szallitosor.SzallitoSorService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by gaborsornyei on 22/08/15.
 */
@Service
public class SzallitoFormServiceImpl implements SzallitoFormService {

	final static Logger logger = Logger.getLogger(SzallitoFormServiceImpl.class);

	@Autowired
	private NaploSorService naploSorService;
	@Autowired
	private KontirSorService kontirSorService;
	@Autowired
	private AfaSorService afaSorService;
	@Autowired
	private SzallitoSorService szallitoSorService;

	@Override
	public boolean save(SzallitoForm szallitoForm) {
		// NaploSor
		NaploSor naploSor = naploSorService.saveNaploSor(getNaploSorFromSzallitoForm(szallitoForm));

		// KontirSor
		for (KontirSor kontirSor : getKontirSorFromSzallitoForm(szallitoForm)) {
			kontirSor.setNaploSorszam(naploSor.getNaploSorszam());
			kontirSor.setNaploKod(naploSor.getNaploKod());

			kontirSorService.save(kontirSor);
		}

		// AfaSor
		for (AfaSor afaSor : getAfaSorFromSzallitoForm(szallitoForm)) {
			logger.info(afaSor);
			afaSor.setNaploSorszam(naploSor.getNaploSorszam());
			afaSor.setNaploKod(naploSor.getNaploKod());
			afaSor.setNaploTipus("S");

			afaSorService.save(afaSor);
		}

		// SzallitoSor
		SzallitoSor szallitoSor = getSzallitoSorFromSzallitoForm(szallitoForm);
		szallitoSor.setNaploTipus("S");
		szallitoSor.setNaploKod(naploSor.getNaploKod());
		szallitoSor.setNaploSorszam(naploSor.getNaploSorszam());

		szallitoSorService.save(szallitoSor);

		return true;
	}

	private List<KontirSor> getKontirSorFromSzallitoForm(SzallitoForm szallitoForm) {
		List<KontirSor> list = new ArrayList<>();

		KontirSor kontirSor = new KontirSor();

		kontirSor.setNaploTipus("S");
		kontirSor.setTeljDatum(szallitoForm.getTeljdatum());
		kontirSor.setBizszam(szallitoForm.getBizszam());
		kontirSor.setFokszam(szallitoForm.getFokszam());
		kontirSor.setMegnevezes(szallitoForm.getMegnevezes());
		kontirSor.setTkJelleg(szallitoForm.getTkjelleg());
		kontirSor.setOsszeg(szallitoForm.getOsszeg());
		kontirSor.setPartnerId(szallitoForm.getPartner());

		list.add(kontirSor);

		for (SzallitoFormKontir kontir : szallitoForm.getKontir()) {
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

	private NaploSor getNaploSorFromSzallitoForm(SzallitoForm szallitoForm) {
		NaploSor naploSor = new NaploSor();

		naploSor.setNaploTipus("S");
		naploSor.setFokszam(szallitoForm.getFokszam());
		naploSor.setMegnevezes(szallitoForm.getMegnevezes());
		naploSor.setBizszam(szallitoForm.getBizszam());
		naploSor.setTeljDatum(szallitoForm.getTeljdatum());
		naploSor.setOsszeg(szallitoForm.getOsszeg());
		naploSor.setTkJelleg(szallitoForm.getTkjelleg());

		return naploSor;
	}

	private List<AfaSor> getAfaSorFromSzallitoForm(SzallitoForm szallitoForm) {
		List<AfaSor> list = new ArrayList<>();

		int i = 0;

		while (i < szallitoForm.getKontir().size()) {
			logger.info("Starting : i =" + i);
			SzallitoFormKontir kontir = szallitoForm.getKontir().get(i);
			if (kontir.getAfa() == null) {
				i++;
				continue;
			}

			AfaSor afaSor = new AfaSor();
			afaSor.setAfaKulcsId(kontir.getAfa().getId());
			afaSor.setBizszam(szallitoForm.getBizszam());
			afaSor.setPartnerId(szallitoForm.getPartner());
			afaSor.setMegnevezes(kontir.getMegnevezes());
			afaSor.setFizmodId(szallitoForm.getFizmod());
			afaSor.setTeljDatum(szallitoForm.getTeljdatum());

			afaSor.setNettoOsszeg(kontir.getOsszeg());
			afaSor.setAfaOsszeg(szallitoForm.getKontir().get(++i).getOsszeg());
			afaSor.setBruttoOsszeg(afaSor.getNettoOsszeg() + afaSor.getAfaOsszeg());

			list.add(afaSor);
			i++;
			logger.info("Ending : i =" + i);
		}

		return list;
	}

	private SzallitoSor getSzallitoSorFromSzallitoForm(SzallitoForm szallitoForm) {
		SzallitoSor szallitoSor = new SzallitoSor();

		szallitoSor.setPartnerId(szallitoForm.getPartner());
		szallitoSor.setBizszam(szallitoForm.getBizszam());
		szallitoSor.setTeljDatum(szallitoForm.getTeljdatum());
		szallitoSor.setKiallDatum(szallitoForm.getKialldatum());
		szallitoSor.setEsedDatum(szallitoForm.getEseddatum());
		szallitoSor.setFizmodId(szallitoForm.getFizmod());
		szallitoSor.setTkJelleg(szallitoForm.getTkjelleg());
		szallitoSor.setOsszeg(szallitoForm.getOsszeg());

		return szallitoSor;
	}
}

