package com.sinosoft.msas.service;

import com.sinosoft.msas.model.mobile.BasicdataDto;
import com.sinosoft.msas.util.SystemServiceLog;

/**
 * 基础数据服务
 */
public interface SysBasicService {

	@SystemServiceLog(description = "同步基础数据")
	public abstract BasicdataDto findAllBasicData();

}