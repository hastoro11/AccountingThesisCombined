package com.sornyei.service.input.partnersor;

import com.sornyei.model.input.PartnerSor;
import com.sornyei.repository.input.partnersor.PartnerSorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by gaborsornyei on 22/08/15.
 */
@Service
public class PartnerSorServiceImpl implements PartnerSorService {

	@Autowired
	private PartnerSorRepository repository;

	@Override
	public PartnerSor save(PartnerSor partnerSor) {
		return repository.save(partnerSor);
	}

	@Override
	public List<String> getKifizetetlenBizSzamok(int partnerId) {
		return repository.getKifizetetlenBizSzamok(partnerId);
	}

	@Override
	public List<PartnerSor> getPartnerSorByPartnerIdAndBizszam(int partnerId, String bizszam) {
		return repository.getPartnerSorByPartnerIdAndBizszamOnlySzallOrVevo(partnerId, bizszam);
	}

	@Override
	public void kipontoz() {

		List<Object[]> nemKipontozott = repository.getBizszamNotKipontozott();
		for (Object[] a : nemKipontozott) {
			String bizSzam = (String) a[0];
			int partnerId = (Integer) a[1];

			List<PartnerSor> partnerSorList = repository
					.getPartnerSorByPartnerIdAndBizszam(partnerId, bizSzam);
			int osszeg = 0;
			int kifizOsszeg = 0;
			for (PartnerSor pSor : partnerSorList) {
				osszeg += pSor.getOsszeg();
				kifizOsszeg += pSor.getKifizOsszeg();
			}
			if (osszeg == kifizOsszeg) {
				repository.kipontoz(partnerId, bizSzam);
			}

		}

	}
}
