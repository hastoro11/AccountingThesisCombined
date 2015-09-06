package com.sornyei.repository.lista;

import com.sornyei.model.lista.PartnerTetel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 06..
 */
@Repository
public class PartnerTetelRepositoryImpl implements PartnerTetelRepository {

	private DataSource dataSource;
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	public List<PartnerTetel> getPartnerTetelByPartnerId(int partnerId) {
		String sql = "SELECT naplokod, partnerek.nev, bizszam, partnersor.megnevezes, eseddatum, " +
				"teljdatum, kifizdatum, tkjelleg, osszeg, kifizosszeg " +
				"FROM partnersor partnersor " +
				"JOIN partnerek partnerek ON partnersor.partnerid=partnerek.id " +
				"JOIN fizmodok fizmodok ON fizmodok.id=partnersor.fizmodid " +
				"WHERE partnerid=:partnerId " +
				"ORDER BY bizszam, nev, eseddatum";
		MapSqlParameterSource parameterSource = new MapSqlParameterSource("partnerId", partnerId);
		return jdbcTemplate.query(sql, parameterSource, new PartnerTetelRowMapper());
	}

	class PartnerTetelRowMapper implements RowMapper<PartnerTetel> {

		@Override
		public PartnerTetel mapRow(ResultSet rs, int rowNum) throws SQLException {
			PartnerTetel partnerTetel = new PartnerTetel();
			partnerTetel.setNaploKod(rs.getString("naplokod"));
			partnerTetel.setNev(rs.getString("nev"));
			partnerTetel.setBizSzam(rs.getString("bizszam"));
			partnerTetel.setMegnevezes(rs.getString("megnevezes"));
			partnerTetel.setEsedDatum(rs.getDate("eseddatum"));
			partnerTetel.setTeljDatum(rs.getDate("teljdatum"));
			partnerTetel.setKifizDatum(rs.getDate("kifizdatum"));
			partnerTetel.setTkJelleg(rs.getString("tkjelleg"));
			partnerTetel.setOsszeg(rs.getInt("osszeg"));
			partnerTetel.setKifizOsszeg(rs.getInt("kifizosszeg"));

			if (partnerTetel.getTkJelleg().equals("T")) {
				partnerTetel.setTartOsszeg(partnerTetel.getOsszeg());
				partnerTetel.setKovOsszeg(partnerTetel.getKifizOsszeg());
				partnerTetel.setEgyenleg(partnerTetel.getTartOsszeg() - partnerTetel.getKovOsszeg());
			} else if (partnerTetel.getTkJelleg().equals("K")) {
				partnerTetel.setKovOsszeg(partnerTetel.getOsszeg());
				partnerTetel.setTartOsszeg(partnerTetel.getKifizOsszeg());
				partnerTetel.setEgyenleg(partnerTetel.getKovOsszeg() - partnerTetel.getTartOsszeg());
			}

			return partnerTetel;
		}
	}
}
