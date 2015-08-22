package com.sornyei.repository.beallitas.naplok;

import com.sornyei.model.Naplo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by gaborsornyei on 11/08/15.
 */
@Repository
public class NaploRepositoryImpl implements NaploRepository {

	private NamedParameterJdbcTemplate jdbcTemplate;
	private DataSource dataSource;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	public List<Naplo> findAll() {
		String sql = "SELECT * FROM naplok";
		return jdbcTemplate.query(sql, new NaploRowMapeer());
	}

	class NaploRowMapeer implements RowMapper<Naplo> {

		public Naplo mapRow(ResultSet rs, int rowNum) throws SQLException {
			Naplo naplo = new Naplo();
			naplo.setId(rs.getInt("id"));
			naplo.setMegnevezes(rs.getString("megnevezes"));
			naplo.setJel(rs.getString("jel"));
			naplo.setFokszam(rs.getString("fokszam"));

			return naplo;
		}
	}
}
