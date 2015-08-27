package com.sornyei.repository.input.naplosor;

import com.sornyei.model.input.NaploSor;
import com.sornyei.repository.input.CommonRepository;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by gaborsornyei on 22/08/15.
 */
@Repository
public class NaploSorRepositoryImpl implements NaploSorRepository {

	final static Logger logger = Logger.getLogger(NaploSorRepository.class);

	private NamedParameterJdbcTemplate jdbcTemplate;
	private DataSource dataSource;
	@Autowired
	CommonRepository commonRepository;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	public NaploSor save(NaploSor naploSor) {
		int naploSorszam = commonRepository.getNextNaploSorSzam(naploSor.getNaploTipus());
		String naploKod = getNaploKod(naploSor.getNaploTipus(), naploSorszam);
		naploSor.setNaploSorszam(naploSorszam);
		naploSor.setNaploKod(naploKod);

		String sql =
				"INSERT INTO naplosor(naplotipus, naplosorszam, naplokod, teljdatum, " +
						"tkjelleg, fokszam, bizszam, megnevezes, osszeg) " +
						"VALUES(:naploTipus, :naploSorszam, :naploKod, :teljDatum, " +
						":tkJelleg, :fokszam, :bizszam, :megnevezes, :osszeg)";

		KeyHolder keyHolder = new GeneratedKeyHolder();
		BeanPropertySqlParameterSource parameterSource = new BeanPropertySqlParameterSource(naploSor);
		jdbcTemplate.update(sql, parameterSource, keyHolder);

		naploSor.setId(keyHolder.getKey().intValue());

		return naploSor;
	}

	private String getNaploKod(String naploTipus, int naploSorszam) {
		if (naploSorszam < 10) {
			return naploTipus + "0000" + naploSorszam;
		} else if (naploSorszam < 100)
			return naploTipus + "000" + naploSorszam;
		else if (naploSorszam < 1000)
			return naploTipus + "00" + naploSorszam;
		else if (naploSorszam < 10000)
			return naploTipus + "0" + naploSorszam;
		else
			return naploTipus + naploSorszam;
	}


	class NaploSorRowMapper implements RowMapper<NaploSor> {

		public NaploSor mapRow(ResultSet rs, int rowNum) throws SQLException {
			NaploSor naploSor = new NaploSor();

			naploSor.setId(rs.getInt("id"));
			naploSor.setNaploTipus(rs.getString("naplotipus"));
			naploSor.setNaploSorszam(rs.getInt("naplosorszam"));
			naploSor.setNaploKod(rs.getString("naplokod"));
			naploSor.setTeljDatum(rs.getDate("teljdatum"));
			naploSor.setTkJelleg(rs.getString("tkjelleg"));
			naploSor.setFokszam(rs.getString("fokszam"));
			naploSor.setBizszam(rs.getString("bizszam"));
			naploSor.setMegnevezes(rs.getString("megnevezes"));
			naploSor.setOsszeg(rs.getInt("osszeg"));

			return naploSor;
		}
	}
}
