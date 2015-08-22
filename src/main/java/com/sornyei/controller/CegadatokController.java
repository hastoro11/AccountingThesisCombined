package com.sornyei.controller;

import com.sornyei.model.Cegadatok;
import com.sornyei.service.beallitas.cegadatok.CegadatokService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * Created by gaborsornyei on 10/08/15.
 */
@RestController
@RequestMapping(value = "/cegadatok")
public class CegadatokController {

	@Autowired
	CegadatokService service;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ResponseEntity<Cegadatok> getCegadatok() {
		return new ResponseEntity<Cegadatok>(service.find(), HttpStatus.OK);
	}

	@RequestMapping(value = "", method = RequestMethod.PUT)
	public ResponseEntity<Cegadatok> update(@RequestBody Cegadatok cegadatok) {
		return new ResponseEntity<Cegadatok>(service.update(cegadatok), HttpStatus.OK);
	}
}
