package com.sornyei.service;

import com.sornyei.repository.input.CommonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by gaborsornyei on 25/08/15.
 */
@Service
public class CommonServiceImpl implements CommonService{

	@Autowired
	private CommonRepository repository;

	@Override
	public int getNextNaploSorSzam(String naploTipus) {
		return repository.getNextNaploSorSzam(naploTipus);
	}

}
