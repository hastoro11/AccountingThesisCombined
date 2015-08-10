package com.sornyei.repository.cegadatok;

import com.sornyei.model.Cegadatok;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 * Created by gaborsornyei on 10/08/15.
 */
public interface CegadatokRepository {
	Cegadatok find();
	Cegadatok update(Cegadatok cegadatok);
}
