package com.sornyei.repository;

import com.sornyei.model.Partner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
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
