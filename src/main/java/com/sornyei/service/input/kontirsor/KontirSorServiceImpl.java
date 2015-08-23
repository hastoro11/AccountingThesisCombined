package com.sornyei.service.input.kontirsor;

import com.sornyei.model.input.KontirSor;
import com.sornyei.repository.input.kontirsor.KontirSorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by gaborsornyei on 22/08/15.
 */
@Service
public class KontirSorServiceImpl implements KontirSorService {

	@Autowired
	private KontirSorRepository repository;

	@Override
	public KontirSor save(KontirSor kontirSor) {
		return repository.save(kontirSor);
	}
}
