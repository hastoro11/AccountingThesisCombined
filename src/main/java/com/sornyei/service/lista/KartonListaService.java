package com.sornyei.service.lista;

import com.sornyei.model.lista.KartonLista;

import java.util.Date;

/**
 * Created by gaborsornyei on 15. 09. 04..
 */
public interface KartonListaService {
	KartonLista getKartonByTeljDatumAndFokSzam(Date from, Date to, String fokszam);
}
