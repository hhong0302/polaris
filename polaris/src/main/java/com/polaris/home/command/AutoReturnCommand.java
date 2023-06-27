package com.polaris.home.command;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.springframework.ui.Model;

import com.polaris.home.dao.PolarisDAO;

public class AutoReturnCommand implements SpCommand {

	@Override
	public void execute(Model model) {

		PolarisDAO dao = new PolarisDAO();
		Calendar startCalendar = new GregorianCalendar(2023, 05, 20, 15, 58, 00); //2023.06.20.15:57:00 
		Date startDT = startCalendar.getTime();
		
		Calendar endCalendar = new GregorianCalendar();  //현재시간
		Date endDT = endCalendar.getTime();

		long differenceInMillis = endDT.getTime() - startDT.getTime();

		long days = (differenceInMillis / (24 * 60 * 60 * 1000L)) % 365;
		
		System.out.println(days);
		
		if(days>=14)
		{
			
		}

	}

}
