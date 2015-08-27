package com.sornyei.controller.beallitasok;

import com.sornyei.model.AfaKulcs;
import com.sornyei.service.beallitas.afakulcsok.AfaKulcsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by gaborsornyei on 14/08/15.
 */
@RestController
@RequestMapping(value = "/afakulcsok")
public class AfaKulcsController {

	@Autowired
	AfaKulcsService service;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ResponseEntity<List<AfaKulcs>> getAfaKulcsok() {
		return new ResponseEntity<List<AfaKulcs>>(service.findAll(), HttpStatus.OK);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ResponseEntity<AfaKulcs> getAfaKulcsById(@PathVariable("id") int id) {
		return new ResponseEntity<AfaKulcs>(service.findById(id), HttpStatus.OK);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public ResponseEntity<AfaKulcs> update(@PathVariable("id") int id, @RequestBody AfaKulcs afaKulcs) {
		afaKulcs.setId(id);
		return new ResponseEntity<AfaKulcs>(service.update(afaKulcs), HttpStatus.OK);
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<AfaKulcs> create(@RequestBody AfaKulcs afaKulcs) {
		return new ResponseEntity<AfaKulcs>(service.create(afaKulcs), HttpStatus.CREATED);
	}

	@RequestMapping(value = "{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Boolean> delete(@PathVariable("id") int id) {
		return new ResponseEntity<Boolean>(service.delete(id), HttpStatus.OK);
	}

}
