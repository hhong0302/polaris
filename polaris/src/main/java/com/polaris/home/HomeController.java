package com.polaris.home;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;
import com.polaris.home.command.AutoReturnCommand;
import com.polaris.home.command.DetailCommand;
import com.polaris.home.command.DetailLoanCommand;
import com.polaris.home.command.DetailReviewCommand;
import com.polaris.home.command.DetailSuggestCommand;
import com.polaris.home.command.FindIdCommand;
import com.polaris.home.command.FindPwCommand;
import com.polaris.home.command.HomeListCommand;
import com.polaris.home.command.IdCheckCommand;
import com.polaris.home.command.LikeCommand;
import com.polaris.home.command.MemberListCommand;
import com.polaris.home.command.MenuSearchCommand;
import com.polaris.home.command.MyCommand;
import com.polaris.home.command.OrderSearchCommand;
import com.polaris.home.command.RegisterCommand;
import com.polaris.home.command.ReviewModifyCommand;
import com.polaris.home.command.ReviewWriteCommand;
import com.polaris.home.command.SearchCommand;
import com.polaris.home.command.SpChangeBirthCommand;
import com.polaris.home.command.SpCommand;
import com.polaris.home.command.SpExitCommand;
import com.polaris.home.command.SpUpdatePassCommand;
import com.polaris.home.dao.PolarisDAO;
import com.polaris.home.dto.BookDTO;
import com.polaris.home.dto.BookloanDTO;
import com.polaris.home.dto.InterestDTO;
import com.polaris.home.dto.ReviewDTO;
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
	public String home(Model model) {
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
	public void rightboxLoanController(HttpServletRequest req,HttpServletResponse res,Model model) throws Exception
	{
		PolarisDAO dao = new PolarisDAO();
        HttpSession session = req.getSession();
		List<BookloanDTO> dto = dao.hg_bookLoanDate((String)session.getAttribute("userid"));
		PrintWriter out = res.getWriter();
		String gson = new Gson().toJson(dto);
		out.println(gson);
		out.close();
	}
	
	//리뷰 작성
	@RequestMapping(value = "reviewWriteController")
	public RedirectView reviewWriteController(HttpServletRequest req,Model model,RedirectAttributes attributes) throws Exception{
		model.addAttribute("req", req);
		
		command = new ReviewWriteCommand();
		command.execute(model);
		attributes.addAttribute("bookinfo", req.getParameter("bookcode"));
		return new RedirectView("detail");
	}
	
	//리뷰 수정
	@RequestMapping(value = "reviewModifyController")
	public RedirectView reviewModifyController(HttpServletRequest req,Model model,RedirectAttributes attributes) throws Exception{
		model.addAttribute("req", req);
		
		command = new ReviewModifyCommand();
		command.execute(model);
		attributes.addAttribute("bookinfo", req.getParameter("bookcode"));
		return new RedirectView("detail");
	}
	
	//리뷰 삭제
	@RequestMapping(value = "/reviewDeleteController")
	public void reviewDeleteController(HttpServletRequest req,HttpServletResponse res) throws Exception{
		PolarisDAO dao = new PolarisDAO();
		String bookcode = req.getParameter("bookcode");
        HttpSession session = req.getSession();
        String userid = (String)session.getAttribute("userid");
        dao.hg_reviewDelete(userid,bookcode);
	}
	
	//리뷰 내역(최신순/좋아요 순)
	@ResponseBody
	@RequestMapping(value = "/reviewController")
	public void reviewController(HttpServletRequest req,HttpServletResponse res) throws Exception{
		PolarisDAO dao = new PolarisDAO();
		String bookcode = req.getParameter("bookcode");
		int count = dao.hg_reviewAllCount(bookcode);
		PrintWriter out = res.getWriter();
		out.println(count);
		out.close();
	}
	
	//리뷰 리스트 1,2,3,4,5
	@ResponseBody
	@RequestMapping(value = "/reviewListController")
	public void reviewListController(HttpServletRequest req,HttpServletResponse res) throws Exception{
		PolarisDAO dao = new PolarisDAO();
		int listnum = 5*Integer.parseInt(req.getParameter("listnum"));
		String listType = req.getParameter("listType");
		String bookcode = req.getParameter("bookcode");
		List <ReviewDTO> dto = dao.hg_reviewList(listnum,listType,bookcode);
		PrintWriter out = res.getWriter();
		String gson = new Gson().toJson(dto);
		out.println(gson);
		out.close();
	}
	
	//리뷰 좋아요 누르기
	@ResponseBody
	@RequestMapping(value = "/reviewLikeClickController")
	public void reviewLikeClickController(HttpServletRequest req,HttpServletResponse res) throws Exception{
		String bookcode = req.getParameter("bookcode");
		int reviewNum = Integer.parseInt(req.getParameter("reviewNum"));
		HttpSession session = req.getSession();
		PolarisDAO dao = new PolarisDAO();
		String userid="";
		int isClick = 0, Allcount=0;
		try
		{
			Allcount = dao.getReviewCount(reviewNum);			
		}
		catch(NullPointerException e)
		{
			Allcount=0;
		}
		try
		{
			userid = (String) session.getAttribute("userid");	
			if(userid.equals(null)) userid="empty userid!!!";
		}
		catch(Exception e)
		{
			userid="empty userid!!!";
		}
		if(userid.equals("empty userid!!!"))
		{
			isClick = -1;
		}
		else
		{
			try
			{
				String writer = dao.rvIdFind(reviewNum);				
				isClick=dao.isClick(bookcode,writer,userid);
				if(isClick>0)
				{
					dao.delRevLike(bookcode,writer,userid);
				}
				else
				{
					dao.upRevLike(bookcode,writer,userid);
				}
			}
			catch(Exception e)
			{
				isClick=-2;
			}
		}
		Gson gsonObj = new Gson();
		Map<String, Integer> inputMap = new HashMap<String, Integer>();
		inputMap.put("isClick", isClick);
		inputMap.put("Allcount", Allcount);
		        
		// MAP -> JSON 예제
		String jsonStr = gsonObj.toJson(inputMap);
		PrintWriter out = res.getWriter();
		out.println(jsonStr);
		out.close();
	}
	
	//리뷰 좋아요 눌렀는지
	@ResponseBody
	@RequestMapping(value = "/reviewLikeController")
	public void reviewLikeController(HttpServletRequest req,HttpServletResponse res) throws Exception{
		String bookcode = req.getParameter("bookcode");
		String writer = req.getParameter("writer");
		HttpSession session = req.getSession();
		String userid="";
		try
		{
			userid = (String) session.getAttribute("userid");	
			if(userid.equals(null)) userid="empty userid!!!";
		}
		catch(Exception e)
		{
			userid="empty userid!!!";
		}
		int isClick=0;
		PolarisDAO dao = new PolarisDAO();
		if(userid.equals("empty userid!!!"))
		{
			isClick = -1;
		}
		else
		{
			isClick=dao.isClick(bookcode,writer,userid);
		}
		PrintWriter out = res.getWriter();
		out.println(isClick);
		out.close();
	}
	
	//비밀번호 찾기 페이지
	@RequestMapping(value="findpassword")
	public String findpassword()
	{
		return "findpassword";
	}
	
	//비밀번호 찾기
	@RequestMapping(value="findPasswordController")
	public String findpasswordController(HttpServletRequest req,Model model)
	{
		command = new FindPwCommand();
		model.addAttribute("req", req);
		command.execute(model);
		return "findpassword";
	}
	
	//자동반납 기능
	@RequestMapping(value="AutoReturn")
	public String AutoReturn(Model model)
	{
		command = new AutoReturnCommand();
		command.execute(model);
		return "home";
	}
	
	//검색 기능
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
	
	//전체 검색
	@RequestMapping(value = "totalsearch")
	public String totalsearch(HttpServletRequest request,Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("searchresult", "전체");

	    command = new MenuSearchCommand();
	    command.execute(model);
	    model.addAttribute("searchType", "totalsearch");
	    
	    	return "search"; 
	}
	
	//장르 검색
	@RequestMapping(value = "genresearch", method = RequestMethod.GET)
	public String genresearch(HttpServletRequest request, Model model) {
		String genre = request.getParameter("genre");
		model.addAttribute("request", request);
		model.addAttribute("searchresult", genre);

	    command = new MenuSearchCommand();
	    command.execute(model);
	    model.addAttribute("searchType", "genresearch");
	    
	    return "search";
	}
	
	//인기순/최신순/대여순 검색
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
	@RequestMapping(value = "/searchLike", method = { RequestMethod.GET })	
	public String test(HttpServletRequest request, Model model, RedirectAttributes re,@RequestParam("bookinfo") String bookinfo,@RequestParam("userid") String userid,@RequestParam(
	"booktitle") String booktitle, @RequestParam("author") String author, @RequestParam("publisher") String publisher) {
	 
		model.addAttribute("request", request);
		
		command = new LikeCommand();
		command.execute(model);
	    
	    return "search";			
	}
	@RequestMapping(value = "/searchUserLike", method = { RequestMethod.GET })
	@ResponseBody 
	public void searchUserLike(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{ 
		String bookcode = request.getParameter("bookcode");
		HttpSession session = request.getSession();
		String userid=(String) session.getAttribute("userid");
		
		int likeClick=0;
		PolarisDAO dao = new PolarisDAO();

		likeClick=dao.searchUserLike(bookcode,userid);
	
		PrintWriter out = response.getWriter();
		out.println(likeClick);
		out.close();
	}
	@RequestMapping(value = "/searchLikeCount", method = { RequestMethod.GET })
	@ResponseBody 
	public void searchLikeCount(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{ 
		String bookcode = request.getParameter("bookcode");
		
		PolarisDAO dao = new PolarisDAO();
		int likeCount=dao.searchLikeCount(bookcode);
	
		PrintWriter out = response.getWriter();
		out.println(likeCount);
		out.close();
	}
	@RequestMapping(value = "/searchLoanBook", method = { RequestMethod.GET })	
	public String searchLoanBook(HttpServletRequest request, Model model, RedirectAttributes re,@RequestParam("bookinfo") String bookinfo,@RequestParam(
	"booktitle") String booktitle){
	 
		model.addAttribute("request", request);
		
		command = new DetailLoanCommand();
		command.execute(model);
	    
	    return "search";			
	}
	@RequestMapping(value = "/searchloanCount", method = { RequestMethod.GET })
	@ResponseBody 
	public void searchLoanCount(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{ 
		String bookcode = request.getParameter("bookcode");
		HttpSession session = request.getSession();
		String userid=(String) session.getAttribute("userid");
		
		PolarisDAO dao = new PolarisDAO();

		int loanStatus=dao.loanStatus(bookcode,userid);
		System.out.println(loanStatus);
		PrintWriter out = response.getWriter();
		out.println(loanStatus);
		out.close();
	}

	
	  @RequestMapping(value = "interest", method = RequestMethod.GET) 
	  public String interest(HttpServletRequest request, Model model) {
	  
	  String interest = request.getParameter("interest");
	  model.addAttribute("request", request); model.addAttribute("mypageresult",
	  interest);
	  
	  command = new MyCommand(); command.execute(model);
	  model.addAttribute("pageType", "interest");
	  
	  return "mypage"; // mypage.jsp 호출!!! }
	  }
	 
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String bookinfo(HttpServletRequest request, Model model) {
		String bookcode = request.getParameter("bookinfo");
		model.addAttribute("request", request);
		model.addAttribute("bookcode", bookcode);

	    command = new DetailCommand();
	    command.execute(model);
	    
	    SpCommand drcommand = new DetailReviewCommand();
	    drcommand.execute(model);
	    
	    SpCommand sgcommand = new DetailSuggestCommand();
	    sgcommand.execute(model);
	    
	    return "detail";
	}
	@RequestMapping(value = "likeCount")
	public String likeCount(HttpServletRequest request, Model model){
		model.addAttribute("request", request);
		
		command = new DetailCommand();
		command.execute(model);
		return "likeCount";
	}
	@RequestMapping(value = "userLike")
	public String userLike(HttpServletRequest request, Model model){
		model.addAttribute("request", request);
		
		command = new DetailCommand();
		command.execute(model);
		return "userLike";
	}
	@RequestMapping("/insertLike")
	public String insertLike(HttpServletRequest request, Model model, RedirectAttributes re) {
		String bookcode = request.getParameter("bookinfo");
		model.addAttribute("request", request);
		re.addAttribute("bookinfo", bookcode);
		
		command = new LikeCommand();
		command.execute(model);
		
		return "detail";
		
	}
	@RequestMapping("/detailbookloan")
	public String loanbook(HttpServletRequest request, Model model, RedirectAttributes re) {
		String bookcode = request.getParameter("bookinfo");
		model.addAttribute("request", request);
		re.addAttribute("bookinfo", bookcode);
		
		command = new DetailLoanCommand();
		command.execute(model);
		
		return "detail";
		
	}
	@RequestMapping(value = "loanStatus")
	public String loanStatus(HttpServletRequest request, Model model){
		model.addAttribute("request", request);
		
		command = new DetailLoanCommand();
		command.execute(model);
		return "loanStatus";
	}
	@RequestMapping(value = "loanCount")
	public String loanCount(HttpServletRequest request, Model model){
		model.addAttribute("request", request);
		
		command = new DetailLoanCommand();
		command.execute(model);
		return "loanCount";
	}
	@RequestMapping(value = "sgGenre")
	public String sgGenre(HttpServletRequest request, Model model){
		model.addAttribute("request", request);
		
		command = new DetailSuggestCommand();
		command.execute(model);
		return "sgGenre";
	}
	
	
	
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String bookloan(HttpServletRequest request, Model model) {
		
		command = new MyCommand();
		command.execute(model);

		
		return "mypage";	// mypage.jsp 호출!!!
	
	}
	
	@ResponseBody
	@RequestMapping(value ="/pastLoanAllCounter")
	public void pastLoanAllCounter(HttpServletRequest req, HttpServletResponse res) throws Exception {
		PolarisDAO dao = new PolarisDAO();
		String userid = req.getParameter("userid");
		int pastloan = dao.choi_pastloanList();
		PrintWriter out = res.getWriter();
		out.print(pastloan);
		out.close();
	}
	
	 @ResponseBody
	 @RequestMapping(value="/pageAllList")
	 public void pageAllList(HttpServletRequest req, HttpServletResponse res) throws Exception{
		 PolarisDAO dao = new PolarisDAO();
		 int listnum = 12*Integer.parseInt(req.getParameter("listnum"));
		 List<BookloanDTO> dto = dao.choi_loanPageList(listnum);
		 PrintWriter out = res.getWriter();
		 String gson = new Gson().toJson(dto);	//데이터 json으로 전환
		 out.print(gson);
		 out.close();
	 }
	
	@ResponseBody
	@RequestMapping(value = "/jjimAllCounter")
	public void jjimAllCounter(HttpServletRequest req, HttpServletResponse res) throws Exception{
		PolarisDAO dao = new PolarisDAO();
		int jjimCount = dao.choi_interest();
		PrintWriter out = res.getWriter();
		out.print(jjimCount);
		out.close();
	}
	
	@ResponseBody
	@RequestMapping(value="/jjimAllList")
	public void jjimAllList (HttpServletRequest req, HttpServletResponse res) throws Exception{
		PolarisDAO dao = new PolarisDAO();
		int listnum = 12*Integer.parseInt(req.getParameter("listnum"));
		List<InterestDTO> dto = dao.choi_jjimPageList(listnum);
		PrintWriter out = res.getWriter();
		String gson = new Gson().toJson(dto);
		out.print(gson);
		out.close();
	}
	
	
	//반납choi
	@ResponseBody
	@RequestMapping(value = "/bookloan", method = RequestMethod.GET)
	public void choi_bookLoan(HttpServletRequest request) {
	    String bookcode = request.getParameter("bookcode");
	    int num = Integer.parseInt(request.getParameter("num"));
	    PolarisDAO dao = new PolarisDAO();
	    dao.choi_bookLoan(bookcode, num);
	}
	
	//interest 삭제
	@ResponseBody
	@RequestMapping(value="/delInterest", method = RequestMethod.GET)
	public void delInterest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		PolarisDAO dao = new PolarisDAO();
		String userid = req.getParameter("userid");
	    dao.choi_del_interest(userid);
	}
	
	@RequestMapping(value = "register")
	public String register(Model model) {
		return "register";	// register.jsp 호출!!!
	}
	@RequestMapping(value = "registerok")
	public void registerok(HttpServletRequest request,HttpServletResponse response, Model model) throws IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		model.addAttribute("request", request);
		command = new RegisterCommand();
		command.execute(model);
		out.println("<script>");
		out.println("alert('회원가입이 완료 되었습니다.');");
		out.println("location.href=('/home')");
		out.println("</script>");
		out.close();
		
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
	public void loginok(HttpServletRequest request,HttpServletResponse response, Model model) throws IOException{
		model.addAttribute("request", request);
//		command = new LoginOkCommand();
//		command.execute(model);
		PolarisDAO dao = new PolarisDAO();
		PrintWriter out = response.getWriter();
		int rs = dao.loginOk(request.getParameter("userid"), request.getParameter("userpass"));
		if(rs == 0) {
			response.setContentType("text/html; charset=UTF-8");
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호가 틀립니다.');");
			out.println("location.href=('/home/login')");
			out.println("</script>");
			out.close();
		}else {
			response.setContentType("text/html; charset=UTF-8");
			HttpSession session = request.getSession();
			session.setAttribute("userid", request.getParameter("userid"));
			out.println("<script>");
			out.println("location.href=('/home')");
			out.println("</script>");
			out.close();
		}
	}
	@RequestMapping(value = "/logout")
	public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		session.invalidate();
		out.println("<script>");
		out.println("alert('로그아웃이 되었습니다.');");
		out.println("location.href=('/home')");
		out.println("</script>");
		out.close();	// 로그아웃!!!
	}
	@RequestMapping(value = "/exitLogout")
	public void exitLogout(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		session.invalidate();
		out.println("<script>");
		out.println("location.href=('/home')");
		out.println("</script>");
		out.close();	// 로그아웃!!!
	}
	@RequestMapping(value = "findidok")
	public String findidok(HttpServletRequest request, Model model) {
		command = new FindIdCommand();
		model.addAttribute("request", request);
		command.execute(model);
		return "findid";
	}
	
	@RequestMapping(value = "member")
	public String member(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String userid = (String)session.getAttribute("userid");
		if(userid == null) {
			response.setContentType("text/html; charset=UTF-8");
			out.println("<script>");
			out.println("alert('이미 탈퇴 처리된 회원입니다.');");
			out.println("location.href=('/home')");
			out.println("</script>");
			out.close();
		}
		request.setAttribute("userid", userid);
		model.addAttribute("request", request);
		command = new MemberListCommand();
		command.execute(model);
		return "member";	// member.jsp 호출!!!
	}
	
	@RequestMapping(value = "passUpdate", method = RequestMethod.POST)
	public void updatePass(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		model.addAttribute("request", request);
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String userid = (String)session.getAttribute("userid");
		request.setAttribute("userid", userid);
		command = new SpUpdatePassCommand();
		command.execute(model);
		out.println("<script>");
		out.println("alert('비밀번호 변경이 완료되었습니다.');");
		out.println("location.href=('/home/member')");
		out.println("</script>");
		out.close();
	}
	
	@RequestMapping(value = "changeBirth", method = RequestMethod.POST)
	public void changeBirth(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException{
		model.addAttribute("request", request);
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String userid = (String)session.getAttribute("userid");
		request.setAttribute("userid", userid);
		command = new SpChangeBirthCommand();
		command.execute(model);
		out.println("<script>");
		out.println("alert('생년월일 변경이 완료되었습니다.');");
		out.println("location.href=('/home/member')");
		out.println("</script>");
		out.close();
	}
	@RequestMapping(value = "exit", method = RequestMethod.GET)
	public void exit (HttpServletRequest request, HttpServletResponse response, Model model) throws IOException{
		model.addAttribute("request", request);
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String userid = (String)session.getAttribute("userid");
		request.setAttribute("userid", userid);
		command = new SpExitCommand();
		
		command.execute(model);
		session.invalidate();
		out.println("<script>");
		out.println("alert('회원탈퇴가 완료되었습니다. 그동안 이용해 주셔서 감사합니다.');");
		out.println("location.href=('/home/exitLogout')");
		out.println("</script>");
		out.close();
	}
	@RequestMapping(value="findid")
	public String findid(){
		return "findid";
	}
}

