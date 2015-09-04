package com.sornyei.service.lista;

import com.sornyei.model.lista.NaploTetel;

import java.util.Date;
import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 03..
 */
public interface NaploListaService {
	List<NaploTetel> getNaploTetelListOrderByTeljDatum(Date from, Date to, String tipus);
}
