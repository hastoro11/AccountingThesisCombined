package com.sornyei.controller.lista;

import com.sornyei.model.lista.NaploTetel;
import com.sornyei.service.lista.NaploListaService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * Created by gaborsornyei on 15. 09. 03..
 */
@RestController
public class NaploListaController {

	final static Logger logger = Logger.getLogger(NaploListaController.class);

	@Autowired
	private NaploListaService service;

	@RequestMapping(value = "/naplolista/{from}/{to}/{tipus}")
	public ResponseEntity<List<NaploTetel>> getNaploLista(@PathVariable("from") Date from,
														  @PathVariable("to") Date to,
														  @PathVariable("tipus") String tipus
	) {
		logger.info(to + "-" + from + ", " + tipus);
		return new ResponseEntity<List<NaploTetel>>(
				service.getNaploTetelListOrderByTeljDatum(from, to, tipus), HttpStatus.OK);
	}

	private Date dateFromString(String dateString) {
		Calendar calendar = Calendar.getInstance();
		String[] dates = dateString.split("-");
		int year = Integer.parseInt(dates[0]);
		int month = Integer.parseInt(dates[1]);
		int day = Integer.parseInt(dates[2]);
		calendar.set(year, month, day);

		return calendar.getTime();
	}
}
