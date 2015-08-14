package com.sornyei.repository.fizmodok;

import com.sornyei.model.FizMod;

import java.util.List;

/**
 * Created by gaborsornyei on 13/08/15.
 */
public interface FizModRepository {
	List<FizMod> findAll();
	FizMod findById(int id);
	FizMod update(FizMod fizMod);
	FizMod create(FizMod fizMod);
	boolean delete(int id);
}
