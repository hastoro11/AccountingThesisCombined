package com.sornyei.service.input.naplosor;

import com.sornyei.model.input.NaploSor;
import com.sornyei.repository.input.naplosor.NaploSorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by gaborsornyei on 22/08/15.
 */
@Service
public class NaploSorServiceImpl implements NaploSorService{

	@Autowired
	private NaploSorRepository naploSorRepository;

	@Override
	public NaploSor saveNaploSor(NaploSor naploSor) {
		return naploSorRepository.save(naploSor);
	}
}
