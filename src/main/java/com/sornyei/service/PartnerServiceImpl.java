package com.sornyei.service;

import com.sornyei.model.Partner;
import com.sornyei.repository.PartnerRepository;
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
}
