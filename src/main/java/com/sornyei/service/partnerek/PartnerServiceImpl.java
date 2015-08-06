package com.sornyei.service.partnerek;

import com.sornyei.model.Partner;
import com.sornyei.repository.partnerek.PartnerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by gaborsornyei on 05/08/15.
 */
@Service
public class PartnerServiceImpl implements PartnerService {
	@Autowired
	private PartnerRepository repository;

	public List<Partner> findAll() {
		return repository.findAll();
	}

	public Partner findById(int id) {
		return repository.findById(id);
	}

	public Partner update(Partner partner) {
		return repository.update(partner);
	}

	public Partner create(Partner partner) {
		return repository.create(partner);
	}

	public boolean delete(int id) {
		return repository.delete(id);
	}


}
