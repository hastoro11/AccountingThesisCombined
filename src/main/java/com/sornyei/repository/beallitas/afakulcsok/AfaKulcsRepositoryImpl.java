package com.sornyei.repository.beallitas.afakulcsok;

import com.sornyei.model.AfaKulcs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by gaborsornyei on 14/08/15.
 */
@Repository
public class AfaKulcsRepositoryImpl implements AfaKulcsRepository {

	private NamedParameterJdbcTemplate jdbcTemplate;
	private DataSource dataSource;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	public List<AfaKulcs> findAll() throws DataAccessException{
		String sql = "SELECT * FROM afakulcsok";

		return jdbcTemplate.query(sql, new AfaKulcsRowMapper());
	}

	public AfaKulcs findById(int id) throws DataAccessException{
		String sql = "SELECT * FROM afakulcsok WHERE id=:id";
		SqlParameterSource parameterSource = new MapSqlParameterSource("id", id);

		return jdbcTemplate.queryForObject(sql, parameterSource, new AfaKulcsRowMapper());
	}

	public AfaKulcs update(AfaKulcs afaKulcs) throws DataAccessException{
		String sql = "UPDATE afakulcsok SET tipus=:tipus, kulcs=:kulcs, fokszam=:fokszam, megnevezes=:megnevezes WHERE id=:id";
		SqlParameterSource parameterSource = new BeanPropertySqlParameterSource(afaKulcs);

		if (jdbcTemplate.update(sql, parameterSource) == 1)
			return afaKulcs;
		else
			return null;
	}

	public AfaKulcs create(AfaKulcs afaKulcs) throws DataAccessException{
		String sql = "INSERT INTO afakulcsok(tipus, kulcs, fokszam, megnevezes) " +
				"VALUES(:tipus, :kulcs, :fokszam, :megnevezes)";
		SqlParameterSource parameterSource = new BeanPropertySqlParameterSource(afaKulcs);
		KeyHolder keyHolder = new GeneratedKeyHolder();

		if (jdbcTemplate.update(sql, parameterSource, keyHolder) == 1) {
			afaKulcs.setId(keyHolder.getKey().intValue());
			return afaKulcs;
		} else
			return null;
	}

	public boolean delete(int id) throws DataAccessException{
		String sql = "DELETE FROM afakulcsok WHERE id=:id";
		SqlParameterSource parameterSource = new MapSqlParameterSource("id", id);

		return jdbcTemplate.update(sql, parameterSource) == 1;
	}

	class AfaKulcsRowMapper implements RowMapper<AfaKulcs> {

		public AfaKulcs mapRow(ResultSet rs, int rowNum) throws SQLException {
			AfaKulcs afaKulcs = new AfaKulcs();
			afaKulcs.setId(rs.getInt("id"));
			afaKulcs.setTipus(rs.getString("tipus"));
			afaKulcs.setKulcs(rs.getInt("kulcs"));
			afaKulcs.setFokszam(rs.getString("fokszam"));
			afaKulcs.setMegnevezes(rs.getString("megnevezes"));

			return afaKulcs;
		}
	}
}
