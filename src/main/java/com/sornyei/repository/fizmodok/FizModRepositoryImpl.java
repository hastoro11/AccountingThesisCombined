package com.sornyei.repository.fizmodok;

import com.sornyei.model.FizMod;
import org.springframework.beans.factory.annotation.Autowired;
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
 * Created by gaborsornyei on 13/08/15.
 */
@Repository
public class FizModRepositoryImpl implements FizModRepository {

	private DataSource dataSource;
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	public List<FizMod> findAll() {
		String sql = "SELECT * FROM fizmodok";
		return jdbcTemplate.query(sql, new FizModRowMapper());
	}

	public FizMod findById(int id) {
		String sql = "SELECT * FROM fizmodok WHERE id=:id";
		SqlParameterSource parameterSource = new MapSqlParameterSource("id", id);
		return jdbcTemplate.queryForObject(sql, parameterSource, new FizModRowMapper());
	}

	public FizMod update(FizMod fizMod) {
		String sql = "UPDATE fizmodok SET megnevezes=:megnevezes, fizhatarido=:fizhatarido, " +
				"torolheto=:torolheto WHERE id=:id";
		BeanPropertySqlParameterSource parameterSource = new BeanPropertySqlParameterSource(fizMod);

		if (jdbcTemplate.update(sql, parameterSource) == 1) {
			return fizMod;
		} else {
			return null;
		}
	}

	public FizMod create(FizMod fizMod) {
		String sql = "INSERT INTO fizmodok(megnevezes, fizhatarido, torolheto) " +
				"VALUES(:megnevezes, :fizhatarido, :torolheto)";
		BeanPropertySqlParameterSource parameterSource = new BeanPropertySqlParameterSource(fizMod);
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(sql, parameterSource, keyHolder);
		fizMod.setId(keyHolder.getKey().intValue());

		return fizMod;
	}

	public boolean delete(int id) {
		String sql = "DELETE FROM fizmodok WHERE id=:id AND torolheto=1";
		SqlParameterSource parameterSource = new MapSqlParameterSource("id", id);
		return jdbcTemplate.update(sql, parameterSource) == 1;
	}

	class FizModRowMapper implements RowMapper<FizMod> {

		public FizMod mapRow(ResultSet rs, int rowNum) throws SQLException {
			FizMod fizMod = new FizMod();
			fizMod.setId(rs.getInt("id"));
			fizMod.setMegnevezes(rs.getString("megnevezes"));
			fizMod.setFizhatarido(rs.getInt("fizhatarido"));
			fizMod.setTorolheto(rs.getBoolean("torolheto"));

			return fizMod;
		}
	}
}
