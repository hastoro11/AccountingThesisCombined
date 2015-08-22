package com.sornyei.controller;

import com.sornyei.model.FizMod;
import com.sornyei.service.beallitas.fizmodok.FizModService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by gaborsornyei on 13/08/15.
 */
@RestController
@RequestMapping(value = "fizmodok")
public class FizModController {

	@Autowired
	private FizModService service;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ResponseEntity<List<FizMod>> getFizModok() {
		return new ResponseEntity<List<FizMod>>(service.findAll(), HttpStatus.OK);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ResponseEntity<FizMod> getFizModById(@PathVariable("id") int id) {
		return new ResponseEntity<FizMod>(service.findById(id), HttpStatus.OK);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public ResponseEntity<FizMod> update(@PathVariable("id") int id, @RequestBody FizMod fizMod) {
		fizMod.setId(id);
		return new ResponseEntity<FizMod>(service.update(fizMod), HttpStatus.OK);
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<FizMod> create(@RequestBody FizMod fizMod) {
		return new ResponseEntity<FizMod>(service.create(fizMod), HttpStatus.CREATED);
	}

	@RequestMapping(value = "{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Boolean> delete(@PathVariable("id") int id) {
		return new ResponseEntity<Boolean>(service.delete(id), HttpStatus.OK);
	}
}
