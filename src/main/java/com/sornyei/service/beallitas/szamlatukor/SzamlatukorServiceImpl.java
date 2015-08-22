package com.sornyei.service.beallitas.szamlatukor;

import com.sornyei.model.FokSzamla;
import com.sornyei.repository.beallitas.szamlatukor.SzamlatukorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by gaborsornyei on 11/08/15.
 */
@Service
public class SzamlatukorServiceImpl implements SzamlatukorService {

	@Autowired
	private SzamlatukorRepository repository;

	public List<FokSzamla> findAll() {
		return repository.findAll();
	}

	public FokSzamla findByFokSzam(String fokszam) {
		return repository.findByFokSzam(fokszam);
	}

	public FokSzamla update(FokSzamla fokSzamla) {
		return repository.update(fokSzamla);
	}
}
