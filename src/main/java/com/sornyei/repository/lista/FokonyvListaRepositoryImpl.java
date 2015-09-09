package com.sornyei.repository.lista;

import com.sornyei.model.lista.FokonyvLista;
import com.sornyei.model.lista.FokonyvTetel;
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
public class FokonyvListaRepositoryImpl implements FokonyListaRepository {

	private DataSource dataSource;
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	@Override
	public List<FokonyvTetel> getFokonyvTetelList(Date fromDate, Date toDate, String fromFokszam, String toFokszam) throws
			DataAccessException{
		String sql = "SELECT fokszam, megnevezes, osszesito, " +
				"(SELECT SUM(osszeg) FROM kontir k WHERE tkjelleg='T' AND k.fokszam=s.fokszam " +
				"AND k.teljdatum >= :fromDate AND k.teljdatum <= :toDate) AS halmTartForgalom, " +
				"(select SUM(osszeg) FROM kontir k WHERE tkjelleg='K' AND k.fokszam=s.fokszam " +
				"AND k.teljdatum >= :fromDate AND k.teljdatum <= :toDate) AS halmKovForgalom " +
				"FROM szamlatukor s " +
				"WHERE s.fokszam >= :fromFokszam AND s.fokszam <= :toFokszam";

		MapSqlParameterSource parameterSource = new MapSqlParameterSource();
		parameterSource.addValue("fromDate", fromDate);
		parameterSource.addValue("toDate", toDate);
		parameterSource.addValue("fromFokszam", fromFokszam);
		parameterSource.addValue("toFokszam", toFokszam);

		return jdbcTemplate.query(sql, parameterSource, new FokonyvTetelRowMapper());
	}

	@Override
	public FokonyvTetel getFokonyvTetelByLike(Date fromDate, Date toDate, String fokszam) throws DataAccessException{
		String sql = "SELECT fokszam, megnevezes, osszesito, " +
				"(SELECT SUM(osszeg) FROM kontir k WHERE tkjelleg='T' AND k.fokszam LIKE :fokszam " +
				"AND k.teljdatum >= :fromDate AND k.teljdatum <= :toDate) AS halmTartForgalom, " +
				"(select SUM(osszeg) FROM kontir k WHERE tkjelleg='K' AND k.fokszam LIKE :fokszam " +
				"AND k.teljdatum >= :fromDate AND k.teljdatum <= :toDate) AS halmKovForgalom " +
				"FROM szamlatukor s " +
				"WHERE s.fokszam LIKE :fokszam LIMIT 1";

		MapSqlParameterSource parameterSource = new MapSqlParameterSource();
		parameterSource.addValue("fromDate", fromDate);
		parameterSource.addValue("toDate", toDate);
		parameterSource.addValue("fokszam", fokszam + "%");

		return jdbcTemplate.queryForObject(sql, parameterSource, new FokonyvTetelRowMapper());
	}

	class FokonyvTetelRowMapper implements RowMapper<FokonyvTetel> {

		@Override
		public FokonyvTetel mapRow(ResultSet rs, int rowNum) throws SQLException {
			FokonyvTetel fokonyvTetel = new FokonyvTetel();
			fokonyvTetel.setFokszam(rs.getString("fokszam"));
			fokonyvTetel.setMegnevezes(rs.getString("megnevezes"));
			fokonyvTetel.setHalmTartForgalom(rs.getInt("halmTartForgalom"));
			fokonyvTetel.setHalmKovForgalom(rs.getInt("halmKovForgalom"));
			fokonyvTetel.setOsszesito(rs.getBoolean("osszesito"));

			if (fokonyvTetel.getHalmTartForgalom() > fokonyvTetel.getHalmKovForgalom())
				fokonyvTetel
						.setHalmTartEgyenleg(fokonyvTetel.getHalmTartForgalom() - fokonyvTetel.getHalmKovForgalom());
			else if (fokonyvTetel.getHalmKovForgalom() > fokonyvTetel.getHalmTartForgalom())
				fokonyvTetel.setHalmKovEgyenleg(fokonyvTetel.getHalmKovForgalom() - fokonyvTetel.getHalmTartForgalom());

			return fokonyvTetel;
		}
	}


}
