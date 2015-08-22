package com.sornyei.repository.input.szallitosor;

import com.sornyei.model.input.SzallitoSor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;

/**
 * Created by gaborsornyei on 22/08/15.
 */
@Repository
public class SzallitoSorRepositoryImpl implements SzallitoSorRepository{

	private DataSource dataSource;
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate=new NamedParameterJdbcTemplate(dataSource);
	}

	@Override
	public SzallitoSor save(SzallitoSor szallitoSor) {
		String sql="INSERT INTO szallitosor(partnerid, naplokod, naplotipus, naplosorszam, bizszam," +
				"teljdatum, kialldatum, eseddatum, kifizdatum, fizmodid, tkjelleg, osszeg)" +
				"VALUES (:partnerId, :naploKod, :naploTipus, :naploSorszam, :bizszam," +
				":teljDatum, :kiallDatum, :esedDatum, :kifizDatum, :fizmodId, :tkJelleg, :osszeg)";

		BeanPropertySqlParameterSource parameterSource=new BeanPropertySqlParameterSource(szallitoSor);
		KeyHolder keyHolder=new GeneratedKeyHolder();
		jdbcTemplate.update(sql, parameterSource, keyHolder);
		szallitoSor.setId(keyHolder.getKey().intValue());

		return szallitoSor;
	}
}
