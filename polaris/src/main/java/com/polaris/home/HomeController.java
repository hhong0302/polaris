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
import org.springframework.web.bind.annotation.ResponseBody;

import com.polaris.home.command.SearchCommand;
import com.polaris.home.command.SpCommand;
import com.polaris.home.dto.BookDTO;
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
	
	@ResponseBody
	@RequestMapping(value = "/mainHotController")
	public BookDTO ajaxTest() throws Exception {

		BookDTO dto = new BookDTO();
		dto.setAuthor("asdsa");
		dto.setBookcode("fsdfd");
		return dto;
	}
	
	@RequestMapping(value = "search")
	public String search(Model model) {
	    logger.info("method [" + Thread.currentThread().getStackTrace()[1].getMethodName() + "]");


	    command = new SearchCommand();
	    command.execute(model);
	    model.addAttribute("searchType", "search");
	    return "search";
	}

	@RequestMapping(value = "totalsearch")
	public String totalsearch(Model model) {
	    logger.info("method [" + Thread.currentThread().getStackTrace()[1].getMethodName() + "]");

	    command = new SearchCommand();
	    command.execute(model);
	    model.addAttribute("searchType", "totalsearch");
	    	return "search"; 

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
