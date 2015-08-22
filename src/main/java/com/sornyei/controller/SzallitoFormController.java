package com.sornyei.controller;

import com.sornyei.model.webform.SzallitoForm;
import com.sornyei.service.webform.SzallitoFormService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by gaborsornyei on 20/08/15.
 */
@RestController
@RequestMapping(value = "/szallito")
public class SzallitoFormController {

	final static Logger logger = Logger.getLogger(SzallitoFormController.class);

	@Autowired
	private SzallitoFormService service;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<SzallitoForm> save(@RequestBody SzallitoForm szallitoForm) {
		logger.info(service.save(szallitoForm));
		return new ResponseEntity<SzallitoForm>(szallitoForm, HttpStatus.CREATED);
	}

}
