package com.sornyei.repository.lista;

import com.sornyei.model.lista.NaploTetel;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 03..
 */
public interface NaploListaRepository {
	List<NaploTetel> getNaploTetelListOrderByTeljDatum(Date from, Date to, String tipus);
}
