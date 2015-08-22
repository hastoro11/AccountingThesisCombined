package com.sornyei.controller;

import com.sornyei.model.Naplo;
import com.sornyei.service.beallitas.naplok.NaploService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by gaborsornyei on 11/08/15.
 */
@RestController
@RequestMapping(value = "/naplok")
public class NaploController {

	@Autowired
	private NaploService service;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ResponseEntity<List<Naplo>> getNaplok() {
		return new ResponseEntity<List<Naplo>>(service.findAll(), HttpStatus.OK);
	}
}
