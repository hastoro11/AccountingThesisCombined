package com.sornyei.repository.beallitas.partnerek;

import com.sornyei.model.Partner;
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
import java.util.List;

/**
 * Created by gaborsornyei on 05/08/15.
 */
@Repository
public class PartnerRepositoryImpl implements PartnerRepository {

	final static Logger logger = Logger.getLogger(PartnerRepository.class);
	private NamedParameterJdbcTemplate jdbcTemplate;
	private DataSource dataSource;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	public List<Partner> findAll() {
		String sql = "SELECT * FROM partnerek";
		return jdbcTemplate.query(sql, new PartnerRowMapper());
	}

	public Partner findById(int id) {
		String sql = "SELECT * FROM partnerek WHERE id=:id";
		MapSqlParameterSource parameterSource = new MapSqlParameterSource("id", id);
		return jdbcTemplate.queryForObject(sql, parameterSource, new PartnerRowMapper());
	}

	public List<Partner> findByTipus(String tipus) {
		String sql = "";
		if (tipus.equals("S"))
			sql = "SELECT * FROM partnerek WHERE szallito=true";
		else if (tipus.equals("V"))
			sql = "SELECT * FROM partnerek WHERE vevo=true";

		return jdbcTemplate.query(sql, new PartnerRowMapper());
	}

	public Partner update(Partner partner) {
		String sql = "UPDATE partnerek SET nev=:nev, adoszam=:adoszam, " +
				"cim=:cim, szallito=:szallito, vevo=:vevo WHERE id=:id";
		BeanPropertySqlParameterSource parameterSource = new BeanPropertySqlParameterSource(partner);
		jdbcTemplate.update(sql, parameterSource);

		return partner;
	}

	public Partner create(Partner partner) {
		String sql = "INSERT INTO partnerek(nev, adoszam, cim, szallito, vevo) " +
				"VALUES(:nev, :adoszam, :cim, :szallito, :vevo)";
		BeanPropertySqlParameterSource parameterSource = new BeanPropertySqlParameterSource(partner);
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(sql, parameterSource, keyHolder);
		partner.setId(keyHolder.getKey().intValue());

		return partner;
	}

	public boolean delete(int id) {
		String sql = "DELETE FROM partnerek WHERE id=:id";
		SqlParameterSource parameterSource = new MapSqlParameterSource("id", id);
		return jdbcTemplate.update(sql, parameterSource) == 1;
	}

	class PartnerRowMapper implements RowMapper<Partner> {

		public Partner mapRow(ResultSet rs, int rowNum) throws SQLException {
			Partner partner = new Partner();
			partner.setId(rs.getInt("id"));
			partner.setNev(rs.getString("nev"));
			partner.setAdoszam(rs.getString("adoszam"));
			partner.setCim(rs.getString("cim"));
			partner.setSzallito(rs.getBoolean("szallito"));
			partner.setVevo(rs.getBoolean("vevo"));

			return partner;
		}
	}
}
