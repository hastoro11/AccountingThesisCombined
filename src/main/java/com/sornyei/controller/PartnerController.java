package com.sornyei.controller;

import com.sornyei.model.Partner;
import com.sornyei.service.beallitas.partnerek.PartnerService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by gaborsornyei on 05/08/15.
 */
@RestController
@RequestMapping(value = "/partnerek")
public class PartnerController {
	final static Logger logger = Logger.getLogger(PartnerController.class);

	@Autowired
	private PartnerService service;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ResponseEntity<List<Partner>> getPartnerek() {
		return new ResponseEntity<List<Partner>>(service.findAll(), HttpStatus.OK);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ResponseEntity<Partner> getPartnerById(@PathVariable("id") int id) {
		return new ResponseEntity<Partner>(service.findById(id), HttpStatus.OK);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public ResponseEntity<Partner> update(@PathVariable("id") int id, @RequestBody Partner partner) {
		partner.setId(id);
		return new ResponseEntity<Partner>(service.update(partner), HttpStatus.OK);
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<Partner> create(@RequestBody Partner partner) {
		return new ResponseEntity<Partner>(service.create(partner), HttpStatus.CREATED);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Boolean> delete(@PathVariable("id") int id){
		return new ResponseEntity<Boolean>(service.delete(id), HttpStatus.OK);
	}

}
