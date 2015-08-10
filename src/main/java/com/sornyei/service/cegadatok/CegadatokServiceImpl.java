package com.sornyei.service.cegadatok;

import com.sornyei.model.Cegadatok;
import com.sornyei.repository.cegadatok.CegadatokRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by gaborsornyei on 10/08/15.
 */
@Service
public class CegadatokServiceImpl implements CegadatokService {

	@Autowired
	private CegadatokRepository repository;

	public Cegadatok find() {
		return repository.find();
	}

	public Cegadatok update(Cegadatok cegadatok) {
		return repository.update(cegadatok);
	}
}
