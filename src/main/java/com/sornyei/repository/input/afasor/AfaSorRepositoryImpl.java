package com.sornyei.repository.input.afasor;

import com.sornyei.model.input.AfaSor;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
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
public class AfaSorRepositoryImpl implements AfaSorRepository {

	final static Logger logger = Logger.getLogger(AfaSorRepositoryImpl.class);

	private DataSource dataSource;
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	@Override
	public AfaSor save(AfaSor afaSor) throws DataAccessException{
		String sql = "INSERT INTO afasor(afakulcsid, naplokod, naplotipus, naplosorszam, bizszam, " +
				"partnerid, megnevezes, fizmodid, teljdatum,  bruttoosszeg, nettoosszeg, afaosszeg) " +
				"VALUES (:afaKulcsId, :naploKod, :naploTipus, :naploSorszam, :bizszam, " +
				":partnerId, :megnevezes, :fizmodId, :teljDatum, :bruttoOsszeg, :nettoOsszeg, :afaOsszeg)";
		BeanPropertySqlParameterSource parameterSource = new BeanPropertySqlParameterSource(afaSor);
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(sql, parameterSource, keyHolder);
		afaSor.setId(keyHolder.getKey().intValue());

		return afaSor;
	}
}
