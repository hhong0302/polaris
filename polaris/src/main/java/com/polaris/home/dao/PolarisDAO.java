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
	public List<InterestDTO> hg_homeinterest()
	{
		String sql = "select * from book order by likecount desc limit 0,5";
		return (List<InterestDTO>)template.query(sql,new BeanPropertyRowMapper<InterestDTO>(InterestDTO.class));
	}
	
	public List<BookloanDTO> hg_bookLoanDate(String userid)
	{
		String sql = "select * from bookloan where userid='"+userid+"' and loan=1 order by loandate asc limit 0,2;";
		return (List<BookloanDTO>)template.query(sql,new BeanPropertyRowMapper<BookloanDTO>(BookloanDTO.class));
	}
	
	public List<BookDTO> hg_homenovel()
	{
		String sql = "select * from book where genre='소설/시' order by date desc";
		return (List<BookDTO>)template.query(sql,new BeanPropertyRowMapper<BookDTO>(BookDTO.class));
	}
	
	public List<BookDTO> hg_homeessay()
	{
		String sql = "select * from book where genre='에세이' order by date desc";
		return (List<BookDTO>)template.query(sql,new BeanPropertyRowMapper<BookDTO>(BookDTO.class));
	}
	
	public List<BookDTO> hg_hotList(String name)
	{
		String sql = "";
		if(name.equals("popular")||name=="popular") sql="select * from book order by likecount desc limit 0,10";
		if(name.equals("recent")||name=="recent") sql="select * from book order by date desc limit 0,10";
		if(name.equals("lotsloan")||name=="lotsloan") sql="select * from book order by loancount desc limit 0,10";
		
		return template.query(sql, new BeanPropertyRowMapper<BookDTO>(BookDTO.class));
	}
	
	public List<ReviewDTO> hg_reviewList(String bookcode,String rvType)
	{
		String sql="select * from review where bookcode='"+bookcode+"'";
		if(rvType=="recent"||rvType.equals("recent")) sql+="order by redate desc";
		else sql+="order by relike desc";
		return (List<ReviewDTO>)template.query(sql,new BeanPropertyRowMapper<ReviewDTO>(ReviewDTO.class));
	}
	public List<BookDTO> hg_sample()
	{
		String sql = "select * from book";
		return (List<BookDTO>)template.query(sql,new BeanPropertyRowMapper<BookDTO>(BookDTO.class));
	}
	public List<BookDTO> hg_reviewList(int listnum)
	{
		String sql = "select * from book limit "+listnum+", 5";
		return (List<BookDTO>)template.query(sql,new BeanPropertyRowMapper<BookDTO>(BookDTO.class));
	}
	//wonhong End
	
	
	//바지조장 Start
	public List<MembersDTO> choi_memList(){

		String sql = "select * from members where userid = 'test'";
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
	


	
	
	//cha End

	

}