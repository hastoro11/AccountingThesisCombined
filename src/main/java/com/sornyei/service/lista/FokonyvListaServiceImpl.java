package com.sornyei.service.lista;

import com.sornyei.model.FokSzamla;
import com.sornyei.model.lista.FokonyvLista;
import com.sornyei.model.lista.FokonyvTetel;
import com.sornyei.repository.beallitas.szamlatukor.SzamlatukorRepository;
import com.sornyei.repository.lista.FokonyListaRepository;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 04..
 */
@Service
public class FokonyvListaServiceImpl implements FokonyvListaService {

	final static Logger logger = Logger.getLogger(FokonyvListaServiceImpl.class);

	@Autowired
	FokonyListaRepository repository;

	@Override
	public FokonyvLista getFokonyvLista(Date fromDate, Date toDate,
										String fromFokszam, String toFokszam
	) {
		List<FokonyvTetel> fokonyvTetelList = repository.getFokonyvTetelList(fromDate, toDate, fromFokszam, toFokszam);
		FokonyvLista fokonyvLista = new FokonyvLista();


		for (int i = 0; i < fokonyvTetelList.size(); i++) {
			FokonyvTetel tetel = fokonyvTetelList.get(i);

			if (tetel.isOsszesito()) {
				FokonyvTetel osszTetel = repository.getFokonyvTetelByLike(fromDate, toDate, tetel.getFokszam());
				tetel.setHalmTartForgalom(osszTetel.getHalmTartForgalom());
				tetel.setHalmKovForgalom(osszTetel.getHalmKovForgalom());
				tetel.setHalmTartEgyenleg(osszTetel.getHalmTartEgyenleg());
				tetel.setHalmKovEgyenleg(osszTetel.getHalmKovEgyenleg());

				if (tetel.getHalmTartEgyenleg() > 0 && tetel.getHalmKovEgyenleg() > 0)
					logger.info(tetel);
			}


		}
		fokonyvLista.setFokonyvTetelList(fokonyvTetelList);
		fokonyvLista.calculate();

		return fokonyvLista;
	}
}
