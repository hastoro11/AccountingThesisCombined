package com.sornyei.model;

import org.springframework.stereotype.Component;

/**
 * Created by gaborsornyei on 15. 09. 08..
 */
@Component
public class Error {
	private int status;
	private String message;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
