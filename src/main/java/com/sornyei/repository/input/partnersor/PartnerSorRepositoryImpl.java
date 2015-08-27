package com.sornyei.repository.input.partnersor;

import com.sornyei.model.input.PartnerSor;
import org.apache.log4j.Logger;
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
import java.util.ArrayList;
import java.util.List;

/**
 * Created by gaborsornyei on 22/08/15.
 */
@Repository
public class PartnerSorRepositoryImpl implements PartnerSorRepository {

	final static Logger logger = Logger.getLogger(PartnerSorRepository.class);

	private DataSource dataSource;
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	@Override
	public PartnerSor save(PartnerSor partnerSor) {
		String sql = "INSERT INTO partnersor(partnerid, naplokod, naplotipus, naplosorszam, bizszam," +
				"teljdatum, kialldatum, eseddatum, kifizdatum, fizmodid, tkjelleg, osszeg, kifizosszeg)" +
				"VALUES (:partnerId, :naploKod, :naploTipus, :naploSorszam, :bizszam," +
				":teljDatum, :kiallDatum, :esedDatum, :kifizDatum, :fizmodId, :tkJelleg, :osszeg, :kifizOsszeg)";

		BeanPropertySqlParameterSource parameterSource = new BeanPropertySqlParameterSource(partnerSor);
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(sql, parameterSource, keyHolder);
		partnerSor.setId(keyHolder.getKey().intValue());

		return partnerSor;
	}

	@Override
	public List<String> getKifizetetlenBizSzamok(int partnerId) {
		String sql = "SELECT DISTINCT bizszam FROM partnersor WHERE partnerid=:partnerId AND kifizosszeg=0";
		SqlParameterSource parameterSource = new MapSqlParameterSource("partnerId", partnerId);
		return jdbcTemplate.query(sql, parameterSource, new RowMapper<String>() {
			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getString("bizszam");
			}
		});
	}

	@Override
	public PartnerSor getPartnerSorByPartnerIdAndBizszam(int partnerId, String bizszam) {
		String sql = "SELECT * FROM partnersor WHERE partnerid=:partnerId AND bizszam=:bizszam";
		MapSqlParameterSource parameterSource = new MapSqlParameterSource();
		parameterSource.addValue("partnerId", partnerId);
		parameterSource.addValue("bizszam", bizszam);

		return jdbcTemplate.queryForObject(sql, parameterSource, new PartnerSorRowMapper());
	}

	class PartnerSorRowMapper implements RowMapper<PartnerSor> {

		@Override
		public PartnerSor mapRow(ResultSet rs, int rowNum) throws SQLException {
			PartnerSor partnerSor = new PartnerSor();
			partnerSor.setId(rs.getInt("id"));
			partnerSor.setPartnerId(rs.getInt("partnerid"));
			partnerSor.setNaploKod(rs.getString("naplokod"));
			partnerSor.setNaploTipus(rs.getString("naplotipus"));
			partnerSor.setNaploSorszam(rs.getInt("naplosorszam"));
			partnerSor.setBizszam(rs.getString("bizszam"));
			partnerSor.setTeljDatum(rs.getDate("teljdatum"));
			partnerSor.setKiallDatum(rs.getDate("kialldatum"));
			partnerSor.setEsedDatum(rs.getDate("eseddatum"));
			partnerSor.setKifizDatum(rs.getDate("kifizdatum"));
			partnerSor.setFizmodId(rs.getInt("fizmodid"));
			partnerSor.setTkJelleg(rs.getString("tkjelleg"));
			partnerSor.setOsszeg(rs.getInt("osszeg"));
			partnerSor.setKifizOsszeg(rs.getInt("kifizosszeg"));

			return partnerSor;
		}
	}
}
