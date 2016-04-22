package com.sinosoft.msas.dao;

import com.sinosoft.msas.domain.PrpMuser;
import java.util.List;

public interface PrpMuserMapper {
    int deleteByPrimaryKey(String usercode);

    int insert(PrpMuser record);

    PrpMuser selectByPrimaryKey(String usercode);

    List<PrpMuser> selectAll();

    int updateByPrimaryKey(PrpMuser record);
}