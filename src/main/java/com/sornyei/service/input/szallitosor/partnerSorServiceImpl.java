package com.sornyei.service.input.szallitosor;

import com.sornyei.model.input.PartnerSor;
import com.sornyei.repository.input.szallitosor.PartnerSorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
