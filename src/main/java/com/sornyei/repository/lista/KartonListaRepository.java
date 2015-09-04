package com.sornyei.repository.lista;

import com.sornyei.model.lista.KartonTetel;

import java.util.Date;
import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 04..
 */
public interface KartonListaRepository {
	List<KartonTetel> getKartonTetelList(Date from, Date to, String fokszam);
}
