package com.sornyei.service;

import com.sornyei.model.User;
import org.springframework.dao.DataAccessException;

/**
 * Created by gaborsornyei on 15. 09. 29..
 */
public interface UserService {
	User getUserByEmailAndPassword(String email, String password) throws DataAccessException;
}
