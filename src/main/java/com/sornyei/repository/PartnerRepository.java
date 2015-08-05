package com.sornyei.repository;

import com.sornyei.model.Partner;

import java.util.List;

/**
 * Created by gaborsornyei on 05/08/15.
 */
public interface PartnerRepository {
	List<Partner> findAll();
}
