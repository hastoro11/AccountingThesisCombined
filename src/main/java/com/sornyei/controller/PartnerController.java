package com.sornyei.controller;

import com.sornyei.model.Partner;
import com.sornyei.service.PartnerService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import sun.rmi.runtime.Log;

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
	public List<Partner> getPartnerek() {
		logger.info(service.findAll().size());
		return service.findAll();
	}
}
