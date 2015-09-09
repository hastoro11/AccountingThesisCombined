package com.sornyei.repository.lista;

import com.sornyei.model.lista.KartonTetel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 04..
 */
@Repository
public class KartonListaRepositoryImpl implements KartonListaRepository {

	private DataSource dataSource;
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	@Override
	public List<KartonTetel> getKartonTetelList(Date from, Date to, String fokszam) throws DataAccessException{
		String sql = "SELECT teljdatum, bizszam, megnevezes, tkjelleg, osszeg, naplokod FROM kontir " +
				"WHERE (teljdatum>=:from AND teljdatum <= :to) AND fokszam=:fokszam " +
				"order by teljdatum, naplokod";
		MapSqlParameterSource parameterSource = new MapSqlParameterSource();
		parameterSource.addValue("from", from);
		parameterSource.addValue("to", to);
		parameterSource.addValue("fokszam", fokszam);


		return jdbcTemplate.query(sql, parameterSource, new KartonTetelRowMapper());
	}

	class KartonTetelRowMapper implements RowMapper<KartonTetel> {

		@Override
		public KartonTetel mapRow(ResultSet rs, int rowNum) throws SQLException {
			KartonTetel kartonTetel = new KartonTetel();

			kartonTetel.setTeljDatum(rs.getDate("teljdatum"));
			kartonTetel.setBizSzam(rs.getString("bizszam"));
			kartonTetel.setMegnevezes(rs.getString("megnevezes"));
			kartonTetel.setTkJelleg(rs.getString("tkjelleg"));
			kartonTetel.setOsszeg(rs.getInt("osszeg"));
			kartonTetel.setNaploKod(rs.getString("naplokod"));

			if (kartonTetel.getTkJelleg().equals("T"))
				kartonTetel.setTartOsszeg(kartonTetel.getOsszeg());
			else if (kartonTetel.getTkJelleg().equals("K"))
				kartonTetel.setKovOsszeg(kartonTetel.getOsszeg());

			return kartonTetel;
		}
	}
}
