package com.sornyei.repository.lista;

import com.sornyei.model.lista.NaploTetel;
import org.springframework.beans.factory.annotation.Autowired;
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
 * Created by gaborsornyei on 15. 09. 03..
 */
@Repository
public class NaploListaRepositoryImpl implements NaploListaRepository {

	private DataSource dataSource;
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	@Override
	public List<NaploTetel> getNaploTetelListOrderByTeljDatum(Date from, Date to, String tipus) {
		String sql = "SELECT naplokod, teljdatum, fokszam, bizszam, megnevezes, tkjelleg, osszeg FROM kontir " +
				"WHERE (teljdatum >= :from AND teljdatum <= :to) AND naplotipus=:naploTipus ORDER BY teljdatum";
		MapSqlParameterSource parameterSource = new MapSqlParameterSource();
		parameterSource.addValue("from", from);
		parameterSource.addValue("to", to);
		parameterSource.addValue("naploTipus", tipus);

		return jdbcTemplate.query(sql, parameterSource, new NaploTetelRowMapper());
	}

	class NaploTetelRowMapper implements RowMapper<NaploTetel> {

		@Override
		public NaploTetel mapRow(ResultSet rs, int rowNum) throws SQLException {
			NaploTetel naploTetel = new NaploTetel();

			naploTetel.setNaploKod(rs.getString("naplokod"));
			naploTetel.setTeljDatum(rs.getDate("teljdatum"));
			naploTetel.setFokSzam(rs.getString("fokszam"));
			naploTetel.setBizSzam(rs.getString("bizszam"));
			naploTetel.setMegnevezes(rs.getString("megnevezes"));
			naploTetel.setTkJelleg(rs.getString("tkjelleg"));
			naploTetel.setOsszeg(rs.getInt("osszeg"));

			if (naploTetel.getTkJelleg().equals("T"))
				naploTetel.setTartozik(naploTetel.getOsszeg());
			else if (naploTetel.getTkJelleg().equals("K"))
				naploTetel.setKovetel(naploTetel.getOsszeg());

			return naploTetel;
		}
	}
}
