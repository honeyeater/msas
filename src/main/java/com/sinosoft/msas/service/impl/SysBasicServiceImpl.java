package com.sinosoft.msas.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinosoft.msas.dao.PrpMclassMapper;
import com.sinosoft.msas.dao.PrpMcompanyMapper;
import com.sinosoft.msas.dao.PrpMriskMapper;
import com.sinosoft.msas.domain.PrpMclass;
import com.sinosoft.msas.domain.PrpMcompany;
import com.sinosoft.msas.domain.PrpMrisk;
import com.sinosoft.msas.model.mobile.BasicdataDto;
import com.sinosoft.msas.model.mobile.ClassDto;
import com.sinosoft.msas.model.mobile.CompanyDto;
import com.sinosoft.msas.model.mobile.RiskDto;
import com.sinosoft.msas.service.SysBasicService;

/**
 * 基础数据服务
 */
@Service
public class SysBasicServiceImpl implements SysBasicService {

	@Autowired
	private PrpMcompanyMapper prpMcompanyMapper;
	@Autowired
	private PrpMclassMapper prpMclassMapper;
	@Autowired
	private PrpMriskMapper prpMriskMapper;
	
	/**
	 * 查询基础同步数据
	 */
	@Override
	public BasicdataDto findAllBasicData() {
		BasicdataDto basicDataDto = new BasicdataDto();
		List<PrpMcompany> prpMcompanyList = prpMcompanyMapper.selectAll();
		List<PrpMclass> prpMclassList = prpMclassMapper.selectAll();
		List<PrpMrisk> prpMriskList = prpMriskMapper.selectAll();
		
		List<CompanyDto> companyDtos = new ArrayList<CompanyDto>();
		List<ClassDto> classDtos = new ArrayList<ClassDto>();
		List<RiskDto> riskDtos = new ArrayList<RiskDto>();
		// 数据转换
		for (PrpMcompany prpMcompany : prpMcompanyList) {
			CompanyDto companyDto = new CompanyDto();
			companyDto.setComcode(prpMcompany.getComcode());
			companyDto.setComCName(prpMcompany.getComcname());
			companyDto.setComLevel(String.valueOf(new BigDecimal(10).intValue()));
			companyDto.setComType(prpMcompany.getComtype());
			companyDto.setUpperComCode(prpMcompany.getUppercomcode());
			companyDto.setValidstatus(prpMcompany.getValiddate());
			companyDtos.add(companyDto);
		}
		for (PrpMclass prpMclass : prpMclassList) {
			ClassDto classDto = new ClassDto();
			classDto.setClassCode(prpMclass.getClasscode());
			classDto.setClassCName(prpMclass.getClasscname());
			classDto.setValidstatus(prpMclass.getValidind());
			classDtos.add(classDto);
		}
		for (PrpMrisk prpMrisk : prpMriskList) {
			RiskDto riskDto = new RiskDto();
			riskDto.setClassCode(prpMrisk.getClasscode());
			riskDto.setRiskCode(prpMrisk.getRiskcode());
			riskDto.setRiskCName(prpMrisk.getRiskcname());
			riskDto.setValidstatus(prpMrisk.getValidstatus());
		}
		
		basicDataDto.setCompanyDtoList(companyDtos);
		basicDataDto.setClassDtoList(classDtos);
		basicDataDto.setRiskDtoList(riskDtos);
		// 添加日志
		
		return basicDataDto;
	}

}
