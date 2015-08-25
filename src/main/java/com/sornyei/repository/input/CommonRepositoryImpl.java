package com.sornyei.repository.input;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;

/**
 * Created by gaborsornyei on 25/08/15.
 */
@Repository
public class CommonRepositoryImpl implements CommonRepository {

	private DataSource dataSource;
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	@Override
	public int getNextNaploSorSzam(String naploTipus) {
		String sql = "SELECT MAX(naplosorszam) FROM naplosor WHERE naplotipus=:naploTipus";
		SqlParameterSource parameterSource = new MapSqlParameterSource("naploTipus", naploTipus);
		Integer sorszam = jdbcTemplate.queryForObject(sql, parameterSource, Integer.class);
		if (sorszam == null)
			return 1;

		return sorszam + 1;
	}
}
