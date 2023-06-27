package com.polaris.home.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.polaris.home.dto.BookDTO;
import com.polaris.home.dto.BookloanDTO;
import com.polaris.home.dto.InterestDTO;
import com.polaris.home.dto.MembersDTO;
import com.polaris.home.dto.ReviewDTO;
import com.polaris.home.util.Static;

public class PolarisDAO {
	
	DataSource dataSource;
	JdbcTemplate template = null;
	
	public PolarisDAO()
	{
		template = Static.template;
	}
	
	//gyu Start
	public ArrayList<BookDTO> search(String query) {
		String sql = "SELECT * FROM book WHERE booktitle LIKE '%" + query + "%' OR author LIKE '%" + query + "%' OR genre LIKE '%" + query + "%' OR publisher LIKE '%" + query + "%' ";
	    return (ArrayList<BookDTO>) template.query(sql, new BeanPropertyRowMapper<BookDTO>(BookDTO.class));
	}
	public ArrayList<BookDTO> totalsearch() {
	    String sql = "SELECT * FROM book";
	    return (ArrayList<BookDTO>) template.query(sql, new BeanPropertyRowMapper<BookDTO>(BookDTO.class));
	}
	public ArrayList<BookDTO> genresearch(String genre) { 
	    String sql = "SELECT * FROM book WHERE genre LIKE ";
	    sql +="'%" + genre + "%'";
	    return (ArrayList<BookDTO>) template.query(sql, new BeanPropertyRowMapper<BookDTO>(BookDTO.class));
	}
	public ArrayList<BookDTO> ordersearch(String order)
	{
		String sql = "";
		if(order.equals("인기순")||order=="인기순") sql="select * from book order by likecount desc";
		if(order.equals("최신순")||order=="최신순") sql="select * from book order by date desc";
		if(order.equals("대여순")||order=="대여순") sql="select * from book order by loancount desc";
		
		return (ArrayList<BookDTO>) template.query(sql, new BeanPropertyRowMapper<BookDTO>(BookDTO.class));
	}
	//gyu End
	
	
	//wonhong Start
	// 관심순
	public List<InterestDTO> hg_homeinterest()
	{
		String sql = "select * from book order by likecount desc limit 0,5";
		return (List<InterestDTO>)template.query(sql,new BeanPropertyRowMapper<InterestDTO>(InterestDTO.class));
	}
	//곧 반납 도서
	public List<BookloanDTO> hg_bookLoanDate(String userid)
	{
		String sql = "select * from bookloan where userid='"+userid+"' and loan=1 order by loandate asc limit 0,2;";
		return (List<BookloanDTO>)template.query(sql,new BeanPropertyRowMapper<BookloanDTO>(BookloanDTO.class));
	}
	//소설/시 뿌리기
	public List<BookDTO> hg_homenovel()
	{
		String sql = "select * from book where genre='소설/시' order by date desc";
		return (List<BookDTO>)template.query(sql,new BeanPropertyRowMapper<BookDTO>(BookDTO.class));
	}
	//에세이 뿌리기
	public List<BookDTO> hg_homeessay()
	{
		String sql = "select * from book where genre='에세이' order by date desc";
		return (List<BookDTO>)template.query(sql,new BeanPropertyRowMapper<BookDTO>(BookDTO.class));
	}
	//인기.최신.대여순 뿌리기
	public List<BookDTO> hg_hotList(String name)
	{
		String sql = "";
		if(name.equals("popular")||name=="popular") sql="select * from book order by likecount desc limit 0,10";
		if(name.equals("recent")||name=="recent") sql="select * from book order by date desc limit 0,10";
		if(name.equals("lotsloan")||name=="lotsloan") sql="select * from book order by loancount desc limit 0,10";
		
		return template.query(sql, new BeanPropertyRowMapper<BookDTO>(BookDTO.class));
	}
	//작성한 리뷰 있는지 확인(count)
	//리스트 전체 수
		public int hg_reviewWriteCount(String bookcode,String userid)
		{
			String sql = "select count(*) from review where bookcode='"+bookcode+"' and userid='"+userid+"'";
			return template.queryForObject(sql, Integer.class);
		}
	//리뷰작성하기
	public void hg_reviewWrite(String bookcode,String userid,String retitle,String recontent)
	{
		String sql = "insert into review(bookcode,userid,retitle,recontent) values(?,?,?,?)";
		template.update(sql,new PreparedStatementSetter()
		{
			@Override
			public void setValues(PreparedStatement ps) throws SQLException
			{
				ps.setString(1, bookcode);
				ps.setString(2, userid);
				ps.setString(3, retitle);
				ps.setString(4, recontent);
			}
		});
	}
	//리뷰 수정
	public void hg_reviewModify(String bookcode,String userid,String retitle,String recontent)
	{
		String sql = "update review set retitle=?,recontent=? where bookcode=? and userid=?";
		template.update(sql,new PreparedStatementSetter()
		{
			@Override
			public void setValues(PreparedStatement ps) throws SQLException
			{
				ps.setString(1, retitle);
				ps.setString(2, recontent);
				ps.setString(3, bookcode);
				ps.setString(4, userid);
			}
		});
	}
	//리뷰 삭제
	public void hg_reviewDelete(String userid,String bookcode)
	{
		String sql = "delete from review where userid=? and bookcode=?";
		template.update(sql,new PreparedStatementSetter()
		{
			@Override
			public void setValues(PreparedStatement ps) throws SQLException
			{
				ps.setString(1, userid);
				ps.setString(2,bookcode);
			}
		});
	}
	//리뷰 작성한거 있으면 뿌려주기
	public List<ReviewDTO> hg_ifyouWriteReview(String userid,String bookcode)
	{
		String sql = "select * from review where userid='"+userid+"' and bookcode='"+bookcode+"'";
		return (List<ReviewDTO>)template.query(sql,new BeanPropertyRowMapper<ReviewDTO>(ReviewDTO.class));
	}
	//리스트 전체 수
	public int hg_reviewAllCount(String bookcode)
	{
		String sql = "select count(*) from review where bookcode='"+bookcode+"' ";
		return template.queryForObject(sql, Integer.class);
	}
	//리스트 목록 뿌리기
	public List<ReviewDTO> hg_reviewList(String bookcode,String rvType)
	{
		String sql="select * from review where bookcode='"+bookcode+"' ";
		if(rvType=="recent"||rvType.equals("recent")) sql+="order by redate desc";
		else sql+="order by relike desc, redate desc";
		return (List<ReviewDTO>)template.query(sql,new BeanPropertyRowMapper<ReviewDTO>(ReviewDTO.class));
	}
	//리뷰 작성자의 아이디값 받아오기(좋아요)
	public String rvIdFind(int reviewNum)
	{
		String sql = "select userid from review where num="+reviewNum;
		return template.queryForObject(sql, String.class);
	}
	//리뷰 좋아요를 눌렀는지 확인
	public int isClick(String bookcode, String writer, String pusher)
	{
		String sql = "select count(*) from clicklist where bookcode='"+bookcode+"' and writer='"+writer+"' and pusher='"+pusher+"' ";
		return template.queryForObject(sql, Integer.class);
	}
	//좋아요 누른 부분 삭제
	public void delRevLike(String bookcode, String writer, String pusher, int isClick)
	{
		String sql = "delete from clicklist where bookcode=? and writer=? and pusher=?";
		template.update(sql,new PreparedStatementSetter()
		{
			@Override
			public void setValues(PreparedStatement ps) throws SQLException
			{
				ps.setString(1, bookcode);
				ps.setString(2,writer);
				ps.setString(3,pusher);
			}
		});
		String sql2 = "update review set relike=relike-1 where num=?";
		template.update(sql2,new PreparedStatementSetter()
		{
			@Override
			public void setValues(PreparedStatement ps) throws SQLException
			{
				ps.setInt(1,isClick);
			}
		});
	}
	//좋아요 누르면 insert
	public void upRevLike(String bookcode, String writer, String pusher, int isClick)
	{
		String sql = "insert into clicklist(bookcode,writer,pusher) values(?,?,?)";
		template.update(sql,new PreparedStatementSetter()
		{
			@Override
			public void setValues(PreparedStatement ps) throws SQLException
			{
				ps.setString(1, bookcode);
				ps.setString(2,writer);
				ps.setString(3,pusher);
			}
		});
		String sql2 = "update review set relike=relike+1 where num=?";
		template.update(sql2,new PreparedStatementSetter()
		{
			@Override
			public void setValues(PreparedStatement ps) throws SQLException
			{
				ps.setInt(1,isClick);
			}
		});
	}
	//번호 눌렀을 때 나오는 리스트 1,2,3,4,5
	public List<ReviewDTO> hg_reviewList(int listnum,String listType,String bookcode)
	{
		String sql = "select * from review where bookcode='"+bookcode+"' ";
		if(listType=="recent"||listType.equals("recent")) sql+="order by redate desc";
		else sql+="order by relike desc, redate desc";
		sql+=" limit "+listnum+", 5";
		return (List<ReviewDTO>)template.query(sql,new BeanPropertyRowMapper<ReviewDTO>(ReviewDTO.class));
	}
	//비밀번호 찾기
	public int findId(String userid,String username,String birth,String usertel)
	{
		String sql = "select count(*) from members where userid='"+userid+"' and username='"+username+"' and birth='"+birth+"' and usertel='"+usertel+"' ";
		return template.queryForObject(sql, Integer.class);
	}
	//임시 비밀번호 발급
	public void setNewPass(String newPw,String userid)
	{
		String sql = "update members set userpass=? where userid=?";
		template.update(sql,new PreparedStatementSetter()
		{
			@Override
			public void setValues(PreparedStatement ps) throws SQLException
			{
				ps.setString(1, newPw);
				ps.setString(2, userid);
			}
		});
	}
	//wonhong End
	
	
	//바지조장 Start
	public List<MembersDTO> choi_memList(){

		String sql = "select * from members ";
		return (List<MembersDTO>)template.query(sql,new BeanPropertyRowMapper<MembersDTO>(MembersDTO.class));
	}
	
