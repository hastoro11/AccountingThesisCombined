package com.sornyei.service.lista;

import com.sornyei.model.lista.NaploLista;

import java.util.Date;

/**
 * Created by gaborsornyei on 15. 09. 03..
 */
public interface NaploListaService {
	NaploLista getNaploTetelListOrderByTeljDatum(Date from, Date to, String tipus);
}
