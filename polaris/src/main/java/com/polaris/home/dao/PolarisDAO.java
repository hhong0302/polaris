package com.polaris.home.dao;

import java.util.List;

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
	
	//gyu End
	
	
	//wonhong Start
	public List<BookDTO> hg_hotList(String value)
	{
		String sql = "";
		sql="select * from book order by date desc limit 0,5";
		
		return template.query(sql, new BeanPropertyRowMapper<BookDTO>(BookDTO.class));
	}
	//wonhong End
	
	
	//바지조장 Start
	
	//바지조장 End
	
	
	//alice Start
	
	//alice End
	
	
	//cha Start
	
	//cha End

}
