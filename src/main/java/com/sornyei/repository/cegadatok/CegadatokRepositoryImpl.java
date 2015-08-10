package com.sornyei.repository.cegadatok;

import com.sornyei.model.Cegadatok;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by gaborsornyei on 10/08/15.
 */
@Repository
public class CegadatokRepositoryImpl implements CegadatokRepository {

	private NamedParameterJdbcTemplate jdbcTemplate;
	private DataSource dataSource;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	public Cegadatok find() {
		String sql = "SELECT * FROM cegadatok";
		List<Cegadatok> cegadatokList = jdbcTemplate.query(sql, new CegadatokRowMapper());
		return cegadatokList.get(0);
	}

	public Cegadatok update(Cegadatok cegadatok) {
		String sql = "UPDATE cegadatok SET cegnev=:cegnev, " +
				"cim=:cim, adoszam=:adoszam, cegjegyzekszam=:cegjegyzekszam, " +
				"bankszamlaszam=:bankszamlaszam, kshszam=:kshszam WHERE id=:id";
		BeanPropertySqlParameterSource parameterSource = new BeanPropertySqlParameterSource(cegadatok);

		if (jdbcTemplate.update(sql, parameterSource) == 1)
			return cegadatok;
		else return null;
	}

	class CegadatokRowMapper implements RowMapper<Cegadatok> {

		public Cegadatok mapRow(ResultSet rs, int rowNum) throws SQLException {
			Cegadatok cegadatok = new Cegadatok();
			cegadatok.setId(rs.getInt("id"));
			cegadatok.setCegnev(rs.getString("cegnev"));
			cegadatok.setCim(rs.getString("cim"));
			cegadatok.setAdoszam(rs.getString("adoszam"));
			cegadatok.setCegjegyzekszam(rs.getString("cegjegyzekszam"));
			cegadatok.setBankszamlaszam(rs.getString("bankszamlaszam"));
			cegadatok.setKshszam(rs.getString("kshszam"));

			return cegadatok;
		}
	}
}
