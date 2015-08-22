package com.sornyei.service.beallitas.afakulcsok;

import com.sornyei.model.AfaKulcs;
import com.sornyei.repository.beallitas.afakulcsok.AfaKulcsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by gaborsornyei on 14/08/15.
 */
@Service
public class AfaKulcsServiceImpl implements AfaKulcsService {

	@Autowired
	AfaKulcsRepository repository;

	public List<AfaKulcs> findAll() {
		return repository.findAll();
	}

	public AfaKulcs findById(int id) {
		return repository.findById(id);
	}

	public AfaKulcs update(AfaKulcs afaKulcs) {
		return repository.update(afaKulcs);
	}

	public AfaKulcs create(AfaKulcs afaKulcs) {
		return repository.create(afaKulcs);
	}

	public boolean delete(int id) {
		return repository.delete(id);
	}
}
