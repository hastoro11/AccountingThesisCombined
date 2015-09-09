package com.sornyei.repository.lista;

import com.sornyei.model.AfaKulcs;
import com.sornyei.model.lista.AfaTetel;
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
 * Created by gaborsornyei on 15. 09. 05..
 */
@Repository
public class AfaListaRepositoryImpl implements AfaListaRepository{

	private DataSource dataSource;
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	public List<AfaKulcs> getAfaKulcsByTipus(String tipus) throws DataAccessException{
		String sql = "SELECT * FROM afakulcsok WHERE tipus=:tipus";
		MapSqlParameterSource parameterSource = new MapSqlParameterSource("tipus", tipus);

		return jdbcTemplate.query(sql, parameterSource, new RowMapper<AfaKulcs>() {
			@Override
			public AfaKulcs mapRow(ResultSet rs, int rowNum) throws SQLException {
				AfaKulcs afaKulcs = new AfaKulcs();
				afaKulcs.setId(rs.getInt("id"));
				afaKulcs.setTipus(rs.getString("tipus"));
				afaKulcs.setKulcs(rs.getInt("kulcs"));
				afaKulcs.setFokszam(rs.getString("fokszam"));
				afaKulcs.setMegnevezes(rs.getString("megnevezes"));

				return afaKulcs;
			}
		});
	}

	public List<AfaTetel> getAfaTetelByDateAndAfaKulcs(Date from, Date to, int afaKulcsId) throws DataAccessException{
		String sql = "SELECT teljdatum, naplokod, bizszam, partnerek.nev, partnerek.adoszam, afasor.megnevezes, " +
				"fizmodok.megnevezes as fizmod, bruttoosszeg, nettoosszeg, afaosszeg, afakulcsid FROM afasor afasor " +
				"JOIN partnerek partnerek ON afasor.partnerid=partnerek.id " +
				"JOIN fizmodok fizmodok ON afasor.fizmodid=fizmodok.id " +
				"WHERE teljdatum>=:from AND teljdatum<=:to " +
				"AND afakulcsid=:afaKulcsId";
		MapSqlParameterSource parameterSource = new MapSqlParameterSource();
		parameterSource.addValue("from", from);
		parameterSource.addValue("to", to);
		parameterSource.addValue("afaKulcsId", afaKulcsId);

		return jdbcTemplate.query(sql, parameterSource, new AfaTetelRowMapper());
	}

	class AfaTetelRowMapper implements RowMapper<AfaTetel> {

		@Override
		public AfaTetel mapRow(ResultSet rs, int rowNum) throws SQLException {
			AfaTetel afaTetel = new AfaTetel();

			afaTetel.setTeljDatum(rs.getDate("teljdatum"));
			afaTetel.setNaploKod(rs.getString("naplokod"));
			afaTetel.setBizSzam(rs.getString("bizszam"));
			afaTetel.setNev(rs.getString("nev"));
			afaTetel.setAdoszam(rs.getString("adoszam"));
			afaTetel.setMegnevezes(rs.getString("megnevezes"));
			afaTetel.setFizmod(rs.getString("fizmod"));
			afaTetel.setBruttoOsszeg(rs.getInt("bruttoosszeg"));
			afaTetel.setNettoOsszeg(rs.getInt("nettoosszeg"));
			afaTetel.setAfaOsszeg(rs.getInt("afaosszeg"));
			afaTetel.setAfaKulcsId(rs.getInt("afakulcsid"));

			return afaTetel;
		}
	}
}
