package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;







@Repository
public class ToolDAOImpl implements ToolDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<Map> getLocation(){
		List<Map> locations = this.sqlSession.selectList(
				"com.naver.erp.ToolDAO.getLocation"
		);
		return locations;
	}
	
	public List<Map> getJijum(){
		List<Map> jijums = this.sqlSession.selectList(
				"com.naver.erp.ToolDAO.getJijum"
				
				);
		return jijums;
		
		
		
	}
	public List<Map> getBigSort(){
		List<Map> bigSorts = this.sqlSession.selectList(
				"com.naver.erp.ToolDAO.getBigSort"
				
				);
		return bigSorts;
	}
	public List<Map> getSmallSort(){
		List<Map> smallSorts = this.sqlSession.selectList(
				"com.naver.erp.ToolDAO.getSmallSort"
				
				);
		return smallSorts;
	}
	public List<Map> getToolList(Map searchList){
		List<Map> toolLists = this.sqlSession.selectList(
				"com.naver.erp.ToolDAO.getToolList"
				,searchList
				);
		return toolLists;
	}
	public List<Map> getToolList2(Map searchList){
		List<Map> toolLists = this.sqlSession.selectList(
				"com.naver.erp.ToolDAO.getToolList2"
				,searchList
				);
		return toolLists;
	}
	
	public List<Map> getToolDetailFromTool(int toolNo){
		List<Map> ToolDetailFromTool = this.sqlSession.selectList(
				"com.naver.erp.ToolDAO.getToolDetailFromTool"
				, toolNo
				);
				
				
		
		
		return ToolDetailFromTool;
		
		
	}
	
	public List<Map> getToolDetailFromJijum(int jijumNo){
		
		List<Map> ToolDetailFromJijum = this.sqlSession.selectList(
				"com.naver.erp.ToolDAO.getToolDetailFromJijum"
				, jijumNo
				);
				
		return ToolDetailFromJijum;
	}
	
	
	
	
	public int upToolStatus(int toolNo){
		
		int toolStatus = this.sqlSession.update(
				"com.naver.erp.ToolDAO.upToolStatus"
				,toolNo
				);
				
		return toolStatus;
	}
	
	public int insertToolRentBooktoOnBooking(Map bookInfo) {
		int ToolRentBooktoOnBooking = this.sqlSession.insert(
				"com.naver.erp.ToolDAO.insertToolRentBooktoOnBooking"
				,bookInfo
				);
		
		return ToolRentBooktoOnBooking;
	}
	

	public int toolListTotCnt( ToolDTO toolDTO ) {
		int toolListTotCnt = this.sqlSession.selectOne(
				"com.naver.erp.ToolDAO.toolListTotCnt"
				,toolDTO
			);
		return toolListTotCnt;
	}
	
	
	
	
	
	
	
	
	
	
	
}
