package com.sornyei.repository;

import com.sornyei.model.User;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by gaborsornyei on 15. 09. 29..
 */
@Repository
public class UserRepositoryImpl implements UserRepository {

	final static Logger logger = Logger.getLogger(UserRepository.class);

	private DataSource dataSource;
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	public User getUserByEmailAndPassword(String email, String password) throws DataAccessException {
		String sql = "SELECT * FROM authority WHERE email=:email and password=:password";
		MapSqlParameterSource parameterSource = new MapSqlParameterSource();
		parameterSource.addValue("email", email);
		parameterSource.addValue("password", password);
		List<User> users = jdbcTemplate.query(sql, parameterSource, new UserRowMapper());

		if (users.size() != 1)
			return null;

		return users.get(0);

	}

	class UserRowMapper implements RowMapper<User> {

		public User mapRow(ResultSet rs, int rowNum) throws SQLException {
			User user = new User();
			user.setId(rs.getInt("id"));
			user.setName(rs.getString("name"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setRole(rs.getString("role"));

			return user;
		}
	}
}
