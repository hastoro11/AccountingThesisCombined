package com.sornyei.controller;

import com.sornyei.service.CommonService;
import com.sun.org.glassfish.gmbal.ParameterNames;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by gaborsornyei on 25/08/15.
 */
@RestController
@RequestMapping(value = "/common")
public class CommonController {

	@Autowired
	private CommonService commonService;

	@RequestMapping(value = "/naplo/{naplotipus}", method = RequestMethod.GET)
	public int getNextNaploSorSzam(@PathVariable("naplotipus") String naploTipus) {
		return commonService.getNextNaploSorSzam(naploTipus);
	}
}
