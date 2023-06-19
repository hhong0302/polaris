package com.polaris.home;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.polaris.home.command.SpCommand;
import com.polaris.home.util.Static;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//모든 command가 갖고 있는 인터페이스 타입을 선언
		SpCommand command;
			
		//jdbc Spring template
		public JdbcTemplate template;
		
		@Autowired
		public void setTemplate(JdbcTemplate template)
		{
			this.template = template;
			Static.template=this.template;
		}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
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
