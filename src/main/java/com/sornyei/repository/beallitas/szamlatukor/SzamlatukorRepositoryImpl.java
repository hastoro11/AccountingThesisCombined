package com.sornyei.repository.beallitas.szamlatukor;

import com.sornyei.model.FokSzamla;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by gaborsornyei on 11/08/15.
 */
@Repository
public class SzamlatukorRepositoryImpl implements SzamlatukorRepository {

	private NamedParameterJdbcTemplate jdbcTemplate;
	private DataSource dataSource;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	public List<FokSzamla> findAll() {
		String sql = "SELECT * FROM szamlatukor ORDER BY fokszam";

		return jdbcTemplate.query(sql, new SzamlatukorRowMapper());
	}

	public FokSzamla findByFokSzam(String fokszam) {
		String sql = "SELECT * FROM szamlatukor WHERE fokszam=:fokszam";
		SqlParameterSource parameterSource = new MapSqlParameterSource("fokszam", fokszam);

		return jdbcTemplate.queryForObject(sql, parameterSource, new SzamlatukorRowMapper());
	}

	public FokSzamla update(FokSzamla fokSzamla) {
		String sql="UPDATE szamlatukor SET megnevezes=:megnevezes WHERE fokszam=:fokszam";
		BeanPropertySqlParameterSource parameterSource = new BeanPropertySqlParameterSource(fokSzamla);

		jdbcTemplate.update(sql, parameterSource);

		return fokSzamla;
	}

	class SzamlatukorRowMapper implements RowMapper<FokSzamla> {

		public FokSzamla mapRow(ResultSet rs, int rowNum) throws SQLException {
			FokSzamla fokSzamla = new FokSzamla();
			fokSzamla.setFokszam(rs.getString("fokszam"));
			fokSzamla.setMegnevezes(rs.getString("megnevezes"));
			fokSzamla.setOsszesito(rs.getBoolean("osszesito"));

			return fokSzamla;
		}
	}
}
