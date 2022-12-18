package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	@Autowired
	private AdminDAO adminDAO;   
	

	@RequestMapping( value="/adminStatsForm.do")
	public ModelAndView adminStatsForm( ){
		ModelAndView mav = new ModelAndView();
		
		int totMember =  this.adminDAO.getTotMember(  );
		int totJijum =  this.adminDAO.getTotJijum(  );
		int totTool =  this.adminDAO.getTotTool(  );
		int totOnRental =  this.adminDAO.getTotOnRental(  );
		int totOnBooking =  this.adminDAO.getTotOnBooking(  );

		mav.addObject("totMember", totMember );
		mav.addObject("totJijum", totJijum );
		mav.addObject("totTool", totTool );
		mav.addObject("totOnRental", totOnRental );
		mav.addObject("totOnBooking", totOnBooking );
		mav.setViewName( "adminStatsForm.jsp" );
		return  mav;
	};


	@RequestMapping( value="/adminReportForm.do")
	public ModelAndView getReportBoard(  ) {
		System.out.println("getReportBoard 메소드 진입");
		
		List<Map<String,String>> reportList =  this.adminDAO.getReportBoard( );
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("reportList", reportList );
		System.out.println(reportList);
		mav.setViewName( "adminReportForm.jsp" );
		System.out.println("getReportBoard 메소드 완료");
		return mav;
		
	}

	
	
	
	
	
	
	
	
	
	
}
