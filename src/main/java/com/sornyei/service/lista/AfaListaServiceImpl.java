package com.sornyei.service.lista;

import com.sornyei.model.AfaKulcs;
import com.sornyei.model.lista.AfaLista;
import com.sornyei.model.lista.AfaTetel;
import com.sornyei.repository.lista.AfaListaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 05..
 */
@Service
public class AfaListaServiceImpl implements AfaListaService {

	@Autowired
	private AfaListaRepository afaListaRepository;

	public List<AfaLista> getAfaListaByDateAndTipus(Date from, Date to, String tipus) {

		List<AfaLista> afaListas = new ArrayList<>();

		List<AfaKulcs> afaKulcsList = afaListaRepository.getAfaKulcsByTipus(tipus);

		for (AfaKulcs afaKulcs : afaKulcsList) {
			AfaLista afaLista = new AfaLista();
			afaLista.setAfaTetelList(afaListaRepository.getAfaTetelByDateAndAfaKulcs(from, to, afaKulcs.getId()));
			afaLista.setAfaKulcs(afaKulcs);
			for (AfaTetel tetel : afaLista.getAfaTetelList()) {
				afaLista.setBruttoOsszesen(afaLista.getBruttoOsszesen() + tetel.getBruttoOsszeg());
				afaLista.setNettoOsszesen(afaLista.getNettoOsszesen() + tetel.getNettoOsszeg());
				afaLista.setAfaOsszesen(afaLista.getAfaOsszesen() + tetel.getAfaOsszeg());
			}

			afaListas.add(afaLista);
		}


		return afaListas;
	}
}
