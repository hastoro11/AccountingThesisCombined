package com.sornyei.service;

import com.sornyei.model.User;
import com.sornyei.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

/**
 * Created by gaborsornyei on 15. 09. 29..
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	public User getUserByEmailAndPassword(String email, String password) throws DataAccessException {
		return userRepository.getUserByEmailAndPassword(email, password);
	}
}
