package com.sornyei.controller.lista;

import com.sornyei.model.lista.KartonLista;
import com.sornyei.model.lista.NaploLista;
import com.sornyei.service.lista.KartonListaService;
import com.sornyei.service.lista.NaploListaService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * Created by gaborsornyei on 15. 09. 03..
 */
@RestController
public class ListaController {

	final static Logger logger = Logger.getLogger(ListaController.class);

	@Autowired
	private NaploListaService naploListaService;
	@Autowired
	private KartonListaService kartonListaService;

	@RequestMapping(value = "/naplolista/{from}/{to}/{tipus}")
	public ResponseEntity<NaploLista> getNaploLista(@PathVariable("from") Date from,
											   @PathVariable("to") Date to,
											   @PathVariable("tipus") String tipus
	) {
		logger.info(to + "-" + from + ", " + tipus);
		return new ResponseEntity<NaploLista>(
				naploListaService.getNaploTetelListOrderByTeljDatum(from, to, tipus), HttpStatus.OK);
	}

	@RequestMapping(value = "/kartonlista/{from}/{to}/{fokszam}")
	public ResponseEntity<KartonLista> getKartonLista(@PathVariable("from") Date from,
												 @PathVariable("to") Date to,
												 @PathVariable("fokszam") String fokszam) {
		return new ResponseEntity<KartonLista>(kartonListaService.getKartonByTeljDatumAndFokSzam(from, to, fokszam),
										  HttpStatus.OK);
	}

}
