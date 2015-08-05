package com.sornyei.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by gaborsornyei on 05/08/15.
 */
@Controller
public class HomeController {

	@RequestMapping(value = "/home")
	public String home(Model model) {
		model.addAttribute("message", "Hello message");

		return "home";
	}
}
