package com.sornyei.controller;

import com.sornyei.model.input.PartnerSor;
import com.sornyei.service.CommonService;
import com.sornyei.service.input.partnersor.PartnerSorService;
import com.sun.org.glassfish.gmbal.ParameterNames;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by gaborsornyei on 25/08/15.
 */
@RestController
@RequestMapping(value = "/common")
public class CommonController {

	final static Logger logger = Logger.getLogger(CommonController.class);

	@Autowired
	private CommonService commonService;
	@Autowired
	private PartnerSorService partnerSorService;

	@RequestMapping(value = "/naplo/{naplotipus}", method = RequestMethod.GET)
	public int getNextNaploSorSzam(@PathVariable("naplotipus") String naploTipus) {
		return commonService.getNextNaploSorSzam(naploTipus);
	}

	@RequestMapping(value = "/kifiztlen/{partnerid}", method = RequestMethod.GET)
	public List<String> getKifizetetlenBizSzamok(@PathVariable("partnerid") int partnerId) {
		return partnerSorService.getKifizetetlenBizSzamok(partnerId);
	}

	@RequestMapping(value = "/checkbizsz/{partnerid}/{bizszam}", method = RequestMethod.GET)
	public Boolean checkPartnerAndBizszam(@PathVariable("partnerid") int partnerId,
										  @PathVariable("bizszam") String bizszam) {
		List<PartnerSor> partnerSorList = partnerSorService.getPartnerSorByPartnerIdAndBizszam(partnerId, bizszam);

		return partnerSorList.size() > 0;
	}
}
