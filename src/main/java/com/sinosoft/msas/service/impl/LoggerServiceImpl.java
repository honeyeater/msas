package com.sinosoft.msas.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinosoft.msas.dao.PrpMoperatelogMapper;
import com.sinosoft.msas.domain.PrpMoperatelog;
import com.sinosoft.msas.service.LoggerService;

/**
 * 日志服务
 */
@Service
public class LoggerServiceImpl implements LoggerService {

	@Autowired
	private PrpMoperatelogMapper prpMoperatelogMapper;
	
	@Override
	public List<PrpMoperatelog> findAllLog() {
		return prpMoperatelogMapper.selectAll();
	}

	@Override
	public void addLog(PrpMoperatelog operateLog) {
		prpMoperatelogMapper.insert(operateLog);
	}

	@Override
	public void update(PrpMoperatelog operateLog) {
		prpMoperatelogMapper.updateByPrimaryKey(operateLog);
	}

	@Override
	public PrpMoperatelog findByUserCode(String uuid) {
		return prpMoperatelogMapper.selectByPrimaryKey(uuid);
	}

	@Override
	public void delete(String uuid) {
		prpMoperatelogMapper.deleteByPrimaryKey(uuid);
	}
	

}
