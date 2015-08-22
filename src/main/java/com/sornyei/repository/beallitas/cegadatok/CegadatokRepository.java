package com.sornyei.repository.beallitas.cegadatok;

import com.sornyei.model.Cegadatok;

/**
 * Created by gaborsornyei on 10/08/15.
 */
public interface CegadatokRepository {
	Cegadatok find();
	Cegadatok update(Cegadatok cegadatok);
}
