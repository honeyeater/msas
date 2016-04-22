package com.sinosoft.msas.service;

import java.util.List;

import com.sinosoft.msas.domain.PrpMoperatelog;
import com.sinosoft.msas.domain.PrpMuser;
import com.sinosoft.msas.util.SystemServiceLog;

/**
 * 日志服务
 */
public interface LoggerService {

	public abstract List<PrpMoperatelog> findAllLog();
	
	@SystemServiceLog(description = "保存日志")
	public abstract void addLog(PrpMoperatelog operateLog);

	public abstract void update(PrpMoperatelog operateLog);

	public abstract PrpMoperatelog findByUserCode(String uuid);

	public abstract void delete(String uuid);

}