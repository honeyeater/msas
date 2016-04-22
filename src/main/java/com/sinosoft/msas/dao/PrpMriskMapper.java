package com.sinosoft.msas.dao;

import com.sinosoft.msas.domain.PrpMrisk;
import java.util.List;

public interface PrpMriskMapper {
    int deleteByPrimaryKey(String riskcode);

    int insert(PrpMrisk record);

    PrpMrisk selectByPrimaryKey(String riskcode);

    List<PrpMrisk> selectAll();

    int updateByPrimaryKey(PrpMrisk record);
}