package com.mrkimfood.gonggam.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mrkimfood.gonggam.dao.TableDao;
import com.mrkimfood.gonggam.vo.MakeTableInfoVO;
import com.mrkimfood.gonggam.vo.TableVO;

@Service
public class TableServiceImpl implements TableService {

	@Inject TableDao dao;
	
	@Override
	public int makeTable(TableVO tableVO) {
		return dao.insert(tableVO);
	}
	
	@Override
	public void makeTable(Integer shopNo, Integer getTableCount){
		
		//테이블의 MaxCount를 체크하여 DB에 테이블이 한번이라도 생성되었는지 확인한다.
		Integer tableMaxCount = dao.selectTableMaxCount(shopNo);
		System.out.println("table Max Count 체크:"+tableMaxCount);
		
		//createTableCheck의 값이 null일 경우 테이블이 최초로 생성되는 것으로 간주,
		if(tableMaxCount == null){
			
			if(getTableCount > 0){
				//입력된 tableCount의 개수만큼 테이블을 생성시킨다.
				for(int i=1; i<=getTableCount;i++){
					TableVO tableVO = new TableVO();
					tableVO.setNo(i);
					tableVO.setQrCode("QRcodeURL?shopNo="+shopNo+",tableID="+i);
					tableVO.setRestaurantId(shopNo);
					
					dao.insert(tableVO);
				}
			}
		
		//createTableCheck의 값이 null이 아닐 경우 테이블이 한번이라도 등록된 것으로 간주,
		//테이블 생성 알고리즘을 사용하여 테이블 정보를 수정한다.
		}else{
			Integer tableCount=dao.selectTableCount(shopNo);
			if(tableCount==null){	tableCount=0;	}
			
			MakeTableInfoVO makeTableInfoVO = new MakeTableInfoVO();
			makeTableInfoVO.setShopNo(shopNo);
			makeTableInfoVO.setTableNum(getTableCount);
			makeTableInfoVO.setActiveTableNum(tableCount);
			makeTableInfoVO.setTableMaxCount(tableMaxCount);
			
			//0미만의 값이 입력됨.(마이너스 값은 테이블 생성하지 못함. 에러처리)
			if(getTableCount < 0){
				
			//0~MaxCount의 값이 올때
			}else if(getTableCount <= tableMaxCount){
				//입력값 <= 활성화 테이블
				if( getTableCount <= tableCount){
					dao.updateDeactivationTable(makeTableInfoVO);
					
				//활성화테이블 < 입력값 <= MaxCount
				}else if(tableCount== null || getTableCount > tableCount){
					dao.updateActivationTable(makeTableInfoVO);
				}
			//MaxCount의 값보다 큰 값이 입력됬을때
			}else if(getTableCount > tableMaxCount){
				dao.updateActivationTable(makeTableInfoVO);
				
				for(int i=( tableMaxCount+1 ); i<=getTableCount;i++){
					TableVO tableVO = new TableVO();
					tableVO.setNo(i);
					tableVO.setQrCode("QRcodeURL?shopNo="+shopNo+",tableID="+i);
					tableVO.setRestaurantId(shopNo);
					
					dao.insert(tableVO);
				}
			}
			
		}
		
	}
	
	@Override
	public TableVO selectTable(TableVO tableVO) {
		return dao.idSelect(tableVO);
	}
	
	@Override
	public List<TableVO> selectTableList(Map<String, Object> inputMap){
		return dao.selectListToPagging(inputMap);
	}

	@Override
	public List<TableVO> selectAllTable(Integer restaurantId) {
		return dao.selectList(restaurantId);
	}

	@Override
	public int updateTable(TableVO tableVO) {
		return dao.update(tableVO);
	}
	
	@Override
	public int updateUseTableStatus(TableVO tableVO) {
		return dao.updateIsUseTable(tableVO);
	}

	@Override
	public int inquiryTableNo(Integer tableId) {
		return dao.selectTableNo(tableId);
	}
	
	@Override
	public Integer getTableCount(Integer shopNo){
		return dao.selectTableCount(shopNo);
	}
	
}
