package com.polaris.home;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "search")
	public String search(Model model) {
		logger.info("method [" + Thread.currentThread().getStackTrace()[1].getMethodName() + "]");
		return "search";	// search.jsp 호출!!!
	}
	
	@RequestMapping(value = "detail")
	public String detail(Model model) {
		logger.info("method [" + Thread.currentThread().getStackTrace()[1].getMethodName() + "]");
		return "detail";	// detail.jsp 호출!!!
	}
	
	@RequestMapping(value = "register")
	public String register(Model model) {
		logger.info("method [" + Thread.currentThread().getStackTrace()[1].getMethodName() + "]");
		return "register";	// register.jsp 호출!!!
	}
	
	@RequestMapping(value = "login")
	public String login(Model model) {
		logger.info("method [" + Thread.currentThread().getStackTrace()[1].getMethodName() + "]");
		return "login";	// login.jsp 호출!!!
	}
}
