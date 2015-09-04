package com.sornyei.controller.beallitas;

import com.sornyei.model.FokSzamla;
import com.sornyei.service.beallitas.szamlatukor.SzamlatukorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by gaborsornyei on 11/08/15.
 */
@RestController
@RequestMapping(value = "/szamlatukor")
public class SzamlatukorController {

	@Autowired
	private SzamlatukorService service;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ResponseEntity<List<FokSzamla>> getSzamlatukor() {
		return new ResponseEntity<List<FokSzamla>>(service.findAll(), HttpStatus.OK);
	}

	@RequestMapping(value = "/{fokszam}", method = RequestMethod.GET)
	public ResponseEntity<FokSzamla> getFokSzamla(@PathVariable("fokszam") String fokszam) {
		return new ResponseEntity<FokSzamla>(service.findByFokSzam(fokszam), HttpStatus.OK);
	}

	@RequestMapping(value = "/{fokszam}", method = RequestMethod.PUT)
	public ResponseEntity<FokSzamla> update(@PathVariable("fokszam") String fokszam, @RequestBody FokSzamla fokSzamla) {
		fokSzamla.setFokszam(fokszam);
		return new ResponseEntity<FokSzamla>(service.update(fokSzamla), HttpStatus.OK);
	}
}
