package com.sornyei.service.beallitas.cegadatok;

import com.sornyei.model.Cegadatok;

/**
 * Created by gaborsornyei on 10/08/15.
 */

public interface CegadatokService {
	Cegadatok find();
	Cegadatok update(Cegadatok cegadatok);
}
