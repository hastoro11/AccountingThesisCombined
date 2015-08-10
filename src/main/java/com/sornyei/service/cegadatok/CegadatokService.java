package com.sornyei.service.cegadatok;

import com.sornyei.model.Cegadatok;

/**
 * Created by gaborsornyei on 10/08/15.
 */

public interface CegadatokService {
	Cegadatok find();
	Cegadatok update(Cegadatok cegadatok);
}
