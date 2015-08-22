package com.sornyei.service.input.szallitosor;

import com.sornyei.model.input.SzallitoSor;
import com.sornyei.repository.input.szallitosor.SzallitoSorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by gaborsornyei on 22/08/15.
 */
@Service
public class SzallitoSorServiceImpl implements SzallitoSorService {

	@Autowired
	private SzallitoSorRepository repository;

	@Override
	public SzallitoSor save(SzallitoSor szallitoSor) {
		return repository.save(szallitoSor);
	}
}
