package com.polaris.home.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;

public class FindPwCommand implements SpCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
	    HttpServletRequest req = (HttpServletRequest) map.get("req");
	    PolarisDAO dao = new PolarisDAO();
	    String userid = req.getParameter("userid");
	    String username = req.getParameter("username");
	    String birth = req.getParameter("birth");
	    String usertel = req.getParameter("mobile");
	    int findId = dao.findId(userid,username,birth,usertel);
	    if(findId>0)
	    {
	    	String newPw = "@"+getTempPassword();
	    	dao.setNewPass(newPw, userid);
	    	model.addAttribute("newpass", newPw);
	    }
	    else
	    {
	    	model.addAttribute("newpass", "NotFoundYourId");
	    }
	}
	
	public String getTempPassword(){
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

        String str = "";

        // 문자 배열 길이의 값을 랜덤으로 10개를 뽑아 구문을 작성함
        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
        }
        return str;
    }

}
