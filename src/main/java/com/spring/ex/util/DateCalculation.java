package com.spring.ex.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateCalculation {
	/*
	 *  실행일 2022/10/07
	 *  api호출시 날짜 입력에 사용하려고 인터넷에서 가져옴
	 *  */
	
	public static void main(String[] args) throws Exception{
		DateCalculation dateCalculation = new DateCalculation();
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		String testToDay = formatter.format(date);
		
		//String date = "20200801";
		//1년 전 날짜
		String addYear  = dateCalculation.addDate(testToDay , -1, 0, 0);
		//1달 후 날짜
		String addMonth = dateCalculation.addDate(testToDay, 0, 12, 0);
		//1일 후 날짜
		String addDay   = dateCalculation.addDate(testToDay, 0, 0, -1);
		
		System.out.println(addYear);  //20211007
		System.out.println(addMonth); //20231007
		System.out.println(addDay);   //20221006
	}
	
	public String addDate(String strDate, int year, int month, int day) throws Exception {
		
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");

		Calendar cal = Calendar.getInstance();

		Date dt = dtFormat.parse(strDate);

		cal.setTime(dt);
		
		cal.add(Calendar.YEAR, year);
		cal.add(Calendar.MONTH, month);
		cal.add(Calendar.DATE, day);

		return dtFormat.format(cal.getTime());
	}
}
