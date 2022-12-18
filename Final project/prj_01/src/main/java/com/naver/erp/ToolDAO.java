package com.naver.erp;

import java.util.List;
import java.util.Map;

public interface ToolDAO {

	
	public List<Map> getLocation();
	
	public List<Map> getJijum();
	public List<Map> getBigSort();
	public List<Map> getSmallSort();
	public List<Map> getToolList(Map searchList);
	public List<Map> getToolList2(Map searchList);
	public List<Map> getToolDetailFromTool(int toolNo);
	public List<Map> getToolDetailFromJijum(int jijumNo);
	public int upToolStatus(int toolNo);
	public int insertToolRentBooktoOnBooking(Map bookInfo);

	//public int toolListTotCnt(ToolDTO toolDTO);
}
