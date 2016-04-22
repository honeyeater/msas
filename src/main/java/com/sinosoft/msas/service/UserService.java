package com.sinosoft.msas.service;

import java.util.List;

import com.sinosoft.msas.domain.PrpMuser;
import com.sinosoft.msas.util.SystemServiceLog;

/**
 * 
 *@Title:
 *@Description:
 *@Author:Administrator
 *@Since:2015-8-10 上午09:17:05
 *@Version:1.0.0
 *@Copyright (c) 中科软科技股份有限公司-版权所有
 */
public interface UserService {

	public abstract List<PrpMuser> findAllUser();
	
	public abstract void addUser(PrpMuser user);

	public abstract void update(PrpMuser user);

	@SystemServiceLog(description = "查询用户")
	public abstract PrpMuser findByUserCode(String userCode);

	public abstract void delete(String uuid);

}