package com.sornyei.repository.beallitas.naplok;

import com.sornyei.model.Naplo;

import java.util.List;

/**
 * Created by gaborsornyei on 11/08/15.
 */
public interface NaploRepository {
	List<Naplo> findAll();
}
