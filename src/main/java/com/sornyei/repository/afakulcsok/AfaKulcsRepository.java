package com.sornyei.repository.afakulcsok;

import com.sornyei.model.AfaKulcs;

import java.util.List;

/**
 * Created by gaborsornyei on 14/08/15.
 */
public interface AfaKulcsRepository {
	List<AfaKulcs> findAll();

	AfaKulcs findById(int id);

	AfaKulcs update(AfaKulcs afaKulcs);

	AfaKulcs create(AfaKulcs afaKulcs);

	boolean delete(int id);
}
