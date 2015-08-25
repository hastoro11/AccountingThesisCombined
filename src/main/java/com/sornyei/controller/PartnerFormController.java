package com.sornyei.controller;

import com.sornyei.model.webform.PartnerForm;
import com.sornyei.service.webform.PartnerFormService;
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
public class PartnerFormController {

	final static Logger logger = Logger.getLogger(PartnerFormController.class);

	@Autowired
	private PartnerFormService service;

	@RequestMapping(value = "/szallito", method = RequestMethod.POST)
	public ResponseEntity<PartnerForm> saveSzallito(@RequestBody PartnerForm partnerForm) {
		if (service.save(partnerForm))
			return new ResponseEntity<PartnerForm>(partnerForm, HttpStatus.CREATED);
		else
			return new ResponseEntity<PartnerForm>(HttpStatus.NOT_FOUND);
	}

	@RequestMapping(value = "/vevo", method = RequestMethod.POST)
	public ResponseEntity<PartnerForm> saveVevp(@RequestBody PartnerForm partnerForm) {
		if (service.save(partnerForm))
			return new ResponseEntity<PartnerForm>(partnerForm, HttpStatus.CREATED);
		else
			return new ResponseEntity<PartnerForm>(HttpStatus.NOT_FOUND);
	}

}
