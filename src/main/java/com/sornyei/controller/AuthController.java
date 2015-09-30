package com.sornyei.controller;

import com.sornyei.model.User;
import com.sornyei.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by gaborsornyei on 15. 09. 29..
 */
@RestController
public class AuthController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "auth/getcredentials", method = RequestMethod.POST)
	public ResponseEntity<User> getUserByEmailAndPassword(@RequestBody User user) {
		User checkedUser = userService.getUserByEmailAndPassword(user.getEmail(), user.getPassword());
		if (checkedUser != null) {
			return new ResponseEntity<User>(checkedUser, HttpStatus.OK);
		} else {
			return new ResponseEntity<User>(HttpStatus.UNAUTHORIZED);
		}
	}
}
