package com.sornyei.service.naplok;

import com.sornyei.model.Naplo;
import com.sornyei.repository.naplok.NaploRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by gaborsornyei on 11/08/15.
 */
@Service
public class NaploServiceImpl implements NaploService{

	@Autowired
	NaploRepository repository;

	public List<Naplo> findAll() {
		return repository.findAll();
	}
}
