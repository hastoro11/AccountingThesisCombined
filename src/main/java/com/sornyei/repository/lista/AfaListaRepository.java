package com.sornyei.repository.lista;

import com.sornyei.model.AfaKulcs;
import com.sornyei.model.lista.AfaTetel;

import java.util.Date;
import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 05..
 */
public interface AfaListaRepository {
	List<AfaKulcs> getAfaKulcsByTipus(String tipus);

	List<AfaTetel> getAfaTetelByDateAndAfaKulcs(Date from, Date to, int afaKulcsId);
}
