package com.sornyei.repository.lista;

import com.sornyei.model.lista.FokonyvLista;
import com.sornyei.model.lista.FokonyvTetel;

import java.util.Date;
import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 04..
 */
public interface FokonyListaRepository {
	List<FokonyvTetel> getFokonyvTetelList(Date fromDate, Date toDate, String fromFokszam, String toFokszam);
	FokonyvTetel getFokonyvTetelByLike(Date fromDate, Date toDate, String fokszam);
}
