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

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		//logger.info("Welcome home! The client locale is {}.", locale);

		//model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "search")
	public String search(Model model) {
		logger.info("method [" + Thread.currentThread().getStackTrace()[1].getMethodName() + "]");
		return "search";	// search.jsp �샇異�!!!
	}
	
	@RequestMapping(value = "detail")
	public String detail(Model model) {
		logger.info("method [" + Thread.currentThread().getStackTrace()[1].getMethodName() + "]");
		return "detail";	// detail.jsp �샇異�!!!
	}
	
	@RequestMapping(value = "mypage")
	public String mypage(Model model) {
		logger.info("method [" + Thread.currentThread().getStackTrace()[1].getMethodName() + "]");
		return "mypage";	// detail.jsp �샇異�!!!
	}
	
}