	public List<BookloanDTO> choi_loanList(){
		String sql = "select*from bookloan where loan >=1";
		return (List<BookloanDTO>)template.query(sql,new BeanPropertyRowMapper<BookloanDTO>(BookloanDTO.class));
	}
	
	public List<BookloanDTO> choi_pastloanList(){
		String sql = "select*from bookloan where loan < 1";
		return (List<BookloanDTO>)template.query(sql,new BeanPropertyRowMapper<BookloanDTO>(BookloanDTO.class));
	}
	
	public List<InterestDTO> choi_interest(){
		String sql = "select*from interest";
		return (List<InterestDTO>)template.query(sql,new BeanPropertyRowMapper<InterestDTO>(InterestDTO.class));

	}
	//바지조장 End
	
	
	//alice Start
	public ArrayList<BookDTO> bookinfo(String bookcode) { 
	    String sql = "select * from book where bookcode = ";
	    sql +="'" + bookcode + "'";
	    return (ArrayList<BookDTO>) template.query(sql, new BeanPropertyRowMapper<BookDTO>(BookDTO.class));
	}
	
	public void insertLike(String bookcode, String userid, String booktitle, String author, String publisher) {
		template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException{
				String sql = "insert into interest (bookcode, userid, booktitle, author, publisher)"
						+ " values (?,?,?,?,?)";
				PreparedStatement pstmt = con.prepareStatement(sql);
					pstmt.setString(1, bookcode);
					pstmt.setString(2, userid);
					pstmt.setString(3, booktitle);
					pstmt.setString(4, author);
					pstmt.setString(5, publisher);
					return pstmt;
				}
		});
	}
	public void deleteLike(String bookcode, String userid) {
		template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException{
				String sql = "delete from interest where bookcode = ? and userid = ?";
				PreparedStatement pstmt = con.prepareStatement(sql);
					pstmt.setString(1, bookcode);
					pstmt.setString(2, userid);
					return pstmt;
				}
		});
	}
	public int likeCount(String bookcode) {
		String sql = "select count(*) from interest where bookcode ='" + bookcode + "'";
		return template.queryForObject(sql, Integer.class);
	}
	public int userLike(String bookcode, String userid){
		String sql = "select count(*) from interest where bookcode = '" + bookcode + "' and userid = '" + userid + "'";
		return template.queryForObject(sql, Integer.class);
	}
	public void loanBook(String bookcode, String userid, String booktitle) {
			template.update(new PreparedStatementCreator() {
				@Override
				public PreparedStatement createPreparedStatement(Connection con) throws SQLException{
					String sql = "insert into bookloan (bookcode, userid, booktitle, loan) values (?,?,?,1)";
					PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setString(1, bookcode);
						pstmt.setString(2, userid);
						pstmt.setString(3, booktitle);
						return pstmt;
					}
				
		});
	}
	public void returnBook(String bookcode, String userid) {
		template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException{
				String sql = "update bookloan set loan = 0 where bookcode = '" + bookcode + "' and userid = '" + userid + "'";
				PreparedStatement pstmt = con.prepareStatement(sql);
					return pstmt;
				}
		});
	}
	
	public int loanStatus(String bookcode, String userid){
		String sql ="select count(*) from bookloan where bookcode = '" + bookcode +"' and userid = '" + userid + "' and loan = 1";
		return template.queryForObject(sql, Integer.class);
	}
	public String sgGenre(String bookcode){
		String sql = "select genre from book where bookcode = '" + bookcode + "'";
		return template.queryForObject(sql, String.class);
	}
	public ArrayList<BookDTO> suggest(String bookcode, String genre) { 
	    String sql = "select * from book where genre = '" + genre + "' and bookcode not in ('"+ bookcode + "') order by rand() limit 4";
	    return (ArrayList<BookDTO>) template.query(sql, new BeanPropertyRowMapper<BookDTO>(BookDTO.class));
	}
	
	
	//alice End
	
	
	//cha Start
	public void registerok(String userid, String userpass, String username, String birth, String tel, String email) {
		
		
		
		template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException{
				String sql = "insert into members (userid, userpass, username, birth, usertel, useremail)"
						+ " values (?,?,?,?,?,?)";
				PreparedStatement pstmt = con.prepareStatement(sql);
					pstmt.setString(1, userid);
					pstmt.setString(2, userpass);
					pstmt.setString(3, username);
					pstmt.setString(4, birth);
					pstmt.setString(5, tel);
					pstmt.setString(6, email);
					return pstmt;
				}
			
		});
	}
	public int checkid(String userid) {
		String sql = "select count(*) from  members where userid = '" + userid + "'";
		return template.queryForObject(sql, Integer.class);
	}
	
	

	public int loginOk(String userid, String userpass){
		String sql = "select count(*) from members where userid = '"+userid+"' and userpass = '"+userpass+"'";
		return template.queryForObject(sql, Integer.class);
	}
	
	
	public MembersDTO memberInfo(String userid) { 
	    String sql = "select * from members where userid = '"+userid+"'";
	   System.out.println(sql);
	    return template.queryForObject(sql, new BeanPropertyRowMapper<MembersDTO>(MembersDTO.class));
	}
	
public void passUpdate(String userid, String newPass) {
		String sql = "update members set userpass = ? where userid = ?";
		template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement pstmt) throws SQLException{
					pstmt.setString(1, newPass);
					pstmt.setString(2, userid);
				}
			
		});
	}

public void changeBirth(String userid, String newBirth) {
	String sql = "update members set birth = ? where userid = ?";
	template.update(sql, new PreparedStatementSetter() {
		
		@Override
		public void setValues(PreparedStatement pstmt) throws SQLException{
				pstmt.setString(1, newBirth);
				pstmt.setString(2, userid);
			}
		
	});
}

public void exit(String userid) {
	String sql = "delete from members where userid = ?";
	template.update(sql, new PreparedStatementSetter() {
		
		@Override
		public void setValues(PreparedStatement pstmt) throws SQLException{
				pstmt.setString(1, userid);
			}
		
	});
}
	


	
	
	//cha End

	

}