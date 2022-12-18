package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<Map<String, String>> getReportBoard(  ){
		List<Map<String,String>> reportList = this.sqlSession.selectList(
				"com.naver.erp.AdminDAO.getReportBoard"
		);
		return reportList;
	}


	
	
	public int getTotMember(  ){
		int totMember = this.sqlSession.selectOne(
				"com.naver.erp.AdminDAO.getTotMember"
		);
		return totMember;
	};

	
	public int getTotJijum(  ){
		int totJijum = this.sqlSession.selectOne(
				"com.naver.erp.AdminDAO.getTotJijum"
		);
		return totJijum;
	};
	
	public int getTotTool(  ){
		int totTool = this.sqlSession.selectOne(
				"com.naver.erp.AdminDAO.getTotTool"
		);
		return totTool;
	};
	
	public int getTotOnRental(  ){
		int totOnRental = this.sqlSession.selectOne(
				"com.naver.erp.AdminDAO.getTotOnRental"
		);
		return totOnRental;
	};
	


	public int getTotOnBooking(  ){
		int totOnBooking = this.sqlSession.selectOne(
				"com.naver.erp.AdminDAO.getTotOnBooking"
		);
		return totOnBooking;
	};
	
	
	
	
	
	
	
	
	
	
	public int getReportListTotCnt( ReportDTO reportDTO ) {
		int reportListTotCnt = this.sqlSession.selectOne(
				"com.naver.erp.AdminDAO.getReportListTotCnt"
				,reportDTO
			);
		return reportListTotCnt;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
