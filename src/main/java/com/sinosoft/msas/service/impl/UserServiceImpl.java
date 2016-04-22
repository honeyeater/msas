package com.sinosoft.msas.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinosoft.msas.dao.PrpMuserMapper;
import com.sinosoft.msas.domain.PrpMuser;
import com.sinosoft.msas.service.UserService;

/**
 *@Title:
 *@Description:
 *@Author:Administrator
 *@Since:2015-8-10 上午09:28:24
 *@Version:1.0.0
 *@Copyright (c) 中科软科技股份有限公司-版权所有
 */
@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private PrpMuserMapper userDao;
	
	public List<PrpMuser> findAllUser(){
		return userDao.selectAll();
	}

	@Override
	public void addUser(PrpMuser user) {
		userDao.insert(user);
		//添加日志信息
	}

	@Override
	public void update(PrpMuser user) {
		userDao.updateByPrimaryKey(user);
		//添加日志信息
	}

	@Override
	public PrpMuser findByUserCode(String usercode) {
		return userDao.selectByPrimaryKey(usercode);
	}

	@Override
	public void delete(String usercode) {
		PrpMuser user = userDao.selectByPrimaryKey(usercode);
		userDao.deleteByPrimaryKey(user.getUsercode());
		//添加日志信息
	}


}
