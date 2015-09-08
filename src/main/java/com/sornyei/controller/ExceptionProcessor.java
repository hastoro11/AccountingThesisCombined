package com.sornyei.controller;

import com.sornyei.model.*;
import com.sornyei.model.Error;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * Created by gaborsornyei on 15. 09. 08..
 */
@ControllerAdvice
public class ExceptionProcessor {

	@ExceptionHandler(DataAccessException.class)
	public ResponseEntity<Error> exceptionHandler() {
		Error error = new Error();
		error.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.value());
		error.setMessage("Szerver hiba");
		return new ResponseEntity<Error>(error, HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
