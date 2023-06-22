package com.polaris.home;

import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.polaris.home.command.DetailCommand;
import com.polaris.home.command.HomeListCommand;
import com.polaris.home.command.IdCheckCommand;
import com.polaris.home.command.MyCommand;
import com.polaris.home.command.LoginOkCommand;
import com.polaris.home.command.OrderSearchCommand;
import com.polaris.home.command.RegisterCommand;
import com.polaris.home.command.SearchCommand;
import com.polaris.home.command.SpCommand;
import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookDTO;
import com.polaris.home.util.Static;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
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

	//home
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		SpCommand command = new HomeListCommand();
		command.execute(model);
		
		return "home";
	}
	
	//main 인기/최신/대여순
	@ResponseBody
	@RequestMapping(value = "/mainHotController")
	public void mainHotController(HttpServletRequest req,HttpServletResponse res) throws Exception {
		PolarisDAO dao = new PolarisDAO();
		String name = req.getParameter("name");
		List<BookDTO> dto = (List<BookDTO>) dao.hg_hotList(name);
		PrintWriter out = res.getWriter();
		String gson = new Gson().toJson(dto);
		out.println(gson);
		out.close();
	}
	
	//rightbox 반납도서 체크
	@ResponseBody
	@RequestMapping(value = "/rightboxLoanController")
	public void rightboxLoanController(HttpServletRequest req,HttpServletResponse res) throws Exception
	{
		
	}
	
	//리뷰 내역
	@ResponseBody
	@RequestMapping(value = "/reviewController")
	public void reviewController(HttpServletRequest req,HttpServletResponse res) throws Exception{
		PolarisDAO dao = new PolarisDAO();
		String bookcode = req.getParameter("bookcode");
		String rvType = req.getParameter("reviewType");
		//List <ReviewDTO> dto = dao.hg_reviewList(bookcode,rvType);
		List <BookDTO> dto = dao.hg_sample();
		PrintWriter out = res.getWriter();
		String gson = new Gson().toJson(dto);
		out.println(gson);
		out.close();
	}
	
	//리뷰 리스트
	@ResponseBody
	@RequestMapping(value = "/reviewListController")
	public void reviewListController(HttpServletRequest req,HttpServletResponse res) throws Exception{
		PolarisDAO dao = new PolarisDAO();
		int listnum = 5*Integer.parseInt(req.getParameter("listnum"));
		List <BookDTO> dto = dao.hg_reviewList(listnum);
		PrintWriter out = res.getWriter();
		String gson = new Gson().toJson(dto);
		out.println(gson);
		out.close();
	}
	
	//리뷰 좋아요
	@ResponseBody
	@RequestMapping(value = "/reviewLikeController")
	public void reviewLikeController(HttpServletRequest req,HttpServletResponse res) throws Exception{
		HttpSession session = req.getSession();
		
		PrintWriter out = res.getWriter();
		out.println(0);
		out.close();
	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search(HttpServletRequest request,Model model) {
		String query = request.getParameter("query");
		model.addAttribute("request", request);
		model.addAttribute("searchresult", query);

	    command = new SearchCommand();
	    command.execute(model);
	    model.addAttribute("searchType", "search");
	    return "search";
	}

	@RequestMapping(value = "totalsearch")
	public String totalsearch(HttpServletRequest request,Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("searchresult", "전체");

	    command = new SearchCommand();
	    command.execute(model);
	    model.addAttribute("searchType", "totalsearch");
	    	return "search"; 
	}
	
	@RequestMapping(value = "genresearch", method = RequestMethod.GET)
	public String genresearch(HttpServletRequest request, Model model) {
		String genre = request.getParameter("genre");
		model.addAttribute("request", request);
		model.addAttribute("searchresult", genre);

	    command = new SearchCommand();
	    command.execute(model);
	    model.addAttribute("searchType", "genresearch");
	    
	    return "search";
	}
	
	@RequestMapping(value = "ordersearch", method = RequestMethod.GET)
	public String ordersearch(HttpServletRequest request, Model model) {
		String order = request.getParameter("order");
		model.addAttribute("request", request);
		model.addAttribute("searchresult", order);

	    command = new OrderSearchCommand();
	    command.execute(model);
	    model.addAttribute("searchType", "ordersearch");
	    
	    return "search";
	}

	
	
	@RequestMapping(value = "memlist", method = RequestMethod.GET)
	public String detail(HttpServletRequest request, Model model) {
        
		String memlist = request.getParameter("memlist");
		model.addAttribute("request", request);
        model.addAttribute("memlist", memlist);
        
        command = new MyCommand();
        command.execute(model);
                
		return "detail";	// detail.jsp 호출!!!
	}
	
	@RequestMapping(value = "loanList", method = RequestMethod.GET)
	public String loanlist(HttpServletRequest request, Model model) {
        
		String loanlist = request.getParameter("loanlist");
		model.addAttribute("request", request);
        model.addAttribute("loanlist", loanlist);
        
        command = new MyCommand();
        command.execute(model);
                
		return "detail";	// detail.jsp 호출!!!
	}
	
	@RequestMapping(value = "interest", method = RequestMethod.GET)
	public String interest(HttpServletRequest request, Model model) {
        
		String interest = request.getParameter("interest");
		model.addAttribute("request", request);
        model.addAttribute("interest", interest);
        
        command = new MyCommand();
        command.execute(model);
                
		return "detail";	// detail.jsp 호출!!!
	}

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String bookinfo(HttpServletRequest request, Model model) {
		String bookcode = request.getParameter("bookinfo");
		model.addAttribute("request", request);
		model.addAttribute("bookcode", bookcode);

	    command = new DetailCommand();
	    command.execute(model);
	    
	    return "detail";
	}
	
	
	@RequestMapping(value="mypage")
	public String mypage(HttpServletRequest request, Model model) {
		String bookloan = request.getParameter("bookloan");
		model.addAttribute("bookloan", bookloan);
		
		return "mypage";
	}
	
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String bookloan(HttpServletRequest request, Model model) {
		String bookloan = request.getParameter("bookloan");
		model.addAttribute("request", request);
		model.addAttribute("bookloan", bookloan);
		
		command = new MyCommand();
		command.execute(model);
		
		return "mypage";	// detail.jsp 호출!!!
	}
	
	@RequestMapping(value = "register")
	public String register(Model model) {
		return "register";	// register.jsp 호출!!!
	}
	@RequestMapping(value = "registerok")
	public String registerok(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new RegisterCommand();
		command.execute(model);
		
		return "redirect:/";
		
	}
	@RequestMapping("/idcheck")
		public String idcheck(HttpServletRequest request, Model model){
			model.addAttribute("request", request);
			command = new IdCheckCommand();
			command.execute(model);
			return "check";
		}
	
	@RequestMapping(value = "login")
	public String login(Model model) {
		return "login";	// login.jsp 호출!!!
	}

	@RequestMapping("/loginok")
	public String loginok(HttpServletRequest request, Model model){
		model.addAttribute("request", request);
//		command = new LoginOkCommand();
//		command.execute(model);
		PolarisDAO dao = new PolarisDAO();
		int rs = dao.loginOk(request.getParameter("userid"), request.getParameter("userpass"));
		if(rs == 0) {
			return "redirect:login";
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("userid", request.getParameter("userid"));
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = "member")
	public String member(Model model) {
		return "member";	// member.jsp 호출!!!
	}
}
