package com.sornyei.repository.input.kontirsor;

import com.sornyei.model.input.KontirSor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;

/**
 * Created by gaborsornyei on 22/08/15.
 */
@Repository
public class KontirSorRepositoryImpl implements KontirSorRepository {

	private DataSource dataSource;
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	@Override
	public KontirSor save(KontirSor kontirSor) {
		String sql = "INSERT INTO kontir(fokszam, naplokod, naplotipus, naplosorszam, teljdatum, " +
				"bizszam, megnevezes, tkjelleg, osszeg, partnerid, afatetel, torolt) " +
				"VALUES(:fokszam, :naploKod, :naploTipus, :naploSorszam, :teljDatum, " +
				":bizszam, :megnevezes, :tkJelleg, :osszeg, :partnerId, :afaTetel, :torolt)";
		BeanPropertySqlParameterSource parameterSource = new BeanPropertySqlParameterSource(kontirSor);
		if (jdbcTemplate.update(sql, parameterSource) == 1)
			return kontirSor;

		return null;

	}

}
