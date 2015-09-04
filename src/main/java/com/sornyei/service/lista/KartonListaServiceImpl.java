package com.sornyei.service.lista;

import com.sornyei.model.lista.KartonLista;
import com.sornyei.model.lista.KartonTetel;
import com.sornyei.repository.lista.KartonListaRepository;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 04..
 */
@Service
public class KartonListaServiceImpl implements KartonListaService {

	final static Logger logger = Logger.getLogger(KartonListaServiceImpl.class);

	@Autowired
	private KartonListaRepository repository;

	@Override
	public KartonLista getKartonByTeljDatumAndFokSzam(Date from, Date to, String fokszam) {
		KartonLista kartonLista = new KartonLista();
		List<KartonTetel> kartonTetelList = repository.getKartonTetelList(from, to, fokszam);

		logger.info(kartonTetelList);

		kartonLista.setKartonTetelList(kartonTetelList);
		if (kartonLista.getKartonTetelList() != null)
			kartonLista.calculate();

		return kartonLista;
	}
}
