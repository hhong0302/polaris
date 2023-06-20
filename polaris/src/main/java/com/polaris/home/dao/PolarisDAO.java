package com.polaris.home.dao;

import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.polaris.home.dto.BookDTO;
import com.polaris.home.util.Static;

public class PolarisDAO {
	
	DataSource dataSource;
	JdbcTemplate template = null;
	
	public PolarisDAO()
	{
		template = Static.template;
	}
	
	//gyu Start
	public ArrayList<BookDTO> search() {
	    String sql = "SELECT * FROM book WHERE booktitle LIKE '%세이노%'";
	    return (ArrayList<BookDTO>) template.query(sql, new BeanPropertyRowMapper<>(BookDTO.class));
	}
	public ArrayList<BookDTO> totalsearch() {
	    String sql = "SELECT * FROM book";
	    return (ArrayList<BookDTO>) template.query(sql, new BeanPropertyRowMapper<>(BookDTO.class));
	}
	//gyu End
	
	
	//wonhong Start
	
	//wonhong End
	
	
	//諛붿�議곗옣 Start
	
	//諛붿�議곗옣 End
	
	
	//alice Start
	
	//alice End
	
	
	//cha Start
	
	//cha End

}
