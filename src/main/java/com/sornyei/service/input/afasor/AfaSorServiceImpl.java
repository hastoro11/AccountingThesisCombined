package com.sornyei.service.input.afasor;

import com.sornyei.model.input.AfaSor;
import com.sornyei.repository.input.afasor.AfaSorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by gaborsornyei on 22/08/15.
 */
@Service
public class AfaSorServiceImpl implements AfaSorService {

	@Autowired
	private AfaSorRepository afaSorRepository;

	@Override
	public AfaSor save(AfaSor afaSor) {
		return afaSorRepository.save(afaSor);
	}
}
