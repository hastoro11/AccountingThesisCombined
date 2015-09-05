package com.sornyei.service.lista;

import com.sornyei.model.lista.AfaLista;

import java.util.Date;
import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 05..
 */
public interface AfaListaService {
	List<AfaLista> getAfaListaByDateAndTipus(Date from, Date to, String tipus);
}
