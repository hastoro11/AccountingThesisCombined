package com.sornyei.service.lista;

import com.sornyei.model.lista.NaploLista;
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
	public NaploLista getNaploTetelListOrderByTeljDatum(Date from, Date to, String tipus) {
		NaploLista naploLista = new NaploLista();
		List<NaploTetel> naploTetelList = repository.getNaploTetelListOrderByTeljDatum(from, to, tipus);
		naploLista.setNaploTetelList(naploTetelList);
		naploLista.calculate();

		return naploLista;
	}
}
