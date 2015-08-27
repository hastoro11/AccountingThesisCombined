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
		return repository.getPartnerSorByPartnerIdAndBizszam(partnerId, bizszam);
	}
}
