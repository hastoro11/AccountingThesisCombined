package com.sornyei.service.lista;

import com.sornyei.model.lista.NaploTetel;
import com.sornyei.repository.lista.NaploListaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 03..
 */
@Service
public class NaploListaServiceImpl implements NaploListaService {

	@Autowired
	private NaploListaRepository repository;

	@Override
	public List<NaploTetel> getNaploTetelListOrderByTeljDatum(Date from, Date to, String tipus) {
		return repository.getNaploTetelListOrderByTeljDatum(from, to, tipus);
	}
}
