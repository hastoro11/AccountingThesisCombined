package com.sornyei.service.lista;

import com.sornyei.model.lista.FokonyvLista;

import java.util.Date;

/**
 * Created by gaborsornyei on 15. 09. 04..
 */
public interface FokonyvListaService {
	FokonyvLista getFokonyvLista(Date fromDate, Date toDate, String fromFokszam, String toFokszam);
}
