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
import com.polaris.home.dto.InterestDTO;
import com.polaris.home.dto.MembersDTO;
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
		String sql = "SELECT * FROM book WHERE booktitle LIKE '%" + query + "%' OR author LIKE '%" + query + "%' OR genre LIKE '%" + query + "%'";
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
	//gyu End
	
	
	//wonhong Start
	public List<InterestDTO> hg_homeinterest()
	{
		String sql = "select * from book order by likecount desc limit 0,5";
		return (List<InterestDTO>)template.query(sql,new BeanPropertyRowMapper<InterestDTO>(InterestDTO.class));
	}
	
	public List<BookDTO> hg_homenovel()
	{
		String sql = "select * from book where genre='소설/시' order by date desc;";
		return (List<BookDTO>)template.query(sql,new BeanPropertyRowMapper<BookDTO>(BookDTO.class));
	}
	
	public List<BookDTO> hg_homeessay()
	{
		String sql = "select * from book where genre='에세이' order by date desc;";
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
	//wonhong End
	
	
	//바지조장 Start
	public List<MembersDTO> choi_memList(){
		String sql = "select * from members";
		return (ArrayList<MembersDTO>) template.query(sql, new BeanPropertyRowMapper<>(MembersDTO.class));
	}
	//바지조장 End
	
	
	//alice Start
	public ArrayList<BookDTO> bookinfo(String bookcode) { 
	    String sql = "select * from book where bookcode like ";
	    sql +="'" + bookcode + "'";
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
}
	//cha End

	
