package com.sornyei.service.beallitas.fizmodok;

import com.sornyei.model.FizMod;
import com.sornyei.repository.beallitas.fizmodok.FizModRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by gaborsornyei on 13/08/15.
 */
@Service
public class FizModServiceImpl implements FizModService{

	@Autowired
	private FizModRepository repository;

	public List<FizMod> findAll() {
		return repository.findAll();
	}

	public FizMod findById(int id) {
		return repository.findById(id);
	}

	public FizMod update(FizMod fizMod) {
		return repository.update(fizMod);
	}

	public FizMod create(FizMod fizMod) {
		return repository.create(fizMod);
	}

	public boolean delete(int id) {
		return repository.delete(id);
	}
}
