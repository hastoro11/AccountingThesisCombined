package com.sornyei.controller;

import com.sornyei.model.webform.InputForm;
import com.sornyei.service.webform.InputFormService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by gaborsornyei on 25/08/15.
 */
@RestController
public class InputFormController {

	final static Logger logger = Logger.getLogger(InputFormController.class);

	@Autowired
	private InputFormService service;

	@RequestMapping(value = "/szallito", method = RequestMethod.POST)
	public ResponseEntity<InputForm> saveSzallito(@RequestBody InputForm inputForm) {
		if (service.save(inputForm))
			return new ResponseEntity<InputForm>(inputForm, HttpStatus.CREATED);
		else
			return new ResponseEntity<InputForm>(HttpStatus.NOT_FOUND);
	}

	@RequestMapping(value = "/vevo", method = RequestMethod.POST)
	public ResponseEntity<InputForm> saveVevo(@RequestBody InputForm inputForm) {
		if (service.save(inputForm))
			return new ResponseEntity<InputForm>(inputForm, HttpStatus.CREATED);
		else
			return new ResponseEntity<InputForm>(HttpStatus.NOT_FOUND);
	}

	@RequestMapping(value = "/vegyes", method = RequestMethod.POST)
	public ResponseEntity<InputForm> saveVegyes(@RequestBody InputForm inputForm) {
		if (service.save(inputForm))
			return new ResponseEntity<InputForm>(inputForm, HttpStatus.CREATED);
		else
			return new ResponseEntity<InputForm>(HttpStatus.NOT_FOUND);
	}

	@RequestMapping(value = "/penztar", method = RequestMethod.POST)
	public ResponseEntity<InputForm> savePenztar(@RequestBody InputForm inputForm) {
		if (service.save(inputForm))
			return new ResponseEntity<InputForm>(inputForm, HttpStatus.CREATED);
		else
			return new ResponseEntity<InputForm>(HttpStatus.NOT_FOUND);
	}

	@RequestMapping(value = "/bank", method = RequestMethod.POST)
	public ResponseEntity<InputForm> saveBank(@RequestBody InputForm inputForm) {
		if (service.save(inputForm))
			return new ResponseEntity<InputForm>(inputForm, HttpStatus.CREATED);
		else
			return new ResponseEntity<InputForm>(HttpStatus.NOT_FOUND);
	}

}
